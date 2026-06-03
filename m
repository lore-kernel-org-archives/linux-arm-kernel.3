Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A80CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 08:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PzoJAMfBbn1uwW6pXQumFkyZkDU4AXI6hlryg4nLphU=; b=aSNV0+5K+DBbib9K/8rtVZKvOY
	b7FpwgjVSUIGjWh6IZPaU7XCZkvTfVeau+6u0FAJqJp/REa2TGz8AJgyUVLEu+35yHDY6c41iXbaI
	lp1zGEiWcjC9quc5Ax3CCq+ssO4WCKsb8LmDWjnDsw7tJhWtfFNAQ4/aTlUHOS1+h2hWy1pvW8S3z
	a34ZzqrHS0oY+/gOwVcbPvpgpxNz1KVSFmBFjf6TeKbeGx26rJA8v9DDU+5jCeRpeVmeFJ6h/XaqI
	jJrW9N9aJGztT2xEjGn6+6XpWXz0vnUpNr08KLr1421xP9+ld05NtmTTlepngQOAZkn72LoKwlS92
	ai+HawAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUggY-0000000EXlr-0fpw;
	Wed, 03 Jun 2026 08:10:46 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUggU-0000000EXlL-3ctU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 08:10:44 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-46015dc517aso2224233f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 01:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780474240; x=1781079040; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PzoJAMfBbn1uwW6pXQumFkyZkDU4AXI6hlryg4nLphU=;
        b=CirNPJnVGMFUekqcnW2e5kSkWUxPuCAzUw52yej+oaExQMnDYKMpOgoZvDa0FIyK+O
         4AjfimYAjmBZtrbW63ZSPR9GaWVfWF2w+IoHLUKt8hxItmkwswG7IraTSKFAlJxZPhdi
         8RYIegy6xHF1bluga4tgCR7OB5GE9VjrPzVbTYcy9w7sKh+jxbWJRkMIxdY39+OSt1ez
         arhCW9AygK/Wa8WaWDlJ95w1+rCXVp+M2etWy6Z3O4RjrfhKRpjDWOSCLkPo9p8kc5XQ
         J9TGMM0gWsT0urAWd8KxYJz2Zo9QQG16kviMDL8qdx20yR7iXIL4JZIHUd1OawgrT5rJ
         vYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780474240; x=1781079040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PzoJAMfBbn1uwW6pXQumFkyZkDU4AXI6hlryg4nLphU=;
        b=W57y7zQBoLViZO4KS84XkZiNbrGnTjzXkA2Czp4X/TXfUAuf4F0Kadk4sAI6vFHfZC
         ACYOm47XFdfEHj25mD5WM3h2CScobpykyNMXwR0w80ahOIHf43u/Dl8RS21Mp2wLoZDQ
         3MpAoiTZ19nDxh+TfHOkHoKMOpvMf3JuBWWWfO5Xizko+afNO2NjVw6TAiF6DaZ7mLd5
         Ls8XusVP6MxubE1FfTI9K3rAD7UfN3UkD9q8YuzY6FIqnFgC7AAzN66LXPzApRk2vLUs
         infDf5+nvhUST1YEPp+0xElCbHFOT3diA1HqAFbBcL/gq+rJlQbLvseVmIYLg3slikKO
         sdIg==
X-Forwarded-Encrypted: i=1; AFNElJ+AyGQS1LTDZELg47QTG3b7/uGPmfx1iRvFqdZELH1FQXcwUhBfERAAbqpmVPkmlVLKLDVtylAjdLnmxz9LhrG9@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4FTuTjDeJP5SJccFi3TjvoG3aXzOj6EghA/9VvGh/QAu37V3B
	MpA0RUrgWY/Z7ZWYcIqA5azkgGE+owSlVvFCrAPgTBg0XvYjVeF5BMcl
X-Gm-Gg: Acq92OE5jK1pS+FXRco8bXq7LEvPDBGAgfGeRoBsqBOKX429jZIJS1BgWloj9EfU1Xi
	kxAa8yRJkV0HNZ08gf9ONOpTxKEDY9b1qHJPnNMwRGt5qneNO6pEcIJtzNCn4KV4o6sd/2RMHz/
	aB0Gewm6VGBGr2EYx5zK+tWv7IgZAFySExGiER2Ers6z7BplhZMcWSJffunKn3liF4ltwv1gtkW
	SKouwYGZ/DzljLRCCgg9/AlH9XXKUdBgAR6YBBt+5XOUtDzw9iDNkW0kHpYRIRyDubWctGMRCGX
	BHQj5zoqyoFFn78QHGKHuo2GMXUW6p16EwxnKEh1CaCqMNqESZ8EWjnXtTwXPZ9BK2ia5XSfY75
	D41dWp/sD8NOTYXwPCLagM2OXlZ0jDPjwgoHVMeUEJ8gLJuplGcgbJimfgaodHXD+LAm3gr41mB
	VaTwOJBw3LnMIgjuCFD8x6I7nJUATNdgMSA/C9GiDopMZ62QtVaIqkU4IeVLXCI6Gvka+eVTNaj
	lGTD7Eu6s8xAjmR0h3wjW/wfju0kIE2BVrFbEbhoke9Yk70CM+J0nw=
X-Received: by 2002:a5d:457b:0:b0:441:1e8e:d8fd with SMTP id ffacd0b85a97d-4602184d442mr1812471f8f.29.1780474240292;
        Wed, 03 Jun 2026 01:10:40 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f368e9fsm5638407f8f.37.2026.06.03.01.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 01:10:39 -0700 (PDT)
Date: Wed, 3 Jun 2026 10:10:38 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: dts: imx93-var-som-symphony: add TPM
 support
Message-ID: <ah_hfhpujDwcGk9W@Lord-Beerus.station>
References: <cover.1780051874.git.stefano.r@variscite.com>
 <64adb6f0cf9efe107c761e1a69b9a63c7dd0141a.1780051874.git.stefano.r@variscite.com>
 <ah3wMi6QW6DUPrS4@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah3wMi6QW6DUPrS4@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_011042_913188_DFFB17B1 
X-CRM114-Status: GOOD (  18.16  )
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

On Mon, Jun 01, 2026 at 04:48:50PM -0400, Frank Li wrote:
> On Fri, May 29, 2026 at 12:52:44PM +0200, Stefano Radaelli wrote:
> > From: Stefano Radaelli <stefano.r@variscite.com>
> >
> > Add the ST33KTPM2XI2C TPM device on the Symphony carrier board.
> >
> > The TPM enable line is a board-level signal driven through the PCAL6408
> > GPIO expander. Keep it asserted with a GPIO hog so the TPM is enabled on
> > this board.
> >
> > The TPM binding does not provide a dedicated enable GPIO or supply
> > property, so this cannot currently be expressed as a direct TPM
> > dependency.
> 
> there are reset/reset-gpio, can you use it?
> 
> Frank
> >

Hi Frank,

you are right, reset-gpios property will do the job.

I'll send V2 soon,

Thank you,
Stefano

