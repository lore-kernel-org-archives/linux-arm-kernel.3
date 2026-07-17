Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28E2C44520
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 15:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kCSbtpTfn0tjI5mWiKnAehObxNB5ridQJcKUxITI8TU=; b=eu2xNzNDN2LBqlxxS9gRfpTqvA
	pK9ZdN4eyLjbak6VG98WCWhTUD4FKyt1wG/fF3amaNxHlBTLeET1lPsdzWS9wuDQWrFIBVeyo6BSB
	UgfVutMztwIyjrEwRmvYIRuxBJ5oDRqQzAknMf+vMAC9KCzCi33pcIiCLFXqO6XHHw6xdKt3L9uLa
	1MkivOnupBCyA4CIlOyIWn5kmYiUJXASuxDXIrZRe3DTR8HaWMzoHFxcrCSnDmNG/T79kaOr1WgTx
	wd4P4L3YQXLz254PeEIJMdxEJehe6h3enHuKY1p2urlKdAQ+VWByDZ0L9qIh8jVyBkcLxLc6a51TL
	oKffF9Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkHU-00000002ZnM-2svf;
	Fri, 17 Jul 2026 15:15:16 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkHK-00000002ZdV-2opC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 15:15:07 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-69a50b818c8so13118351a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784301305; x=1784906105; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kCSbtpTfn0tjI5mWiKnAehObxNB5ridQJcKUxITI8TU=;
        b=nFcrlOjfV4MNGzMihmh2fFG2GHMzk+W+ih3GuBNfZEpUNvBma3kBZprwFezjXJVD5x
         0vwtTDorRdyAHSZIM1PNM2TXkDiTbedPPhTWDifsSVqY7BfgvEL5+MwJZQSluy3QIvez
         VUx+kIFpq0gFGrfQ6jmIRU+mIuS3XGFsO9oaZlsoWeNa9Wjx9ip8mZ3jkcXol4fXJ1ck
         JDKCJf0JyV/HbaE1gOMUFVFSfzMXiGiOP5vU0TDmk+e/QLJ1BSGCjniXKg/wD+62Wmb2
         xc+WSN2G/uXZlnoi1RBKeD12WFzbJR92IuSzcu5d9XH+aBnq81zQz+ewzEGjfDsIXpov
         ywdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784301305; x=1784906105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kCSbtpTfn0tjI5mWiKnAehObxNB5ridQJcKUxITI8TU=;
        b=WYlkPh0WeKUBNB8g8Zg8iJhZ5T8Jd3YjftnxhVE8Mcr/AsuYL5djVfuC8jhyXAzo5v
         C6T65STmGHAhGhDZE5i5yTAwM3p0Mz6eWL1g9tlP6JzzM/rFW62kzMRT2CGJGT9RRHOb
         ZU8jRhm4dTnTC+1QPFDv9Ko5xulsqgov/2eGvnhaOz0pv87iTy0+5pRrVeU8YbaD6oOl
         tNzUg4WQ1qqOByUf+/mtkklJ/ld0S3VNJ7Y7kA1bU8ueWtKdhZPN5Q/cWd6fIfs/8rC3
         bms3RlhTc8YRWBy0Mh0ClaFweFUYS31Ug/Er6b7PvNAUjut5gXWAASvJQ22dMGQ3bxzo
         6NDg==
X-Forwarded-Encrypted: i=1; AHgh+Ron9kwLpdcKy43JgPFqPrNKUCPO/fZC+blYsDtf24LzZ5G/51dd5S3miZRuJsA1Q9aI6mttUox3VBAxj7CfcutI@lists.infradead.org
X-Gm-Message-State: AOJu0YxErmVnemSEFbdH79/FoZkbm997WyYsZ5nNe1qFDnlBfluJiZ4g
	hamwHl1HQZ7u9u5MhkzdRJ4TU6BoFmyIcyVZ+zopVWY+/VufKuiKrM+d
X-Gm-Gg: AfdE7cmvFVujMAENjcB1pRYMrGR4uKx4nRLm1dfxrZIvWCKaRcXTFFdpfOMkkQBAcoD
	T20K1YakXjr/HoOrnI+e0/aokyF0j1Wl4JDQcO9UAhaIBJhRUjmcR43WTSLFhC3aHQ52LYzpZwk
	GJwynAjWA8yCDvKE1xwY3YxWXh+tpyQJ4ZhiBDWqDOCRWrKQHuQ1OJGaRM2uzvOTfy3yzSRgscz
	RwWGqTiUDYYJVILw68njXM/ILidedzMMRKvvfnCb6bZ4Uoirplnopnaz7gWbq02BM0UdXaZtQhc
	6e/WhGVEHePCKOV4KBhiv0q5khIo+NcesV0+tFsWPZ88pnXirGVPfWAUceHXzevHA/W4562QGXN
	5nTW1/Tqf8GLzIadludE4f+IcWunEEb1sW2uSFM5fkc3B97JxmypBhG6RczFEABow+yRocuo7nw
	==
X-Received: by 2002:a05:6402:388c:b0:698:81d7:b822 with SMTP id 4fb4d7f45d1cf-69e652ed680mr1129854a12.22.1784301304599;
        Fri, 17 Jul 2026 08:15:04 -0700 (PDT)
Received: from luca-vm.. ([109.52.116.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbab34sm931684a12.14.2026.07.17.08.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:15:04 -0700 (PDT)
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
Subject: [PATCH 3/7] dt-bindings: watchdog: Add compatible for MediaTek mt8167
Date: Fri, 17 Jul 2026 17:11:10 +0200
Message-ID: <20260717151134.678839-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717151134.678839-1-l.scorcia@gmail.com>
References: <20260717151134.678839-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_081506_712026_21478E77 
X-CRM114-Status: GOOD (  10.15  )
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
sheet mt8167 has 15 sw resets instead of 12, and their order is different
from mt6589. Update the wdt binding to add a dedicated compatible for
mt8167.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

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
-- 
2.43.0


