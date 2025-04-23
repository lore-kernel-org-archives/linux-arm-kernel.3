Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C36C369D7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZz+57Qi+DWxfq1YA11jiF4Aj3sm8uct9O1mfq3SFUI=; b=Yzvx/+FunDbZ0V9IfR3AqLp3GL
	zjDAVNKuLy5IW6tEyswunbpUBz0KnVL6S2aU5iaAVA4BycLnevGdVAH+4NqYqeHNxnVkg4vYSBPvI
	oqpIp8lWVcL1FhRV7t8iRw03BpKnqPSH8uOaK8qnZ7FtUw7abkZL9Eyr9RvFzo7KSQGPyCJHvkIJg
	E1HCImNajhQWckm5qwBlO957dSvpiqY6yLQrPka3qRVK8IpSc81UT3xRWARqDCLKItKMyxyV7sIL6
	sT4CgFaEV/yVX9QgwvDpsuY5Q6SQnkyyEqwvXyM1nU9EBhfY7XHxEiHnnU8OQzcAU0K2H6RiVFr01
	eL/i9PeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e8u-0000000BOBf-0WnG;
	Wed, 23 Apr 2025 17:44:16 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7dAZ-0000000BAco-3L5f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 16:41:56 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1u7dAV-0006Bt-CI; Wed, 23 Apr 2025 18:41:51 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1u7dAU-001kTn-2z;
	Wed, 23 Apr 2025 18:41:50 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1u7dAU-00H6mz-2a;
	Wed, 23 Apr 2025 18:41:50 +0200
Date: Wed, 23 Apr 2025 18:41:50 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 3/3] soc: imx8m: Dump higher 64bits UID
Message-ID: <20250423164150.3pqytl5zqwfnsx7i@pengutronix.de>
References: <20250423-uid-128-v2-0-327c30fe59a9@nxp.com>
 <20250423-uid-128-v2-3-327c30fe59a9@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423-uid-128-v2-3-327c30fe59a9@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_094155_836283_BD45E76D 
X-CRM114-Status: GOOD (  21.52  )
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

On 25-04-23, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> i.MX8MP UID is actually 128bits and partitioned into two parts.
> The 1st 64bits are at 0x410 and 0x420, and 2nd 64bits are at 0xE00
> and 0xE10.
> 
> Dump the whole 128bits for i.MX8MP, by set soc_uid as an array with two
> u64.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/soc/imx/soc-imx8m.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
> index 2186f6ab3eddd6c9369c691c845b3b78acaabe23..04a1b60f2f2b52cc374714f9a1205496c1762f39 100644
> --- a/drivers/soc/imx/soc-imx8m.c
> +++ b/drivers/soc/imx/soc-imx8m.c
> @@ -24,6 +24,7 @@
>  #define OCOTP_UID_HIGH			0x420
>  
>  #define IMX8MP_OCOTP_UID_OFFSET		0x10
> +#define IMX8MP_OCOTP_UID_HIGH		0xE00
>  
>  /* Same as ANADIG_DIGPROG_IMX7D */
>  #define ANADIG_DIGPROG_IMX8MM	0x800
> @@ -96,9 +97,13 @@ static int imx8mp_soc_uid(struct platform_device *pdev, u64 *socuid)
>  	struct imx8_soc_drvdata *drvdata = platform_get_drvdata(pdev);
>  	void __iomem *ocotp_base = drvdata->ocotp_base;
>  
> -	*socuid = readl_relaxed(ocotp_base + OCOTP_UID_HIGH + IMX8MP_OCOTP_UID_OFFSET);
> -	*socuid <<= 32;
> -	*socuid |= readl_relaxed(ocotp_base + OCOTP_UID_LOW + IMX8MP_OCOTP_UID_OFFSET);
> +	socuid[0] = readl_relaxed(ocotp_base + OCOTP_UID_HIGH + IMX8MP_OCOTP_UID_OFFSET);
> +	socuid[0] <<= 32;
> +	socuid[0] |= readl_relaxed(ocotp_base + OCOTP_UID_LOW + IMX8MP_OCOTP_UID_OFFSET);
						^
Nit: while on it, we can add a IMX8MP_OCOTP_UID_LOW define.

With or without the change, the patch lgtm.

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>


> +
> +	socuid[1] = readl_relaxed(ocotp_base + IMX8MP_OCOTP_UID_HIGH + 0x10);
> +	socuid[1] <<= 32;
> +	socuid[1] |= readl_relaxed(ocotp_base + IMX8MP_OCOTP_UID_HIGH);
>  
>  	return 0;
>  }
> @@ -220,7 +225,7 @@ static int imx8m_soc_probe(struct platform_device *pdev)
>  	const struct of_device_id *id;
>  	struct soc_device *soc_dev;
>  	u32 soc_rev = 0;
> -	u64 soc_uid = 0;
> +	u64 soc_uid[2] = {0, 0};
>  	int ret;
>  
>  	soc_dev_attr = devm_kzalloc(dev, sizeof(*soc_dev_attr), GFP_KERNEL);
> @@ -258,7 +263,7 @@ static int imx8m_soc_probe(struct platform_device *pdev)
>  			}
>  		}
>  		if (data->soc_uid) {
> -			ret = data->soc_uid(pdev, &soc_uid);
> +			ret = data->soc_uid(pdev, soc_uid);
>  			if (ret) {
>  				imx8m_soc_unprepare(pdev);
>  				return ret;
> @@ -271,7 +276,12 @@ static int imx8m_soc_probe(struct platform_device *pdev)
>  	if (!soc_dev_attr->revision)
>  		return -ENOMEM;
>  
> -	soc_dev_attr->serial_number = devm_kasprintf(dev, GFP_KERNEL, "%016llX", soc_uid);
> +	if (soc_uid[1])
> +		soc_dev_attr->serial_number = devm_kasprintf(dev, GFP_KERNEL, "%016llX%016llX",
> +							     soc_uid[1], soc_uid[0]);
> +	else
> +		soc_dev_attr->serial_number = devm_kasprintf(dev, GFP_KERNEL, "%016llX",
> +							     soc_uid[0]);
>  	if (!soc_dev_attr->serial_number)
>  		return -ENOMEM;
>  
> 
> -- 
> 2.37.1
> 
> 

