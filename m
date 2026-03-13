Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0611107BCDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 22:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wG4Mk7n9a3KJbym01Ex6ddbGHyReReOxJaeGp+QfjVw=; b=MbV8eYcug05POXtNwzIKtVlnti
	2dSrsVpu0Dz7fe0JubB8VF/0OihfeZA3zXxMbheML6Zy5OtjC2JOwNhNbnwgyeCpbMKQseMbuaqA7
	CD5St5WMVlSP12n2zFipPdzECUgjHXdkhGce6ge91TFS70XXZbVnCuh9Z/8s9C18HvzV0BHvJUlFP
	TsRotEhBkvnbi3PbFkFh2ALOiL6h947PHR+Bkhv9ibgdahPf/RxxruSMeu+n3QT026geoNh8xa9RY
	iYjbCeDALUC+xUdEWfughWSzHewf0/yeeBGuIyak9EXKFsUE+eNxRMSj0h+W/fnTnVs4VcYbILVKQ
	Ri8xc5Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1AhD-00000001FwU-04zx;
	Fri, 13 Mar 2026 22:09:27 +0000
Received: from 013.lax.mailroute.net ([199.89.1.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1AhA-00000001Fw6-3fkb;
	Fri, 13 Mar 2026 22:09:26 +0000
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4fXdtr3Yg6zlfgfG;
	Fri, 13 Mar 2026 22:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1773439748; x=1776031749; bh=wG4Mk7n9a3KJbym01Ex6ddbG
	HyReReOxJaeGp+QfjVw=; b=EiiSUDggAbDN741zNUtPvkEmiBs/8fU8NAHvA866
	Ekt0EPS3Ao28nSSTI2CDvN9+h3oEgjXkCk+o27IN/DLDgr9yCo5AviQzOuMB91Jg
	otE1KqyTy9cT2OTbOZFlpT2rBkBjf9A/1lehnN+9N+OgI9PXTQkJ8S2GJVUpTwYh
	5FGccKmzXkV2Cypig5nfBEmliM4OMX1xv+a+PJcQ3A34A4LGJkSYQF+p69yKL7ra
	5m1Lnded5H/dE+vXk3yTXi/yKgnyXB/TrTZa1MCBoV3pnqSuXSwLvLIQCeRxiPaz
	wkKKsbdVqf9WElcmlwydUzcTCGZIeox4j51vE4sY4meYbA==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id rvzoD7aQMck2; Fri, 13 Mar 2026 22:09:08 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4fXdtQ5jBczlfl7l;
	Fri, 13 Mar 2026 22:09:02 +0000 (UTC)
Message-ID: <fff6bc07-169b-48aa-a6c2-0d243bad0d82@acm.org>
Date: Fri, 13 Mar 2026 15:09:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] scsi: ufs: core: Introduce a new ufshcd vops
 negotiate_pwr_mode()
To: Can Guo <can.guo@oss.qualcomm.com>, avri.altman@wdc.com,
 beanhuo@micron.com, martin.petersen@oracle.com, mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
 Ajay Neeli <ajay.neeli@amd.com>, Peter Griffin <peter.griffin@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Peter Wang <peter.wang@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Stanley Jhu <chu.stanley@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Archana Patni <archana.patni@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-samsung-soc@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>,
 "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>
References: <20260308151409.3779137-1-can.guo@oss.qualcomm.com>
 <20260308151409.3779137-2-can.guo@oss.qualcomm.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260308151409.3779137-2-can.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_150924_936119_9F88A7CD 
X-CRM114-Status: GOOD (  14.02  )
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

On 3/8/26 8:13 AM, Can Guo wrote:
> +static int exynos_ufs_negotiate_pwr_mode(struct ufs_hba *hba,
> +					 const struct ufs_pa_layer_attr *dev_max_params,
> +					 struct ufs_pa_layer_attr *dev_req_params)
> +{
> +	struct ufs_host_params host_params;
> +	int ret;
> +
> +	if (!dev_req_params) {
> +		pr_err("%s: incoming dev_req_params is NULL\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	ufshcd_init_host_params(&host_params);
> +
> +	/* This driver only support symmetric gear setting e.g. hs_tx_gear == hs_rx_gear */
> +	host_params.hs_tx_gear = exynos_ufs_get_hs_gear(hba);
> +	host_params.hs_rx_gear = exynos_ufs_get_hs_gear(hba);
> +
> +	ret = ufshcd_negotiate_pwr_params(&host_params, dev_max_params, dev_req_params);
> +	if (ret)
> +		pr_err("%s: failed to determine capabilities\n", __func__);
> +
> +	return ret;
> +}

The dev_req_params test is not necessary since the UFS core never passes 
a NULL pointer as third argument, isn't it? I propose to remove the
dev_req_params test.

> +static int ufs_hisi_negotiate_pwr_mode(struct ufs_hba *hba,
> +				       const struct ufs_pa_layer_attr *dev_max_params,
> +				       struct ufs_pa_layer_attr *dev_req_params)
> +{
> +	struct ufs_host_params host_params;
> +	int ret;
> +
> +	if (!dev_req_params) {
> +		dev_err(hba->dev, "%s: incoming dev_req_params is NULL\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	ufs_hisi_set_dev_cap(&host_params);
> +	ret = ufshcd_negotiate_pwr_params(&host_params, dev_max_params, dev_req_params);
> +	if (ret)
> +		dev_err(hba->dev, "%s: failed to determine capabilities\n", __func__);
> +
> +	return ret;
> +}

Same comment here - please remove the dev_req_params test.

> +static int ufs_qcom_negotiate_pwr_mode(struct ufs_hba *hba,
> +				       const struct ufs_pa_layer_attr *dev_max_params,
> +				       struct ufs_pa_layer_attr *dev_req_params)
>   {
>   	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>   	struct ufs_host_params *host_params = &host->host_params;
> +	int ret;
> +
> +	if (!dev_req_params) {
> +		pr_err("%s: incoming dev_req_params is NULL\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	ret = ufshcd_negotiate_pwr_params(host_params, dev_max_params, dev_req_params);
> +	if (ret)
> +		dev_err(hba->dev, "%s: failed to determine capabilities\n", __func__);
> +
> +	return ret;
> +}

Also here, please remove the dev_req_params test.

Additionally, I see that identical "if (ret) dev_err(...)" code occurs
in the three callbacks shown above. Shouldn't that code be moved into
the only caller of these functions in the UFS core?

Thanks,

Bart.

