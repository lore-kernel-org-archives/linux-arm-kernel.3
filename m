Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3077EF0181D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 10:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDramHPwwOtrk7+TNdEDdypzFChqVP3oIoB1XiKknTY=; b=IK2GTX1SHABF5fgRbfREIiwIWA
	2kPfCqHbQB9w5KjS0XQC4GGUV30jG8eQBXwM3EB1dP/3HefBnSU4aXVzVYLwnA/GERjsIUad/5USW
	wYdJcHYFrLPdi0CsmQ8zJzE3dGXnbACokbarReCWdsxV7vHe07YxkatQL0Pe9GqZLJzuAjVoKuTwv
	VumE0v5VFdtfZYN49G8xLGykwYvOjGSuWOKaoXNEI4cTA9FHv5mO8Kk/obTQK6fzDdUhU5T3+qv5Q
	u+UiNHsYq6V1TZUrJQynsADNnG7s7rRV7cx3t36Rwb5Vnh+nid4c9545h5qQeQ4MVLj8s0txccHqR
	S1XNgGfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyS9L-00000003Q5z-1HIX;
	Fri, 06 Mar 2026 10:11:15 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyS9I-00000003Q3F-2TiC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 10:11:14 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-48379a42f76so78936775e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 02:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772791871; x=1773396671; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bDramHPwwOtrk7+TNdEDdypzFChqVP3oIoB1XiKknTY=;
        b=bybrBCwcfbq/UBWmhWVjCYvPOP6rw7Ng935VsWNVdzgeB97Km/aYtsIUg2fMrye1Vv
         AbRDHB0ahasgDRJEsvIxr9EjVOv2Nvnn7CFDWsvCwtWue0O7k4Pi+YcOcO33ewq2STj/
         LAywkhmFzs/9D4r5n3kV1sup5+6LI4ZZ7x2tqvHCjZ82PAOAdq1V9CQN24/TTV7VQ8js
         th/7XXwh6BD2LaSkCi45hQEngWXTiEgdofufkdi72gIzUhDvLSCwh5QY9RtP7KOGVnIP
         4let6LFRC8mA3pyS2UD0vBgvJ2v0T+OtQrnnfW4lMdvVfrTMoEXHCsOc6OSb/j5pWi52
         fccQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772791871; x=1773396671;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bDramHPwwOtrk7+TNdEDdypzFChqVP3oIoB1XiKknTY=;
        b=onxK6qT45msNyhNPUDe+bmNgymGChH1ev7YroljM5g1LpQ/Vm3sdcJffhJPfuwmkaq
         oXXptqh+sR5iYu9C8WdLSD8I+iyIjPgaA3udbxGJMGhUPwQrQClEI56+6ugscRAwWTI+
         stmKXYw97T/7tjsHraXAnBoRTC9o1dig9fGjnu2y1m/tG19o+FkXE5HUoi27FMY1m48b
         TVlKiGiatpKOtvvJfmVPt+ozRNN73hK5X9FFIJQnX1yduqD9JeUi6FJWeYTWxtja4CRt
         f4uSuBaNDjOsGG+KsOe5xXV3dRM2Qu7c7d4Q5tvdBXwmufut5p3DL6lr8i8onLa+iEQp
         lTNA==
X-Gm-Message-State: AOJu0Yz9nfK67CZCtqtowP10xA0eiJx+lOx0UnBojEFZTaWCN7btAVIL
	BYwan5/5GdeF0Opzo0bpPBsmKZAIQcNYMUIYF7qR4k7o8TAqjZb31nCCPfvFjlWTrgU=
X-Gm-Gg: ATEYQzwdbMMo8w88flYKi8ChpHaRG+8/U4O2j5j2lFSpYCAwvUV98tY84YA9gAsn2BB
	D/B4MBj+4pGTu/RDikEXNCWnQxkTH0vEEtLE2Fc09ixbNZ//nXiw+i1wJWWzkw3YrBQ3o/ZlmpP
	sclLQMXWO3BGbR+pCTDouPbIaUBh0gRjgEYY+Jr+uv8I68c9OqA1wWUulFYD+o05feqx4s95by1
	JWghq0GIajWPiSTCJHr1fk8GNgcLFgLgGCSa93KdrEqx7DuDPDKWjWRRYMGBeV43Pu2SEAgSFhp
	tNa38wLff9eyfmdsZsEGNTvp2DRwePgUFGWL4sLfO1g80fM7gPa3X1+O75fmnpervQiIf2H0byo
	4FKM2vr7x/mD1PgKciLYBZ9MFX8FYwDQae33tvw/3L8o/GTt3yV9CvSbcDNI960U2TY9msH0gye
	bnladt7sTBZysTJicj+NiHWqqfe5eBzJ6CVJof1VTW5CceEQ4oTqCRlYPjMDIUlHbD/nyGBrA5t
	ueY
X-Received: by 2002:a05:600c:609a:b0:477:63a4:88fe with SMTP id 5b1f17b1804b1-48526919691mr24609515e9.2.1772791870474;
        Fri, 06 Mar 2026 02:11:10 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:cbfe:649:7f17:8b95? ([2a01:e0a:106d:1080:cbfe:649:7f17:8b95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4852967d9f8sm1234355e9.32.2026.03.06.02.11.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 02:11:09 -0800 (PST)
Message-ID: <ec8d4eca-c130-4100-9fd5-b8597c4a1c2e@linaro.org>
Date: Fri, 6 Mar 2026 11:11:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: Fix GIC register ranges for Amlogic
 T7
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260305-fix-amlt7-gic-dts-v1-1-5944415c74bf@aliel.fr>
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
In-Reply-To: <20260305-fix-amlt7-gic-dts-v1-1-5944415c74bf@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_021112_665767_BD27C433 
X-CRM114-Status: GOOD (  18.53  )
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

On 3/5/26 23:11, Ronald Claveau wrote:
> This patch aims to fix the GIC register ranges for Amlogic T7 SoC family.
> 
> - Context
> Kernel log shows a warning about GIC
> [    0.000000] GIC: GICv2 detected, but range too small and irqchip.gicv2_force_probe not set
> 
> Using cat /proc/interrupts command shows GIC as GIC-0
> 
> Adding some peripherals sometimes causes hangs on interrupts.
> 
> - According to the GIC-400 ARM doc, the memory map is like:
> 0x1000-0x1FFF Distributor
> 0x2000-0x3FFF CPU interfaces
> 0x4000-0x5FFF Virtual interface control block
> 0x6000-0x7FFF Virtual CPU interfaces
> 
> - Identify GIC model from distributor register
> 
> Offset | Name | Type | Reset
> 0x008 | GICD_IIDR | RO | 0x0200143B
> 
> kvim4# md.l 0xFFF01008 1
> fff01008: 0200143b
> 
> - Identify CPU interface from CPU interface register
> 
> Offset | Name | Type | Reset
> 0x00FC | GICC_IIDR | RO | 0x0202143B
> 
> kvim4# md.l 0xFFF020FC 1
> fff020fc: 0202143b
> 
> - Virtual interface control register check
> 
> Offset | Name | Type | Reset
> 0x004 | GICH_VTR | RO | 0x90000003
> 
> kvim4# md.l 0xFFF04004 1
> fff04004: 90000003
> 
> - Virtual CPU interfaces check
> 
> Offset | Name | Type | Reset
> 0x00FC | GICV_IIDR | RO | 0x0202143B
> 
> kvim4# md.l 0xFFF060FC 1
> fff060fc: 0202143b
> 
> - After this patch there is no warning anymore.
> GICv2 is correctly identified.
> 
> [    0.000000] GIC: Using split EOI/Deactivate mode
> 
> Using cat /proc/interrupts command shows GIC as GICv2
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 6510068bcff92..d523cbc0ed22a 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -213,7 +213,9 @@ gic: interrupt-controller@fff01000 {
>   			#address-cells = <0>;
>   			interrupt-controller;
>   			reg = <0x0 0xfff01000 0 0x1000>,
> -			      <0x0 0xfff02000 0 0x0100>;
> +			      <0x0 0xfff02000 0 0x2000>,
> +			      <0x0 0xfff04000 0 0x2000>,
> +			      <0x0 0xfff06000 0 0x2000>;
>   			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
>   		};
>   
> 
> ---
> base-commit: c025f6cf4209e1542ec2afebe49f42bbaf1a5c7b
> change-id: 20260303-fix-amlt7-gic-dts-7dcc93e13612
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

