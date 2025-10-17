Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3128BCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 14:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OE1RwCUFQpjSHhtqjiyxSFVV1olT1TnL086Q3IopYSw=; b=ZcQLPF2xxJ/5/c
	2eQv5ONMPdTIca+ehgSqdzxVtG4nvQxpvld3+yjnrqoKNB4C9R5fHUjZoepjLhLo+ianTVLqAIWzX
	nb8Bv7PHnqUqmxNPpH7N+65LPei3DP2iE+Z7VXDmmF7h5kCqPGF8OR1IiHBTIDy5R0ol43y+eO0Lw
	6QmK+avSbZnNSG/ceVzAkb7pII9W+kdVmAWi8FLhoL5D1dslDi9UgLi1FZweVlxTbtbnuqN2p11Es
	AVoXXxN3BlP4Ct00MxiGCLkiQoQrgKhKuSggsYCG3R+mxz33M6M3kryCi4i5e5n7MG53MEzp0Vd8o
	56oGHfbIJP1IKpS6ABAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9lhj-000000087l3-02B0;
	Fri, 17 Oct 2025 14:45:15 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9lhd-000000087hN-39dx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 14:45:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 30031C041EB;
	Fri, 17 Oct 2025 14:44:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 73D92606DB;
	Fri, 17 Oct 2025 14:45:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5AA1F102F2360;
	Fri, 17 Oct 2025 16:44:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760712303; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=OE1RwCUFQpjSHhtqjiyxSFVV1olT1TnL086Q3IopYSw=;
	b=xaXCSQhpeI9tbP+EEL74P8TSHV4xOEN4wshZZ7c9jOz8xPfgMw5Li1VifOB2vnhGxuwDaf
	kUhek0Xm7eN4YM+E4SwvfKzGCFqYc/QfDxXEYDFykTtj1c7VZSQ75boxjMI+qmcZEe2VHA
	Rms9ZLbKqKPpz9S3o/D9MzqTdWY78iZEfYc7TqfTbycc8oewsah5+EuErommgy8gMl15Q1
	Ojx93L15N61cemY0UgXoAu0lJw4pLpdV2Z8e2uC5uuZ8376GwLI+SGKsVniPiqYPB6ldSw
	EJWkMDxlqEaYBkuLgz7XGg8ZFI4Gse0Hq5PQ0UrgkpbwYvc3Ij2DB7tkTuCbAA==
From: "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
Subject: [PATCH RFC 0/2] firmware: ti_sci: Introduce BOARDCFG_MANAGED mode
 for Jacinto family
Date: Fri, 17 Oct 2025 16:44:49 +0200
Message-Id: <20251017-ti-sci-jacinto-s2r-restore-irq-v1-0-34d4339d247a@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGFW8mgC/zXOzYrCQAwH8FcpORuZVK2lJ2HBB/AqHqbTuBtpO
 2syFkF8d8evW/5JyC83MFZhg6a4gfIkJnHMgWYFhD8//jJKlzOUrlyRI4dJ0ILgyQcZU0QrFZU
 tRc2besZlWbNz9bEjFyAf+Vc+yvUF7GG3/YHDu6l8vmQsfSYDm/kX1hQfavmlJKJY7H3Kr+FES
 FitwzrwqqO2WmzaGFMv4zzE4Qm23hhzPUhqiqmaU40aCA73+wPX6L8n7AAAAA==
X-Change-ID: 20251010-ti-sci-jacinto-s2r-restore-irq-428e008fd10c
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
 richard.genoud@bootlin.com, Udit Kumar <u-kumar1@ti.com>, 
 Prasanth Mantena <p-mantena@ti.com>, Abhash Kumar <a-kumar2@ti.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_074509_986108_B2821836 
X-CRM114-Status: UNSURE (   5.85  )
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

This series introduces the BOARDCFG_MANAGED mode, which is used by the
Jacinto family. In this mode, low power configuration is handled
statically for the Device Manager (DM) via boardcfg.
On Jacinto SoCs, the DM-Firmware does not support suspend-resume; instead,
it is restarted from scratch during resume. As a result, the firmware is
unable to restore IRQs, and this responsibility is delegated to the ti_sci
driver.

Signed-off-by: Thomas Richard (TI.com) <thomas.richard@bootlin.com>
---
Thomas Richard (TI.com) (2):
      firmware: ti_sci: add BOARDCFG_MANAGED mode support
      firmware: ti_sci: handle IRQ restore in BOARDCFG_MANAGED mode during resume

 drivers/firmware/ti_sci.c | 153 ++++++++++++++++++++++++++++++++++++++++++----
 drivers/firmware/ti_sci.h |  14 +++--
 2 files changed, 150 insertions(+), 17 deletions(-)
---
base-commit: cb6649f6217c0331b885cf787f1d175963e2a1d2
change-id: 20251010-ti-sci-jacinto-s2r-restore-irq-428e008fd10c
prerequisite-message-id: 20251014-ti-sci-io-isolation-v1-1-67c7ce5d1b63@bootlin.com
prerequisite-patch-id: 7bbf6ca9fb85214b5360548506ccca7fae2e5a16

Best regards,
-- 
Thomas Richard (TI.com) <thomas.richard@bootlin.com>


