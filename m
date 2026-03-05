Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DC7EF8FE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WcLNzXl21Z0IGz5loeaMz5yAKbSvSMAru23mD8/dYjg=; b=qNVA3mLMY1stbIfvhIm2QndO0R
	7EG4m+iihwIkWDMHzpzoxBeq+L6irrIsqbfXxHlcAFcRDMAAtO6Bd7tn1Lg/mqwprtA9p/ntlSyI4
	2BDxGRT8sTM7o+gLXUjTW0fG1LMsoJmAdXDt5T5TGgEuh8JmfB1hZ3MbtvHxLLQath6YzYhzQIBtM
	6NlMvEVWaWcDYyAlxj8C0YrJrZErHRzhGuLOY6h9PtRc9lNfpRiFdD+V2v+j4BBcZWP3AfP2Xyf3T
	txuHrYIIr/qUE7/2t9k6qxvu+4G4g/hU1h0Ml5A7zLKSVLSWnxnd0JDepDb5Bt56r0iagHfUpfQzd
	bkluJIeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4st-00000001MaR-3qry;
	Thu, 05 Mar 2026 09:20:43 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4ss-00000001MZE-3wRK
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Mar 2026 09:20:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=WcLNzXl21Z0IGz5loeaMz5yAKbSvSMAru23mD8/dYjg=; b=mgukK4nVe4SLJ9FBrtsDBChVUG
	j4ht5ZZRzU603HzaHj/gaoG+6FUpMd74klLHq/tFilW14bMwJJbW1uka+Iz9fvc/O1nE2go9uPf5w
	5ho8k/1Ng7S4wQo9qtf/tyuumsXQ1kbaFDj2dMKULmOYiWqiCNtKfQwK4W4Yshrfv+v+6Y3l6H7ad
	Z+ZgJl/hZaIPa2LryW9gJpwMFUtYCHFwV8ssmuwAKtEYTKuX2G3c56mjF2dFe8xL1CGKxYqroS7pJ
	mOR8Qg97K1s3IJK44nZQK5EfM1pHlxzwdYDeXcjazxaZwU79iezRO+og8mPfZx0Bs2MryvQe926FR
	vgzgallA==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4sq-0000000Ejon-0jYm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:20:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0A4074E4256A;
	Thu,  5 Mar 2026 09:20:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D450E5FDEB;
	Thu,  5 Mar 2026 09:20:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 875EF10369849;
	Thu,  5 Mar 2026 10:20:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772702434; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=WcLNzXl21Z0IGz5loeaMz5yAKbSvSMAru23mD8/dYjg=;
	b=tSJh4rNXf+8kqYmGWjdJRtL1YpUdmBC6t6JuEW42eXnjw0td/WVuYR3U66a5O+Uwod4OYJ
	fCztOUWsGmdatP5yOYZBx30Yy1Hx/cpz11HwuIFK09mg9kZP2WjFTHOKsNHvHWj/xUQgpt
	mU+VLHE86bgHNXxgJEImx2WbjUjSF9EifARjj6ee/Ev5URpTialkzgEtta0LsX4h2h1OFQ
	BxwRujlOM0QzrGgtyc2rK4rgRfvtxvkpz/42qn50dPJxsVmi7ZxIFETLm4uFzBU2YV903c
	Y3wmcSy4WyUG0zCCmulP+FTPWDlv1PBLYa+MNQe4ubnudAIbKuR0u3GcE7Ap/A==
From: Richard Genoud <richard.genoud@bootlin.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	John Stultz <jstultz@google.com>,
	Joao Schim <joao@schimsalabim.eu>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v4 4/4] MAINTAINERS: Add entry on Allwinner H616 PWM driver
Date: Thu,  5 Mar 2026 10:19:59 +0100
Message-ID: <20260305091959.2530374-5-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305091959.2530374-1-richard.genoud@bootlin.com>
References: <20260305091959.2530374-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_092040_349828_40BCBDAB 
X-CRM114-Status: UNSURE (   9.07  )
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

Add myself as maintainer of Allwinner H616 PWM driver and device-tree
bindings.

Tested-by: John Stultz <jstultz@google.com>
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 61bf550fd37c..de284487242f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -906,6 +906,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
 F:	sound/soc/sunxi/sun50i-dmic.c
 
+ALLWINNER H616 PWM DRIVER
+M:	Richard Genoud <richard.genoud@bootlin.com>
+S:	Maintained
+F:	drivers/pwm/pwm-sun50i-h616.c
+
 ALLWINNER HARDWARE SPINLOCK SUPPORT
 M:	Wilken Gottwalt <wilken.gottwalt@posteo.net>
 S:	Maintained

