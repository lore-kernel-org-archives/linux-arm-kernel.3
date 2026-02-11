Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82EF8E9E2E5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 11:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q+FnqDj3qu2ecfnplRKSOUvppFc1PPPDfNJmD9cSsF8=; b=wA7ZDXvJqniWUm6vSiX3fxYyE7
	nhgx39bCW5aCIjMdNt8hFu8qLH6HTahSD0waJ3IlAgbymrBLfepWeFCanDP5mTNm9/pjKA/1BLCDY
	I1sztOl4Ah30Z2sKH8U8EFJtOb9gpyx10yy22Kji0qyD04Q6FqZ9osxbp5reoUF5UO9LriKXrXkXQ
	gZWwWxapMYjUEytkV0jRX0hAlr/DPmQbIRh5ozTh1RRAhcZhipAu35zgIBH809zH4SgMsYa2Qaa5A
	2k9vqUS9Q6iYXjkPwosDaKMv/Y+by0kgZ+wwgBKBmw9C0ZtGvALaDDQSgxjdGvtgfW0RN/rlyzjzM
	kyjCEn0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq831-00000000YWT-3oCE;
	Wed, 11 Feb 2026 11:06:19 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq82z-00000000YSp-2i4F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 11:06:18 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-78fc4425b6bso18292007b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 03:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770807976; x=1771412776; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+FnqDj3qu2ecfnplRKSOUvppFc1PPPDfNJmD9cSsF8=;
        b=fJwXFh7iAjz4ROv2odIlqWKYZ5ifYqDRDwT3PY6QCUDUzf8QyYTCJbMwaRTMGjJW0f
         TJbzmWT7n1v2dvKszVhAwpa+aKr9GPD8Rvqe0t8AH2B5VyFxjOmtfrZ5XFdCeflTcRdA
         PLD4NU2SiS5lls5kkxdEDNm824FaAE4eBBdxAOZa6sDXTzfAOZrVHHSuQjtgZJT7hmtd
         ysmHbtSb7GPRiD/FdFB3FVx9i6VPvmNQF3nuoeSSq02tooyk2Kp5/pfxqslvIstzh0Ak
         bcNdvcSbGIiCSljHotnjmyCpO71pYmgE0tI89/rGt0NoSuTOxe0bDBUNBFU2kkeTtjHa
         zzWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770807976; x=1771412776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q+FnqDj3qu2ecfnplRKSOUvppFc1PPPDfNJmD9cSsF8=;
        b=T/np4/EtecnyfEyCPjY5Ksp1dSgIwuX4MoVA+NcT7DvHmITNUo3ZLFewOeS4LPnuL4
         KqAWFQlNO2liZq6Xh5yYJFCAuAiMjDmGfBfNTLWQ9v5cE4Q1faGTGPjpWPTcBcJwquEV
         DHrF5XlU8k/WXuSdYb1HSbQIJUg0nbsIktKztTimyPmI8rTJMZlc24pHmVasn3PEx5fj
         0DRInuSNHbXLfSY0ctGhZsrSrAve4skTp1mFwLQgv8ecRtLIORJz3I3s+u8cyEzIK9lh
         QWfATV7UyTeYJHUNB9UcI8IzHjs+pj0jVPWKJkcVjrlVJwL+UKcqDtUXA9p1bn+vOFNn
         INNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRFUWuQfpRyjIkq9BofrRiJR4MChFnjUUW7kb1wCRR4Ml2ozgn41bLFhPC9o7p/RDm5A18OzLI0wZQPvR9ON4K@lists.infradead.org
X-Gm-Message-State: AOJu0YwuHJK22JweDnJWSL+Iex+w3gNTz6uzAiDD6wOf8vQi0uh57R5y
	CWpWj0GIBy6LgrG/FYJ9WGn3vfmsBQTB9nfWMoDdRjiNblsVu3jJXHmt
X-Gm-Gg: AZuq6aL9l2QyP91CelZNf8jP/JT9R64+zFaiGXEYOiYuRfXoOOTDcjnSJ0tkPFR/9fN
	/rVnv9tX9VxAikKLdnwQaAzFFbFzffTMqNq/vkDjsf9H0sgOTyJ/oGLXimx8PWpBaBP89zyJjw9
	AQZj4YHTBxKGyFmIrwC2JKTn1KlrtLtKDfg5BjVbqw+Hb0MO1X393ponwuBPCzRoQ7mypst1r93
	QXFcs34q3O28Z1S2I+XvY/mRAy+v5Jy7wPnM/L+Xl5xPBbvKwaLClqeGmRc/W+LPs2xyU7OI1wi
	7FMjYoDzyeRqp9KKicOXaG5/geNO7PslbJhyR0Ht4TA8F3jgEKY8Zy1EKDqw+1a9v/DBvG0W7Gj
	PGu0K2Y+GnCD3mlew6pU/VU7w5TQLv1ErEZsitfPEbSucQOyGUqOF1WmggV/y433yamq9RHA5UR
	TVCbEuEFSR4468QZrqs11pzWmfKwZ5L+Pj/vI=
X-Received: by 2002:a05:690e:1517:b0:64a:f160:2354 with SMTP id 956f58d0204a3-64af1602cb8mr3992099d50.79.1770807976463;
        Wed, 11 Feb 2026 03:06:16 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:4ffb:e36d:8763:a188:5dcb])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64afc87ff20sm1533719d50.10.2026.02.11.03.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 03:06:16 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: jonas@kwiboo.se,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH v4 3/4] dt-bindings: arm: rockchip: Add Omega4 Evaluation board
Date: Wed, 11 Feb 2026 08:05:49 -0300
Message-Id: <20260211110550.580474-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260211110550.580474-1-festevam@gmail.com>
References: <20260211110550.580474-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_030617_717916_22FD2877 
X-CRM114-Status: UNSURE (   9.24  )
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

From: Fabio Estevam <festevam@nabladev.com>

The Onion Omega4 Evaluation Board is based on the Omega4 SoM.

Document its compatibles.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
Changes since v3:
- Split into SoM and base board.

 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index d496421dbd87..8e8f9ded2484 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -802,6 +802,12 @@ properties:
           - const: netxeon,r89
           - const: rockchip,rk3288
 
+      - description: Onion Omega4 Evaluation board
+        items:
+          - const: onion,rv1103b-omega4-evb
+          - const: onion,rv1103b-omega4
+          - const: rockchip,rv1103b
+
       - description: OPEN AI LAB EAIDK-610
         items:
           - const: openailab,eaidk-610
-- 
2.34.1


