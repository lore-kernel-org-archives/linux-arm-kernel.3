Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9096C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Apr 2025 17:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fRJA/JYt7ejKUUo6YzXM95Gf2a+EjwbvNUzyDLCNMdQ=; b=GmC4odLTnucVfMiaBllanBGF2R
	db2pSuZLpAYdF37rLgX/rIQaDOuWJ6wjrFccOnDwsMeEt7a1Ok80jNSAPBeVodnWFJ8wiX6lNMs0F
	OcGXOU6NH9ULmR+9vlM4+0c3fXc1oqzM4VhvQFvpuwyAq+OtcYlGaiT46ugbQMwOamoO1fxJmozVJ
	AHIDkMKk7+07BIpA9XQp4fR0gqHWCiJ8OO8vI8zKAnDRzRjs6dfwtQ3Lzz+I5pWG28deHX0eVo8pj
	25/GeYScByyLer4yxevl3Rzv7CZo/f/9RsBChb6rEqJhrRTPCL5S+Z3sBzCBuRE732O6I8M78yrMs
	723zL3fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6YfP-00000002qhe-2ikj;
	Sun, 20 Apr 2025 17:41:19 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6YdV-00000002qS8-3JIL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Apr 2025 17:39:23 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ZgbN15VYCz9ssT;
	Sun, 20 Apr 2025 19:39:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1745170753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fRJA/JYt7ejKUUo6YzXM95Gf2a+EjwbvNUzyDLCNMdQ=;
	b=Xa49ZO7mLFnaTe4og3Wjip45lb9gpPEqjqU+DTi4eU1hbrugD41XnGQfaV3TD3ThxJeCJ3
	bvD/n8LZZQgfLl/+Mk+OiY/VCbjLCeAw6yMDC7eRVRUNrvXMmZ5EtFyoqPPt2X3Gi/CBl/
	RVrAitObJyly1p6p2P4kOXosQVL34vfcK1WIdc97iS5WaPT1aAZaVljD+7nCFRzxxAJLWc
	dpKj5hwWInP8AU3n+3EtZC+AwXsvNZ/vVTMXw5d1KOGskNPdAGb0Tgm0HmhAb0GrFZcp5W
	6sNfrr1pp41OxFk7P6Ts8TMuN9CBd3v6iOonmONu9STJRVi0qY46SKQKfoxyIA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1745170751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fRJA/JYt7ejKUUo6YzXM95Gf2a+EjwbvNUzyDLCNMdQ=;
	b=tXXpbcOvMA9UBrpEM0+wUG2Ddos8KaiaqN71bEwryCjvLYowjMJTRenu6SJ1ZQg00gZ872
	IZGSn/cJtcrZbaeTR1FRWykO4+TXjw+I2BvOG1BBfeiJgpUEt0uGADxzEIQhea7APluhbf
	FWtu7xUnSB/kFHJQuxiNx4bJ8gyt/eqACm6zPZklG7g2KaLnBeFHH5TqnfW7nkJmRC5xM6
	HelEbohkPR/Srd3a0GyweuSrseTmw7Nj5zsa26ZNSlU1JtVP5XU1v22QrfgoHwSR6DNrHW
	PzSvNFpFKOVzXioA7Jhq5/x73HBC1/ncnxMXfLuq1b3eVCcug7d9jNgrtQWCyg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Junhao Xie <bigfoot@classfun.cn>,
	Kever Yang <kever.yang@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 0/3] arm64: dts: renesas: r8a779g3: Add Retronix R-Car V4H Sparrow Hawk board support
Date: Sun, 20 Apr 2025 19:36:26 +0200
Message-ID: <20250420173829.200553-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: up3uixkic6qyqabapkakkpbj9ge1zsse
X-MBO-RS-ID: 1bd87a255bce825d983
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_103922_087667_0010FE85 
X-CRM114-Status: UNSURE (   8.31  )
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

Add Retronix R-Car V4H Sparrow Hawk board based on Renesas R-Car V4H ES3.0
(R8A779G3) SoC. This is a single-board computer with single gigabit ethernet,
DSI-to-eDP bridge, DSI and two CSI2 interfaces, audio codec, two CANFD ports,
micro SD card slot, USB PD supply, USB 3.0 ports, M.2 Key-M slot for NVMe SSD,
debug UART and JTAG.

Marek Vasut (3):
  dt-bindings: vendor-prefixes: Add Retronix Technology Inc.
  dt-bindings: soc: renesas: Document Retronix R-Car V4H Sparrow Hawk
    board support
  arm64: dts: renesas: r8a779g3: Add Retronix R-Car V4H Sparrow Hawk
    board support

 .../bindings/soc/renesas/renesas.yaml         |   7 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/renesas/Makefile          |   4 +
 .../r8a779g3-sparrow-hawk-fan-pwm.dtso        |  43 ++
 .../dts/renesas/r8a779g3-sparrow-hawk.dts     | 666 ++++++++++++++++++
 5 files changed, 722 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts

---
Cc: "Krzysztof Wilczyński" <kw@linux.com>
Cc: "Rafał Miłecki" <rafal@milecki.pl>
Cc: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Junhao Xie <bigfoot@classfun.cn>
Cc: Kever Yang <kever.yang@rock-chips.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org

-- 
2.47.2


