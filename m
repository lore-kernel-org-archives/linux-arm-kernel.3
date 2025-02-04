Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C29C02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 13:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zMuvQMCDX7iCw8EeUswImF/iKxK+AAexRtTa6PX69FY=; b=blMpisqR7icc/vcI2tpNUOhxBk
	JK7IpeJn+uZRHSVpgYaZ180/a9dNJV3gDB4ec/pYCGtk9I9fWT+Ejb2iQr3rSy03A9yCWcOXG6Yxc
	pngE+NhPVJ5NWHfwV0KPuCutXAvZAbt/IJTDXUufnH1R4msZ1Ng9iavw34TQdOuZ/ol7apSIfDqb+
	GDPxMYxcy4gMhrvcJb3b26jHALL1ofu/IIVTs/b3EDOA0c4WU5TsLDyAuzZEoULjwh3hy9pK8CYJc
	UD2Iddj1Ypvg9s18KlohUsra42Xa2mAWBzfTy7mQI5MPVCPTZ4s9zKBmTfaS9pUhBoC5GGNQRT6Zh
	BxOOyqkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfIi3-00000000V6v-3cbg;
	Tue, 04 Feb 2025 13:11:23 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfIfu-00000000UkJ-1ZfN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 13:09:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 43DF1A425E1;
	Tue,  4 Feb 2025 13:07:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3F3AC4CEDF;
	Tue,  4 Feb 2025 13:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738674549;
	bh=39RQg8HS35/eGoLQfsKobkdSZ/y04Po5ui1t62vU3js=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RfLPJRP5btz+iqCerLCKZgbnLWzm8uLt1R8TD+klb8CH2lrCDVqNcLanQjqyN+p96
	 x3drSw5N+FzPil6xYcHXtMdgplI/NpnwI6xlU3tYRfa6Nvjo4aEh1YRQkLeMMz21ci
	 deD9bi/SePRpuaFcWFYtEvNWo62kim7AyivoTVezw8XlIfsyx4UWis5GKLhg77Sa9y
	 bN96yXLZnrthok3oXzOB5lmPixRKN30q5rpIK20DIRmlvWFJTsJuFMI/hzxPA3pbPC
	 SnDKjgK0o+V0nqipAkJVExlaqErnRO0l4HHkwMTi1kXtaeWJkR22U1JTZx/gaQMggA
	 f4+rcnqDj+WYw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb+git@google.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] arm64: Fix 5-level paging support in kexec/hibernate trampoline
Date: Tue,  4 Feb 2025 13:09:01 +0000
Message-Id: <173866823801.3976632.9386486557160668789.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250110175145.785702-2-ardb+git@google.com>
References: <20250110175145.785702-2-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_050910_477867_CAEBCDBE 
X-CRM114-Status: UNSURE (   9.82  )
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

On Fri, 10 Jan 2025 18:51:46 +0100, Ard Biesheuvel wrote:
> Add the missing code to allocate P4D level page tables when cloning the
> the kernel page tables. This fixes a crash that may be observed when
> attempting to resume from hibernation on an LPA2 capable system with 4k
> pages, which therefore uses 5 levels of paging.
> 
> Presumably, kexec is equally affected.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: Fix 5-level paging support in kexec/hibernate trampoline
      https://git.kernel.org/arm64/c/3648027de1fa

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

