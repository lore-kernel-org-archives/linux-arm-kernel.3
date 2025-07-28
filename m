Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60735C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 14:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYwhbY7Hecbk1qZCl4MdGthfDHIANrmSUOeNszZY1sQ=; b=oWrRKFXS4+NfZrJuzpus5tUEzs
	1seedvM2gjDN6wg9VIBBdUBbYLlgtW3fwxm1DqmdMSjWcGGN8BX2wcxzsfzv0OFF6Cpq0+AMMEvD3
	6pg25hBKhQbDW9HJPw61/UFz+XGyC/R3jNqPBax3H2TCGuc0XwPJiajUXy1GRH4OdG4PG103llFhW
	7vQQlqLoH94/8RP3lyNNOzw80WXi5DptqFLY121miUmOyipFrvwkIMAHj1D8i7ugNAmUwdt7nKFFV
	0d/iUX+NPZYdfqk8hHhrh09+CW4cgqRV50gUVBOfNZJqspb6KCYXBDeCnms6k0s5+RK7Z8HWyQ/3s
	NxFn0oFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOkZ-0000000EfEi-1YfS;
	Mon, 28 Jul 2025 14:22:47 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOcw-0000000EdkH-1QBK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 14:14:55 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-61530559887so1895481a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 07:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753712093; x=1754316893; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UYwhbY7Hecbk1qZCl4MdGthfDHIANrmSUOeNszZY1sQ=;
        b=CCYQUl2+/CQUbztXwOkSA0Y0jTEYOrg8F37Zo+IUBTPROdxIXJcJxA5Zlg0/YQoD4J
         ysBbO/nQyV7WWcNDEDopY2WoHham5zijXQBVx55l+HZhBaFTVhRv9o6OIyTgtOtsN4A7
         pIusyibyfXQKfhhBU2l+I4NNaJ7572XenF/YuDdwqe31PH/RALPBQhjJJUlTtTK3sQoY
         Ig9HN3W4umM7cEFAm1mcen5doZTEryTNS0dRcmsuO3JT0aaqeerkAUkoGF0wMaA0GY2D
         hXced1tjBdBwEDOYfHQlJh5QKFO8p0U6I3Fvcl6XXL3tGPhbLivR3sYTCRN3n8Ecx6aM
         n+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753712093; x=1754316893;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UYwhbY7Hecbk1qZCl4MdGthfDHIANrmSUOeNszZY1sQ=;
        b=TEop1BcF5rz4Od/w52HM2tsVePbEMtUyV3cgOpVKIU0WK+pxct/R9vpXwGm+6WVXjb
         IgO2Nnj9ZUPJ2OybY/lB0aAgaQoBuhiNC4XSb+TPQvxRD/ZbOgxG7vLZuwapcl7a2eEx
         oJq77Ya1z3ZaSld4ygo+y2nF9qAQDq9zvWcFVQe3t/Pf+0ACCmm9V/+8gLopWhNLlfT4
         XjHTU8EoGLeBhhDRKbD+qRWJT3+Smq+wbmlcb82gRXtSetjEEIVhYn+JzeRY3ScdOpzl
         gACg/4csqtw+JS+JQscod2J1jdo7Qvewih+dsTipDfk9zSmxqnSxzVxoNUY5V2hLuIBo
         9X+A==
X-Gm-Message-State: AOJu0Ywj8CEDSTWBZ7EDKEbDSbAafpwBWnu9cU7rOpQSIZ65y4W6n+I1
	0A0GHOvRLX85KJvIYNWALp830Ys9apiIfSMQe57Z3otgj/brhfpiBpy6lDwbqIO5xrI=
X-Gm-Gg: ASbGnctJTPhEG36KpsGzIvgGhPjanXXVdQljLNfCatfr9A3kXOHaX2Eg8T0Xer7xZIa
	DYuH7hf9iQV3zxn3bnUaJT/ISYXww6UKwakq9sbZmCXVLkJlFWuyJBJJzgLM2OufJ1p5WdjtChz
	56pvKFSzmHVktDsiOW7azujOn6VYS+QQ2yMML1/RSet1LPSND2gIQsiAmyvl950TCGHqPAb8sNi
	5HbvdFk5KbqmMpBtwGMPs4g2+i6quuENhR+Mz3zrujirp2Nmx7xOj/rMNjex/HNCetz4mKwPFZE
	LajFwJBKO660ZmU9vfs3u54VHv/qboBNs9rHu/DMdz/DlV7czQEGXCca0FSfEIpgapzVWa4g5wc
	7RxC2y1OsUn4cPqTcGK9IWwzdWM9TI5mH8Vn+Da3mBuwIgCGrjV+yjopDkcG5jWk=
X-Google-Smtp-Source: AGHT+IEHbvVBOTBi2wL3XYw1pOYiWmJ+jSmXZDZm1vhRUWP5YTgClxOi158f8n7e9tR07uWDsbkdCg==
X-Received: by 2002:a05:6402:2807:b0:612:b0d9:3973 with SMTP id 4fb4d7f45d1cf-614f1def683mr12512939a12.27.1753712092482;
        Mon, 28 Jul 2025 07:14:52 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61500aed9b7sm3313488a12.65.2025.07.28.07.14.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 07:14:52 -0700 (PDT)
Message-ID: <a0c910f2-3c7b-4740-b16b-f1efced107db@linaro.org>
Date: Mon, 28 Jul 2025 15:14:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] media: qcom: camss: enable vfe 690 for qcs8300
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250711131134.215382-1-quic_vikramsa@quicinc.com>
 <20250711131134.215382-6-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250711131134.215382-6-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_071454_385294_750F943F 
X-CRM114-Status: GOOD (  19.19  )
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

On 11/07/2025 14:11, Vikram Sharma wrote:
> The vfe in qcs8300 is version 690, it is same as vfe used in
> sa8775p. vfe gen3 have support for vfe 690.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   .../platform/qcom/camss/camss-vfe-gen3.c      |   4 +-
>   drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
>   drivers/media/platform/qcom/camss/camss.c     | 180 ++++++++++++++++++
>   3 files changed, 185 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen3.c b/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
> index a5eddc8c76ae..92ee7c7b8a47 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
> @@ -13,7 +13,9 @@
>   #include "camss-vfe.h"
>   
>   #define IS_VFE_690(vfe) \
> -	    (vfe->camss->res->version == CAMSS_8775P ? true : false)
> +	    ((vfe->camss->res->version == CAMSS_8775P) ||\
> +	    (vfe->camss->res->version == CAMSS_8300) ?\
> +	    true : false)
>   
>   #define BUS_REG_BASE_690 \
>   	    (vfe_is_lite(vfe) ? 0x480 : 0x400)
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 99cbe09343f2..1d40184d7d04 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -344,6 +344,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   	case CAMSS_8x96:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
> +	case CAMSS_8300:
>   	case CAMSS_845:
>   	case CAMSS_8550:
>   	case CAMSS_8775P:
> @@ -1974,6 +1975,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
>   	case CAMSS_7280:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
> +	case CAMSS_8300:
>   	case CAMSS_845:
>   	case CAMSS_8550:
>   	case CAMSS_8775P:
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index b0fd5fd307a1..abfaa489cc0c 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2623,6 +2623,186 @@ static const struct camss_subdev_resources csid_res_8300[] = {
>   	},
>   };
>   
> +static const struct camss_subdev_resources vfe_res_8300[] = {
> +	/* VFE0 */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_vfe0", "vfe0", "vfe0_fast_ahb",
> +			   "cpas_ahb", "gcc_axi_hf", "gcc_axi_sf",
> +			   "core_ahb", "cpas_fast_ahb_clk", "camnoc_axi",
> +			   "icp_ahb"},
> +		.clock_rate = {
> +			{ 0 },
> +			{ 480000000 },
> +			{ 300000000, 400000000 },
> +			{ 300000000, 400000000 },
> +			{ 0 },
> +			{ 0 },
> +			{ 0, 80000000 },
> +			{ 300000000, 400000000 },
> +			{ 400000000 },
> +			{ 0 },
> +		},
> +		.reg = { "vfe0" },
> +		.interrupt = { "vfe0" },
> +		.vfe = {
> +			.line_num = 3,
> +			.is_lite = false,
> +			.has_pd = false,
> +			.pd_name = NULL,
> +			.hw_ops = &vfe_ops_gen3,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE1 */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_vfe1", "vfe1", "vfe1_fast_ahb",
> +			   "cpas_ahb", "gcc_axi_hf", "gcc_axi_sf",
> +			   "core_ahb", "cpas_fast_ahb_clk", "camnoc_axi",
> +			   "icp_ahb"},
> +		.clock_rate = {
> +			{ 0 },
> +			{ 480000000 },
> +			{ 300000000, 400000000 },
> +			{ 300000000, 400000000 },
> +			{ 0 },
> +			{ 0 },
> +			{ 0, 80000000 },
> +			{ 300000000, 400000000 },
> +			{ 400000000 },
> +			{ 0 },
> +		},
> +		.reg = { "vfe1" },
> +		.interrupt = { "vfe1" },
> +		.vfe = {
> +			.line_num = 3,
> +			.is_lite = false,
> +			.has_pd = false,
> +			.pd_name = NULL,
> +			.hw_ops = &vfe_ops_gen3,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE2 (lite) */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 0, 0  },
> +			{ 300000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 480000000, 600000000, 600000000, 600000000 },
> +		},
> +		.reg = { "vfe_lite0" },
> +		.interrupt = { "vfe_lite0" },
> +		.vfe = {
> +			.line_num = 4,
> +			.is_lite = true,
> +			.hw_ops = &vfe_ops_gen3,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE3 (lite) */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 0, 0  },
> +			{ 300000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 480000000, 600000000, 600000000, 600000000 },
> +		},
> +		.reg = { "vfe_lite1" },
> +		.interrupt = { "vfe_lite1" },
> +		.vfe = {
> +			.line_num = 4,
> +			.is_lite = true,
> +			.hw_ops = &vfe_ops_gen3,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE4 (lite) */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 0, 0  },
> +			{ 300000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 480000000, 600000000, 600000000, 600000000 },
> +		},
> +		.reg = { "vfe_lite2" },
> +		.interrupt = { "vfe_lite2" },
> +		.vfe = {
> +			.line_num = 4,
> +			.is_lite = true,
> +			.hw_ops = &vfe_ops_gen3,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE5 (lite) */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 0, 0  },
> +			{ 300000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 480000000, 600000000, 600000000, 600000000 },
> +		},
> +		.reg = { "vfe_lite3" },
> +		.interrupt = { "vfe_lite3" },
> +		.vfe = {
> +			.line_num = 4,
> +			.is_lite = true,
> +			.hw_ops = &vfe_ops_gen3,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE6 (lite) */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 0, 0  },
> +			{ 300000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 480000000, 600000000, 600000000, 600000000 },
> +		},
> +		.reg = { "vfe_lite4" },
> +		.interrupt = { "vfe_lite4" },
> +		.vfe = {
> +			.line_num = 4,
> +			.is_lite = true,
> +			.hw_ops = &vfe_ops_gen3,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +};
> +
>   static const struct camss_subdev_resources csiphy_res_8775p[] = {
>   	/* CSIPHY0 */
>   	{

This generally looks fine. Please have a look at your pretty extensive 
list of clocks and decide if you really need all of them.

I'll trust you to come back with the appropriate list, perhaps even the 
list above.



