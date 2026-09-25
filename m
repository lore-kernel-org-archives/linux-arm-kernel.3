Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D163C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 06:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VgDBfAW0/uUjgMOzVAN5aNqMskwgUXEaSSIIPtgLXDc=; b=ifBN7n69ahh5xn8uWgmaFddBxx
	3f1KLdxKBgDx/Nh53qisfXVzsR25RGzvm9OMfoKKoG+zn3ltTWHBiUpR5SEXfXk2b30jqPfaxFbaS
	CttvRuOVwCVNTN0IsvGrrVxFVk5YzqrwmYvRiZQpR9Wt/JOb8Op6ekCcVy0hbNHLwXL1yyCLEVCIu
	XT+8yrB3oBMqIpw0D0gwx4PgO0YcF0s8MaLeOr9LJ+SewEnxlI3+mljudCNCG2qH3YFfZRfs2ITE/
	Km9NoLmaU2jZ09xJz86s2W3e3dnVD8u6fp94F+lU6t4ZTev95hieL1HjFhtDWjhAtOwlmBV1M5R58
	b2StMQvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9zow-0000000CmCu-3wi4;
	Fri, 25 Sep 2026 06:54:10 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9zou-0000000CmBs-3qDt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 06:54:10 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49fe8bf173aso2719035e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 23:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790319246; x=1790924046; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VgDBfAW0/uUjgMOzVAN5aNqMskwgUXEaSSIIPtgLXDc=;
        b=Fw9Mpe6cyYuu06Ku9cbOuQqx5cfTsWRIatCl3yZGCA75nXQbvlhMHf20uhiW8FN+Oo
         lYFJngyyQfZyZ0w6YI/mtlTNrOl85TJODRHafVeZGUoNf29FLZC4L+h4S45v0SsTtlLW
         1E/NvleDW+Y5WHWQZflCOovQIeiG4hpjtoJ3949dZUlFIOj/vZxxKVl5jkPr2EjjnMCv
         YiokH9xxLvX/K5iOdMPQh1DZDdrATbYXl0ZkbvZJO1WMMzhavxNiRSQJwrhpwtvafsSd
         0Wep7NUHFqtT+GRmba1sqOcAzKKg0d5tYvLoS5yGKyBz/m/uQpyI2cUD+xLNbPS6k2IY
         ctDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790319246; x=1790924046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VgDBfAW0/uUjgMOzVAN5aNqMskwgUXEaSSIIPtgLXDc=;
        b=UcO2Gjze/9s0I+JEwSNZoubje7b+L6f4B8TnN9DskCnZpZVBgdVQQaM8o31cLk+zVR
         /9Re6UvDmLErEAXWXcJWwdX64H+g5x1IQQUJlRGVMXAth+sISS/dyPJsRRL9iI+wBjcY
         lx8NDgcd185Qbk7YUzf+/MGIIqmdie2PSL6d3UY4LDfHNF+H09szu+UfERFDokvPVXtM
         P2m+zX68jTO96cnNg4o3KnScNrGOpNETvluYwU5In9nI4Tx74JKzggCqOSaEjE7lDFED
         qhRrI8gLLUkMK78H5kj3+oeZdObMWD+Rdic4Bhc+Ph9JaOxDi/4bc92Xzk5laVqyjIG1
         lAHQ==
X-Forwarded-Encrypted: i=1; AKwUvByaNaMn6EHLnz3VA/xzGU2MzkpDsWcycKdlu5LDMDrYC6QS0OMRxzLYKeLENJ8fFE6gDMkrH2Qzd077djby73OF@lists.infradead.org
X-Gm-Message-State: AFuF++mVUTaVJDzPHAtD+Q3E1kvtop8kXrrpTjLwSJxs17C0U0ENunrs
	KWRgp9/0bPXQvaCBouwjqeB8rmDzJDYyp3mDpSiJJ0YQ7kdFADLn+4O7
X-Gm-Gg: AYBFou3zfuc/abL+Pd+BVeuj/TAJJCXBiNzmgTzeJ7qG9LyLU3DWvMO7SJZhtFKMUXP
	+bqfPNpLCopofktJV13empl3IrRf4kYadBS9PFRzsG7hiyx5NYTMEBc1NLdG0a+HRYBrM/2Wtii
	hTBi4oEZ7g6DMhL1rnMC5zJvPtl/RdoqcJjAA8mzkusi9zL9WXlfy1GbKJEK5HGB++N9OQmI5sp
	N2mDFsTCUiFsAO6u4xKE4guqaFKxgA2wLlrLBWw6kWPzlLg8T/yzQ+s3Lf9Mqk2LdbmK36pTtVk
	yFzDZsNe/dlNBlagENUOctop/mjjnl0Spdqadpg1n/byhAv3sGW+X0vpbqTpjzQQ5v/sn1k+Yuw
	Kzq5yEF2xbtZt7euq1wg4cDPKb4w3Xu2Usnu0oRyXJ7lbcA/DJ+D6r7GTUWFs2E+hXQhfeYreM/
	MRkpNZljarp+rDw6LFZgfAC9Hu2gs78dFOnv81Mc7SB2XdWBFeQVBh4Jh/J81+wIJTnLjlueRWL
	bpWEAFdjRCwqjrKh23I6aWlwSJZogBcHaVOPLduprf1V4wjBWEpDz/+0m7/aAsjsKhOgZoxTbT4
	JLxbhTQROL2G9CfskcidCC4qLzSlGZ5vuDBHbe2CDewpqA7B1mWnL+goEDDXn2QHUJsOCwyBw8x
	4kTXHaIIYIBOxQ8b35gA=
X-Received: by 2002:a05:600c:3510:b0:49c:fa20:cbfb with SMTP id 5b1f17b1804b1-49fe66eaae4mr79133295e9.18.1790319246025;
        Thu, 24 Sep 2026 23:54:06 -0700 (PDT)
Received: from cypher.home.roving-it.com.com (78.45.167.195.static.otenet.gr. [195.167.45.78])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49ff044406dsm42144905e9.1.2026.09.24.23.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 23:54:04 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] arm: dts: bcm2711: Add wakeup and alias to cm4 rtc
Date: Fri, 25 Sep 2026 07:53:48 +0100
Message-ID: <20260925065400.2248660-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_235408_966537_AF494CF7 
X-CRM114-Status: GOOD (  12.19  )
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

The pcf85063 on the CM4 IO carrier board is capable of wake up
so set the parameter, also add it as an alias to rtc0.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts b/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
index 1f4ebec68370c..8e45de01d2ad1 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
@@ -7,6 +7,10 @@
 
 / {
 	model = "Raspberry Pi Compute Module 4 IO Board";
+
+	aliases {
+		rtc0 = &pcf85063;
+	};
 };
 
 &ddc0 {
@@ -103,11 +107,12 @@ &genet {
 };
 
 &i2c0_1 {
-	rtc@51 {
+	pcf85063: rtc@51 {
 		/* Attention: An alarm resets the machine */
 		compatible = "nxp,pcf85063a";
 		reg = <0x51>;
 		quartz-load-femtofarads = <7000>;
+		wakeup-source;
 	};
 };
 
-- 
2.55.0


