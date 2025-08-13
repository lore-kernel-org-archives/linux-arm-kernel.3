Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886C4CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 21:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PqmDry58z/oQCQIk+cJ1AKlAu2Ei2eYWgYuFg40UKS4=; b=I7qUK8svdpbRZzGGvYLFQVR15V
	hUH0zcX+s7hFqIJ1xqvRQAPXo6xHrsQL8ehrkX5BslxejYpVnRjePfi4HLZ/kfDrbZo1q/BomjQR6
	7eCe6G18d533yxTFdChPlxDm1DZplyzMUCIManFPP7IMEGqgD7Mwik+VFfjuxN99jb/Vs3opAjYAc
	JYVN1duqbXtHiObpyJuJQk2Avdnp66ho6eNkbHHsNTjInnjeJ/7SrDhHVHCfQ8Sp+/Sba8Oh4HVk/
	L9BSzXEPVIGtrYKGbqrOGCdJpk8KtwpLp/xLuDK9h//VIMjfZerJsZCA+c11jg0tXgPu0BhBb541V
	jMEjcqjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umIuT-0000000F0X1-3ngQ;
	Wed, 13 Aug 2025 21:21:25 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umIru-0000000F08W-1YqE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 21:18:47 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45a1b00f187so1040485e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 14:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755119924; x=1755724724; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PqmDry58z/oQCQIk+cJ1AKlAu2Ei2eYWgYuFg40UKS4=;
        b=ACgvDZNiHlDitk2lt5/RZH1KqORD930xSj+LITL1UnlE750zHAbKkLeqUZucqlavD0
         wEyxXEf5GjV5M55cXKMRB32lFYoD3sdI7NDsPccmTt3HJH1oCVn+56b9+CmysDeGEJel
         fRucV7hgKrKC6AT2gLYLL3QLQQK+kI4Bv8FWLzpsr0Y+Y8YzlofjGhRWfcLQXyOKRIif
         TxzN3E3MbkM62RKHtmZWAKkGODPzu8CezK88xzlIL/CyCS3tjSt6ZxJRx8zI6MTexfcG
         HaXeoRUAPtzujCSukmkKcEwcwh9TNdPSoSL+cFE+f34IoyxYwSAQtRE3uKKvoGuEmBSN
         Sa0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755119924; x=1755724724;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PqmDry58z/oQCQIk+cJ1AKlAu2Ei2eYWgYuFg40UKS4=;
        b=owgQgZN/j0yGeJ4gwmVuIzqJzTz0VEwyYLRrPkUzrFZtMEDft4a0e+HNVT5mZmYWT6
         juwDdCikm1NiiSX/pJW/23PT4smTo6wK8r2UORq4LKUiFxzVWiwGrJoFIXXxGkDwv8p3
         TgPaRvLNiw1JAo7YxnPtrmhhiyVdyW9fMreWCtObry2msx8UKknrFuJDvBlSzNMKOJm6
         VDzVXr8/gCN9NSi8ISROHfJXoC7E6tPdRVN2vc8d2TDwYGH01DK+lpHWlgnDlCSe02FR
         +I3SeXYw8Zy9WOB2E6UfSbAr4LgAXh6cDCLgnOvaKbj73k+2gnLGHaKGkfMP6+ZhwgOz
         XuGQ==
X-Gm-Message-State: AOJu0Yybo1Wnr1oBq1GMDlBmi16rey0/KFJFV81mMOLs6IyeQ9xVB7Af
	J0HrgPH/UwLyMB6YOZG3cyPbBRahP+ORV1Y66J+wj1SLErxRS/kE8HJEjLzuOkqSy50=
X-Gm-Gg: ASbGncsPlK2IMaA7FXB7wMd8sGNflu7xkpPKh2L/jgzbANxGVfGqPda+fb/9tUIBwlS
	vV74/WKElRf7iZm7h4257pGoh5rVMT/zCJ99XZfRbE4jRypYkiiwNFSY8NqKcKxH5tSZexruNUf
	rcxKth8rtGKsstg5jQAPKFmjsp/0uX0hLvdOmGLnWeGQ089PDljbYRPe3QWvPf+b8LseJd/Vu99
	5ZkCcAbaLARnHW2ynrvT2n5k9xzpEgXrlcMeu8UlFx0XKscdTorsm4SprRyh/wMEmJ+JQ+Mvrd5
	UAmAqw0qGhrh887tuQbc4niiuptwOf8DAeTft12h0k60pgHvP5/SV45QxD/3KzDPoDvCvu6pPNo
	bP6yT7IlR4JvCNGbbSz61RZh3F+xirZlZcI0hxl5ZbLRDKnnyMGkvdInMfSjfJId3
X-Google-Smtp-Source: AGHT+IGVcM00Y26FF+FPGURVp7bTF94M65Mkx8JUXqdBhigzdEAzBLNoXLhJsRfOkHHWGBlHaw1XQA==
X-Received: by 2002:a05:600c:b90:b0:458:bfe1:4a82 with SMTP id 5b1f17b1804b1-45a1b655872mr2584415e9.16.1755119924479;
        Wed, 13 Aug 2025 14:18:44 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1b789d68sm1106075e9.1.2025.08.13.14.18.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 14:18:44 -0700 (PDT)
Message-ID: <b69b884b-c257-4b72-80b0-3251306365ad@linaro.org>
Date: Wed, 13 Aug 2025 22:18:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/9] media: qcom: camss: Add support for CSID for
 sa8775p
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250807121105.710072-1-quic_vikramsa@quicinc.com>
 <20250807121105.710072-7-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250807121105.710072-7-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_141846_421689_000F37FA 
X-CRM114-Status: GOOD (  17.87  )
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

On 07/08/2025 13:11, Vikram Sharma wrote:
> The CSID in sa8775p is version 690, This csid is different from
> csid 780 w.r.t few bit-fields.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   .../platform/qcom/camss/camss-csid-gen3.c     |  27 +++-
>   drivers/media/platform/qcom/camss/camss.c     | 133 ++++++++++++++++++
>   2 files changed, 153 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> index 433908a54baa..fc6a9787febe 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -45,8 +45,11 @@
>   #define CSID_CSI2_RX_IRQ_CLEAR		0xA4
>   #define CSID_CSI2_RX_IRQ_SET		0xA8
>   
> +#define IS_CSID_690(csid)	(csid->camss->res->version == CAMSS_8775P)
>   #define CSID_BUF_DONE_IRQ_STATUS	0x8C
> -#define		BUF_DONE_IRQ_STATUS_RDI_OFFSET	(csid_is_lite(csid) ? 1 : 14)
> +#define BUF_DONE_IRQ_STATUS_RDI_OFFSET  (csid_is_lite(csid) ?\
> +						1 : (IS_CSID_690(csid) ?\
> +						13 : 14))
>   #define CSID_BUF_DONE_IRQ_MASK		0x90
>   #define CSID_BUF_DONE_IRQ_CLEAR		0x94
>   #define CSID_BUF_DONE_IRQ_SET		0x98
> @@ -59,6 +62,7 @@
>   
>   #define CSID_CSI2_RX_CFG0		0x200
>   #define		CSI2_RX_CFG0_NUM_ACTIVE_LANES	0
> +#define		CSI2_RX_CFG0_VC_MODE		3
>   #define		CSI2_RX_CFG0_DL0_INPUT_SEL	4
>   #define		CSI2_RX_CFG0_PHY_NUM_SEL	20
>   
> @@ -66,7 +70,9 @@
>   #define		CSI2_RX_CFG1_ECC_CORRECTION_EN	BIT(0)
>   #define		CSI2_RX_CFG1_VC_MODE		BIT(2)
>   
> -#define CSID_RDI_CFG0(rdi)		(0x500 + 0x100 * (rdi))
> +#define CSID_RDI_CFG0(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
> +					(0x300 + 0x100 * (rdi)) :\
> +					(0x500 + 0x100 * (rdi)))
>   #define		RDI_CFG0_TIMESTAMP_EN		BIT(6)
>   #define		RDI_CFG0_TIMESTAMP_STB_SEL	BIT(8)
>   #define		RDI_CFG0_DECODE_FORMAT		12
> @@ -75,10 +81,14 @@
>   #define		RDI_CFG0_DT_ID			27
>   #define		RDI_CFG0_EN			BIT(31)
>   
> -#define CSID_RDI_CTRL(rdi)		(0x504 + 0x100 * (rdi))
> +#define CSID_RDI_CTRL(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
> +					(0x304 + 0x100 * (rdi)) :\
> +					(0x504 + 0x100 * (rdi)))
>   #define		RDI_CTRL_START_CMD		BIT(0)
>   
> -#define CSID_RDI_CFG1(rdi)		(0x510 + 0x100 * (rdi))
> +#define CSID_RDI_CFG1(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
> +					(0x310 + 0x100 * (rdi)) :\
> +					(0x510 + 0x100 * (rdi)))
>   #define		RDI_CFG1_DROP_H_EN		BIT(5)
>   #define		RDI_CFG1_DROP_V_EN		BIT(6)
>   #define		RDI_CFG1_CROP_H_EN		BIT(7)
> @@ -86,9 +96,12 @@
>   #define		RDI_CFG1_PIX_STORE		BIT(10)
>   #define		RDI_CFG1_PACKING_FORMAT_MIPI	BIT(15)
>   
> -#define CSID_RDI_IRQ_SUBSAMPLE_PATTERN(rdi)	(0x548 + 0x100 * (rdi))
> -#define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi)	(0x54C + 0x100 * (rdi))
> -
> +#define CSID_RDI_IRQ_SUBSAMPLE_PATTERN(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
> +							(0x348 + 0x100 * (rdi)) :\
> +							(0x548 + 0x100 * (rdi)))
> +#define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
> +							(0x34C + 0x100 * (rdi)) :\
> +							(0x54C + 0x100 * (rdi)))
>   #define CSI2_RX_CFG0_PHY_SEL_BASE_IDX	1
>   
>   static void __csid_configure_rx(struct csid_device *csid,
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 4767d4e7c306..5f1e267045cb 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2554,6 +2554,139 @@ static const struct camss_subdev_resources csiphy_res_8775p[] = {
>   	},
>   };
>   
> +static const struct camss_subdev_resources csid_res_8775p[] = {
> +	/* CSID0 */
> +	{
> +		.regulators = {},
> +		.clock = { "csid", "csiphy_rx"},
> +		.clock_rate = {
> +			{ 400000000, 400000000},
> +			{ 400000000, 400000000}
> +		},
> +		.reg = { "csid0" },
> +		.interrupt = { "csid0" },
> +		.csid = {
> +			.is_lite = false,
> +			.hw_ops = &csid_ops_gen3,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID1 */
> +	{
> +		.regulators = {},
> +		.clock = { "csid", "csiphy_rx"},
> +		.clock_rate = {
> +			{ 400000000, 400000000},
> +			{ 400000000, 400000000}
> +		},
> +		.reg = { "csid1" },
> +		.interrupt = { "csid1" },
> +		.csid = {
> +			.is_lite = false,
> +			.hw_ops = &csid_ops_gen3,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +
> +	/* CSID2 (lite) */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 400000000, 400000000, 0},
> +			{ 0, 0, 400000000, 480000000, 0}
> +		},
> +		.reg = { "csid_lite0" },
> +		.interrupt = { "csid_lite0" },
> +		.csid = {
> +			.is_lite = true,
> +			.hw_ops = &csid_ops_gen3,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID3 (lite) */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 400000000, 400000000, 0},
> +			{ 0, 0, 400000000, 480000000, 0}
> +		},
> +		.reg = { "csid_lite1" },
> +		.interrupt = { "csid_lite1" },
> +		.csid = {
> +			.is_lite = true,
> +			.hw_ops = &csid_ops_gen3,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID4 (lite) */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 400000000, 400000000, 0},
> +			{ 0, 0, 400000000, 480000000, 0}
> +		},
> +		.reg = { "csid_lite2" },
> +		.interrupt = { "csid_lite2" },
> +		.csid = {
> +			.is_lite = true,
> +			.hw_ops = &csid_ops_gen3,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID5 (lite) */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 400000000, 400000000, 0},
> +			{ 0, 0, 400000000, 480000000, 0}
> +		},
> +		.reg = { "csid_lite3" },
> +		.interrupt = { "csid_lite3" },
> +		.csid = {
> +			.is_lite = true,
> +			.hw_ops = &csid_ops_gen3,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID6 (lite) */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 400000000, 400000000, 0},
> +			{ 0, 0, 400000000, 480000000, 0}
> +		},
> +		.reg = { "csid_lite4" },
> +		.interrupt = { "csid_lite4" },
> +		.csid = {
> +			.is_lite = true,
> +			.hw_ops = &csid_ops_gen3,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +};
> +
>   static const struct resources_icc icc_res_sa8775p[] = {
>   	{
>   		.name = "ahb",
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

