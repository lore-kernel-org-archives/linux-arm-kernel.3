Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8714FCA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 09:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IaYl3WyGmCBU4jIIPc9ZTDlax1slCQSH9sGh2ZIUbUE=; b=LsmsUfpTqePLbw5WdNiQ25Ejsa
	0UJz3cmj3JT4Kiy/ZyJ8rGEVPR4nKho1Er1Lfw1jTLt2mTQgH4indCSOnSIaS38uwMR3OnCISvLHT
	bu+92inUhqbj2WmWgDbhHL4jMOVbKfecAYr34V1FbzibdqaQKbDCHE7OfLWAyuPEN9J7/GRd3ewmk
	P07IOzfXYHf3TMWowJHdHyom9mdhTcQrYulshV3e5KH5uYssjVTYV1U5+atf/lXssNqkH9Lg19vOS
	pM7oN6OQw6V+DeajOtRaxZkhL6ywA6nZ7DNVz5tbN7XqKi41MSIEMK1FAO9J1XFS+OwP2kp0zlx8/
	xCeTPc8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvBRV-0000000ALxs-1yXF;
	Sun, 07 Sep 2025 09:12:13 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvBEH-0000000AIuC-30aC;
	Sun, 07 Sep 2025 08:58:35 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:84a2:d86d:fcf7:24b4:e467])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CDD5919E7;
	Sun,  7 Sep 2025 10:57:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757235440;
	bh=gzkhOVFDEtRngN3J7SgKqr/lOPzZvzCr/eMzgUueLLM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CmxG6WY4r32B7mQb5iW8zjLitO6jRGV8QF2iF+J6aCbzEMeqev7YXcY4b7UznAvmm
	 QEMYcuaKuVYDa2g9U30dGmJf8EbiVj+q7QNtYNXmqQiN51QslWCLdPUMMBy2NygtDk
	 qTyjKb0dTqqAISONtQrpNHn6jIKezkZyghjQOuRw=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Sun, 07 Sep 2025 14:26:25 +0530
Subject: [PATCH v2 5/5] platform/broadcom: Destage VCHIQ MMAL driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250907-vchiq-destage-v2-5-6884505dca78@ideasonboard.com>
References: <20250907-vchiq-destage-v2-0-6884505dca78@ideasonboard.com>
In-Reply-To: <20250907-vchiq-destage-v2-0-6884505dca78@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kernel-list@raspberrypi.com, 
 Stefan Wahren <wahrenst@gmx.net>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6811;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=gzkhOVFDEtRngN3J7SgKqr/lOPzZvzCr/eMzgUueLLM=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBovUkKCaNG5rPdrLS+WujdutznZZQFRR683DVhv
 cvm/lXfJfmJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaL1JCgAKCRBD3pH5JJpx
 RYGrD/wKrhPFRmcpmEC/yBI5wtQ9FN7jPwo+fw7ymT8geQ2Nyx01vlx7OlwHOoEd+TmOntuvpB0
 SVf4daIQ/G42RBtn0XEV7hhYIOa1gwUuIhK16LO16daxONXZGbRR3EKAWYJq2SuHvNLP5ZOwVTb
 pFyBZ7d+bQUilc3wZZk0ktLXK9KOT2tv5TehynP739CxMn3yJnVTWWTLm0cynUMLXw83v/izIiE
 yf3AZxdfM1mO9MLq4zGk/JOgSBdkPOCJ5+bBF5sfEWw/Ufrl7FUnTbM3rbnF092J8A0LYi62VjZ
 c3xkfYk3Oo+OEqLgFBdMGztc/Xuxixb6GSiniINqpnjrjBLhmOsjXupZttbnMa07gGm+vPGeBGd
 fWjhyY0weqFhBp0LuNnA/2oIX6JliAd8nAs2gsOFY3g00NnK/43ujy19Plg+N52cI0S3655DQyf
 4roaqvjR3+qPy/rZmMItVr3buQA/CwOs4bN6xJAsFLDiyI6PO8AeFDFtFcPv3ofhZPF+MeIA1Ld
 tzaPDdA69R7mFctWR7CY3UMTN9VnX/PohcOddVZxGowozn2WkDKUk9hfJTsFgrWEPWru35izYmM
 b4lRrPctD64deKemgJeL5An0u+M0OEdZr+dhjqzItk5FI5cHIPrp2rKlvcqn4qpjrHIl4TsLvVo
 +mWmvU65QfHZ0SA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_015833_905189_5E017807 
X-CRM114-Status: UNSURE (   9.24  )
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

Destage the VCHIQ MMAL driver to drivers/platform/broadcom.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 MAINTAINERS                                                             | 2 +-
 drivers/platform/raspberrypi/Kconfig                                    | 2 ++
 drivers/platform/raspberrypi/Makefile                                   | 1 +
 .../{staging/vc04_services => platform/raspberrypi}/vchiq-mmal/Kconfig  | 0
 .../{staging/vc04_services => platform/raspberrypi}/vchiq-mmal/Makefile | 0
 .../vc04_services => platform/raspberrypi}/vchiq-mmal/mmal-common.h     | 0
 .../vc04_services => platform/raspberrypi}/vchiq-mmal/mmal-encodings.h  | 0
 .../vc04_services => platform/raspberrypi}/vchiq-mmal/mmal-msg-common.h | 0
 .../vc04_services => platform/raspberrypi}/vchiq-mmal/mmal-msg-format.h | 0
 .../vc04_services => platform/raspberrypi}/vchiq-mmal/mmal-msg-port.h   | 0
 .../vc04_services => platform/raspberrypi}/vchiq-mmal/mmal-msg.h        | 0
 .../vc04_services => platform/raspberrypi}/vchiq-mmal/mmal-parameters.h | 0
 .../vc04_services => platform/raspberrypi}/vchiq-mmal/mmal-vchiq.c      | 0
 .../vc04_services => platform/raspberrypi}/vchiq-mmal/mmal-vchiq.h      | 0
 drivers/staging/vc04_services/Kconfig                                   | 2 --
 drivers/staging/vc04_services/Makefile                                  | 1 -
 16 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fc74a9e2e5a47b8c82cf68ef7c1fe3d37e2fe89b..856a2a489afbc95780769a708540444aa5aa983a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4753,7 +4753,7 @@ S:	Maintained
 T:	git https://github.com/broadcom/stblinux.git
 F:	Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
 F:	drivers/pci/controller/pcie-brcmstb.c
-F:	drivers/platform/raspberrypi/vchiq-interface
+F:	drivers/platform/raspberrypi/vchiq-*
 F:	drivers/staging/vc04_services
 F:	include/linux/raspberrypi/vchiq*
 N:	bcm2711
diff --git a/drivers/platform/raspberrypi/Kconfig b/drivers/platform/raspberrypi/Kconfig
index 9085e7464ec348fce5ec9f41a9019ab12eee964b..2c928440a47c08e4d452fe838fe4105c608995a4 100644
--- a/drivers/platform/raspberrypi/Kconfig
+++ b/drivers/platform/raspberrypi/Kconfig
@@ -47,4 +47,6 @@ config VCHIQ_CDEV
 
 endif
 
+source "drivers/platform/raspberrypi/vchiq-mmal/Kconfig"
+
 endif
diff --git a/drivers/platform/raspberrypi/Makefile b/drivers/platform/raspberrypi/Makefile
index a807571c59a47bb418cbb1dfcc389219d0d0ff22..2a7c9511e5d8bbe11c05680eea016ef40796b648 100644
--- a/drivers/platform/raspberrypi/Makefile
+++ b/drivers/platform/raspberrypi/Makefile
@@ -12,3 +12,4 @@ ifdef CONFIG_VCHIQ_CDEV
 vchiq-objs += vchiq-interface/vchiq_dev.o
 endif
 
+obj-$(CONFIG_BCM2835_VCHIQ_MMAL)	+= vchiq-mmal/
diff --git a/drivers/staging/vc04_services/vchiq-mmal/Kconfig b/drivers/platform/raspberrypi/vchiq-mmal/Kconfig
similarity index 100%
rename from drivers/staging/vc04_services/vchiq-mmal/Kconfig
rename to drivers/platform/raspberrypi/vchiq-mmal/Kconfig
diff --git a/drivers/staging/vc04_services/vchiq-mmal/Makefile b/drivers/platform/raspberrypi/vchiq-mmal/Makefile
similarity index 100%
rename from drivers/staging/vc04_services/vchiq-mmal/Makefile
rename to drivers/platform/raspberrypi/vchiq-mmal/Makefile
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-common.h b/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
similarity index 100%
rename from drivers/staging/vc04_services/vchiq-mmal/mmal-common.h
rename to drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-encodings.h b/drivers/platform/raspberrypi/vchiq-mmal/mmal-encodings.h
similarity index 100%
rename from drivers/staging/vc04_services/vchiq-mmal/mmal-encodings.h
rename to drivers/platform/raspberrypi/vchiq-mmal/mmal-encodings.h
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-msg-common.h b/drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-common.h
similarity index 100%
rename from drivers/staging/vc04_services/vchiq-mmal/mmal-msg-common.h
rename to drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-common.h
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-msg-format.h b/drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-format.h
similarity index 100%
rename from drivers/staging/vc04_services/vchiq-mmal/mmal-msg-format.h
rename to drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-format.h
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-msg-port.h b/drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-port.h
similarity index 100%
rename from drivers/staging/vc04_services/vchiq-mmal/mmal-msg-port.h
rename to drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-port.h
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h b/drivers/platform/raspberrypi/vchiq-mmal/mmal-msg.h
similarity index 100%
rename from drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h
rename to drivers/platform/raspberrypi/vchiq-mmal/mmal-msg.h
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h b/drivers/platform/raspberrypi/vchiq-mmal/mmal-parameters.h
similarity index 100%
rename from drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
rename to drivers/platform/raspberrypi/vchiq-mmal/mmal-parameters.h
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
similarity index 100%
rename from drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
rename to drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.h
similarity index 100%
rename from drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
rename to drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.h
diff --git a/drivers/staging/vc04_services/Kconfig b/drivers/staging/vc04_services/Kconfig
index b9e6f369f54c3af6225f181e08ac14e3de044062..2f6d1aaffdb2c1f11ec27e0fb8050fef56e6a875 100644
--- a/drivers/staging/vc04_services/Kconfig
+++ b/drivers/staging/vc04_services/Kconfig
@@ -3,7 +3,5 @@ if BCM_VIDEOCORE
 
 source "drivers/staging/vc04_services/bcm2835-audio/Kconfig"
 
-source "drivers/staging/vc04_services/vchiq-mmal/Kconfig"
-
 endif
 
diff --git a/drivers/staging/vc04_services/Makefile b/drivers/staging/vc04_services/Makefile
index 7a716a5c781530b673027b9f82ec94ebfd615f8a..ba15ec663af0fabaf0060456fc997deb5e5e0533 100644
--- a/drivers/staging/vc04_services/Makefile
+++ b/drivers/staging/vc04_services/Makefile
@@ -1,4 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_SND_BCM2835)		+= bcm2835-audio/
-obj-$(CONFIG_BCM2835_VCHIQ_MMAL)	+= vchiq-mmal/
 

-- 
2.50.1


