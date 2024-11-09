Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D17ED5E375
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 15:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SAxru0Xc6Qc465eBB8h5RFfLAfzLbcUTTVeSr35IuxQ=; b=i7GJmhsG9tagfOJn93RHSQ9pNw
	6ekpWVMfChqyODGPwUTA3QgaT+Icf+Sfu7WKAKkg0wtDZCj52+Q59tFeOsZvfv5t463FE/5mH27f7
	4pPD38r8FVPyRbkeErWP9xRaHF+F+DDKv2POLTd935z8aDNoUfq97LibiC0TufS0KGmdS+iF48EkZ
	gAQhagGyUp/rDgvIMb0ijC/pNOlKOiSqVY/vbiH9DIen7YQWxHywebOpWcovnBbb+k9sm7kJdievH
	qyAGURfFPu6U8jWk4HXqMxSVxbr7sSRiLLFfwBJGHKn/c0JMyVcuBiqfx15/+Ob9JvwN+10mFe7if
	KstIsE3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9nDP-0000000DXZu-3LMN;
	Sat, 09 Nov 2024 15:17:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9nBf-0000000DXPB-0Zem
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 15:15:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0A9B05C54A6;
	Sat,  9 Nov 2024 15:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0187C4CECE;
	Sat,  9 Nov 2024 15:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731165342;
	bh=VJ9+yL4/Qo6csHxmltBLugUE69mq36tQ6mfEaJh/YeA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Zvs42O4DOgKodK1TVptRlfMe7K+kCM9K8JReUjWCtsRxb4rOuLx+ukaDcddGAw08S
	 n+JN/YPByhxF+1e4uXRfSWBJacmuZ3EblQXlJDlhIerAX9Cqulav7Sd0N3JS+13g4X
	 49r5rgRcL0ECJ9jO992a6gDZWlHk7PQlWgm9zhQLtxQiK6TcB0tmQO1ccDDpHVqELZ
	 BbQT0U/if5IY6+aFbvj8bUiCGVLEDkD/ittWQwzY4INH7vWXL+9Gk1yJwLOhpyjJhd
	 GqDn2v75wOJj7fhsnM7t+gY3HSf5dcwr//sP2Zd567f+ZYOm0+G50npKVSwdjHexTU
	 JvgJBUoPbgioA==
Date: Sat, 9 Nov 2024 15:15:31 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jean Delvare
 <jdelvare@suse.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Krzysztof
 Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 3/4] hwmon: tmp108: Add support for I3C device
Message-ID: <20241109151531.37ac4226@jic23-huawei>
In-Reply-To: <014410fc-8a4c-440f-a6eb-1fafccc444a6@roeck-us.net>
References: <20241108-p3t1085-v2-0-6a8990a59efd@nxp.com>
	<20241108-p3t1085-v2-3-6a8990a59efd@nxp.com>
	<20241109131604.5d8b701a@jic23-huawei>
	<014410fc-8a4c-440f-a6eb-1fafccc444a6@roeck-us.net>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_071543_395508_8D4523FA 
X-CRM114-Status: GOOD (  19.78  )
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

On Sat, 9 Nov 2024 06:53:28 -0800
Guenter Roeck <linux@roeck-us.net> wrote:

> On 11/9/24 05:16, Jonathan Cameron wrote:
> > On Fri, 08 Nov 2024 17:26:57 -0500
> > Frank Li <Frank.Li@nxp.com> wrote:
> >   
> >> Add support for I3C device in the tmp108 driver to handle the P3T1085
> >> sensor. Register the I3C device driver to enable I3C functionality for the
> >> sensor.
> >>
> >> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> >> ---
> >>   drivers/hwmon/tmp108.c | 31 +++++++++++++++++++++++++++++++
> >>   1 file changed, 31 insertions(+)
> >>
> >> diff --git a/drivers/hwmon/tmp108.c b/drivers/hwmon/tmp108.c
> >> index bfbea6349a95f..83d6847cb542c 100644
> >> --- a/drivers/hwmon/tmp108.c
> >> +++ b/drivers/hwmon/tmp108.c
> >> @@ -13,6 +13,8 @@
> >>   #include <linux/mutex.h>
> >>   #include <linux/of.h>
> >>   #include <linux/i2c.h>
> >> +#include <linux/i3c/device.h>
> >> +#include <linux/i3c/master.h>  
> > 
> > Seems odd you need master.h in a device driver.
> > I'll guess that's because you should be using i3cdev_to_device()  
> 
> I assume you mean i3cdev_to_dev() ?
> 
Indeed! :(

> Good point, but there are not many examples to draw from. The one
> existing iio driver (st_lsm6dsx) doesn't use it either. I'll send
> a patch shortly to fix that to prevent others from making the same
> mistake.
Excellent.
> 
> Thanks,
> Guenter
> 


