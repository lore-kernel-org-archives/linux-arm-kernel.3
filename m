Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E95C7C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 09:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y/Bse1dCSk7wlBTxWxrw+fvF90V1hOkdi4rEK3c8vEo=; b=ZWhRd6e2s3E8uE/9Y2GKrRfxdR
	a0RIuMN4UCJFg3SJ1gS3qxZWEf75cynz/TgL43UUINhuPyMOyA8Zui7EpUEyD3AZEXpfGY1BGNsff
	tBPo+ZfgyUDi2Oj3Oj3wGZ7d4yCEmXSq6wFVy1F05Z3rxKEPbAUPuRpBm5GbEYA3XsdTRus25aqzg
	BRT9P0pXv/iJYafVQT40xtDSQHp2jQDp4E2TBv4Fgc1A/o0ITxtKLWfgyyw5h3++OwIUzek4UctCO
	48eSB2ovxVeVsBUl7ZaEmzipA3ZNhMZ+Lbtium2GxCJTFJk2zMS+Owy38n9/E+sC9IoRFNAk1Rikz
	sde3eltQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfyb2-00000005u6S-1m1M;
	Thu, 06 Feb 2025 09:54:56 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfyZe-00000005txV-3C6T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 09:53:31 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-38dc1dfd9f2so156157f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 01:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738835609; x=1739440409; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y/Bse1dCSk7wlBTxWxrw+fvF90V1hOkdi4rEK3c8vEo=;
        b=KmA4GfIMcLGUZSq8MZwmqinsof3arpXNLEWI7KxTRwfaD34VQdjI86uhC9vvKRcfdz
         bOEddFNp22+HLHRHTXT1rD6AlXLQyX8R81zv082KcB6imC/WlcL9mPHMwyqnZlWbm0eU
         Iqi4zWtddqxty0pKTLoJ7EUnpjk+/v3pCoYn3nhclHKBJ4nbf7DTjPlxZVrAHd+7FjFv
         6IqTIi7IPPAri+RyxmcQfd9Vc679U6YUEnqcaQ0qBSgB4Lr+uV7B2UuxFSoDaczRK/lU
         o0EwE1hxPB1JQRKllFl6P7KqueoyKBm493smsWVpbD0Lj5/VDjTX5YU4vK83gGA0luC1
         aLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738835609; x=1739440409;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y/Bse1dCSk7wlBTxWxrw+fvF90V1hOkdi4rEK3c8vEo=;
        b=AA2hmZGwDmOH5mN/cmPv51YCyYt2FYF0CsG/1q71XaTRQkP0+7zgv7ObB0t6R3huEN
         yRAHdbTuOjL/RkAc7nMnq8ak3gclrE33zz+59hh3m+Lc0HnD4N4/e4AsbMixZaVvYlrh
         CLnkmaXfVbHWecr80MW2wMDZULgXkUUztPmh/cVpcNfHrUVPnVXqH70bnXL2v77WuDrj
         1k1PqCZLxl3QUT7Hhado/YHwSW2MVtj5xKk6d5eNi2+eqbc1T8H3meXFU8GJ84Atmnwy
         pZlzhNqIvV6djOFfrd/KX6PgISwGjgZix0FII0QUnjTW57JDAurIcTCWgAJ5o3IJdW1Q
         ShiA==
X-Forwarded-Encrypted: i=1; AJvYcCXObmOT+5BF11U3C3eXIzMhq5st7N1Elz+LMH56eGppBWfPP6KErCwO1CIZt19eNMnj4E1rbx/V11Q+FdAGpn6m@lists.infradead.org
X-Gm-Message-State: AOJu0YyZK56Qom9VyZvw64+H8gUjR3q1ibbVHwEERrVjJnwBfyG86QRk
	YCEsyFklU/lVrw3BL4ioPciVBbNLaKUZGoVRKnMN5BfHS++mSUWeIqkMN1NSnCg=
X-Gm-Gg: ASbGncv9A2OqVwF1lUo0quE5PCrXZuarzP7ql4LsQGxbKh8nFG8yi3IFoxKvbuPjeWX
	n2R24R37Sx/WO6wk3JL0gkCsdLq6A0gsV6F8khHpaqHFdZIDav1u6qmKY0cDyTM8rnXCPKo4bho
	Z5uwmLMFPhJYiI3ioUh8MjpZSttnReGZQ2B5Hv2uz/Yj7eK0xD7F8E2Fyc4dHyQ4Is0S5ZU0h/4
	yT8DwnCLU3ylyf8bxrUZNo1lLv5EviQm21QDwn7ajqrxqxn3C3hjeFGwPWSc2mfXfNwYfXAeuM6
	Eqa9tVBLB90bzLBkL3r8AMmpeV2j3C2ahOTN6OH+li+YDl8m3tnLmNdYY7sPeHYPNcfd
X-Google-Smtp-Source: AGHT+IFZ/YD1C+lwl5UFVIadECKSzvAxjxJXg73+g+VHFrSip3JyQPnIew9WOECpn6y9hKaGtkaC7Q==
X-Received: by 2002:a5d:5f4c:0:b0:385:fae2:f443 with SMTP id ffacd0b85a97d-38db48d5d49mr3733434f8f.34.1738835608907;
        Thu, 06 Feb 2025 01:53:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4972:46a2:e0cb:c0a6? ([2a01:e0a:982:cbb0:4972:46a2:e0cb:c0a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc31b9394sm337288f8f.11.2025.02.06.01.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 01:53:28 -0800 (PST)
Message-ID: <63578f71-e5f5-482a-98a7-779053b1caf7@linaro.org>
Date: Thu, 6 Feb 2025 10:53:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 0/8] Support Multi-frequency scale for UFS
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
References: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
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
In-Reply-To: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_015330_795211_03F7CD69 
X-CRM114-Status: GOOD (  14.60  )
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

On 03/02/2025 09:11, Ziqi Chen wrote:
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
> v2 -> v3:
> 1. Change 'vops' to 'vop' in all commit message
> 2. keep the indentation consistent for clk_scale_notify() definition.
> 3. In "scsi: ufs: core: Add a vop to map clock frequency to gear speed", "scsi: ufs: qcom: Implement the freq_to_gear_speed() vop"
>     and "scsi: ufs: core: Enable multi-level gear scaling", remove the parameter 'gear' and use it as return result in function freq_to_gear_speed()
> 4. In "scsi: ufs: qcom: Implement the freq_to_gear_speed(), removed the variable 'ret' in function ufs_qcom_freq_to_gear_speed()
> 5. In "scsi: ufs: core: Enable multi-level gear scaling", use assignment instead memcpy() in function ufshcd_scale_gear()
> 6. Improve the grammar of attributes' descriptions in “ABI: sysfs-driver-ufs: Add missing UFS sysfs attributes”
> 7. Typo fixed for some commit messages.
> 
> Can Guo (6):
>    scsi: ufs: core: Pass target_freq to clk_scale_notify() vop
>    scsi: ufs: qcom: Pass target_freq to clk scale pre and post change
>    scsi: ufs: core: Add a vop to map clock frequency to gear speed
>    scsi: ufs: qcom: Implement the freq_to_gear_speed() vop
>    scsi: ufs: core: Enable multi-level gear scaling
>    scsi: ufs: core: Toggle Write Booster during clock scaling base on
>      gear speed
> 
> Ziqi Chen (2):
>    scsi: ufs: core: Check if scaling up is required when disable clkscale
>    ABI: sysfs-driver-ufs: Add missing UFS sysfs attributes
> 
>   Documentation/ABI/testing/sysfs-driver-ufs | 33 ++++++++++
>   drivers/ufs/core/ufshcd-priv.h             | 15 ++++-
>   drivers/ufs/core/ufshcd.c                  | 76 +++++++++++++++++-----
>   drivers/ufs/host/ufs-mediatek.c            |  1 +
>   drivers/ufs/host/ufs-qcom.c                | 62 ++++++++++++++----
>   include/ufs/ufshcd.h                       |  9 ++-
>   6 files changed, 160 insertions(+), 36 deletions(-)
> 

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK

I added some traces and played with devfreq max_freq while copying data
from the UFS disk, no issues observed.

Neil		

