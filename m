Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92389D767F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 18:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VuifK9ssbByZoxkDSJx5oYjnqJDuMVfVzL90tw7nJak=; b=HgJ1nZW6bWHtrpzA0ftPtEjo/W
	GQubfeIv5HvyE3anCtw41XyRJ09M04/1JVv1B1QP4gI5r9/fa13Isvg6QbKczTht3KKGjKtqs44NS
	oLhmQuFTGjt3LkeIApLUTFblIk3CXtAAN3sFJmoFtDw5lB6mj1YhAzR/KI3kRUjwNXmYh2K2CxEuL
	glHdQsAYCanrY+6bxUttPv6U3Pomb39y7WVRQWcpOZoRV8IwnQONJDbY3j8sb2S6ZQ7OLNcnmgA73
	fP+14dWv+tGrvE+nxUFQjH5Ho7anXc86RyS0pnCv+GRT/hZ+5be5QyCm5XYLG+3+otO2P9NC+nDAA
	fqNInWhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ZU0-00000004QzP-3JUi;
	Thu, 31 Oct 2024 18:01:20 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ZRj-00000004QZQ-3CZI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 17:59:01 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so10846925e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 10:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730397538; x=1731002338; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VuifK9ssbByZoxkDSJx5oYjnqJDuMVfVzL90tw7nJak=;
        b=J5/A2yqtGmXOkIbZ9PeY0atJZd/nSCwqbIM6N23eVkpFSD2sPnVxeUb6YOdLnoU7A6
         VpWDcyqzbrfUVudddg5YvHHbKUUnYLQUm9ScV2v3RroLrtX13BdA2R8hxyfS8sEL7jIk
         ckYLA0/Rq9A1clsRxxytb/VwB81uOU7B3Ol0ZHs/UopNpUGg/GcgxHTy/4N8EwYLCGLs
         oR2B7etHnVDPc8W4gYydikYfW8UcXhMWiipSJo/+8M7Ua2uwNapp6H7KT3Vn2WH+nT+Z
         QDjO5VBgipLGp38Y1huWKe5xUEnEgIKrnXaiVjrjLGvUs40Y/vCqq0yeReI7LsXaxAHW
         +22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730397538; x=1731002338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VuifK9ssbByZoxkDSJx5oYjnqJDuMVfVzL90tw7nJak=;
        b=fO1tA8UoF+fmgrLcyVcJ4b+Wha7BxmubuWw6UrOeRCWVGzRAMMx00o/mXynXxGlql6
         5gRv48mb9GgkfRFJ9T6zBB0mEDIaenFxnB+60NMVqVhs0pjKyqF0AaBWNUrbTEDGF8OI
         dG5UhXBdORZiqB7Jrjt/Hit3MPdIze6ZjY6S9eMCxYO7GtPu+pf+bwDPLJBbxnQtASBq
         Hh4zZnrz/5Bu/SJVKHvhTOuJECnOs5saS39qE0Bep3kyC+nToEP+/UxKqUQ7SXx68B51
         cAsfZFTT9Q0jkbfnEd2RfeC0cDTj6m/YjCaXhH8E3EMVjsnUJiSFrW+JCn2peu2aBzVz
         fVgQ==
X-Gm-Message-State: AOJu0Yx9NHWM83/0WkpXdugjPIeXCPxNWcaX8MbqBt6xJEMKuylwODCT
	FLpCQ21qNNikSBtAwCR3YNoN+UCu6xElcxiv/MAmWgxwWoFUF9tPvH4JZvkD+RM=
X-Google-Smtp-Source: AGHT+IHVFS3EEahXMmwf1uXc498PntDJFpAi99I26Hiqrk9r31i5G0llOXVhvkN/yJFqVWGq3yU2SA==
X-Received: by 2002:a05:6000:4013:b0:37d:4517:acdb with SMTP id ffacd0b85a97d-381be783511mr3580290f8f.20.1730397537669;
        Thu, 31 Oct 2024 10:58:57 -0700 (PDT)
Received: from [192.168.0.17] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c113e856sm2777954f8f.87.2024.10.31.10.58.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 10:58:57 -0700 (PDT)
Message-ID: <b3fb76d2-5433-438e-accb-f62fca130ab8@linaro.org>
Date: Thu, 31 Oct 2024 17:58:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] media: qcom: camss: Add support for camss driver
 on SC7280
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241030105347.2117034-1-quic_vikramsa@quicinc.com>
 <20241030105347.2117034-4-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241030105347.2117034-4-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_105859_843986_4C55B9A4 
X-CRM114-Status: GOOD (  22.09  )
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

On 30/10/2024 10:53, Vikram Sharma wrote:
> From: Suresh Vankadara <quic_svankada@quicinc.com>
> 
> Add support for the camss driver on the SC7280 SoC.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   .../media/platform/qcom/camss/camss-csid.c    |   1 -
>   .../qcom/camss/camss-csiphy-3ph-1-0.c         |   5 +
>   .../media/platform/qcom/camss/camss-csiphy.c  |   5 +
>   .../media/platform/qcom/camss/camss-csiphy.h  |   1 +
>   drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
>   drivers/media/platform/qcom/camss/camss.c     | 339 ++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h     |   1 +
>   7 files changed, 353 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index 858db5d4ca75..8d3dc26e2af4 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -1028,7 +1028,6 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
>   	csid->res->hw_ops->subdev_init(csid);
>   
>   	/* Memory */
> -

Extraneous deletion.

>   	if (camss->res->version == CAMSS_8250) {
>   		/* for titan 480, CSID registers are inside the VFE region,
>   		 * between the VFE "top" and "bus" registers. this requires
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 7d2490c9de01..f341f7b7fd8a 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -505,6 +505,10 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
>   	u32 val;
>   
>   	switch (csiphy->camss->res->version) {
> +	case CAMSS_7280:
> +		r = &lane_regs_sm8250[0][0];
> +		array_size = ARRAY_SIZE(lane_regs_sm8250[0]);
> +		break;
>   	case CAMSS_8250:
>   		r = &lane_regs_sm8250[0][0];
>   		array_size = ARRAY_SIZE(lane_regs_sm8250[0]);
> @@ -557,6 +561,7 @@ static bool csiphy_is_gen2(u32 version)
>   	bool ret = false;
>   
>   	switch (version) {
> +	case CAMSS_7280:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
>   	case CAMSS_845:
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 68a3ea1ba2a5..9722cee4143f 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -108,6 +108,11 @@ const struct csiphy_formats csiphy_formats_sdm845 = {
>   	.formats = formats_sdm845
>   };
>   
> +const struct csiphy_formats csiphy_formats_sc7280 = {
> +	.nformats = ARRAY_SIZE(formats_sdm845),
> +	.formats = formats_sdm845
> +};
> +
>   /*
>    * csiphy_get_bpp - map media bus format to bits per pixel
>    * @formats: supported media bus formats array
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
> index eebc1ff1cfab..67a96ef55bb6 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -112,6 +112,7 @@ void msm_csiphy_unregister_entity(struct csiphy_device *csiphy);
>   extern const struct csiphy_formats csiphy_formats_8x16;
>   extern const struct csiphy_formats csiphy_formats_8x96;
>   extern const struct csiphy_formats csiphy_formats_sdm845;
> +extern const struct csiphy_formats csiphy_formats_sc7280;
>   
>   extern const struct csiphy_hw_ops csiphy_ops_2ph_1_0;
>   extern const struct csiphy_hw_ops csiphy_ops_3ph_1_0;
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index ffcb1e2ec417..61f6815a3756 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -334,6 +334,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   		}
>   		break;
>   	case CAMSS_660:
> +	case CAMSS_7280:
>   	case CAMSS_8x96:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
> @@ -1692,6 +1693,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
>   	int ret = 8;
>   
>   	switch (vfe->camss->res->version) {
> +	case CAMSS_7280:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
>   	case CAMSS_845:
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index e8cd8afe7bee..addaed8f77cb 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1480,6 +1480,330 @@ static const struct resources_icc icc_res_sc8280xp[] = {
>   	},
>   };
>   
> +static const struct camss_subdev_resources csiphy_res_7280[] = {
> +	/* CSIPHY0 */
> +	{
> +		.regulators = {},
> +		.clock = { "csiphy0", "csiphy0_timer"},
> +		.clock_rate = {
> +			{ 300000000 },
> +			{ 300000000 }
> +		},
> +		.reg = { "csiphy0" },
> +		.interrupt = { "csiphy0" },
> +		.csiphy = {
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sc7280
> +		}
> +	},
> +	/* CSIPHY1 */
> +	{
> +		.regulators = {},
> +		.clock = { "csiphy1", "csiphy1_timer"},
> +		.clock_rate = {
> +			{ 300000000 },
> +			{ 300000000 }
> +		},
> +		.reg = { "csiphy1" },
> +		.interrupt = { "csiphy1" },
> +		.csiphy = {
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sc7280
> +		}
> +	},
> +	/* CSIPHY2 */
> +	{
> +		.regulators = {},
> +		.clock = { "csiphy2", "csiphy2_timer"},
> +		.clock_rate = {
> +			{ 300000000 },
> +			{ 300000000 }
> +		},
> +		.reg = { "csiphy2" },
> +		.interrupt = { "csiphy2" },
> +		.csiphy = {
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sc7280
> +		}
> +	},
> +	/* CSIPHY3 */
> +	{
> +		.regulators = {},
> +		.clock = { "csiphy3", "csiphy3_timer"},
> +		.clock_rate = {
> +			{ 300000000 },
> +			{ 300000000 }
> +		},
> +		.reg = { "csiphy3" },
> +		.interrupt = { "csiphy3" },
> +		.csiphy = {
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sc7280
> +		}
> +	},
> +	/* CSIPHY4 */
> +	{
> +		.regulators = {},
> +		.clock = { "csiphy4", "csiphy4_timer"},
> +		.clock_rate = {
> +			{ 300000000 },
> +			{ 300000000 }
> +		},
> +		.reg = { "csiphy4" },
> +		.interrupt = { "csiphy4" },
> +		.csiphy = {
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sc7280
> +		}
> +	},
> +};
> +
> +static const struct camss_subdev_resources csid_res_7280[] = {
> +	/* CSID0 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },
> +
> +		.clock = { "csi0", "vfe0_cphy_rx", "vfe0", "soc_ahb"},

csi0 should probably be named vfe0_csid, same with the other csiX clocks 
here.

7280 is similar/derived from 8250 so the naming convention should be 
followed.

> +		.clock_rate = {
> +			{ 300000000, 0, 380000000, 0},
> +			{ 400000000, 0, 510000000, 0},
> +			{ 400000000, 0, 637000000, 0},
> +			{ 400000000, 0, 760000000, 0}
> +		},
> +
> +		.reg = { "csid0" },
> +		.interrupt = { "csid0" },
> +		.csid = {
> +			.is_lite = false,
> +			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID1 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },
> +
> +		.clock = { "csi1", "vfe1_cphy_rx", "vfe1", "soc_ahb"},
> +		.clock_rate = {
> +			{ 300000000, 0, 380000000, 0},
> +			{ 400000000, 0, 510000000, 0},
> +			{ 400000000, 0, 637000000, 0},
> +			{ 400000000, 0, 760000000, 0}
> +		},
> +
> +		.reg = { "csid1" },
> +		.interrupt = { "csid1" },
> +		.csid = {
> +			.is_lite = false,
> +			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID2 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },
> +
> +		.clock = { "csi2", "vfe2_cphy_rx", "vfe2", "soc_ahb"},
> +		.clock_rate = {
> +			{ 300000000, 0, 380000000, 0},
> +			{ 400000000, 0, 510000000, 0},
> +			{ 400000000, 0, 637000000, 0},
> +			{ 400000000, 0, 760000000, 0}
> +		},
> +
> +		.reg = { "csid2" },
> +		.interrupt = { "csid2" },
> +		.csid = {
> +			.is_lite = false,
> +			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID3 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },
> +
> +		.clock = { "csi3", "vfe0_lite_cphy_rx", "vfe0_lite", "soc_ahb"},

As with 8250 I'd expect "lite" to appear in the clock name

When fixed please add.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

