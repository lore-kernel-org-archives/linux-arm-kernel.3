Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 276EDE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 12:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RRWDlOKxLVuwJVGYAuhv6OinjNOexfNpidHLnXMBJ38=; b=1e3d6WJbTCLhbYxh+q+AzXXC/O
	7Nr5ihkI33YP3ZFRUZLTTqC8ua9UymOtltCaz6tLpRCb37RcTRLrz7f+dBu7yLDDLQhBMaMXqXyOu
	K0Nijpn4OabHwjFmAbLJBSp7SkQzGFf5bK9pCWNpz5pOEVf8qzHeg/yIhn5Sv3qXKjpCfT7ulXBEe
	t4Ua2utcQB2i23I6qQy3WV5tRkd0d9amhHak6in2XlgIkKa3Ztwld8RkpfHvRD3N5FmNWHpXMcYR6
	fCANHm6VjmSAnxOXQA2M9SDU2doX5nsuZVyPBZf3rLO1AevBnF284H87saDKaWllNETNWC9KwvyZt
	si4wL+3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTKbB-0000000ANj4-3dm4;
	Thu, 02 Jan 2025 12:46:49 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTKZ7-0000000ANNl-3O7H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 12:44:43 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 502CiELj1942282
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Jan 2025 06:44:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735821854;
	bh=RRWDlOKxLVuwJVGYAuhv6OinjNOexfNpidHLnXMBJ38=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=hRCAt15MiakTwmCEdJCB4d0sabE5p+gGpsYVXou5a1s3b1IRBXOgTQWnhg660drSk
	 Ru/PTQrEt8DxaNueoKagayv9f/C4BBTkygdqjsg+WkIcuIko6W7xeVuVbvAobPUq8u
	 3agJ1ChEQDmviYClrvLScq9zNkoJsZrTQroIpswU=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 502CiETn031291
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Jan 2025 06:44:14 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 Jan 2025 06:44:13 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 Jan 2025 06:44:13 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 502CiDK9064135;
	Thu, 2 Jan 2025 06:44:13 -0600
Date: Thu, 2 Jan 2025 06:44:13 -0600
From: Nishanth Menon <nm@ti.com>
To: Guillaume La Roque <glaroque@baylibre.com>, Marc Zyngier <maz@kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, Tero Kristo <kristo@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <vishalm@ti.com>, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        Kevin
 Hilman <khilman@baylibre.com>,
        Nicolas Frayer <nfrayer@baylibre.com>
Subject: Re: [PATCH v4 0/2] irqchip: Kconfig: Add module support for TI
 inta/intr
Message-ID: <20250102124413.wwbfzomjzedbqges@thinness>
References: <20241224-timodules-v4-0-c5e010f58e2c@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241224-timodules-v4-0-c5e010f58e2c@baylibre.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_044441_946023_F0F3CA33 
X-CRM114-Status: GOOD (  17.52  )
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

On 20:36-20241224, Guillaume La Roque wrote:
> Added module support for TI interrupt aggregator and interrupt router
> drivers. Default value for both drivers is ARCH_K3 and the interrupt
> aggregator depends on ARCH_K3 as it contains 64 bit only ops.
> Tested allmodconfig builds with ARCH=arm and ARCH=arm64.
> 
> Changes in v4:
> - Rework commit message and title
> - Add depends on in Kconfig frivers
> - Link to v3: https://lore.kernel.org/r/20241016-timodules-v3-0-fa71091ade98@baylibre.com
> 
> Changes in v3:
> - Add MODULE_LICENSE in drivers
> 
> Changes in v2:
> - Added depends on ARCH_K3 for the interrupt aggregator driver as it
>   uses
> 64 bit ops
> 
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
> Nicolas Frayer (2):
>       irqchip/ti-sci-intr: add module build support
>       irqchip/ti-sci-inta : Add module build support
> 
>  arch/arm64/Kconfig.platforms      | 2 --
>  drivers/irqchip/Kconfig           | 6 ++++--
>  drivers/irqchip/irq-ti-sci-inta.c | 1 +
>  drivers/irqchip/irq-ti-sci-intr.c | 1 +
>  4 files changed, 6 insertions(+), 4 deletions(-)
> ---
> base-commit: 8faabc041a001140564f718dabe37753e88b37fa
> change-id: 20241016-timodules-174770215dd8
> 
> Best regards,
> -- 
> Guillaume La Roque <glaroque@baylibre.com>
> 

Reviewed-by: Nishanth Menon <nm@ti.com>

Marc, Can this go via your tree?

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

