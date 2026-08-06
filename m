Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AA4C56205
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 16:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tXxkSVa+2eu05dZjUDlR4s5Kc7ssR4Aj7dZF9elDO2E=; b=pIsL3d9xUICaGq76wwJy1nckff
	GdZtaX2kEyQ9BXe1J9zX3g4MuY9qyV/P+FHjziOsWambIdrY4DjCan8dAVMHN2PsMGVz529nGxLO0
	/+IYbtYfE2rUSBAZijZZpEeLIFxjiAtuuxIAiejfdrDuMSMg//yMUBteUlcFooWVflX2eG2jpZSaZ
	dAJb74Bjj0+IR0WQPXcC3/P5yqNhI/vuxVzVGKM8qqM0uek4gqi6yHJgjctut/Yq1hvT+3w9oxqdy
	id+OKJHsxJbUPB6pFsjMrOS/MZ5DEbfRbCp5Aem4+YRlDHN4NzXHZWRrfrHW9816LwXFriTacTOzg
	7UwobWCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws0jU-00000006BJA-4462;
	Thu, 06 Aug 2026 16:14:12 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws0jQ-00000006BHC-4C4e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 16:14:11 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4956869750eso17893345e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 09:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786032847; x=1786637647; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tXxkSVa+2eu05dZjUDlR4s5Kc7ssR4Aj7dZF9elDO2E=;
        b=Be9Erh2dD9HdWqwqBBSCEhPp+dnk3W8hU/wgLxRqqmbAbKvxannE0jZnLVYVzPvO12
         R+npBcrayJ90aAe4q8GGrzknv0Xkx3KKJRg3yEc/1GSXMmYnkFJ9QkX4vWJuGlTA2ZFb
         SzF9MZsQBcf+5x/DHr0KMMsMx7BRedKfxKPfcPGShd/DbUIfOa0IhkIaHL+qMSu49uge
         e7V+XS1/lpy0GE9jvgUAoUuOqhE5hZ8Z07eBuFhTTzoLlig31mCxMP9Jq9c2SGnQ6IW0
         xUWo5sqhlyM1OXgaQDwFVHemkLYQVYHitjzaFlzNIf3lWRTRie2zQ3yYfmjVAPWQd7VL
         C2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786032847; x=1786637647;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tXxkSVa+2eu05dZjUDlR4s5Kc7ssR4Aj7dZF9elDO2E=;
        b=AnKHChMRMEWovJDuESklnP835uN2ZtcX1Tc9O/fj8jp3+0rtUcq/U1mxKW0Zl35OsY
         8UnNy2RAkp2siDcbZpjdzj05rcVAq0t4BUEx0+FL2VD3PxGanuwnODS1sMWzKDERA77J
         TF1eml+cIbHICGgjjqqi7w1U5C9x82lSmhsgWTdqmK/bAVeuKeVsj2XZbUJqYwauMmXF
         B0Hr1w5qqf8XGdg3+xmwBt+Oe5ARvZ2lZSqeo10ZlRj711gDShbr/v7kxrxdem2xJXCy
         YvkI4MY6ALc76cXoP8u4PJBUjG88lleMzIYEtQkm69L1/MPrlQWwTF2EbkjhmG9iQbYB
         RsHg==
X-Forwarded-Encrypted: i=1; AHgh+Rp2wzka4KiuMnxP1mbNenM3L7IWbyg+P1HUQbLib9+OsY3f/hWPDmANB3Q5MssuSOAvYqgua0/EbeTgoF4PjQj6@lists.infradead.org
X-Gm-Message-State: AOJu0YyW2I5gd+BkHnpnoaK3wkb4TCUXEh8hFKtWHi+OWctC9a+/7nBb
	VEbF/kM7vfE1P3aGPIvPuKzxAR/AaQUxwNduXU46vIlAUOILeRCPFbrj9VNI+uAeh+Y=
X-Gm-Gg: AR+sD10lG8PI+/VRRNycDTegW2nKs7huRZZ4mv7w1CKCYswAY6nA882f22o25JsfIe9
	fAE1uoB3MRPSzX/FQTDl2XFGv3bkE0kGnwl4c8sUsQhhCdyIYV1p3T9rb6WYvFjEHoRBIxGvbWx
	TmJ1lDtI3zJrCeuEdDcMcA2WsUAA1ItQH6gEISlKBbRq5tuoaCvJHUCD+6NbjMCWGxoqbw7hoBF
	qfXZv83f2kSFxytcE6jY2SlfdkADu6QfejPTuvR9hDjhyNY8bTcV/FulqcxQQSvZ1XQFeXcgDSC
	/FM0EEdPzNhYCGhbvUvtowdDRC1h+qKjeavcZqDqnorABaWzjhxHXQPKnu6fdPlM2lvYy3H0Kdz
	ANQxBMb5VSCh/xRMtbdXcdzLgKewJawX8NAz31APZ3M4fM0kQbwhfxyWDze9OO8892wolwzWGxR
	KoJ6P+OK0gdb3UVQrkkXfUzgYe2wSagHXSshF21HQiWlrF78o9OHWSYw6YVv4B0Fcxn+gCaZ8eo
	Q==
X-Received: by 2002:a05:600c:4ba2:b0:493:b6ee:fcb7 with SMTP id 5b1f17b1804b1-4994e7d3434mr142978515e9.14.1786032846564;
        Thu, 06 Aug 2026 09:14:06 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.115.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995421b198sm84909005e9.7.2026.08.06.09.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 09:14:06 -0700 (PDT)
Message-ID: <ccf41669-685c-4657-9ffa-7053719bd539@linaro.org>
Date: Thu, 6 Aug 2026 17:14:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: phy: rockchip,rk3588-mipi-dcphy:
 support per-direction phys
To: jason98166@gmail.com, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260726-dcphy-rx-v1-v2-0-cf9cc34a412a@gmail.com>
 <579EMzIB4QpX971YyewFrke7qDRTnb7VISWtBI86oM2PJpls9AOXn5nKFyv8PA9EiZWOiczXm9LbDAO8XTkrig==@protonmail.internalid>
 <20260726-dcphy-rx-v1-v2-1-cf9cc34a412a@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260726-dcphy-rx-v1-v2-1-cf9cc34a412a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_091409_057370_082C502C 
X-CRM114-Status: GOOD (  13.21  )
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

On 26/07/2026 15:55, Jason Yang via B4 Relay wrote:
> From: Jason Yang <jason98166@gmail.com>
> 
> The Samsung MIPI D-/C-PHY block on RK3588 drives a MIPI DSI transmitter
> and, on the same PHY, can receive a MIPI CSI camera. Describing both as
> independent consumers of one PHY requires the direction to be expressed
> in the devicetree.
> 
> Allow "#phy-cells" to be 1 or 2. The existing single-cell form still
> selects the PHY type and refers to the transmitter, so shipped DSI
> device trees stay valid; bumping the cell count unconditionally would
> invalidate them. A second cell adds the direction, letting a DSI (TX)
> and a CSI (RX) reference the same PHY node as separate consumers.
> 
> Add include/dt-bindings/phy/rockchip,rk3588-mipi-dcphy.h for the
> RK_DCPHY_DIR_TX and RK_DCPHY_DIR_RX direction constants.
> 
> Signed-off-by: Jason Yang <jason98166@gmail.com>
> Assisted-by: Claude:claude-opus-4-8
LGTM

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

