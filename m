Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E6EF33809
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 07:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+E5JExlH1gsTbrfMSDrOrCsvoCvNuc0M7joRkI7q/a0=; b=aowNcyZmrOabOdbHUuMBjV89Oq
	dPtrFhOm8Y1deOAYf9Gn5IxbkbKGod9CtP0O3Pzo4G++drNF5Fy0fPWj+7K6KizPSt+ocf8dQjAw4
	CQMsIsMgknOxfXptZXcftMvfnW0IiW5boSlJ8De5I0nu/qohP4dtoaF1LRtaPq/kHyjVce23iCQBb
	9M4188E8eUAl4Bs5us0fjN/yI2DyhNsbwEiK1rfBgp4aPwWKXuilG0dLMknQNoHBUx1O9m19dfGLx
	8wgEQEQ1nptxlBesoF826yHNlkg/HXB5ieTEJDN+cRT0KmjuvD+Cs1mMg3BV7TBwHWxzYUURTp2GO
	AmonQevg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2OpU-00000005ZPE-22sD;
	Tue, 17 Mar 2026 07:27:04 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2OpQ-00000005ZOE-2dXY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 07:27:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=+E5J
	ExlH1gsTbrfMSDrOrCsvoCvNuc0M7joRkI7q/a0=; b=G1SOiayi7IoPrStzYmkA
	vE7X7q92XlvwYuEl9Qq+m43cNpJ1xkkG+3XSjgJJ6u1gQUoFRCQaWvd0ltaIwWz/
	HONuSZqyrenHqXgFemBvGilKgGqmEuKXcnp8Z15LGRMALDs51AhRCugiRG2ZV4Px
	7B8PLtMebupyzkbYa1PW8sHAh8ZqVD5/mREnBxYk3r9vU+BvmA5PxdwAF0in6ofA
	GidGANePhLce/03m5Xss1p3CFf+7JesvhB182Kx4jRpvr5t72lro76lUMfRTZflS
	96CCkOxwe23kNqh//4oAvR+2RX1AQZM5LMQLBymy9yiVdMAaxP+s1rKPe3u/WBsI
	nA==
Received: (qmail 162337 invoked from network); 17 Mar 2026 08:26:53 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Mar 2026 08:26:53 +0100
X-UD-Smtp-Session: l3s3148p1@khhxQjNNeKhSwmvS
Date: Tue, 17 Mar 2026 08:26:53 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Douglas Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, stable@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
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
Message-ID: <abkCPU3rxHI49N4_@shikoro>
References: <20260316154159.1.I0a4d03104ecd5103df3d76f66c8d21b1d15a2e38@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316154159.1.I0a4d03104ecd5103df3d76f66c8d21b1d15a2e38@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_002701_546121_6E7B3CA9 
X-CRM114-Status: GOOD (  11.50  )
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

Hi Doug,

thanks for tackling this issue! I agree it should be fixed, just
wondered about one thing:

> While flags are often modified while under the "fwnode_link_lock",
> this is not universally true.

Is it a possibility to use the lock in all code paths instead?
Because...

>  	struct list_head consumers;
> -	u8 flags;
> +	unsigned long flags;

... this change costs some memory on every system. Maybe it can be
avoided?

Happy hacking,

   Wolfram


