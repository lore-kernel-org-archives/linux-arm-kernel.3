Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0959AF3380B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 07:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1fxbqImj03OXajBmpzO1CQUCWD5bO4dGjX1EHtbcLAY=; b=LgUdkWREaNxfs44Rq8hIK0ifyz
	vUEqlVmxN3vl+751VCakNSNwrgh0D6sAmv6yuLjJGBWs94nuI9iwO6u5SQwHHuOeNue0cOCyNWWP/
	u1SBXKrtmDXK54SdsOT0UpBIqZGn7uKNrJV8FbEL/X5aV6pfAcnZaOlS7U8b/tn1I+JvU3hVmPLal
	WSsrYhB6XWH7gFWZubinzFjoRXDrxhXE741qKs8xKU2stJAOh720QYhFxgD/Q7F1nKa1RZqmeJOkS
	PIII5Ba9L63c8XrihYfM317GqOJlfAJqWa3FhwKQG+7iZ3HsjSoV6ymxFTsHLYF0x2ZYmcUpmzZP7
	s+xNppeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2P4D-00000005asp-0EYg;
	Tue, 17 Mar 2026 07:42:17 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2P4A-00000005ar8-3X76
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 07:42:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=1fxb
	qImj03OXajBmpzO1CQUCWD5bO4dGjX1EHtbcLAY=; b=Aa6jzP26tOFbp867zHZJ
	/Wez7/ws1xj+fYCjTuWXNVyOt8TBM+Qh+9qqjoe/08lACxSnjZnuze2e/foZ8dk5
	5gst9VJR9MVZxK1up39HIYurtorLzowfdVFjGTms2Bd8nOqGP5sUHw81+ZPpqBc4
	kUmK5QGGEDgIYjxUNWGYXrynV4eLqPjfsHo+Be1UGornxMXwK7Ojtawvhpsw54Jx
	9zkzEXqQSec60WN/Ef1vkS+Kv1IySz9OyALNAU3OcWxPLI0SJrrpG4sxCalVmrfL
	MhE59O6Bns/GhGXVP0ItcgSyUpPoLjBr095rHZgRWEkvI6o1weebYFFstS9Q7bGU
	NA==
Received: (qmail 167291 invoked from network); 17 Mar 2026 08:42:08 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Mar 2026 08:42:08 +0100
X-UD-Smtp-Session: l3s3148p1@Ze/6eDNNfNVSwmvS
Date: Tue, 17 Mar 2026 08:42:08 +0100
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
Message-ID: <abkF0GO01sMcOhvb@shikoro>
References: <20260316154159.1.I0a4d03104ecd5103df3d76f66c8d21b1d15a2e38@changeid>
 <abkCPU3rxHI49N4_@shikoro>
 <abkD-VLprcbbEbB1@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abkD-VLprcbbEbB1@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_004215_180796_DB84AF80 
X-CRM114-Status: GOOD (  12.16  )
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


> > ... this change costs some memory on every system. Maybe it can be
> > avoided?
> 
> How much memory does it cost? On most 64-bit architectures is +4 bytes,
> rarely +0 bytes, on m68k it might be +2bytes. On 32-bit it most likely
> +0 bytes. I expect that 64-bit machines will cope with this bump.

I am not opposing that the issue should be fixed. If it is not possible
to take the lock everywhere, this is a proper solution. But if we don't
have to use more memory, then we could save it. Our new SoC easily has
'struct device' in the hundreds.


