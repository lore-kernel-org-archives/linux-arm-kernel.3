Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E897FCA600A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 09:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zIIIBNZEG4EYad1vmHbD/D7jSqDeHQoRh0K9YrKhhjQ=; b=vnCXvys47bl5vP
	vuphjRysJJwQF2bZfocuLhhbZaaRDFu4NpBUnKrBmBFGDqOf2sAhjOnOTMI3YoFrx/TYm1JHPIKti
	FGUPRGrb/8LZlqkrbZt3Pn+HxMs7l8RJ2EWXRqIJHLnKgP3qGpXRuF4orPETKRFk4lPT+8HcESVRW
	wSwZd/YGk7YceEW5M6cNSxajy/MFlG/zKFUB+tZZp4PUygvqf2iGNb99RnDefvsnog48G1yVit3iM
	jGzRwmbp1IvIRrjDc57f6duq8xkBOwTSN945MfxzyDeU9flEmV8te69xEZgGvct6VY4GT1l+bRga4
	uCUU/NMu7hNZKoW1LWiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEkEa-00000003z7l-0ght;
	Thu, 08 Oct 2026 09:16:16 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEkEW-00000003z6A-2keg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 09:16:14 +0000
Received: from ratatoskr.trumtrar.info (unknown [IPv6:2a00:1f:f805:4b01:1e0e:d42d:4ec8:33b2])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id B734D2004FC;
	Thu, 08 Oct 2026 11:16:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791450968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zIIIBNZEG4EYad1vmHbD/D7jSqDeHQoRh0K9YrKhhjQ=;
	b=US6sD5XVw7wOJGTpw1O8kjg56uxtS6LlwtEikiY0mZwIEfaAVetDNPTylHlGLjmfGkM5YG
	8ybNLZUKfGMAuImt8Sv4viOVzVDCKYm0zhdH8ELMV4wH2LhsAMmijhOxSlvZI4xsdG3k5q
	gTkRCwsDReG+ZeNlLTKVkV8AAr1UQQ1HxxaHigvE2oHcvPinfFYzrj5H2r1FJN7bntE8Iz
	Qex6tYMQ7EcOS8qRQjFSMkDKFdanpwBIizxGbU1bOuMr5JFalsv25zbLjqpeURGQY53CZU
	D7Tmg+uuFe3IDWngwIkHyzHIaEbEJV/FbB+4sjH52re4JCrZZMARadMYOGTTQQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791450969; a=rsa-sha256;
	cv=none;
	b=WSQ8kP/NYanC0etRlqTPSwVD6pBi84VlMI8Dvp1qUOad6CxtAi/9BXK9ComBeOaZktapLa
	+HlHALf6WcM5T9Rhv1uv10DN/oSQULJuxFVzqK/aW1ceHHXf2KOFND2Y3bWab8y2P5skaB
	SRJ9zWiAtmyTUIU70vcaVhNhUHsbMkpDdbYtxU/okP3dsX1FfebVCCPvWn/XuGnh2LTAr4
	s+8bfb8VFEnrS5XRIZRNnFI3LUAoNfVQ2ykvnQMin+dT2ca9V6dxV1e+HsmrVVq2zcM4bD
	AN+7tjsKayC4e5TZSWwdpNErAbzLTAfFekB8bT4Uwq5eIZ/FxMUCSLfphUs8dQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=str@pengutronix.de smtp.mailfrom=s.trumtrar@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791450968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zIIIBNZEG4EYad1vmHbD/D7jSqDeHQoRh0K9YrKhhjQ=;
	b=Z95BCJiTtM+fyQpFm3XAiDB3v+sDhmcxeYk8vBYF3+3sYBqEJBde1VAKwJfmb1uHL79k+U
	wnBv/lVxkv9WBB/H4qY8L4a2Fw0RjZz0JrwDQuu+qu+kMh7HmLegMgvpGp1M34Lutn1iJC
	fTSe8dAqADCQ+47LVVgSQS8BMmx5SCreHpZ4Od1iqd8j1CGBbqwpr5irZoRrZRXVvupo9f
	OUPNZGdv+WzIMUMgLWpCYEGDgE1F/izs1Tqrp8nM6LtaaC+KFIJGEmU8cZ5yDj8cS2Hict
	CCEmedD3nyT5dVPmrZSw6moYHoykGHKIaVURsoEZJXmxPJ6WSMRm+Linvga7ww==
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH v9 0/3] arm64: dts: imx8mp-skov: add new 7" variant
Date: Thu, 08 Oct 2026 11:15:58 +0200
Message-Id: <20261008-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v9-0-11fa90f531fc@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/53SPU/DMBAG4L9SecbIPn+GCcTCyMCGGBzn3LioS
 RQnUVHV/44ThlYiS7pYOuvVc/64M0nYR0zkaXcmPU4xxbbJRfGwI752zR5prHJNgIFmAhSdDGV
 0aLvoaTye7LGj6budaDUkehiHdvQ1NbHJq6hKX0rFnCg8yVzXY4inpdUneX/5eH0jX3/baSwP6
 Ie5zRysYxra/mc50sSX+PbuE89BzkCpCoSWonjusNmPQ9828fRY4dJ7gqsuwWzQIQcRSlMEDxn
 nq7q46obxDbrIwcrIYFAEC4VY1eWtrjfoctaDZ95aMJ7Bqq5u9E0vo3JQm+CcQmRl0Ku6vlfXO
 RicDYbnGygdVnVzrz4HvbOOSam51m5Vt1fdii2/apeZQS2UVFC6/xN5uVx+AaVxd5+QAwAA
X-Change-ID: 20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-3dbcb450a39c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 =?utf-8?q?S=C3=B8ren_Andersen?= <san@skov.dk>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3380;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=jd/pc1OWjyiywuvg4Cn5RWmjvoXoOOrzbGiGfZnRFSo=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ9bx+HAb7u6whJPrp1x/tv6fb1C779xTyk8Ejsg/4mTrF
 T084WFXRykLgxgXg6yYIovKwgo+UY8PnpHTRLhg5rAygQxh4OIUgIlwWTD8U5RRYor5a/PphEHd
 hoVf5riX9j154JzztMnt866/H2//+8/IcFG1ZPrLjZbL33J6H3E9HjvnuUMgm62Op8vaco6pt+U
 N2AE=
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_021612_853197_F28056C5 
X-CRM114-Status: UNSURE (   8.52  )
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

Add a new board variant for the Skov i.MX8MP based family of boards.

This variant uses a different 7" panel than the existing ones.
As the already upstream boards and this new one are almost identical,
convert the other device trees to a base devicetree and apply the touch
controllers and panels via overlays.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
Changes in v9:
- fix dtbscheck error
- squash new compatible into 7" devicetree patch
- Link to v8: https://patch.msgid.link/20260831-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v8-0-e2e635452ba9@pengutronix.de

Changes in v8:
- add #address-cells and #size-cells to i2c2
- fix touchscreen resolution
- add missing binding includes
- Link to v7: https://patch.msgid.link/20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v7-0-ca8a0446166a@pengutronix.de

Changes in v7:
- address more of sashikos rightful feedback
- Link to v6: https://patch.msgid.link/20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v6-0-fa8f71dfc56f@pengutronix.de

Changes in v6:
- address sashikos rightful feedback
- Link to v5: https://patch.msgid.link/20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v5-0-67faa5ee0bf6@pengutronix.de

Changes in v5:
- convert to overlays
- Link to v4: https://patch.msgid.link/20260706-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v4-0-dfc0c8827c02@pengutronix.de

Changes in v4:
- fix Makefile sort order
- add touchscreen fallback compatible
- fix lvds_bridge comment
- Link to v3: https://patch.msgid.link/20260701-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v3-0-d74f7e3f8293@pengutronix.de

Changes in v3:
- rebase to v7.2-rc1
- Link to v2: https://patch.msgid.link/20260427-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v2-0-e2b79fc24391@pengutronix.de

Changes in v2:
- rebase to v7.1-rc1
- Link to v1: https://patch.msgid.link/20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-0-10255d236439@pengutronix.de

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Søren Andersen <san@skov.dk>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org

---
Steffen Trumtrar (3):
      arm64: dts: freescale: imx8mp: skov: fix sort order
      arm64: dts: imx8mp-skov-revc: convert to overlays
      arm64: dts: imx8mp-skov: support new 7inch panel board

 Documentation/devicetree/bindings/arm/fsl.yaml     |  2 +
 arch/arm64/boot/dts/freescale/Makefile             | 10 ++-
 .../imx8mp-skov-revc-jutouch-jt070tm041.dtso       | 38 ++++++++++
 .../imx8mp-skov-revc-jutouch-jt101tm023.dtso       | 38 ++++++++++
 .../dts/freescale/imx8mp-skov-revc-tian-g07017.dts | 81 ----------------------
 .../freescale/imx8mp-skov-revc-tian-g07017.dtso    | 40 +++++++++++
 ...h-jt101tm023.dts => imx8mp-skov-revc-touch.dts} | 26 +++----
 7 files changed, 135 insertions(+), 100 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-3dbcb450a39c

Best regards,
--  
Steffen Trumtrar <s.trumtrar@pengutronix.de>


