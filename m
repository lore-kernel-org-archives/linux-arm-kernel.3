Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32235FC9EEF
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 10:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f5dRvU5hSjZG/d9NEVJAuQDH8Oh+ysj/HM9E+z96h0A=; b=NezGivvPBNSl2lpVjIjhi1yQs8
	accrM0fm5A/VYkcEtCl6wP0IuGNkKc4NfAbSKKBsfYfFik1gxuzEKlwQ+7hTupkNMqdUZdbSM946h
	WP9TaR7RuL6R2t+8EN0eGawZv1u8njLID1sSoXa15MaZDmN05L6EHmlaWSW2WQUvQASd970pfkQU/
	kqV89uuS0I7lK6UAvYy3ESrAzrZlUdd/2rydG33CRoGxiQSwhgljR68NhrABvkdz1qy/esJbwYM+g
	gQ5eiWXBnWZ1tQmL3cF82LwQqrbcb40DpDA0M591U8kIZQNKeDY6WXmQoa//uAMi11+P9il77E5+X
	VbJmOSSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyp2L-000000056aB-2QJI;
	Sat, 07 Mar 2026 10:37:33 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyp2H-000000056Z7-3oEl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 10:37:32 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-483487335c2so84385825e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Mar 2026 02:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772879848; x=1773484648; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f5dRvU5hSjZG/d9NEVJAuQDH8Oh+ysj/HM9E+z96h0A=;
        b=FkO+CAXUMNFm0Fcdk57niE69M7ZNv6Chi0RZ8nMBxXK79gWhu9Iu8dk9VbL7pBWpEM
         Lr3+bCX8rQbIIHzb7EhBnA2YvfyMvsnc+NEGYUlyok/XYGP3LqB7jgUKCpYOCrYQgyjg
         H0LOql/bQ//hOtGNob51Y1s899Z4UXKzHxK/lhlLFiBkklyY7ySJPs4AVKe/n3tJUWxd
         8QLfCC6MfsVMtZUKUYsSRc7YXMVBHY+pNdGiXlSb1jf3QAtmLmxF/SJ2DOzoj8zWzR0M
         I45OKbir+mF+ThnVzCk3okeYWIarc7g+zfOHvQXx8cBYZY7xc/uCiVNGpxHauekfpNd3
         PmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772879848; x=1773484648;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f5dRvU5hSjZG/d9NEVJAuQDH8Oh+ysj/HM9E+z96h0A=;
        b=XAd8EH35VZpHGdsD3dePWgXi2he+Lz6iWOSwmKYHpQQXKOG6iJ54ipg9iEMjEI0k3a
         LYP3eAYmkbIuABqLRpMhUWKJoeluDGb0Jn4iEsyWFNmSasAO1X/bL4iZ5pUms78PQ9Jc
         1fSHReCFg/aWToDyNQBOC/q0iKMWuWui5w7lKwGBjOZcTaAuKNlDKolkQSjbOKVe3rHv
         oqjeQjbKMzMkXtu3k6id87JvueXq/BCsL6QyUmAew1Opf3cAc5BRpRndzUp1+kauNdW7
         zXXTfsf1CmLmz1O4MyaElnYgEo+ZPYd5+of+VIYM7pfgnFN6eQqZrlhP5IFU79CdvEU7
         i3fw==
X-Forwarded-Encrypted: i=1; AJvYcCUzhx2qeBISIL81keI/ftuoOLMWX5K6P4R309jyFeJk4nq6QJ+y4gBztf84X7Zdz3LVIZtIcy3YsfUws1l55kh7@lists.infradead.org
X-Gm-Message-State: AOJu0YwIASuCprUfi8PSEgmKBSg6I0KpsJhJK7VFYWtAGJufTdoHqfbj
	UaTLPWjSxmLZDyZRVSYyV4i++rCSwYi8xsEktk2Ca5TQHOHiSVk4XR2p
X-Gm-Gg: ATEYQzwCnwguqxsdP9xTbdd0fzIL9OTeXFCLrppm2z7ezAZJevmFQwotYqCzF9besHW
	XpXs77GgGYmNmcgYJU4FwhqHaVilk466sseNqJGH6Tl+B1gDd382FvrYVjYdV76ZPCGlADgiXKL
	XLRaGlZkO3ULikNJ9XiOw6tJ4q86KK34xoEut2CanT1GQR3VeXQXdns06Zs4NqEXTcw/As+enKL
	/Ecmm7PMn8cYP+db3hqmrf44sAAbZhXM3malLgCBPdUBbj7ZJCNTZeRrcYOtVoFt5mwn96TwycT
	6xjVH8BhZyjnAQAS8jh9jGP8Fekfuyc1qOakQAA1SnxT1euUbvNblst03TaoboeNRQTbbgnNa+j
	yFP2Un1iTzZlzg8WkS6ZgfOHa4yRP3/OaYS3SyrCMLc7RigarRUWl2vaEyYKIYnd9Dzmc6VS71K
	Ddi1OYZkDufPYTWmNf0vmLZTRRG1KhzkWtFr6ZS+M7BhqtynOS0UvuHA==
X-Received: by 2002:a05:600c:1d04:b0:47e:e7e5:ff32 with SMTP id 5b1f17b1804b1-48526983292mr76044105e9.34.1772879847564;
        Sat, 07 Mar 2026 02:37:27 -0800 (PST)
Received: from Ansuel-XPS. (93-34-88-122.ip49.fastwebnet.it. [93.34.88.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485246ece8bsm55380715e9.4.2026.03.07.02.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 02:37:26 -0800 (PST)
Message-ID: <69abffe6.050a0220.18164c.58d6@mx.google.com>
X-Google-Original-Message-ID: <aav_47Qtdnpncdll@Ansuel-XPS.>
Date: Sat, 7 Mar 2026 11:37:23 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/4] phy: airoha: Add support for Airoha AN7581 USB PHY
References: <20260306190156.22297-1-ansuelsmth@gmail.com>
 <20260306190156.22297-5-ansuelsmth@gmail.com>
 <20260307-otter-of-imminent-merriment-d3475d@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307-otter-of-imminent-merriment-d3475d@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_023730_603266_CC1736ED 
X-CRM114-Status: GOOD (  15.91  )
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

On Sat, Mar 07, 2026 at 11:32:57AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Mar 06, 2026 at 08:01:53PM +0100, Christian Marangi wrote:
> > +	for (index = 0; index < AIROHA_PHY_USB_MAX; index++) {
> > +		enum an7581_usb_phy_instance_type phy_type;
> > +		struct an7581_usb_phy_instance *instance;
> > +
> > +		switch (index) {
> > +		case AIROHA_PHY_USB2:
> > +			phy_type = PHY_TYPE_USB2;
> > +			break;
> > +		case AIROHA_PHY_USB3:
> > +			phy_type = PHY_TYPE_USB3;
> > +			break;
> > +		}
> > +
> > +		if (phy_type == PHY_TYPE_USB3) {
> > +			ret = of_property_read_u32(dev->of_node, "airoha,usb3-serdes",
> > +						   &priv->serdes_port);
> > +			if (ret)
> > +				return dev_err_probe(dev, ret, "missing serdes line for USB 3.0\n");
> > +
> > +			priv->scu = syscon_regmap_lookup_by_compatible("airoha,en7581-scu");
> 
> Nope, you need phandle to express proper device links.
> 
> Don't sprinkle compatible lookups for new code which does not need to
> keep things backwards compatible. How do you manage device links
> without phandle? How do you manage device probe ordering?
>

Hi,

the phandle to SCU was present in old implementation but later dropped as it was
said that it wouldn't describe the HW.

I will readd as airoha,scu. Is it ok for you?

(I actually prefer phandle than hardcoding compatible as it makes things more
descriptive and prevent all kind of problem in the future, so I'm more than
happy than using that)

-- 
	Ansuel

