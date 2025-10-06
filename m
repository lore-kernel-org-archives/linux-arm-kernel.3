Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79373CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 20:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJNQWzi0gwXKlhnl+/RLac5aUIyZ9//wt0NmMV+ryiQ=; b=RMQ6gNwZL2p7zP1m+re2tKZUTo
	V+G56Lx7+EXDAVRYTv2LUUrdEMjJKdxBFPOMdYwtfL1R5cZsWoVvtMo+nrvqosaLC5YGkcUZ0Hkj2
	GSmrK0w+s8kpbzNv7IOUoHSpeDW60NXDsLuGH3aBCUZkjmvhdfnOSiOdN/qIpNrm73GjJsbB7ps9P
	kiuTi6/cDx8qXgNeqFcml9Fydf/u/r+X6bcythoTc+6B1OhWBbhudQVjzXZiqpuJBAue2jmaVmOgq
	7xjVdOw1TPeFJzs01MVPFZFmFzn/AQbaXOyWerKTqpNCW/N2CHZTZfn9q7Ud6GCw4fTiTPDl6VdPV
	GCF8+Wbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5rvR-00000000kIs-16cE;
	Mon, 06 Oct 2025 20:35:17 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5rvO-00000000kFk-1B67
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 20:35:16 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 80112C000C8F;
	Mon,  6 Oct 2025 13:35:10 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 80112C000C8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1759782910;
	bh=QAbf8X36aPDRfLP6OAz+rPPolYsLhmCrJbChrkSk9LE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AFeQ2oWXgXZ/MW6Jyiv1pse8hNq2AVExj2Br1J5LnX4lO1ZjTxRmd+pPhx1GAGT45
	 snoIatZmdthSyX0L2IwkFL/nni/6ZpsCQHunsPsJAmcNvgARqrmFxWC2bnQjlShZ1f
	 +GWQ90pIbyWI0h8eX/0LK895EALGEfVkp5C4FH1I=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 12E6318000530;
	Mon,  6 Oct 2025 13:35:10 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Stefan Wahren <wahrenst@gmx.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Melissa Wen <mwen@igalia.com>,
	=?iso-8859-1?b?TWHtcmE=?= Canal <mcanal@igalia.com>,
	Maxime Ripard <mripard@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>,
	kernel-dev@igalia.com,
	kernel-list@raspberrypi.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: broadcom: rpi: Switch to V3D firmware clock
Date: Mon,  6 Oct 2025 13:35:09 -0700
Message-ID: <20251006203509.2056322-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251005113816.6721-1-wahrenst@gmx.net>
References: <20251005113816.6721-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_133514_436137_1FAC96B1 
X-CRM114-Status: GOOD (  12.72  )
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Sun,  5 Oct 2025 13:38:16 +0200, Stefan Wahren <wahrenst@gmx.net> wrote:
> Until commit 919d6924ae9b ("clk: bcm: rpi: Turn firmware clock on/off
> when preparing/unpreparing") the clk-raspberrypi driver wasn't able
> to change the state of the V3D clock. Only the clk-bcm2835 was able
> to do this before. After this commit both drivers were able to work
> against each other, which could result in a system freeze. One step
> to avoid this conflict is to switch all V3D consumer to the firmware
> clock.
> 
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/linux-arm-kernel/727aa0c8-2981-4662-adf3-69cac2da956d@samsung.com/
> Fixes: 919d6924ae9b ("clk: bcm: rpi: Turn firmware clock on/off when preparing/unpreparing")
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> Co-developed-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/fixes, thanks!
--
Florian

