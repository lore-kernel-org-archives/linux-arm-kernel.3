Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0919BC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j2jX2ONoLkNVc2M79f93XZHxnpRgsCM884OBC2dJvMs=; b=yR6nx29tcxtCv899ZboZrZ9BdB
	UUtPuvPhi+9/P7QubHrE5P3pqa5VccQX7QRCIyrrL2Nbth4nMaWKTHPLtYNrq16w7XNRUGImpp71c
	82GS6Xun7Cmk3q/8jZkxpsqGK4jLQtxQzRqW9EWxbOyqcJ+naTt5gx+Z13zkQBwXcuzajCczuysTs
	NmBbd0a98LutgEnJTD4CeYSmYUJIxW0NBBolfYK7++if0clIooPNEf01xsl3+2E0EqsEKpmibkkXR
	s+5WLQewF4M85BA0rAgESTFHJoKvBhnKbHRugwE0sxN+behYx4IHvQBcNMFcUYu+G9v2t9TV+kGEK
	oXRP9rxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zs4-00000009rx3-1lFL;
	Tue, 08 Sep 2026 17:44:36 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zrz-00000009rrV-1EjY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:44:34 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-482ea739de2so3384861f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788889469; x=1789494269; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j2jX2ONoLkNVc2M79f93XZHxnpRgsCM884OBC2dJvMs=;
        b=jpRUrm1oRQJEtzgvNIgOtesk2TZr9+KP48RW9mgbGb2fkh2Cz5arLw61k4+TWbkii/
         jI2Sqw9KHxcPDvd60rRaFoQkYpQh/wnRwOHLLjpUsTsB+u7+ir8ZiuK67wDFpGlAvbxH
         rVOl7MULIcoaHeAD8dGNr53aAyFgb2tH0CKmlQM+pESHqG8N3uiKRjPVFn++uAnIp7wC
         P1rAUO7/tg9uzPZYWQZw+M7krJ1K++agShH/a9BGzyczCk5PU/oX7Q7QqUxRKEK++FDw
         jLlxOPCUwoMAn0ANzASXQoNQqFQBitF+7Xihe0oG9iuysoKULLMt08W+X6+aY7TEqBL0
         tdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889469; x=1789494269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j2jX2ONoLkNVc2M79f93XZHxnpRgsCM884OBC2dJvMs=;
        b=pkwPWrouiGz/H8suoGnYXsUmps6HpfD5cZdgFREb+safedgTVy5jKJMtOx4UYSCGPM
         XOK60HPqnfffV1/uJdGYNfLwzmnfzG3kYkGYC0mxgUbQamQP/KHZzcEmrO4FRTDpa+ZX
         buzoaRZKeCeGK2VjnbY2LLA62yBBazNnQBRRvlTSL92vRDShjwO+A48/VJMJWt3nE9HY
         PcSCWe4Hl3SJS7cvvquIaG3V99ndqBDxy+q/wsApYHqkxav812GStIgJWU4VXHyxO0pJ
         TtM1s0gM8Sea8YWgXHPdqDZzwrv9cCAmechmrZ6RLAYhy0BUheARgFpamvzHQpuRn35e
         S7Sg==
X-Forwarded-Encrypted: i=1; AKwUvBzsQm3i2wawvDM/UJ95M1UXF4dGNxJjOHp0j5ARtGRIuu1dfpGS3705a9HV9qwZaNjVwPbZ8ThYlAFdY3OQmVv8@lists.infradead.org
X-Gm-Message-State: AFuF++n9y+nuF4klEm+39je03IQLCjYRHV+j0MQjrIOiQH0l/CEhVxy7
	9nFyEUnlGoIyOaL5nvs/csIkx5rNbGoiQ2IfKOtk8SSr0u6XAfZML94Y
X-Gm-Gg: AYBFou0e8TG141bRcPJclWpp5jE9dT3/234pc9Pu073FkaGtbzTTuS2Me7dYX/AGrlD
	DoraRG9yAeevaTWu19aEfjHfryzZhdh6hgJMtU2Vs1zLflfp966UDfmvcgt8/vatCqsEoHDz/oS
	0FWpecMLixdETAhrw36ZvnpG8EKohVw2tx+YjH+USyIzZ/QZb1+bso78MHSwdc7/lx8i9gb84br
	q0J0TMyxkZmkkGUNnK5kNUamJaIk9NR2D6SrL1amu3cxjZto+DFHfoyTSRdgXX6NlDBfMBnRsPV
	arQYSrq8R0JfvHzstoseVWAzmGZSft4YIEHm/EBTyQf+wOleQeyEeI50qLX5W8z+2jetPHjPh38
	lDSXwjBTTcmDdAlFlmEFfTTSnI726Vmd2AXu0/F6SDL3ZroaLhi/nn93SP47pUKOqkzSmtfZ+if
	I4F/VYKn/XoRRVBE8vXSo5NCIm+S99598ley8MKzgylByccrbfZpCZffwigHqlEn1OKLk=
X-Received: by 2002:a05:600d:640e:20b0:49c:fc6e:a3e1 with SMTP id 5b1f17b1804b1-49cfc6ea77dmr202027975e9.32.1788889469206;
        Tue, 08 Sep 2026 10:44:29 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm487081105e9.15.2026.09.08.10.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:44:28 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 3/8] dt-bindings: watchdog: Add compatible for MediaTek mt8167
Date: Tue,  8 Sep 2026 19:38:30 +0200
Message-ID: <20260908174259.9009-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908174259.9009-1-l.scorcia@gmail.com>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_104431_361514_7AC760B3 
X-CRM114-Status: GOOD (  16.21  )
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
sheet mt8167 toprgu is not actually compatible with mt6589 (it has 14 sw
resets instead of 12, and its reset bit map table is different from
mt6589).

Update the mtk-wdt binding to add a dedicated compatible for mt8167 and
add the IDs that can be used in device trees to identify subsystem resets.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/watchdog/mediatek,mtk-wdt.yaml   |  1 +
 .../dt-bindings/reset/mediatek,mt8167-wdt.h   | 21 +++++++++++++++++++
 2 files changed, 22 insertions(+)
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


