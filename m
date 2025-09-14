Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DC6CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 15:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wyg3bozHzgmdRL161LYvLfYk983lEGFQ9huQuS5QQKo=; b=xSlrPvaKPS4lr6bmIvTXww1i5h
	+IfnBttA7Zjc90qHBA5ImgMRvt9CYji8lhKqhPCgj6dRN0C2Bgw8m6brVEYtf9KnTpY0NLTNznn4b
	QoYIZZ4fL8jM1ayS17UP930DNoz1aXOXVH0sQpwvgt1uAz0tuza3TOnVtNTk6SUzVxGwni4pMJDMX
	DySx0TMz/i/blT7yNybyzgRVmt2mjvOfiPngDI6k5miu0hVyjRQuaFdlXKNnzanOb6zNqjwgklhjZ
	5w1hYi2gk6VJIzWXHsrF1ON35xJZTwYW1X8fgm+io0yuMP58Rk0fYYWw3fauBz1QGNli0MvfZskGx
	ymLKVBnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxoGX-00000001d1F-1yXu;
	Sun, 14 Sep 2025 15:03:45 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxoGR-00000001cxr-0usi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 15:03:40 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45dd505a1dfso27730515e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 08:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757862217; x=1758467017; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wyg3bozHzgmdRL161LYvLfYk983lEGFQ9huQuS5QQKo=;
        b=Io4Z9E87XLVvt/pE0GDRnIxfz6cA1nI26SSr6R8B27ZH+Bsn1LLQTbKNW7siM7/Kj5
         Lr5KtzW+KBZPFmI7d1Wi1AN8yEysQgeBoMzk9K+f84UVkzfFxy8aoJY+Dw4HBwaKEp+E
         NuvRvTeNW3Z0Tx+k2lPEFhjOk2jlgnA7yqLZHS7XtXveW6TLdynCJ9+FTZAAJPC1X5cm
         N++nzUD+lwz496lQF25XNI1xz0jaMGfhT4CUUdSVM3xPAjM1AmudvaFQh3GdMvucjJyP
         gbYua0JqVU4Zec6wzzkOfIOvn3xYkkp9pHtNO/oTYTOSeHLWr369eLyYvp/NwgIyJqKn
         mSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757862217; x=1758467017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wyg3bozHzgmdRL161LYvLfYk983lEGFQ9huQuS5QQKo=;
        b=jHwiHLng8E/ABXHntpbvj4i5B1Ht7qi0CNI4rs3Y2rRCUbJhg5mwIhf2FEG5Ynai8C
         SngUgUrc6VPcTyTakGRrgmhEjmYccbtt7zuVLXxXIE8c4vtHeRCLOwziAvtpKsiHlSvw
         Vv73502niZokuAEkoF/PsA6Inyp5oV7OHBVO+kQjhLsDlVVUVNGNyJcszdf2hioGo719
         scS3mgAAZsAu0Wfb/GiIWuDP0Uey4d8Dh2YvBmLp1sNveo4uHOx6LHHMAdXJkYh8UUbt
         mGd/ycet7u+FoD6oS7+dq2xSZ4owG63iclL7P2XwYCad9KkxaiQuFt7QyAthK9zvW+Eq
         wj+w==
X-Forwarded-Encrypted: i=1; AJvYcCXBqBZqCXC2rZtLvxL1l+ZZlMR9RHHZ5gEhreMOVFF4GJbYsFWhnrwZEuKDNf0t8yV8kKle2vPX1Qqd82b70zYm@lists.infradead.org
X-Gm-Message-State: AOJu0YwquX8izuFQd04IACGyzGWZZrrZtAVqIAc8fvGdMHNfNVXau91S
	AKSGyazRs4j9hbmfFgalJakVTvB7jxguPSOQgsAqre44eyMg3Zliyipq
X-Gm-Gg: ASbGncvANUsNsVl0QNaTG0rb35daeGM25DUWYYINaGjsXcA2MaK8n6AMyak0FnuABxS
	ytLvBzE1eAfAZXEDp+STFbNbCelbsav+7GhaDRs53mRrRRHoghLGO8UWJIWpUwjY7NPrkkOTiRS
	uouzqGHq7VtQRYYYlDJ4FEFtFtn4sSVwl6EYe+RI+70zlckwm38wLc+PqSinxM8DnQ7xGr4Fe9o
	s+gbwH341mXzqk/sB5rVp5YZZsDqmHbAPTyo64gNEO5vWxWpSvjh2mV5IL+L9bPhOPkNmaHb4Kk
	dmKiMJBDFFQXPd38A0Oge+LaVee88OEYBtMmeaJcqWT/W4blZrcfiLnbadmDrCEp73q86Hq1BA9
	zCXFEXiR+ONggGBoYrDTtMlkhPDRC2HhfE7REQhNGcNMvYA9BU0k7o8Kd0fhiw9u6udrl5RcQEg
	==
X-Google-Smtp-Source: AGHT+IE3h45OZpMAY6SiSVCXJQptcZFERabg2hn7u3d3tNKA8ghZYuzRtUbXRk0u5MeYisU4RNY5bA==
X-Received: by 2002:a05:600c:1c0b:b0:45c:4470:271c with SMTP id 5b1f17b1804b1-45f212f9888mr85615375e9.18.1757862217348;
        Sun, 14 Sep 2025 08:03:37 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f2acbeee0sm32780385e9.0.2025.09.14.08.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 08:03:36 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] dt-bindings: arm: samsung: document herolte board binding
Date: Sun, 14 Sep 2025 18:03:19 +0300
Message-ID: <20250914150321.2632019-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914150321.2632019-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914150321.2632019-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_080339_261265_BE1E960A 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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

Add binding for the Samsung Galaxy S7 (SM-G930F) board, codenamed
herolte, which is based on the Samsung exynos8890 SoC.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 26fe899ba..cb921c741 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -238,6 +238,12 @@ properties:
               - winlink,e850-96                 # WinLink E850-96
           - const: samsung,exynos850
 
+      - description: Exynos8890 based boards
+        items:
+          - enum:
+              - samsung,herolte                 # Samsung Galaxy S7 (SM-G930F)
+          - const: samsung,exynos8890
+
       - description: Exynos8895 based boards
         items:
           - enum:
-- 
2.43.0


