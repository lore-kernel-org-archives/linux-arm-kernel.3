Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E2DFD877E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 14:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XlJj6+XtRnLs033bhaxlmEjesLS+qafeUVhuDo8ItlA=; b=RheCbYJeWwP+YGyBDV9x6wn8Lf
	unKZ1CGaV7dfnnGOXPGKCs4jB6s7vRkRV/ssvka4VrfbE6fGT+UCF7R3yiQeifmylCiqkLgLv2vH8
	77LCltL23kUj5TauJRkWTkN032eVgC5/r1f0a7GuK0JhwpDILR/nlVAQsFfh1GtRdTIJzKbzBFIQU
	W1knBQxz/0g4fRl/VE9wP1CxkLkM6M66MGLxaM56UhaaHPwAaCoe/P9e2pVFuFX1wOv7pC5jK7a19
	mvWquHHNluP/t+VIhue++Lwp81kA4TsEREbrClu3F2tqJyavdyTzlQl04Oy5OYw0Xm4KitUaMckA1
	Y5aaH2xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VOx-00000006bxh-2kqW;
	Tue, 17 Mar 2026 14:28:07 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VOu-00000006bwE-1dXv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 14:28:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=XlJj
	6+XtRnLs033bhaxlmEjesLS+qafeUVhuDo8ItlA=; b=bG2zxRXQ9Fu9bCPjNpx3
	P7wgiIDoMXLCFMRPPmDltjPAhFzrIRxLaSxIF85pzMhW3YyHuUmEPHx4tFc4UUho
	Wo06erk7gncW5uU46/3R7WWSOx6aUij0lMRTitWmNhEITS6dBlW5FTJQJ9Lann3s
	dlppwJoBzJT5UfzY5GRapN/vktmt/GFIZqfQ7PYY1fBvA6Tbh+0RN0wBNuR0C9Z/
	Xyd1b5tVvedLvdm7mrVbuvLIWeLiCjAeTKnuo2FG1hjxzOQTRhAzR5B4ebBzP+t3
	vgcwphcy28vVhUjbhXw+mZaFWm3+CISUtLErtDSyofA6mcDgcyIeFO1eGKVh/IO/
	FQ==
Received: (qmail 312797 invoked from network); 17 Mar 2026 15:27:57 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Mar 2026 15:27:57 +0100
X-UD-Smtp-Session: l3s3148p1@LnJGJDlN/LM+XdJ7
Date: Tue, 17 Mar 2026 15:27:52 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Douglas Anderson <dianders@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Message-ID: <ablk6O2XMUc1EKK0@shikoro>
References: <20260316154159.1.I0a4d03104ecd5103df3d76f66c8d21b1d15a2e38@changeid>
 <abkCPU3rxHI49N4_@shikoro>
 <abkD-VLprcbbEbB1@ashevche-desk.local>
 <abkF0GO01sMcOhvb@shikoro>
 <abkLEgrZbdb03VWg@ashevche-desk.local>
 <abkLY4AAQuFlTRC7@ashevche-desk.local>
 <abkT_jpjIki6pvX1@shikoro>
 <abkqEni3phP8dqqw@ashevche-desk.local>
 <abkuNpwmYGa6qJPZ@shikoro>
 <CAJZ5v0g=_HW7i8-emNdTtw_0Kjqri8qTehHvms52u-w7jqG6bQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0g=_HW7i8-emNdTtw_0Kjqri8qTehHvms52u-w7jqG6bQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_072805_305343_3B136C84 
X-CRM114-Status: UNSURE (   6.73  )
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


> I don't recall using any lock for this purpose.

In that case:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

counts as an ack for i2c, too, of course.


