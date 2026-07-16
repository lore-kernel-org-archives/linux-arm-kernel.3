Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60B1C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 16:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7KAndNulGWhi7VX32166S+y+iqFsKuw1F9eHZj/FgoU=; b=rfOo8ofB3xmMTeHBK2jqjDnR2b
	B9Mvju9FxifK41BNhU0Zpb761qHoupjxpKpGfE6JtvhEyIC8Sbe4RcLtHsxh/16j9XpD/aBZCeltj
	N/GcePEWIrQ4AUT1t/nrY/U7gPjzlkRa+CPdOZ/eQ7utyfmLTPj2m03qj4Qu55l95I5fnw0BnRMZO
	OPAWg509CMzwSTpm3v1wPmV3NnO2fm3fX0blUx61XO/ccaYzK7kVfWFIZChQY/4nB9kvUvBjmqP1n
	vQMC9RKtJN17O0mXcbFtlSHftMrq0wMbks+HnuZ8shQ+j1dRPhdCOtyBItqaaurj0uqzbr+P5ZDi+
	ECH8mJ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOoi-000000008Et-3zSX;
	Thu, 16 Jul 2026 16:20:08 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOoY-0000000083a-02at
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 16:19:59 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8486ac3f347so475988b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 09:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784218797; x=1784823597; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7KAndNulGWhi7VX32166S+y+iqFsKuw1F9eHZj/FgoU=;
        b=CUJpa9j7uoWW18t+PpOQ2n969Y2HXCFF1+8QkDrQfKRUI40/I+cNLxC6Os2voc+W6s
         aBWq8/eKUHYT/MP8L5XPDL1VK+awLXIq6SSHRDDlhoMGA8ltzRhHK+VEz9g0ZgDZomip
         W8A2LSsKs/2rCZKnLkZrAJZMcquSHHom2DRGBTSa86oy/hniy746MB2HHKN1eApWAZjr
         KKWpvdiHW4280e3UE+dmGytBu02oDs3f7w/mmZ4AQLJDP7SqwNlLeqpCwNwH921fIEgy
         D44CVEqwMrXzFXTpsx/pkY/fHObOCdsMjGssZyga3zJjkuNlxpOtJ4JjPhfUnkpk9Nzs
         Sk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218797; x=1784823597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7KAndNulGWhi7VX32166S+y+iqFsKuw1F9eHZj/FgoU=;
        b=lmst9pAh6WiHLwC5p+LdjHsi4Odz9QjzrXbRj8K3xqVZOFqKGtuGE9th8BP+yPzz9O
         aGxmwseN4Qe93u6DPzTXAcdoLrwIKwHD1cNN0hGIg2GOwq8HOyNNjgTQzhbwSgZLtPNH
         K5J/SqV6ZEktqPaSqk8EyIESn37Rr4uS99z6jWWnW/cKsQXUiGO8v4ui2DtLQ40kDhL5
         eMSdWMNz7UzAAId61HvA2nOFcYjMx2T7X7wRGuVOjX+RkPqMNQMT+94cUJAjgcoZsd3D
         TRkPfK+6Ghp7t/8NbU5O995wWEcRaWtwKG+99JyLDotXfyyNIAiUb6l3OMY4Cm3ANKh8
         b4Uw==
X-Forwarded-Encrypted: i=1; AHgh+RoTWn8gJ6wrfGD4NsnBCT//MJtWblUAPU9904J2Oh2XF3TnMxxQ1g1FO9KwjcLtCvYHoErQeaSV1ZOiYKXjwU1A@lists.infradead.org
X-Gm-Message-State: AOJu0YytSVaTI5y/oUlRHAd0DlQnlSfPRBUiQpi8wZxxsiI1UcxGMRlv
	bV7BNC6XH3W++hBNmyvBWrOIjwbGRUzffiVQnnZRlOjBtuTiPmkWvxd6
X-Gm-Gg: AfdE7cl+IQsQwl4nsjcJrwgCHaoiPGWG2hmt8Hn+AujbjwRUp2cDQC5qKvUkFfeDzjr
	bFH4ZDOQQXDaS6o5TszqDQ82dE2czC7lEvplv4NESeXnO7LRr10sWtA8am/zzVr/Fh3x4We+kEH
	gpsU0ztizSLX2jb8nBrfJy/r+obdZBSFSU+TLxj2ULfVO5MLwU7jULxXbkZfflm43yBuqVBxQPY
	sfoWSc60Bz/jXxCnMkaikO70MvSNnWm6vbJ4vs87C68rZbPDlbY5ClNr7mCT6iJ4olZuF9BRn71
	hE/AP91qdvpvu6146BgYvw15pKUyEiqzLxCr0lggaLH6BbN+sw/PRPDM5VUMRSvXRZ1UoFXA2+L
	/t9yPSzFG4idhLjILXdHkRYemm7GKfk8KHOnSKNjYd3dSERum3t4V4A0Pb65nFs9UtzuQlx67hY
	AR5mLO7dRem9J1lT7xESZbb/Nhtg2HeScR1g==
X-Received: by 2002:a05:6a00:3c8d:b0:848:2a69:97be with SMTP id d2e1a72fcca58-84beb1a539bmr3230781b3a.10.1784218797312;
        Thu, 16 Jul 2026 09:19:57 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f23a600sm5092661b3a.6.2026.07.16.09.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:19:57 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Roman Vivchar <rva333@protonmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 5/7] dt-bindings: reset: Add bindings for MediaTek MT6589 reset controller
Date: Fri, 17 Jul 2026 01:19:21 +0900
Message-ID: <20260716161923.266315-6-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716161923.266315-1-akkun11.open@gmail.com>
References: <20260716161923.266315-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_091958_050403_D0EEEF18 
X-CRM114-Status: GOOD (  12.04  )
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

Add MT6589 reset controller bindings.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 include/dt-bindings/reset/mt6589-resets.h | 25 +++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 include/dt-bindings/reset/mt6589-resets.h

diff --git a/include/dt-bindings/reset/mt6589-resets.h b/include/dt-bindings/reset/mt6589-resets.h
new file mode 100644
index 000000000000..18ef729022a9
--- /dev/null
+++ b/include/dt-bindings/reset/mt6589-resets.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026 Akari Tsuyukusa <akkun11.open@gmail.com>
+ */
+
+#ifndef _DT_BINDINGS_RESET_MT6589_RESETS_H
+#define _DT_BINDINGS_RESET_MT6589_RESETS_H
+
+/* TOPRGU */
+#define MT6589_TOPRGU_INFRA_RST		0
+#define MT6589_TOPRGU_DISP_RST		1
+#define MT6589_TOPRGU_MFG_RST		2
+#define MT6589_TOPRGU_VENC_RST		3
+#define MT6589_TOPRGU_VDEC_RST		4
+#define MT6589_TOPRGU_IMG_RST		5
+#define MT6589_TOPRGU_DDRPHY_RST	6
+#define MT6589_TOPRGU_MD_RST		7
+#define MT6589_TOPRGU_INFRA_AO_RST	8
+#define MT6589_TOPRGU_MD_LITE_RST	9
+#define MT6589_TOPRGU_APMIXED_RST	10
+#define MT6589_TOPRGU_PWRAP_SPICTL_RST	11
+
+#define MT6589_TOPRGU_RST_NUM		12
+
+#endif  /* _DT_BINDINGS_RESET_MT6589_RESETS_H */
-- 
2.54.0


