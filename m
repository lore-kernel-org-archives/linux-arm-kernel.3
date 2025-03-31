Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1020C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 13:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/rYByIuq0b2PjmjfZxltk1e0AePkOWa/aML/nirCPWw=; b=gBpuTpZdSXXHKZkvaFpV49Wl97
	k9fL7seblUjS6nRMaWIqpUjLi1xCwIt8E1L4sUydiEsZ52M0KHcLokOsCzHa+yDAmg4DjdAhDgZI5
	ggMLn+Ht64/ej/H50iftKOcuK/w17+2dGJRMKm8BX1H0IDKzgZPfVJmH/WdrB4TRYfFgD6rsBE/7u
	E9E5/fd60GeJz0rzTje2Pexr3cLLpgynMA58xZmgxPa2SLnk4lLnk1GsOR/cV2Aczo9+fLZEEaQBf
	aGB9pHmU3uUJtDgm/eir07QmPUhkewlYGHxLzuGhjUpzFIsSYHYGYdzzE3oGNmlL60nOMRu0ReaHH
	ddTmgLHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzF7H-00000000RDQ-1sTG;
	Mon, 31 Mar 2025 13:23:51 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzF5Y-00000000R2n-31K4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 13:22:06 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so30316945e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 06:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743427323; x=1744032123; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/rYByIuq0b2PjmjfZxltk1e0AePkOWa/aML/nirCPWw=;
        b=oOUTVP2xpMYxkrEmQzms/6bgEyCs5j8tFuAfuyol8AMwkPp44/dEbp185UXZaHsvGd
         Lll5hds0y/VFJ3Nz/zI7kh1K+5a6bsDaY0SReD0lZ3WIvHz3kU4dToB4X2pqQn3yfd/s
         IIJ3yEBRj8s8VwrIUXI7HoVwtVD30iWkOF7vNPj0edcBiRT5H6MYAaooxza7YOW/fuhC
         8A6eiCwYqFL2Zxofp1nW97x+/wzhe+xw02VsEvmrcI2MpzgMyepn1GiettHh7fmUWuFK
         jxrTD5In+izDBGHxS/xK+twbqeGxrUlCo/d6o/TJg6V4qfWJ+69ABcCHZJm4Nv9Ks+rQ
         5ZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743427323; x=1744032123;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/rYByIuq0b2PjmjfZxltk1e0AePkOWa/aML/nirCPWw=;
        b=gccTQuwM2GmhLUfPQ0cXgZygTVFPJ42+1lcoXsdBf/6d+fxEWIlkOIPpXVHRBQckbP
         pDF+ai00iL8cpxsmzjUS4qo/iYjpdXzzHmgbeqYvpcd4BJbryNYRuCSIK6wY8KoRsldz
         NJpT/E0MD+Z9vNgCBlxbmbUJ1sJKQVsJBbx3t2UJ440yngBfymUJYQo+M+D6VxruKI3s
         EtgsUS2IVMT+GjJ+wjBPsFHuJeXAqhOI46/LtGfArpugeUWS00JRgEn0Ge9aPoxZ3Vjz
         8xfntvazg5c8gJ9IQgO+kelFnjVPQ7LQdUlb0FpSTiA0ZuymG2QGstvSwFscrSez8V0B
         9ipA==
X-Forwarded-Encrypted: i=1; AJvYcCVEGcCPKbDoEV9vB4UvJG+6YyoA23IPTL9iNdYvnJ1aLNVfM9zCEPxR4kd5gYOvlAEb0/l0gZcQGAkzsm6AdIRm@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0UJoXzReWDW97aIt3Kx4gAnwmITapt5KSTKBkAJJAyVggUAb6
	hvLRm9ZIrHv6Rm/tilWya/FwQ/UYVz/PFiz6bHjTIu9Bip16i/MiNCeDG34An9Y=
X-Gm-Gg: ASbGncvuQwqqJTuV0z4035SXgt1MjPqAIB8LgwjIJsGSvSdSfWbHkqEMcFkr8J5eA5U
	QBuTHYznPlTAaAwJydV+dpXSyqPpTfUCPMLJRvRwoYk2UeonTr3bKVeCK3WxLHEEKUrFZWtgUSm
	HBEeoxcxWNQgItZHWhMC7JheEYLX/mqO6iaDrm9lQZ+fc9qAQLh/l/UMRMyS6YFGcSZgIIIpBX7
	+HMuNGyoRSreHm/kCGNGLvDyNcF3wZThyhMGVtBF/WBE8oV+kUov7yRX4p2aCuMzR5rGLfQZYve
	EAU8kLhDUQkHlcFQdD3CW5t0MWZmHOFrX3CF4+9tTi0rdoy3awyqLBxTtRZ4JtZj1i5MNf3qySr
	GsO4ZLY7fG7LeVTvw
X-Google-Smtp-Source: AGHT+IHUVZ074JKaAb9ncND8Uu7WRhh2YlGnAcHVleffCEEVTpj1+nUfZQDJb2JS+yVkEbfZ4DlSNw==
X-Received: by 2002:a05:6000:240a:b0:39c:142c:e889 with SMTP id ffacd0b85a97d-39c142ce891mr6232553f8f.27.1743427322771;
        Mon, 31 Mar 2025 06:22:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:143:2e3d:45f1:fd2? ([2a01:e0a:3d9:2080:143:2e3d:45f1:fd2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a4346sm11469954f8f.95.2025.03.31.06.22.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 06:22:02 -0700 (PDT)
Message-ID: <7c986d1f-315d-4cb0-b160-ee1f564c26c4@linaro.org>
Date: Mon, 31 Mar 2025 15:22:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] net: mdio: mux-meson-gxl: set 28th bit in eth_reg2
To: Christian Hewitt <christianshewitt@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, Da Xue <da@libre.computer>
References: <20250331074420.3443748-1-christianshewitt@gmail.com>
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
In-Reply-To: <20250331074420.3443748-1-christianshewitt@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_062204_779464_365EDCDB 
X-CRM114-Status: GOOD (  19.61  )
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

On 31/03/2025 09:44, Christian Hewitt wrote:
> From: Da Xue <da@libre.computer>
> 
> This bit is necessary to enable packets on the interface. Without this
> bit set, ethernet behaves as if it is working, but no activity occurs.
> 
> The vendor SDK sets this bit along with the PHY_ID bits. U-boot also
> sets this bit, but if u-boot is not compiled with networking support
> the interface will not work.
> 
> Fixes: 9a24e1ff4326 ("net: mdio: add amlogic gxl mdio mux support");
> Signed-off-by: Da Xue <da@libre.computer>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
> Resending on behalf of Da Xue who has email sending issues.
> Changes since v1 [0]:
> - Remove blank line between Fixes and SoB tags
> - Submit without mail server mangling the patch
> - Minor tweaks to subject line and commit message
> - CC to stable@vger.kernel.org
> 
> [0] https://patchwork.kernel.org/project/linux-amlogic/patch/CACqvRUbx-KsrMwCHYQS6eGXBohynD8Q1CQx=8=9VhqZi13BCQQ@mail.gmail.com/
> 
>   drivers/net/mdio/mdio-mux-meson-gxl.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/mdio/mdio-mux-meson-gxl.c b/drivers/net/mdio/mdio-mux-meson-gxl.c
> index 00c66240136b..fc5883387718 100644
> --- a/drivers/net/mdio/mdio-mux-meson-gxl.c
> +++ b/drivers/net/mdio/mdio-mux-meson-gxl.c
> @@ -17,6 +17,7 @@
>   #define  REG2_LEDACT		GENMASK(23, 22)
>   #define  REG2_LEDLINK		GENMASK(25, 24)
>   #define  REG2_DIV4SEL		BIT(27)
> +#define  REG2_RESERVED_28	BIT(28)
>   #define  REG2_ADCBYPASS		BIT(30)
>   #define  REG2_CLKINSEL		BIT(31)
>   #define ETH_REG3		0x4
> @@ -65,7 +66,7 @@ static void gxl_enable_internal_mdio(struct gxl_mdio_mux *priv)
>   	 * The only constraint is that it must match the one in
>   	 * drivers/net/phy/meson-gxl.c to properly match the PHY.
>   	 */
> -	writel(FIELD_PREP(REG2_PHYID, EPHY_GXL_ID),
> +	writel(REG2_RESERVED_28 | FIELD_PREP(REG2_PHYID, EPHY_GXL_ID),
>   	       priv->regs + ETH_REG2);
>   
>   	/* Enable the internal phy */

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

