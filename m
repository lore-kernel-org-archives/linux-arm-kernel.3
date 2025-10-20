Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F20CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 15:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGiTe4HXDqqZ4iZipJXi8jfv7cy2lBX3+OM+ZyQ6XbI=; b=ePWOZmeKh9qBTxQBeT6Gb0ZTKZ
	pPNAx5E275oCQ/LWRm3S2M2ZM8vg0ZhGNEIwER1Ity1T+rjX5DwdoEsNMOKt4Zu2eIix28pB5Le+w
	6HaU/9AptI9CYzWSiclTuEImG4NYIYYlCJUFdH1f9RXCi+7OzkeFUAVYOcMAsJySWMR1QsNi2E5qf
	NUSccoxH8Kbd+R/ScZ1r06Hu1TmcHLrsQfyFXOhKftZt5xV2vVQ8oeoP3hbF6mrRCW8PmRYRZOBDo
	0cfSZ+1YwWDZ4w+RNeLYvrPVdjiim2v00yJj3LpuBNn5ZE6Lf8mvzk5OXMMBobcEQpmNFLx8P+co6
	BXvc3fRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAren-0000000E5xU-1Zlt;
	Mon, 20 Oct 2025 15:18:45 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vArek-0000000E5v2-0281
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 15:18:44 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-290deb0e643so30415285ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 08:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760973521; x=1761578321; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EGiTe4HXDqqZ4iZipJXi8jfv7cy2lBX3+OM+ZyQ6XbI=;
        b=Qxql199dJTpFw8Ub49D0iumJ/eYfUCIXmkvpC8tjlNY2VFBIhw+lbudhC196d1JUv8
         H49k9Lg/K/VbfIyC9PSUtpANHLqQ2zlIrMpxt4tBaIOKi037/l4T6qoD6xbxKAycJ5Ou
         7ZmE3CnlVP7sSGnPooRYAS+zOMUf3EOaeBRKbn+q2++TmITCyoFC29AnDinKUi9bipy2
         1Mwypx4Je5rYcfP26M5nlh/pX3TkMqptHpTjt0tqqwFGY6gUMLg2KvDWj3PMLPxq/9R0
         kQCg8ptu7B4paJ9wEgWenz3SjPXEjcaPvE1MvbLw1JtYoytkZdpL3RtUav/iDkMSFbpx
         YU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760973521; x=1761578321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGiTe4HXDqqZ4iZipJXi8jfv7cy2lBX3+OM+ZyQ6XbI=;
        b=DqW0o+kkIAroqHVYd6zOI3TBvc5V2FVEcZFUbh9y5LFqj7Jr5Rbpie+b4Na1bi3648
         0R59tOp2mAP6dAiZAI5ODVptLLW2Y7t31fGaDUfujgHEc5p/Fkh8TVnX9ZNE4eko8bJ7
         HLDhKmo5oCgII5wdX2mtwRiful4aaA0wfS7tCsBkk/9T5jZ1HhFl2M2oQntKFwLBUhaX
         DoGpfQRtxDpPDXvtxi9Vy8XNAm8xKeqkmvptJD0+8wTgInd6R7p6OeXjRDsUR2zbUr+2
         RyJY76d6h4ne4cmt8DyLeupdgviVKpfnqN6zAfMRiQAn7grDqRNuVV1zNBbD9pjCyG5B
         cu1w==
X-Forwarded-Encrypted: i=1; AJvYcCVSLJP963iCwkS/qpojPRgVrnKHavG7iiLTabeqz6w8J15QphelJwlciIS+0bSJaSKGrb78qV8Qh6JtOuRxGRZu@lists.infradead.org
X-Gm-Message-State: AOJu0Yy16Cz9LwsO2IM9tl82/IQ6MylU5++JsQIBQhuHBjeQJRDlYld9
	7Yx/UtXe+4Bz5zbfMfUCmsDKZcw649DZ0jzL4BxNJ23OrYnQ+MGrOhaIe8uhyAlyMWo=
X-Gm-Gg: ASbGnctM7ePswGNOfWkXylPhjP5q/RyiKE4sM+9ubkAhaUkFA5sCAuF5MaCLQ2eJeuV
	M1/g81qL+yLqvVMoXWKV0DCVXo/p8ci0Qno8+GdgOzwE0wVQOZfA5+mDo1IZMmkPp6j9D+xOlZR
	nyjjLB/0LNy9Xrv+8ATQDlmjd7gfe/ZSHtx0FYSmZWEjjjLXdppWKJru/O/mRgf3X0zFqsGerdv
	tVYwgNhNub4MOFnl4VYw1RNrhigowNm2ZvpiwrCY5yDso4wGXuhRMPdHO9tDut6bg9ytCOGFKEX
	u4KkEqDZs3miyH9zhIOAXfSOhaxQ8hEvM3lIEnazIbwA6YKP2S9ozFdx11pHEj9Fh6N19oyw3PC
	PoGi7U6tN57S8nMJ3pGla6RHHDRWLYVnt+g7Z7orgYhRpZKPb+m8ewyYEJ3bfYYPSqESpT6oUE9
	AgfseuQlRLufuUww==
X-Google-Smtp-Source: AGHT+IEZsyy7VgeyAy3dmy4J3fXKkw3RgKJZWu4jhzJnxWQDZQ+Dq+bopDMB+jrQP+4jBD/v93m2gA==
X-Received: by 2002:a17:903:35c6:b0:276:76e1:2e87 with SMTP id d9443c01a7336-290cb46c267mr168729135ad.44.1760973520734;
        Mon, 20 Oct 2025 08:18:40 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:2360:6c8a:189d:ae5a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471d5612sm82189935ad.65.2025.10.20.08.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 08:18:40 -0700 (PDT)
Date: Mon, 20 Oct 2025 09:18:37 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org, arnd@arndb.de, andersson@kernel.org,
	matthias.bgg@gmail.com, wenst@chromium.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2] remoteproc: mtk_scp: Construct FW path if
 firmware-name not present
Message-ID: <aPZSzbXDBar3_X9O@p14s>
References: <20251015084103.10737-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015084103.10737-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_081842_064209_16AACCF4 
X-CRM114-Status: GOOD (  38.56  )
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

On Wed, Oct 15, 2025 at 10:41:03AM +0200, AngeloGioacchino Del Regno wrote:
> After a reply on the mailing lists [1] it emerged that the DT
> property "firmware-name" should not be relied on because of
> possible issues with firmware versions.
> For MediaTek SCP, there has never been any firmware version vs
> driver version desync issue but, regardless, the firmwares are
> always using the same name and they're always located in a path
> with a specific pattern.
> 
> Instead of unconditionally always relying on the firmware-name
> devicetree property to get a path to the SCP FW file, drivers
> should construct a name based on what firmware it knows and
> what hardware it is running on.
> 
> In order to do that, add a `scp_get_default_fw_path()` function
> that constructs the path and filename based on two of the infos
> that the driver can get:
>  1. The compatible string with the highest priority (so, the
>     first one at index 0); and
>  2. The type of SCP HW - single-core or multi-core.
> 
> This means that the default firmware path is generated as:
>  - Single core SCP: mediatek/(soc_model)/scp.img
>    for example:     mediatek/mt8183/scp.img;
> 
>  - Multi core SCP:  mediatek/(soc_model)/scp_c(core_number).img
>    for example:     mediatek/mt8188/scp_c0.img for Core 0, and
>                     mediatek/mt8188/scp_c1.img for Core 1.
> 
> Note that the generated firmware path is being used only if the
> "firmware-name" devicetree property is not present in the SCP
> node or in the SCP Core node(s).
> 
> [1 - Reply regarding firmware-name property]
> Link: https://lore.kernel.org/all/7e8718b0-df78-44a6-a102-89529d6abcce@app.fastmail.com/
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> 
> Changes in v2:
>  - Removed initialization of scp_fw_file[7] char array (or string if you prefer)
> 
>  drivers/remoteproc/mtk_scp.c | 65 ++++++++++++++++++++++++++++++++----
>  1 file changed, 59 insertions(+), 6 deletions(-)
>

Applied.

Thanks,
Mathieu
 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 8206a1766481..10e3f9eb8cd2 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -16,6 +16,7 @@
>  #include <linux/remoteproc.h>
>  #include <linux/remoteproc/mtk_scp.h>
>  #include <linux/rpmsg/mtk_rpmsg.h>
> +#include <linux/string.h>
>  
>  #include "mtk_common.h"
>  #include "remoteproc_internal.h"
> @@ -1093,22 +1094,74 @@ static void scp_remove_rpmsg_subdev(struct mtk_scp *scp)
>  	}
>  }
>  
> +/**
> + * scp_get_default_fw_path() - Get default SCP firmware path
> + * @dev:     SCP Device
> + * @core_id: SCP Core number
> + *
> + * This function generates a path based on the following format:
> + *     mediatek/(soc_model)/scp(_cX).img; for multi-core or
> + *     mediatek/(soc_model)/scp.img for single core SCP HW
> + *
> + * Return: A devm allocated string containing the full path to
> + *         a SCP firmware or an error pointer
> + */
> +static const char *scp_get_default_fw_path(struct device *dev, int core_id)
> +{
> +	struct device_node *np = core_id < 0 ? dev->of_node : dev->parent->of_node;
> +	const char *compatible, *soc;
> +	char scp_fw_file[7];
> +	int ret;
> +
> +	/* Use only the first compatible string */
> +	ret = of_property_read_string_index(np, "compatible", 0, &compatible);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	/* If the compatible string's length is implausible bail out early */
> +	if (strlen(compatible) < strlen("mediatek,mtXXXX-scp"))
> +		return ERR_PTR(-EINVAL);
> +
> +	/* If the compatible string starts with "mediatek,mt" assume that it's ok */
> +	if (!str_has_prefix(compatible, "mediatek,mt"))
> +		return ERR_PTR(-EINVAL);
> +
> +	if (core_id >= 0)
> +		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);
> +	else
> +		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp");
> +	if (ret <= 0)
> +		return ERR_PTR(ret);
> +
> +	/* Not using strchr here, as strlen of a const gets optimized by compiler */
> +	soc = &compatible[strlen("mediatek,")];
> +
> +	return devm_kasprintf(dev, GFP_KERNEL, "mediatek/%.*s/%s.img",
> +			      (int)strlen("mtXXXX"), soc, scp_fw_file);
> +}
> +
>  static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
>  				      struct mtk_scp_of_cluster *scp_cluster,
> -				      const struct mtk_scp_of_data *of_data)
> +				      const struct mtk_scp_of_data *of_data,
> +				      int core_id)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev->of_node;
>  	struct mtk_scp *scp;
>  	struct rproc *rproc;
>  	struct resource *res;
> -	const char *fw_name = "scp.img";
> +	const char *fw_name;
>  	int ret, i;
>  	const struct mtk_scp_sizes_data *scp_sizes;
>  
>  	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
> -	if (ret < 0 && ret != -EINVAL)
> -		return ERR_PTR(ret);
> +	if (ret) {
> +		fw_name = scp_get_default_fw_path(dev, core_id);
> +		if (IS_ERR(fw_name)) {
> +			dev_err(dev, "Cannot get firmware path: %ld\n", PTR_ERR(fw_name));
> +			return ERR_CAST(fw_name);
> +		}
> +	}
>  
>  	rproc = devm_rproc_alloc(dev, np->name, &scp_ops, fw_name, sizeof(*scp));
>  	if (!rproc) {
> @@ -1212,7 +1265,7 @@ static int scp_add_single_core(struct platform_device *pdev,
>  	struct mtk_scp *scp;
>  	int ret;
>  
> -	scp = scp_rproc_init(pdev, scp_cluster, of_device_get_match_data(dev));
> +	scp = scp_rproc_init(pdev, scp_cluster, of_device_get_match_data(dev), -1);
>  	if (IS_ERR(scp))
>  		return PTR_ERR(scp);
>  
> @@ -1259,7 +1312,7 @@ static int scp_add_multi_core(struct platform_device *pdev,
>  			goto init_fail;
>  		}
>  
> -		scp = scp_rproc_init(cpdev, scp_cluster, cluster_of_data[core_id]);
> +		scp = scp_rproc_init(cpdev, scp_cluster, cluster_of_data[core_id], core_id);
>  		put_device(&cpdev->dev);
>  		if (IS_ERR(scp)) {
>  			ret = PTR_ERR(scp);
> -- 
> 2.51.0
> 

