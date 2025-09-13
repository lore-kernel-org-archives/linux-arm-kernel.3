Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA645CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 13:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bn5g5etmrQRhW0GOll7653iUOWDP8XBcYnO++0L6iOw=; b=wgllmeo5/u6IdQxk1a+H8re0ri
	6vjPGXiCBhXx9WDj+HE8+chfruppTroGNokYxJYlDlayJB6Nw7GJ8A2pidkWYVgchjInskHp1OkKm
	I/9HpAYMjG7srC12F7gJTxrqlrVM6ql99HiFDVSi8XmrT4dOEd326q8KMweJEGrojcTJliBE+3FPg
	tTbnuNcmU8qLdS8v7J64O2zdwJ0wz57U53fFVsaEQupy/Jj+3Oq4m/jsVTA+4YQeeso46deWliuZ6
	U0JszwDO33LaQloua8oOU1txgfFMbksZWANl3La9mtqC+iX7Yy/hWPSQleFI5H/0cQzknDZCSxim0
	Gg+c3ENA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxPvr-0000000EnlC-3V98;
	Sat, 13 Sep 2025 13:04:47 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxPvp-0000000EnjQ-1cgB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 13:04:46 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45cb5e5e71eso17153535e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Sep 2025 06:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757768683; x=1758373483; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bn5g5etmrQRhW0GOll7653iUOWDP8XBcYnO++0L6iOw=;
        b=BVaQja1Ur6sloefFbg+gUqDbF6ZKP4a4qm1dUDAMk9aKYIsFtKcC9FSY/9oi1agnU0
         nQKZh++GRh+GcX54q/lMdOMOq7PtZ6dssgx2EOqVWa6i+21K/Ne4JB1NubiyiCmwa514
         E10Du4tubw9WidkP1mQg5nY+MuArXfNJJeJIR4XirKc2JgEkNKnLhu3uKh410F+eawde
         DHoYYzKk7j7yX/kzy70KBHGRdHt3BZMDfRL9K5hwz3StXWX+VZQ1/rQu7Z4U5Gy/pvyT
         0W99JAW37pVcP9wZZiRqoHxh177gvlI0aKtzqLB43oYNtexqMIItt5K6MF08uO6yMN8j
         RvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757768683; x=1758373483;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bn5g5etmrQRhW0GOll7653iUOWDP8XBcYnO++0L6iOw=;
        b=Q1fIzvHfe0TxPgtX+BPCkftSl7vi65SFTqJzJUq4zxRT5tRDfwcWnnKP1ZNH4SjSlf
         FEmMkTV9dTwtnaN0lltNX4nhJbbLc/tEpITNGH+Y8IexoXkybWQ0hR1+F/XV0gMcRccx
         NDCqP9HDIQ6jbpQojCHh6bMCKnrVXAuIqhwP9kNlYENo5VYvT60HeQpThp7wBMCkb8Ig
         yUgGz8+mSMvmas2a61m1Lm03XmowGFMLODMPMTnRA+aH96UXoeR1iddERNpylrKfw41W
         ypO7unTt1zI2P0Q9x0PeWbY0j0SGXIsS0ywU9tllsPL1ixPHiTH+ISO6slUmxuCJ5Q+O
         n/kA==
X-Forwarded-Encrypted: i=1; AJvYcCWO2fuLa2MtlVImWtAR95sZ2aR7CuVK8v8Jini4f4mNci15Hmf5gUTDcbIkfl00IEmtMEupR7+SJrjrR3Tpko7Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9KGbAN+QRSogOL8vTWz6pMCUyFyLMcKiDQSb44NIS4P5kucKK
	vLU2/Toei+xPd0rvkejXmudDf6ILfXnaDQxnmyt/c60ddo4PC4/Kw7qL
X-Gm-Gg: ASbGncvlQYdwK2RJyvQIdiTjh71RUaMIRRCjSUVQOrYCDgH2Q/+eOoe1SVOeLOjgtu5
	RMmeBOzem+vlyuUEKI8HQLb1vAjH8P5mylRDuyZKnEGA2jNtO/8v2i7Itkkb/yQ1t8Qc341bEoK
	URv8aAjnHeOH6TGIKUeUj/pH7g6XTce4mb3h0fXGD/vp6mnoE7dEpF3nEiP/+YDK7/ablHuYAsq
	pQ/xxUOk+QfVB3Zji5cUVeIALc6qA5LR/OpRW1tiOAHRAkmny7HqwelSKV1F2GVpOGhCSviRaJQ
	rakY1btLMFhfE8ep8GXBi0OOTz5hDC6U3lNksNE0Bi9xNw5IDLGDhREvpt7r9HsITaSlN7ovYHc
	6RLQNqtcWOgY5e1wZojRpAfnIfnezxaJsQQqRmn00x9w/c90HtX52/rFfxqdytW0FoNOnDZc9W0
	gawFFj
X-Google-Smtp-Source: AGHT+IH7bqCK1wDu540Yv6h59nRCAcKulg0ljt7g6L2IwpwzA60j/nsTl5Zjtr2oKtoo9w4/vWv6Gg==
X-Received: by 2002:a05:600c:a45:b0:45d:dd9c:4467 with SMTP id 5b1f17b1804b1-45f211ca33cmr60235475e9.7.1757768682776;
        Sat, 13 Sep 2025 06:04:42 -0700 (PDT)
Received: from Ansuel-XPS. (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e015784c3sm105911875e9.10.2025.09.13.06.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 06:04:42 -0700 (PDT)
Message-ID: <68c56bea.050a0220.a9dbf.b7c8@mx.google.com>
X-Google-Original-Message-ID: <aMVr6Hkskt5mPfFP@Ansuel-XPS.>
Date: Sat, 13 Sep 2025 15:04:40 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Simon Horman <horms@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH v17 6/8] mfd: an8855: Add support for Airoha
 AN8855 Switch MFD
References: <20250911133929.30874-1-ansuelsmth@gmail.com>
 <20250911133929.30874-7-ansuelsmth@gmail.com>
 <20250913130137.GL224143@horms.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250913130137.GL224143@horms.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_060445_433454_4E637346 
X-CRM114-Status: GOOD (  23.49  )
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

On Sat, Sep 13, 2025 at 02:01:37PM +0100, Simon Horman wrote:
> On Thu, Sep 11, 2025 at 03:39:21PM +0200, Christian Marangi wrote:
> > Add support for Airoha AN8855 Switch MFD that provide support for a DSA
> > switch and a NVMEM provider.
> > 
> > Also make use of the mdio-regmap driver and register a regmap for each
> > internal PHY of the switch.
> > This is needed to handle the double usage of the PHYs as both PHY and
> > Switch accessor.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> 
> ...
> 
> > diff --git a/drivers/mfd/airoha-an8855.c b/drivers/mfd/airoha-an8855.c
> 
> ...
> 
> > +static int an855_mdio_register(struct device *dev, struct an8855_core_priv *priv)
> > +{
> > +	struct device_node *mdio_np;
> > +	int ret;
> > +
> > +	mdio_np = of_get_child_by_name(dev->of_node, "mdio");
> > +	if (!mdio_np)
> > +		return -ENODEV;
> > +
> > +	for_each_available_child_of_node_scoped(mdio_np, phy_np) {
> > +		ret = an8855_phy_register(dev, priv, phy_np);
> > +		if (ret)
> > +			break;
> > +	}
> 
> Hi Christian,
> 
> Maybe it cannot happen, but if the loop above iterates zero times,
> then ret will be used uninitialised below.
> 
> Flagged by Smatch.
>

Do you have hint of how to run smatch on this? Is there a simple arg to
make to enable this?

Anyway yes it goes against schema but it's possible somehow to have a
very broken DT node with no phy in it.

> > +
> > +	of_node_put(mdio_np);
> > +	return ret;
> > +}
> 
> ...

-- 
	Ansuel

