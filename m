Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65916FD7076
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 10:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FlGrEkibMU7jAxa/nAeVCmJI/B374Ki2x5uFqqjET4Q=; b=Lbd7yIVfxGBtSXCsXXN7QCMmyy
	m8+atBg9/PBQ0ohtJQuVucAgKSkbQ2lwN+sErLp7yYCGo9IU/f6soUgCTF2zFu5qlHaS7W7A6btkC
	y983HDjYGe4ZH04fexBnbZxUdTU3RsvgaaZtl2qAQm+S6aEeF48X4lKQAxvJ4DY+wU8f14Qh0z5iN
	NIy4chrLYoVPWAW8mfpkvBmO4kKZ5TDxMwU3biAeiavgQaxpsG5EmH3Zl7TIXJGFH4ItdhyScnihY
	DnXoH0Sdq2Qa1U9Vv8jp91T8K/g30zoH3AOQrqfSky/v2Zp1HoMNMirN72t4BTt5bxL34EuNFYJYF
	LXLndB4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Rl4-000000062YT-3SQc;
	Tue, 17 Mar 2026 10:34:42 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Rky-000000062TS-1gs2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 10:34:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=FlGr
	EkibMU7jAxa/nAeVCmJI/B374Ki2x5uFqqjET4Q=; b=eFh0XkAGzMPNjtcmbgff
	QOZPMTGhym26jBZOfBrQp5jdXXOXo7UUlMfNPmPoWR8Dxu7QTbJLJ6CzfclOrJ7N
	5pAJufP17U/rg1k57+UhxOkrGs3RKsZLMRDmmhRWfZAznOWUisF92lPnxuozG5Q8
	YCnIWrCduQMe+FABVERNeM8QN85Sby1Y4DRnhpRJ1T/wzRhpZFth+STBXAJpK7LD
	RDtZgOlUxY0GXh+SiBHs6/pv7JDSeDyxsUCSD7HC+zgXPumwIsWLe14e5/TIKZcg
	fkFC8tf3AZXbE2owx+TISJ6/NRNPs36iNKMwuQmFeYGCAWxM9hkc04XQIfij//Ds
	QA==
Received: (qmail 235590 invoked from network); 17 Mar 2026 11:34:30 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Mar 2026 11:34:30 +0100
X-UD-Smtp-Session: l3s3148p1@pjNn4TVNpshSwmvS
Date: Tue, 17 Mar 2026 11:34:30 +0100
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
Message-ID: <abkuNpwmYGa6qJPZ@shikoro>
References: <20260316154159.1.I0a4d03104ecd5103df3d76f66c8d21b1d15a2e38@changeid>
 <abkCPU3rxHI49N4_@shikoro>
 <abkD-VLprcbbEbB1@ashevche-desk.local>
 <abkF0GO01sMcOhvb@shikoro>
 <abkLEgrZbdb03VWg@ashevche-desk.local>
 <abkLY4AAQuFlTRC7@ashevche-desk.local>
 <abkT_jpjIki6pvX1@shikoro>
 <abkqEni3phP8dqqw@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abkqEni3phP8dqqw@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_033439_314116_BFBCBE8C 
X-CRM114-Status: UNSURE (   6.84  )
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


> Like Danilo I am also not sure what lock protects fwnode accesses.

This is basically the question I asked to Doug. If he also don't see
one, let's take this patch as is.


