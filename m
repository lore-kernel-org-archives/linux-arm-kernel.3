Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F897E9A031
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 19:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xEvfYLLw3IiT9UwT6PYubkbnZroYjQk8ROv2tQqe9bc=; b=G/YZ9TDnTJ8Ahy+NTHHXbTfvm2
	SzPmiWEvbxg03v20rDa5+HoYmwPFNWn3YQRikWi55aP8sPVWENHMF6QT/qi/Qt8t0fHOe7Wf1FEIU
	05zMQSwDr8DyFgxPgm4pstoPPNOn3l3ioGPGPm/nR3UyHFVN+IW1j8wwVZIq5claOkhD/1BV/DsK3
	+XGUJcH1rpkstNWiBTb/AFIGz9Woj1ofMTxJ178JOuS4+lHHZ4psJ4zZao5xBAJwDWk0XnWW7zC/y
	R/d3C/DIKSdxgldhc2U/LiAzfVNRnp5wUawHqsa9l4+3ecQzX/jOaceDat7cDmDJJSD26Bko4fhOM
	lL+ogS7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQnS-00000008oD6-1whS;
	Tue, 17 Feb 2026 19:31:46 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQnN-00000008oCl-2lyd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 19:31:42 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4834826e555so45855635e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 11:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771356700; x=1771961500; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xEvfYLLw3IiT9UwT6PYubkbnZroYjQk8ROv2tQqe9bc=;
        b=DOixsQPq9h0Vpj1aSQMylhhMXnybvT4OXvDEQzMiWvwkU0N8J1Nc7f8cnBsFdmVbmo
         yvD7fSMt8vHYtsFDA4G8hcfM/LMWKsGS7P1jY3zW02sKWAA6a+tLqAQuxcdWpBN4go4T
         sHhHxqlFv0Ar6QllQm0m0YK4mUDwrNbq6g4UdSdcJki0rnMelUKQFDBEue5CG6nsv/Bj
         6kRQpPSKNgeg4tZzO0+gE3Zudnt1kMMrVoXCrIB9PyfmaWnvf+QDJ2a25KV1J/XdwEVh
         AON+hl4VKaTUpI+UrmU3mQd5hvBJpgU1VPjeprYaAiLBBWQ6hIAehpZ6OfkVX2abM9tf
         LsSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771356700; x=1771961500;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xEvfYLLw3IiT9UwT6PYubkbnZroYjQk8ROv2tQqe9bc=;
        b=VkDCaFB3JwN1owxlEld63xc5hXV1jV2prnkTwFkA1lrX/xF0BaUA1a1VgMQJ/s9ewK
         1rIdEGR3l85fAx2pRvQLQZL5C/9I0G5dh+Z2kDgnEQ0DNYx+20P4sZV/3sJlEJTUe0eA
         249QVn5SypYdMXucMNOULc7mZSAT/46J2BYYHGm8699K/bEEqqwDdMLtXyb4VWj4KIEh
         bhsXCYK1j7j9BhKdV85KMsl269SnilKGcTZkwRagpfEExggboPzuRYbbLKYjqjLudf6I
         0M4R4fiUssFZTVREpoJ/yF0avfUs7tNHc8cWuIUZAdNLE6x64EF91jEtVpTDVURVL0px
         /GeA==
X-Forwarded-Encrypted: i=1; AJvYcCX3GGBZgpRNv6mO9lTuE3jATlz9XPXObavYSrgZIPMSvBEnm0OpCYQM9PmmWCyxK3as1d/GR7QnXxoPYyGAvKLs@lists.infradead.org
X-Gm-Message-State: AOJu0YwzpTHd/cWCvSYwjLjhdiDsh6DFFGcr3vovVNIa2xQF2aJTziO6
	w3CIHUvqPea6fZgVHwFc4ErWqVmSU3pmgss6B0mkWOMNWhtfj8NHB5Be
X-Gm-Gg: AZuq6aIqglT28KnCD6YN2NJp4Rh+5KLTUr9piWqPmU4huD0fXR+Rxlz8iKVou+bUexR
	TAD+N64rzmRHbtsghd+LasUtcg0j+FrJBHkM/JrEiPWIOuIeBGYEcjSTiNVxI8nwpo5t0JfPK5C
	0LM/+mv1rvfDQG9IU+gx9MZqasju9kzE/pKNj+KsiW9sYveBZ5xbYq/DRpyc9Oc1gNXaIdpxaI8
	pL3CPRfXKrjQy9U9R2CQqjfgpH2boC2OxS9NjU/OUwcl45OUb8TSWBYF9Du2Bbjw3Gs7ngz/yBY
	Ru1SZFTt6x1dnVfBsTEDPNizl1dURRrjgrXgpsoIVHjddyiyKNA9sSA069FPkd24N1ch/kM7BEj
	H9m15BIy9Myh8Vd3njkAeEAe907AcBrKUFtb4jbKDz4Szg59ByxnecQZYlMZzrJsGeuz2cTle/H
	JCi3/80bCw6zdeXmUlCTbFlwImdF71Jl62Jys6dTsmV1+5vKEk0pH9ganWQsRtvu6LcjiPj1V/T
	yhr/DZrpcSmGcNVNM0FdvinXJJ5vDiXucUpY4w5SlgCz2U=
X-Received: by 2002:a05:600c:1c19:b0:483:5310:dc67 with SMTP id 5b1f17b1804b1-48379be817cmr234399105e9.20.1771356699475;
        Tue, 17 Feb 2026 11:31:39 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48397317e84sm1751885e9.5.2026.02.17.11.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 11:31:39 -0800 (PST)
Date: Tue, 17 Feb 2026 20:31:36 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 03/11] arm64: dts: freescale: imx8mm-var-som: Update
 FEC support with MaxLinear PHY
Message-ID: <aZTCGH1rKWdvYg5-@Lord-Beerus.station>
References: <cover.1771353301.git.stefano.r@variscite.com>
 <3b984b93a43a07bc9c4f6414a08a3a0f45daaaa8.1771353301.git.stefano.r@variscite.com>
 <31f30651-7c99-42cb-9e27-e4806529d137@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31f30651-7c99-42cb-9e27-e4806529d137@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_113141_718237_F5347E85 
X-CRM114-Status: GOOD (  15.85  )
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

Hi Andrew!
> 
> I don't think you say this explicitly anywhere, so i will ask. The PHY
> is on the SOM? The carrier just has magnetics and the RJ45?

Yes, the Ethernet PHY (MXL86110) is physically mounted on the VAR-SOM.
All RGMII signals, MDIO and the LED outputs are routed to the SOM
board-to-board connector. The carrier board only provides the magnetics
and the RJ45 connector.

> 
> >   Two LEDs are defined to match the VAR-SOM carrier design:
> >     * LED@0: Yellow, netdev trigger.
> >     * LED@1: Green, netdev trigger.
> 
> Where are the LEDs? You say "carrier design", so are they on the
> carrier? The DT properties should then be in the .dts file for the
> carrier.
>

The LED signals are driven directly by the PHY and originate on the SOM.
They are exposed on the SOM connector and are typically routed straight
to the RJ45 integrated LEDs on the carrier. For this reason, the LED
configuration belongs in the SOM .dtsi rather than the carrier .dts.

That said, you are right that describing them as "Yellow" and "Green"
ties the description to a specific carrier implementation.
I will drop the `color` property and keep only the LED function and trigger
so that carrier designs can reflect the actual LED implementation if needed.

Does that approach sound acceptable?

As always, thank you for your review.

Best regards,
Stefano

