Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B71FE51FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 09:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zyyE/r/iA1MwYNHXAS7P+Cj4G1v9/C9w7YzUp4f7iBc=; b=CI900NwqwZ7p+JFWqXqxiq4SU3
	QTnWJ0Ep8wAXRjmWDbkiySfjQtIxMVChnFj6ukABBhinp18P++6ZZUVIOTkZpu51h/HwSs+TIv9o0
	H5OIzoX+vm0AvI8BE/NsZDYqfszPqYqLTWIPjbePcYxv7BXs9nz2yiTY+h37p8ksSRuinb2ga3sjz
	Cq6CQm+Stgr8ECoS+ukhT3yaHK/siOsOas+JNfPtYK/Wt5SXiRzDOaLXLDWRFyVxfy7jYOi7EqeBX
	pxdnBAV5GE2C60/lNQg2EvLO9NbNYT9DOEunEDSDYeymlm/6MFixV5yhszGaS8HoUcd8FESaBzlHo
	8vOQUNaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGD8d-0000000CxLk-2mJI;
	Fri, 24 Apr 2026 09:47:55 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGD8a-0000000CxK1-3hY4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 09:47:54 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso48064745e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 02:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777024071; x=1777628871; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zyyE/r/iA1MwYNHXAS7P+Cj4G1v9/C9w7YzUp4f7iBc=;
        b=maTCA5TUp8xzhVshCkccW3aTMn6hawPk9SRweNWfcKDWAjlEiRh6p9KJ43Pw2yIsLo
         WcTsPgvUf1A7LOF3j9RRYTJ9z3QWhoXjbNoeq1DP7Y15LVvUR+Gk+qQLPYVi/goLXrwq
         HXefUIA1u7HqmhTPc4+mKmuzEPkqT68PMzuWVQEIjb+d4JiE7kgyJd/Rqj1wknEDvq0R
         Yf8G2ZXas2pFimnwNMlQiL0lszaW7Nr7EtYvJlIHTshq5DUr/hlNF1tCbgsiyOnwSs2F
         I7Ua4DwRQB888/xwdFJ2yX9I2VO3rghk5bcyS1TX1RkyR0D5rciDGaEY4uj/mCRNZyNN
         MQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024071; x=1777628871;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zyyE/r/iA1MwYNHXAS7P+Cj4G1v9/C9w7YzUp4f7iBc=;
        b=A17t7WrhyhcRh8twqXdjZVDB/2Y4ytUmCTwZnSWbRDA/tZ+OlyPq9NDX8io+Zp53MJ
         6X3fMzcWyrOOHy98DNzLXW7QFFSbYqK5wpT3RvYTfPDnsSGMkfaZaW9tqqWY36M0trjS
         Ui4X6M/pZQoF4vUkTA+dHgzPmBFEB4VoUgRCSm0NaiU1BVjstMNPlAZqqzTIB85YE4cH
         +/3PkZo0AW+xx6cvp6f3d98pIXI/mBsdOs00tt5UDjoONAhBFf5vj6BOaCRwhLDDlw8e
         b46jNR5eJQFxlVcJ0o6PQsrBhtiC12qCsmtcGDAI3RirQJu1jyHFYLaHR8D3sR8EAU2p
         qdFA==
X-Forwarded-Encrypted: i=1; AFNElJ/i0cUqem5pVr0K+H8gzW31DcEc3CV6tDmtCj7n1mRmyUsydcbeZPeZolxSnTYj9EfaRk2F4qkxd/CJPP9Se7gG@lists.infradead.org
X-Gm-Message-State: AOJu0YynwgxTsF5B5yovhyuUpUiewIhDFZKat3dPT+pKlrcpUUxFCnhP
	NW1nDPWI10FzTv+z2et8+9oiwJE4+/PenJdwMhA12MkymquVICuxTmHMTv4Y0PsQiSQ=
X-Gm-Gg: AeBDievBtf7gi/xg/4TwhWSJD2MzIULigSVrQKMpS6jRCDbbUiDmplwOObLEIx/gi3V
	FU+zfEpOffkBq8pnMfyusVLAuLvOJKTYVYjw4x8PcTk0qXTSxMIk8nkHBCDE4M3TR6TLC5hYAqj
	6bJxGSVYHJHpz2QDxiRhn65i2j1Ui8qeRjFRh4TixSKOf9UbgHtEHsiHgHdtTmBt85TZsDnjEBu
	XHs3EVDQIO2nYxfZmyLag2K5afkR8WpRfZkcpAYS7sS9ELXa06nQ3koNS7Ejv/CUycnUBLFVzj2
	vlHgD2haEeGHNUeHeZ3OPrdPsXetuvXxo4Y6Mj0LyJI5aGu4+WppGj0w5PAYMd3bfCm4YvrSMSu
	bU/Zwwqc84ofwrU4lIo5qwyibMRl+TunklWYVScupjSb1Zd4O71nvRoIRZ9voLFxF/Z8FkzSUaD
	NBkiDa3z8p7PKBzQm7ikSaxnc4mieinE7kk9GhU/rkqN9TwG8SLSAHblrxzjUHjvaYzFJAo9k4U
	7bM7AzKnTb4xq4btw==
X-Received: by 2002:a05:600c:c4a2:b0:488:c078:bfda with SMTP id 5b1f17b1804b1-488fb78eebdmr426779015e9.26.1777024070744;
        Fri, 24 Apr 2026 02:47:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:79e1:f56b:445c:ca9c? ([2a01:e0a:106d:1080:79e1:f56b:445c:ca9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb75ab25sm179552435e9.11.2026.04.24.02.47.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:47:50 -0700 (PDT)
Message-ID: <fe284566-5a71-4b9e-940b-a36c58cb94a5@linaro.org>
Date: Fri, 24 Apr 2026 11:47:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 3/8] firmware: meson: sm: Add thermal calibration SMC
 call
To: linux-kernel-dev@aliel.fr, Guillaume La Roque <glaroque@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260423-add-thermal-t7-vim4-v4-0-d4c1528d5044@aliel.fr>
 <20260423-add-thermal-t7-vim4-v4-3-d4c1528d5044@aliel.fr>
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
In-Reply-To: <20260423-add-thermal-t7-vim4-v4-3-d4c1528d5044@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_024752_951684_28C95F49 
X-CRM114-Status: GOOD (  17.24  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 4/23/26 18:07, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Add SM_THERMAL_CALIB_READ at SMC ID 0x82000047 in the command
> table and implement meson_sm_get_thermal_calib(), which forwards the
> tsensor_id argument to the secure monitor and returns the calibration data.
> 
> Also realign the CMD() column to improve readability.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   drivers/firmware/meson/meson_sm.c | 29 ++++++++++++++++++++++++-----
>   1 file changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
> index 3ab67aaa9e5da..4e57986724212 100644
> --- a/drivers/firmware/meson/meson_sm.c
> +++ b/drivers/firmware/meson/meson_sm.c
> @@ -41,12 +41,13 @@ static const struct meson_sm_chip gxbb_chip = {
>   	.cmd_shmem_in_base	= 0x82000020,
>   	.cmd_shmem_out_base	= 0x82000021,
>   	.cmd = {
> -		CMD(SM_EFUSE_READ,	0x82000030),
> -		CMD(SM_EFUSE_WRITE,	0x82000031),
> +		CMD(SM_EFUSE_READ,		0x82000030),
> +		CMD(SM_EFUSE_WRITE,		0x82000031),
>   		CMD(SM_EFUSE_USER_MAX,	0x82000033),
> -		CMD(SM_GET_CHIP_ID,	0x82000044),
> -		CMD(SM_A1_PWRC_SET,	0x82000093),
> -		CMD(SM_A1_PWRC_GET,	0x82000095),
> +		CMD(SM_GET_CHIP_ID,		0x82000044),
> +		CMD(SM_THERMAL_CALIB_READ,	0x82000047),
> +		CMD(SM_A1_PWRC_SET,		0x82000093),
> +		CMD(SM_A1_PWRC_GET,		0x82000095),
>   		{ /* sentinel */ },
>   	},
>   };
> @@ -245,6 +246,24 @@ struct meson_sm_firmware *meson_sm_get(struct device_node *sm_node)
>   }
>   EXPORT_SYMBOL_GPL(meson_sm_get);
>   
> +/**
> + *
> + * meson_sm_get_thermal_calib - Read thermal sensor calibration data.
> + * @fw:		Pointer to secure-monitor firmware.
> + * @trim_info:	Pointer to store the returned calibration data.
> + * @tsensor_id:	Sensor index to identify which sensor's calibration data
> + *		to retrieve
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int meson_sm_get_thermal_calib(struct meson_sm_firmware *fw, u32 *trim_info,
> +			       u32 tsensor_id)
> +{
> +	return meson_sm_call(fw, SM_THERMAL_CALIB_READ, trim_info, tsensor_id,
> +			     0, 0, 0, 0);
> +}
> +EXPORT_SYMBOL_GPL(meson_sm_get_thermal_calib);
> +
>   #define SM_CHIP_ID_LENGTH	119
>   #define SM_CHIP_ID_OFFSET	4
>   #define SM_CHIP_ID_SIZE		12
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

