Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1C3C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 11:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G3eBoRI6ajKzQj7PIYgoVul0HEV9Bq6GwjJIxWdrMvs=; b=1mnX427dm070FSyQ0pyDkQbOdG
	b03kXmr/NFm7kdUmFg9h2sMsLB9ucZ+KqSSpkAmvjLDufAR0I0gm1QC/KgQqQpuBv8BjtJXCCdU2O
	H6cqjS4qubpeptX4dmSrmrEp/j8Hoka/aZOxw9fFE4zIkH1vT1Rq+PgScpteU3KZFW5zmKQug3Kwb
	MS/YDgKNnmnYqMdEqVgmIpW3urTkXbb+3m+gvyJNe8jwvXIAXa5hVdKmavAHPZiB1NWRGcnDKGGGF
	ldOoT1qhGo12S6lH1T4m+9ug6wtgZkxFb7uxub+yMDTQ/+tygVgwuxQJQQr2e2d84XxB30cwsdNyy
	WVs3peCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQTx-00000003h6c-2kQs;
	Fri, 23 May 2025 11:22:33 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQRn-00000003grG-0ftT;
	Fri, 23 May 2025 11:20:20 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54NBJc1K2086996;
	Fri, 23 May 2025 06:19:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747999178;
	bh=G3eBoRI6ajKzQj7PIYgoVul0HEV9Bq6GwjJIxWdrMvs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=pGrh4cl5UNwlzQb/0t74988xZoSrBH7x4348QMBKDmfEIEnMxH8v3P122scZKOLoq
	 WcvICifTw0IpvVBp7SlgqxN1dmooOa4XIXH6VEXHmwzZMIPuwOd/B/40p6zsECZIL9
	 nKV7oX048/6bbOEblbgcqX9fFjhONqR8xG9NOzpE=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54NBJcAC023157
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 23 May 2025 06:19:38 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 23
 May 2025 06:19:37 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 23 May 2025 06:19:37 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54NBJblW1172257;
	Fri, 23 May 2025 06:19:37 -0500
Date: Fri, 23 May 2025 06:19:37 -0500
From: Nishanth Menon <nm@ti.com>
To: Kees Cook <kees@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner
	<tglx@linutronix.de>,
        Santosh Shilimkar <ssantosh@kernel.org>, Lee Jones
	<lee@kernel.org>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        <linux-arm-kernel@lists.infradead.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Christoph Hellwig
	<hch@lst.de>, Marco Elver <elver@google.com>,
        Andrey Konovalov
	<andreyknvl@gmail.com>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Ard
 Biesheuvel <ardb@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan
 Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas.schier@linux.dev>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling
	<morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, <linux-kernel@vger.kernel.org>,
        <x86@kernel.org>, <kasan-dev@googlegroups.com>,
        <linux-doc@vger.kernel.org>, <kvmarm@lists.linux.dev>,
        <linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>,
        <linux-efi@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <linux-kbuild@vger.kernel.org>,
        <linux-security-module@vger.kernel.org>,
        <linux-kselftest@vger.kernel.org>, <sparclinux@vger.kernel.org>,
        <llvm@lists.linux.dev>
Subject: Re: [PATCH v2 05/14] arm: Handle KCOV __init vs inline mismatches
Message-ID: <20250523111937.f2fqhoshqevdoxcl@snowbird>
References: <20250523043251.it.550-kees@kernel.org>
 <20250523043935.2009972-5-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250523043935.2009972-5-kees@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_042019_289101_505C0560 
X-CRM114-Status: GOOD (  14.65  )
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

On 21:39-20250522, Kees Cook wrote:
> When KCOV is enabled all functions get instrumented, unless
> the __no_sanitize_coverage attribute is used. To prepare for
> __no_sanitize_coverage being applied to __init functions, we have to
> handle differences in how GCC's inline optimizations get resolved. For
> arm this exposed several places where __init annotations were missing
> but ended up being "accidentally correct". Fix these cases and force
> several functions to be inline with __always_inline.
> 
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
[...]
> diff --git a/drivers/soc/ti/pm33xx.c b/drivers/soc/ti/pm33xx.c
> index dfdff186c805..dc52a2197d24 100644
> --- a/drivers/soc/ti/pm33xx.c
> +++ b/drivers/soc/ti/pm33xx.c
> @@ -145,7 +145,7 @@ static int am33xx_do_sram_idle(u32 wfi_flags)
>  	return pm_ops->cpu_suspend(am33xx_do_wfi_sram, wfi_flags);
>  }
>  
> -static int __init am43xx_map_gic(void)
> +static int am43xx_map_gic(void)
>  {
>  	gic_dist_base = ioremap(AM43XX_GIC_DIST_BASE, SZ_4K);
>  
> -- 
> 2.34.1
> 
Acked-by: Nishanth Menon <nm@ti.com>
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

