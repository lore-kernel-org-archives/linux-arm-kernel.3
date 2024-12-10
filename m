Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3676E77182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 22:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mRVZK5OKZPQ83NdTd+WsrdVoDb3gZ6fVlrn8U4Yz184=; b=quwDzm48EERTLnFf4zIbHQHjT6
	sCibbUJK/kTtd1tHRgNS7lwC1wOTmLd7W8CZoQHdUdMKHjqdKxv/SRjAJKH8NKmL1dclD9ZwFczzl
	UwDC0OnyJ2GTXDNeK7s0mhJgJy/jss6ozhZE/0eUVb1TbYEjWelJrpvilcyDE1ncRF02A7leXr9Zz
	Q6izeMC6u20xCICqT/1sSEZQ3hw9kbbOuXenjkR3XDbpCc3iSd/STvpmEuxAJAxtINnIeUp7l8Mq5
	2fVCaTXLT0m1EBSLuIAgREUNxDu9x40FnriUQFs0mgxU6/QQCHVNFNoAy8RvF+vCb67tAfA+bEVjJ
	Hls2GUng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL8Xh-0000000CyT9-0l0b;
	Tue, 10 Dec 2024 22:17:21 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL8WW-0000000Cy6S-2S1P;
	Tue, 10 Dec 2024 22:16:09 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-385e44a1a2dso447239f8f.3;
        Tue, 10 Dec 2024 14:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733868966; x=1734473766; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mRVZK5OKZPQ83NdTd+WsrdVoDb3gZ6fVlrn8U4Yz184=;
        b=DYSkHp6jhRGGWG3ZVEJbfn2tq7pTW4st+Nu5sTqN2rEGQUaDEepFhwn2uxPoj0R0CS
         Y5bBo8frDqlDgtbMJm4rLXf1qtU3R4bxD0tKWhbh1cZjidPDLuCg1XL818MmqKonsGl5
         R7DoKxAx1UN6NMTFn13PCjNuohR01j8GHJ1Jy/mDelWvg5zHkFGhG5+wRWSs5YtwKlCC
         HGaDSxPKSORXcASeKaF0M96iMg3/qhRa+wpKZrTynrJABJDoM0OgDjLfhr02jlo31o0u
         /NG1jJjMgUCPbCkRrY3YZXZoWzkQTEdlhXoNZuyW/N8WRIqBEJz0pYdNuQ8W79BYjTYt
         f4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733868966; x=1734473766;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mRVZK5OKZPQ83NdTd+WsrdVoDb3gZ6fVlrn8U4Yz184=;
        b=D3yHj3gL/yBEJGH/yli19CiGU1qvTW95uUr0nlHRV6PP+giZ146rKEqeElDU+ckI1G
         jQUSype0fpT9oyFzoqd4KQLKydu2FjLjOAQQP7yOwg3FMIE1RhKQ03nZO1FIAQUzJIU5
         rRZUXKH1cRQ8q4apQLBVAGRgcjWOQfA3LOCkvWKWw6JCa1ceLml9fnUqbFf76OKCrsC2
         TfkqbGyJRHKz9SUK7jyUn7Ku8tiEf80hdFRy7fKSFk9lqbNf7/SqLsyxyEUn/meCI5Yt
         SCSSDV0/bkWBEocdC0nPwM5zZBRaudVTaMnsgXCgCS+LW4WnSu7UOvAVqENa7saeFmDg
         oNlw==
X-Forwarded-Encrypted: i=1; AJvYcCWn/pLLO2BGUO2SwBzq49SZxLv9FzxmkVDmnUxx2sVIAzOGeK9j1frLXvmndDe96RPMqrC0cRxHfsblouj76C79@lists.infradead.org, AJvYcCWtxuQws7Ifv9M4RCCl5zGQqsWNIL3mJJSjd+RyW6G2jjzqv++qrF9OSMlcPBWxjRKsABagYPSHv0iC4eqysss=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0ROfEJ6lLD9eFUyBR1FI+uWhI0YO89xT6GhTf1TL3QZIb4b25
	gZPU+E4LpDdLswQGhpT4NXPntT7389mGe8Y0UsLHZARBetFiB55G
X-Gm-Gg: ASbGnctuAAWy5+DvDzZ9TZ1hwqWKw715ozGRStIVm/9vB5KOVFeUvyIl+JQBBxQHtfD
	7mIvmT5gvqsSLYpoWPEv0ql4ztD0YBRuzK08huINA2rVlz35I2ze38IwIYXqbuiLACqX/6mRyUJ
	8ALfdtBBOdjmaod4EtlgmHM49+oHm//9iZ0DlnDR2tbxPhvewuQsOtVgMgn+SmwjXgTG9DsJ0wh
	FyxzKlDu+ZSFv/xlt/7sTZrHkjHh5uJP7OUkA8Grw==
X-Google-Smtp-Source: AGHT+IHm1baC4ofneij4gkJ6Um6QoGj/WmZV27xwyGsbgmRhKphYwBRaQXprw6HUiiteXAVqvlr1pQ==
X-Received: by 2002:a05:600c:510e:b0:434:fecf:cb2f with SMTP id 5b1f17b1804b1-4361c3af2bemr1150455e9.5.1733868965555;
        Tue, 10 Dec 2024 14:16:05 -0800 (PST)
Received: from skbuf ([86.127.124.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-386499a9edfsm2129713f8f.22.2024.12.10.14.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 14:16:04 -0800 (PST)
Date: Wed, 11 Dec 2024 00:16:02 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v11 3/9] dt-bindings: net: dsa: Document support
 for Airoha AN8855 DSA Switch
Message-ID: <20241210221602.ohyzlic2x3pflmrg@skbuf>
References: <20241209134459.27110-1-ansuelsmth@gmail.com>
 <20241209134459.27110-4-ansuelsmth@gmail.com>
 <20241210204855.7pgvh74irualyxbn@skbuf>
 <6758ab9b.7b0a0220.3347af.914a@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6758ab9b.7b0a0220.3347af.914a@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_141608_619051_CD7B43D2 
X-CRM114-Status: GOOD (  13.28  )
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

On Tue, Dec 10, 2024 at 09:59:04PM +0100, Christian Marangi wrote:
> > > +  airoha,ext-surge:
> > > +    $ref: /schemas/types.yaml#/definitions/flag
> > > +    description:
> > > +      Calibrate the internal PHY with the calibration values stored in EFUSE
> > > +      for the r50Ohm values.
> > 
> > Doesn't seem that this pertains to the switch.
> 
> Do you think this should be placed in each PHY node?

Logically speaking, that's where it belongs.

> I wanted to prevent having to define a schema also for PHY if possible
> given how integrated these are. (originally it was defined in DT node
> to follow how it was done in Airoha SDK)

Does compatibility with the Airoha SDK dt-bindings matter in any way?

