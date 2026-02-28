Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6EAFEE4E8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 10:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vwFb0g+3Dn+Sp1LGvJFqOIA5TbSda0/hm9wge/DggGw=; b=QURxzRpar9ta84oku5c1ubIC8M
	z0Ud5Vjr1wmj+2YItastQRsQ5CbFWNIf7CH3w6q9JQM6xq1G9KJJrZWGtdCnef26L2WH5KRI/X3PT
	xJadz7LjUnlnmQoncGBvZfzwZH102Vr2R5sODk0SScc0TDhJHdyW4pRPuv4I2wW8ChSoQGoL7xFKu
	aJwNacBD8bZYeCYVWuPPnKdA/oIyKViUmB42QSYLvK7NiFi3sPdLrK2d6lqKUlfBQ9N1uxTR9lzh3
	oO36jqW0qjEuQnsmjdFIJDva6+d2Gvt1l9QlOoElcleErgX7VFNoZi84LCL5x4sj+FusMoLIAev04
	22iwfntQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwHKE-00000009iwD-3O0C;
	Sat, 28 Feb 2026 10:13:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwHKB-00000009ivq-3elr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 10:13:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4095B1516;
	Sat, 28 Feb 2026 02:13:19 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 979463F7BD;
	Sat, 28 Feb 2026 02:13:21 -0800 (PST)
Date: Sat, 28 Feb 2026 10:13:18 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Subject: Re: [PATCH 01/11] firmware: arm_scmi: Add clock determine_rate
 operation
Message-ID: <aaK_vgwyH1l8LRJ1@pluto>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-2-cristian.marussi@arm.com>
 <aaI2X6qnGabtW1t0@shlinux89>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaI2X6qnGabtW1t0@shlinux89>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_021327_955465_9AD51E1C 
X-CRM114-Status: GOOD (  15.39  )
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

On Sat, Feb 28, 2026 at 08:27:11AM +0800, Peng Fan wrote:
> Hi Cristian,
> 
> On Fri, Feb 27, 2026 at 03:32:15PM +0000, Cristian Marussi wrote:
> >Add a clock operation to help determining the effective rate, closest to
> >the required one, that a specific clock can support.
> >
> >Calculation is currently performed kernel side and the logic is taken
> >directly from the SCMI Clock driver: embedding the determinate rate logic
> >in the protocol layer enables semplifications in the SCMI Clock protocol
> >interface and  will more easily accommodate further evolutions where such
> >determine_rate logic into is optionally delegated to the platform SCMI
> >server.
> >
> >Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> >---
> >Spoiler alert next SCMI spec will most probably include a new
> >CLOCK_DETERMINE_RATE command to delegate to the platform such calculations,
> >so this clock proto_ops will be needed anyway sooner or later
> 

Hi Peng, 

thanks for having a look...

> Is there any early reviewing version available?

No I dont think there is anything shareable...just some preliminary
exploratory work following your and other vendor reaquest to have a way
to properly determine upfront what will be the final rate starting from
the requested one, because delegating all to the fw-side round-up leads
to issues in some cases when the final rate is different from teh
requested one...well...you know better than me why, being one of the
guys that pointed out the issues... :D (if I am not mistaken)

It is anyway material for v4.1...which has still to be started...so this
was just a reminder that a dedicated protocol version would be most
probably needed soon-ish..

Thanks,
Cristian

