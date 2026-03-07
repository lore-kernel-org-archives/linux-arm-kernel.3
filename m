Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E0EFC9EF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 10:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V94QkQoEyTd6cBgukGsABnXYIA0vAI5uUZxButFAf2M=; b=voHTuYvqLBL9xD1P1hf8QzrrOC
	Ur3Py3xWw1nFT8QSU2RX5jJ2gG8XDLTSN9bKKyOVS3yx20Y6iFM2beFEhCyGHWABdtkXOcox0j0FS
	tF+hsUGrbvrHzoJnIX/bbAMDWyvLpiymOllnZq9I4LAqEtccCv1e+rFhyOtk4jiUg0BeE3gTmhoUl
	3aJJMF/wCPfelGrJRMR7ky0ZRscSVYm9viPLsONeO7GLiYK2TD0T9KK5h9QF+GsrTqy6pB6S2F4Yw
	Nq4bfzaM9ko7dzZZGewidmkQCYv9Q1gWx+K7FdDkiK7/cJ/LcUqCN10cS1EevHUUryWHt4u+lzpAw
	0v3sLupA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vypLv-000000057oU-1TCc;
	Sat, 07 Mar 2026 10:57:47 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vypLt-000000057nf-1lkS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 10:57:46 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-439c9eb5d36so3495617f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Mar 2026 02:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772881063; x=1773485863; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V94QkQoEyTd6cBgukGsABnXYIA0vAI5uUZxButFAf2M=;
        b=ejrrNjoxbUUbiX55GH4gZ3XUnSkwu2YmjRBwoweo/0lmcrp1G9kGNIeiXVrQyk+7h/
         xb5vtspU/sMyO0V1qaf7lZ8CqBcfEWMHwDqzQi2HVes614xWhNtiMOi1YkP0ElvD7o+y
         iPIpeAGlUMUslV4TYKveYu5/E0RHw9G81BVU8r0IbnB31Sj/QDNn+REXSeqEfHAKONul
         pbDlQbSuURNnMpjYnCAHAdTva8mIpyl066+XhLYXoPPJBhymqIesc3g/ugQ/qM5xsFc0
         49dYm2Nbxsb288zkiipR7uUlmtUJcR9VKXmRIeKl/MT1CGc8fMAXRzOwfSjoWi+29e8s
         OP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772881063; x=1773485863;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V94QkQoEyTd6cBgukGsABnXYIA0vAI5uUZxButFAf2M=;
        b=xAzSz+8ssZK/N0liOuPEFEiFeoBiYyHzeNzfBGpM41QXAeRtDpVB/Do97DEG1WdPIm
         ug9USJ9Oa+vaqpOQXuU109djnT6TUzbEFH1jcsv1vXmUbweZOQAIud5Lq4ohLx7f1osi
         +qAc/Y3CIkRn1Zy2Q+o1O8dfz04Efb2afDCkgkyop9rxjbjkQI5SRTeyRCTvAm8Wju85
         Cvld92JyRGKS2575rW2v20ua253jSt+DEqgYh6Lvi18JIQ3VMaYmQrp6LlWqIfuBzm86
         VB3WduAVQwhCUL9U2GwSlo3g34YPdQ26+ktmRJ6aQioJfEDxbCOiSVPkh1Zc1I3gbBuH
         BJzA==
X-Forwarded-Encrypted: i=1; AJvYcCWKie1t74R4czc1viMoTukuPnln5SgXrdtgR2iYZwmcPEItcRSuuA9ZRtzlH+hYOWU0jWMzZdvXhMF1ENtJ/yU2@lists.infradead.org
X-Gm-Message-State: AOJu0YxTBT1myOtK8oTlxYKrLotBs/1ivW6kAJQSZGwFD1HJ+/2wPvOy
	0kOlGvw0SuRzJsmUMVbTO//XMx4/NLcUGiiQZcr91YivC6LuBSjus9+BLnfvkg==
X-Gm-Gg: ATEYQzzxDJC+ujsQyro9Q1A7zG27tGvzfNtZcWId60Y42C3wwlD7krU72l5SA1tr/AK
	IBE7RuSlLsHhOJ5Qf4Zi1rnphQTunSu1Nx4H4hmMwn5AG+IdH34EbtGz0RTlTVVbqISGpcLUhNe
	kc+DfmpFNc0QfSiqwVx/NKTkyNk1Mha+/HYVIVnJ1Ghx2SqXo1h9dErTFicuoVvarqaspf/g/3A
	dzHHybBwfBvh1OXUGe8ghx8npib+0k2GZFHApE5snzSgBqobXRmzPMhnNlLMXI5dPNcvObPqc+l
	E7Ko2MxNsp0u0MZ04GOGZjQnazbDIf7tyUjg9keNzKB63eCFqfl1DU761YobOrneg5DX3gtQsAl
	uvFISqh1veMtmktMPeXHvfBld/y6FiAV13FKc89M2jOg/KxXg9lTTOSL7WKhD4/iQ9n/QrOBJ+/
	W0ggamVkBq0VxUTb7dM+oTO1Qq70lCl25ywHkAGBo81gDsNGzbNPtabwd/jTkUm2pU
X-Received: by 2002:a05:6000:1447:b0:439:beba:300 with SMTP id ffacd0b85a97d-439da31e274mr9511165f8f.1.1772881063378;
        Sat, 07 Mar 2026 02:57:43 -0800 (PST)
Received: from Ansuel-XPS. (93-34-88-122.ip49.fastwebnet.it. [93.34.88.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8ec97sm11439826f8f.5.2026.03.07.02.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 02:57:42 -0800 (PST)
Message-ID: <69ac04a6.5d0a0220.2969f9.9d81@mx.google.com>
X-Google-Original-Message-ID: <aawEpAhvHEz_ocj3@Ansuel-XPS.>
Date: Sat, 7 Mar 2026 11:57:40 +0100
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52123051-0d2d-42b2-b677-99a5de0f2c4e@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_025745_479591_E7F74773 
X-CRM114-Status: GOOD (  26.03  )
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

On Sat, Mar 07, 2026 at 11:40:48AM +0100, Krzysztof Kozlowski wrote:
> On 07/03/2026 11:37, Christian Marangi wrote:
> >>> +
> >>> +		if (phy_type == PHY_TYPE_USB3) {
> >>> +			ret = of_property_read_u32(dev->of_node, "airoha,usb3-serdes",
> >>> +						   &priv->serdes_port);
> >>> +			if (ret)
> >>> +				return dev_err_probe(dev, ret, "missing serdes line for USB 3.0\n");
> >>> +
> >>> +			priv->scu = syscon_regmap_lookup_by_compatible("airoha,en7581-scu");
> >>
> >> Nope, you need phandle to express proper device links.
> >>
> >> Don't sprinkle compatible lookups for new code which does not need to
> >> keep things backwards compatible. How do you manage device links
> >> without phandle? How do you manage device probe ordering?
> >>
> > 
> > Hi,
> > 
> > the phandle to SCU was present in old implementation but later dropped as it was
> > said that it wouldn't describe the HW.
> 
> 
> I went through v3 review and I did not find such said arguments. Can you
> point me to it?
> 
>

Here was v2 [0] that was clock + USB PHY. (there were clock stuff as the SCU
implementation was different) The link wasn't added in the changelog as it's
quite different than this current series.

In patch 7 Rob pointed out that serdes-port + scu was a bit unusual.

Then the implementation changed in favor of a more simple one where it's the PHY
that configure everything and in this new version the usage of the SCU phandle
is really to just get the regmap and modify the single bit to select the PHY
path/mode for USB 3.0. (it's mainly the reason the SCU is referenced directly
with a compatible instead of a phandle, in the previous implementation we used a
function exposed by the SCU SSR, while in this it's just a regmap that can
PROBE_DEFER)

Rob suggested an additional layer (a PHY) to handle this but I don't feel it
would actually describe the HW this way as that bit doesn't modify another PHY
but it just toggle the mode to the related USB 3.0 PHY.

This is really another case of not-so-organized register mapping on the SoC.

[0] https://lore.kernel.org/all/20250320130054.4804-1-ansuelsmth@gmail.com/
 
> > 
> > I will readd as airoha,scu. Is it ok for you?
> > 
> > (I actually prefer phandle than hardcoding compatible as it makes things more
> > descriptive and prevent all kind of problem in the future, so I'm more than
> > happy than using that)
> > 
> 
> 
> Best regards,
> Krzysztof

-- 
	Ansuel

