Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBEBC0219F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 12:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/z/5CqWrmjy7DzVQJLiYDt57i0I/SeVL0TZ7/80aHk=; b=Ki8jW+L5zfZY/Yr8TGcxEPq3sj
	8fiCI1ZXJC062Mi2n1uhVR/m7jwz8DwYduMVfdmraK0L5tGfNy5xL1OEvIVcLyppYnRT5k19jMSde
	CKtvbVPIOusA+iF7wxVd5tzO904SlA7ez7xgGdm0EFyghaOqGzprOHIhsnR/LZTxgIsrzuU9PO2IE
	+FvX2j5Pox8/mffZQh6+EgH8bYhzj96M6maxIQNXyrM2N6CEd3K/zQVUmsgDp66svykTMhRWcvXBk
	O4aeaS4x7R2PFMq0d1w36Xc9jdEbuit7C0T+x87rDS8JSi/OrlEWj5utNOVRQkBKSv7v7TugbIdJu
	ZKfznung==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0nf-00000006EkD-0Zc1;
	Thu, 06 Feb 2025 12:16:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0e5-00000006E9K-1Fbi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 12:06:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D11B212FC;
	Thu,  6 Feb 2025 04:06:35 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D2013F63F;
	Thu,  6 Feb 2025 04:06:10 -0800 (PST)
Date: Thu, 6 Feb 2025 12:06:03 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 2/4] firmware: arm_scmi: Add machine_allowlist and
 machine_blocklist
Message-ID: <Z6Slq4KjS_RJ3ItB@pluto>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-2-3af2fa37dbac@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120-scmi-fwdevlink-v2-2-3af2fa37dbac@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_040613_426345_D6441A47 
X-CRM114-Status: GOOD (  22.16  )
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

On Mon, Jan 20, 2025 at 03:13:30PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 

Hi,

> There are two cases:
> pinctrl-scmi.c and pinctrl-imx-scmi.c, both use SCMI_PROTOCOL_PINCTRL.
> If both drivers are built in, and the scmi device with name "pinctrl-imx"
> is created earlier, and the fwnode device points to the scmi device,
> non-i.MX platforms will never have the pinctrl supplier ready.
> 

The pinctrl-imx case is an unfortunate exception because you have a
custom Vendor SCMI driver using a STANDARD protocol: this was never
meant to be an allowed normal practice: the idea of SCMI Vendor extensions
is to allow Vendors to write their own Vendor protocols (>0x80) and their
own SCMI drivers on top of their custom vendor protocols.

This list-based generalization seems to me dangerous because allows the
spreading of such bad practice of loading custom Vendor drivers on top of
standard protocols using the same protocol to do the same thing in a
slightly different manner, with all the rfelated issues of fragmentation

...also I feel it could lead to an umaintainable mess of tables of
compatibles....what happens if I write a 3rd pinctrl-cristian driver on
top of it...both the new allowlist and the general pinctrl blocklist
will need to be updated.

The issue as we know is the interaction with devlink given that all of
these same-protocol devices are created with the same device_node, since
there is only one of them per-protocol in the DT....

...not sure what Sudeep thinks..just my opinion...

> Vendor A use 0x80 for feature X, Vendor B use 0x80 for feature Y.
> With both drivers built in, two scmi devices will be created, and both
> drivers will be probed. On A's patform, feature Y probe may fail, vice
> verus.
>

That's definitely an issue much worse than fw_devlink above....we indeed take
care to pick the right vendor-protocol at runtime BUT no check is peformed
against the SCMI drivers so you could end up picking up a completely unrelated
protocol operations...damn...

I think this is more esily solvable though....by adding a Vendor tag in
the device_table (like the protocols do) you could skip device creation
based on a mismatching Vendor, instead of using compatibles that are
doomed to grow indefinitely as a list....

So at this point you would have an optional Vendor and an optional flags
(as mentioned in the other thread) in the device_table...

I wonder if we can use the same logic for the above pinctrl case,
without using compatibles ?
I have not really thougth this through properly....

In general, most of these issues are somehow Vendor-dependent, so I was
also wondering if it was not the case to frame all of this in some sort
of general vendor-quirks framework that could be used also when there
are evident and NOT fixable issues on deployed FW SCMI server, so that
we will have to flex a bit the kernel tolerance to cope with existing
deployed HW that cannot be fixed fw-wise....

...BUT I thought about this even less thoroughly :P...so it could be just a
bad idea of mine...

Thanks,
Cristian

