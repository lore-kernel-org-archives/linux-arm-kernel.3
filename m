Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF93C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 21:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5cG3cbEW4nr0PnGSR/wXOBrvwNEWafTFeGX/LZex5Y=; b=gft7b/81W+AYfV9Xc+XWxUXGNN
	VHSb7Of96NUvXZHgmXkVO4DSKQon4pCerAOBWAH0NA0zdjEgAfwUbJ7EGUCWEmrgRGKrm2LJe1C3q
	wWhYe9b1MhN7RCVEYmRIe43U/ewO8jKXpoG6hAvl4Ui8PEje0Tg2Kst/b4PLzyhXX6HxIn2Ngz+FV
	gjLNTrr91EI6RpoEEGEWEWNfCRUNA5FNG+ZUU0FxhN/GyNulB6BEvNV+dWngPU5YyJGbSU6jJPr94
	MIHd1FbWplJYhlUyApz8dS+oIVXwqzfAzMe7w/QTRS8YTPSvcKK3/NzTbNfVcD5vfQL7sY8Qj7QPS
	6+GCWzBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJ8v-0000000F2ik-2rQ6;
	Wed, 13 Aug 2025 21:36:21 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJ4x-0000000F1tg-21Uv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 21:32:16 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45a1b097037so1281785e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 14:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755120734; x=1755725534; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j5cG3cbEW4nr0PnGSR/wXOBrvwNEWafTFeGX/LZex5Y=;
        b=Qcx9gV9sNSWMpLtSfRsRq3H5j0Wp/HSFiV4qyfg6xC8a9XcbhzQZFxTwOer/tvUwdZ
         vEmLc6KsADM7Jwl+8IK9kOAMCQozJDd5tw1NBCA3JwxM05d2KbPdvQX3nq3y3D3XNPEI
         sj8aVpq2TyY7rOz8lMJcfdOqsghhz15d5XPIt0H2GzQYDw15wuL7AZ2uSLX6BH83u9eD
         e0vgOtxJrgj8Is3I2Ag7h6jh0Bqwzowo1dM9vZ0OGutFE3y4IfgF7v3oXGZ/YXYPMDgA
         9vphapUCKNOCq0VfayiHSbgJMxeMpCvRjc3HeMvGA4DO7oCMtaa4d4W0dFs16Kd1exsT
         CWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755120734; x=1755725534;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j5cG3cbEW4nr0PnGSR/wXOBrvwNEWafTFeGX/LZex5Y=;
        b=a3XV6EL6+aHccN6ryZqDkUFlMlqOoIywy5yeqAiuN1aVxKfNW0RViWXhOajgQXZxYY
         u+GRl2RLiUMbDkugJtpBGyo9JGWQ5Z3Z8dxeDRAXYmNTenYZ72dpI1CS6oquMdMyF4Ii
         Wcj9I6hl+YUUrKU30gsys+GBNY/iSTh+X4tzLznsnssIE0vbaOPUhtAiUn3+cESqXCIv
         yxu5ktw2q/C9N1WqnQDpRmKzLZgO2ttzwhq9U7UrERqfNbexVey0Y/zAXDXR6MZSwGi3
         Ik062N5bJ4a6lEOnUeaVf0nGPQDNCkue4GgEVKJ9cf+sD1OH3pIIW7KQYMJAwdITv2z9
         K3pg==
X-Gm-Message-State: AOJu0Yzk/yr7oDjxvNo7mFYAYLIMwWh/NPEFN/iMt21lYJ6wc4JKFTsu
	fpBtPR15z1XV/19lL7Da9ogsjq3+0qXXpAIVBVuwWAmLrzZL29eQaon1hDHhvGHLVVY=
X-Gm-Gg: ASbGncs9A+33V3b/ivCPpjnwrpEHAQ5JQsUFq5E5bmsHs50pBiczxr0IDQff4bFTlzA
	7DQ2kIMA+tpSose9961oVpf/j+gDUFKNf+ihPz4lPoW6FgzdHVyTNtDq5yy5XfTAVZMjZztqgyC
	oVOw0X6G1jvMGrgpgFOGkJLONASzy9QJ7p279JuULGtKLD2b84FmfBwPm+Ta1+PZ+Ge5SPYeDA3
	B1sDB7TLvaLH1eFIm4ti7q1Tct+GjRF81v4XAMAl0kML7P7egLO5u4gXRDEvE79leQT4UV8fmIq
	tzoFkiLqkfN3H9UoIl7fTAlydpLzGagzKlYkf1cvyr669uIVaxRWFASGCR9dHPZvrsNjST00X3M
	+3UoUf6ZfsbpgXBr3IqiMER/MdnQWBY7wlovMM6AdfIE+lXx9avVNR8geCVEPg2er
X-Google-Smtp-Source: AGHT+IHkYxD1EboP/TbdW74mssEAzDAmI9C1GIx0bTyGR/ssaIY4vNnPWQhRo2D5dv3Be+lyxWwcGg==
X-Received: by 2002:a05:6000:288f:b0:3b7:94c6:7c9 with SMTP id ffacd0b85a97d-3b9edf935aemr644651f8f.27.1755120733878;
        Wed, 13 Aug 2025 14:32:13 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c469319sm47865251f8f.54.2025.08.13.14.32.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 14:32:12 -0700 (PDT)
Message-ID: <505218ad-d010-42a2-bf01-d2141d55001d@linaro.org>
Date: Wed, 13 Aug 2025 22:32:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] media: qcom: camss: Add CSIPHY support for QCS8300
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250813053724.232494-1-quic_vikramsa@quicinc.com>
 <20250813053724.232494-4-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250813053724.232494-4-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_143215_532195_BEAFA383 
X-CRM114-Status: GOOD (  17.68  )
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

On 13/08/2025 06:37, Vikram Sharma wrote:
> QCS8300 uses the same CSIPHY hardware version (v1.3.0) as
> SA8775P. The only difference between the two platforms is
> the number of CSIPHY instances: SA8775P has four, while
> QCS8300 has three.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   .../qcom/camss/camss-csiphy-3ph-1-0.c         |  2 +
>   drivers/media/platform/qcom/camss/camss.c     | 57 +++++++++++++++++++
>   2 files changed, 59 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index a610504359d0..445f4d41e847 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -826,6 +826,7 @@ static bool csiphy_is_gen2(u32 version)
>   	case CAMSS_7280:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
> +	case CAMSS_8300:
>   	case CAMSS_845:
>   	case CAMSS_8550:
>   	case CAMSS_8775P:
> @@ -928,6 +929,7 @@ static int csiphy_init(struct csiphy_device *csiphy)
>   		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
>   		regs->offset = 0x1000;
>   		break;
> +	case CAMSS_8300:
>   	case CAMSS_8775P:
>   		regs->lane_regs = &lane_regs_sa8775p[0];
>   		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 6b9aba1029b5..410e188d26aa 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2483,6 +2483,63 @@ static const struct resources_icc icc_res_sm8550[] = {
>   	},
>   };
>   
> +static const struct camss_subdev_resources csiphy_res_8300[] = {
> +	/* CSIPHY0 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },
> +
> +		.clock = { "csiphy_rx", "csiphy0", "csiphy0_timer" },
> +		.clock_rate = {
> +			{ 400000000 },
> +			{ 0 },
> +			{ 400000000 },
> +		},
> +		.reg = { "csiphy0" },
> +		.interrupt = { "csiphy0" },
> +		.csiphy = {
> +			.id = 0,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845,
> +		}
> +	},
> +	/* CSIPHY1 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },
> +
> +		.clock = { "csiphy_rx", "csiphy1", "csiphy1_timer" },
> +		.clock_rate = {
> +			{ 400000000 },
> +			{ 0 },
> +			{ 400000000 },
> +		},
> +		.reg = { "csiphy1" },
> +		.interrupt = { "csiphy1" },
> +		.csiphy = {
> +			.id = 1,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845,
> +		}
> +	},
> +	/* CSIPHY2 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },
> +
> +		.clock = { "csiphy_rx", "csiphy2", "csiphy2_timer" },
> +		.clock_rate = {
> +			{ 400000000 },
> +			{ 0 },
> +			{ 400000000 },
> +		},
> +		.reg = { "csiphy2" },
> +		.interrupt = { "csiphy2" },
> +		.csiphy = {
> +			.id = 2,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845,
> +		}
> +	},
> +};
> +
>   static const struct camss_subdev_resources csiphy_res_8775p[] = {
>   	/* CSIPHY0 */
>   	{
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

