Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C9FC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 15:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ns/s8X4FLGsUS48lb8y5zK7Xq5THvoJSYI6z68H4XAE=; b=QqkpX8I+c7K7sOniIDRUuw+ABZ
	LhM2D88xHm839MZhKVTQtziJ2a9P0xuIyC7tN/wZx6nQ0ty1zL0UyNpB4BN7KJpjg6lV1jTaR25gB
	QKQ7QjKRpHMyY+jzx7QcGBj+rStFCwhe1vs2oKDmrDqt6LnqGzcAfLQGVG6bVExNsfsTz78wm11Xy
	VCITfKBlHltUmtHaQ/PKX8HjlHVkSZW+eAIy+fBwNwR7Ct7Nt2r0ei6qrjx1wyWfbgFbnJcqCc6ul
	y3W8MkSgVYgXZVO5CY5oKkX2BycMLAHwO+FXTQpqhMxhg7CEVm53Nd2i8p3TpPU3gAjgyCq2UG9N8
	hGBlJ0rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkHK-00000002Zds-0B8b;
	Fri, 17 Jul 2026 15:15:06 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkHE-00000002ZYz-3vXE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 15:15:02 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c15d111ca99so802519066b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784301299; x=1784906099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ns/s8X4FLGsUS48lb8y5zK7Xq5THvoJSYI6z68H4XAE=;
        b=bMgQAsSRqpuVIzwkhtMA9TG+poNrQe7J3jqpeCgVKy96ImAiRj1x5tkQPrmjSb/Vi6
         DH4CtbUWMMXPIrQZD4WF8XJz5vvTJXLS78Rq6GQZZA5yjHB5hZIcYioQ8W5IEg0Y4Cbp
         SkDR9QymwfwCF6XeJsVUxL7YbMZ6AGDn218fwZliZ46Eq9krc8IgfhmnFGvhlOiaIKu2
         ADFPpl5sQiHlBWySydUEAiVYpc2vm2DIbSW6AveKwUYdeUoEwwogxTRU6/YTvEpACz+0
         rjr4esu7gcd93brNvs8Xd/EMI3eIXgf2ahLmU2SijnFrTH5+YGHMxZ7SUTZ16Okkxhr1
         1ccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784301299; x=1784906099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ns/s8X4FLGsUS48lb8y5zK7Xq5THvoJSYI6z68H4XAE=;
        b=Ypkj9KXNv7QgdI4PsxMb6G3/l7aWr/bzg937/VW60u6JgGystQAJWhmFbHw766g27G
         Lj3GqC6YxCxi+bJLEHyJqvVSR88n1mWZMPKmwbxCxaC5ja2zOs66vzuFjUHMf46UWHTv
         hOp8MQSVh70KXegBxXjwqAaa1oSRUlnP4qtzgu4GOxGUlTJiWiLz48PGV8Rk7UvGx7au
         1Ta1htsx2NtQOCaMnIKfOpgzLuOzGdmYTMyzKlyQPpy4GPlfouR0tfL1GH80eeHAyAQW
         sK5gRvajzu2vziBe1DBjEGKRxLGMsGD3nsp4hj1gsAYycarhBeih2u6CwvAi8WJdGllr
         vqbw==
X-Forwarded-Encrypted: i=1; AHgh+RrI+eikrJc5YA0qM+SgKK7sDXdK0cK8EGh7yNFpNBD/R47iKxKo+Qhf/KhtUbXH5TcJciU+kiQ2wJWF3TFmz4vd@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4SzTp1mcn2vHl58KZuDqBuns6h7qXr4Gxf5o88AoiQRCU4C6/
	IzSBXSZSJ3dYWyqVWMtR1iqnn1JlMh4FQvdBczqCH2N5koke67u2NYK2kE/HyY7i
X-Gm-Gg: AfdE7cnOPcgB0AUUUJLS3fPsybPNEyxLaJ95vqumjY/lf1IdtNDSNyMfCdncHlXb6Pl
	MfwcZYtbzvZ6/4MMrI1JUm/wO5SVcqPeGjCt9AiYxDimNEmoAOOYEsGRp6fYjuStK3iHHXAlp9y
	VpsmRmscdxEdp3CLJvlQMHq5p2kbubit2a7BUNrrO5H69oyEqYe0BeoInTZwt7IEoyA6jLgjQp2
	FalRAlCR+eSdgrptRfWEIyoOa8XjqSA0zdA4dsYqeO2gspp5uMsxEBjBEbDaFxhjGtzx7uXYNQ/
	zbFkecDtnWqIttRgGBRYXB+wt8mi6D05APiCNTzxSkydggnKfpDN4BQ/NcWyYTDoaO7E40yA9JX
	DzXb/Drk9EPmIZKDVPa3/Zig5mXC0FdLxOhpn3lrRMLJbRpU3k2vpuNrWeDb96VipnS3APvBE2w
	==
X-Received: by 2002:a17:907:987:b0:c12:979c:5a5e with SMTP id a640c23a62f3a-c16b434bccbmr156573466b.0.1784301298720;
        Fri, 17 Jul 2026 08:14:58 -0700 (PDT)
Received: from luca-vm.. ([109.52.116.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbab34sm931684a12.14.2026.07.17.08.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:14:58 -0700 (PDT)
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
Subject: [PATCH 1/7] dt-bindings: reset: Add MT6589 toprgu reset IDs
Date: Fri, 17 Jul 2026 17:11:08 +0200
Message-ID: <20260717151134.678839-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717151134.678839-1-l.scorcia@gmail.com>
References: <20260717151134.678839-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_081500_986105_28732D19 
X-CRM114-Status: GOOD (  11.95  )
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

Add reset constants for the 12 MT6589 toprgu resets.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../reset/mediatek,mt6589-resets.h            | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 include/dt-bindings/reset/mediatek,mt6589-resets.h

diff --git a/include/dt-bindings/reset/mediatek,mt6589-resets.h b/include/dt-bindings/reset/mediatek,mt6589-resets.h
new file mode 100644
index 000000000000..ee08c39df513
--- /dev/null
+++ b/include/dt-bindings/reset/mediatek,mt6589-resets.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Author: Luca Leonardo Scorcia <l.scorcia@gmail.com>
+ */
+
+#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT6589
+#define _DT_BINDINGS_RESET_CONTROLLER_MT6589
+
+/* TOPRGU resets */
+#define MT6589_TOPRGU_INFRA_SW_RST		0
+#define MT6589_TOPRGU_MM_SW_RST			1
+#define MT6589_TOPRGU_MFG_SW_RST		2
+#define MT6589_TOPRGU_VENC_SW_RST		3
+#define MT6589_TOPRGU_VDEC_SW_RST		4
+#define MT6589_TOPRGU_IMG_SW_RST		5
+#define MT6589_TOPRGU_DDRPHY_SW_RST		6
+#define MT6589_TOPRGU_MD_SW_RST			7
+#define MT6589_TOPRGU_INFRA_AO_SW_RST		8
+#define MT6589_TOPRGU_MD_LITE_SW_RST		9
+#define MT6589_TOPRGU_APMIXED_SW_RST		10
+#define MT6589_TOPRGU_PWRAP_SPI_CTL_RST		11
+#define MT6589_TOPRGU_SW_RST_NUM		12
+
+#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT6589 */
-- 
2.43.0


