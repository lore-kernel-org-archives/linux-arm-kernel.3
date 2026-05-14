Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FDDCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 12:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tso+x53GYlnnd0bvooYwZlfjSVUPwDAvBozCDW1Oo58=; b=JK4Wb++f9kV1zIWxSlSqS0tqD6
	BzouBls7BLByHnuxJBwDUxJXZyOUkVTB/ewtArTSj9tQ2P1YXKOjFHeMvGFAHmpqQ02HKDxPLvRjg
	+5Yw7tf/Wi0ji8FDN1FvaCAG3UxOX4fcsxmL9qIAboocoKgzSi2eRmMLG1cc1vxBlo9kJ0UwgtE/u
	wrln+yKx2YHXU/qeg0Um6l1Q24/u3+MCA/IczKup28MnEykNhWKC/LaZtuGhktgqNUE7kUIUMfFv5
	Wtbhz6REj/ivGRRYKDQYaEeDBhs1pzFcZroshS2Zfyv3PFfHreb76RPF0J+cAODDkZX6OtXl1P4pl
	9qZHFq9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNUru-00000005PrA-09iF;
	Thu, 14 May 2026 12:08:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNUrs-00000005Pqm-2Mdn
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 May 2026 12:08:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Tso+x53GYlnnd0bvooYwZlfjSVUPwDAvBozCDW1Oo58=; b=i7VzwMDXVgyOqnxIg2RDZGbMPH
	dTuC1s9vVYxzbXxpJe8RXiNP5RHBBO3fjSU+DhlRZSukV+ZbdOkhiHkOY6W+ihyEz0M2xMSvb0WKA
	4AT9BHptXY9Wqm92ynGkGnQ8fHXJKn17UZ866X5H73N+y6wM79bHYiS4EEtNhigyC6wFyVRhlkz/y
	rKdPKmOw7gSnUpckJcu1XJRRF7hsRj/cDYhit7b0x2eQQ0J2j6WYyCHdiLM0GIvcHOILGR2w5vLfw
	dldZE4UATUcv4GByT8h15SdMEJ+JN2+olH/U9J8ZDoYbbzBG7ABzmgSv7ZajGc3WpFeFsMLYk4+zw
	lxSth9lA==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNUro-00000002pia-3v3s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 12:08:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Tso+x53GYlnnd0bvooYwZlfjSVUPwDAvBozCDW1Oo58=; b=N42aHMGcEd3zaZq6JElfHZEouQ
	+DhFxWFVsxTwX7NXiV2+zHnq+cZuoEX6ZfJFp65Cu0xLKfjhUo4LI1ng4MZI4y7FTjjY4L3W/X/gp
	cra0CT4Y+gYEHqsX7o8KzF0XKfJyS9O+oe2YCP15HK8e5bkuhSvuwCPIL6mttnemsstw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wNUrS-002trT-CM; Thu, 14 May 2026 14:08:18 +0200
Date: Thu, 14 May 2026 14:08:18 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Message-ID: <a71d6b4c-fba2-4f02-9603-4370b52663e1@lunn.ch>
References: <20260514031622.1416922-1-prasanth.padarthi10@gmail.com>
 <20260514031622.1416922-3-prasanth.padarthi10@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514031622.1416922-3-prasanth.padarthi10@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_130841_467401_E1D0F2D5 
X-CRM114-Status: UNSURE (   6.65  )
X-CRM114-Notice: Please train this message.
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

> +&mac0 {
> +	status = "okay";
> +	phy-mode = "rgmii-rxid";

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

Please could you explain the choice of rgmii-rxid.

       Andrew

