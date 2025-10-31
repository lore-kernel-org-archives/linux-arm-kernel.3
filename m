Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DCBACCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 17:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+fuEwpE40XAog6fxIvpv6yxVhkPni3euR6RJ3fUMtWM=; b=ImqrChvZy70ioO3HgIKV6zsrhX
	dJ6rLmit9uE2UtMDngQTHJCU61LMMbuidAdJc1HahOin5IAFQn8y/+CaiVTCvzSFmyr+AImIBkYsr
	tlf30fVxCMY0KWb20wJkjd0Wx01VJGDXmiJfBGi05QnHYlQCseGBuHQq9HYDqh1+fNDL/o4Kd2lmP
	VOCmTYgjNmm+viD0BthXqJtJ7tO7zkYy7z7g+8wpO3wn1kgUvIw0zMLO4fCFY12q653t++DwqxsI3
	YH5oNtISXmAfxEW6Mqk/F14MyXTUJwvarB5ie1Og2kuehlpFQ4RuLdKmqw6uLhkRnzoXLVSPkW1Kx
	+kN4PxSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEswE-00000006VJc-0lWb;
	Fri, 31 Oct 2025 17:29:22 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvS-00000006UPp-2tUi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 17:28:39 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A5073A2;
	Fri, 31 Oct 2025 18:26:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761931602;
	bh=pOlUZ/eYmURkI9UAYzXg8XzcXPBjNBMhjQguuGX/sPU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aD5hd/QZjuAu2DbdSCIPFQhjdZbcliqwShb3T5PBuEnYTMAShyXKMkJ+X8PMwRWrI
	 FKP1P4m0hVoyJC0nhaAgGl6dU8mBPg+Z3anTwd3j5e46b4aGQzfjGagdvDUcVCpRKs
	 SM0jPtD/9gOTtDhovWhGO/D7oBRNtr+wE90OySkA=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 31 Oct 2025 22:57:25 +0530
Subject: [PATCH 05/13] platform/raspberrypi: vchiq-mmal: Add in the bayer
 and gray formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-b4-vc-sm-cma-v1-5-0dd5c0ec3f5c@ideasonboard.com>
References: <20251031-b4-vc-sm-cma-v1-0-0dd5c0ec3f5c@ideasonboard.com>
In-Reply-To: <20251031-b4-vc-sm-cma-v1-0-0dd5c0ec3f5c@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 bcm-kernel-feedback-list@broadcom.com
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Phil Elwell <phil@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3072;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=spTPBZUUYTCoXyLwYiPFicRWxsPp0oGfOuM0+6jDegE=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpBPGYZjTE6iQ+/Z2roISP58pFWBX1/U/xtzJhV
 izcRsgqeX6JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaQTxmAAKCRBD3pH5JJpx
 RfqPEAC/u7t7MEC6xEzkyZzkuWCQII9Y7t6g7mP0O/cPj7eXyBH3pJaoo7Uw8tYMMJA16RFM4dJ
 1HmEFDNI+mR7Uwx1xXNXhpG8zDivegPfepY/+AXmXwqrkT2MysaIsKWSM519IU8fjgw1UbfoyAe
 4qIeZfHgGH9iZ4jclCh2A9zo13pb48/Z3qI4BxT8OXYVR+EcME+wEMTgTk5S/EvTYDgCGIt6bi1
 DroblV5lXv47lettfSxpsvWUwqe4kvxt1vynCJyduS6cV1mmooU77r38JoFlMt1PXUlC7akJfRZ
 n7zCksgq4E5Lpj+MdTjugHnLds+TZmDN4Tz8l54jv31jjP4uSayOe+mKOADJih7jhilGA3So6uN
 yJLPnWuTKuW5CVBvJxHw/GuQ9WNnaV2D5jc4+BYrdgAcf0b+Eo+V/Iot/RBdILePQmr7cuckaoN
 PrVPugMLoQdLHU/6v/HLClIMxCXBzXItswM64o+BhlzFiiG7XPlKWjj/uBui/8sQhdOMHdu09wD
 SKv6+lCAT1m21KtQSf84BNC9tyhqPVN6pKTuILldx0SfHdk8LrXmyti2g02waKD6UOhm0ZOeO9t
 soEytmYGldaBGX4zJ9y5azgF/DFf/OhKPQFGJltLFxNU4TgnL4S/o5LuoRJttke2JlReTmJFoj7
 2OKL32+/nLwqKZg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_102837_148840_BE09D5D2 
X-CRM114-Status: UNSURE (   8.38  )
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

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

The ISP and codec support bayer and gray formats, so add in the
encodings for them.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-mmal/mmal-encodings.h | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-encodings.h b/drivers/platform/raspberrypi/vchiq-mmal/mmal-encodings.h
index e15ae7b24f73fd055806e2e88e5eec0e1b8bfe9d..826ed66deafd082f43539c5b4702a2e0b6a2fe95 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-encodings.h
+++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-encodings.h
@@ -69,6 +69,47 @@
  */
 #define MMAL_ENCODING_OPAQUE           MMAL_FOURCC('O', 'P', 'Q', 'V')
 
+/**
+ * Bayer formats
+ * FourCC values copied from V4L2 where defined.
+ */
+/* 8 bit per pixel Bayer formats. */
+#define MMAL_ENCODING_BAYER_SBGGR8     MMAL_FOURCC('B', 'A', '8', '1')
+#define MMAL_ENCODING_BAYER_SGBRG8     MMAL_FOURCC('G', 'B', 'R', 'G')
+#define MMAL_ENCODING_BAYER_SGRBG8     MMAL_FOURCC('G', 'R', 'B', 'G')
+#define MMAL_ENCODING_BAYER_SRGGB8     MMAL_FOURCC('R', 'G', 'G', 'B')
+
+/* 10 bit per pixel packed Bayer formats. */
+#define MMAL_ENCODING_BAYER_SBGGR10P   MMAL_FOURCC('p', 'B', 'A', 'A')
+#define MMAL_ENCODING_BAYER_SGRBG10P   MMAL_FOURCC('p', 'g', 'A', 'A')
+#define MMAL_ENCODING_BAYER_SGBRG10P   MMAL_FOURCC('p', 'G', 'A', 'A')
+#define MMAL_ENCODING_BAYER_SRGGB10P   MMAL_FOURCC('p', 'R', 'A', 'A')
+
+/* 12 bit per pixel packed Bayer formats. */
+#define MMAL_ENCODING_BAYER_SBGGR12P   MMAL_FOURCC('p', 'B', '1', '2')
+#define MMAL_ENCODING_BAYER_SGRBG12P   MMAL_FOURCC('p', 'g', '1', '2')
+#define MMAL_ENCODING_BAYER_SGBRG12P   MMAL_FOURCC('p', 'G', '1', '2')
+#define MMAL_ENCODING_BAYER_SRGGB12P   MMAL_FOURCC('p', 'R', '1', '2')
+
+/* 14 bit per pixel packed Bayer formats. */
+#define MMAL_ENCODING_BAYER_SBGGR14P   MMAL_FOURCC('p', 'B', 'E', 'E')
+#define MMAL_ENCODING_BAYER_SGBRG14P   MMAL_FOURCC('p', 'G', 'E', 'E')
+#define MMAL_ENCODING_BAYER_SGRBG14P   MMAL_FOURCC('p', 'g', 'E', 'E')
+#define MMAL_ENCODING_BAYER_SRGGB14P   MMAL_FOURCC('p', 'R', 'E', 'E')
+
+/* 16 bit per pixel Bayer formats. */
+#define MMAL_ENCODING_BAYER_SBGGR16    MMAL_FOURCC('B', 'G', '1', '6')
+#define MMAL_ENCODING_BAYER_SGBRG16    MMAL_FOURCC('G', 'B', '1', '6')
+#define MMAL_ENCODING_BAYER_SGRBG16    MMAL_FOURCC('G', 'R', '1', '6')
+#define MMAL_ENCODING_BAYER_SRGGB16    MMAL_FOURCC('R', 'G', '1', '6')
+
+/* MIPI packed monochrome images */
+#define MMAL_ENCODING_GREY    MMAL_FOURCC('G', 'R', 'E', 'Y')
+#define MMAL_ENCODING_Y10P    MMAL_FOURCC('Y', '1', '0', 'P')
+#define MMAL_ENCODING_Y12P    MMAL_FOURCC('Y', '1', '2', 'P')
+#define MMAL_ENCODING_Y14P    MMAL_FOURCC('Y', '1', '4', 'P')
+#define MMAL_ENCODING_Y16     MMAL_FOURCC('Y', '1', '6', ' ')
+
 /** An EGL image handle
  */
 #define MMAL_ENCODING_EGL_IMAGE        MMAL_FOURCC('E', 'G', 'L', 'I')

-- 
2.51.0


