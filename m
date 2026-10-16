Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C57CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C4YkMEnEcFAsesSJUaufOq7VhqrmQqlZmujS8ZU12sw=; b=EVKqWaeXzlI1gRMAn7KcEYV/aq
	1HsebYNp7o4WPvoJH2hawIey9G1ryqm+E9oyE5dycp8KzFABkHk08EtzKJR7rDhkMxXQyaOuzCnvX
	WVkz0944tDaN1Dk5EDiX/38ynM4qmwmB/onMxRrS5fzsRJ7vkpV+iA/UTZMM+l548uQQSWc8aFICa
	h0vdYod3JDFzc8MbAVXyFcTl2H2XlX9u8OGsVpg/Rv1TEa+Af9Y+RwXa9Q6OuHPaH37Q7GinAwS6W
	PnQLAAJjSDpKpu/oXFr+0x6BCoJElKb6ZAhuY4JLmXOK+JESfjDjJ4LaDQtyNXnM0S1bhkEaLr2If
	I4wdgeqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfPp-00000002hHu-3cdP;
	Fri, 16 Oct 2026 10:43:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfPo-00000002hHY-2ySk
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 10:43:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=C4YkMEnEcFAsesSJUaufOq7VhqrmQqlZmujS8ZU12sw=; b=kURA2vo25/m7MygP8q4xjQfS6F
	uI7afq3i8mNPC0EvyW06Lh7l2+eBBZYesQDG609B27+c9sh6Tkdcgc5uvG8W0lfJcBKsfuhg6fdTh
	4+KsWcBwvk/GZ3//TI38iToD9RouqsGnhTcXDJZp4ohP9e6JNOVUefJh2jKz123xjmjD1yDJYOj2D
	DZmDgn2xY5EopjWxjnwISIlVN89RexhoXPjy6kuuVB01fS+zh3KuAG1ZVHJ0Iliv8PZwbTfWDin7p
	DKqhQkpo98+LMwssVHtHnhSf9lvjH/13XL8Kp1RfvRjIbS7eV2//1h4lMWqq88oZhae4P8PZdzPUO
	NgbawDsg==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHfPf-00000001P4G-2uLE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 10:43:49 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a1af482519so6999875e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 03:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792147426; x=1792752226; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C4YkMEnEcFAsesSJUaufOq7VhqrmQqlZmujS8ZU12sw=;
        b=JnLOtINQkuc89/x+8oAm+JVtma69/HdhGSkl9Mo5Ro2uvYWgdaiTF8Om/Pp0bw5kfd
         MhEyNR4BUMMny3hkz/mwf1Mz3LcQEJDDSGijopXnYXJXcf30dMMV7DrEFB1176HUPX4A
         lEqbjNZ+fGgGUVpPB6BVYeyI++tFo90pNOvW+f+MBWTs7tccqO1gYWReE6Mtb5lp1v2N
         zOpqIi/GWn5GnEf2Y2umIV27i0pthifJCHZqINqX4dZj7ik6gdEl0F0ZNamcs90Le5Tv
         WoJYgU/CnjfWSvvjOiytn8B7cnUOUBF44EoKN611430exWrjNqZyJwoKkSYb28Evu75X
         o2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147426; x=1792752226;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C4YkMEnEcFAsesSJUaufOq7VhqrmQqlZmujS8ZU12sw=;
        b=oMZWP5ItZw5+Rzc/WTjDDdeEvnkS60oIqaBORY7y2JDiFA8wDTea/F2AElJAg96t6I
         1d89Skbv5+lcjkPDxMOhk3hd3Bxl0RloiT/urQhPwgf6fnvFmWhmKdpcV8ZOORPXooEJ
         z40qMhRlKu7w9TwgreXbTfCezvBdL/ym08zQVqJ7fjJ29Aymawsh5ClkrWnsTQnctSoN
         M+8WajkL3kWZUYGGwAVLrAOsjNDaLA1OatWUT1xbtVFFxZPky/0MWnuejIcAzXBXmqMu
         UAurVLD5XF828nJw6xKvm3gsrv+6aSJsaLuSxj30vmmCH2Ekbhe9zxLqzPYROlVofVyZ
         L2HA==
X-Forwarded-Encrypted: i=1; AKwUvBzAbyCmaVchOW3Td0iDsjSOa3z6u6xI1xSPXV/+kOsO5ZvrH87ZEEIQaP+qLRFNMuLhwU1fwUhKmb9hBxfszGRl@lists.infradead.org
X-Gm-Message-State: AFq9FYIUqyijHeZm+9fVmAFpkwwBCt8lGwVYI2PE+kDctjyXg3VB3nS9
	2ywp42E2fQKIGtpoHBi/tKPXNLuv+/gyShV0mqKp/8fPedGVAC8VUrP+TcGzmazoWQI=
X-Gm-Gg: AYBFou3bwF4oAsrTJWKyfcnC+rWYhSLbCgN13e1XmIz8w52CLklPkF/rXsPuBSRdZS6
	e4lCq1t+iLiZKcxhziPlFwGDHFkxyC23OYSc5Yqzo4axG9C9Qhrq17+joBy1/CA9ufERiBRYfjg
	9ozYI3CANwzz/HUnaQhmbDK3OLt2u28owmoBrn6ElXttS0yikZpjVlf0b1jbCvFF76zZuAXIdzH
	ZYlr4XxbolALdHfERjXNY2jw85FNmMj1kd+30iAx8G8Q4+509ypb6VXsM7QT70HIXEmKv0jLFmr
	7fhmdkrZzu/y1bSQpO/O31myVGJEpVs6dtkl4eBzwShgM8pD/F6e5Q5+O7Ub2GusbQ+loLE79A2
	wxDBvjadQbi5AxiM6GsCHHGdhv3OA0pWf0FDaPeW9Xekbv5d8OcvOv1dpTKJrO+kmpYJgBJ7rb9
	Ygb1P//DOzvP4CvfeNMUdbhbZZnHuEZz9//HLKX+PPM3cEUU4rTiNw4Mh7WzOxXeMTq8sjtbHez
	Tps4CI15eH+
X-Received: by 2002:a7b:c3c1:0:b0:4a1:8849:17ae with SMTP id 5b1f17b1804b1-4a1c663b460mr49457595e9.1.1792147425952;
        Fri, 16 Oct 2026 03:43:45 -0700 (PDT)
Received: from [192.168.0.167] ([109.78.92.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f9c41sm4500725f8f.38.2026.10.16.03.43.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:43:45 -0700 (PDT)
Message-ID: <f337f41f-2ada-4958-b0f9-379e78e96a3d@linaro.org>
Date: Fri, 16 Oct 2026 11:43:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/8] dt-bindings: phy: rockchip,rk3588-mipi-dcphy: Add
 a cell to select TX or RX
To: Jason Yang <jason98166@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <20261016-dcphy-rx-v1-v5-2-e63b49eabe2d@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261016-dcphy-rx-v1-v5-2-e63b49eabe2d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_114347_838984_571DEA05 
X-CRM114-Status: GOOD (  26.28  )
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

On 16/10/2026 09:56, Jason Yang wrote:
> The Samsung MIPI D-/C-PHY block on RK3588 and RK3576 has a transmitter
> for DSI and a receiver for CSI-2, and two consumers can use them at the
> same time. 

Two consumers use them - which them ? Two consumers use the receivers at 
the same time ?

Its minor but instead of "them" define what the them is.

The single cell of this binding selects the mode and refers
> to the transmitter, so the receiver cannot be described.
> 
> Allow a second cell that selects the transmitter or the receiver. With
> D-PHY:
> 
> 	/* the MIPI DSI host, driving the transmitter */
> 	phys = <&mipidcphy0 PHY_TYPE_DPHY PHY_DIRECTION_TX>;
> 
> 	/* the MIPI CSI-2 host, driving the receiver */
> 	phys = <&mipidcphy0 PHY_TYPE_DPHY PHY_DIRECTION_RX>;
> 
> and with C-PHY:
> 
> 	phys = <&mipidcphy0 PHY_TYPE_CPHY PHY_DIRECTION_TX>;
> 	phys = <&mipidcphy0 PHY_TYPE_CPHY PHY_DIRECTION_RX>;
> 
> The transmitter and the receiver cannot operate in different modes [1],
> so the first cell must match in both consumers.
> 
> Two cells describe the receiver as well. A single cell keeps referring
> to the transmitter, so existing device trees are unaffected.
> 
> [1] RK3588 TRM: section 22.1 (overview): "The TX and RX only support
>      operate in the same PHY mode."
> 
> Signed-off-by: Jason Yang <jason98166@gmail.com>
> ---
>   .../bindings/phy/rockchip,rk3588-mipi-dcphy.yaml     | 20 +++++++++++++++++---
>   1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
> index c8ff5ba22a86..6e8cc56e4986 100644
> --- a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
> @@ -20,11 +20,25 @@ properties:
>       maxItems: 1
>   
>     "#phy-cells":
> -    const: 1
> +    enum: [1, 2]
>       description: |
> -      Argument is mode to operate in. Supported modes are:
> +      The first cell selects the mode to operate in:
>           - PHY_TYPE_DPHY
>           - PHY_TYPE_CPHY
> +
> +      A single cell refers to the transmitter and is kept for existing
> +      device trees.
> +
> +      The second cell selects the transmitter or the receiver, so that a

The second cell, if present

-> you want to make clear it is optional.

> +      MIPI DSI host and a MIPI CSI-2 host can be described as independent
> +      consumers of the same PHY node:
> +        - PHY_DIRECTION_TX
> +        - PHY_DIRECTION_RX
> +
> +      The transmitter and the receiver cannot operate in different modes,
> +      so when both are described, the first cell must match in both
> +      consumers.
> +

Not really related to this patch but how do you envision that 
requirement being enforced, per driver ?
>         See include/dt-bindings/phy/phy.h for constants.
>   
>     clocks:
> @@ -82,6 +96,6 @@ examples:
>                    <&cru SRST_S_MIPI_DCPHY0>;
>           reset-names = "m_phy", "apb", "grf", "s_phy";
>           rockchip,grf = <&mipidcphy0_grf>;
> -        #phy-cells = <1>;
> +        #phy-cells = <2>;
>         };
>       };
> 

Looks pretty good to me I'm interested in adding an RB here - please 
include me in CC for next versions so I may do so.

---
bod


