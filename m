Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2847F33817
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 08:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=irztfqdefDjxQXcIA83sbW0ur9PPGeP0t0NSrtgsi4s=; b=ujf4jJmHs4Xx40ulk4j3Z74aCy
	lNd/GbsgtUI8NSwpEQCYNCU8NOOtLmALjXF67BY6cRblL5yXFQ/4r4HRTKLzlbOCnYJvTLjbwvWAB
	b4alCz8OideSNb7CNyma22yHTP26hzdNnRsLWGZM9TfkUdRHCIPGxsyLV8bqg5JTl0tT2SW/03MG3
	pq5iTwURtB2b5/Vx94NKEsBe6mBc6zzVQeJl+mcf+p7RNQmsaLTbshJu7juDDlK5JePCWlJ2xzyLZ
	Gck/IVCUa7xGm2kH+CkAHLIpye7Qmh5SPemD4mlYPQvk/JWMgsdKeVssuSvfLEXMP/mxNjgmVeynS
	ZHkK10JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Q0n-00000005kP6-24jS;
	Tue, 17 Mar 2026 08:42:49 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Q0k-00000005kNa-1cOx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 08:42:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=irzt
	fqdefDjxQXcIA83sbW0ur9PPGeP0t0NSrtgsi4s=; b=JkTPL8Qa9lTezefnVa6i
	PuYCxImKQCA7y+YErvUuovrsTDP4lQ8/PbcRoOO+H227ulh0TCzmz92MT4WGbqnm
	gtzhzsyqq/usEM+njAVl6Ta70MEaZ99nvIxLnlXqsAmQwno9VfN3R6Gu8SqvG6zT
	1+efsUaKoaaQKySH4J7r8j2pWizdLDHaXluauufhjIxnxU5B2wjQ+zeZ+4bfm6ND
	Nfhf5jo5AWZbwlhYHEYbtJJ0jDxp/LSpcc1R2ia2HSyf37lZiJ0rS+7oS1HGjWKQ
	MWVM2QCBt6kUATI0QRa2cnXhsD7zsgMr2oUr6HJLJ/rEFm8WZweSEjfIASNyHNtj
	KA==
Received: (qmail 187280 invoked from network); 17 Mar 2026 09:42:38 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Mar 2026 09:42:38 +0100
X-UD-Smtp-Session: l3s3148p1@e79TUTRNPMFSwmvS
Date: Tue, 17 Mar 2026 09:42:38 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Douglas Anderson <dianders@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, stable@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>, Daniel Scally <djrscally@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, Len Brown <lenb@kernel.org>,
	Mark Brown <broonie@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	driver-core@lists.linux.dev, imx@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH] device property: Make modifications of fwnode "flags"
 thread safe
Message-ID: <abkT_jpjIki6pvX1@shikoro>
References: <20260316154159.1.I0a4d03104ecd5103df3d76f66c8d21b1d15a2e38@changeid>
 <abkCPU3rxHI49N4_@shikoro>
 <abkD-VLprcbbEbB1@ashevche-desk.local>
 <abkF0GO01sMcOhvb@shikoro>
 <abkLEgrZbdb03VWg@ashevche-desk.local>
 <abkLY4AAQuFlTRC7@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abkLY4AAQuFlTRC7@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_014247_299732_0AEEC43D 
X-CRM114-Status: GOOD (  10.33  )
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


> > What's the alignment for the u8 member in your SoC? 4 bytes or 8 bytes?
> > (I assume it's 64-bit SoC.)
> 
> FWIW, with the given change it will be still inside 64-byte data structure
> which most likely occupies a single cache line (before this patch and after
> as well).

I consider this directon of the discussion irrelevant. If the number is
(maybe? That's to be discussed!) needlessly bigger than 0, then it
doesn't matter how big the number is.

Why don't you like the idea of taking the lock?


