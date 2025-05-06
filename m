Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F09C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S6PuN11kmLGkE9CdpXY3LsP08NiwndWR9cFcKMuKbeQ=; b=4PK/yjhrn4kE2TD5sq8mTtzDC8
	3y/RqO0Gy5fjjDiwvPL4ayRDMf2VrXs7HU4m2PmYkLbkaqR6Yk3DlueBIiyJi9IdXi3FdhfvRQqnQ
	h1mI5v09ZPry+5tm1DDXehz1MfmKOQ6kIv9FYaStHO3rXkGIcoAR3fIdLygLrksubA7lmw9h3/JVC
	4KCEmZfllu4H1/I6NEf6IIdPe/WfjuyZb3R/AnI6FuBi6QJjOBtp7EOlURY4mvR4toCOCNcEVGF4t
	Z3kG1WG0qWBRh+d1P75xham2/Gpo0JkA+SsEPr29Dyk0+cDe6zhRiqqGNiciL+EG2+64Z1rTVN4pv
	qTJmOgVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUcc-0000000Dy8a-3yOP;
	Wed, 07 May 2025 02:34:58 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQic-0000000DZtF-0jdH;
	Tue, 06 May 2025 22:24:55 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6e8fb83e137so59843216d6.0;
        Tue, 06 May 2025 15:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746570293; x=1747175093; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S6PuN11kmLGkE9CdpXY3LsP08NiwndWR9cFcKMuKbeQ=;
        b=Hxj1MzwZyoeC9xPbvssqbncR4LY7WdhM6GZdfZb9cPGoQZZDs5mHDHzc6+To8TT6kc
         oDzAQG7SRwNYEVum32KEvmwYM76SRqBQQcHalASN97FJEftSrcZV5JQTYQ3o6O1SAsIS
         5syXyOBgueSByQ2jtyQpk90QSrSB8jL5JbshTDz1Vhjrgl053g1r4bDJ+ldBcbXw/lWl
         huX3IeaI3xTgxrf3jt0qj8ZaEbisJCNtGsOv3xgPlsPE1n/jfQLkIeHAzP7TVmSU/Rtu
         dOPe93dYekYBRPQE29MaYF3fQD9O/ktSlg0V86B5vcDRurHSiekcw9zV3l5JckNkgEpR
         TNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746570293; x=1747175093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S6PuN11kmLGkE9CdpXY3LsP08NiwndWR9cFcKMuKbeQ=;
        b=Sk6oVPpkBXeAPdar7LMNqhuDl/hbldcQV5HUXHjFAbOsPL8BG+BULfA2ZuP8V6DBve
         +UkRmkP7TA7GFo4g/hBkpwaD6rKFKF0wSjLZGwOMT2CflA5OT2ZVJ/8Bl45x3xnTZDA1
         o8fThFV5YIbDb93aWwWiYMxexKz03sSYFH4D04C2VgXfcmX+DjhSkPT9LYU1EX8qfIc6
         jmBTbXkDVzOscOEPT5VglXdP7XfT1rcPm4SahpcaWsjRWgTtcPqfgDEocPyMo9kN1skt
         DXVTPj9dLmrEm6DDTX84vG9JbWbHmKnce+oKHa1tF+wO04HHomhcJkjnbcXqePp/Ze3+
         PJPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJzuSWnV5/DNRcZkCMjIglmENHLU/E+FaW2DobsJSiXwMCkenpxnE9tHQ0lXSLXd2TLZ/8b6ewLv5Hqm4=@lists.infradead.org, AJvYcCVWkhGWQrvZNWhG8G3NqjUPXahmq9RjC6Oa1kKkmGOn9GbjDYvxOZpw6IOI1deZlMlcfeKq/kEUeEbRGQcJAtUV@lists.infradead.org
X-Gm-Message-State: AOJu0YwXdRJa/QKQYfqWcO9d7Q7S0nfPRXMq5pyeMKoKF2yXbZDFNBwj
	jdffqjKPffRZHVwuJTMTv+fBZS72QSgrjrdXgHVv7k5DefjsXB1g
X-Gm-Gg: ASbGncuOpXrveUXN281BFYgxvMTdPsjNKxLo2oGXBhx/6HaX4/aztdSHwbOq6nQ77Jg
	HKpllexc/uoR9yiKiH2tQiWd6fkD1KwkO+utCaL8c7eOkas5Lcgz4MsLB3OOYwSnhPtZdZGNnbM
	JydS/DzjvcQEuz8MAvYLEJE0Q+x27M7ZQLJXOoFo5TGaYbnHxLrKskuspWO/VfsP0T+nW4dwmTv
	dwI9FFprhuiHPa3lVrk6clEo1ed40Ixkdt+6gjv96NR/ZNkth3jcx3qlBM3cv9i81cQDLJp3jYY
	lswZXKrYUPjsLig9
X-Google-Smtp-Source: AGHT+IE/HcOkUaQ1OjeZ76XLCIoAMcLQ4gb8y3bZBjcdCFJTsGZuHVr3Qr8wRx0H5mUFdFynUfAxQQ==
X-Received: by 2002:ad4:5b87:0:b0:6f5:3e46:63f9 with SMTP id 6a1803df08f44-6f5429afe88mr16025426d6.7.1746570292605;
        Tue, 06 May 2025 15:24:52 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f5427b07e6sm3118126d6.106.2025.05.06.15.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 15:24:52 -0700 (PDT)
Date: Wed, 7 May 2025 06:24:29 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>, 
	Guo Ren <guoren@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Romain Gantois <romain.gantois@bootlin.com>, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, 
	Lothar Rubusch <l.rubusch@gmail.com>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next 0/4] riscv: sophgo: Add ethernet support for
 SG2042
Message-ID: <fgao5qnim6o3gvixzl7lnftgsish6uajlia5okylxskn3nrexe@gyvgrp72jvj6>
References: <20250506093256.1107770-1-inochiama@gmail.com>
 <c7a8185e-07b7-4a62-b39b-7d1e6eec64d6@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7a8185e-07b7-4a62-b39b-7d1e6eec64d6@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_152454_229967_200FB213 
X-CRM114-Status: GOOD (  17.75  )
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

On Tue, May 06, 2025 at 02:03:18PM +0200, Andrew Lunn wrote:
> On Tue, May 06, 2025 at 05:32:50PM +0800, Inochi Amaoto wrote:
> > The ethernet controller of SG2042 is Synopsys DesignWare IP with
> > tx clock. Add device id for it.
> > 
> > This patch can only be tested on a SG2042 x4 evb board, as pioneer
> > does not expose this device.
> 
> Do you have a patch for this EVB board? Ideally there should be a user
> added at the same time as support for a device.
> 
> 	Andrew

Yes, I have one for this device. And Han Gao told me that he will send
the board patch for the evb board. So I only send the driver.
And the fragment for the evb board is likes below, I think it is kind
of trivial:

&gmac0 {
	phy-handle = <&phy0>;
	phy-mode = "rgmii-txid";
	status = "okay";

	mdio {
		phy0: phy@0 {
			compatible = "ethernet-phy-ieee802.3-c22";
			reg = <0>;
			reset-gpios = <&port0a 27 GPIO_ACTIVE_LOW>;
			reset-assert-us = <100000>;
			reset-deassert-us = <100000>;
		};
	};
};
 
Regards,
Inochi

