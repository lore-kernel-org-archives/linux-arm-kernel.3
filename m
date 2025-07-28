Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54892C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 14:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CENTF0ISHbmixWe0j83y9bNXImg/NoofqSDy9p7Nfjs=; b=SW1weou3u0JrgnzcBB62nZZ5PE
	F90jzI7vV/QNHMxXdTUNGcXGCdvk9AxWE1nAx0uC4oXWtN4ps13RCUGpKvaNtGzuQw6SvJCeq56cm
	GgCVD2YzCmTMau71VLY0gaqTd6L1KXfvcuJh0YmRgmYoOATHs0xf4KetpNT4dJk+8Bz547kqdXY6w
	RQoXFppS7o0gbXPJvyl1Ygm/OO1FBtHKRFnpXDNspeeCJpynF0vKLUp1k2m43fYrwHP0J/knkDANe
	sTySCbAzs2BRRRhzbzZquJJMZ4cxq+nvpGmyFm1ekzBdRiuu6CWeteESTWT59Mm0bAjGuskgqzn9F
	Xa4b5vag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOTK-0000000Ebyz-0PEH;
	Mon, 28 Jul 2025 14:04:58 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOGU-0000000EZUI-0zUM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 13:51:43 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3b783ea5014so903432f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 06:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753710701; x=1754315501; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CENTF0ISHbmixWe0j83y9bNXImg/NoofqSDy9p7Nfjs=;
        b=kktGDxTaZPpyUkwmLeBzRZE9/FzzAgAzGyOG3wYnyUbLl8WILqoEkNwdHSKQs4wFH4
         st7NbRb0Y3pZH8Y+os6cge+xGZJ/4sftrxo+Zna3czLRSI7xS4duifBIQtWtyLG9qJyk
         v8s+Yu+funS5dCnI6ARNaMBKeyN9eCokmAzjBB1T6czDSuz1Qfj5bV9X1JLSa7hgRrIB
         K7/guXi91CxHeefH8oDvu87S2MPNkxEdCfsucjah0Xw2IT0VrnMJOcyjaxEel9cRXLoF
         tsln0+vqqMrSbZ1iwLEASFqWwknr1eLTfIiqLV7rxWSPZPfJ+qeVkxioYQiX2o76wJZl
         9rFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753710701; x=1754315501;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CENTF0ISHbmixWe0j83y9bNXImg/NoofqSDy9p7Nfjs=;
        b=xFuVqcrZjPModfmFohMLgfg4nu3MSeTFtLzA17DLn+dnVmHgNsQUjoVvVAZvpSgnyU
         Le9oA8MSa5uUYEc1qa1SZxP/ZC6fkAicPOJ21PiLDm00C4tjhBC6bCFILDhTlH+wDU/f
         HX7VkGSRLhGWzLYZWB/77KXvNCo26TCA5HhbR8VkTEvdzEY/MJL166/fQMB8Ukrm3F5d
         nGoeE1c7BuDFX37/3kZWdMpUIT7phOTYQc+gYkN5v5e8nOhnbDSJpdJ9F92ueFvdGI/w
         DUoI8TiVHRhVXUIVAWYLOONbzoz9OWjQXJGplZuqHQVJFlGunvo+v8frQly4q9CjAjNL
         f+Ug==
X-Gm-Message-State: AOJu0YyWNlRpimo2anBclchsE6amZfRv3G93dyWKc3WJuDss0oLXg3L/
	6ogdtZjysNuw0cQwVZNRdq8Qm22pRPfgclGMd8on9Jiw3ogqOgfmnOHeycAVC4dwtH4=
X-Gm-Gg: ASbGnctMmercH46ZnGwloEmv1uYdckSQMHzJmGWoGV0vPoHNi0OXmH0aCyOSf/TNBli
	m8x0BgSUxNdNGD31k4Vh6ZBEf3zCYdGVO9jZm3pT8FxRhREF0QQ0NZo1PT0K7PCvvZm4pAUq8pD
	VvMiELcF6ozhBc34HM9z2RNoAjNOmVf9mxp7HMO6gYixsJReB4pBjtbzWKBzLrA6CIICSwSonBn
	lT5UWSdTLtE+7xQ2Z2ErA/u0J+8Wdz65HDPUWdZULir6AI+oMAegt9CEpAMg7TEuBRPs/zFuXB1
	H7JWm6aGcQmmQOrpbkL05mkz5GNuFtlKMGcu3SBoCVCMN+hhPC674QOaLnvx9kV7xlJ75rAb6TA
	BkT2gao+YLn3xQkH1u5kvH+ek9pVsMm76L/+2b2mQP2/qDvxCTUN7lxJvA9Az/5o=
X-Google-Smtp-Source: AGHT+IGVdzWUOBBFfiYOEkrEFkxq518/+eZQSkut23M7mdFO6PCXHW/ZlaBVEVa5d8CeUSl1+EFZEA==
X-Received: by 2002:a05:6000:3113:b0:3b4:9721:2b16 with SMTP id ffacd0b85a97d-3b776644006mr7913012f8f.36.1753710700431;
        Mon, 28 Jul 2025 06:51:40 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587abe61fasm99002615e9.8.2025.07.28.06.51.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 06:51:39 -0700 (PDT)
Message-ID: <6feef32b-4d1f-428c-9759-2d3318b0f224@linaro.org>
Date: Mon, 28 Jul 2025 14:51:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] media: qcom: camss: Add support for CSIPHY 690
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Wenmeng Liu <quic_wenmliu@quicinc.com>
References: <20250703171938.3606998-1-quic_vikramsa@quicinc.com>
 <20250703171938.3606998-7-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250703171938.3606998-7-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_065142_289964_B5BB97C3 
X-CRM114-Status: GOOD (  20.61  )
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

On 03/07/2025 18:19, Vikram Sharma wrote:
> Add support for CSIPHY found on SA8775P (Titan 690).
> This implementation is based on the titan 690 implementation.
> 
> Co-developed-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   .../qcom/camss/camss-csiphy-3ph-1-0.c         | 84 +++++++++++++++++++
>   .../media/platform/qcom/camss/camss-csiphy.c  |  5 ++
>   .../media/platform/qcom/camss/camss-csiphy.h  |  1 +
>   drivers/media/platform/qcom/camss/camss.c     | 75 +++++++++++++++++
>   4 files changed, 165 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index f732a76de93e..bb5ebaa13ec8 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -64,6 +64,85 @@ struct csiphy_lane_regs {
>   	u32 csiphy_param_type;
>   };
>   
> +/* GEN2 1.3.0 2PH */

I'd be nice to include the process node number here. Its not a secret so 
please add for the edifcation of the reader.

> +static const struct
> +csiphy_lane_regs lane_regs_sa8775p[] = {
> +	{0x0724, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0728, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0700, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x070C, 0xFF, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0738, 0x1F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x072C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0734, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0710, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x071C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0714, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x073C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0704, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0720, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0708, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0024, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0000, 0x8D, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0038, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0010, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x003C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0020, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0008, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0224, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0200, 0x8D, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0238, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x022C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0234, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0210, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x021C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0214, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x023C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0204, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0220, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0208, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0424, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0400, 0x8D, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0438, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x042C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0434, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0410, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x041C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x043C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0404, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0420, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0408, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0624, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0600, 0x8D, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0638, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x062C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0634, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0610, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x061C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0614, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x063C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0604, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0620, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0608, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x005C, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0060, 0xFD, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0064, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x025C, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0260, 0xFD, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0264, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x045C, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0460, 0xFD, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0464, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x065C, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0660, 0xFD, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0664, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +};
> +
>   /* GEN2 1.0 2PH */
>   static const struct
>   csiphy_lane_regs lane_regs_sdm845[] = {
> @@ -749,6 +828,7 @@ static bool csiphy_is_gen2(u32 version)
>   	case CAMSS_8280XP:
>   	case CAMSS_845:
>   	case CAMSS_8550:
> +	case CAMSS_8775P:
>   	case CAMSS_X1E80100:
>   		ret = true;
>   		break;
> @@ -848,6 +928,10 @@ static int csiphy_init(struct csiphy_device *csiphy)
>   		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
>   		regs->offset = 0x1000;
>   		break;
> +	case CAMSS_8775P:
> +		regs->lane_regs = &lane_regs_sa8775p[0];
> +		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
> +		break;
>   	default:
>   		WARN(1, "unknown csiphy version\n");
>   		return -ENODEV;
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index c622efcc92ff..f6a2ac385953 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -103,6 +103,11 @@ const struct csiphy_formats csiphy_formats_8x96 = {
>   	.formats = formats_8x96
>   };
>   
> +const struct csiphy_formats csiphy_formats_sa8775p = {
> +	.nformats = ARRAY_SIZE(formats_sdm845),
> +	.formats = formats_sdm845
> +};
> +
>   const struct csiphy_formats csiphy_formats_sc7280 = {
>   	.nformats = ARRAY_SIZE(formats_sdm845),
>   	.formats = formats_sdm845
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
> index ab91273303b9..842e72b74ce4 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -126,6 +126,7 @@ void msm_csiphy_unregister_entity(struct csiphy_device *csiphy);
>   
>   extern const struct csiphy_formats csiphy_formats_8x16;
>   extern const struct csiphy_formats csiphy_formats_8x96;
> +extern const struct csiphy_formats csiphy_formats_sa8775p;
>   extern const struct csiphy_formats csiphy_formats_sc7280;
>   extern const struct csiphy_formats csiphy_formats_sdm845;
>   
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 3122a29891c2..ebc3b296bb50 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2483,6 +2483,81 @@ static const struct resources_icc icc_res_sm8550[] = {
>   	},
>   };
>   
> +static const struct camss_subdev_resources csiphy_res_8775p[] = {
> +	/* CSIPHY0 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },
> +
Drop the dead newline please.

> +		.clock = { "csiphy_rx", "csiphy0", "csiphy0_timer"},
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
> +			.formats = &csiphy_formats_sa8775p
> +		}
> +	},
> +	/* CSIPHY1 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },
> +
> +		.clock = { "csiphy_rx", "csiphy1", "csiphy1_timer"},
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
> +			.formats = &csiphy_formats_sa8775p
> +		}
> +	},
> +	/* CSIPHY2 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },
> +
> +		.clock = { "csiphy_rx", "csiphy2", "csiphy2_timer"},
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
> +			.formats = &csiphy_formats_sa8775p
> +		}
> +	},
> +	/* CSIPHY3 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },
> +
> +		.clock = { "csiphy_rx", "csiphy3", "csiphy3_timer"},
> +		.clock_rate = {
> +			{ 400000000 },
> +			{ 0 },
> +			{ 400000000 },
> +		},
> +		.reg = { "csiphy3" },
> +		.interrupt = { "csiphy3" },
> +		.csiphy = {
> +			.id = 3,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sa8775p
> +		}
> +	},
> +};
> +
>   static const struct resources_icc icc_res_sa8775p[] = {
>   	{
>   		.name = "ahb",
Assuming that's done:

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

