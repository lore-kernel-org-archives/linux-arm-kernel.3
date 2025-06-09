Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920B6C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 10:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rBP2bjN3J40BBX4g+8MnAQDZBCDDmY2yXfpvG9Ju4kY=; b=DdwacOztB/gLYGrP8sniSzvRr1
	DRCkRVlT9Ow/euqr0sJOZpvRoy9hBysBCLNs+gNcH++foaXm+CIjpT5ePuRMpw972e3ETntQgrEhB
	YzoMvnngyZ5LoYY4zaN3A0D7a1yg8lbm3460N+kv8O81XqOnX+Zzm0c6MMhca6X6Z7G0UpsKr6N46
	ATmvqBREYjuVW1Wm4bDujE9/hvk2wsW/enOqZqzgcSfNFN1HmMtVcZMfx7GSJImFZIHJ4KCIJZ3e1
	lG2jDP8yqMtkm3fZpJVh/2XBCHru0xzlzANC5XXXeYLiEX2RvOR0D8lKyRzDyAbcLrOQv9mWIyF/2
	JEGcOMWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOZQO-00000003rkj-0vmW;
	Mon, 09 Jun 2025 10:08:16 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOZOG-00000003rYv-28Tb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 10:06:05 +0000
Received: from isaac-ThinkPad-T16-Gen-2.lan (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A393B1D8;
	Mon,  9 Jun 2025 12:05:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749463553;
	bh=e2fCJ9ISiEL3nr4jR1Jaa14oeZ314fLVzRidXKO7Ruo=;
	h=From:To:Cc:Subject:Date:From;
	b=mN5sw0IqZF55Qvzl81a3hJEZSZORZ1fT1vdzx8zGjkZMQWloxJNrJQd+EjW5rYX6c
	 P5dQc/v8YVO9MxyVGGxu+03FdyGxIHtdb8hrJ2mduUJwd/voHTgB5jYw77AJHYaWI6
	 Fq2RH3tPWgTLtH2TH9lJsbwFjOX6lb0tE2kPUM+o=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: kieran.bingham@ideasonboard.com,
	rmfrfs@gmail.com,
	martink@posteo.de,
	kernel@puri.sm,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v3 0/2] media: imx-mipi-csis: Add line end IRQ to imx-mipi-csis driver 
Date: Mon,  9 Jun 2025 11:05:42 +0100
Message-ID: <20250609100544.571821-1-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_030604_866986_C010448F 
X-CRM114-Status: UNSURE (   9.58  )
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

Many boards, such as the NXP i.MX 8M Plus, feature multiple interrupt
registers. This series refactors interrupt status register debug handling to make
it more intuitive to add other registers such as LINE_END, which has an
entire register containing only one interrupt. Previously, the
mipi_csi_events[] list contained a debug enable field, and this replaces
that with a status_index, which indicates which status register contains
the mask for the interrupt.

The second patch adds the user line interrupt, which is useful for
debugging, as it allows a user to trigger an interrupt after the MIPI
CSI receiver has counted a configurable number of lines. This can make
it possible to discern the true resolution of the image stream reaching
the CSI receiver. It adds an entry to debugfs which lets users choose
how many lines are needed to trigger the interrupt, and can be disabled
both within and outside streaming by setting the value to 0.

Isaac Scott (2):
  media: imx-mipi-csis: Refactor interrupt status registers
  media: imx-mipi-csis: Add user line interrupt to imx-mipi-csis driver

 drivers/media/platform/nxp/imx-mipi-csis.c | 111 +++++++++++++++------
 1 file changed, 78 insertions(+), 33 deletions(-)

-- 
2.43.0


