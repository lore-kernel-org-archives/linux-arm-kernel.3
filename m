Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F8DC5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 16:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wErQbK67MOBFR4/JN7+7YvsDPOMtcfPX3LQkR2UcRJE=; b=e/ZC7JXEXCrnN0lpDMBX0kO0+q
	CNGoNM0gcfCip1DtVv7qwRa215MEg6gPIlqmxM7NrepWUndps9E4BvJtRrw8ox6KQbK6YldVFGr9s
	fkZjUJOqQzOqnR9T9RSgvLw7VeX3eLcKhP9PCo73ypYMoz5d+EsxgLCwj/7eSkT7h1ehoK8PIpd6f
	HiOcwx1d2Hx+7urdbDnTo1teRSnJ3Xn75d8XkQnhC8q3WtZdIOu8FkM1OXI9j0Wi5Mlgsd6iZPgsT
	MoTe2YbmgTzimf038EM6E7jlZgyTkqyGMefZElIRmTJgQt8UXb5KhilQzXsptwD4o1LcL1J5/80Jr
	tf5Ze2gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt63V-0000000ATPL-2Ic6;
	Sun, 09 Aug 2026 16:07:21 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt63Q-0000000ATHd-2rF1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 16:07:18 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4954df200ddso7051365e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 09:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786291635; x=1786896435; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wErQbK67MOBFR4/JN7+7YvsDPOMtcfPX3LQkR2UcRJE=;
        b=hSeBhEjPIueUW+ljLoioyOSuuB0s3aambmbFe8+x5nQKfhXV1aLvh1mv3+Z01RkBZE
         IYL/I4lhUQMLCeAQc0OvMzP20lR6nfdj9CaqWZ9zBEPuhp0W7mzZIQ/wON/4muLdik+G
         ZVWyWl2o8A9jIKhIqOLqSNycNhM/2cTjJlFsJq2nXemGoJvXh4dhR/0wzHaiuGcRW8rz
         P6f6D2Ore8Ck1SSBCE6rsd34I8x9yhiruue3WELCVsf1JMFfa2K7UhXRS/m2DRe5iERn
         qpzOw5qnaU7GlfyVd1zlxQOZe9lwLeCea9j6I3URvaTDIHkP5W/nU/rJYD+P14U2fbUS
         yQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786291635; x=1786896435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wErQbK67MOBFR4/JN7+7YvsDPOMtcfPX3LQkR2UcRJE=;
        b=Zn3HwoICcDsWMz96i2ZV3O5cwRC+8I2J6O1jbBgQld0W2FY0IlBamYulyJbJTxGd/k
         2yLfesL9eDZYPdtf6D9gick/PXbUPOAi1kTtjrCWjTtt3+GXkzj/lWt9GwjgT658cKZo
         AL36MuoeOdQeiwzzQvmiTrWBTKw5GY6UCMapKj2OrlbkrkUXYhXs212F8u9hREsZoml8
         +0brI3offPNVmUVwNPwE3yWhpIPItrY4IE7xZjAK7B2XEmGe2Hi5Cc5CyTP+nYyKwJII
         /1gR8q5yrGz4cwEcoBuaja8jiv22Nh0tIKSyB+Y+WGnUDR9DINExIAg0c9svWk5aJ6zz
         +Bow==
X-Forwarded-Encrypted: i=1; AHgh+RqSmP7jRtg01SaXREXE0abJmYd6OcQF5+g1V9/6oPfRTDq36NnK1iwyAUz7o4hoZny1Z8NPjHVWiEjopwUvkcjs@lists.infradead.org
X-Gm-Message-State: AOJu0YwcJZh/FJgCPLKMD/mI1nL3FF9nRudjyJiyoVMAAMescNWLNOeh
	R8KkuCpZqwt/cEVdtfFz6gRUnd1XSBw6enxTmLQHjf/+cj42tGNGJKaK
X-Gm-Gg: AR+sD12uqP8FOBpzE6RZMROkp/xsRyL3myG2YcK+4lxKmWAgJVzU1LrR/DWyeudxVp4
	3VpH9HWQs28wSTOudc5tkAmPXZ4WgoTerxrTAGqJ7c+wsXVtHrq04y+iwr9dZy7aUvEPS82NvJE
	Sw1s/9KbVTwWxLo0t2oTZRppNulVTr9YBjeMjU0Uben+wC8bUhVUTI9FXW014TUQRtD4/vqw4Oo
	zw6b0hpajkardYv2xQgPIg3ecgyWhMuDCDiKAuecdKEWHubf/NcFfh80Xja9maiIvKUXi5+xJ6m
	9v7YdjUVGhgpl5JIXoJ8u19KTY35x5cgdQxeTuXA4isudPWlFvqAYyMspdzT6v0MU9IwoCLBWVD
	YHzNAgXJdoYXBHmWg6ek27I90UBNshQPJ8Q8QM0c5a5k3qMcW4odv2WXNJbc9cQhyHrcjYJOy01
	1LIL06rb46UTj2LEF/n/4D//GIm4C1iSIPVlR8iD7DjAlr8Z+Bpi5xag==
X-Received: by 2002:a05:600c:48aa:b0:498:ff3:71ed with SMTP id 5b1f17b1804b1-4994e7e6e99mr318069915e9.17.1786291634595;
        Sun, 09 Aug 2026 09:07:14 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm209832495e9.4.2026.08.09.09.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 09:07:14 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 5/8] dt-bindings: reset: Add reset controller constants for mt8167
Date: Sun,  9 Aug 2026 18:03:29 +0200
Message-ID: <20260809160643.33991-6-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809160643.33991-1-l.scorcia@gmail.com>
References: <20260809160643.33991-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_090716_737080_ACC2D5A2 
X-CRM114-Status: GOOD (  13.50  )
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

Add the various bits that identify watchdog and mmsys resets. IDs for
mmsys resets restart from zero as they are used in a different device.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../reset/mediatek,mt8167-resets.h            | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 include/dt-bindings/reset/mediatek,mt8167-resets.h

diff --git a/include/dt-bindings/reset/mediatek,mt8167-resets.h b/include/dt-bindings/reset/mediatek,mt8167-resets.h
new file mode 100644
index 000000000000..af8a3e499f8b
--- /dev/null
+++ b/include/dt-bindings/reset/mediatek,mt8167-resets.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8167
+#define _DT_BINDINGS_RESET_CONTROLLER_MT8167
+
+/* TOPRGU resets, these are actual bits in the register */
+#define MT8167_TOPRGU_DDRPHY_FLASH_RST		0
+#define MT8167_TOPRGU_AUD_PAD_RST		1
+#define MT8167_TOPRGU_MM_RST			2
+#define MT8167_TOPRGU_MFG_RST			3
+#define MT8167_TOPRGU_MDSYS_RST			4
+#define MT8167_TOPRGU_CONN_RST			5
+#define MT8167_TOPRGU_PAD2CAM_DIG_MIPI_RX_RST	6
+#define MT8167_TOPRGU_DIG_MIPI_TX_RST		7
+#define MT8167_TOPRGU_SPI_PAD_MACRO_RST		8
+/* The data sheet describes bit 9 as "reserved, unused" */
+#define MT8167_TOPRGU_APMIXED_RST		10
+#define MT8167_TOPRGU_VDEC_RST			11
+#define MT8167_TOPRGU_CONN_MCU_RST		12
+#define MT8167_TOPRGU_EFUSE_RST			13
+#define MT8167_TOPRGU_PWRAP_SPICTL_RST		14
+#define MT8167_TOPRGU_SW_RST_NUM		15
+
+/* MMSYS resets, these are IDs */
+#define MT8167_MMSYS_SW0_RST_B_SMI_COMMON	0
+#define MT8167_MMSYS_SW0_RST_B_SMI_LARB0	1
+#define MT8167_MMSYS_SW0_RST_B_CAM_MDP		2
+#define MT8167_MMSYS_SW0_RST_B_MDP_RDMA0	3
+#define MT8167_MMSYS_SW0_RST_B_MDP_RSZ0		4
+#define MT8167_MMSYS_SW0_RST_B_MDP_RSZ1		5
+#define MT8167_MMSYS_SW0_RST_B_MDP_TDSHP0	6
+#define MT8167_MMSYS_SW0_RST_B_MDP_WDMA		7
+#define MT8167_MMSYS_SW0_RST_B_MDP_WROT0	8
+#define MT8167_MMSYS_SW0_RST_B_FAKE_ENG		9
+#define MT8167_MMSYS_SW0_RST_B_MUTEX		10
+#define MT8167_MMSYS_SW0_RST_B_DISP_OVL0	11
+#define MT8167_MMSYS_SW0_RST_B_DISP_RDMA0	12
+#define MT8167_MMSYS_SW0_RST_B_DISP_RDMA1	13
+#define MT8167_MMSYS_SW0_RST_B_DISP_WDMA0	14
+#define MT8167_MMSYS_SW0_RST_B_DISP_COLOR	15
+#define MT8167_MMSYS_SW0_RST_B_DISP_CCORR	16
+#define MT8167_MMSYS_SW0_RST_B_DISP_AAL		17
+#define MT8167_MMSYS_SW0_RST_B_DISP_GAMMA	18
+#define MT8167_MMSYS_SW0_RST_B_DISP_DITHER	19
+#define MT8167_MMSYS_SW0_RST_B_DISP_UFOE	20
+#define MT8167_MMSYS_SW0_RST_B_DISP_PWM		21
+#define MT8167_MMSYS_SW0_RST_B_DSI0		22
+#define MT8167_MMSYS_SW0_RST_B_DPI0		23
+#define MT8167_MMSYS_SW0_RST_B_MIPI_TX_CONFIG	24
+#define MT8167_MMSYS_SW1_RST_B_LVDS_ENCODER	25
+#define MT8167_MMSYS_SW1_RST_B_DPI1		26
+#define MT8167_MMSYS_SW1_RST_B_HDMI		27
+
+#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8167 */
-- 
2.43.0


