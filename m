Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38A8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 13:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8sQSDqAelniprUW0bjLh4r7TPdrV1wyI0a++eXewKTc=; b=U3JUfDGeN2JU1T
	PmTNBLJOGHPDiu/APZdkgN8QKtSW1v4IEwxV/QuLcUkm7oMIZYu5ySoY2WQ8IyMRJmDJHc+Gdp3/t
	Cgesek0ShLtWBnD0E+MSwbeHBC82oNdTw3KfONcffRJGqb2oJHAgTJj0HO6fgdR3whK1xyhXsUya1
	Y9INPju/EiPuW2GDVqIyqmODM6/uBtwk16iV1M63gqzx8UynTt46LXvKpeyhC2WZbH59GQItBOi9l
	KOorSusrBBUAFwXTtOo9Ou27vQn8IcuwKeHVLzez4DC8p2sl3uRmHVeSFLB0cmA42FUs2/MgnHZyK
	4wV7cmFDQVvXTX/2gZjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdG4-00000006zqX-0p9B;
	Fri, 03 Jul 2026 12:44:40 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdFz-00000006zny-06Rq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 12:44:38 +0000
Received: by chaosmail.tech (Postfix) id 61AC31CC21E;
	Fri, 03 Jul 2026 12:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1783082669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8sQSDqAelniprUW0bjLh4r7TPdrV1wyI0a++eXewKTc=;
	b=fD0bWHtD56p8eHPQqsgumvfj42tKkzjKFtun/Ui6JnVvuo3KeE5/XJTfv8TYl9UG4OTV7c
	ENIt18XZMj3CVi3508IJK3cMRCTsf6GaaGGwHTBJnQcaj76xnIpqqYgrIjM8oN7MR0G1y5
	TKIJya7jhsnnPE5ej/jB2AFU2XnJXiQ=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v2 0/3] soc: apple: Add "PMGR misc" power controls driver
Date: Fri, 03 Jul 2026 14:44:10 +0200
Message-Id: <20260703-pmgr-misc-v2-0-4b26ba10c5a4@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Oyw6CMBBFf4XM2pq2Womu+A/DogwDjJFHOkg0h
 H+3xa3Lk5yce1cQCkwCt2yFQAsLj0MEe8gAOz+0pLiODFbbi861VVPfBtWzoPJksKpdhRZziP4
 UqOH33rqXP5ZX9SCcUyAZHcs8hs8+tpjk/esuRml1bnTu/MlfHZoiPhml9/w8zoQdlNu2fQH3x
 RwUuQAAAA==
X-Change-ID: 20260702-pmgr-misc-ae1cbd5bc2c7
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Hector Martin <marcan@marcan.st>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783082668; l=1706;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=8D7Po7SCptGVEHm0r1MA8F5t/rLXTgEyoB3RxAxQRVM=;
 b=e3ZFilP3ziJzNDOl7lwPRWQtPWYiZ5G7wAfzdU4XPb501CsLWgxMMUj2XHpsqfs0+DPbrs0Ly
 fzzPfCV5UPwAkaC2yglrcnQKXYlcPbgI60fspd56MPuzJFdeX7Wu3y1
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_054435_536626_5E99B36A 
X-CRM114-Status: UNSURE (   9.38  )
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

Certain Apple SoCs have additional power state controls that are using
a separate "misc" mmio interface. Currently this includes the fabric
and memory controllers on pro/max/ultra SoCs.

This series adds a driver to put those in a low power state when the
machine enters sleep. The power savings are SoC-dependent and are
around 1W.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
Changes in v2:
- Error handling fixes
- Reword binding description
- Link to v1: https://patch.msgid.link/20260702-pmgr-misc-v1-0-4f075a3a95c1@chaosmail.tech

---
Hector Martin (1):
      soc: apple: Add driver for Apple PMGR misc controls

Sasha Finkelstein (2):
      dt-bindings: soc: apple: Add Apple PMGR misc controls
      arm64: dts: apple: Add pmgr-misc nodes to t60xx

 Documentation/devicetree/bindings/soc/apple/apple,t6000-pmgr-misc.yaml |  45 +++++++++++++++++++++++++++
 MAINTAINERS                                                            |   1 +
 arch/arm64/boot/dts/apple/t600x-die0.dtsi                              |   7 +++++
 arch/arm64/boot/dts/apple/t602x-die0.dtsi                              |   7 +++++
 drivers/soc/apple/Kconfig                                              |  10 ++++++
 drivers/soc/apple/Makefile                                             |   2 ++
 drivers/soc/apple/apple-pmgr-misc.c                                    | 179 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 251 insertions(+)
---
base-commit: e5d9690657844a2645a518cdf838206f6daf513e
change-id: 20260702-pmgr-misc-ae1cbd5bc2c7

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>


