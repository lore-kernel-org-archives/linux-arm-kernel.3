Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF2FC5DF89
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 10:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RPKoXj0537sjg7TtWfXNcXGDOvi6v2gbjQvu6MW0moQ=; b=BRFq/RePIKtGc4aoJ049vYnygF
	ptvPhcH0YWRzkMnkh1/g3/2PWIWJqOZyu3Z6DLQY+NnfCD9ld4LUpMhT1ljH2/7GoPKn6bbTzWRM4
	e3QoqCXJ8j88y64zA0nlI7/lyIf6GsfRjR5mafUP+YKJ8kE+a11/WfoMcFhsKZRhzNeCdF1XyfYcI
	ngzF7H8J4D3gtGuTYv9/Psf/8bUL2kHNjvOTrYjlPlQ6oDC2IWA79uwbKkw2HokXHRWQZ/TRTkdfm
	KTK7KPcN2yTn1LigrKMW9u969lyt8BM4QSIwRJGZEaAJBHPWQx9K+ZIIdE7CK9uAgghqGMDi7anXR
	PkMkj8NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdOZ-00000009WBW-2qoQ;
	Wed, 19 Aug 2026 10:19:44 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdOC-00000009Vr7-1ZC6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 10:19:23 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-49558ce01afso6971515e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 03:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134759; x=1787739559; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RPKoXj0537sjg7TtWfXNcXGDOvi6v2gbjQvu6MW0moQ=;
        b=fWgHR2sOrAyBs/6aUwJvfRHIo9qoD6pCEBK7NGDcjGmL8ROGY/v28v0eG8hLzywQ85
         Uao1XxCrGaFP1JVnrz5o2V+zwwvc9NNuXaBNJMzrxd6Pe4xPMfUSc3kedSaDUvcrZU2v
         EL88q5Ffys0TDOnbRn5zxQ2e4pZ852GTv0sSn2tsJWfIm3bXIx+j1demYsn7uaHUOAdv
         S9ZmVWRuXY3cvd654qbvPDjKOZD2JLsmqC+sstS7y5B8WZ2QnDWp22TQhYaFK8Bhv/p/
         DAJpig+x1JvvfabMVquytE8VCmf/xc4mOw31Ub0WOfDolcd9fJhORNUDQxm/QE7Gs8JK
         FV8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134759; x=1787739559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RPKoXj0537sjg7TtWfXNcXGDOvi6v2gbjQvu6MW0moQ=;
        b=Fe+0uFG6ZtsGNwsGQYV22bpI/C23B+nb5d9onYM61HsmHjoa3N60UKjdkdTHsixRu1
         eF8qUpeJPUlLfUfsUZ2DLW2nc3g7Om2aqBWbQhEWZx5eN8iYILKtLFho9jbYWbb0T04g
         gmK+EKbXL+xRe/xV3FpTQ+HpdHl5tSRG6hfNBC8CfXXjS6PGepbOXunOSEj6C8E7B/Md
         1Lcrh/m+dtaWU+FUAXwHHjO+lRuHeGF3gE8i4thzOdt7tDcW2IoxEopfcUpQXUQ3RfY6
         lAzXSifjM4rlw12KoLUpzAn0H1YYmMPf+ZfVQlhlbG9/1KPdY5EobxyMBtsVHNKlk9gP
         MoOQ==
X-Forwarded-Encrypted: i=1; AHgh+RqKmNdmXforV/GI7CcqTaqTN3hzH2cdTZVRzdiznx+kk1/FclOVeq6cUSrZIcrjrvcjB7Nk7tsSqlZSYtxj/rbx@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8eqnqn2H74MYE2ev4FPdHdPo/l4Gb3W1h0Pp1WKHopT/RTe8G
	gbuxTGi3h4C5W3AdzOfgBzPpwDJ+ERTWR6JNqROSk6rPPGcKG+MqwyJ1
X-Gm-Gg: AR+sD13exFKEgYQjoEG6xUJ+MEyyU8KQIXr13FS3Sqd/ex3MvvGA8j9ctoJiQYnd3tY
	VXUgHYjuiiQ1pE9MFvslLWUkAldEQ63RGyxGO83Q8AGkcIhkTIvC9r7AH06mgA6ZWXZxowfDOfy
	RZdLWM35RXiWcJhyz+FQyuc2/pOsxHj1FqpSgFOUKZAIVRmjqnQQQ90yVf8Z7akCNRAftF+Q8la
	3Ipot5E+WWf8ykasNHtPA/sDWL8GX+6Gc9wzdp74r5JVFmjWfJ8lmOApP9SGoK6blmcx0VUMcE/
	Zv5ZSjaLi+4dpv8xXHEuL/pNzFowvCrOt8wMNPWKPn7XlYtChl4zDxTD6eEhDNGwUuiWnrkd6F1
	HLU6eyTgKdslWTN01uvBBGsqUZQno9jUealKJUYCkGsDLIqvSzazaVWY2zGOHNOyaWMqb0x/Nrx
	5uIHiafrJfCF9T+C0YzuQxQYVtxYfqsHSNx4F+shhgNDFs/8IthqaXODEVCcwdZXMX
X-Received: by 2002:a05:600c:1f94:b0:499:8807:345f with SMTP id 5b1f17b1804b1-499aa1b6994mr52091595e9.13.1787134758588;
        Wed, 19 Aug 2026 03:19:18 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9b7c987sm27316965e9.1.2026.08.19.03.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:19:17 -0700 (PDT)
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
Subject: [PATCH v4 4/7] dt-bindings: watchdog: Add compatible for MediaTek mt8167
Date: Wed, 19 Aug 2026 12:16:25 +0200
Message-ID: <20260819101853.44681-5-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819101853.44681-1-l.scorcia@gmail.com>
References: <20260819101853.44681-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_031922_693438_0A15E991 
X-CRM114-Status: GOOD (  17.00  )
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

Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
which in turn falls back on mt6589-wdt. However according to the data
sheet mt8167 toprgu is not actually compatible with mt6589: the latter
has 12 contiguous toprgu reset bits while the former has 14 non-contiguous
toprgu reset bits.

Update the mtk-wdt binding to add a dedicated compatible for mt8167 and
add the IDs that can be used in device trees to identify toprgu and mmsys
subsystem resets.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../bindings/watchdog/mediatek,mtk-wdt.yaml   |  1 +
 .../dt-bindings/reset/mediatek,mt8167-mmsys.h | 35 +++++++++++++++++++
 .../dt-bindings/reset/mediatek,mt8167-wdt.h   | 21 +++++++++++
 3 files changed, 57 insertions(+)
 create mode 100644 include/dt-bindings/reset/mediatek,mt8167-mmsys.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt8167-wdt.h

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index 953629cb9558..f514be8a5851 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -26,6 +26,7 @@ properties:
           - mediatek,mt6795-wdt
           - mediatek,mt7986-wdt
           - mediatek,mt7988-wdt
+          - mediatek,mt8167-wdt
           - mediatek,mt8183-wdt
           - mediatek,mt8186-wdt
           - mediatek,mt8188-wdt
diff --git a/include/dt-bindings/reset/mediatek,mt8167-mmsys.h b/include/dt-bindings/reset/mediatek,mt8167-mmsys.h
new file mode 100644
index 000000000000..b21f67b3b55c
--- /dev/null
+++ b/include/dt-bindings/reset/mediatek,mt8167-mmsys.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+#ifndef _DT_BINDINGS_RESET_MEDIATEK_MT8167_MMSYS_H_
+#define _DT_BINDINGS_RESET_MEDIATEK_MT8167_MMSYS_H_
+
+/* MMSYS reset IDs */
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
+#endif  /* _DT_BINDINGS_RESET_MEDIATEK_MT8167_MMSYS_H_ */
diff --git a/include/dt-bindings/reset/mediatek,mt8167-wdt.h b/include/dt-bindings/reset/mediatek,mt8167-wdt.h
new file mode 100644
index 000000000000..1a24bfe079ca
--- /dev/null
+++ b/include/dt-bindings/reset/mediatek,mt8167-wdt.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+#ifndef _DT_BINDINGS_RESET_MEDIATEK_MT8167_WDT_H_
+#define _DT_BINDINGS_RESET_MEDIATEK_MT8167_WDT_H_
+
+/* TOPRGU reset IDs */
+#define MT8167_TOPRGU_DDRPHY_FLASH_RST		0
+#define MT8167_TOPRGU_AUD_PAD_RST		1
+#define MT8167_TOPRGU_MM_RST			2
+#define MT8167_TOPRGU_MFG_RST			3
+#define MT8167_TOPRGU_MDSYS_RST			4
+#define MT8167_TOPRGU_CONN_RST			5
+#define MT8167_TOPRGU_PAD2CAM_DIG_MIPI_RX_RST	6
+#define MT8167_TOPRGU_DIG_MIPI_TX_RST		7
+#define MT8167_TOPRGU_SPI_PAD_MACRO_RST		8
+#define MT8167_TOPRGU_APMIXED_RST		9
+#define MT8167_TOPRGU_VDEC_RST			10
+#define MT8167_TOPRGU_CONN_MCU_RST		11
+#define MT8167_TOPRGU_EFUSE_RST			12
+#define MT8167_TOPRGU_PWRAP_SPICTL_RST		13
+
+#endif  /* _DT_BINDINGS_RESET_MEDIATEK_MT8167_WDT_H_ */
-- 
2.43.0


