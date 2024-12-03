Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B90E69E9F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 11:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HckHfqd1Ci6rmjSqq4jkSS7hiji1q1F7NU0SCgFEvmw=; b=Kp8CQZGImMlci+U7WNLtGOFD4X
	sg8I6RGSvGh5xW3God5MrykuEDKb9Zfai/PD0F8lZ24oF8PsdjsunXJXQIZCo0UOcxQ9f/jLlhFix
	aPvvcb0ustOJPH+L2E4cy/LcbLmGEjob6TIBSt6YPSoFjzX/n1EuBXjgtqgidH21vtOXrCplV0NBg
	NS2UQfxW/33DE+A6bcOTci3xXYO3nr7mmQYNdL5DNO0Rf/VdudkQyMInEDs7jk1KMEi7uMCZgc/sZ
	fD0bK9UkAKz1fjo5u9rgsc+3/d5AuDokVnp4REsbuPWbTSX55kom7kaAD0oXURUx04bqHWJmCltwD
	MOz8PnYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQh7-00000009Bh2-1yLL;
	Tue, 03 Dec 2024 11:03:53 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQPs-000000097uH-3ECK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 10:46:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=HckHfqd1Ci6rmjSqq4jkSS7hiji1q1F7NU0SCgFEvmw=; b=GYJJlfCTzz73b3h2Mt6iEEDNRu
	AOeaqNKu9mpvJQY8YbJjd1ZfBMvJwxlxsTD37HpItfsU9han+JWfFOJKUxaCArHc+RRbnkYiJglrV
	UcyVdWDrF6PwqJjK3Oyj03pcPmIPOR/F/6uKgLHlK32r7NBRH2hcbgLElX8CAHqwOQ6M5vAN3tI93
	uLwdtRWhBhBt/13KLlLW8g/1NqrGhK+xri6yTUwt8tGj+k1JF8sFCVjnUpHFHgTFurueeejNCVa1P
	2aKxSFzRDJck5ezBB0XGUXo/7nrCxc5BzQMuLa5iq5hJ1miHzs373wU1WDrdxR/KdGv42HF15lPSc
	nJOIGDCw==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1tIQPi-0001PS-Px; Tue, 03 Dec 2024 11:45:54 +0100
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1tIQPi-000LCx-0P;
	Tue, 03 Dec 2024 11:45:54 +0100
From: Esben Haabendal <esben@geanix.com>
Date: Tue, 03 Dec 2024 11:45:34 +0100
Subject: [PATCH 4/6] rtc: st-lpc: Fix initial enable_irq/disable_irq
 balance
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-rtc-uie-irq-fixes-v1-4-01286ecd9f3f@geanix.com>
References: <20241203-rtc-uie-irq-fixes-v1-0-01286ecd9f3f@geanix.com>
In-Reply-To: <20241203-rtc-uie-irq-fixes-v1-0-01286ecd9f3f@geanix.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Esben Haabendal <esben@geanix.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733222752; l=826;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=HikzWfGUHdTPcWzOAsF0rH2hfac+zvWroN/rJRztwt0=;
 b=8Vqg6fZTE/p/+KF1BlVVtd+83PourQxUoWZXQn/mUt9bvnFZCLorV9aF867KVouKsn3OJN2sl
 wqfo9+wfKNmD24TJGy5aeAutisgd/gGfeZmtBfh7RiGY6hoJHR63G0G
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27476/Tue Dec  3 10:52:11 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_024604_814613_6A87D900 
X-CRM114-Status: UNSURE (   8.45  )
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

Interrupts are automatically enabled when requested, so we need to
initialize irq_enabled accordingly to avoid causing an unbalanced enable
warning.

To: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/rtc/rtc-st-lpc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-st-lpc.c b/drivers/rtc/rtc-st-lpc.c
index c6d4522411b312f94de2701ff4ff491e5323aa96..dbc2c23bca23f5de6de3fd4b39c9c67290bfd78d 100644
--- a/drivers/rtc/rtc-st-lpc.c
+++ b/drivers/rtc/rtc-st-lpc.c
@@ -218,6 +218,7 @@ static int st_rtc_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	rtc->irq_enabled = true;
 	ret = devm_request_irq(&pdev->dev, rtc->irq, st_rtc_handler,
 			       IRQF_NO_AUTOEN, pdev->name, rtc);
 	if (ret) {

-- 
2.47.1


