Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EED1C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 20:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Majoph8E+cCh21U54jZPyu++uXYCQ8kOGOIWq+E+Nk0=; b=RxrAsKStOplBmfalsptmlhtOtU
	VmcbmlFY7BAaT8GkJlxm0E9gT0pTB23qS1jfIMIHK8m4upAH6WlhYQruIj0tS1MdoA1yZXRvlaHpP
	Vpcl+fbvwVq45jOpfdjTvVHHeq8C1CbyACuk/70UAb2axRFyGAxMXH0u7vRu0UH7X5FO5eY5vIFpY
	S69wDWABLe5bEV2ZtdoCEY/mpNjz0LFup7FMZB+oaO3aLAWU/wmnSNB4J1ewhyGv7xrJ54Yod8Ma9
	LMDDgHllq+OxgETlcJzvhnpldwnPeZAGRuQY7GH5XbalCbeMGKCY7k2kUfv7w59jubQlFcFtfhJX1
	HQxM496w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb3aR-0000000DDHu-3f9z;
	Thu, 23 Jan 2025 20:13:59 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb3Z9-0000000DD2x-0cCC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 20:12:40 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2ef6c56032eso1925388a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 12:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737663158; x=1738267958; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Majoph8E+cCh21U54jZPyu++uXYCQ8kOGOIWq+E+Nk0=;
        b=RY2sfzc8tvjUs2iQrqxILKQq4VDP9h+bTwPStaQfLmwcGO8SPwlKO+mKzmsYwEltLA
         zioEJ85gODIkcv9VK/2ILEUMIdALuFblPR3B0cBy5Dqsjb5g9yqqQPQJFxIfo9dn3iL7
         Jvatuih3h/zQigmx3uDdTi1Z72nzjmksHF0GQXItAaWs6gpnnrHbxCLvxCGiLOL2dcPC
         00lLc1Dg6jtR9jrTm4MAN44kcoPYUaCYwcQ9eQfHJaoxai4Gv9Pkx5J5jsd4j0OJqOHE
         q4RUMS8Djcj19sztXIuoF5vTOIUYqK4U/pn6SaYLmtAODx/jE2hzkISNs4CmIENoyQLQ
         tm7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737663158; x=1738267958;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Majoph8E+cCh21U54jZPyu++uXYCQ8kOGOIWq+E+Nk0=;
        b=OskdS3zd7hdYz200EVc1k3Pb+9gfXzchh26SPpEaIHfZID6HcaSOfWZSBGL5S1mLxi
         1HLo+X0pxGFuNuW9u8Px1SWvU/E2998tbN0JQyg5Sr7EeHLoeRXcJYiLJjwJhHGEAfAA
         HRpBOkXtLOGNTOfaVm2sgYxANN1wXaqe0BYuJKT8GybCcO4FSjLNE3Rl3cPxHbHZueJT
         yW3tDmlDxcpbNRksr0GIy8lb+lXM3Wk3hXyhfMJ9MdW+cZ9FAPQ6KJhece1spCWLErHR
         1dkvShpXpv3zhlQFGzbsyke6zeE64tDyivkHSKHWuwJoCbcBz42tyPsoV+TnToC0Xfay
         mXkw==
X-Forwarded-Encrypted: i=1; AJvYcCVFcaJbetxInXM8PUWF/gxAfctJehnuRV9i4pw8uf5uZUdVLSOKvOp2de/nHB99Wj9hElmuyrRbuqxcaN/nT220@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+V9hdbvnW9nqOJhHuJ/sfBjv4zOHuF4CWfSrVppHpzPvVutHH
	d5sCwh5NtDaM121NL4V+dqpU6OEElXlY1djiLasg5YGO6NwWZy6nW79LWLDh2m8=
X-Gm-Gg: ASbGncudmiRYRDnC4T3JqDQ8nqFTfJPNhwIkTme3wthX/8dWSyqtjjmV274P/wY6GDv
	Kjtmp0OdmiXYqprDJzDzTeLcPA35t4cCRKJREx+Xm0ykf5qKkUHjsfPse197QPTlIEdi/j2Weo8
	owv4qhItTWqhXJJU6+LT6UFttxrY5g/ra92+iM5VJzi+0QgZVRWVuC1dKiC995jrFLfGlpUKAQG
	suOtTe6vtoIeVcNj+grmFZ92XdfeejEpJcRbdbfo/Fr8RU3/rwbZzR0bM3CPUwKjq0oH97cKGcj
	A1POFDVeOuysDso=
X-Google-Smtp-Source: AGHT+IGjYLbdTkDtVsKIemv83lRYfSaqRItS6634hiKj+p4fMBDbSMDFpjyvf11Hf9VpoP3IInSiyA==
X-Received: by 2002:a17:90a:c2c7:b0:2ef:2d9f:8e55 with SMTP id 98e67ed59e1d1-2f782ca1fffmr43193938a91.17.1737663158301;
        Thu, 23 Jan 2025 12:12:38 -0800 (PST)
Received: from [192.168.5.187] ([4.16.227.147])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa54a83sm122332a91.11.2025.01.23.12.12.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 12:12:37 -0800 (PST)
Message-ID: <d4881156-a003-41fe-824e-4c29e279fbb7@linaro.org>
Date: Thu, 23 Jan 2025 21:12:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 0/8] Support Multi-frequency scale for UFS
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com,
 bvanassche@acm.org, mani@kernel.org, beanhuo@micron.com,
 avri.altman@wdc.com, junwoo80.lee@samsung.com, martin.petersen@oracle.com,
 quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "open list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-mediatek@lists.infradead.org>
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_121239_246341_A72C2A31 
X-CRM114-Status: GOOD (  12.90  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

On 22/01/2025 11:02, Ziqi Chen wrote:
> With OPP V2 enabled, devfreq can scale clocks amongst multiple frequency
> plans. However, the gear speed is only toggled between min and max during
> clock scaling. Enable multi-level gear scaling by mapping clock frequencies
> to gear speeds, so that when devfreq scales clock frequencies we can put
> the UFS link at the appropraite gear speeds accordingly.
> 
> This series has been tested on below platforms -
> sm8550 mtp + UFS3.1
> SM8650 MTP + UFS3.1
> SM8750 MTP + UFS4.0

Thanks, could you be more precise on how you tested this feature ? how did you exercise the gear changes and check that is cales correctly ?

Thanks,
Neil

> 
> v1 -> v2:
> 1. Withdraw old patch 8/8 "ARM: dts: msm: Use Operation Points V2 for UFS on SM8650"
> 2. Add new patch 8/8 "ABI: sysfs-driver-ufs: Add missing UFS sysfs addributes"
> 3. Modify commit message for  "scsi: ufs: core: Pass target_freq to clk_scale_notify() vops" and "scsi: ufs: qcom: Pass target_freq to clk scale pre and post change"
> 4. In "scsi: ufs: qcom: Pass target_freq to clk scale pre and post change", use common Macro HZ_PER_MHZ in function ufs_qcom_set_core_clk_ctrl()
> 5. In "scsi: ufs: qcom: Implement the freq_to_gear_speed() vops", print out freq and gear info as debugging message
> 6. In "scsi: ufs: core: Enable multi-level gear scaling", rename the lable "do_pmc" to "config_pwr_mode"
> 7. In "scsi: ufs: core: Toggle Write Booster during clock", initialize the local variables "wb_en" as "false"
> 
> Can Guo (6):
>    scsi: ufs: core: Pass target_freq to clk_scale_notify() vops
>    scsi: ufs: qcom: Pass target_freq to clk scale pre and post change
>    scsi: ufs: core: Add a vops to map clock frequency to gear speed
>    scsi: ufs: qcom: Implement the freq_to_gear_speed() vops
>    scsi: ufs: core: Enable multi-level gear scaling
>    scsi: ufs: core: Toggle Write Booster during clock scaling base on
>      gear speed
> 
> Ziqi Chen (2):
>    scsi: ufs: core: Check if scaling up is required when disable clkscale
>    ABI: sysfs-driver-ufs: Add missing UFS sysfs addributes
> 
>   Documentation/ABI/testing/sysfs-driver-ufs | 31 ++++++++++
>   drivers/ufs/core/ufshcd-priv.h             | 17 +++++-
>   drivers/ufs/core/ufshcd.c                  | 71 ++++++++++++++++------
>   drivers/ufs/host/ufs-mediatek.c            |  1 +
>   drivers/ufs/host/ufs-qcom.c                | 66 +++++++++++++++-----
>   include/ufs/ufshcd.h                       |  8 ++-
>   6 files changed, 159 insertions(+), 35 deletions(-)
> 


