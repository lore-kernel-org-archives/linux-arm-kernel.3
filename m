Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFD4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 17:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1SG94HhOt+5W3OfsJw7P4ktoxCg32fCEoowTbQTAaFk=; b=qQLmbTzurcqqJWUnAb3fBu0ezR
	6f3z7Szc7QIOMnCOLgK0EyyT1fBeRCadYs84u+yJZ1fNOQzU4Yh3q/SCjrB0h0u9dHbeAHFfcOJL9
	rdIcMuuxxRMxDnt3TxKhDw8LiY+Ge8U/DhrvxLRSu0nivB/Hw5YT5RK2O6TjlM57p/kpYjBZUCyFy
	5cPLmAFElmoq9v2uSQamF/AqDLGndIyy92AvqMBqXZUk5T7b8L65gW1UIEVD7mWfKmiOseXZkvURH
	4+pav94g6N6fdIEp9jTTQst+3qSOEqM95avvAUaXT6fwpfh06qiPkqY3o/AXGsZaxf4lXuI38Nn9z
	bKkk+fTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whssW-000000039qH-3gT3;
	Thu, 09 Jul 2026 17:49:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whssV-000000039pu-3pFc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 17:49:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 361AC42A00;
	Thu,  9 Jul 2026 17:49:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2604F1F000E9;
	Thu,  9 Jul 2026 17:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783619379;
	bh=1SG94HhOt+5W3OfsJw7P4ktoxCg32fCEoowTbQTAaFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gsnej/esWKXBhCklADIWGd/ro3xhJd8T/ytpzvimbeZ91iAxj4Co6Brmchb97qbtH
	 4l5eWPHYWQ0/c63OiQLiXmuiXiiBlX9a0pDxGzcYgO60Yl+d2KmwrXkJcCV0KTt4WN
	 zvGBv6VAUptmtepVltsOzbz99O/DzAa+3Iwac0pelGv5RNB+/SMveR0piIthD9DAUb
	 y8bcKsHomDI4QApGeiPbMBR8ibCaBVkaklDNzhDHLFAGDRvEWeCqTXRyUs+bAGYC/x
	 TBmxaQsDTOIipz4JdFHwl2NVMHfSud9iTXEUBY0BgYenjie46NRjeyuNywqxt/cUx+
	 iSHYLU7IYttRw==
Date: Thu, 9 Jul 2026 18:49:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Linus Walleij <linusw@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 02/11] dt-bindings: interrupt-controller: apple,aic2:
 Invert #interrupt-cells condition
Message-ID: <20260709-cork-pardon-83a2a1162ce0@spud>
References: <20260709-apple-t603x-initial-devices-v1-0-55b305833123@jannau.net>
 <20260709-apple-t603x-initial-devices-v1-2-55b305833123@jannau.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gvegRxeBV0F9Bdmx"
Content-Disposition: inline
In-Reply-To: <20260709-apple-t603x-initial-devices-v1-2-55b305833123@jannau.net>
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

--gvegRxeBV0F9Bdmx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--gvegRxeBV0F9Bdmx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak/fLQAKCRB4tDGHoIJi
0gwGAP9KpTcWT1GGf0kEJ7QAREbxKDU+G1C2xD9j0seF18pPQwEA+Y0o+hyF2XTN
VTxDdwXGMU1zXAn35aC3T59eUkFuqQE=
=iVsk
-----END PGP SIGNATURE-----

--gvegRxeBV0F9Bdmx--

