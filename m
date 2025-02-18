Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D739BC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 14:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Snr4aTwPNVubpRPAi57boRzJiWp/9Aa733cQpJ5lAo0=; b=K8wrqMKd2SaXOgWvnWR+lB5S5u
	u4U8c6n6bj0DJDh42F1JnP3Ue3vCkeIoz78Uw3jmeC9NMlrSlJhdrDGHIReO1lX9hHChRxBaj/qBV
	Tyvf53zwmcStUswFKzV2xGyPuCuEEbmk6CWSmfLL2nY5Cq5jdNCFEizuMAyLM1ZctdL4mEqGr9ylp
	NmBHqUmTyD6IHFTyfUw4O1wy2JlYG8jf1kisF7+Ir+vMTxqyPFkVqZ3X095cS9ZiSjTIBRbK8laIl
	b9GROMnJZdwXwykPpwGCIs9SFFFUJfPwY728oJcU8Pc2EN16WGGuZKB/xBtxTW8p2oGVIhKuLh4OT
	RjewxAMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkOHf-00000008RRX-3Tdc;
	Tue, 18 Feb 2025 14:09:11 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkOEP-00000008Qk7-1udM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 14:05:50 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51IE5bAm015825
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 18 Feb 2025 08:05:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739887537;
	bh=Snr4aTwPNVubpRPAi57boRzJiWp/9Aa733cQpJ5lAo0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=VnP7CDu5+QIT/IzJNAD7VWwuksmvy3XZP2vbumeuMUkxilk0rCvNswVTv1/H/INKR
	 0Wj+teBjpedt7EMRr5CO2UskNJnKeq/8zZvhgnE/lsAyc0NpUWXWHaC/u8nFSd0Nlz
	 z03rfbL1gQJPIu1JSivJt9iq1L272RZN/IwVGzFM=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51IE5bSh013691;
	Tue, 18 Feb 2025 08:05:37 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Feb 2025 08:05:37 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Feb 2025 08:05:37 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51IE5bZb079588;
	Tue, 18 Feb 2025 08:05:37 -0600
Date: Tue, 18 Feb 2025 08:05:37 -0600
From: Nishanth Menon <nm@ti.com>
To: Guillaume La Roque <glaroque@baylibre.com>
CC: Tero Kristo <kristo@kernel.org>, Andrew Davis <afd@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] firmware: config: ti-sci: Default set to ARCH_K3 for the
 ti sci driver
Message-ID: <20250218140537.wfagt3spwkcmc3uv@cushy>
References: <20250218-ti-firmware-v1-1-7a23aacfb9d3@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250218-ti-firmware-v1-1-7a23aacfb9d3@baylibre.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_060549_659060_0E9EC489 
X-CRM114-Status: GOOD (  20.18  )
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

On 13:57-20250218, Guillaume La Roque wrote:
> Defaulting the build to ARCH_K3 for the TI SCI driver.
> 
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
> Link to comment done on last serie [1] we come back on first version of
> series[2] to not use imply but set deps on ARCH_K3 in driver directly.
> An other patch will be sent to update Kconfig.platform when this patch
> is merged.

It would be good to expand the commit message providing the rationale
for this.

> 
> [1] https://lore.kernel.org/all/20250123-timodulemailboxsci-v4-1-b1a31b56f162@baylibre.com/
> [2] https://lore.kernel.org/all/20221122202245.449198-4-nfrayer@baylibre.com/
> ---
>  drivers/firmware/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index 9f35f69e0f9e..109abe063093 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -215,6 +215,7 @@ config SYSFB_SIMPLEFB
>  config TI_SCI_PROTOCOL
>  	tristate "TI System Control Interface (TISCI) Message Protocol"
>  	depends on TI_MESSAGE_MANAGER
> +	default ARCH_K3
>  	help
>  	  TI System Control Interface (TISCI) Message Protocol is used to manage
>  	  compute systems such as ARM, DSP etc with the system controller in
> 
> ---
> base-commit: 2408a807bfc3f738850ef5ad5e3fd59d66168996
> change-id: 20250218-ti-firmware-1b7c7f485e5a
> 
> Best regards,
> -- 
> Guillaume La Roque <glaroque@baylibre.com>
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

