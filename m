Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670F2C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 16:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+mk3OWYLSToLJRsWp5g/85e+rXfgSRMqYxnQ/kEoFIk=; b=H1vn7PgRMFBXYz6Xt6X8lpjP0d
	S+n23RdIu9JGMQ3vKe4NJiKjSlCwVnHCTjGdry7ElIiqQi1BXZuqojuDZoI2F1pvi8HL/fY9S21fL
	ls1OrFE9TQioDsHXwV6O24v0Qmvz8R1MX2ewIiSQblg9EQ4wCgMA+Y1P91mSkqBSNt+SUjP/GVUIT
	tTWYXA5z7kqfKe1Y9yjlbvcnmx489F9sgvqoxOCmAgs1lFROSoGPaNTtyMoivDe7oBvlhvOpGLXW0
	E/NS7FfvL4FwqW6STpbCTH3W3xxMRRDiOINa4iS+rXUDcToV7tz7eqLAIvHTC3oCQzAW2irsdma5j
	7ChFpJRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uixhJ-0000000AxEw-3ENk;
	Mon, 04 Aug 2025 16:06:01 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uixWp-0000000Atdn-1sgW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 15:55:14 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-af93bcaf678so374609766b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 08:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754322910; x=1754927710; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mk3OWYLSToLJRsWp5g/85e+rXfgSRMqYxnQ/kEoFIk=;
        b=bk0XzelMhgLuo8vQeDU8gOkNZEukGS9As+ryVLIab2hBzsRL7iERlxeioRUCt3HfhN
         Ztye2EO83VhLEEAJW4CrehSxFn4CSnfL9VPvY+KVM9ZgR+UvGQfnp9gqHE1RI0vewUKw
         /WEP0A9/MxG4pc3TaBhXoYEKqi7hgD3OeMikH6D6oWKt6W6b4o41gcDZUnOoLgc8ste0
         qO8+b4ossCC4ZXff7xRH3bfu8ClPGXo1uT8KmDG+sW0YDIQPcbsCP7qSzxdx6MBAP3R/
         z8IZCl9PbTvsALguMjFc/EC0MXIFyLWRzHo6MY2/bWcfQ75mxKWFX3FMTKI0H+zEbCzV
         jApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754322910; x=1754927710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+mk3OWYLSToLJRsWp5g/85e+rXfgSRMqYxnQ/kEoFIk=;
        b=RbtIcjyXoQ0NYBUZC9FCFRid5lFqgZxTWTGO2Su2MStlZv3UclmD69zYvvT4VEIac2
         HeES1ri4eHCIdFcAigbggHgfkgRhOEZRDGOt03XCZaeDOvlRyPUHppaZurXh5buuuN+4
         PWTYyLe1tSDDRwv9GxmzUmO5vkAfhhn1E7uENiSjrHiyedUjCc2sckQptFrXqxcDqd94
         BTJLGp3bYIpvVWbnJ8U+tA9xzjZquzfO4ssd3MiUOG6+zHi19B7eCV24u4ZtuJnTyVIo
         tc/ah+kVup4PGZbIvuHyb7l9Zwwb+d8J3s/p70ULQIraS1Uogl/Cf5bL7dyq7Zl725LE
         a11g==
X-Forwarded-Encrypted: i=1; AJvYcCW2l8ZAMBGWRh6tZ7lAXbzRMAO/bOQ1TpxhzaNUBQEuBE9bEFFTt6SzNen2XducjjBGZAVf8DhpAii2iLq/TO31@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9ztlfS0dGoJffTpvP8LIbUZ76rEze1zP43llV+FPcZi2lT/CK
	SN4qBhCH5AD2vXLzowaELP+i76Uj7B3QtzeLiSuV/9n4IvlcnIoxD3c2
X-Gm-Gg: ASbGncuKec48EbDZSN06u0Z7NV1NQGs1HtDjTivwRlH8TFN9NOW/76+vOM7NarfS4p4
	6nsHJILtngmme9e9JdGogiIx/cTogFu+B6MN7lxQ9VVAxh1qf5Uk4+NCU1bgEwaACri+/L2UGDq
	J61mc6oWs3gN7F1ILwNLTj3MShNU/2mvmhNwQnGAs9I9wzOPhSJXN3eG+SsUL1n64HOJjRP9JEP
	S3k0lX5hFlbhDDQCUIUcCaM4qJ8rZ8NSn9gDHMZ4VwTlv+bnBEnIwzJBx7eFr05UYqYMkcntCfJ
	qIHmTXEB0z2imMSWfnPl4BgzEyzn7gAizwycTTssWcQmqIfdIxG8EHvCYdKUlZ8YIG14OJ63d/b
	rcMDmVilkmrjRInexoxzXsD8Xq33Hr9vkip5T/LhsnT5YgpQ2+50WvVhPuf2gp0dJEnKPfg==
X-Google-Smtp-Source: AGHT+IEQLmBUuRK724RheZWkPG7lebmyIqAtsj6RhVLdLdz6uzzGZDzQSt+B/vMM6nmib8DWWyjlOg==
X-Received: by 2002:a17:907:3e87:b0:ae0:bee7:ad7c with SMTP id a640c23a62f3a-af94022bf6dmr1097053066b.46.1754322909632;
        Mon, 04 Aug 2025 08:55:09 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a075a74sm761114266b.17.2025.08.04.08.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 08:55:09 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 1/7] dt-bindings: reset: imx8ulp: add SIM LPAV reset ID definitions
Date: Mon,  4 Aug 2025 11:54:01 -0400
Message-Id: <20250804155407.285353-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804155407.285353-1-laurentiumihalcea111@gmail.com>
References: <20250804155407.285353-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_085511_506088_11FEFE4C 
X-CRM114-Status: GOOD (  12.47  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add ID definitions for i.MX8ULP's SIM LPAV reset lines.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../dt-bindings/reset/imx8ulp-reset-sim-lpav.h   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 include/dt-bindings/reset/imx8ulp-reset-sim-lpav.h

diff --git a/include/dt-bindings/reset/imx8ulp-reset-sim-lpav.h b/include/dt-bindings/reset/imx8ulp-reset-sim-lpav.h
new file mode 100644
index 000000000000..adf95bb26d21
--- /dev/null
+++ b/include/dt-bindings/reset/imx8ulp-reset-sim-lpav.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef DT_BINDING_RESET_IMX8ULP_SIM_LPAV_H
+#define DT_BINDING_RESET_IMX8ULP_SIM_LPAV_H
+
+#define IMX8ULP_SIM_LPAV_HIFI4_DSP_DBG_RST	0
+#define IMX8ULP_SIM_LPAV_HIFI4_DSP_RST		1
+#define IMX8ULP_SIM_LPAV_HIFI4_DSP_STALL	2
+#define IMX8ULP_SIM_LPAV_DSI_RST_BYTE_N		3
+#define IMX8ULP_SIM_LPAV_DSI_RST_ESC_N		4
+#define IMX8ULP_SIM_LPAV_DSI_RST_DPI_N		5
+
+#endif /* DT_BINDING_RESET_IMX8ULP_SIM_LPAV_H */
-- 
2.34.1


