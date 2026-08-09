Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC43C5AE49
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 16:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xUHnKBUv58Kqq5PRHzJhB8jsL9UTHk6ZnI77mqbe5zM=; b=yx0Im4+y6xIJtKNbsk9HdXX6JF
	lD2d/8b2DuXrKq6gFGga0GcCE1jnnf/KBClfgGLMc9oBZG1spazv1CZQB3TStbHLlTWEBdIOxCd/r
	HtVVbN+llqRK7sobn7wdx7Ab/01BJOhMWtaTN2in9US9BHfbExZRT5qjFpBqWALr0RRfDc3hKkQ/U
	rBEbbgzHob6sN2ZusQquZU6cZOiIneG8VmXisOVWjqDehpq88wZgYA3nm0nAYjwlACd60Lfsn4hHs
	2a/GVjhXAnxDlrpKIdOVD8Nm2CoA+wnY5t72bTgb+gEAFrBj/St73q8NDethav8zdn38hW9xUZg0O
	hsIoZvZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt63S-0000000ATKb-13nI;
	Sun, 09 Aug 2026 16:07:18 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt63N-0000000ATEL-3GB6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 16:07:15 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4980dc26022so10693695e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 09:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786291632; x=1786896432; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xUHnKBUv58Kqq5PRHzJhB8jsL9UTHk6ZnI77mqbe5zM=;
        b=J4T5PCsmRoH+SR5nxx/qRpIBV8js1xqXxbLjggvtjUtkh2rWz46+AeVATN3nkA/kfC
         bUTNTtVuEnFM9Im6AeidcMpNJ80nRyLWrl2FBMgBcBiiLnlPvkQEF5TD6dj1aydtp5qq
         kLuLOZ71CM3F4bRK5vdGijBoV/FQYJBODwCJRG0kvHOqGkZLOUsEMF4B02nvZGfwjvY7
         Fc2Alq6RCbnpyb1hf5so8estFeb6coHmxzOAnmuLQp1w5mZ8paHX+ev0OMz33Wd+0UHP
         yLT5vxdJdwRLHtNQrK9kFTMDAjKZRriE0TLObigv3fNLF3FUMDW6t7L51m5C1mpMAJuC
         Cv5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786291632; x=1786896432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xUHnKBUv58Kqq5PRHzJhB8jsL9UTHk6ZnI77mqbe5zM=;
        b=Vnm2oOeAET3ngqheQlDF8T7jqJPVAyd2mCVnyaaq1eBNid9OUTIoCxV3ePBO7Rx2tX
         XiuTmWy1mQTsV3wFzpavsuZN+X7pizRg5hbeYgwPXz4OE3RFdwyq4OclN95wqAHeM58S
         GmWcym+6m9bSBUDEfE4Ajmomb5vMx9SnVgCQ0klJ6DtreAzQBYILCYDBSmPprZLtl43z
         eadjIcIfAzH4CUkZLYL8oZCiG4XbwC6nQHbmMoLWbBzvJXoCj7Uzzi8x845zsH8bpA9X
         hD4yXWYv/Mf3ifrfP8qH1gDoGyL61k30rp/zJdH0Fn5Dl6+7pKMrnyYaKCT1t8LBzjrW
         qpSw==
X-Forwarded-Encrypted: i=1; AHgh+RqaWNViPUiuhMb319RIn8Xxg/a5WExUv3q6xzQSmSv176V04iIr+bpM8IADh1YarhhTzEzDLA1z5mpKOOxTB+m1@lists.infradead.org
X-Gm-Message-State: AOJu0YxxO6/GTjs5nireC2O6yurfzC07J1inWNVDHIdDXZh8oAMYhYV2
	5NY8AGkEW+MkFCzLEy/n4nLAd66BCpyTcgc6fNgTXU0hg9a8oS9/HQgL
X-Gm-Gg: AR+sD10f5xJmwCi+NLq0OSMA3rvVhpdPRJkGdrqsJVwA1xDFsHCvkVR9bQe/9eowvye
	5Ku28aQsEI6VfgNiMkldD/4QhW8lpIDhlY/E/k6Isgsfp12+h4cJoIcf8Oau5gELi3p0OfeRv5f
	1htQ3tEN2DePlENGMjGPc3bASzAUQANHoWAE8yGpnKG0cdVcRn9Qhlqr9hmLMfH4oDM7YEnPrrh
	US0XvYxxVHoXppY2nx3LF+Yu+QMsokTMZNkePL6sfn72vCrQ7M911bj8E89+PQzAgSLlmE2/iNJ
	vI8CvRmNhDtOSetXEECUWktiBzo4MV6E6AeJLTYPVJat2Vg/M9PXe1MdsL4aUt2V0KWEhqe3sn6
	UdWAFTyyVJ7GqjDik4xr9zGhhHgb03qvp6RnLpn92zH5duFvZXDt6NiDSO3h0YEu/wvgpH9ncxd
	FfoFRQR6vSc7al1I9DWBM39vw7vvVz3cWTWYRKf908IxsSuH7cx45hSA==
X-Received: by 2002:a05:600c:1c21:b0:493:e460:1f6 with SMTP id 5b1f17b1804b1-4994e6fe377mr488271375e9.0.1786291632103;
        Sun, 09 Aug 2026 09:07:12 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm209832495e9.4.2026.08.09.09.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 09:07:11 -0700 (PDT)
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
Subject: [PATCH v3 4/8] dt-bindings: watchdog: Add compatible for MediaTek mt8167
Date: Sun,  9 Aug 2026 18:03:28 +0200
Message-ID: <20260809160643.33991-5-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809160643.33991-1-l.scorcia@gmail.com>
References: <20260809160643.33991-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_090713_841748_DFAFE2DD 
X-CRM114-Status: GOOD (  12.33  )
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
sheet mt8167 has 15 sw resets instead of 12, and the systems to which
each reset bit corresponds are different from mt6589, so the reset bit
constants are different too.

If the number of resets varies between SoCs, the watchdog driver becomes
incompatible. Update the wdt binding to add a dedicated compatible for
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


