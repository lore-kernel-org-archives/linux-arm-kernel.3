Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12351606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 16:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fJoKkYvV;
	dkim=pass (2048-bit key, unprotected) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=ZdRrrU+H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kdeSiPiSYHtLZiKEroKpbvx3t/mSs9j+e1JMptZPqNk=; b=fJoKkYvVqI6bwr3TrzL3lwbq4R
	/JKQUvF+VKRa4V51UhKiqEb2k6W24zjdrX4LP/vY2OJnxeoXT49ZPpx+Tgb7u5iSTA9EAMqhlF0JH
	lNGskfvB+obHIbJ8k2xMZN64mpPcz1poNM9syMc4baE7Jp44lViS5z2A7JE9GVNKHrmp+eWJpQUP/
	yWbAVBFn5UCNdoHHB6BaSfWWSokP1tYWwftrx7ISR+3ML84a/muS73BMxT9vPfnCN+KjV5XVnAl4R
	1HooUIXsOPK+/PA56aclWNhwdHI7ZDGfJL+6/C5ha7uScU4KmXL10F/juUnT/+kf3KlzelTbVRzPn
	4iWOVcnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBIX-0000000A0jj-1ExK;
	Tue, 20 Oct 2026 14:58:41 +0000
Received: from mail.tipi-net.de ([194.13.80.246])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBIL-0000000A0au-25Of;
	Tue, 20 Oct 2026 14:58:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AE718A1624;
	Tue, 20 Oct 2026 16:58:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1792508301; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kdeSiPiSYHtLZiKEroKpbvx3t/mSs9j+e1JMptZPqNk=;
	b=ZdRrrU+Hmj4+G5xCCf3YPzOoNy458sP8nEQztvwiHwEeKp7UI3W0KG6Z/6x0/0+sedyF5l
	j2cKh3sUu9vl8Qz1tmXrbC0HL/vZ2hGyIuY+be4eiGlXxNGHwdTR8mAFUW30wfzCvXdprf
	k4i+eKvtQHrNHHdap5YhbpfeO2BSFKaqJET3iM3Z2Wmrc0fKiMs9bN1t4FvqctotE//pnB
	BwFmQxdftnvIc4RP+EHPWxh1ePPYq81j3qMFT6DssY3Bpx/lFNLXm4XsRP1phLaD4RwlnY
	xPKZU4AEAOD8jhM1OZbw92S5pab1KFUZRDcwdKmkXEroobjc789KyQJLTvY/QQ==
From: Nicolai Buchwitz <nb@tipi-net.de>
Date: Tue, 20 Oct 2026 16:58:09 +0200
Subject: [PATCH 1/3] dt-bindings: clock: bcm2835: add the BCM2711 GISB
 clock
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-devel-bcm2711-gisb-clk-v1-1-a1728724d0f8@tipi-net.de>
References: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de>
In-Reply-To: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
 Stefan Wahren <wahrenst@gmx.net>, Phil Elwell <phil@raspberrypi.com>, 
 netdev@vger.kernel.org, James Clark <jjc@jclark.com>, 
 Nicolai Buchwitz <nb@tipi-net.de>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_075830_142092_1AE36D0A 
X-CRM114-Status: UNSURE (   7.28  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

BCM2711 has a clock generator for the GISB bus that the firmware sets
up at 200 MHz. The GENET MDIO controller runs its MDC off it, so add an
id for it.

Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
---
 include/dt-bindings/clock/bcm2835.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/bcm2835.h b/include/dt-bindings/clock/bcm2835.h
index b60c03430cf15..3186da543f975 100644
--- a/include/dt-bindings/clock/bcm2835.h
+++ b/include/dt-bindings/clock/bcm2835.h
@@ -60,3 +60,4 @@
 #define BCM2835_CLOCK_DSI1P		50
 
 #define BCM2711_CLOCK_EMMC2		51
+#define BCM2711_CLOCK_GISB		52

-- 
2.53.0


