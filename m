Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D09C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 22:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uihwsc/0/XJ+PKMiZipIM8BQRMntIvpw4hWPIZoG7Ek=; b=W47vzh6MW0OVczDoK8oFIm7lFF
	ApThCn4FTAyT7gMjdBrF22h2WLz74E1NX5PBQZsZ1fkKkJN737+WUcMgRX6gXDXItaXmhabFDSQ7Z
	gxXUUSH2gXc0CCNx8rnrDiq9XwcT1vS10bOUIlPSTvC4lYOlkqRW2fxuMJxkmQOJcBNGC6wOKwJyZ
	yo8MwDaSmjQLaY0IO8KrnFn3ejRGY399mqKOe3eDBUlbKOpfT4SCOrVhybbeJkyihBbXBHFZzg8MT
	bTTAlVsdrnedixKiGDH+hEo+uoM9cNXj0H4CLDgcZ9xFQ3Q6jybRAyHilZwi+lGu4H3aI6y1srHZJ
	PbygZF+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulEMg-0000000661n-1AQf;
	Sun, 10 Aug 2025 22:18:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulEF8-000000065Wr-0iBz
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 10 Aug 2025 22:10:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Uihwsc/0/XJ+PKMiZipIM8BQRMntIvpw4hWPIZoG7Ek=; b=Fi2V36jsujuaptHngYVXjuE245
	tKbw1M0nLHsnwibbr1z2cFFk+DAv4awvV8pbW5njzfVzeQAQmmR0VhDfQW565s1AzBZU2IGR9D1a1
	EjO98bk6zYZZr2JUe6Jnsmb64bcQV0i4CS6/yJYyc23aIt/ST0iXA0f9XMw7kCfS0iArI0XhUgVlJ
	RJQzypd4bWAFHYRmX8CWB2qpiC3VZ6MVDEXhzIDV0YrTa5en/2ghTxvrczIe3Ao+neLMA4c8TnLg0
	KctxCvyKQwlP9fxUmDOfiKkXsyVxCEO4Z6RTMpMW5QNjemEDU204vZnTJfvETQ5QoDMYBeZK5APuG
	hrRe6A1Q==;
Received: from mail-pj1-f42.google.com ([209.85.216.42])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulEF5-0000000FIxR-0WlM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Aug 2025 22:10:17 +0000
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-31eb40b050bso3164353a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Aug 2025 15:10:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754863812; x=1755468612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uihwsc/0/XJ+PKMiZipIM8BQRMntIvpw4hWPIZoG7Ek=;
        b=Q3VB8VAQZd8jKpcARTzmB6NK3yiHL5gE+/ckIKng9tlaeifkFp8g6LoG1oe33HSTQH
         To6vrzA/pLJN6E+6xeGS9OlKQpWLm7ALX6LwwDcv/gnTbLYBcAgSoC/K+668nrivCLqe
         +H4nPRfs69TH+m6aGWqHxgic0bheXDChKnEUvccdkgCA+b2Fvo1a0Btos0BX0lGGb4st
         xYS5RsricDfVzhX+H6MI6oTUQ16NQnQVfiQakS0g+8IqOGFbmx/oAmtcmTFJb6Ad3p6K
         LrIoTte1bYE3cwJs1Uux4PSndOfAPFvCKyU7UUHXGk7yOLKMpnYNyxPF2/ML5zzLpRgx
         /cDA==
X-Forwarded-Encrypted: i=1; AJvYcCVWIynqRzWHgq0UXjwtEtO6kK9Le7/SgQh4isP7+lMeBZmI4iArYmmSoxUaMUDHmfIa3KT0RPFjnnSK9JmI1xbH@lists.infradead.org
X-Gm-Message-State: AOJu0YyHtZkq8n/Yu6TiNSRyFv185l4ke+FD4TR5VV6UlZpZgvC+HhiY
	ASYiChg23yr9eTK1UZGnxu/Q6I7iYLpiRvweY73p2m0vUjIpPkwdHxYk
X-Gm-Gg: ASbGncsIjkVIXC9HON2+IaB//w0zOREiGSuRkf7ChJ1YiigAT6/0ObvUPN3LXzZ9EaJ
	QoFmfMMKv231inUS9M9ELlq3VXUZA8siOfnSse9w2pCIwl5S4w6Zh4OacjwANnrw0302JvNsy3l
	t5VMqEosgdGps9JNFFjhsU+5QvXTXKsXanMF5XIOs17S+Mo824RUdOaIQTGrwCzxFwfgt4HycT6
	e3GT5GfWPoviri2hej+zucRP85aZnj9SmKkXAizhgnatcu48/cnPAoV6pdV1toWLo3j/knVYU5W
	c4z1Ox8LtJVa3uB4JDWvOAvH4srmpXmN6DSssDcxlcT3LP8arOAvGqLvHPdrkAfZzUfafuHYvjT
	rJjWazhcNEJqktF8SRtZ/10mxFbFp6uk+Xl0ufzhex+v7djTssL3m6a4Wjz556OAs978=
X-Google-Smtp-Source: AGHT+IFCTQC9SdRJ5qPCgpZfyHqD6TscoCidyWxoSvNsuIOKQ2B/LiU7H3kp23xxyw9/Oo+plrMSZQ==
X-Received: by 2002:a17:90b:3ec5:b0:321:27d5:eaf1 with SMTP id 98e67ed59e1d1-32183c45f17mr13469365a91.25.1754863812200;
        Sun, 10 Aug 2025 15:10:12 -0700 (PDT)
Received: from localhost.localdomain (c-24-4-34-163.hsd1.ca.comcast.net. [24.4.34.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321611d6eeesm13150118a91.6.2025.08.10.15.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:10:11 -0700 (PDT)
From: Will Whang <will@willwhang.com>
To: Will Whang <will@willwhang.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/4] media: uapi: Add custom IMX585 control IDs
Date: Sun, 10 Aug 2025 23:09:19 +0100
Message-Id: <20250810220921.14307-3-will@willwhang.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250810220921.14307-1-will@willwhang.com>
References: <20250810220921.14307-1-will@willwhang.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_231015_408400_F7FEECDF 
X-CRM114-Status: GOOD (  17.80  )
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

Reserve a private control ID block and define the helper enums
used by the upcoming IMX585 driver.

Signed-off-by: Will Whang <will@willwhang.com>
---
 MAINTAINERS                        |  1 +
 include/uapi/linux/imx585.h        | 20 ++++++++++++++++++++
 include/uapi/linux/v4l2-controls.h |  6 ++++++
 3 files changed, 27 insertions(+)
 create mode 100644 include/uapi/linux/imx585.h

diff --git a/MAINTAINERS b/MAINTAINERS
index ef04ee4ec..e6aeac0c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23183,6 +23183,7 @@ M:	Will Whang <will@willwhang.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml
+F:	include/uapi/linux/imx585.h
 
 SONY MEMORYSTICK SUBSYSTEM
 M:	Maxim Levitsky <maximlevitsky@gmail.com>
diff --git a/include/uapi/linux/imx585.h b/include/uapi/linux/imx585.h
new file mode 100644
index 000000000..30e12df88
--- /dev/null
+++ b/include/uapi/linux/imx585.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * IMX585 V4L2 controls user space header file.
+ *
+ */
+
+#ifndef __UAPI_IMX585_H_
+#define __UAPI_IMX585_H_
+
+#include <linux/v4l2-controls.h>
+
+#define V4L2_CID_IMX585_HDR_DATASEL_TH   (V4L2_CID_USER_IMX585_BASE + 0)
+#define V4L2_CID_IMX585_HDR_DATASEL_BK   (V4L2_CID_USER_IMX585_BASE + 1)
+#define V4L2_CID_IMX585_HDR_GRAD_TH      (V4L2_CID_USER_IMX585_BASE + 2)
+#define V4L2_CID_IMX585_HDR_GRAD_COMP_L  (V4L2_CID_USER_IMX585_BASE + 3)
+#define V4L2_CID_IMX585_HDR_GRAD_COMP_H  (V4L2_CID_USER_IMX585_BASE + 4)
+#define V4L2_CID_IMX585_HDR_GAIN         (V4L2_CID_USER_IMX585_BASE + 5)
+#define V4L2_CID_IMX585_HCG_GAIN         (V4L2_CID_USER_IMX585_BASE + 6)
+
+#endif /* __UAPI_IMX585_H_ */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index f836512e9..091a044e5 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -228,6 +228,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_RKISP1_BASE		(V4L2_CID_USER_BASE + 0x1220)
 
+/*
+ * The base for IMX585 driver controls.
+ * We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_USER_IMX585_BASE               (V4L2_CID_USER_BASE + 0x1230)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */
-- 
2.39.5


