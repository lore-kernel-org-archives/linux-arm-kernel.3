Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806D3CCF9F1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 00:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pezF2VK8RuTzI7DSs1mIZQ9VJH2IBGxZMtiOZQj+jXY=; b=Rvqi2Trx0uI3RXDBcxgwOhxBNX
	uyTTcVc4jjVWY3oQ0/JkObynWvpKstaVa2mvAuY5GgRptc+uQGmIt50KwZKr2WkkzbMjqDOs4VOcB
	CUjdsLdYI5lXqLgaRCk90hSiChkZRlYSOwghkJrZvLtn7EHkVuSbMh6HzwQb1Us6DpSoUDbfVwKuj
	CzH3FU97P5DSyq1l9aHKJw/OTLXI1frAv8llPXzWARz7a8OMrWs7Mf98ZpAcQcARkRit6vyuyIpaS
	UjAsdEmaVlokqgjIjCKhEG7r71zwWjCnaMffD+KV+D32KBiDITgyMpesmCzq4iOQwPZjDQiUVpVu6
	tG08kR0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDuU9-0000000Gt3X-1tlA;
	Wed, 29 Oct 2025 00:56:21 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDuU6-0000000Gt3A-1JYU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 00:56:20 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b6cf30e5bbcso318627a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 17:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761699377; x=1762304177; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pezF2VK8RuTzI7DSs1mIZQ9VJH2IBGxZMtiOZQj+jXY=;
        b=FKWcr1KNZzr99G66AXdectpaylTg9PBE48c1loIl+knotNhL+jr8McDsQ7BMoAQrji
         wwU9BN2volahBK2CQNOeKL+i2CTO3//WFxtRkN4MG4tFGMnE7iEya1xNE+tdXEvatpZY
         nT2S1xRVtfbl9d0kfaDo3zZa952yE+Z978pzamVpcByDsvzNDB6+WYL9DSk/h9uBFgzi
         bINYDIQxBCnJeqEPoK+axKL7iacz6qsSgnr8xt7mcQdOXkuWfk4tzNxN9wiadPGlLod2
         6clAvTa3zqSczaBWzHH96tKGAdOXsn2pjHxiMklebTq62sX0pXXT4QPGJ1hJoBvjvXJg
         7l+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761699377; x=1762304177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pezF2VK8RuTzI7DSs1mIZQ9VJH2IBGxZMtiOZQj+jXY=;
        b=ElsDHj69dXVmC5J5UyaK2VFkANaSGNWcqnA1DO/FSM92I5dMFMjubH/I7z8A+FFptq
         nhkmM2YhwkcEZcUnlX50PJCRGxPIj3wxc/e0MK7ng0H55SCmS+7DOQIfApBqbQBRDi7m
         uaUHbuyab6pvgRmcFd3GQw4ehsDrQjXD/41XybXZbcQLKf2Ukp4IP2tXrvb58lBY4e6N
         SipG8Zb0QkEX1C8mDAZlyOBf+3J/BUOVHB5bZqdj7ceSPG+2eiTnJJthf6riYEqmSLXx
         yh8O9Bue6aLFN4PFutkqFc513tLdY3LZvRx7J9BYY4curSBpUBIw+oKMiCut0k6YC0mY
         2KuA==
X-Forwarded-Encrypted: i=1; AJvYcCWCmoVQzb7QX5uHQgagSATrOy2eOMXW0IgKdyFQx3gYy5fZEodVIXSYk8W/3TUlIpLmae5Mqd0m4vlD1Tnv0aKn@lists.infradead.org
X-Gm-Message-State: AOJu0YySNzqjwv1srhxik8Qgkxry1FWt21T6AoghiTMYbHglBcXvcwjO
	g+S0ovSMAV2sPpBnb2doid98PlICY+KL46hhT4B86BluJad4bysRpwff
X-Gm-Gg: ASbGncv1P1FZrluS//Hz+/Zg76bNWuDkpzFbKDyXEHDGM8xqUsRBB1LM8oKxp3yjvJo
	M+fvisGfyCySD+eUf0MKeWFOWZCna3ugA/JmOYET/DIJ+l0xd7PzdfGbQjUKmBg/ghodHYQTNFM
	S+C0vURtotVQTlWYNYioLPbbV3YxeSPJJpQGGxS6I1SqNxtkyThFdiEae9Rb7N3nO1hdoGl8usm
	wWczV1UO3K4M+eFxUWZdm9c5NcA1/IsNaPEGuROzTsOhvAwyKAeEwmDyH2pumAuoA8otY3Wn6AT
	07Qpk4b4wd68otRI7FT71TxP0kDkz1Jw5wyvDn1592qJd1LmE/FLYgmnkdsNRvTkB4zUWtrxKy0
	H7ywL3O9tbhZWuiH1mUbHjJq7IZWRnKt2wZpf5onf3urqHDaBP/IQuGGjtJ8TfgSU7er8TDWeYr
	E=
X-Google-Smtp-Source: AGHT+IHOlz4wCJmTj/zx16kQtcK3MAOTVFHMVAoc2+es1wdMlMVDqBf6QFztVnrfW0sWZY15JATnUg==
X-Received: by 2002:a17:903:41c2:b0:26c:4085:e3ef with SMTP id d9443c01a7336-294de9f7ae3mr12621045ad.21.1761699377445;
        Tue, 28 Oct 2025 17:56:17 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d230c5sm130960935ad.47.2025.10.28.17.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 17:56:17 -0700 (PDT)
Date: Wed, 29 Oct 2025 08:56:09 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <uwu@icenowy.me>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: net: sophgo,sg2044-dwmac: add phy
 mode restriction
Message-ID: <rclupbdjyk67fee2lgf74k6tkf7mnjcxzwcjvyk2bohgpetqt5@toxvy3m5orm2>
References: <20251028003858.267040-1-inochiama@gmail.com>
 <20251028003858.267040-2-inochiama@gmail.com>
 <20251028-parka-proud-265e5b342b8e@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028-parka-proud-265e5b342b8e@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_175619_668024_8629770D 
X-CRM114-Status: GOOD (  21.73  )
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

On Tue, Oct 28, 2025 at 07:22:37PM +0000, Conor Dooley wrote:
> On Tue, Oct 28, 2025 at 08:38:56AM +0800, Inochi Amaoto wrote:
> > As the ethernet controller of SG2044 and SG2042 only supports
> > RGMII phy. Add phy-mode property to restrict the value.
> > 
> > Also, since SG2042 has internal rx delay in its mac, make
> > only "rgmii-txid" and "rgmii-id" valid for phy-mode.
> 
> Should this have a fixes tag?
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 

Although I add a fixes tag to the driver, I am not sure whether the
binding requires it. But if it is required, I think it should be

Fixes: e281c48a7336 ("dt-bindings: net: sophgo,sg2044-dwmac: Add support for Sophgo SG2042 dwmac")

> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../bindings/net/sophgo,sg2044-dwmac.yaml     | 20 +++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > index ce21979a2d9a..916ef8f4838a 100644
> > --- a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > @@ -70,6 +70,26 @@ required:
> >  
> >  allOf:
> >    - $ref: snps,dwmac.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: sophgo,sg2042-dwmac
> > +    then:
> > +      properties:
> > +        phy-mode:
> > +          enum:
> > +            - rgmii-txid
> > +            - rgmii-id
> > +    else:
> > +      properties:
> > +        phy-mode:
> > +          enum:
> > +            - rgmii
> > +            - rgmii-rxid
> > +            - rgmii-txid
> > +            - rgmii-id
> > +
> >  
> >  unevaluatedProperties: false
> >  
> > -- 
> > 2.51.1
> > 



