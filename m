Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDAF3CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 14:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tsdx6XpKJ5146//HGhFM49uedNC4Y6C5AOfMW3twc60=; b=EoVAhqRILZVLYuDiMwMV0/LzTu
	8puJEqIO/dieryb2Aq7DeBweyI90X0PvTaOUIkpEJWUvqBcphvCBNOo5oVbKFM/sqGpFoyXItmkah
	yuvjFSAbNmP8pIe/CbS3dmgeKTNbSZr2o/b8m/zXspIDfEVNC/MFNFNZEpvsSS1HkWmLZDVFWpkmQ
	/vyoGna8BsWwh8L0FD3uBTaPGvCahjPPacAeC7nHPtGdCiOgluObm272LeVVw/uwhnMS3Y6E9aK1X
	INctOve7F4B5so3tUY5ISjEb8W7tTDd0+GHWhUHn9x7OAF/+pUFwvFmBGsrsVJJKqksfenSYFccX2
	nvMKo5mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYfm-00000008MUd-3ddM;
	Mon, 25 Aug 2025 14:59:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqX6V-000000083xY-00Q8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 13:19:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C42A601F6;
	Mon, 25 Aug 2025 13:19:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC63BC4CEF4;
	Mon, 25 Aug 2025 13:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756127955;
	bh=AUjDLofzY5f8iZ5b2amlStNur/4+wlnYmlSNLlOo1hI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J+shQQpVp7SiwS90GuiWcyHC8sAAYQ7A79uvq88aR9snV5nVE7DhOxPWc45yDIMfm
	 FRy22gLCg18Pum3ZLrDlp+ZSZUwEREmFH4sBI6SR3/ps5cI/NLoyLqGm21X/QIwvAc
	 2QRkH3CYuXN/kBAi5UgKYwwhO81ygAyfu/gqDTRzytGW2xPj3D22IDPY9qhCI3PR/p
	 G5QnRpyAv/PT6mFQimvPranE8H/JLY0Qdjy+4mCr+AuymSDC87JHBzbNo93fS6JnYd
	 QJxLSCafcJZ+cEDxzr3T6bDDsShABTpJXLtiOF2fbjYJWyztUpmGhbLQ5hkM7SctE7
	 Kahbh8UlW8Pag==
From: Kees Cook <kees@kernel.org>
To: Russell King <linux@armlinux.org.uk>,
	Li Huafei <lihuafei1@huawei.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Linus Waleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: stacktrace: include asm/sections.h in asm/stacktrace.h
Date: Mon, 25 Aug 2025 06:19:08 -0700
Message-Id: <175612794578.1492825.5832281034488912097.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250807071902.4077714-1-arnd@kernel.org>
References: <20250807071902.4077714-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Thu, 07 Aug 2025 09:18:58 +0200, Arnd Bergmann wrote:
> The recent kstack erase changes appear to have uncovered an existing
> issue with a missing header inclusion:
> 
> In file included from drivers/misc/lkdtm/kstack_erase.c:12:
> In file included from include/linux/kstack_erase.h:16:
> arch/arm/include/asm/stacktrace.h:48:21: error: call to undeclared function 'in_entry_text'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>    48 |                 frame->ex_frame = in_entry_text(frame->pc);
>       |                                   ^
> 
> [...]

Applied to for-linus/hardening, thanks!

[1/1] ARM: stacktrace: include asm/sections.h in asm/stacktrace.h
      https://git.kernel.org/kees/c/f05995cc6d3b

Take care,

-- 
Kees Cook


