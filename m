Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F480E8B37E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 23:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aoh5JSL8/nMTjJ7Z8MweQSERul2ptdPL7jAong4wZpo=; b=FBF79HkDQmW16XcJkZlLVoswsF
	mj+Kr1w2Nch5SztfoV/hXFGA/p9WCNdCLnVepIZQvR06/0iDnrv6VLoiKpiheHTuyIVeOTmoxKqVV
	7E9shQ4P3AQgCuoExxDIthDg6c8tw0FDKAFQJoHkoR1Td4/MBgnOVLZI6oc3O3WqbYr+i4NKw9MYc
	JapNG6FVeWF5eLnrr3840Cx+9siJMK6PyxYUwIzB3EQtQnzPBZfGu+9dJf00ocTvPrHAJMRLlAhp6
	5PsLkUCycq9eXlC5R0cdNdNgyxt2dmbkQYkbOPLChLuMEhxH/39EAd0Ditph1/Ax4SE/O/VM0xlhj
	ro8Bi3RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnQ5Q-00000007aKw-321y;
	Tue, 03 Feb 2026 23:45:36 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnQ5O-00000007aJR-07B4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 23:45:35 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id CCE18C05219A;
	Tue,  3 Feb 2026 15:45:30 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com CCE18C05219A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1770162330;
	bh=JppXUACS/8ytxWcZoC5tDRWNTGvKaGGNk6/gemc46sI=;
	h=From:To:Cc:Subject:Date:From;
	b=GvL2dlvrwgC6SZOyc+4/txdIOPtJ99sj+z31FArIgoJd2YgyY0aib3FyRvmBJeaHI
	 oHVWMzsxnhbdx7J5m90UjJW/W7mk+qopvZwLso/ZEQiVQKrND4umTQWw6Wsz/kaR2q
	 6G0O6udkbfDvjBZzc48dOdz2mKqrkql1FyjBFGgA=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id AC5F417DFE;
	Tue,  3 Feb 2026 15:45:30 -0800 (PST)
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
Subject: [PATCH v4 0/3] gpio: brcmstb: wake-up interrupt improvements
Date: Tue,  3 Feb 2026 15:45:26 -0800
Message-ID: <20260203234529.1081148-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_154534_213674_A7BE95AD 
X-CRM114-Status: GOOD (  10.52  )
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

Changes in v4:

- Provide a leading patch that utilizes irqd_to_hwirq(d) to fetch the HW
  IRQ number
- Utilise .irq_mask and .irq_mask_ack notation in the commit message

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
  gpio: brcmstb: implement .irq_mask_ack
  gpio: brcmstb: allow parent_irq to wake

Florian Fainelli (1):
  gpio: brcmstb: Utilize irqd_to_hwirq(d) instead of d->hwirq

 drivers/gpio/gpio-brcmstb.c | 125 +++++++++++++++++++++++++-----------
 1 file changed, 87 insertions(+), 38 deletions(-)

-- 
2.43.0


