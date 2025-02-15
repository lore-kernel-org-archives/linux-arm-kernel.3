Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B948C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 14:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nSaNx8YQ2EWhxCnCr/97FLvnOt+570/h4vEIeiMge+k=; b=t8BnS9qxpOve8u2Y/0pPrK1VKq
	/PCOekL9j/A1fHEUPgetbhGJfladOmWoYGDbqfnALXv7deACuup1H6syqE2VTqdiJyc452vF+FZmt
	dW5lf1/lcoBF/THrSUWUKOmb6DJIoBNscUCURNG0c8Gkckpz1NtXt4IYnam9q3vhZLH6rKS1h5lh1
	0/njHLduX77BrCmtGgeJRcKzI8ONmMA7wfHuPulKnHwsIMcAjHhOMQZdvB7zstuZs076pb/kuUcYL
	3oPmsS5iiyth5QbswO9O31A1HSwWB09hYAJuqx+yXBzYsU7qTlUd1/dVtwapZoLVzqyKJZaSQHdLQ
	hNjjHz3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjJK6-00000000F9Q-0UnC;
	Sat, 15 Feb 2025 14:39:14 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjJIc-00000000Exx-1HVJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 14:37:44 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5e02eba02e8so1314354a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 06:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739630260; x=1740235060; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nSaNx8YQ2EWhxCnCr/97FLvnOt+570/h4vEIeiMge+k=;
        b=WShGkOPpOjAWYRBftkLbcvbS/6PHVFPmLwm32JNCgWT987VNPEkt1qOj2aDP6IFHmU
         qGvTrFbWJLyKYCbvQhwncIj3bNL7RK+EFWub5JXaTp3Czk+3RLT9Vc73dJYM7sfNJ+gQ
         Rr/WeboFhqQohchgmAAhpI1IvjGLtNYXRTILFChvh1hWxSO+wrwMaUPTMGcB2GGogS6x
         6+B+5qNgyghfsmisgHoLSHXzI99cSL9x269f1bH1fA+JzYpqs3XKzfZ27TfNrDK8dEUH
         tTRKSin/d06zfhx6XYsvM4YbbIsdIPBDoW5dJuzjxB3hsXwUjV5ZSXNbTf2/GxPs+ef5
         Xo7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739630260; x=1740235060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nSaNx8YQ2EWhxCnCr/97FLvnOt+570/h4vEIeiMge+k=;
        b=dZWozNAuSU7KspXlwve+JUAaIT6OZ7E4NO5xYzmKVsXYpofefRKX4zAyCZ9hGz/Rqv
         VK1dSqdXTYBTmiUWz/Y/FKQzk2M7DJM31MG75oXmySetngO7e3w7xIyFecr6o9dUPrr8
         INUT5z0NVqwesh6leweqNvB1iyMGfYGUHMbuOIoCphvpFhOJuN3BxnI+BU7/PJIeofz1
         UHyu4Bz7lFb1cWPsY5Ng/p1HgyW2tD7zn0rJ1gcSCi9Nmnm8/uszgCE7tEk/9iiDv2sj
         SRavkMSuPJJ2LkG5C240n7Zc+AKGMZ/NLnwTV/0l51Ykq3A/ZjE13W7KgF9n63ACT8A4
         FMSA==
X-Forwarded-Encrypted: i=1; AJvYcCUoydnQuvcJvi0qVm+P1fV4AoYbGp6OS1gaxc/uhsbdI4nKZIoLhkhfH3siziCy0eEvBdTY1wkOEl3qxwGoYSKU@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9VmbQupys9Ulqk8x4hiXn1uk+eO2ntZBoZdcpfFP2QCUQrvYV
	BKSsYZ7/boMDtb7PbdZTFXAELQzQybYsZ0qgif6Zwp5RUAju7sIFfY4E/q3A0clMf+2GjIANNPy
	s4a4=
X-Gm-Gg: ASbGncsNbybs38beJfq1x25Y8Temx2q/IOCh6QRjuOY7F//JZBrqXnZpB3QiGNZcYu+
	4E4YsB6dh4z3Tta3M2nkHraIfojUubCh6VC2g0fXfY0wo8GbSDrsjhDX3J14c7Ti2zjR3odE8rc
	Tquav0daMSAVDRVx5yMN0gxXG/PRh//F1kod6xQvy5Hv+RBd874OikPW9NhwApGPNLorhMDx2hk
	aWPLAbShiKzb0f/UAfPIgsOMrC+lZDBPNOWZhoq63UaN3+JVNA8IT0ULXDBA1oTRBWesGLNGb8e
	JvGSuyhJBLRujdmIVZSP
X-Google-Smtp-Source: AGHT+IFt+EQlS1yD/Pqn470UtSRXl2RwFv111R6YU8LvXgLUSAycfdItfiHCwgWYA+V/QSES0Rr1ew==
X-Received: by 2002:a17:906:30db:b0:ab6:f68c:746e with SMTP id a640c23a62f3a-abb70d7994bmr260292266b.41.1739630260245;
        Sat, 15 Feb 2025 06:37:40 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba569dd320sm508104466b.72.2025.02.15.06.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 06:37:39 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-pwm@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] pwm: stmpe: Allow to compile as a module
Date: Sat, 15 Feb 2025 15:37:22 +0100
Message-ID: <20250215143723.636591-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2134; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=7EURNpoHSBP3WHFlLw0KLAnxXhoJ+QFpagdnWt5h0qo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnsKajSFpSGYDQiIEQHcSvInMz9OmjgQlzntWWc Yw5UfZs1LaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ7CmowAKCRCPgPtYfRL+ TnJ7B/wLIPZby+assjCEHqaTkuBWgWI4PjQyAydedxwVJ6OmtxlZm4lXOkuVb2m5Y7RFwydwZon uduuSGK539qG4tGVF/mcHOhcrRQxmgrWnJgFvaC0UivpfmPti0S5cbveo+ceIMYtHk9bNSHpI/T h/oyeSUcj+0NM5MoRLjf5qNpGfOFgfUuTIdDPtcEysOqS5IESFREXBp5xuYrrGzqDRDTbkHF+h6 6JNKF7pQ2wWw4KnltVBz+aZk6YCp1Cav8vSG1VBIDwBbfkb4W5UaGtD0MnBK4mQSsRL/pbdPyOg VglGaQanwAq3ajbxUGR7HoJqrvRrqK/6BYXbFVdgm/GFw7SJ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_063742_597736_790EC27A 
X-CRM114-Status: GOOD (  17.22  )
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

pwm-stmpe is the only driver that cannot be built as a module. Add the
necessary boilerplate to also make this driver modular.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/Kconfig     |  2 +-
 drivers/pwm/pwm-stmpe.c | 25 +++++++++++++++++++++++--
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index ec85f3895936..35559b541f89 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -646,7 +646,7 @@ config PWM_STM32_LP
 	  will be called pwm-stm32-lp.
 
 config PWM_STMPE
-	bool "STMPE expander PWM export"
+	tristate "STMPE expander PWM export"
 	depends on MFD_STMPE
 	help
 	  This enables support for the PWMs found in the STMPE I/O
diff --git a/drivers/pwm/pwm-stmpe.c b/drivers/pwm/pwm-stmpe.c
index bb91062d5f1d..73f12843999a 100644
--- a/drivers/pwm/pwm-stmpe.c
+++ b/drivers/pwm/pwm-stmpe.c
@@ -326,12 +326,33 @@ static int __init stmpe_pwm_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	platform_set_drvdata(pdev, chip);
+
 	return 0;
 }
 
+static void __exit stmpe_pwm_remove(struct platform_device *pdev)
+{
+	struct stmpe *stmpe = dev_get_drvdata(pdev->dev.parent);
+	struct pwm_chip *chip = platform_get_drvdata(pdev);
+
+	pwmchip_remove(chip);
+	stmpe_disable(stmpe, STMPE_BLOCK_PWM);
+}
+
+/*
+ * stmpe_pwm_remove() lives in .exit.text. For drivers registered via
+ * module_platform_driver_probe() this is ok because they cannot get unbound at
+ * runtime. So mark the driver struct with __refdata to prevent modpost
+ * triggering a section mismatch warning.
+ */
-static struct platform_driver stmpe_pwm_driver = {
+static struct platform_driver stmpe_pwm_driver __refdata = {
 	.driver = {
 		.name = "stmpe-pwm",
 	},
+	.remove = __exit_p(stmpe_pwm_remove),
 };
-builtin_platform_driver_probe(stmpe_pwm_driver, stmpe_pwm_probe);
+module_platform_driver_probe(stmpe_pwm_driver, stmpe_pwm_probe);
+
+MODULE_DESCRIPTION("STMPE expander PWM");
+MODULE_LICENSE("GPL");

base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.47.1


