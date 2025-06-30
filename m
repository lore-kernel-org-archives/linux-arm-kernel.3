Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB067C83029
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 18:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y7HamuIOi93Ir+D7BNI5NjTYA8k3P5m2JucOy/ndy+o=; b=KQVQqgWHj0q0t0KkocOmF/Aj61
	3h+T6rF6305OAYZcCh6SbrZECucrovH7tfYZW9aPIWGS/PdpEsa+JQjFolqHwB64bAkUbNdCM0dHA
	eUFioJuUXZNDpBa0ipkGbT9yqtxytsjeES4DcMH8Br04UzOWvGgCdQop8a068pkiw+AIL3S36R/Dy
	dHHzABdzW5lRaqpzK9n27+fMSC+ofCbe6e8vAEvB6rxpMtz8tCJwkLsWItt2UmzgjvNx1rSDgkMO9
	a4YUtSCJY0oB+eEjChStE+udgl/FboNL/QiqC5hJ7ffpYS++xOA6P7ruyzoyFrpJeMMh6MVxu6j7z
	ILtvH1nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJCy-00000003C9A-0E1D;
	Mon, 30 Jun 2025 18:26:24 +0000
Received: from mail-pf1-f170.google.com ([209.85.210.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWIsc-000000038yf-0dMB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 18:05:24 +0000
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-747fba9f962so4490871b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 11:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751306721; x=1751911521; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7HamuIOi93Ir+D7BNI5NjTYA8k3P5m2JucOy/ndy+o=;
        b=nf7yBAZK475P51w/sl7EiJTkRO0X+ki7/2BDsmHATO54nG2txenqUByyu6DCesQTD1
         7ttNEdq4zQTJ2Kc14oZDBRX0Q6pp/DcLmCNwMeGO6LBaGojV3PJcMO3pazpWUjtvMDW3
         cF9n94RnAUOKfRpaOFMZya56dsQN9ZTcOs7ZRMip/Wuwfrwu9k07t5nS6Waid+WhKY85
         gwR3YXCoX5w5pScSZkpAJFwkM8qf/SJvkH9r62FXuqyNSpvUewME59KGjHefRACok9EV
         dH4g5iVRl7UMbMIpX/dTWO8JCIuja/zhHxvvNZWJiNkjt2FahBIMEkcfs3QZQI1OJHBQ
         fIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751306721; x=1751911521;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7HamuIOi93Ir+D7BNI5NjTYA8k3P5m2JucOy/ndy+o=;
        b=o4sk8eNHsML2/JpUJUDyTTYO5rkKd4ZoVqyjoIP36cSUUbKNiqFPabWRLCDriXrDdM
         W7PJm0FHvd20pi4Sag2g4G6BYNPQCGOSa4qcbD/6bjEEzs2GiWxwGglqjTi+mi0UDaPv
         7HcXQ7WFQf+F+e1IusDowoYRrhUXzVplsFQ0Et4ROUzTigHqRqk9+aSMLi6cirDGUi+a
         FawvwpZHJZHLVfqLRdsVJyt/S6lNRoIeNqGiWAYl29pIYFnToc2QIl/ux9PxghF8wUOW
         5cpTBjWgIyEMbstnP8fetTnituJuiwLXBv+/IwzdcYKq8xyBk2rg9F16f+ymNemlt5Hs
         m2lg==
X-Forwarded-Encrypted: i=1; AJvYcCVJQfqwDRPGgXSlCOL+bWVG7I1zfM1hzm1y6so4l74TPGjLjVN7uhf8VX55wmkd0YFBjE/UuAH0Mu0qCdEs5SRq@lists.infradead.org
X-Gm-Message-State: AOJu0Yza+12Ls3q9MFP28GL420Q2Ztl4aoPwHTDy0L4bWKyhZD+Q83Z8
	0Jtg7qOexNVNgVJyW1JhEFSDI8jFGzmPtZZrx3UIN34WUV6IlHd1slfOyU+LrjBDx8U=
X-Gm-Gg: ASbGncsYyC2iCf6sIpRV4GcVCthnjjNJr0jtRq4uQHP8sZxtrMRONh18JD4Ts52foNO
	W83vG+UQZwI/iuOXQ9cWTgZTrKLa9ks1qVNuvMk9FqJ9rw68gQTTEhLUzsQ/w+LyVYKPVK8j+/z
	DxL9IL5jCWyqUXWFLOeruM+pSDgRHcGtx4neAquWy29KOzS+Voh691w5xr7EiIINPLZnpITAzv3
	Aa+oM3z7t7ep2Zo5/94CcoFFLIScqTxsJgHY8qPX91IgKcx4UU/11HUkihq/LIV7DrRr7Xp25bi
	tbHiw9kAZwEyhNCrDfm1ofjxAZ/58wXtqx0msEXqYedMkVrx4K+epPRh4CPG
X-Google-Smtp-Source: AGHT+IEncS/HJPiBmiJZCLKoJU2/w51Fp/NZyo6t579QG+npzr31j+vLXXC/vxt7lYssL2dcF7zMQw==
X-Received: by 2002:a05:6a00:2ea1:b0:736:4e14:8ec5 with SMTP id d2e1a72fcca58-74b3bca995dmr669511b3a.11.1751306720777;
        Mon, 30 Jun 2025 11:05:20 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af540990bsm9409550b3a.21.2025.06.30.11.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 11:05:20 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Paul Barker <paul.barker@sancloud.com>, 
 Marc Murphy <marc.murphy@sancloud.com>, 
 Kory Maincent <kory.maincent@bootlin.com>
Cc: Jason Kridner <jkridner@gmail.com>, Andrew Davis <afd@ti.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Romain Gantois <romain.gantois@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20250620-bbg-v5-0-84f9b9a2e3a8@bootlin.com>
References: <20250620-bbg-v5-0-84f9b9a2e3a8@bootlin.com>
Subject: Re: [PATCH v5 0/5] Add support for BeagleBone Green Eco board
Message-Id: <175130671963.2621907.636669398639023401.b4-ty@baylibre.com>
Date: Mon, 30 Jun 2025 11:05:19 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_110522_298965_BD6094B4 
X-CRM114-Status: UNSURE (   9.39  )
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


On Fri, 20 Jun 2025 10:15:51 +0200, Kory Maincent wrote:
> SeeedStudio BeagleBone Green Eco (BBGE) is a clone of the BeagleBone Green
> (BBG). It has minor differences from the BBG, such as a different PMIC,
> a different Ethernet PHY, and a larger eMMC.
> 
> 

Applied, thanks!

[1/5] arm: dts: omap: am335x-bone-common: Rename tps to generic pmic node
      commit: 297bd457c893966f37fc07b68162862bff3e7c77
[2/5] dt-bindings: omap: Add Seeed BeagleBone Green Eco
      commit: 23c7d1976f52fd8b8031ac0e5f4f60166cdc32b5
[3/5] arm: dts: omap: Add support for BeagleBone Green Eco board
      commit: 6d04ead94d49df8d549122d89999f1faf27b5373
[4/5] arm: omap2plus_defconfig: Enable TPS65219 regulator
      commit: 299c277aa74cb011b00d6aeb5ccece37e9166d91
[5/5] arm: multi_v7_defconfig: Enable TPS65219 regulator
      commit: 536407b5b87d16e048b75439d5f2e1246078d32c

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


