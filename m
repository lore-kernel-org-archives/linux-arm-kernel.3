Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176ABD73E80
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 20:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Yd8vqPuDJs6A9HBqtaH0N3O9T7pK9wr434Z9auOWydY=; b=wWTwMFt3NdWNdvbrqfM2Y6Visq
	X+e+TX5yGTkyQ0hp42JzsjB1Cx/OanyFTvwnVawpQKKHHUFTDAfV8hOErvYH5+b1N16Ia2UlEvpRu
	sJDHT/IlBjBtmqoX3zHi+k1EkBiqOO98VjdFzpBi1/oEC/TV1FoYMMH6jRspFsoLDUe8IyrVVL0tt
	MEAFlkcdjDPmtSxb5whkPSrP7zw19t3Sg/aKPhf7pggmX8rB6wdL+HI9azpTABMzR5o2u3RnkVCmC
	4qK5IET3KQT7KRnr7LgZTNqW4OGZa9+gaxcX+DcBFfgn87ltpOkoScD3NRSrOSsyy7u95zpkumcT6
	4mhJeFNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlYOF-00000000ayy-3LSM;
	Thu, 29 Jan 2026 20:13:19 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlYOD-00000000axo-0kK2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 20:13:18 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 0AEB1C00032C;
	Thu, 29 Jan 2026 12:13:14 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 0AEB1C00032C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1769717594;
	bh=RdjtsMcnX2o1C5c9vkJkDiZ2Aglam7vGt6A/5D1H8Gg=;
	h=From:To:Cc:Subject:Date:From;
	b=ZH2QOv4eYuzg9CRUZbiuGPKHIgdhxSXeIDdGhXFgb5TepoRvUj/BR9mVU+G9RN6aN
	 JtzbNTh71rOjC7JERAJNivLd0I57yQmg6u9x6aIc2hpKYxUCuxiqMkS/K/QvYwFkjw
	 Pll01BE43b03NnQUb+/sJI5/EOEHaAmGpoh8Qgc4=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id D493522D76;
	Thu, 29 Jan 2026 12:13:13 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH v3 0/2] gpio: brcmstb: wake-up interrupt improvements
Date: Thu, 29 Jan 2026 12:13:10 -0800
Message-ID: <20260129201312.634819-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_121317_372762_9EFF9E2E 
X-CRM114-Status: UNSURE (   9.60  )
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

The last two patches improve the handling of early wake-up conditions
and makes it more robust so we can use those during "s2idle".

Changes in v3:

- added Linus' R-b tag
- removed useless comments

Changes in v2:

- corrected the patch implementing irq_mask_ack to write properly to the
  STAT register, this was not the case
- create a separate helper to write to the IMASK register to make the
  code more readable
- remove unnecessary cast of unsigned long to u32

Doug Berger (2):
  gpio: brcmstb: implement irq_mask_ack
  gpio: brcmstb: allow parent_irq to wake

 drivers/gpio/gpio-brcmstb.c | 114 +++++++++++++++++++++++++-----------
 1 file changed, 81 insertions(+), 33 deletions(-)

-- 
2.43.0


