Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07152C44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJFV9DU5Vwnd8GnMjCDv6CHqBURYy/BG/NXR1r4pGLQ=; b=fmHIfEenlTMyswkko4eDqtrk55
	O3PGIe9xk+cfzrHqXLi4qUJeHBC9NsbJQqY6J41zzWTNhp1hJ03R5FWbKO+U+DAn9ce5SEP5QgpNS
	FlLvM/wlrh/dcAFsXMIzkQ2akVw3Bltff1aAy4E9lM0cBXItpJvaBQX4dADpK/2EfhYiDdy0De3Ja
	K6Cy7FvJ7OoDW1KBgeGcRVeyMkijgG6T/K/uAIydcamivK7L7WeavufiiJYUCz0Ipv00ONjjPZEyi
	d9kkwM5Xsu9S6kV+ox7ETL7wgCzDLzB+8sIRW+HaJM/IajkJ9qKynB1i+v7THCbbcihtXXVPJ86E9
	11Youlmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke5v-00000001h7E-4Aok;
	Fri, 17 Jul 2026 08:38:56 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke5o-00000001h4I-3KRw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 08:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784277529; x=1815813529;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A2JhgEKXHwd6DTgUANQltUvF2hrMmXaQUk6VqGURdqU=;
  b=d9iwyHxpBRNPB4OtO6pnRN0NqO1mWNJToLR4F8BRnu/SLn4aWP+qeMkw
   JoJKPsxHWaW8CbuetZa8QTRb15XyyGHw+h3reK8PGGlxmFLHdSQiMirQ4
   G3Iqb/dcfiaHJIzeBucgsj8JldhHAOOc6CFnV0vxxgJzIFt2RSj8mWJ8W
   r2O17VoZmN7xiqcnIg/Yr0Bsmn+WdKxtfk/u4OB8+OcofbcpUcekqcJXo
   nsYC/0qU5O3jnU9+6NLbxs9+Zze80v0XbTCA6u7YQRaEyiYLIC+adtJLh
   hTHFzqcj4VIrWqloir7aDG1oIzZchIXn1x2yA/fcZ+5mPi9nVNd0naXtP
   w==;
X-CSE-ConnectionGUID: 9HGhE4naQLW9T60kp+u6Bw==
X-CSE-MsgGUID: quatCBb0QXaVmpRllyLlEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="102372455"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="102372455"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 01:38:48 -0700
X-CSE-ConnectionGUID: Fz46YXghRfCGXVa4fTXzpw==
X-CSE-MsgGUID: lEkyn+ObSCufQwvwFUxXqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="261015173"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.143])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 01:38:45 -0700
Date: Fri, 17 Jul 2026 11:38:42 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] iio: adc: add Axiado SARADC driver
Message-ID: <alnqEnVm9rGTapFB@ashevche-desk.local>
References: <20260716-axiado-ax3000-ax3005-saradc-v4-0-810527a9d27f@axiado.com>
 <20260716-axiado-ax3000-ax3005-saradc-v4-2-810527a9d27f@axiado.com>
 <alnpMFK6_ZkdWlLi@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alnpMFK6_ZkdWlLi@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_013848_872182_F9FDD8E1 
X-CRM114-Status: GOOD (  18.73  )
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

On Fri, Jul 17, 2026 at 11:35:01AM +0300, Andy Shevchenko wrote:
> On Thu, Jul 16, 2026 at 10:53:02PM -0700, Petar Stepanovic wrote:

...

> > +static void axiado_saradc_disable(void *data)
> > +{
> > +	struct axiado_saradc *info = data;
> > +
> > +	regmap_write(info->regmap, AX_SARADC_GLOBAL_CTRL_REG,
> > +		     AX_SARADC_GLOBAL_CTRL_PD);
> > +}
> 
> Supply regmap instead of info and make this simpler
> 
> static void axiado_saradc_disable(void *map)
> {
> 	regmap_write(map, AX_SARADC_GLOBAL_CTRL_REG, AX_SARADC_GLOBAL_CTRL_PD);
> }
> 
> ...
> 
> > +	regval = FIELD_PREP(AX_SARADC_GLOBAL_CTRL_CH_EN_MASK,
> > +			    GENMASK(soc_data->num_channels - 1, 0)) |
> > +		 AX_SARADC_GLOBAL_CTRL_SAMPLE_16 |
> > +		 AX_SARADC_GLOBAL_CTRL_MODE_MANUAL |
> > +		 AX_SARADC_GLOBAL_CTRL_ENABLE;
> 
> This is not used in the below call, move it closer to its user.
> 
> > +	ret = regmap_write(info->regmap, AX_SARADC_GLOBAL_CTRL_REG,
> > +			   AX_SARADC_GLOBAL_CTRL_PD);
> 
> With
> 
> 	struct regmap *map;
> 
> at the top, this and other will be shorter and easier to follow.
> And I would dare to use a single line:
> 
> 	ret = regmap_write(map, AX_SARADC_GLOBAL_CTRL_REG, AX_SARADC_GLOBAL_CTRL_PD);

Looking closer at this I think it's a leftover? Since it's an action that does
disable. This one should only enable chip, right?

> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = regmap_write(info->regmap, AX_SARADC_GLOBAL_CTRL_REG, regval);
> > +	if (ret)
> > +		return ret;
> 
> > +	ret = devm_add_action_or_reset(dev, axiado_saradc_disable, info);
> 
> 	ret = devm_add_action_or_reset(dev, axiado_saradc_disable, map);
> 
> > +	if (ret)
> > +		return ret;

-- 
With Best Regards,
Andy Shevchenko



