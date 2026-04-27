Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8100FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 16:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D2StE0ESc8+cg1EXdiL6x5UAanNpeePnM77o0NybYIk=; b=LsW/7xTTEfyKk0Oyt8GUAHj7t1
	p505Z9LI3GK9Cc7j/bh7lgS6quoQIz4YWe0CWazh4kXuDyGGYiBXqILoxepPVKnROGT89ZmWAJWsI
	FD4eDH9KyApqF8iEUEz5FnPZtC29T6+NHuoYYMAs+gMEXy96nZ1/XpceokG1q6YpQaozQdVxLc2nz
	7aOzf+Rr/wfdc9OfAfnj7WfayzOTYOyMgDV//ACwZHXZ0diPbQVrVoWso1WTAmwzLJahigRwxQgo9
	uXmg7IH5Tq2HGGnmnfJ7iF7M5twklSYLG/gdECFZA5HwQX1DeguUM6lLZ8RtZz9IVo8pbczehcOIS
	n4bWelgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHOQs-0000000HGTX-3aYs;
	Mon, 27 Apr 2026 16:03:38 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHOQp-0000000HGSl-0WaL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 16:03:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B6BCCC5CD4B;
	Mon, 27 Apr 2026 16:04:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 75E32600D1;
	Mon, 27 Apr 2026 16:03:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1BC7010728057;
	Mon, 27 Apr 2026 18:03:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777305811; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=D2StE0ESc8+cg1EXdiL6x5UAanNpeePnM77o0NybYIk=;
	b=Q1+Q9/cbHXUlq4aOs+WLc1EjpqJPR+ct9H4DiyTk59b0A1XMFkec67M6ZoB3PgMCdjIT80
	mM3SOHQaaouKKX9M44RQzw3xylQf/ycTgiWgD5uK2sQb46l1W6hO0ga1o3f474EjYjIdWD
	o0Tgz3tZUBlCIlQ4KNgJK2ulVT4crxKEThY+XkEmuzu5AxubaVzSIEcjtkQM37Vs+350hS
	bZA+pd45MU51xpz1ErtLa+221XKJ8zzelYrzspc36MD9wNHTby/68Gp5Dzm2OS0gRoznC3
	OC6dEqX0tUTZiRR81vg0IUdwJT9ekLGDG8wQ66q/+xme62SUYtX6tjwH+fsahA==
From: "Richard Genoud (TI)" <richard.genoud@bootlin.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Udit Kumar <u-kumar1@ti.com>,
	Abhash Kumar <a-kumar2@ti.com>,
	Beleswar Padhi <b-padhi@ti.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] dts: ti: k3-j7: Reserve memory for LPM metadata
Date: Mon, 27 Apr 2026 18:03:25 +0200
Message-ID: <20260427160326.370415-1-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_090335_306115_340C9BA8 
X-CRM114-Status: UNSURE (   8.18  )
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

At boot, U-Boot will copy ATF/OPTEE certificates and DM into a LPM memory
region.
Passing it to TIFS with TISCI_MSG_LPM_SAVE_ADDR
https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#lpm-msg-lpm-save-addr
Before suspend, TIFS will save and encrypt TFA context and its own minimal
context.
At resume, U-Boot will tell TIFS to restore and decrypt data from this
memory region.

So, U-Boot needs to parse the device tree, looking for
"/reserved_memory/lpm-memory"
Moreover, from reserved-memory.yaml:
  Following the generic-names recommended practice, node names should
  reflect the purpose of the node (ie. "framebuffer" or "dma-pool").
So @lpm-memory seems to reflect the purpose.

Changes since v1:
- add specific lpm region for j742s2 and j784s4 instead of the common
  one since the addresses are not the same.
- add j721s2 lpm_memory_region
- change j722s addresse to prevent holes
- link to v1: https://lore.kernel.org/lkml/20260312113446.1857592-1-p-mantena@ti.com/

Prasanth Babu Mantena (1):
  arm64: dts: ti: k3-j7: Reserve memory for LPM meta data

 arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi  | 6 ++++++
 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi | 6 ++++++
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts      | 6 ++++++
 arch/arm64/boot/dts/ti/k3-j742s2-evm.dts     | 9 +++++++++
 arch/arm64/boot/dts/ti/k3-j784s4-evm.dts     | 9 ++++++---
 5 files changed, 33 insertions(+), 3 deletions(-)


base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731

