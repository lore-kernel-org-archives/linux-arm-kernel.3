Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3D9C369AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 18:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFjKItarHUEZIrjo0ZjhvTOl5jmnWBzUA0dauVIkn30=; b=W2LCXCDiH56FleS7g8KRGoFaoD
	goOy3wrSkHiapjFKJnikOUpXwUUMV/+5Jh/35qwSwxGf3NcbUF4dW3kqn+/2AA4jkcpRRTbv0ecCk
	ziaP0M2uHt5+yRsedEV7KHAm9uHxKqokKeJt6FVxB2WJeb4soq0HmQ4DFvZfXYMed4gneCvhFUd+G
	7od+cjDpbh22iscv1GyEU5FFuWTq4lGKuKOddM//aMXZakqQnc+QZMCTPpRlYCMZZda1T6ekNOI4j
	VdudDn7cM2yr5OZdU111mzxxxsayS8rNNyTxJ/nMSX35h5vEjBPh2FT7vo1Tv7dj6AYIKD4QiZzdk
	z9d76jyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2wgO-0000000BWQK-0C8J;
	Thu, 10 Apr 2025 18:31:24 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2vsl-0000000BPYR-0uSz;
	Thu, 10 Apr 2025 17:40:08 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-39c1efc457bso684900f8f.2;
        Thu, 10 Apr 2025 10:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744306806; x=1744911606; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pFjKItarHUEZIrjo0ZjhvTOl5jmnWBzUA0dauVIkn30=;
        b=WMqlRWMtocjQrFCa+LnuD+6y4zgd8OsShhoeLB0yFao92VMQ4EnF+VrJJAoU0BTZ/w
         msZp/BgRh1RXZSAjPYGiUuK0IZ7OSdUNUzlGf2uXxYSf0WWjLCAeTbcSzdtDt8W4TKlc
         1FSc1D2Zt0jV/t+mWRcwvIpq/CHOwupm6J2hyucvliPcJItbDF0u1oDH5aPRs6zk6+Va
         xIm90aEameSPE+8zoAZrxah25/ikG2bFl4/+IZFob/EbdlRo4oT9jUSFHkqUFSazlPUw
         9kcWL5FE3Y+It+xSqbtNrWbBj0CsUXpLtxVIugJUbQjRgcq+krGAzlDvs8OIMRVHWPa4
         unsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744306806; x=1744911606;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFjKItarHUEZIrjo0ZjhvTOl5jmnWBzUA0dauVIkn30=;
        b=lPJ0xR46tBBqoOo4IdKYZ9E0IpcUDYLgQ3baMi0hK6wX2tM4Ch1vCa7Xx/eN7W+t7J
         4v1tEWiIOqzvtx7cVjrYZp7nKCQttiozJhJ5I/XJWYP1zJsLEfYw83DbaOc6qOj9IMtm
         I4bLWgK/sj0zpkZG8c1u3oLv1YMLfpxUIPeDgQsEaTFbNUuXLYBliADs9Hleywwsde62
         +UUa2oPqTGoMIau63PH/sTvjsMLL/mfMemSmmbxqmRCE+9URwc8HXSTfITZu7PovSWiv
         N79TDmg1L6sR83OTmAW9KVR3bHrDWNysViYNFu+M1+B3kYm4pVQJg1p4TUmwf+Wh5Dgo
         CORA==
X-Forwarded-Encrypted: i=1; AJvYcCVrYJGbPX7stkdBQusYKnEoTh6qH+a7+oTGKNropIRZzm2qN0AsDwKHYv4jZCaPSu6LbGkx7y6yFQe0WhuMNbE=@lists.infradead.org, AJvYcCXZnJz4G0SHm1p2CWdv9h/SK6EpWHPh2wBzmS9ryxOTC5VbAI7MF3UEh+4ZLX+zproiXISZtQLw9XHS/UJRhazf@lists.infradead.org
X-Gm-Message-State: AOJu0YxE3nmK14qLFOl7ILon6dy7dvpb4DRspPaBDhYcnTAnGFlnwmTl
	yTrl7YgBCtB2cGEDGWZhmDrlKAFAtt/bXuu2kmDavyQoCVF/aK5c
X-Gm-Gg: ASbGnct9g7+1TKNIkjtsumRsaGtUJ9L+eU8vYkx4SVcUyncGrR6qESMZUWzFt0htIrb
	6wNjrkUmYwNk50wEqX9zhnXifZa+479cOsYCNt/t/5mSWU3/DaMDDb1ZSVvSdeQfbtIQFJeDrjW
	eH/RTTRvtNh14my4lS6rUy87TIoMHy9aqAyEPaKlUapJADGDvhW2Y8l/kn90DDLg3AST6qQ+RTg
	edIv+PdLJ7YVsz9LYmt0TAi4uL9MaMaXLBRmBuSU9hxQLzr4a92+QCNP1nnKn43l+CtkuSKRcOv
	uRzSufrerzn9jPZJqXC0byj0ZtVpVje3MYo+gQB+/k8S5V2MYSz3gA30emYH2NLgah8ULBEvLt5
	idt0m928=
X-Google-Smtp-Source: AGHT+IFv4THUajH089YkeOkRes3LsTf9KDOb0k8QeqOxF6+NTBvRT51OO4QNQNiPc57IIpsOupZZ1w==
X-Received: by 2002:a05:6000:2204:b0:391:40bd:6222 with SMTP id ffacd0b85a97d-39d8f46daecmr3242955f8f.22.1744306805615;
        Thu, 10 Apr 2025 10:40:05 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893f0a80sm5568993f8f.68.2025.04.10.10.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 10:40:05 -0700 (PDT)
Message-ID: <67f80275.df0a0220.39b09a.dd38@mx.google.com>
X-Google-Original-Message-ID: <Z_gCcun1WNIjfxbM@Ansuel-XPS.>
Date: Thu, 10 Apr 2025 19:40:02 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Simon Horman <horms@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v14 07/16] net: mdio: regmap: add support for
 C45 read/write
References: <20250408095139.51659-1-ansuelsmth@gmail.com>
 <20250408095139.51659-8-ansuelsmth@gmail.com>
 <50c7328d-b8f7-4b07-9e34-6d7c34923335@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50c7328d-b8f7-4b07-9e34-6d7c34923335@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_104007_258128_16727F22 
X-CRM114-Status: GOOD (  39.48  )
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

On Thu, Apr 10, 2025 at 07:08:53PM +0200, Andrew Lunn wrote:
> On Tue, Apr 08, 2025 at 11:51:14AM +0200, Christian Marangi wrote:
> > Add support for C45 read/write for mdio regmap. This can be done
> > by enabling the support_encoded_addr bool in mdio regmap config and by
> > using the new API devm_mdio_regmap_init to init a regmap.
> > 
> > To support C45, additional info needs to be appended to the regmap
> > address passed to regmap OPs.
> > 
> > The logic applied to the regmap address value:
> > - First the regnum value (20, 16)
> > - Second the devnum value (25, 21)
> > - A bit to signal if it's C45 (26)
> > 
> > devm_mdio_regmap_init MUST be used to register a regmap for this to
> > correctly handle internally the encode/decode of the address.
> > 
> > Drivers needs to define a mdio_regmap_init_config where an optional regmap
> > name can be defined and MUST define C22 OPs (mdio_read/write).
> > To support C45 operation also C45 OPs (mdio_read/write_c45).
> > 
> > The regmap from devm_mdio_regmap_init will internally decode the encoded
> > regmap address and extract the various info (addr, devnum if C45 and
> > regnum). It will then call the related OP and pass the extracted values to
> > the function.
> > 
> > Example for a C45 read operation:
> > - With an encoded address with C45 bit enabled, it will call the
> >   .mdio_read_c45 and addr, devnum and regnum will be passed.
> >   .mdio_read_c45 will then return the val and val will be stored in the
> >   regmap_read pointer and will return 0. If .mdio_read_c45 returns
> >   any error, then the regmap_read will return such error.
> > 
> > With support_encoded_addr enabled, also C22 will encode the address in
> > the regmap address and .mdio_read/write will called accordingly similar
> > to C45 operation.
> 
> This patchset needs pulling apart, there are two many things going on.
> 
> You are adding at least two different features here. The current code
> only supports a single device on the bus, and it assumes the regmap
> provider knows what device that is. That is probably because all
> current users only have a single device. You now appear to want to
> pass that address to the regmap provider. I don't see the need for
> that, since it is still a single device on the bus. So adding this
> feature on its own, with a good commit message, will explain that.
>

Thing is that for C45 some kind of encoding/decoding is needed anyway
and with the suggested encoding (in previous patches) also C22 needs
special handling to extract the right address.

> You want to add C45 support. So that is another patch.
> 

I decided to implement C45 first as it would indirectly add support for
multiple register as for C45 you need to encode the PHY address anyway
(even if it's always the same) (making the next patch trivial as
everything will be already in place and just need to enable it by
passing a valid_addr_mask)

> C22 and C45 are different address spaces. To me, it seems logical to
> have different regmaps. That makes the regmap provider simpler. A C22
> regmap provider probably is just a straight access. A C45 regmap
> provider might need to handle the hardware having a sparse register
> map, only some of these 32 block of 65536 are implemented, etc.
> 
> So i think:
> 
> struct mdio_regmap_config {
>         struct device *parent;
>         struct regmap *regmap;
>         char name[MII_BUS_ID_SIZE];
>         u8 valid_addr;
>         bool autoscan;
> };
> 
> should be extended with a second regmap, used for C45.

So you are suggesting 2 regmap with dedicated read/write function.

The thing is that if the final target is to permit this driver to
support multiple PHY from a single regmap, and we also want to apply the
same encoding format, the regmap max_register will be the same for the 2
regmap making it redundant to have 2.

I think this is the blocking part that unlocks everything else.
Understand what is the preferable way to handle multiple PHY.

For C45 encoding is a MUST, and with encoding you get the side
effect/bonus feature that you can inject more info.

Hope you can give some guidance about this! Happy to split this once we
find a common point on how to proceed with this.

-- 
	Ansuel

