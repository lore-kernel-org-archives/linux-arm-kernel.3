Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D240CC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 21:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1XmXvWLJhlSpXOiiF4u4DdYe3hF2nbQcNLrAb9SCIeY=; b=EcEgNva+UtTkFqUv1Zh2kfOfaL
	yMyuJS2dgG5bD4BLEIalBeGgKCVdG4DoWD8U4OfxCwJ0f5E9TxXURN/MseMQ546AD4F9Ipx+1LbLg
	BLItlrMoZ6lHvqRgxQhwlCqFUaKDTAmQgslX31Afeb8lEekPzkdp+4Q7eyx7ob3U9DuhVzIW7YtCN
	D5LCiICyP82AkorWKpZvmL8QCyzhdg9zvmdHM9664pj0mYoXl5+2ViEHzpztfhAJW0CkjwlNZ/xMZ
	8QS2mcCZh1Et5XzpIJsg65kGyMQz0hrmGAe6LqTs6uAunWmeSUj4Gi0knFiJXRLHRimktLLw7+C0P
	Pzx4Kr9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJDx-0000000F3bA-3ohY;
	Wed, 13 Aug 2025 21:41:33 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJ83-0000000F2V4-0GpD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 21:35:28 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3b9e4147690so129050f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 14:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755120925; x=1755725725; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1XmXvWLJhlSpXOiiF4u4DdYe3hF2nbQcNLrAb9SCIeY=;
        b=kEyaokpEVdLsmIxkHzRZ3Jte+qv4YPn7lRXGxLBHip7Vo4yxyOmXy3+EeST3YDp3pi
         BxsKvcY/es/e3iA9T2u0578BjUqCV23WXKxkSB8ZGacczYCMQxTPhtdK8qIXhtdLDGiz
         YNGNT1Q/uutp1JznbtL4mRB2g94audRgJwmbXL2w/Qj1FmTZb30e/WqIyLJ8qwoNN7y0
         u7aTQ7ylC3+B9vqaoeVFBOmhJGiUhI8jgr4+gR/Fi0MAwWUpt5qoA/ndnC3Q/sPN42BF
         Fsy9SUFrhXpfrb4RN7JAfH0evElPsBlltxq0Ssag/G11fgWD01lei/k4+uQsQq9ktJwQ
         g8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755120925; x=1755725725;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1XmXvWLJhlSpXOiiF4u4DdYe3hF2nbQcNLrAb9SCIeY=;
        b=HxB+XMGSoiiw6roHRPTCV3MOu6/MVYilVoAMGBabktaryObsZofjNybc3zzJA+5Lci
         9BWDljLMctTl1QHYuHfvUEwUWWY8TenTvz2veYL3n+xUF/DM3Tqk5bwuf2ZDjOba7apd
         RdPf9Fol7UcgJ+w7gPuRHF/msrEJo+JU1W3cA2IUPS+JCymd3yy5WjTV/TPcQNVt8/8f
         jJJ0iz2NFTIukLghA10cx9sEmWBYxUalNLfQZY0Ak5cV/+j0Iuvo4zDAFXw6cY/WhIlP
         J1naLOpbg6JvsF9D1YzGpwq2u9V8vdheFzOOligiJY73a0rJmoHSecKfN3WqUEPv65+P
         3U6A==
X-Gm-Message-State: AOJu0YxyPfoT3c94H+LVhadPRoJ96OqIaf1lgNyHvt0bG/qMgf9miJ3W
	cgZlvhb8uuZuaDXJoSPnvoX07A7gu7qSeMDLxLTBfAseA8AW8A8M4QIlR3fmejkQwAQ=
X-Gm-Gg: ASbGncudd+mct9m/VA83Gxc/p4gI5Y2nux8vezqiKa6JPSPN2aOt8co0u9WAK3miOfK
	giPXmWN0g8oTLMnSON766rsc6L/16Uc4D3JMSdKmg3NpEKSkSeAKqDswn2emAd4uJgDOJZ36KzX
	8+B9TIlf5f8a6Ynr/xGNFGO6Y9t5QBLcDJ68lRtoleSyIDmnZGqx3QvnYoTXGDAoFSTpTOkFYSE
	Hkk11lIi4bHgCsdjHVkF226J7U5OzS6REq+faxZupgiMbmCODJCh5+5J4PzCLuZf/rPyZffZQgW
	Mj2b2bHmY5SbKtLKeLObZ/QHh4qvIOOkVW8YvEvL0bS8roGnY+Yz9C57oRz1s5tbIWL4BdstnBG
	CIQR5vge0Awf7pi02xHCZicQQVzkL6Eq57iuZsQeh2qXo59zmQyeSkyvkH4mTVjWM
X-Google-Smtp-Source: AGHT+IEXpcW7O5Udyxtt77HddjjtyRdwKlGTXAk1h299MQ76Ljg2rx6jkkZiaE782uOxs2v38udmMg==
X-Received: by 2002:a05:6000:25c6:b0:3a4:dc2a:924e with SMTP id ffacd0b85a97d-3b9e7438457mr554485f8f.6.1755120925461;
        Wed, 13 Aug 2025 14:35:25 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm48738067f8f.39.2025.08.13.14.35.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 14:35:24 -0700 (PDT)
Message-ID: <0a049417-6545-4cdb-95cb-cf41c810b57c@linaro.org>
Date: Wed, 13 Aug 2025 22:35:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] media: qcom: camss: enable vfe 690 for qcs8300
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250813053724.232494-1-quic_vikramsa@quicinc.com>
 <20250813053724.232494-6-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250813053724.232494-6-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_143527_107484_05517327 
X-CRM114-Status: GOOD (  15.39  )
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
> The vfe in qcs8300 is version 690, it is same as vfe used in
> lemans(sa8775p). vfe gen3 have support for vfe 690.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/camss-vfe-gen3.c | 3 ++-
>   drivers/media/platform/qcom/camss/camss-vfe.c      | 2 ++
>   2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen3.c b/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
> index f2001140ead1..22579617def7 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
> @@ -13,7 +13,8 @@
>   #include "camss-vfe.h"
>   
>   #define IS_VFE_690(vfe) \
> -	    (vfe->camss->res->version == CAMSS_8775P)
> +	    ((vfe->camss->res->version == CAMSS_8775P) \
> +	    || (vfe->camss->res->version == CAMSS_8300))

I'd really prefer a patch setting the CSID and VFE versions as 
properties of their respective data-structures.

BUT, again this will do for now.

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

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

