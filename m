Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EC3D32D62
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 14:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xXzmocA+TCHPS8L8CGlGDBhJ9jbUgIy1gGVkekBgKW8=; b=ac071Vzf918Dp1
	OQt3mTjb1XgJeVk1xBXJi9bXf+uy9JpKprG2xtINWxVo9hIn28OV/w8L1GMc494vjpiGgCRxEEAB6
	CPIHdWdncAARTc8ha9upikX7ovmYJ3andLJDkQqEwn9Jq1bMsU3CMCtOScB4jDNeQFv8IZ58h3G+e
	7CQv2yh4Z1LxIRFXFK6JefR7poYyS2AXL5rQpQiUwBfCOT0UpjXqlWN7VUXa9UR4REc8aTJxsSCqR
	SRReGLzAMP5f5IXsnqCu7+7FB803T/SkTwEVC47VxblUn9UIjdjKdLW6/P0e6kutUxv+c9RjuGKSa
	UA7+IohQq89irm1JB8aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRWnf-00000009afH-04Gr;
	Fri, 05 Dec 2025 14:28:47 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRWnb-00000009adX-45HX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 14:28:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 660A24E41A6E;
	Fri,  5 Dec 2025 14:28:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C910606AC;
	Fri,  5 Dec 2025 14:28:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 395D3102F06E6;
	Fri,  5 Dec 2025 15:28:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764944919; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=xXzmocA+TCHPS8L8CGlGDBhJ9jbUgIy1gGVkekBgKW8=;
	b=HVpuUSnLjhVQeNmPIbC3ZQjOhRzzuLzyuWW7g8AJhxsSyWlQaVQsO9wcpEp1UFgeWsQRDJ
	Foq2uExu/DuW1g/BsBt/3zfJKZGO0cVFg9tB0s7Il+kxfdFagwpKeiUOmGYka+TobVKlIY
	W6qTHgslLWaIlJXCU8whsuhipMOJkFX3fA++wE3orHB/mhmzsLvlN+uwIEVWWbPDo2aIZV
	KhxE1PzPZF+syNCGNpf+ygG32YxRHcMSf2SrDG2vJZKv3/jqptg+Izei4dc28ou0jPqLZs
	ZM05waZmrl35PvKXIof+BnJE2gGZEfODi8GOFrVxMh1XZ9FQqFegxnDZy7nDNQ==
From: "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
Subject: [PATCH v3 0/4] firmware: ti_sci: Introduce BOARDCFG_MANAGED mode
 for Jacinto family
Date: Fri, 05 Dec 2025 15:28:22 +0100
Message-Id: <20251205-ti-sci-jacinto-s2r-restore-irq-v3-0-d06963974ad4@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAbsMmkC/4WOQQ7CIBBFr2JYOwYGTKsr72FcIAU7RosFbDRN7
 y6tMY2rLt/P5L3pWbSBbGT7Vc+C7SiSbzLI9YqZWjcXC1RlZshxK7jgkAiiIbhqQ03yEDFAsDH
 5kC9DCwpLy3npKsENy5JHsI5eU+B4+nKw7TN30jzWNAre0xOdGNdfr1jqdQI4SFUpKXcVqkIfz
 t6nGzUb4+9slHc4CwUuCzELtSoLp6VziOJfOAzDByp3cN00AQAA
X-Change-ID: 20251010-ti-sci-jacinto-s2r-restore-irq-428e008fd10c
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
 richard.genoud@bootlin.com, Udit Kumar <u-kumar1@ti.com>, 
 Prasanth Mantena <p-mantena@ti.com>, Abhash Kumar <a-kumar2@ti.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, 
 "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_062844_160177_5DB882E1 
X-CRM114-Status: UNSURE (   7.71  )
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

This is the fourth iteration. In this new version the sci-clk driver also
restores the clock rate. I rebased the series on linux-next so we should
not have conflict with next rc1.

Signed-off-by: Thomas Richard (TI.com) <thomas.richard@bootlin.com>
---
Changes in v3:
- rebased on linux-next
- sci-clk: context_restore() operation restores also rate.
- Link to v2: https://lore.kernel.org/r/20251127-ti-sci-jacinto-s2r-restore-irq-v2-0-a487fa3ff221@bootlin.com

Changes in v2:
- ti_sci: use hlist to store IRQs.
- sci-clk: add context_restore operation
- ti_sci: restore clock parents during resume 
- Link to v1: https://lore.kernel.org/r/20251017-ti-sci-jacinto-s2r-restore-irq-v1-0-34d4339d247a@bootlin.com

---
Thomas Richard (TI.com) (4):
      firmware: ti_sci: add BOARDCFG_MANAGED mode support
      firmware: ti_sci: handle IRQ restore in BOARDCFG_MANAGED mode during resume
      clk: keystone: sci-clk: add restore_context() operation
      firmware: ti_sci: restore clock context during resume in BOARDCFG_MANAGED mode

 drivers/clk/keystone/sci-clk.c |  42 ++++++++---
 drivers/firmware/ti_sci.c      | 160 +++++++++++++++++++++++++++++++++++++----
 drivers/firmware/ti_sci.h      |   2 +
 3 files changed, 184 insertions(+), 20 deletions(-)
---
base-commit: 6c95d7e679d5d01fa48d6a8b8bdb92b6effe34f6
change-id: 20251010-ti-sci-jacinto-s2r-restore-irq-428e008fd10c

Best regards,
-- 
Thomas Richard (TI.com) <thomas.richard@bootlin.com>


