Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B45CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 09:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Hkz0Eq0uDpMi6XdoQlTFpPc33Fvk2t3F5VcoWVOi/A=; b=ZxSPeXT1YtFsBoIou3lzQdBHS0
	M8HEcqXb+U16cFziqkP8bXhaSTWdA+rgjxwf+bZKUFK18YaXPmZeugE0J/2eZkFZkQv3Ba7itA9hR
	Pgns81n+Ou0tXKrNWAKq0CvyGvlyhNXfI4hthJWO/zkJ4/juDaoGTKmqZDoih/DSYRl45oasVK2Li
	y6ScH0SY5UYTfANA6bq1q4j0n4It1njTmQZuJWPb0QGeZ9MpoMDRtfSeKorJQYPnla3kZCJbaXghs
	cLuCNnLBJXiIkZbFJoRA0xNS4YoZjUKVwjbrDK/xFXJ74cGmftXtXTKgn1ueZ0PUmznH7UMLdQ2+T
	f2RhsXpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUheB-0000000EgHt-49dC;
	Wed, 03 Jun 2026 09:12:24 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhe9-0000000EgHT-1BeZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 09:12:22 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-45ebafde87cso8455996f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 02:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780477939; x=1781082739; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Hkz0Eq0uDpMi6XdoQlTFpPc33Fvk2t3F5VcoWVOi/A=;
        b=Bu6PpmXcjzvun6dCTOce5VLjR24mJtX13vscp6pZYcRTRwz2FmRkOidtBsiHY4NPzZ
         3WxNT4Vp1B9WUT7YBJ9qdtavCWDM0mvke7wgabtDnWPJxES51c8UzV3dXAO0sDUNwvPJ
         TSRnttey1c8jo6tI1r17QDw2NODk6QcLLJNO+09QlYppsP0nr4nFWw0nFtQPHAL6rWw7
         r7lIRtn+3QyTvu596nCGN0OND29YMoeFdiQmaz2q7UwalWENR576ZeZGlOGaTcUQP5A0
         y43lQX+wHZxsz9XkwgqXGPFsI6dcDe6cGBl7+UfEco5McdYXdGIyRsSFj52AAXKuy9ts
         hJ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780477939; x=1781082739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Hkz0Eq0uDpMi6XdoQlTFpPc33Fvk2t3F5VcoWVOi/A=;
        b=d9ZfKxuckpBea2E5wHrCiVWcdZOA13X5gwcADjOaYgZQeL5WDoX1qN+c6OZLPQFHFr
         wugHbXil4oXJuigSNGzuo4UBdp9mNzlsY+ODKIpIMQb/Heyczsa59OG8g0xlHSZ07Ulh
         x8KcHG2r53oPZqI3Aq6ezK/5IQkjdCaGEhaZ7p+k1l5GOS8DNnX9nEHKg0lxf70vDQJA
         mA2tEEDh7EEtEOrCWmI433ssql/onwIOJqb3tx8PMiZWMV5nk/hUZ5wATOZd2uvJ+Dg4
         ubyuTBxkkKDcSba8u/ky4Ncl5g+CkXP6GYJMlcQaGuoELg+jf9yRYpQPcxj5yeuv/NRZ
         joZg==
X-Forwarded-Encrypted: i=1; AFNElJ8f8lMGFkPCnqNJt9aqNGgod0lVJF1q1jwr0su1I329m0KDBYh7s6uWZu5DUrtgb8h41nfjfrROanwDmmV9K2xt@lists.infradead.org
X-Gm-Message-State: AOJu0YycjFOSSJ63x3aGorQg1iYFdbmkO1xjMssLVMFVyQrRvhxKmLBm
	Ge6sxB+Wq1PaBcSRmrTcJhyyhCQ5juEhZQq+hH8MVSsXM9UGD5eem6fTwJAnSQ==
X-Gm-Gg: Acq92OECR+beFNNNFvCNWTiPnTopbRsaToFCGTO4mqQEpO/cUgX7uFZfa+DedwtvLgO
	HqHGdJM8Q3p+LobTlIiSlspQsSVV7p8kbj/ce0bNI4Q3VDffqlrwkt14BsoKmTW7Etj4MO8j9i/
	ogBioOnkmjFn9hkLrFou2aOVqEgMANnbyp8NxJfVGlGyY2cmIFIpa0f34JpKD+P7m5Uh90VZ4zo
	F5tGGYMUA/cffNTWfz+84a++WM2/n/H91eZRqrt/mfskgTRlVUtOPJO2v9YFcqH+Ah2X0/L+Z3L
	vm3RWIiUus/424E8oT5+uyUPDtsz7tBrDoqbdetRucD0NGCACb3Zw2Fonws1b529zI2tA71SgBq
	R9kReETlq/P4GrNHFm+rrQEuxieohsUP4O9KTCckSGElb8tIko8GBZ05B6QZ1LiMcYOwANzFPSK
	Kz89OKRCPehrLb1uR1nU1BlMCQ7wj3cPGFJURM5IFR/YRYM2f/kilPV0J66DMLahVC4YcTwMPHC
	TxBPrT/V72IX9hh8paQRlVD7jRMw9ZSR1402y2oV5dKm0F8tLOENAaink+8CuSNhg==
X-Received: by 2002:a05:600c:4510:b0:490:a298:3859 with SMTP id 5b1f17b1804b1-490b60f001amr37402095e9.24.1780477939047;
        Wed, 03 Jun 2026 02:12:19 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b7c6b966sm25579115e9.2.2026.06.03.02.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 02:12:18 -0700 (PDT)
Date: Wed, 3 Jun 2026 11:12:16 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/1] arm64: dts: imx91-var-som-symphony: fix RGB_SEL
 handling
Message-ID: <ah_v8E78aV3n1TZx@Lord-Beerus.station>
References: <20260529134850.22196-1-stefano.r@variscite.com>
 <ah3uuIeZ4Z6BMwfi@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah3uuIeZ4Z6BMwfi@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_021221_339609_66F45B86 
X-CRM114-Status: GOOD (  21.68  )
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

Hi Frank,

On Mon, Jun 01, 2026 at 04:42:32PM -0400, Frank Li wrote:
> On Fri, May 29, 2026 at 03:48:50PM +0200, Stefano Radaelli wrote:
> > From: Stefano Radaelli <stefano.r@variscite.com>
> >
> > RGB_SEL is a board-level signal driven by the PCAL6408 GPIO expander on
> > the Symphony carrier board.
> >
> > The signal needs to be driven high on the i.MX91 variant to keep the
> > board in the expected display configuration. Move the handling of this
> > line from a fixed regulator tied to the PCAL6408 supply to a GPIO hog on
> > the correct GPIO expander.
> 
> Look like this can't resolve your problem.  gpio driver may probe later
> than display, so gpio-hog may not set correct when display setup.
> 
> Frank
> >

thanks for looking at this.

The main issue I am trying to fix here is that the current upstream DT
describes RGB_SEL on the wrong GPIO expander.

The existing DT drives RGB_SEL from pca9534 GPIO 7 and also uses it as a
fake supply for the pca6408. That is not correct for this board. RGB_SEL
is actually connected to pca6408 GPIO 7, so the current description does
not drive the intended line at all.

With this change, RGB_SEL is driven by the correct GPIO controller and
this fixes the hardware configuration issue I am seeing on the i.MX91
Symphpony board, making it working now as expected.

Best Regards,
Stefano

