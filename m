Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DA0CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 15:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=54gwRkJ2opamtisPwU+rtbGuzqJsDIvGFu8JpBi/GoQ=; b=xVDYzkuf20SEya
	5Bob/P3L0bbLi1Mi6clAnBAQxILbNUUbHpW8gfQ/QPD9nGFFvyiL/BukKD/O6qc7cycS4qJ8IWK1N
	oLmOw2UVgDyI/PYtqiEZR9rrLPO6E4C+008iKOoikq5uS9XTSBxw36dSz60AAmyvOczdb1YjYn71b
	JSfLgd2/T0qATb+v01B98euTkT65BIst+p6yQQDt8MBbNghYLA9ArCqa5epGukaOtQQ+K2Wp4OtDs
	PRow+fmbF0E5LdDW63qhsWPht8246rb6/vGjcA8WRi6ZI+9trUWVxlrNU7CCNDjuKqRFUH/TvGhKm
	I3vaWt9y4vh+Qmz/Xn+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9lwS-00000008BgO-34AB;
	Fri, 17 Oct 2025 15:00:28 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9lwQ-00000008BbS-2ca7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 15:00:27 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1v9lwJ-00028C-Pd; Fri, 17 Oct 2025 17:00:19 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1v9lwI-0044jW-2y;
	Fri, 17 Oct 2025 17:00:18 +0200
Received: from hardanger.blackshift.org (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 8DCD8489288;
	Fri, 17 Oct 2025 15:00:18 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Subject: [PATCH can 0/3] can: drivers: drop skb in xmit if device is in
 listen only mode
Date: Fri, 17 Oct 2025 16:59:58 +0200
Message-Id: <20251017-fix-skb-drop-check-v1-0-556665793fa4@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO5Z8mgC/x2MWwqAIBAArxL73UJWVnSV6MPHlotgoRCBePekz
 4GZyZAoMiVYmwyRHk58hQqibcA4FU5CtpWh73opOjHjwS8mr9HG60bjyHiUVolRy0VOwwg1vCN
 V659uYFSAvZQPGY2K2mkAAAA=
X-Change-ID: 20251017-fix-skb-drop-check-5da14b585634
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Vincent Mailhol <mailhol@kernel.org>, 
 Oliver Hartkopp <socketcan@hartkopp.net>, 
 =?utf-8?q?Stefan_M=C3=A4tje?= <stefan.maetje@esd.eu>, socketcan@esd.eu, 
 Heiko Stuebner <heiko@sntech.de>
Cc: kernel@pengutronix.de, linux-can@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Marc Kleine-Budde <mkl@pengutronix.de>
X-Mailer: b4 0.15-dev-2196b
X-Developer-Signature: v=1; a=openpgp-sha256; l=1027; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=pWc9HZbLPbfcSCrgHFOQpUP27TzOtZyl/WElcU1OSLE=;
 b=owEBbQGS/pANAwAKAQx0Zd/5kJGcAcsmYgBo8ln6myT9qBOPNmTPcBHzX2BueVmxUrp6rx6VN
 CA77ZyrQ3OJATMEAAEKAB0WIQSf+wzYr2eoX/wVbPMMdGXf+ZCRnAUCaPJZ+gAKCRAMdGXf+ZCR
 nCZEB/96b7TNVi+j7RI9FP0tDmjKZgiS1RBQZMmfkPW68pgASoz4UZcKgYDTpUGwB+p3BEAcy0e
 hFHSIoLf/S1LsSJFzejD9TXrvSTlQ99ZzPJIaZ2UUpY9rPd9zmn5ROaF6TdVEre5p+/tPVpSzyI
 p3+yo52xskYjA28LPTv1+ByW94+IwR1qwf4Awd3eBsk7vF2JYr6fmBJZ9OD8QCJ5UAmdU+ggnmt
 o5wrCvC36VewAfHVbzFSuH8wmfzX5eafwLOom787d4kmFArucbo/eLNBA/t3StVhY+3qp/W3sE4
 SrcF7l5fgMEP+5QsJ0/T8sopsA42gd/tAsS2HzQUkAIfukOh
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_080026_671234_C518E6F0 
X-CRM114-Status: GOOD (  10.73  )
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

I notived that 3 drivers (bxcan, esd and rockchip) use the function
can_dropped_invalid_skb(), that doesn't check if the device is in listen
only mode. This series converts these driver to use the new
can_dev_dropped_skb() function.

Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
Marc Kleine-Budde (3):
      can: bxcan: bxcan_start_xmit(): use can_dev_dropped_skb() instead of can_dropped_invalid_skb()
      can: esd: acc_start_xmit(): use can_dev_dropped_skb() instead of can_dropped_invalid_skb()
      can: rockchip-canfd: rkcanfd_start_xmit(): use can_dev_dropped_skb() instead of can_dropped_invalid_skb()

 drivers/net/can/bxcan.c                      | 2 +-
 drivers/net/can/esd/esdacc.c                 | 2 +-
 drivers/net/can/rockchip/rockchip_canfd-tx.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 7e0d4c111369ed385ec4aaa6c9c78c46efda54d0
change-id: 20251017-fix-skb-drop-check-5da14b585634

Best regards,
--  
Marc Kleine-Budde <mkl@pengutronix.de>


