Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B14CCA48B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6nGmaW43TFsY8203dyOJ+Nrc5EUvdzx8Ca6xsjCPHmQ=; b=ZedVjEBb54yrcYm09rtzd+5nvy
	7XL1rFXpNbC+hEMMTyI6RKqKRmiYBE6J+cF9F25pPL72qb43tju7rEu763yZf74P4uSNF+t1bVQWS
	hicoDDm+E6Ukbgzjo0VmTcnDOBCNj6kN3hphk5wCDVpdnShVjPg5AxvEAn/0S6UzMOQheIwjxM1Cj
	Rl0Es4LpY8rrL7ZqSHa7OgjiqonHdGBn+vB3H9wh6w1m4je2DJZi9vpwFfwt6B7q/G43veW3Qh0AW
	W41qRK5nkL+KD5seg5EeiVMe2iRRw7Nev5qBoDmwauzkqLnynTuHpaHUegD6FBk1qzpvYdQTvhBYN
	qopj/fug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfKJ-00000002fAi-3mYZ;
	Fri, 16 Oct 2026 10:38:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfKI-00000002fA3-1v8y
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 10:38:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6nGmaW43TFsY8203dyOJ+Nrc5EUvdzx8Ca6xsjCPHmQ=; b=QwGhWeJutuuDvVDYmP0gtyfjVK
	v8jU2oI8bWLywKa0wUAD2e/X4rrscrmen1NOFdHRGCp0xhV1lqwOK9i9ZjGCettNvd8+k+oSBk5my
	ou0G3/Kz8OnvIt4zDqDNm92KlvaPMD3P33Dem97WehMHib/fetVT85930KbFJ1KdWhJwEDLvbQJv0
	xY0j2H6B1LV+FILaIttpvcixos8ZgSJWyHq37kZTadaLGAAkY6jD3LlSOABzJZokCqh8WeFvPLlPr
	k/dMdTaC6ELv4UvCj8ro7cYU9kUsq7JGrGvMFDGffo72400Qn/GpS44B7d1eDwxg6vkDrBYu0ScKI
	SNGO4EsA==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHfKF-00000001OQN-0VEV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 10:38:13 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso46582985e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 03:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792147089; x=1792751889; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6nGmaW43TFsY8203dyOJ+Nrc5EUvdzx8Ca6xsjCPHmQ=;
        b=qSEMOPoy0di1fSChhX5qAZDyjRvOX0AUiXWTwUI+HNeEG39q0aIicyT5kuVKh4AYWu
         miw/EoeBRMo9LJ80udrgXGORd6MzuePFzB9mOvj+kPAdQhrcOiNCvak4tAQdM795jJUx
         qq52W3TzIHDe2lNWneTQ1iMv1NcPTxSr5k3o9wnopZn+NcASzIbLIzTzeqswPbej73aB
         0luznByx55IAplKd0tQzHLKIz6sPuB0k/Njm2AJOf71vfOe86yStfVArYFNQr6qU3Ts3
         kHOjwTBAsSN/cBeYAMgVKvnAO9tZ1CFUm3HHf+nDrSndLBU8AiRk4O0US9yeK/zoLuNX
         W45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147089; x=1792751889;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6nGmaW43TFsY8203dyOJ+Nrc5EUvdzx8Ca6xsjCPHmQ=;
        b=poeFBsd7/xE1u7IX80v36EGby5cZ5eXYLtejTONLBy9/ngHoJhQlsNDXSg+VYC5Fdt
         uxSJvMGwd02Z6znD8Uuuy0dnV8jfgFPKudh3gfiRonAM6+hCs/ct4ueuNcu98cT+0VXq
         w6HWqi8SCNI/rd+G41kxypflI9bCkZusKaPmoXYIyspbZsJ/qOjwsWhxTz+RlYs8yM1L
         hvm8uBxXjHV8Kk38vQkaCle96lXa8k12pTlmlvyIgNP6J+agnonpIpVGP4t/HdTNN8++
         ikn9FUSbQXGgp65deBs0OzbejFc7xhjoeR8Pv0dR8JAtMJfIwCwFj9T/sZJZWA8A3pCs
         gh4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzg3mhbnyzJPudr+Sgl8guzL7lRhbqfaonv+eMKgI6TMhKl2/FEGROR01QvxfaychYR64bZMlj0Pwlzw44E9uCy@lists.infradead.org
X-Gm-Message-State: AFq9FYLnUSAmwXUtVBJuBwCV4rTPUWp+sVLUxM+cMLZHC2oGoddQaMVE
	1jN6xm+YNbfGvAy+s9UQXovlOEOr/t0OX92BPkicz904gE+tFiJrFfPewIOvEKpDWB0=
X-Gm-Gg: AYBFou2SBmZMoIYhTOhletVNPcdYIg7783wHaHOE2rki5ADRU+W+eNnG3KEqzDxuYA/
	09Tjk5OHjyU8RkLVypgit/7hRxKaciDia6HPtoF0snt1ItR/ub5I2mjaMjWbQrmV8ClnvcH7bD1
	RN+HX7tCNyBlvs7DuWeKDRDH2S5ep4ztYfFqpqU2qXaloDCR4oPp67h7zs5uZ6/1YU6lcmKnc1g
	yPsiOR5Ma2WTas3W43U1JnL6qRYXQ8/mOrbEHZ5aA8XKMiJ5EmKlSvat8TDDDeg1NW2hc7rXpCE
	jzlW0T/Cdb6bIgNwYP+8zNBeyWlD4GK20VPdDfP2e32otUZ0eLWpVh0XtmVvVDJP46PXhXuQUXv
	vSMX0MW7N9kCMeSo/Iv23zMVnjEmxv1FrfevDSs+/4a8TaWZdDzQslM0EsX4TurWQHff6MCZgbQ
	5pVqFv4ptQkOW70LeIpEp6QvtJwbyTEEgien7ZPBXoxlz0hWUWz6CFmMkw1bTcSkR17ruCe2PU6
	5xxrgeGGZc=
X-Received: by 2002:a05:600c:1c23:b0:4a1:cef3:fb3a with SMTP id 5b1f17b1804b1-4a1cef3fd00mr28299025e9.9.1792147089174;
        Fri, 16 Oct 2026 03:38:09 -0700 (PDT)
Received: from [192.168.0.167] ([109.78.92.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce02d619sm26430935e9.3.2026.10.16.03.38.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:38:08 -0700 (PDT)
Message-ID: <b4a76677-0929-44bb-9c94-7ceb09952168@linaro.org>
Date: Fri, 16 Oct 2026 11:38:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/8] dt-bindings: phy: Add PHY_DIRECTION_TX/RX
 definitions
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
 <20261016-dcphy-rx-v1-v5-1-e63b49eabe2d@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261016-dcphy-rx-v1-v5-1-e63b49eabe2d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_113811_364191_7D9BB16D 
X-CRM114-Status: GOOD (  18.09  )
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
> A MIPI D-PHY or C-PHY can be a transmitter or a receiver. Some PHY
> blocks have one of each and can use them at the same time, so one PHY
> node offers two PHYs. The existing cell, PHY_TYPE_DPHY or
> PHY_TYPE_CPHY, selects the mode of the whole block, not one of the two
> PHYs.
> 
> Add PHY_DIRECTION_TX and PHY_DIRECTION_RX for a cell that selects the
> transmitter or the receiver. The first user is the Rockchip RK3588 MIPI
> DC-PHY, where the transmitter serves a DSI host and the receiver a CSI-2
> host.
> 
> Suggested-by: Michael Riesch <michael.riesch@collabora.com>
> Link: https://lore.kernel.org/r/7425ac83-f6d8-4443-a26e-a47f9306aa24@collabora.com
> Signed-off-by: Jason Yang <jason98166@gmail.com>
> ---
>   include/dt-bindings/phy/phy.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
> index 979b5dfd8353..9ead74d9a172 100644
> --- a/include/dt-bindings/phy/phy.h
> +++ b/include/dt-bindings/phy/phy.h
> @@ -29,4 +29,7 @@
>   #define PHY_POL_INVERT		1
>   #define PHY_POL_AUTO		2
>   
> +#define PHY_DIRECTION_TX	0
> +#define PHY_DIRECTION_RX	1
> +
>   #endif /* _DT_BINDINGS_PHY */
> 

This looks like a neat solution to your problem.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

