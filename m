Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01545C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 19:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dUT9QjPcleGjeO3WBtkcZWNbDB71er7LY0kPdi9BDR0=; b=E8QrRoY+60QYxP
	h0n+HtykS62oKa/Rk9xnckYUiY3sZA6ESFKajdB0H2Ra2WCBqbYO9nkp7CNlbDO6srAQcOb3/K30U
	Sz35HNjEr7pbqDXsUC88c5UhCHce7iXVQOGqkhpeKAKHyn1zKKr2wOZKzquRRJcL9bo/DLy97rpzS
	Ublss6iEasdaod/GJmtstQXIKcb6OCUL4raXC6eT3HzP4re00k3muSYhjytmKs4UZWjy0Fx6NrrRM
	+PfWzD5umUYa43namdxKSG4fl4Kau0eemVyHyvSeinMpczu416hjCm0MJFC1zL15uKHCcbhXYVstn
	BemHSS7jeRfgUg479w+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk6W0-00000005iL6-0VNH;
	Mon, 17 Feb 2025 19:10:48 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk6Rf-00000005haj-491X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 19:06:21 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=zLynZRs8Q49O7Lsgn2PdPf2DNKCgae1hip94DaxzczZGDo41KfW0zZnJ6usqsU14O7mywRgAYOTHYhcISxezMbCYsY+zd1eZDKQfOpSVRJsy5q6lGBB92CtG8x+v25FgYV86XCQ1RVW+RDQ2fFT9XjxeaH15UY0ZBhxPhNq4WZkCY1lr2HwEvywuqrWz5/GSlW99D/sXHzj98/LSmWP7Uly9wEODTmNIKkN8PuZuBQDk48f8QGnl/wDdBEKZEz+m/8nXAWqB9k0rakpM5v93iw/Y/pX2+tMA6QzwZZkDVwC4AfiWZ8ln1Dim3lTeLt5UWXbaMYiOQO3Ih9f804QXjw==; s=purelymail3; d=purelymail.com; v=1; bh=3ay3/NpwCM4uEJeiShAcGmbiyZhukhe5T732PsCDCKY=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1350358103;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 17 Feb 2025 19:05:51 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH 0/2] watchdog: Exynos990 WDT enablement
Date: Mon, 17 Feb 2025 20:05:18 +0100
Message-Id: <20250217-exynos990-wdt-v1-0-9b49df5256b0@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG6Is2cC/x3MPQqAMAxA4atIZgtpoUi8ijiITTVLlUb8QXp3i
 +M3vPeCchZW6JsXMp+isqUK2zYwr1Na2EioBofOo7Od4ftJmxKhucJhkMki8uwjEdRmzxzl/n/
 DWMoHR/wo9l8AAAA=
X-Change-ID: 20250217-exynos990-wdt-0e9100ec5f99
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739819149; l=885;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=3ay3/NpwCM4uEJeiShAcGmbiyZhukhe5T732PsCDCKY=;
 b=yLF3P0Avq7SlNcQxFp+m8USAXVOXTw9vvfL4PZpeHmmhG37wVGZnjHZFzYwZJ0VEyIKLKLs9v
 HNrcGtLa/GhB/i6Q1QS0ZZhpgCm1lio1+Zr093rk8cWjCMqHS4OHyG6
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_110620_108935_205EF1C8 
X-CRM114-Status: UNSURE (   7.45  )
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

Hi all!
This series enables the two clusters of the Exynos990 watchdog timer
to be used. Weirdly enough, this SoC is missing the cl1 cluster, it has
the cl0 cluster and then jumps over to cl2. As such, new cluster index
code has been added to accomodate this oddity.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
Igor Belwon (2):
      dt-bindings: watchdog: samsung-wdt: Add exynos990-wdt compatible
      watchdog: s3c2410_wdt: Add exynos990-wdt compatible data

 .../devicetree/bindings/watchdog/samsung-wdt.yaml  |  9 +++--
 drivers/watchdog/s3c2410_wdt.c                     | 39 +++++++++++++++++++++-
 2 files changed, 44 insertions(+), 4 deletions(-)
---
base-commit: 253c82b3a2cec22bf9db65645f934fbe095899a3
change-id: 20250217-exynos990-wdt-0e9100ec5f99

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>


