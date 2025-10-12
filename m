Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975DECCD187
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 23:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MA/CbTkvaa4YBWZa6ClbOJLv6rpKecbHiMNcj6ecb0w=; b=D8hey/YzB01RYYSfuJgGl+t3Te
	Z0bKsIgW6tE+Tz8vK73vGWeifmjKCktbLw6tVI2K4kV+RYfahmk6Q4mPJHfQpvOEK4zz2g8iOdrB5
	0Kee9ZksXCjPfFS73aPX+D6ggxKJONnAhKf9XTLIIwnbbIXPxSF3OgzhchepyXe0KgOdXUAawiCEv
	yxMt1r8eBh9P/RRR/KqqTdkGqo7DI+C13PG96yMy5Uw1XZILe0jo8qLASSNndtAoak8BMiR84hM4V
	H54yaKVtxLLVygW2NYMl6RPYE6HVefEDEqOJQfre8VJxUvjTIaE2unRQHmc2CbH8F4/Eh0dY+LKnw
	ELsIYA1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v85rN-0000000Bqco-2Ayw;
	Sun, 12 Oct 2025 23:52:17 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v85rI-0000000Bqbf-1pMK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 23:52:15 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-271d1305ad7so60811555ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 16:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760313131; x=1760917931; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MA/CbTkvaa4YBWZa6ClbOJLv6rpKecbHiMNcj6ecb0w=;
        b=QrXm5h8y9Y6zjWVZk0KU1VaNxZVG6o4gpfYORDIkz+49s8fF/QykqKj0gIK4Nzh3f1
         EcDdpKe2aOZWhpLWUvbbWoNdQXbAXoMhoxTiMi3E8N8PqLGFI4zAJB8gwCfJNi9FKhmR
         xfM2d5Iz/FHnwmeKU/FtQhPOC9B2xgEGUJAk3VF4hfeSYfaVHZYnZfEvkY0m0kuWyscV
         0KcnVxTi/tzQNj/kOETK12y+8jyjIn2AAQwSYs001xNVufoaIfeXNbSXIRCksNlUGejw
         it/kn/1VFQ70Ziw5aoR7MNQwD2zxAGQdKKdKZVX/a/FMBg8u1LEXwv8bSVIzEMo+4VaO
         NKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760313131; x=1760917931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MA/CbTkvaa4YBWZa6ClbOJLv6rpKecbHiMNcj6ecb0w=;
        b=rgxIj74c05S26dhLl0r8IM8ypYlXxQUPPQikpNajNX7VvadhwL0TTMgJgAWCkITKFE
         TnT/FwxWVI0R8n+JxonwG0CMpioZ5edy1F+9tnI/ZC52gWafUT4vM1TB+YqhfB9+juho
         romrb7pshoqrT8iPnOvC9zJWWhBGd7dKBSP2xz555B2tPqBWMLwlbqi/pf1rvV2Ec7WD
         W1AZi5U2xYoqu5u+wZQGAkNqub+03sDeOqzIxmZs/Xc0joLuwP+FoFQBQjsDdkSmbkVX
         HuJlmYCIHzghq0Xqq8en2rqr2U1lCt+FvrMi9wLjkKsCEBpjRGmJL27nTt6PVUrnPHxg
         k0sg==
X-Forwarded-Encrypted: i=1; AJvYcCVlL63EKt+RkebNh+6/kjfRTaYlewqye0CYbw+McrEuOeszq0r8Cg77/98FjkE16gXpFbJeTprHqwiHl6SOUZSn@lists.infradead.org
X-Gm-Message-State: AOJu0Yw99dl8VrSuSzVD9y/Zj+kyADMgPeht0wLVdTPyDpaXf8M7I7KO
	6cwcjbm1IM6t+qn3lTTTz0CGMlYxRMJR8tAl0RnJ05l9HcmHgFCz713i
X-Gm-Gg: ASbGnctyrSzzO2dp3qbKZ1q96NaFFxnxQJPKt0i57C5RcQjL0dy+c7F7+cBAIDNlwiH
	w1GLwa6pPaTML7hdB5/5tgle5EYpWd39LrtG0sJ3vdWkZEEr5AiaWql/gjr2GJhyrrdV7CMncKJ
	1RY9w09M+eIDBaoP1NLUKSZrJ0rV49nnjxmJ17ErM9hXemqzXz8euT49vfyYFGgc2brf+gFtHbH
	uqs+QsHflm/Xfl2lnhdHNQUa/H/PgYwglRSaJkoCN7kHlo/XoxEFGvmMJqG/GpD6nk9DwRe6qX9
	crVu7VcHvr7cMuzU2nXB5oMDxyxmN4T1wlQAZW2rwVTHYdgt474SddmR9tDJanrpxhtQgB8oQ8d
	QSVJGeCRjxFdWLLiFEIO3JGzXKh/yYoLbDJ1wX/JYT9q+V3dWOKaG
X-Google-Smtp-Source: AGHT+IHV3IN7oxo5m4JFeu31RH0eXwkx56/6n6hqO9lCyu5p7QOagyZjRIlPKlg22PYDzOg2LNf42Q==
X-Received: by 2002:a17:902:b18f:b0:269:6052:3536 with SMTP id d9443c01a7336-290273ffc80mr169583425ad.45.1760313131089;
        Sun, 12 Oct 2025 16:52:11 -0700 (PDT)
Received: from fedora ([172.59.161.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034dea083sm116576985ad.24.2025.10.12.16.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 16:52:10 -0700 (PDT)
From: Alex Tran <alex.t.tran@gmail.com>
To: alex@digriz.org.uk
Cc: andrew@lunn.ch,
	sebastian.hesselbarth@gmail.com,
	gregory.clement@bootlin.com,
	linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alex Tran <alex.t.tran@gmail.com>
Subject: [PATCH v1] arm: mach-orion5x: ts78xx: simplify support configuration with table
Date: Sun, 12 Oct 2025 16:51:47 -0700
Message-ID: <20251012235147.325532-1-alex.t.tran@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_165212_553835_E3F8D58C 
X-CRM114-Status: GOOD (  18.11  )
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

Replace switch statement based configuration with a lookup table approach.
The table is iterated through matching the correct configuration instead of
setting the configuration on a case by case basis.

Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
---
 arch/arm/mach-orion5x/ts78xx-fpga.h  |  7 ++++
 arch/arm/mach-orion5x/ts78xx-setup.c | 60 +++++++++++++++-------------
 2 files changed, 40 insertions(+), 27 deletions(-)

diff --git a/arch/arm/mach-orion5x/ts78xx-fpga.h b/arch/arm/mach-orion5x/ts78xx-fpga.h
index 2f4fe3ca5c1a..e35c63382b4c 100644
--- a/arch/arm/mach-orion5x/ts78xx-fpga.h
+++ b/arch/arm/mach-orion5x/ts78xx-fpga.h
@@ -40,3 +40,10 @@ struct ts78xx_fpga_data {
 
 	struct fpga_devices	supports;
 };
+
+struct ts78xx_fpga_support_config {
+	u32 id;
+	bool rtc_present;
+	bool nand_present;
+	bool rng_present;
+};
diff --git a/arch/arm/mach-orion5x/ts78xx-setup.c b/arch/arm/mach-orion5x/ts78xx-setup.c
index af810e7ccd79..cd8e15cf6a13 100644
--- a/arch/arm/mach-orion5x/ts78xx-setup.c
+++ b/arch/arm/mach-orion5x/ts78xx-setup.c
@@ -325,6 +325,18 @@ static void ts78xx_ts_rng_unload(void)
 /*****************************************************************************
  * FPGA 'hotplug' support code
  ****************************************************************************/
+static const struct ts78xx_fpga_support_config ts78xx_fpga_support_table[] = {
+	{ TS7800_REV_1, 1, 1, 1 },
+	{ TS7800_REV_2, 1, 1, 1 },
+	{ TS7800_REV_3, 1, 1, 1 },
+	{ TS7800_REV_4, 1, 1, 1 },
+	{ TS7800_REV_5, 1, 1, 1 },
+	{ TS7800_REV_6, 1, 1, 1 },
+	{ TS7800_REV_7, 1, 1, 1 },
+	{ TS7800_REV_8, 1, 1, 1 },
+	{ TS7800_REV_9, 1, 1, 1 },
+};
+
 static void ts78xx_fpga_devices_zero_init(void)
 {
 	ts78xx_fpga.supports.ts_rtc.init = 0;
@@ -334,36 +346,30 @@ static void ts78xx_fpga_devices_zero_init(void)
 
 static void ts78xx_fpga_supports(void)
 {
-	/* TODO: put this 'table' into ts78xx-fpga.h */
-	switch (ts78xx_fpga.id) {
-	case TS7800_REV_1:
-	case TS7800_REV_2:
-	case TS7800_REV_3:
-	case TS7800_REV_4:
-	case TS7800_REV_5:
-	case TS7800_REV_6:
-	case TS7800_REV_7:
-	case TS7800_REV_8:
-	case TS7800_REV_9:
+	const struct ts78xx_fpga_support_config *cfg = NULL;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(ts78xx_fpga_support_table); i++) {
+		if (ts78xx_fpga_support_table[i].id == ts78xx_fpga.id) {
+			cfg = &ts78xx_fpga_support_table[i];
+			break;
+		}
+	}
+
+	if (cfg) {
+		ts78xx_fpga.supports.ts_rtc.present = cfg->rtc_present;
+		ts78xx_fpga.supports.ts_nand.present = cfg->nand_present;
+		ts78xx_fpga.supports.ts_rng.present = cfg->rng_present;
+	} else if (((ts78xx_fpga.id >> 8) & 0xffffff) == TS7800_FPGA_MAGIC) {
+		pr_warn("unrecognised FPGA revision 0x%.2x\n",
+			ts78xx_fpga.id & 0xff);
 		ts78xx_fpga.supports.ts_rtc.present = 1;
 		ts78xx_fpga.supports.ts_nand.present = 1;
 		ts78xx_fpga.supports.ts_rng.present = 1;
-		break;
-	default:
-		/* enable devices if magic matches */
-		switch ((ts78xx_fpga.id >> 8) & 0xffffff) {
-		case TS7800_FPGA_MAGIC:
-			pr_warn("unrecognised FPGA revision 0x%.2x\n",
-				ts78xx_fpga.id & 0xff);
-			ts78xx_fpga.supports.ts_rtc.present = 1;
-			ts78xx_fpga.supports.ts_nand.present = 1;
-			ts78xx_fpga.supports.ts_rng.present = 1;
-			break;
-		default:
-			ts78xx_fpga.supports.ts_rtc.present = 0;
-			ts78xx_fpga.supports.ts_nand.present = 0;
-			ts78xx_fpga.supports.ts_rng.present = 0;
-		}
+	} else {
+		ts78xx_fpga.supports.ts_rtc.present = 0;
+		ts78xx_fpga.supports.ts_nand.present = 0;
+		ts78xx_fpga.supports.ts_rng.present = 0;
 	}
 }
 
-- 
2.51.0


