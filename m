Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042A9C5AE5D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 16:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9XbMehx8K2bZ2mGpb16Pwzbd3JSYKI87k4OfxyTYe5k=; b=wZ+1rknMDJ6QBxpSRxOWs5SKu7
	y+4ZZ38GHTnBTbERChh9I6OxKkE++OAxusPPKJzZz1rwfqWlq2PKM8//8V3Kr0wpTCbm3M02Jy04c
	DBCQ9O8DLhrxt73/zHO5yQGYghIUR6OA8nJWwWlqQ4E8HPNMczq5KVg9/5CX8bWc9IVyVNjfXFkX/
	6yQpR3p/Eo3GMQYzxVaQS7MXMqLfm3k8QRBjhfemJEN92fnfrVYDW9GZiiTfa+EqIY4eKYU9M2UWl
	NwXpVZZP8ZZHwpl283rp6ibTYKqdFunBlCR/er0M6OczDup1+qZ1eEHLam0CrfQzf1c3mWMinZ9ey
	pbbeGLfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt63L-0000000ATD3-3LMs;
	Sun, 09 Aug 2026 16:07:11 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt63H-0000000AT9U-0OTP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 16:07:08 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4954dff6536so9178525e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 09:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786291625; x=1786896425; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9XbMehx8K2bZ2mGpb16Pwzbd3JSYKI87k4OfxyTYe5k=;
        b=hSNTafWQ1LdgGWa+hmIVg3+AFiBJIyMpeP+rfsz8kLHOJFY0VwrMpMF6BP3nLRuoth
         SCD7qRNRDG/keRbccS1OhmbYJlAGAn1YJx5lwxXAAoSwArbyjlbk5TWtcsNnWKWzhRsl
         w/acbjxvZeBldb6ARvGK4zhsBYhBOKCbIVAD5vKEkEEbPLl7H1LobEXTdM9aIz6y47da
         vquwTifS9oX28DYTuEBrjsfcgTl7XBFt9vZvs4b1P5j6uJXDmXD5NBGXqglZktSTPU8/
         x3NtPp2kfbxSn0X3h3AHHYQMuOtlhHzNyg6s65dvaZezu6u6e7B0Z61tpw+AwwLyTQNu
         yUZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786291625; x=1786896425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9XbMehx8K2bZ2mGpb16Pwzbd3JSYKI87k4OfxyTYe5k=;
        b=HLbsg1OJsOPvyyMngf5z/dBDixUDhc692M09o8MkRQjtgV1ZlP/lpcDWK5M786G1zG
         jIiW4fcMVCC+D5UH3axrT0xnK/CSRUWLX3+H+Hk4d4+Ql4mO4osY21+Z5A6rJ2WYY/wJ
         zDoTMWuB+htsMimRfDqRYQyWi84rBx6ub2jSXEWXUccVDegN6DM9e1gjB2ZzJW0RW2xM
         CGeZc0ImZy5I2MceAs2xEITzy7if+c/U0V0iTbpbin16+AzhePkIbgkEC6IebHXefKKf
         kYIQQDUsxe2at7QaXFYqVGe5EtuxHECPvgPZTd3GUB3ICMLM65VmZYjpDcbdid2YIAp1
         Tz8A==
X-Forwarded-Encrypted: i=1; AHgh+RoGJ5qmvwF1cF8974pm1qTzs7zHefCatKJzrmbJDBk2y8dGbdvXLAwu8HtX+CefJ6tnvtSQmDkzeBwXy8UgfU+t@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb3dSetVOhS0ymwYRZGQFnxFyB/V2tpxMuRyze10OwELgcyr95
	RnjwOOYk6a7Q/8C9Lp2J6eBWpmoBOYdrh4LHaelHgyIREWYHbL89LcA5
X-Gm-Gg: AR+sD10kMP0+Hziaxbx9IDsuwC39ngtnTqQjCNmSv5/h1gaDGldv3uUo8D90JO2JITA
	eIjnSWWAdpa/T+c6AuwUTOMufrQ/BfThjgLczRzq99QIgj6OzVauQnTsXcT+xOcuGu1k8uA8N1i
	i2vfum0WVUIR77Q5bYnpRHgDBIcrsY7lVePsfhWNijXGPbc7OnLMp31lSzq8n14rJgIIc80EI0u
	BWNTOynp9LGirD6B/fF1mLXZlsw03ioHUw988Em4Xq8hWEKE9PGYxvFaVlBNEVO2qG6oOXKXjG/
	y2x1uIwZ90c9YkwP4wWB88X5xNR20z8IYTya9TGeChdYQ2n/rR3C+GW8IOIs4MJxn80MSCxbsB9
	lODoS8nf2ib+a3nSF1VTBacKjpxmqOvL2bQ/QeDfpd4OHlMBu1JshvD1c88I7Wjwlfx22NHyoqM
	lb2FKsIYL6YOFZ6swGAWS/VhdejJ9fhuDwhjHCjqOYb5dxs8kcZ4rVaQ==
X-Received: by 2002:a05:600c:1f85:b0:495:734e:4825 with SMTP id 5b1f17b1804b1-49959e3c571mr301623835e9.16.1786291624921;
        Sun, 09 Aug 2026 09:07:04 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm209832495e9.4.2026.08.09.09.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 09:07:04 -0700 (PDT)
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
Subject: [PATCH v3 1/8] dt-bindings: reset: Add mt6589 toprgu reset IDs
Date: Sun,  9 Aug 2026 18:03:25 +0200
Message-ID: <20260809160643.33991-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809160643.33991-1-l.scorcia@gmail.com>
References: <20260809160643.33991-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_090707_141122_994C7EF4 
X-CRM114-Status: GOOD (  15.28  )
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

Currently mt6589 watchdog driver implements the watchdog feature, but
not the reset controller feature, which is actually supported by the
hardware.

Add the bit definitions for the 12 mt6589 toprgu resets, which will be
used in the following patch to enable the reset controller. Values
determined from stock Android sources.

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


