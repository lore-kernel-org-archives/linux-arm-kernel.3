Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C127CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 09:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MJvTLRnRDoEqGBIlnWGGjXDEKSpyeQX8qHCstc1K250=; b=EURglAtyMNOoV9omDhbZinOK4q
	aBeJwjvcf0KnIzExXVV/QSVlkbkXSB6pnVR/A6xlT0P9nQzypvWlFghEA20dkm3X26Frkr+1inuUg
	vR/DEgeDmZyVMdPu/TduNxb4fe4RKEbusHuT7ud0bu1Nn6QJYZ6WLRwP3WpFuSMYSax+VGz1P7aBp
	d83kThZP+YNc5xpb6VzOa9iwo7iDGB8RjUHcQgBAkJ8SeGYnfuIhaxVbAZeNLC7bZLigZvVF8bIaU
	YCOL9oKsBttKXUG04YtmXEYmdUZCgC5hBgD4EmtpTZg+U+YDaMO9K0uF//TGfu+C7R6iszG710fxM
	5pXcwb9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvGe-0000000FlS3-3cJy;
	Mon, 17 Nov 2025 09:11:24 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvGb-0000000FlPj-3uTy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 09:11:23 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-429ce7e79f8so3006462f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 01:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763370680; x=1763975480; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MJvTLRnRDoEqGBIlnWGGjXDEKSpyeQX8qHCstc1K250=;
        b=NS+AkmXYDEd9SL5hboa2LU2zKOlyYmhi2Hk2TeN2bCtBgBugFX/kzyzLXT9hXSU3ih
         7hiq4qhTDQ2fU5CYvVtPeB+194Pw8e2Ehd3Y/FWSsDT0ZT6xRRwNNqHUQfyLNu8PLEds
         KcIKzJ1OfX18vIgg97qdC77mTFDRAHhCXoOCegZDY5xmqUgwPKp0aUweeTV1A/YNQPSM
         zGFqUisJhX5S3GNtH9u79fqPLKRsGefx87bFE2mqJQn92jFUgPZR6w3eyFoVqUWO69qk
         t0tgUpL+Z/WF39q7ooVQ+Qnm4Iv9+BC1NoA0sUAvB95iOdgHlxuynMHD2wNFwquipiEc
         dn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763370680; x=1763975480;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MJvTLRnRDoEqGBIlnWGGjXDEKSpyeQX8qHCstc1K250=;
        b=cd8Tm6r7M3zrhzYsZ8VGBosURzW1Wxj6XOGHk991EiHdLgaoLFJbfjrz0IR1g9oIpl
         JsKIr0XAg2EZLk3c0oUND4HRzx6QQ3WP8mKty52MpctkbipGs2u8PZTTYiFAZnnvFHW7
         RradtK3NO+i14ymubDfID8vBvEs6KuvC07+F2QLRHJOlE6m2tVj49tXnD3qxBw3fGO83
         kFc6rhGKiPRjFpmDDBAcNri+Lm8hxbp+Hd65wGD6Lj87slrcls9iC+1wnhVO3umgJZIw
         T7TkI+lx8157Q8/KsiH2XWToVd3uGEPMfAUIfZbEHVqisrTSNiUhgmN/Vn2Rb/U4dsIK
         W40w==
X-Gm-Message-State: AOJu0YzRiWH7ON/g3GlfQo1DushgA835Ga2Qe+uA7E/TI9JF2mpYSvUd
	SgpdNuqh4PQgSRtO7Zs7RFEa+TCwjNtVS34/PpNxAorRdezdJoqsrOPDV3GCK6qrJqg=
X-Gm-Gg: ASbGnctlN/dqiXZ6k8Jm3IDwefUDEqfp3Xw18QJR9Es94E7ySI9vUIK7s2UP2h1Hg0p
	plOPmnP06shWYpjyMMmQ2ER8T1CaGb7mwpXl9QGY6fAgdOKB7nDDLjboXi6uczDiC8rVfO0WIgx
	y6nZl9/2dZ7w6X/n4XaSZdJ4idENXSXxpk+c2RvQWY1k0HbfYLOaWqi/QWDysNznJhel2RD1Lwt
	jl0QNNc8BUbignTT1PyOCWwrGqb6iSk3HJhEZ2stN4Dxz+g3W8bwR4dthLaXQULlgPodna/eKH7
	dcHng/FCva0IV45gNwEiNK7RGV71L01UMKlhOxwkeF5d4tyh45Wp+yh32gHbs0tNsY29tFJJneL
	wdYAjvq4+YgqoByv/FFtmowitM9AgTJJ4FerNMjrIe8Y4eNH+NbHeBBgotKpAWWrgQia2rVTjOx
	mBIpqD68fMAX16dwiiuMm96rqBT1djDO7LsWNqm+IEjCXBu8/YVVwZ
X-Google-Smtp-Source: AGHT+IFc3Tyo5Ai1EPE18jNuD1mi3IzLZtTNX0BmhIv38Tygj+IiqVox+H1udGbQDhtv8YRZXbtA7Q==
X-Received: by 2002:a05:6000:2a0a:b0:42c:a449:d6ab with SMTP id ffacd0b85a97d-42ca449d9b4mr993180f8f.30.1763370679961;
        Mon, 17 Nov 2025 01:11:19 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d631:aa74:9313:e9f3? ([2a01:e0a:3d9:2080:d631:aa74:9313:e9f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f206aasm25374870f8f.40.2025.11.17.01.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 01:11:19 -0800 (PST)
Message-ID: <614d29e5-b662-43fb-98c0-e3dd0efbe25b@linaro.org>
Date: Mon, 17 Nov 2025 10:11:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 6/7] mmc: meson-mx-sdio: Fix indentation in
 meson_mx_mmc_irq_thread()
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ulf.hansson@linaro.org
References: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
 <20251108231253.1641927-7-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20251108231253.1641927-7-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_011121_994293_2BC286E7 
X-CRM114-Status: GOOD (  12.88  )
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

On 11/9/25 00:12, Martin Blumenstingl wrote:
> Keep the second line with arguments for dma_unmap_sg() aligned.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/mmc/host/meson-mx-sdio.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/meson-mx-sdio.c b/drivers/mmc/host/meson-mx-sdio.c
> index 052bcf8f32df..e8b63dc45dd8 100644
> --- a/drivers/mmc/host/meson-mx-sdio.c
> +++ b/drivers/mmc/host/meson-mx-sdio.c
> @@ -436,8 +436,7 @@ static irqreturn_t meson_mx_mmc_irq_thread(int irq, void *irq_data)
>   
>   	if (cmd->data) {
>   		dma_unmap_sg(mmc_dev(host->mmc), cmd->data->sg,
> -				cmd->data->sg_len,
> -				mmc_get_dma_dir(cmd->data));
> +			     cmd->data->sg_len, mmc_get_dma_dir(cmd->data));
>   
>   		cmd->data->bytes_xfered = cmd->data->blksz * cmd->data->blocks;
>   	}

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

