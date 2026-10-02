Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F6BACA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sisy7zZIPgc2KpxP76gexIt4R+mmsTYOynHiu3xxYkg=; b=laTqJYN4wm8tlPuOIGC0Uh8tCz
	0gifFE9/BJenHVg8JebivMQsRnXaX5xjHUKhbiHQwgDHz4LvkVimvCHUGDpIv0eet6DdNeSUJKZXT
	EjvCh7CXFNOdMaiVtBpUMHuA9S23FhZ6kjZt+/z0DtgfXJOfKCNPgvxl5PtSPCwZfLFFVF8qbcPkP
	MSnf5Qm6JVI73VjE664nWbA0CdoYtfLq450UJglBRX8GMO7U4dpSVdLJpIORjU6doO4uQv/eYHCeE
	xvDDoM2JxoltFbEz/MtcxamqG6IlLWQE5RfPRBoVxP/5l9TXo0KfYc+oHGjCe2Dew2eGhB8kjeBG/
	zUH+CXRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZTF-0000000B7oP-1E1s;
	Fri, 02 Oct 2026 09:22:25 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZTB-0000000B7n9-2vtl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 09:22:23 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-4a01ff8c098so11134965e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 02:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790932939; x=1791537739; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sisy7zZIPgc2KpxP76gexIt4R+mmsTYOynHiu3xxYkg=;
        b=nx6pwCEQhZAFtHQqwz0UD6wgibNhs98HBCeqthST0p+Vy1hXDM7HhMe4HU6UggSPxq
         aULs0NLVHdvWjIqM4qVpbrSpnUu6R5sbO/3LD6aw6KGnuPqhdFS/oEVNgXeg4cbYar4q
         zzxrHMZ/8q4+3siHUsW2wBlyQUKPOpw1WTU6z0dRLTa0N/wkzmIOYH/EwUIu0jZS1ZXf
         IdeWbUngQBsSTpaML+R1LJ1RdWe2snoRUSiZs1m/xrIZ5B/qBLOMjWTnlbljvUCoBVOJ
         jH4PJ0o882fNRyphtBJ36IUkw460c38fGdXyU4grhM3tQ7RWAHQXycVEbda6bvEdn2+H
         ljCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932939; x=1791537739;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sisy7zZIPgc2KpxP76gexIt4R+mmsTYOynHiu3xxYkg=;
        b=eVDJg/PswT7AV21GzJPFqUSNr7YsI03rarm/7rvdHU6sfzOXdrVYkKG7JK1+QJcM1b
         1/Z2qClnxLnr3PX5t1hexbcZkUExsweldcKPZCtXJQSPRdRWKLTAXBPUXKuYxaWlDVjs
         vMB55wWn5kZZafSDJ3xWgus11RZ5edDFqL6EQqkj4I1+3Iav2vq1Q40q5D3q37YT6JG0
         mcIgZJzTpYLjVvOss5gZr+nfrPtmxnf/Ios0Q+tnGOMW1LxCCAsJwoDbUO5MfjKsc04l
         JyQZbrE9aJrioVu+TzkppcPHA6SytB3igb2Om2P7bHGq0BcKS4LSbup6qXEY81XdTBi1
         H6+g==
X-Forwarded-Encrypted: i=1; AKwUvBzxdLux/WBH4/vzjqAFz+BBFExNdLx9drgYbcy4fRuRN+gw64l7M+/DRoPfhCLllI4lz0ZGSddn+uxY+PqldeN9@lists.infradead.org
X-Gm-Message-State: AFuF++nTtycvfmmHOqJvwv9IoleFfPo/PjKtecHewXbgTKRypHrypicA
	6PoytK4ydKO6RZTUObvVNHhpzf7ngt07tL568Lvs/dAy7nFRjSykwLX1+tZtfhnO22g=
X-Gm-Gg: AYBFou0J/8SozfuAoyQWWXU+JbkSuWUwFl490AxwLQkIa3RrXwJfLwI4C4Z1yaD8U3v
	6kzBo95kZtCB3tK/ZSuGt9+KQfph2BfiSvxrezSGSo44JoPwLz9YdMip3Z//OyiD/lmEtUb/3QB
	JZHfDTmLSISTcqx8H7Xh9yxXwGYav+k0v8v0rnsJM9SNy0o6hA7apk+SLnP0xR+Zqiw3bxG/12+
	PFHqLlstyX4cMM2GQnEgtV1g3XsgIQ5VGikgzhYyATWOOP0eRaLrbHxjMHHs69Tzx85Qu0GSxRS
	0E/owhUJFAok3qiVdeo6Ws3WCRS9w5P5lOAa7tnSsnr1h5nZA555UVxgEgkFWiqanWEtyabgu6V
	Pwj9Dy2oHOVKCH30tqRhPSaQZy/ZdCnBTlLgwNeYv53AIn+5xMp4GvjQ9w1YDougugFF0rJR7Ag
	HNqVhp83elAIHb/lSQzm+VwfTD15tBbJ8tdZJLjqOEoBuvOgwUYMq0SYyKe8kroTRAZlW5dlIPn
	0+fQUfuDmGP/XgQn/XviefSB3qave4NsPpQFV03/bG/FvHaGT8Y/uOcUxtwevo=
X-Received: by 2002:a05:600c:3152:b0:4a0:2500:2cd0 with SMTP id 5b1f17b1804b1-4a0275977eamr36418335e9.18.1790932939327;
        Fri, 02 Oct 2026 02:22:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:2f62:6d3:721b:8c9e? ([2a01:e0a:106d:1080:2f62:6d3:721b:8c9e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280d924asm71505645e9.14.2026.10.02.02.22.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 02:22:18 -0700 (PDT)
Message-ID: <97e7014e-69a1-4ac8-8278-9e3795b05553@linaro.org>
Date: Fri, 2 Oct 2026 11:22:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: meson-sm1-odroid-hc4: run the
 SPI NOR at 40 MHz
To: iav@iav.lv, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260930-hc4-spi-nor-v1-0-9a3351e2984e@iav.lv>
 <20260930-hc4-spi-nor-v1-2-9a3351e2984e@iav.lv>
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
In-Reply-To: <20260930-hc4-spi-nor-v1-2-9a3351e2984e@iav.lv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_022221_776224_B4633E1C 
X-CRM114-Status: GOOD (  19.13  )
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

On 9/30/26 18:52, Igor Velkov via B4 Relay wrote:
> From: Igor Velkov <iav@iav.lv>
> 
> At 104 MHz, reads return corrupted data: bit 0 of the first byte of a
> transfer flips from 0 to 1 part of the time. The same byte read as the
> second byte of a transfer was correct in all 100 reads. One 4 KiB block
> read 200 times came back wrong 157 times. Writes are unaffected.
> 
> flashcp verifies while it writes, so a bootloader update erases blocks
> it should skip and can abort halfway, with the flash half written.
> 
> The Hardkernel vendor device tree for this board uses 40 MHz. At 40 MHz
> the same tests pass: 200 block reads with no mismatch, and 14 flashcp
> runs with no block erased.
> 
> Tested on ODROID-HC4 with an XT25F128B.
> 
> Fixes: 7178f340e929 ("arm64: dts: meson-sm1-odroid-hc4: add spifc node to ODROID-HC4")
> Assisted-by: LLM
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
>   arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> index 5ce76a1bfe02..8f09f2b74bdd 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> @@ -144,7 +144,7 @@ flash@0 {
>   		#size-cells = <1>;
>   		compatible = "jedec,spi-nor";
>   		reg = <0>;
> -		spi-max-frequency = <104000000>;
> +		spi-max-frequency = <40000000>;
>   	};
>   };
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

