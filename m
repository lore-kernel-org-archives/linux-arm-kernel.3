Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3167D11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 10:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7l63rVxiRGiq7jCcyfTKLymE10grTK2AkGEoW3SZhHA=; b=VsUqH2KH9ZFywK
	SUPw0p/fOE6daQPGJOu4LHlVys5BuzJg+4k8A4N5XNDTK3h3W/oGkPzu6g8KVVcEYhStOhJyXlkMH
	Ld3RTX0wS2G1G02/016xe+fh2KGwjOOb3gWVgpd1L3QT8zRP49UOhgP2gVo5UtF5LnYkrNY8fOIPQ
	cv1ivhY/0wFpg3J700ydKscG1dXLhCNFHXNVavrNU6IXIqi4My+3ErkTHH6wxuBUkBUbUSYYCM+2Q
	tl7gRgOxElSSUXsXTlBXYNlR6W1a0yy5Jw1jRrepZ88EPPjnNXTttuqq8BmLCgHdZ6W1Rq1wppDne
	F6rNCXjP0rYzqcnTDBrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOZCu-0000000GNHR-0kFg;
	Thu, 27 Nov 2025 10:26:36 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOZCq-0000000GNFx-2zqE;
	Thu, 27 Nov 2025 10:26:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DAE1B4E4191E;
	Thu, 27 Nov 2025 10:26:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AE8666068C;
	Thu, 27 Nov 2025 10:26:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F2509102F08C5;
	Thu, 27 Nov 2025 11:26:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764239189; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=7l63rVxiRGiq7jCcyfTKLymE10grTK2AkGEoW3SZhHA=;
	b=rSpNp9b19kpjD7XE6qxhu1DWOp8N/32yB8SHXNyQAl6gZc/TuusDfoaZoU9z48ntFHryXV
	mYxnVm37fkMFQRz1BcyNBpRd2iGa+wdDKbKNJ2o++RJ080Qd9t8ZAW2sOQe0jIJZQNphV+
	i7+9WVvNROgbOEXrPhx+vl45lcoioyxwNIPiaGk/Q1Doztz7TpsYf/mAAmmuu8rY89LxYW
	KGaXfZ487B7fLe+tJuxHnXo009d+pXv8PutZ8FW7Dk1RhiMsqKV+5QzgDBN425vJCdb+BB
	OEtS9zaqrDQH7lgHSvZx9rON2oZuSbQycSuedMIKZ2faYOUCdTqpB3gwPtEJng==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v2 0/2] phy: rockchip: inno-usb2: fix gadget mode
 disconnection after 6 seconds
Date: Thu, 27 Nov 2025 11:26:15 +0100
Message-Id: <20251127-rk3308-fix-usb-gadget-phy-disconnect-v2-0-dac8a02cd2ca@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEcnKGkC/43NTQ6CMBCG4auQrh3TDpKiK+9hWNA/mKgtaSuRE
 O5uJR7A5TvJfM/Kko1kE7tUK4t2pkTBl8BDxfTY+8ECmdIMOTZcihbiva55C47e8EoKht4MNsM
 0LmAo6eC91RmMNFYKp7BVJ1ampmjLw87cutIjpRzisquz+F5/AOJ/wCyAA9bnVqLjjRPyqkLID
 /JHHZ6s27btAwt0iRLaAAAA
X-Change-ID: 20250718-rk3308-fix-usb-gadget-phy-disconnect-d7de71fb28b4
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, William Wu <wulf@rock-chips.com>
Cc: Kever Yang <kever.yang@rock-chips.com>, 
 Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>, 
 Alan Stern <stern@rowland.harvard.edu>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 linux-phy@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_022633_125643_D59A8D3D 
X-CRM114-Status: GOOD (  11.13  )
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

The USB OTG port of the RK3308 exibits a bug when:

 - configured as peripheral, and
 - used in gadget mode, and
 - the USB cable is connected since before booting

The symptom is: about 6 seconds after configuring gadget mode the device is
disconnected and then re-enumerated. This happens only once per boot.

Investigation showed that in this configuration the charger detection code
turns off the PHY after 6 seconds. Patch 1 avoids this when a cable is
connected (VBUS present).

After patch 1 the connection is stable but communication stops after 6
seconds. this is addressed by patch 2.

The topic had been discussed in [0]. Thanks Alan and Minas for the
discussion and Louis for having found the 1st issue, leading to patch 1.

[0] https://lore.kernel.org/lkml/20250414185458.7767aabc@booty/

Luca

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v2:
- Patch 1: Fixed Co-developed-by: and SoB line order
- Added missing Cc: stable@vger.kernel.org
- Added Théo's Reviewed-by
- Improved commit message
- Patch 2: trimmed discussion about "there is no disconnection" from
  commit message to not distract from the actual issue (writes to
  chg_det.opmode)
- Link to v1: https://lore.kernel.org/r/20250722-rk3308-fix-usb-gadget-phy-disconnect-v1-0-239872f05f17@bootlin.com

---
Louis Chauvet (1):
      phy: rockchip: inno-usb2: fix disconnection in gadget mode

Luca Ceresoli (1):
      phy: rockchip: inno-usb2: fix communication disruption in gadget mode

 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)
---
base-commit: cabb748c4b98ef67bbb088be61a2e0c850ebf70d
change-id: 20250718-rk3308-fix-usb-gadget-phy-disconnect-d7de71fb28b4

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


