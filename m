Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5670DC5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 10:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ESyY6mS85KjCUsI5x5vm2izKlsP3ozPFYVEFc322MuE=; b=TWnZpuBKpOQknvuNFsN8QFHWAD
	nJV4IpjkUj0TkLrV3HJets3kXBZzZqnCsImyoskM5526PTP1fL7NnMmKhXUxR8X27hAGE5D8XVCaC
	agcNILu0HsSItkiaKJL0qvYveV1HXeUpaIrrgBlHKI02wd7PQB4eMq0N44VlzwmxFWp9ZqJNJb6Im
	oFEVsWm7Zo5BftrY4SV/qB3raFgK2P3Yv9RNXl+JIGS+tOfG67ODnnQaolwrcc/FKxQfw+YzmPODd
	lnsEPBwv1RM4UKoDKPLLYGYhDfILaroxoPHh8rtWO4KqG8voDRCQceQAmax+wTnggGe0XBCXI2JUS
	h2uupTsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdOG-00000009VuO-0AAD;
	Wed, 19 Aug 2026 10:19:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdO6-00000009VnJ-2HFU
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 19 Aug 2026 10:19:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ESyY6mS85KjCUsI5x5vm2izKlsP3ozPFYVEFc322MuE=; b=jFdOM1urNcxfhH8w9T5UzXhWUq
	Jwzp9ZM2k/lFyX7aQxiCbPIdEJ6OhXgcwLk+ZN8HFs0zrW4envVbnHde+sw5ZX/kJJZNXwrgO7U6F
	iKLoRXKAqPACyzGW9D0Xv1FyWJSHDHxHwAK+EPZazJx71Av3wOx7vbgxG8vTcM6CRTeXXZe19/R+W
	up3vEHERYEH+irPGEiZMtbXUWpLf3/EbLd7VHh9PO2NRTiuITGyGlA/ORzYbZjXRevg7svXIIQl5L
	JSZ1exbkmi9ztrRijPKWYsQGfhi/IF/JG0Erji7YDsvwKtEzPl6/IQRq51np85BViqW7ckLeesd9S
	0TkXOqrw==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdO3-0000000DUaC-37zZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 10:19:13 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4957eefd361so6386585e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 03:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134749; x=1787739549; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ESyY6mS85KjCUsI5x5vm2izKlsP3ozPFYVEFc322MuE=;
        b=gxxgUJOmTnj+5/f2OIwZm331DlVmGoMo95g2xCqKbOUZQESvbsHCuDw8CKgsEVr2sw
         aSb9Sqt3fWD46dhjKmLGInYZeSN0eCHbtOQgQ6oAMVWAYWPGOOTR0Ac/v3Iv5yw1AG2i
         s5LgFZcT3jlZbWhFMKX6uvyR1ALxnTtJlZOXQM8gnY1S6sXQeOpt0Skb4bdsyUc6i4ZW
         MKCj3YMm0vqiiqF90OnjvlBKYnyigbyHNjta/2Xs/mJbGaVC+dE1QJKZxlY+7ey1JnJJ
         EnCT8vN0i4KhQqIIilTL5yU1SfNfMwklc1PLocn0jrkouPlwxWb3kpNrp2VMmsO6pHQm
         vTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134749; x=1787739549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ESyY6mS85KjCUsI5x5vm2izKlsP3ozPFYVEFc322MuE=;
        b=iJHLbw76ddFkAiNKtEqBzOz3JWCn8xWy8PNl82sAQB1NgAoTTzjm+TEdMAgKSnCS0C
         9CJZkoaXJqea6pmtE/37wFX0i4e8/eje0UoxJy7TqCjEmGVbyr+Bi9rC7un28Ju72nqA
         5eZdwj7vUx9upiFZbYPRK1mhE8vGniXPUpz+6ziTV1BQfl/ILwiyP6JdlR8bTkXHdnW5
         VbxTpToLo8AerTyV/I/rOf8xXxSz0MyLZlMxmGHphy9QenJ6NNoY6cPNHTazijMRs17t
         NZNKM+j17R1susiVB6rMsnxrkTnCpkABMBcxlauU5zVY/zyvHyN1JiQqof7ytkI84f1A
         AKiA==
X-Forwarded-Encrypted: i=1; AHgh+Rq2SLrDscZYpJZY8W3BL6B1GdIH4dzwi58BgRl7fV97UDtk4jQTIKPpRLgshQ12+OITTUxs6cT0wMHfbTY21FG/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/XYbVjlgT3IoOeEBAThKm7hJia8k1HnaFCHNHQ3UYiXMBkyul
	bzi9WfBO92A74z3zGrwEUW9Q+Rz1nxtDm+xaFQXvkS/ljKmLCpZBAdC2
X-Gm-Gg: AR+sD10mpNm39IKrCdy3d0FTlE9bOcoEY1Yy/4P5x0qukPMyefHJZeEj8CCnfTMnO3i
	fB7zI/TAcQyd1f4PJh7oFbKMrIA1PlI11VRGsjgSLmYHS7WC1oh9gw4WvfymVMWr20GPzqO/Syl
	xU+xXOG8poMAOzJ+B8+FibRuRIkWH6w5OGubrWr4fi22PkMjgxy+gkFXlIfpHSPVGR7WIJFjowN
	PZiqD0GTAYJgr4B4AcfjFMuYhFQGQOs0l1W8MPh9Yl/PjEAShmajGqys4IEVe6AaemH7mS2V2C8
	2WbPotqqBP18hHIqn+ympzl8aYY3roIRAkh7SGSHop6cyIhNC1SlALBfFv8TfZHLmHjVBY9sZW6
	elzBrC8m/Wegc3Fh+Yb1GAynJYd51JXhFVu/9fNXiMoWopZZAeolNXdl/U6/LSGrXmkJUC3ul4+
	D3PZP267hHRa4v+J2MbpteUPHR+n+3hBb386h4RqqOp2iviQxT0LBOMA==
X-Received: by 2002:a05:600c:528d:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-499aa17d6a0mr69083305e9.6.1787134749461;
        Wed, 19 Aug 2026 03:19:09 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9b7c987sm27316965e9.1.2026.08.19.03.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:19:09 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
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
Subject: [PATCH v4 1/7] dt-bindings: reset: Add mt6589 toprgu reset IDs
Date: Wed, 19 Aug 2026 12:16:22 +0200
Message-ID: <20260819101853.44681-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819101853.44681-1-l.scorcia@gmail.com>
References: <20260819101853.44681-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_111911_817964_4FD639CB 
X-CRM114-Status: GOOD (  12.44  )
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

Add IDs for the 12 mt6589 toprgu resets which can be used in device trees
to identify subsystem resets. The binding for the associated reset
controller mt6589-wdt is already upstream.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Acked-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 .../dt-bindings/reset/mediatek,mt6589-wdt.h   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 include/dt-bindings/reset/mediatek,mt6589-wdt.h

diff --git a/include/dt-bindings/reset/mediatek,mt6589-wdt.h b/include/dt-bindings/reset/mediatek,mt6589-wdt.h
new file mode 100644
index 000000000000..5e39c8cdd718
--- /dev/null
+++ b/include/dt-bindings/reset/mediatek,mt6589-wdt.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+#ifndef _DT_BINDINGS_RESET_MEDIATEK_MT6589_WDT_H_
+#define _DT_BINDINGS_RESET_MEDIATEK_MT6589_WDT_H_
+
+/* TOPRGU reset IDs */
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
+#endif  /* _DT_BINDINGS_RESET_MEDIATEK_MT6589_WDT_H_ */
-- 
2.43.0


