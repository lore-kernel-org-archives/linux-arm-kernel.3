Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9809D5D682
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 18:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bOZxboki6N2zRSqN2expjd8iCcy7bbXd8rTLLGbhSfU=; b=R4cOLDDeSAstwqjiJMXaM7MdPK
	nNdZy0vaRiCax0cWdGTNMT4MwcYs9PuyLg2g88plXKtTD6XHIWt38rk+w3c1IA0dR6yXRUKXHoSdM
	xhuZd6Gbdf5XxP3mWO+NmiGoZvzEv01/KuHBuS+cr8vDaBe2tCs6WbmmW4t1wJPio8HJLaCKoMP7w
	STPkDuruPPMHph10cb5kGb68CiGSOKxGR84s1Fh/SgHoQqrj8h4rwpuYlmUTx60LagkkyifSm3tZg
	BDoVFGkIkKmTraS2a/jotgEX33sXQ6vJethaOcorQ7mNP35/drEPQVEcNfAd//2W8mRZAX4OwMW9u
	XQWwPmjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t97VP-00000007y0W-3G9g;
	Thu, 07 Nov 2024 18:45:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t97Qy-00000007xDV-3EKv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 18:40:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 912935C4BC9;
	Thu,  7 Nov 2024 18:39:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D58AC4CECC;
	Thu,  7 Nov 2024 18:40:42 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Ingo Molnar <mingo@kernel.org>,
	Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: fix .data.rel.ro size assertion when CONFIG_LTO_CLANG
Date: Thu,  7 Nov 2024 18:40:39 +0000
Message-Id: <173100483729.985303.11178489688159304644.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241106161843.189927-1-masahiroy@kernel.org>
References: <20241106161843.189927-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_104044_873297_C3C6B2A5 
X-CRM114-Status: UNSURE (   9.00  )
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

On Thu, 07 Nov 2024 01:18:42 +0900, Masahiro Yamada wrote:
> Commit be2881824ae9 ("arm64/build: Assert for unwanted sections")
> introduced an assertion to ensure that the .data.rel.ro section does
> not exist.
> 
> However, this check does not work when CONFIG_LTO_CLANG is enabled,
> because .data.rel.ro matches the .data.[0-9a-zA-Z_]* pattern in the
> DATA_MAIN macro.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: fix .data.rel.ro size assertion when CONFIG_LTO_CLANG
      https://git.kernel.org/arm64/c/340fd66c8566

-- 
Catalin


