Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68302CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 07:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cQKZaUmW/157OYpiPu8J9Ezy+PJ6t5W87ff0e+oVUDw=; b=KGIosMC2TK0XxGqE9m0UBLZVAF
	P80nAdV6TilmjHId8RLaPvKg6h8wrSaysyFINREAXs6vdg2c4zIqMCVvu8TPsf9vE+CrDQlJSj62v
	0F7gLxcrwmwYUoE3u6kcPeFXH/Js1fqeoM1QVVlPXxSPyUsitYxRcW5HpJXJAWps+8g+/DKmJnc0Y
	2nwM3nFnFKBCRVV3wx5wCKtvhjMztUvyZG7YJvnL9Byt2TqFEp7nYZMlea8eCKUstiSEtpPiLHfHX
	dqmMh7RjwaRg07KcvRxcKHenoBhBGYyBDeaXwuG7Y6L6q6Rx2bSR0q3et4b40zYLNI+8CuStJ9Y7j
	Xufm0DUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtKU-0000000EjNP-16SR;
	Wed, 14 Oct 2026 07:23:14 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtKC-0000000EjAg-3JWS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:22:57 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48870973bddso2221950f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 00:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962575; x=1792567375; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cQKZaUmW/157OYpiPu8J9Ezy+PJ6t5W87ff0e+oVUDw=;
        b=JdWcVWkme4V9Ub60xjBrAoC6tm9fwM1ut/APCZwUtJqYA15di18Y5kV3DUOqsGasbb
         GXBqRQd0GvzHnXv3cx42h2wMkpsNj2vSvAgG3+0OwuxOJ1eYBiOJNDWr5mufEqYfhTTa
         FEv2jU+wapES0K8tNsv4sYUvy570IJVBu7hzqTxQeKgF5xuD56MGmmQjl3VVZjhZkZT/
         3zjPGH+/ya362CRKi+gtw5yD8UF8x+7mir5RhjRVvbwbS9lpcF0x0eyudAe/8RmXIOYF
         jRv2TpMcZKVI3Ex32dvP0XRnJDs2rBEsbDNhfXdVw62ZzzMw3RfFurj5PZMmcVoltLWA
         C/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962575; x=1792567375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cQKZaUmW/157OYpiPu8J9Ezy+PJ6t5W87ff0e+oVUDw=;
        b=0ok8jyAK1JZC/E+j1Al9+mS0HtujpK5jKryrI8ZZn/PxWTxJOCtE/G19oClULc/Ua1
         +s3F5xkL5ky3VTnOryXfbxlgHZCigxG8/0oogE3pp6r2dXlG6067n+4+21YB7fNEJHIf
         V/chvPmyytOYEYvW6JpL9L0W/ia3VShz+Htli+uM+He9l9q8R93nmG35Y+OiVh1pMdwA
         LbbKUlCW3x/+Gh8qIrgBjUPCKHR6Gzry6Krtx2naXRmQLFMDQeyJEAiEx6rPiyqscL3G
         3GJumee3y0kg/zJSEaZlfYiCfsfMm9cmHwnRdCOiDtuwibLMZOYJhpHzKQOuPEFwUnxi
         p89g==
X-Gm-Message-State: AFq9FYIDfgDg5ufzU5goRP9GzmqsvCtrMkCvzqvNtehEUDkJseBEwPKM
	lESQJ23nLvKe490OcwTxvlVBga4NeopCFZjufebJDgOJid8o09B4Ydp5gWOxkZ+vjmK+eQ==
X-Gm-Gg: AYBFou2dgVgtPVbb5PUtYlEViFCfI/nPeo7xOxiH4e0mLAxIigZ086xT873UON76Nlw
	eoGLQ0K0D6oC7TrpbKAg0ANgATjStv1o0I/h10gI1f/fm9kNEgGwXm1pD6Iuno5yr+TJB9cPNFH
	sXaPtWTwPdtXPXEgq9GPt7b52xuEDlc76AwxByo76ZHYfWgNKdT/i0Q7u/binCqonB0WN+YZtUb
	Dnc5Rilx81N+taXEt2s6y2X1jyYc6a2cWSsRd+Bn5H+zuUi7/NHRKZrx3nurjANyTI7gmgf70bE
	1cH6MAqDojY9aipJplTsAX1VzKCRzokenJZV9rUJG95shEGEkCFaicpt87wxHKmkqVnmFiqhGjW
	sz+ieM8ADQU3c4KelCOSQ5Bv+snZc/Z3M/p5E9gEBN7r9ITcvgZ4jhL5v/stY7EYX1DwTyZWaQA
	DXO/p/4Jp40QP9YPa7x1htmS4lmIqpXlEMQnf+1+EglarpAMJdChIJKbQ/iGipaH+UF6QEzOGIT
	vZKRARUXMNKMrOM23H30J/eY9Fy0E6SPQuykWAoIUxaetBbQK3Qp2x0slHTzYJBIZj62tb2mxfB
	BtLIt1cQPuFhiYbK2nsY9B2Ki1bwK1bLmgT6BKXOaHDY9flqqQm5PRJVZpA5Hg==
X-Received: by 2002:a05:6000:200f:b0:48c:5669:747b with SMTP id ffacd0b85a97d-48db9465ffdmr33882716f8f.8.1791962574656;
        Wed, 14 Oct 2026 00:22:54 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:22:54 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 05/24] dt-bindings: reset: Add ZTE ZX279128S reset controller bindings
Date: Wed, 14 Oct 2026 08:20:45 +0100
Message-ID: <20261014072109.1759502-6-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_002256_845301_A60D4DE7 
X-CRM114-Status: GOOD (  12.43  )
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

Define logical reset indices (0, 1, 2...) for the topcrm and crm2
reset controllers on ZTE ZX279128S SoCs.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../dt-bindings/reset/zte,zx279128s-reset.h   | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 include/dt-bindings/reset/zte,zx279128s-reset.h

diff --git a/include/dt-bindings/reset/zte,zx279128s-reset.h b/include/dt-bindings/reset/zte,zx279128s-reset.h
new file mode 100644
index 0000000000..5b580bcda8
--- /dev/null
+++ b/include/dt-bindings/reset/zte,zx279128s-reset.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2026 Navid Ghahremani <ghahramani.navid@gmail.com>
+ */
+
+#ifndef _DT_BINDINGS_RESET_ZTE_ZX279128S_RESET_H
+#define _DT_BINDINGS_RESET_ZTE_ZX279128S_RESET_H
+
+/*
+ * Top CRM logical reset lines. Mapped by drivers/clk/zte/clk-zx279128s.c
+ * to hardware register offsets and bit shifts.
+ */
+#define ZX279128S_RESET_USB_B9		0
+#define ZX279128S_RESET_USB_B10		1
+#define ZX279128S_RESET_USB_B11		2
+#define ZX279128S_RESET_USB_B14		3
+#define ZX279128S_RESET_COUNT		4
+
+/*
+ * Top CRM 2 logical reset lines.
+ */
+#define ZX279128S_CRM2_RESET_PCIE0	0
+#define ZX279128S_CRM2_RESET_PCIE1	1
+#define ZX279128S_CRM2_RESET_COUNT	2
+
+#endif
-- 
2.55.0


