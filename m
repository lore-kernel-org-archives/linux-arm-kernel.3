Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A23EA3C55
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 13:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DwJlkFrhXzK7YdnSXVZfyWJS5imgv2KYNIEwcWCOQ/8=; b=WJm3ef7RurZZEBtannzaqSkZ5P
	ivFIBWAjC82gD0IVH+yfTRCncy/YxAD5zzXek8J6CD4Y1a30ZMoyg7rPjpr2I0rKc5NoRPcu1tqq/
	D4bNYndlmnwTda0nOUd9OLpTp5gh7t45w9XUc0IqbdJWVX/7A3qW3qZSKoekTTw3RIgfDLeXBfNTv
	vWZgFTOUh+lLeHWEN0YIdQZCRUOVIA1xvxJ7oNdA/eVXhF+yliiRJzS5CpARQMAi1p0Hnh8VbY89H
	eJZcsL/00dQ6U6XaDBFZWUGZplCVJfw2hQWKDCDprzYC5DSoj9L1asFk+bv+h0CPabCdm6Dqfz2u1
	Ww7pwbjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAp2z-0000000AQhq-3yjv;
	Thu, 09 Apr 2026 13:03:49 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAp2j-0000000AQfQ-0f5A;
	Thu, 09 Apr 2026 13:03:48 +0000
Date: Thu, 9 Apr 2026 15:03:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1775739809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DwJlkFrhXzK7YdnSXVZfyWJS5imgv2KYNIEwcWCOQ/8=;
	b=ctNLCvH2k8O94oUP1N7f/9X/D3DXIaElsVGQKpzKYxDPzKEfCNlIoa8UP3a5EOods5vqWP
	jPg0NVwPnkvnA2UwBLabCE+8oK2fwU6qsqnXlacF21uIHMVRsP9c3/5c9nnURQQ2p/wMfL
	sVCFT2Ryzyny3mgvZwNjR5c/AQECODDGus7vEJKD0vmPQTs2Jcc9YiK6mzoxgIzaAjp4T1
	kOFPuQ8ub5hfZ7xFog/I0l2/X2/S5JrilXJ9mlegVjMQH1CYCOd5jP1qOCHfy6R/QlR4+M
	8yVTjO9/p+MSN/3qnsoqtl8akpWnBiDCh1omh/3iqKaUVhP4abK+cBHTfeqy/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1775739809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DwJlkFrhXzK7YdnSXVZfyWJS5imgv2KYNIEwcWCOQ/8=;
	b=WHNeEGyM4IcIbFjVS5M7g8lLx9V0wq7twewtNqp/19K/t/+Kdxn/LMSS2J9ISiUIPRTfW/
	reD7dStCliSNcKAg==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>,
	Srinivas Kandagatla <srini@kernel.org>, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: broadcom: bcm2712: Add the otp nodes to
 firmware
Message-ID: <adejoCVSpOW5wygD@gregor-framework>
References: <20260408-rpi-otp-driver-v1-0-e02d1dbe6008@linutronix.de>
 <20260408-rpi-otp-driver-v1-3-e02d1dbe6008@linutronix.de>
 <20260409-imposing-strict-snail-5d2a6f@quoll>
 <adeVWKcQyfkKKY5J@gregor-framework>
 <2aa66897-12ce-47c5-993d-e9e1d01a0cdd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2aa66897-12ce-47c5-993d-e9e1d01a0cdd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_060340_153275_5BAA7854 
X-CRM114-Status: GOOD (  27.76  )
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

On Thu, Apr 09, 2026 at 02:15:32PM +0200, Krzysztof Kozlowski wrote:
> On 09/04/2026 14:02, Gregor Herburger wrote:
> > Hi Krzysztof,
> > 
> > thanks for reviewing.
> > 
> > On Thu, Apr 09, 2026 at 10:15:12AM +0200, Krzysztof Kozlowski wrote:
> >> On Wed, Apr 08, 2026 at 10:00:17AM +0200, Gregor Herburger wrote:
> >>> The Raspberry Pi 5 has two OTP registers (private and customer), add these
> >>> to the devicetree.
> >>
> >> So this sentence confirms my question on bindings - your device
> >> raspberrypi,bcm2835-firmware has these, thus you do not need these child
> >> nodes at all. Neither compatibles.
> > 
> > I dont't think so. In my understanding the bcm2835-firmware does not
> > provide the otp registers but only provides the interface to the
> > registers. Though I don't know the details how this is done but [1] says
> > that only BCM2712 has 512bits and the others (like bcm2711) have
> 
> Still the same. s/otp/interface/ so your device provides interface.
> 
Ok understood.

> > 256bits. So both devicetrees have the raspberrypi,bcm2835-firmware node
> > but only the bcm2712 has the raspberrypi,firmware-otp-private node while the 
> 
> Why does bcm2712 use bcm2835 compatible?

I have no idea. But it is like this.
> 
> Nodes and properties are not a solution. See DTS101 question - "...
> because my new device, which is compatible with an older one, does not
> support ..." and answer: No.
> 
> 
> 
> > raspberrypi,firmware-otp-customer is available in all raspberrys.
> > 
> >> Drop entire DTS and binding patches.
> > 
> > If I drop the binding patch how to distinguish the variants? Should I
> > add a SoC specific compatible? e.g. `raspberrypi,bcm2712-firmware` and
> > use it in the firmware/raspberrypi driver to add the second otp region?
> 
> So you have different devices/variants? What is the "variant" here?

Seems so. I suppose there is at least a bcm2712 variant and a non-bcm2712
variant (which is currently confusingly named 'raspberrypi,bcm2835-firmware').
> 
> Writing-bindings asks you to have per device compatible. Why standard
> rules do not apply here? (see also DTS101)

I am not arguing that the rules do not apply here. I want to find out
what is the correct way to do it. 

Should there then be a 'raspberrypi,bcm2712-firmware' compatible with
'raspberrypi,bcm2835-firmware' fallback?

> 
> > 
> > Also what I don't understand why we have all the bindings for
> 
> Neither do I.
Ok good. That is what confused me.

Best regards,
Gregor

