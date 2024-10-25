Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391FBCE8E69
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 08:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oxHxmjGnT5094WqCU180g8AyNm4vdxIMfNZ7MBUhCeI=; b=zYFBCp/DVytQ7je16K6j6S3jFG
	+r95NzbPQwuafIJ59Xae8o2snU0xVLM3tbMLtZxQwXHH+b4pUx0VC4bcoQNJ7kcu9UOplfRHz2Zni
	w4sfYxvKdtccW+iBATYEspGDD/U31gsYXbPn5+QEu85Bqj38a2Z0jejO96Uy1tB/9KJHo7IyD2Nx2
	XjykxdzZ7nca0/PhEUGQ+0T5FOHOSufOcRajWDm0UHjeKvhkcnz7Hyp50eTuMilp7qes0zeyrLqap
	ba2VeZLulXVwKGWrSM5sAfpIaKuIi/H3NnDlGWDmg6OFh2DZ5wZEBWvMbGlArUVjGZ+6eI6Gb7P9G
	6uZtBucw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FTx-00000002wvh-3zoP;
	Fri, 25 Oct 2024 08:15:41 +0000
Received: from bulk0.mail-out.lima-city.de ([91.216.248.212])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FKj-00000002v1r-28LA;
	Fri, 25 Oct 2024 08:06:11 +0000
From: mailinglist1@johanneskirchmair.de
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=johanneskirchmair.de;
	s=securedbylima-20161106; t=1729843565;
	bh=P3R6bpWXHVToa3o5mnFLcdTIAER9hOUy5GkSK3oxbIU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dClucyDY1RF8+yabq5q7fGMmYV0yilRAK4cAeI6j/16NJ/0+n0VCZ1uDg18uP5/DZ
	 E9YptnsWHT40GY0Oeylm2JwhtJZz8unLpwecO7ppMg+Vw1ND8U0laH6sdlAAhg6YCF
	 qjnfFRZm8I/4Lph4zPSAPiQDmt+7CQtlyx7q7n5s=
To: aford173@gmail.com
Cc: johannes.kirchmair@skidata.com,
	Laurent.pinchart@ideasonboard.com,
	airlied@gmail.com,
	alexander.stein@ew.tq-group.com,
	andrzej.hajda@intel.com,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	daniel@ffwll.ch,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	festevam@gmail.com,
	frieder.schrempf@kontron.de,
	jernej.skrabec@gmail.com,
	jonas@kwiboo.se,
	kernel@pengutronix.de,
	kishon@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	l.stach@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-pm@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	marex@denx.de,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	p.zabel@pengutronix.de,
	rfoss@kernel.org,
	robh+dt@kernel.org,
	s.hauer@pengutronix.de,
	shawnguo@kernel.org,
	tzimmermann@suse.de,
	ulf.hansson@linaro.org,
	victor.liu@nxp.com,
	vkoul@kernel.org,
	will@kernel.org
Subject: imx8mp: HDMI display blank/black problems
Date: Fri, 25 Oct 2024 10:05:44 +0200
Message-Id: <20241025080544.136280-1-mailinglist1@johanneskirchmair.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240203165307.7806-1-aford173@gmail.com>
References: <20240203165307.7806-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_010609_992288_602AD6A1 
X-CRM114-Status: UNSURE (   8.00  )
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

Hey, 
We had some problems with the hdmi on the imx8mp and wanted to leave, what we found out about it, somewhere for others to find it.

The problem was that our hdmi display sometimes stayed blank after hot plugging and sometimes at startup. On older kernel versions 6.6 we did not have the problem with the not mainlined hdmi patches. 
We tracked the commit down that introduced the problem for us. It was the following “driver core: Enable fw_devlink=rpm by default”  https://lore.kernel.org/lkml/20231113220948.80089-1-saravanak@google.com/
So we switched back to FW_DEVLINK_FLAGS_ON via kernel parameter. Don’t really understand what the problem with RPM is.

So, this information is just for reference. Maybe someone has an idea what is going on here. And how to fix the problem in a more proper way.

Best regards Johannes

