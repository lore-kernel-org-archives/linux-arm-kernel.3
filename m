Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D8AF55104
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 18:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fePtVH1XrSdcxkm/f3Lu86HTCbPhsyR6IapTe3JHplY=; b=snuqlS6R+J42FkuAo2flwPCY1b
	Eg1cBx4oBRwf+HkgPlIevmskWAK8ua4/vM3U8xjcFRyPQn9GUw5NwMMzJzdD4g29evb+nYaYRH0Ko
	/Xe2yvbu6lxmz4R4kSt+lAUAwpQ1ioUBfojMe/rJzb/IkF3ZvLQqrm4pEUy0xTv2jWcCDY8n1hxww
	fD4ngVLkea+1NDgXlmVfI5I2AYsbpVzX6KZE+6Idrxc5NtrnQym3ykiRZXQVjWMD0cDK0N5owI+h4
	5Hvmwq703VnZks6a+4r1QkiEafMdIp0z8Ac9BP7XQKTw0MVXuVRIWPfL7My/awPSOCmyBQFKafmjQ
	xSJm89HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vywh0-00000005R6q-0zzX;
	Sat, 07 Mar 2026 18:48:02 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vywgx-00000005R6B-3y1T
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 18:48:01 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-439c9eb5d36so3643518f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Mar 2026 10:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772909278; x=1773514078; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fePtVH1XrSdcxkm/f3Lu86HTCbPhsyR6IapTe3JHplY=;
        b=J57077D7n5pIETQRzwE1rHg+R/bpwicJrwlTYTxOmBZrioATAR7LqL74WthG+baTqa
         s0n+VhyIY6y5yVjQDHL8pDAE/CvtPX7zJYy2uwPJMMnGaeCppQCAgiZgnYPk7aW0u7Ud
         AFs/g/l5k7qPCneqMLMydZ0cHmJ+McwmU0KR2ituJnbBc+ifWAaOELmi8hY0sruZNnS+
         l4EX40iT5iF8ceM9aQohseO3JtWOBia9UVu566zxHsbdvS93kEeNmld54JJCk8YBnUIh
         75dfh5vZ+it10Ne3ZUZr91KxpX9ZK9hyZp7escajVTieL9qDKn/3VZNpY/awomXdpAHd
         d0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772909278; x=1773514078;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fePtVH1XrSdcxkm/f3Lu86HTCbPhsyR6IapTe3JHplY=;
        b=ivbbNBp69zpw2wlFjFL/gcIM6lbQrVdjR2Wc/1U0j62/jHlv4Nf6XDP6/dZz4RKbmN
         PlQqoqKUQNLrPrzgP/TjHItePKw6ePcyD378/xfbE/ADTMcZ7VWWutPOYJ/W8SLkyGT7
         OMHiqyrVc55rO1o+PC9gqEUZo6vr+zEku2T1ZI789puohtodmpl0Hr6AMiI2sCijBrHy
         daDhssEAFTWnBkIT9pCOsxj1+gqITeloq1/L7Tz0UBry5NeG8RaTInRKzjESSPJlLmra
         nq2rAmiQTa0T+Q6nMaTBqz7oUQz4UAVIeLxK8JPg21CSU6oNiZ8nIoTBf0QdEURZbVPl
         oODw==
X-Forwarded-Encrypted: i=1; AJvYcCV2QDfDTqhqcvnH9/GfJgX6qQyYGYtFPDOqzedbL9qfzIPxQW43uL1xWj77zS6mtNaIsb4STysRmSLVCG6nUF61@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6F4GFzGeljKSVSeck8hVnpf4gbs7+53T/x+4MAzsr7UzOEMPY
	9hXVBzQ1kCjcjNlLQGTJLlwbswYDT4Z7tW7lC7nqDeRZowLKoIAt/W0E
X-Gm-Gg: ATEYQzxkcJ/yMQXW1xG7BTHf3lZivXOHHq2lJhW0YF8pvE0xQHt9l2BbiRqencI17vN
	9w7y3r9IWgHbivHxF5d6WJLkfaH+7dJ5GUTuMyGLPZMlbxiUA7GECzPeOhtHTREbZOZQ+Z9+P8Z
	k0da4lMbBeddypm4Y4iiQyznishS2HnFujOndk3PZRmZCxPbnzX47MZyvvm4f8sbvqi66EzUcwh
	4yPmbulOvUSf+VQA9Ghc/ogUzqZCLTHFPGIq/5kbMMdP7Kc2DhI8CwUwNOcYSXDo0oAFtS2q+JH
	RLMI0C+CdsVb3H81luc5aynUur0UgwLVHk86kIzLa2DkNZESmPh9pDsxVHtMIFbx67D0yvjiHh6
	2qN+RHOlNoUnaxoorPZ6ggn2CwkssY9gRF7N1uurr15s70kWw0fjXD5QxZ7z72t3xUwr657qWVn
	vZX/nMmTMiu3blO+6CTuzWxrpX3ok0QiVcXa9lpCJ1YD5ZP4A75hcr7g==
X-Received: by 2002:a05:6000:401e:b0:439:b3f1:8011 with SMTP id ffacd0b85a97d-439da35f838mr11120861f8f.29.1772909277570;
        Sat, 07 Mar 2026 10:47:57 -0800 (PST)
Received: from Ansuel-XPS. (93-34-88-122.ip49.fastwebnet.it. [93.34.88.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3c80esm11455641f8f.29.2026.03.07.10.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 10:47:57 -0800 (PST)
Message-ID: <69ac72dd.df0a0220.a3fa6.8d4f@mx.google.com>
X-Google-Original-Message-ID: <aaxy2m9QxsbU0hRM@Ansuel-XPS.>
Date: Sat, 7 Mar 2026 19:47:54 +0100
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
 <69abffe6.050a0220.18164c.58d6@mx.google.com>
 <52123051-0d2d-42b2-b677-99a5de0f2c4e@kernel.org>
 <69ac04a6.5d0a0220.2969f9.9d81@mx.google.com>
 <abbf81f7-556b-4fb0-9fb7-41f4c730f1d6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abbf81f7-556b-4fb0-9fb7-41f4c730f1d6@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_104800_036671_BE07854D 
X-CRM114-Status: GOOD (  31.45  )
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

On Sat, Mar 07, 2026 at 05:38:25PM +0100, Krzysztof Kozlowski wrote:
> On 07/03/2026 11:57, Christian Marangi wrote:
> > On Sat, Mar 07, 2026 at 11:40:48AM +0100, Krzysztof Kozlowski wrote:
> >> On 07/03/2026 11:37, Christian Marangi wrote:
> >>>>> +
> >>>>> +		if (phy_type == PHY_TYPE_USB3) {
> >>>>> +			ret = of_property_read_u32(dev->of_node, "airoha,usb3-serdes",
> >>>>> +						   &priv->serdes_port);
> >>>>> +			if (ret)
> >>>>> +				return dev_err_probe(dev, ret, "missing serdes line for USB 3.0\n");
> >>>>> +
> >>>>> +			priv->scu = syscon_regmap_lookup_by_compatible("airoha,en7581-scu");
> >>>>
> >>>> Nope, you need phandle to express proper device links.
> >>>>
> >>>> Don't sprinkle compatible lookups for new code which does not need to
> >>>> keep things backwards compatible. How do you manage device links
> >>>> without phandle? How do you manage device probe ordering?
> >>>>
> >>>
> >>> Hi,
> >>>
> >>> the phandle to SCU was present in old implementation but later dropped as it was
> >>> said that it wouldn't describe the HW.
> >>
> >>
> >> I went through v3 review and I did not find such said arguments. Can you
> >> point me to it?
> >>
> >>
> > 
> > Here was v2 [0] that was clock + USB PHY. (there were clock stuff as the SCU
> > implementation was different) The link wasn't added in the changelog as it's
> > quite different than this current series.
> > 
> > In patch 7 Rob pointed out that serdes-port + scu was a bit unusual.
> > 
> > Then the implementation changed in favor of a more simple one where it's the PHY
> > that configure everything and in this new version the usage of the SCU phandle
> > is really to just get the regmap and modify the single bit to select the PHY
> > path/mode for USB 3.0. (it's mainly the reason the SCU is referenced directly
> > with a compatible instead of a phandle, in the previous implementation we used a
> > function exposed by the SCU SSR, while in this it's just a regmap that can
> > PROBE_DEFER)
> > 
> > Rob suggested an additional layer (a PHY) to handle this but I don't feel it
> > would actually describe the HW this way as that bit doesn't modify another PHY
> > but it just toggle the mode to the related USB 3.0 PHY.
> > 
> > This is really another case of not-so-organized register mapping on the SoC.
> > 
> > [0] https://lore.kernel.org/all/20250320130054.4804-1-ansuelsmth@gmail.com/
> 
> 
> That's the cover letter. I guess you did not implement Rob's feedback,
> either. This is either phy (for phy) as Rob asked or scu phandle.
> Removing scu phandle and not implementing phy is not what Rob proposed.
> 

It was to give the full series. The specific comment from Rob was [0].

SCU phandle is going back to the old dual binding that Rob was against but PHY
for PHY would not be descriptive of the HW.

I can do that but would it be correct?

[0] https://lore.kernel.org/all/20250324154919.GA101272-robh@kernel.org/

-- 
	Ansuel

