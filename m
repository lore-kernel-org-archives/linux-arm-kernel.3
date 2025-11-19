Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65C3CF2598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 08:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xBBcd3+nheVdQUVhqxqKoLH5dFTFqo2xtG50pxJYM/k=; b=rVtqKA1tURD4U7
	g1jC0mDSRTVNX1sYKK4xRr3BggZx260AduzxDt5KrV2DpctRSSSgwnt/eHzkZqRGGkR7wBA8C+9ZY
	qgiRL6drM5c3woajk0Y6lGKYNWjJCqzn/ThA5kYgAsVDgJr99JkqK4vkxDgamSUzGhOWkiy9LKWOF
	tHRqtQ4+LUsYrvMKvAItv+Yj3t3Gysn2pqL47gf3/QphK2YFmvkixRMdk0WwXJuDXm0vnbypxHntq
	omyvVWHihhrGqWJmDs/0O3xdFD51pKTeV6rUsIR3zRGS7ScZcGn/5aUd+L7vcoWtNBdPlU+XGSk8Z
	LQEs+cfwnHEvpw7iMTxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdVV-00000002mvq-3Xub;
	Wed, 19 Nov 2025 08:25:41 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdVS-00000002muU-2UEi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 08:25:41 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-42b3c5defb2so4341222f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 00:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763540737; x=1764145537; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xBBcd3+nheVdQUVhqxqKoLH5dFTFqo2xtG50pxJYM/k=;
        b=URT/sys9RL2TqxsBspGP19AqkblJtZZUIYi0gL9bcoH6bPwfRev/2sDqgBcA2k89EB
         zNgHfKkuiqOHyfBynCkHi4GXI2c1004FqviB+m7FTbGveSHj2yNOZ18PH3BSy03N31u3
         GqpW2ntzCRWGlou1dv4saNzThTfdtXOhxhwhjuijdioj/L/W277ktOvo9mOffnHRVCyv
         X1W9nI0XuIPC73W+h1PXTGpCB3dwWcgpPZR8fFzE21njE+2Xevf2nMD8MU9eR2X0r7dP
         DpoFK+xruazZ4GZRFiQNu55XGfXbzjQYKf8oaf7hw37a5w7bNmm1IjwVdHbCO2cL9LYh
         G8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763540737; x=1764145537;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xBBcd3+nheVdQUVhqxqKoLH5dFTFqo2xtG50pxJYM/k=;
        b=uPzZh9QsUNynv1Ptz3Q9OhqdLaN8/W7GK3Yc4LBOBMmQrwC1q/mBJWdJBiY3X93V0m
         cNUQLj1t5+556la19rzgXQUN96OuylpePapNiPv1GXtrNLPGXaxgMHuJnk07A0CMyZtt
         GVhyWJ4C0NHJ3XYch35QcoDIm5wzBJwspBBzseiG9wrnYf3fC/KBDejstJW7pSBRiRej
         nU8wq2Mt193A6PxiF5sQTWrwcWjPdChjCnqjc2JPvtvdQ7N6FhFIeSVNCJN8JfzXo1AT
         SsZWIfjn1DLllY4keotW0RdyegWWQJaNrdNC6vome9cJVeF3OCwD1hEaqn4RqMhl/eYg
         JYmw==
X-Forwarded-Encrypted: i=1; AJvYcCUM2pSLD67mrkBWHNiu/QBTSuE7dWA35zCVIubpCGRgTL24ZEBqkkgtRKrGre7TP4kD/X5Cy8jush99el54E+mG@lists.infradead.org
X-Gm-Message-State: AOJu0YwnPU8+7Gjp5WFZ9nKN8CgtT6tV506Y+OVN8RlTCsEEBTRxybdN
	kNfqEWO7PVI7whIjirkqPSUtwpY7up11Ds9X1267zr1qme2i+YuzvgSP03SPsqFkYew=
X-Gm-Gg: ASbGncu+ufDGJh83JznUbCB8SG7B/ZfbXp3tGEJ6lL5cZPgcArd+RisPKfo5xN0l7Lq
	rUBy9jxA66r2b/S3KQsFgV46lLZOSADvDrMzM/Ppqts/+PkfVEE1lbwc0VNTCbTbD5DmAi8i20Q
	GNmmsp1ixmK0VEDFKx1zrqv+NqbfNr7F/WKdJqFI1YV3r2Cy3+LDKSYY+tDaIrdVy/xCYe0ca26
	i//9kHuPKpytyoCtQenCQOWLPApTL841fO7O/1g5CbaocgT9DvfCeZ3PGYTPilkZJXuWaCDBtQE
	XA8ueLYCVOoVuAWys5GEsXwpQy2f3UXgXcjGn4MB4/4/0KdF7d//rYKLOr4zuDDhC6q5sDZamw3
	agb2KXCaeKWnaAgeRt0dqafopG3WwqKOOAblje+yivjkyAY4FC+7s8inQPyxgJdHBNpX8EtPDvp
	F4qrHNPZhnH38fmAT4aQW4mX9itgDjTX5UvPQ4z6k5tfnnq6htrMDj9ncgvqyDMII=
X-Google-Smtp-Source: AGHT+IF/Pf8OhHHAkH/l86ffTNQDrKGEqlTVtrpGBWQTevcyQWVHh3qnGd6Me/o5osf1E2M94f66fw==
X-Received: by 2002:a05:6000:24c7:b0:42b:3dbe:3a43 with SMTP id ffacd0b85a97d-42b5938fa99mr18992058f8f.50.1763540736555;
        Wed, 19 Nov 2025 00:25:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:94e4:fa88:414d:e1ad? ([2a01:e0a:3d9:2080:94e4:fa88:414d:e1ad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e846afsm35816408f8f.13.2025.11.19.00.25.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 00:25:36 -0800 (PST)
Message-ID: <25e9e2ae-d280-4022-8c8a-41df5009011a@linaro.org>
Date: Wed, 19 Nov 2025 09:25:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 0/3] Fixes for phy-rockchip-samsung-hdptx
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Dmitry Baryshkov <lumag@kernel.org>,
 Algea Cao <algea.cao@rock-chips.com>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andy Yan <andy.yan@rock-chips.com>
References: <20251028-phy-hdptx-fixes-v1-0-ecc642a59d94@collabora.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20251028-phy-hdptx-fixes-v1-0-ecc642a59d94@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_002538_656911_B7AD8ABD 
X-CRM114-Status: GOOD (  12.05  )
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

On 10/28/25 09:00, Cristian Ciocaltea wrote:
> These patches were initially part of the HDMI 2.1 FRL support series [1]
> aiming to provide a few fixes for the Samsung HDMI/eDP Transmitter Combo
> PHY.
> 
> I'm sending this as a distinct series right now, since the FRL part
> might require additional time for review.
> 
> [1] https://lore.kernel.org/r/20250818-phy-hdptx-frl-v3-0-c79997d8bb2b@collabora.com
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Cristian Ciocaltea (3):
>        phy: rockchip: samsung-hdptx: Fix reported clock rate in high bpc mode
>        phy: rockchip: samsung-hdptx: Reduce ROPLL loop bandwidth
>        phy: rockchip: samsung-hdptx: Prevent Inter-Pair Skew from exceeding the limits
> 
>   drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 27 +++++++++++++----------
>   1 file changed, 15 insertions(+), 12 deletions(-)
> ---
> base-commit: 33bcf93b9a6b028758105680f8b538a31bc563cf
> change-id: 20250902-phy-hdptx-fixes-7308ffea4c6a

For the serie:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

