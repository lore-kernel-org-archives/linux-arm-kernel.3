Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6294D10AB827
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 21:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	Subject:From:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=suinoSXwmZw8kGqKIl2Co6H0rlViaGDmlSqUltSZgkU=; b=0cmftlIFlwZ+VziRQQFWZcf1bT
	4e3CC//HitLL19XMk30KwqvmMu/u3XVBrarArekCIrFPTXI4tQx1HsUvbqdaKcus5avFLumBBqUWM
	eylc4oWt0nsdPNPp5/FLqtxQ4A4ghd5dDoWxPkOacd5jw+KHCb2Q8AMjRILI7Aq9+HF+666IXJTjw
	sZ+j5FhK2xqIFYs4nYlaPU/So5t/s4SmVPTfVlQsXUokn0L0wbpwgztQy2PMO7JbExFvHvBKID/h9
	LGwbJqlFEyoo2Nf4/Ye5XoWwROkBDlypk8HDnzDpJdiLHTqM2cWkQBs2BAu6/9F0633uDSvjryfV0
	1VKCyzaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5rrE-00000006ChC-44EK;
	Thu, 26 Mar 2026 21:03:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5rrE-00000006Cgs-0ETV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 21:03:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ED3EF60054;
	Thu, 26 Mar 2026 21:03:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9306BC116C6;
	Thu, 26 Mar 2026 21:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774558990;
	bh=Oga/OddxY2WJCZhkLe7zcVGjS6Fu4I4k5/6EH62Urbk=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=gPAAIB3fsENGAvoB1ls1d+lyJstfElum/pLWj2DuNK2WleRkSJpZzbuOcSRguNRex
	 LE7yjFpGJeYqgeiTWSX6kkVoDPXfYgQsoiYvVNcYBuRy7Weff6IyhdJ7LJejW3y2q7
	 Lu58LJqd2qR99uWpkNGFPfJeYhdGTH7gmxUd9PImDf3hgeIKuz12xa1bfI6GtosZ25
	 zz/3VILPimPfvECimlah9QRnSQlerX84zqBcJ1XtWuuz4pCn2J3IQkAwYpmSsY+R6p
	 Vq0PeeQgRdA6sV45AaVZZ3KVJItFvjXCg6L1WvlZQDmeunZRkvtTNmqHb/caoBZYIw
	 rdfYLFPYbjpsg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Mar 2026 22:03:02 +0100
Message-Id: <DHD0NQH9UJ21.3J691DBDXS0K0@kernel.org>
To: "Douglas Anderson" <dianders@chromium.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2] device property: Make modifications of fwnode
 "flags" thread safe
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, <stable@vger.kernel.org>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>, "Mark Brown" <broonie@kernel.org>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>, "Andrew Lunn"
 <andrew@lunn.ch>, "Daniel Scally" <djrscally@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Fabio
 Estevam" <festevam@gmail.com>, "Frank Li" <Frank.Li@nxp.com>, "Heikki
 Krogerus" <heikki.krogerus@linux.intel.com>, "Heiner Kallweit"
 <hkallweit1@gmail.com>, "Jakub Kicinski" <kuba@kernel.org>, "Len Brown"
 <lenb@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Pengutronix Kernel
 Team" <kernel@pengutronix.de>, "Rob Herring" <robh@kernel.org>, "Russell
 King" <linux@armlinux.org.uk>, "Sakari Ailus"
 <sakari.ailus@linux.intel.com>, "Saravana Kannan" <saravanak@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, <devicetree@vger.kernel.org>,
 <driver-core@lists.linux.dev>, <imx@lists.linux.dev>,
 <linux-acpi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <netdev@vger.kernel.org>
References: <20260317090112.v2.1.I0a4d03104ecd5103df3d76f66c8d21b1d15a2e38@changeid>
In-Reply-To: <20260317090112.v2.1.I0a4d03104ecd5103df3d76f66c8d21b1d15a2e38@changeid>
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

On Tue Mar 17, 2026 at 5:01 PM CET, Douglas Anderson wrote:
> In various places in the kernel, we modify the fwnode "flags" member
> by doing either:
>   fwnode->flags |=3D SOME_FLAG;
>   fwnode->flags &=3D ~SOME_FLAG;
>
> This type of modification is not thread-safe. If two threads are both
> mucking with the flags at the same time then one can clobber the
> other.
>
> While flags are often modified while under the "fwnode_link_lock",
> this is not universally true.
>
> Create some accessor functions for setting, clearing, and testing the
> FWNODE flags and move all users to these accessor functions. New
> accessor functions use set_bit() and clear_bit(), which are
> thread-safe.
>
> Cc: stable@vger.kernel.org
> Fixes: c2c724c868c4 ("driver core: Add fw_devlink_parse_fwtree()")
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

    [ Fix fwnode_clear_flag() argument alignment, restore dropped blank
      line in fwnode_dev_initialized(), and remove unnecessary parentheses
      around fwnode_test_flag() calls. - Danilo ]

Applied to driver-core-testing, thanks!

