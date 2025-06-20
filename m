Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005AEC71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 12:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p8aNnK8Y/ZPrle8/DSR83V84TDmN3Ari00yiDG9r/Mw=; b=ORQ8ZrjSjAqAvBkV0GJqQ9yY2k
	wB26l41rAnUJS0Ve+hgsYpDozdvEvIBfRX3SfE5Gfpvl+B5jErVIt8p4jvOQ7uc1VewJtyUha+9Jx
	bEwMHk/r6NWfDBDGRhkVF0GzkmMYY/Y1qu7+G/1SDGR7jHWXNlshT6WkaXjLePr+AqidX34A+yjDD
	3wV3tBg8sq+g54MHAN0RSkhD4VXRr9xXPPjIizCIwfTRMhL8A7fww6ZpuhT2rUBZuskq4zO7Q5ZOM
	i/2MFb3IGuI3Zis2w+k9mIXXV4l+/r/40VsN2/gSiEd5uSInyY/xonGoY8F/jmkBepNHmmRz7SbJ4
	tR5eRhBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbK5-0000000FcsX-0ibA;
	Fri, 20 Jun 2025 12:58:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSayB-0000000FaPB-1Qkh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 12:35:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B374644480;
	Fri, 20 Jun 2025 12:35:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96FC8C4CEE3;
	Fri, 20 Jun 2025 12:35:44 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Song Liu <song@kernel.org>,
	Dylan Hatch <dylanbhatch@google.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
Subject: Re: [PATCH v7] arm64/module: Use text-poke API for late relocations.
Date: Fri, 20 Jun 2025 13:35:41 +0100
Message-Id: <175042293849.3925078.10159804916524712470.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250603223417.3700218-1-dylanbhatch@google.com>
References: <20250603223417.3700218-1-dylanbhatch@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_053547_396937_644B46F3 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, 03 Jun 2025 22:34:17 +0000, Dylan Hatch wrote:
> To enable late module patching, livepatch modules need to be able to
> apply some of their relocations well after being loaded. In this
> scenario however, the livepatch module text and data is already RX-only,
> so special treatment is needed to make the late relocations possible. To
> do this, use the text-poking API for these late relocations.
> 
> This patch is partially based off commit 88fc078a7a8f6 ("x86/module: Use
> text_poke() for late relocations").
> 
> [...]

Applied to arm64 (for-next/livepatch), thanks!

[1/1] arm64/module: Use text-poke API for late relocations.
      https://git.kernel.org/arm64/c/91b89a634487

-- 
Catalin


