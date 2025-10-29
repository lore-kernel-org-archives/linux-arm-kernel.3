Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3B6CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 10:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7WT+ZeSZAqHF22L1uGLOSZ9kCL81IxqWxBm+GztFjAw=; b=I+itj8RqrsYP7Xhm4KYU08nA57
	ApuufOYGdAcnJ95wPZB+8oUwe2RPyVNvl22qcFmkSEgfNJDZC2aCzyN0wetzi/9U7sK9DsxuT3lF1
	gBOlQL5lEy2+jku9EqrkVsdBI8ya9YrulnqTvDee2FgMAhdoHojU4GjDgNXaRvHeeuada+KaklSAz
	5znrJWYjavvRHe+Kp/tn86C96sWLHHqlyTLmEtcsw895UpUbki33cMFXb8yZ/r2s2rPaFtH26hBlz
	1rcNTDBsN2THWYFRwehgNt+TQ1XO5/zKpPYLDk0Zes5zS5JnCw3nshZMiXVIWT9PCwqh7Mz6LE5Nb
	8tQ1psEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3TC-00000000mMr-2LJN;
	Wed, 29 Oct 2025 10:31:58 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3Sw-00000000m6o-1KFR;
	Wed, 29 Oct 2025 10:31:43 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 38C7911DD;
	Wed, 29 Oct 2025 11:29:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761733791;
	bh=N30ftlmAx1I5/6/9Ryv55Ts8pOKVaDrgM1/5L8YtCQU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y2VIWWsI7sJLDxnfJ36EiJ5YTvx+ax9vKBUZhWOyjAs7QfBoA/iU88F9p68Fl+FXx
	 szo8UKWaQgstx8ARq+NEcIJ/ZmMMtuPqZrgR6tGNEduLWCwpUFGdM9Ev+xEGnqlccR
	 jWqjlZL670V8bUKXG+g5Cp5nfRluTd+NfzdgR0hM=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 29 Oct 2025 16:00:11 +0530
Subject: [PATCH v3 7/7] platform/raspberrypi: Destage VCHIQ MMAL driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-vchiq-destage-v3-7-da8d6c83c2c5@ideasonboard.com>
References: <20251029-vchiq-destage-v3-0-da8d6c83c2c5@ideasonboard.com>
In-Reply-To: <20251029-vchiq-destage-v3-0-da8d6c83c2c5@ideasonboard.com>
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
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Phil Elwell <phil@raspberrypi.com>, Umang Jain <uajain@igalia.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6383;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=N30ftlmAx1I5/6/9Ryv55Ts8pOKVaDrgM1/5L8YtCQU=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpAezfdcmhGxF4IkMt7thEvaEatpWskgSvpiyM8
 9BQeYKR/0yJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaQHs3wAKCRBD3pH5JJpx
 RW60D/0R6Pi0NI1/Hlf4BO8wEJRDBzZGyV7frW821v60L5MRx8NqnNOV0kWOFPWmrnHLlRC9ZNt
 /q/yalu8XgsNaTNOh+KSXdFfxkNAklLQsSoAPuX/SsB5FKZUisZqaHpwDrVEY0sWa/pZJ7buFPn
 /VEfLWtOXxkywOk6yC0Dlh1ehDynO7MW15pSgBNVlb2U/sUeYD8Bg9s3zQTHCsux8ZSn05o88yG
 kF8LSJh3121zeHI0NHMON5JPe3RFx/9ypBTqhJXD4jnrjCkMHHh+TQTIP0ei5jlS9SvCho4zYMr
 jxDBvFKDdQslT5ZtZVfN77ydAgjCkWR3hgPjLRuvmWNoBwu7qE+PckDgF99XE2SWRMzufHAjnq8
 Mp0jBEjy5rjBcY8DsBjIF9thUUbyi5ednZsCpDOcwwl8rCazHdbOi0fE6YYje83z4zB2JbaBayG
 WngNUYBZ+gv0oF7kZSfY1m1RMT5uqce8/hx9AwTbW0GHanB9iMdKsUAcvVh5Apim/UgOJ/lUpPQ
 PhqpooMChTH1hU4LlBN60SUHkgqVs7BKRNhZzvPAHczmBh57ARqJwIZOsHqKxcVqYw1xNEIYUs2
 uKdr8OLIvwGe5iPTU9n+ZVUZdzrvK0guWJ9uuuxWAs4J/iy1XnXLaimBwSXUHYpPwmpWgJ6AfZz
 yzsX4iVC7B8EQng==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_033142_514660_08310D8A 
X-CRM114-Status: GOOD (  10.18  )
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

Destage the VCHIQ MMAL driver to drivers/platform/raspberrypi.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/Kconfig                                                 | 2 ++
 drivers/platform/raspberrypi/Makefile                                                | 1 +
 drivers/{staging/vc04_services => platform/raspberrypi}/vchiq-mmal/Kconfig           | 0
 drivers/{staging/vc04_services => platform/raspberrypi}/vchiq-mmal/Makefile          | 0
 drivers/{staging/vc04_services => platform/raspberrypi}/vchiq-mmal/mmal-common.h     | 0
 drivers/{staging/vc04_services => platform/raspberrypi}/vchiq-mmal/mmal-encodings.h  | 0
 drivers/{staging/vc04_services => platform/raspberrypi}/vchiq-mmal/mmal-msg-common.h | 0
 drivers/{staging/vc04_services => platform/raspberrypi}/vchiq-mmal/mmal-msg-format.h | 0
 drivers/{staging/vc04_services => platform/raspberrypi}/vchiq-mmal/mmal-msg-port.h   | 0
 drivers/{staging/vc04_services => platform/raspberrypi}/vchiq-mmal/mmal-msg.h        | 0
 drivers/{staging/vc04_services => platform/raspberrypi}/vchiq-mmal/mmal-parameters.h | 0
 drivers/{staging/vc04_services => platform/raspberrypi}/vchiq-mmal/mmal-vchiq.c      | 0
 drivers/{staging/vc04_services => platform/raspberrypi}/vchiq-mmal/mmal-vchiq.h      | 0
 drivers/staging/vc04_services/Kconfig                                                | 2 --
 drivers/staging/vc04_services/Makefile                                               | 1 -
 15 files changed, 3 insertions(+), 3 deletions(-)

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
2.51.0


