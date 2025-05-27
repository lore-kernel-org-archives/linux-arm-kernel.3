Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139BDC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 13:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OvCNdY/d8O5pn3OTu0PaNX5yZ1/mS9vSbWoEI1yq4PU=; b=gy1zqS53IRcpfa7+v6Ir3GG+UZ
	Vu+XUzHYI6Z++MRFZT9GILV7apIwPqMpHxsChBgIDipyEBaEf67A8i05xQF5Id2wBab1V03bBp+Qi
	JcuBa3IKmCh7OQSrbk72w+wI0A07XAUseNQ9+SPw1kSfCghLTnNuikpIB+p/tnzKcJBW6WPHSrRcb
	rV/TNL0YS855AQ+M4YrtbxiWU0tGNeH8/UYUNxKkUZedgoXWgBAqQrPwAZV+3A6d7X9pEaKTfA6ha
	RQwH1j/A2gHhEU3qR+mB/Vi1gA63w/UfFdz1U+6CqOm1JmUcRoUanl1+c5nHGsbtB1NlFt1CCkXPH
	4EWGY+GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJuR0-0000000Apgq-4607;
	Tue, 27 May 2025 13:33:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJu9S-0000000AnDc-0Hkn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 13:15:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 89C215C514F;
	Tue, 27 May 2025 13:13:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD8FFC4CEE9;
	Tue, 27 May 2025 13:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748351729;
	bh=6D54vByl5BJVj7Q5acyjMDCFnX+ZDlUCn2n+jBrJ18Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W23sI7XW7HJ4bRv/EKFKvnWoqni4NiXspbqA0f5IZ3Mw4rtBP2qPzGl0MPWDF6TiK
	 VOIlkSp/HF4PqJI5IFXn3CVZ+BbtECGfc20ZsqRGVnDoHzBiDhGwP8ffTMM/B8V6gs
	 xPbnEQ2UrOsjhJCOMtZHmYsreTu7uDr6A59qbTpCtQGKRydnOV2dBAgiWxI3JAG12s
	 uJgBS2qrOwMu0ZFc/jKhzc2O+2TTH0Wz5yclE/Snoy+ICowWIzRq+8SG6540cRvM+E
	 QKJjqEq7BBt1jO0h3ebDfoUGUKVSnvzkKEkVaeOSSyGSy/CIA1uYfJPINRuPtYBdZq
	 uyNMd2YjkmZxw==
Date: Tue, 27 May 2025 14:15:24 +0100
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>
Subject: Re: [PATCH] arm64: sysreg: Drag linux/kconfig.h to work around vdso
 build issue
Message-ID: <20250527131523.GA26734@willie-the-truck>
References: <20250523170208.530818-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523170208.530818-1-maz@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_061530_152002_38C2B726 
X-CRM114-Status: GOOD (  16.57  )
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

On Fri, May 23, 2025 at 06:02:08PM +0100, Marc Zyngier wrote:
> Broonie reports that fed55f49fad18 ("arm64: errata: Work around
> AmpereOne's erratum AC04_CPU_23") breaks one of the vdso selftests
> (vdso_test_chacha) as it indirectly drags asm/sysreg.h.
> 
> It is rather unfortunate (and worrying) that userspace gets built
> with non-UAPI headers. In any case, paper over the issue by dragging
> linux/kconfig.h in asm/sysreg.h. It is the right thing to do, at
> least from the kernel perspective.
> 
> Reported-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Fixes: fed55f49fad18 ("arm64: errata: Work around AmpereOne's erratum AC04_CPU_23")
> Link: https://lore.kernel.org/r/aDCDGZ-G-nCP3hJI@finisterre.sirena.org.uk
> Cc: D Scott Phillips <scott@os.amperecomputing.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/sysreg.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index cd853801a8f7b..f1bb0d10c39a3 100644
> --- a/arch/arm64/include/asm/sysreg.h
> +++ b/arch/arm64/include/asm/sysreg.h
> @@ -12,6 +12,7 @@
>  #include <linux/bits.h>
>  #include <linux/stringify.h>
>  #include <linux/kasan-tags.h>
> +#include <linux/kconfig.h>
>  
>  #include <asm/gpr-num.h>

Marc, it will be quickest for you to take this as you also took the
AC04_CPU_23 workaround:

Acked-by: Will Deacon <will@kernel.org>

Will

