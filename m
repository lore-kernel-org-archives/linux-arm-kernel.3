Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8974DD59F5D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 18:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KUerZBQbd4+bg88hhFJvKSj9QgEJ2Ngk8f4x34asRYo=; b=cAo6/wL05wZ0bHK8p2PfARII+D
	Hc0FrDTAG2oyRtmPD/vJv5IvNd+9zoSP+ODt/E8OwNxHbBNcIsnzWiq0bUqBjjgv3bZZY45w0ckKY
	xsv3LwGjAPCE7SngLPQRJjh1EoHXA+/VVFjlqr9bhngiy5Bm3Eb43jxcrEQHak4sHaq+7zXoU6Tuj
	urNZn9FU1+C8ttt3Pn1pZn7s3cr9WbTMu91IpzhGV+I9EPmf4voUz34SVys63ojflkgTll7I26E97
	w08zLbd94rqiq1SM7gfn1e3wXcQw0nT3JFo8FceuNL4nju2rQS6oabg1yIExjNSIvxwX0IvFGwTjM
	vmF8T3Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8kYS-00000004J0D-37pt;
	Wed, 06 Nov 2024 18:14:56 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8kV3-00000004IL5-3c7q;
	Wed, 06 Nov 2024 18:11:27 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-539eb97f26aso5014039e87.2;
        Wed, 06 Nov 2024 10:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730916684; x=1731521484; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KUerZBQbd4+bg88hhFJvKSj9QgEJ2Ngk8f4x34asRYo=;
        b=EvdfR7l8xgC8t4HjL00qjHpFy7cJhRJjB3NCKXLi9gF8EeVQOBPtqJFa0I01bRFo2+
         QJ/t0ITmszXtIdDyN/sIwpi2rLQxcOxDovyYxh9n/vs06NHuILRxIGkPmRk6LlNYCWVr
         4W2Dphj/Q09OIfRBO3q7ZW/I9dMqg4MxwP4ZbffghqE2E8CXWH2mo1hY1mHVDX4qeKXt
         xejRZrVFFDogZDGq+tfqEoT2opjGfI2g9b46yWLNyr+kaCh8nfpZ4ZMjlB8mn9vlolst
         Yb5LN3OC0NCjoZdlydDeFa3fMAO6LRBMAb1Hkb71PjFyy7CGkflvF7nVS592s1PMnrUl
         9KqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730916684; x=1731521484;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KUerZBQbd4+bg88hhFJvKSj9QgEJ2Ngk8f4x34asRYo=;
        b=ch7c2/n0PF2SwpCFwpbedHgoo0TDJ+3f7FY5lI9/xNhd2mFpkJgHcSc7cBGjwGn8q0
         kvMsnVS+/lRyK1pVsGlg5HPBe4Llp5VwcbkU117Ye99scIbxoYqr7In8ieHnNt2Yk0cJ
         rw30YfzF8koMEL/iqfaFo5JlxR+n0YyQGz4vwJXf1aIl6gaTXN7bFwj4HUWE3+5hxXAc
         cUxBLbdBBrVtqDwo5KmIiLbfRmkK4mg6Zk20ewC/xCbXZoKytMaoNaRcKWJoI0AeX9mi
         juCiu/WSUjbMSAkfGfAy8P4HX/SmYO1nvX05Q/sbz7WlynWR04RGl1CuW+y3EElrA1cu
         68wQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+a7woCNXecu8O5SNMCyCP7ZU8ooc1R5Kmr6jLCvQts2oE3u0aPmN73AZvF/eUHkiBqbGY6IeZ598H6Y34GGE=@lists.infradead.org, AJvYcCUyJotRYCo2mHmbN2nR/gpu0VrqIGzvHbgiP6j5kFnSAB60kOq+7q0mgf6AH9vz8M0L+APgPtJsDaue4TehbuPR@lists.infradead.org
X-Gm-Message-State: AOJu0YwbjxM1mKLjxz8OoHNL5NjTpSKWMnRKZM28xXOv1Av0h3UUV3fN
	KYy1RElUpgvKQ234tyFRbdZAZs5bmAkVhGt1hljKiMUZf+O3q9Ru
X-Google-Smtp-Source: AGHT+IHJTwLvOEJYl2C7zDFAHdl4m70ftFJabHTUXZMihSXo6FUmYq+cdgH2knrHNo0VFTQR6uSKnA==
X-Received: by 2002:a05:6512:ace:b0:52e:9fe0:bee4 with SMTP id 2adb3069b0e04-53b7ecd5807mr13588636e87.9.1730916683288;
        Wed, 06 Nov 2024 10:11:23 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa6b60e9sm31713315e9.14.2024.11.06.10.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 10:11:22 -0800 (PST)
Message-ID: <672bb14a.7b0a0220.fded0.9db6@mx.google.com>
X-Google-Original-Message-ID: <ZyuxRvbygg7SfgAO@Ansuel-XPS.>
Date: Wed, 6 Nov 2024 19:11:18 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v3 3/3] net: phy: Add Airoha AN8855 Internal
 Switch Gigabit PHY
References: <20241106122254.13228-1-ansuelsmth@gmail.com>
 <20241106122254.13228-4-ansuelsmth@gmail.com>
 <8e5fd144-2325-43ff-b2b8-92d7f5910392@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e5fd144-2325-43ff-b2b8-92d7f5910392@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_101125_925798_607BAA5E 
X-CRM114-Status: GOOD (  21.55  )
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

On Wed, Nov 06, 2024 at 05:19:03PM +0100, Andrew Lunn wrote:
> > +static const u8 dsa_r50ohm_table[] = {
> > +	127, 127, 127, 127, 127, 127, 127, 127, 127, 127,
> > +	127, 127, 127, 127, 127, 127, 127, 126, 122, 117,
> > +	112, 109, 104, 101,  97,  94,  90,  88,  84,  80,
> > +	78,  74,  72,  68,  66,  64,  61,  58,  56,  53,
> > +	51,  48,  47,  44,  42,  40,  38,  36,  34,  32,
> > +	31,  28,  27,  24,  24,  22,  20,  18,  16,  16,
> > +	14,  12,  11,   9
> > +};
> > +
> > +static int en8855_get_r50ohm_val(struct device *dev, const char *calib_name,
> > +				 u8 *dest)
> > +{
> > +	u32 shift_sel, val;
> > +	int ret;
> > +	int i;
> > +
> > +	ret = nvmem_cell_read_u32(dev, calib_name, &val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	shift_sel = FIELD_GET(AN8855_SWITCH_EFUSE_R50O, val);
> > +	for (i = 0; i < ARRAY_SIZE(dsa_r50ohm_table); i++)
> > +		if (dsa_r50ohm_table[i] == shift_sel)
> > +			break;
> 
> Is an exact match expected? Should this be >= so the nearest match is
> found?
>

As strange as this is, yes this is what the original code does.

> > +
> > +	if (i < 8 || i >= ARRAY_SIZE(dsa_r50ohm_table))
> > +		*dest = dsa_r50ohm_table[25];
> > +	else
> > +		*dest = dsa_r50ohm_table[i - 8];
> > +
> > +	return 0;
> > +}
> > +
> > +static int an8855_probe(struct phy_device *phydev)
> > +{
> > +	struct device *dev = &phydev->mdio.dev;
> > +	struct device_node *node = dev->of_node;
> > +	struct air_an8855_priv *priv;
> > +	int ret;
> > +
> > +	/* If we don't have a node, skip get calib */
> > +	if (!node)
> > +		return 0;
> 
> phydev->priv will be a NULL pointer, causing problems in
> an8855_config_init()
> 

Quite unlikely scenario since for the switch, defining the internal PHY
in an MDIO node is mandatory but yes it's a fragility.

2 solution:
- I check priv in config_init and skip that section
- I always set phydev->priv 

Solution 1 is safer (handle case where for some reason
en8855_get_r50ohm_val fails (it's really almost impossible)) but error
prone if the PHY gets extended with other parts and priv starts to gets
used for other thing.

Solution 2 require an extra bool to signal full calibrarion read and is
waste more resource (in case calib is not needed...)

Anyway thanks for the review!

-- 
	Ansuel

