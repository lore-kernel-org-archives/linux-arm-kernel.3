Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABA9C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 00:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iiDbkL0pY+ZNJZzLhcl7udEXNlCZTVIqdrO+Mdj7eDM=; b=gPvvhlKzAHjyMwMX/8VLmf2DwK
	lKIDzIBR3udAGhEm6rlpjHkSYcCX44LIhznQPmeEssK/yn4J9v7Hq5jQj1mu22XWA4TFiwMeIaMF9
	67JIj9ony4rOTuCpbx5y1TirIhRscvrKCgZ2kN5hq5iFsHAyj9t/Ywxx1FEg7aWVMxgewujYbjouh
	G4h5L6574DMr2Zo+C/YXtTMfOQoJ/mvq93P5ub9CCVOXx4vh6wFiIfj4eGBBL6q9PCp1aYIpY0xx2
	veY2iMRAKtffvigys7ak+QQhPJjodnYnD1lTfCZRB+nmMLg8QBesFXdQ7Sr3cXgo69Uh3oJtVKnf7
	Q7hEjUuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWOrl-00000003jiF-10Q5;
	Tue, 01 Jul 2025 00:28:53 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWOnB-00000003jQq-198n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 00:24:10 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-60c5b8ee2d9so11175247a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 17:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751329448; x=1751934248; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iiDbkL0pY+ZNJZzLhcl7udEXNlCZTVIqdrO+Mdj7eDM=;
        b=JPSg89Uh4RbS9jOxqn7hcIvSstV1yKXCd41xAyshyMqKM6wWG9YwwQh25BXUkLhOOU
         UDttMyO1miyKjeORKw1VlZmvdjAHk8/eRNb7k/gDfPpM39FsPqIdeLBQ0FyY5XTABJuu
         L/c/NLQeeOU1eWHjV38ElEfu4OMaAhqBDD3oADRU3HDDAT3Y7qEhPHQHf5+gvKLD801C
         WAjnOfTUAk5lJXG3uMJIW1d1yx1jG65NRjvp3VVTDD1eOfNasndrXbWEG0YsSa83xFu3
         k+hUwk9kzaGp00qye6EiHN6/KdcsNVLIh1s/pIf+Nd/zNFD1aKKMcY0Y8Iod68MvSO1v
         OlPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751329448; x=1751934248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iiDbkL0pY+ZNJZzLhcl7udEXNlCZTVIqdrO+Mdj7eDM=;
        b=OdBhwuo6rc7IobyJwhtYZUNbghblqnQOlfjDFPJqtJejHo3CRcJht8YgsA/K2VOYMl
         L11Ix9kEFKEe80ykE/+dL8IeivH1Esjh4MAZnfQOiCfaL1h4gxOzrtzUQFmgpepcbQyi
         F4TA6GJ3JGIzlc+soxuNqMM6FqAYDfiiX24Zv+FmfW2/Fc+hGKqSxK9kzV3ZlUeOmQzH
         U9UyAGFRb5iLM0u3u1wDDhj/2vA1rfJ3LE1FsV/MNMuJXmly2CAREIAOZfL1xjuE4lEB
         JPeooAkDGUNNMEHZplaT/W+k6LNYah7L46iEA4BbX1djMXMqPjyR+DvrSjC4I/oZGdnv
         /rZA==
X-Forwarded-Encrypted: i=1; AJvYcCWnN7aChX1/JydMsGktcaPMA9Dy2CylW3DTjxZIAL+851+vQshdWJi+O7te25P4Pez6SVPhdrrJ8B0Bww++jvh9@lists.infradead.org
X-Gm-Message-State: AOJu0YyR3+Tf5JyREo2NmYsM0BXe37XgjdMpSXPvQYuCmXuHzxejeC8t
	l3fkTP1YgkpbHa/dNUUjPkZII+El5SSXw40URUYXiJApQtb6j3m1fMjLrNtiiQ==
X-Gm-Gg: ASbGncu3OgCF1bQoozsPkx2bKW5c1rr5mRFWkYU5/wAp5j+9Tzz93ihWV7dHbgbaEj2
	VMCdOpYe1aN0YUfOqcnX74jaZ84OlqpDGBAXbpgTzNW1fHtfvKgii6gmqfvIhiPFV9s8xRkbzq3
	QJzFsEJ13ANl2KvOk0TEGrlBNH2YZqBEG95gQowxRUbHXZm5QX5iQJ7QlSlenWkR09TlegJn/PV
	gxaiLHBrQjudKdhMGENOhNgDcJmEVyIWY/yrum9kDpgswL/aWYJr+xEgjPxGp86MtKQUjUT+Ns1
	Odh+1K6qMU+7HRbenhBGFEV6Hv31g2N8OHGwVpz04c4Oxf6evGz+FNa3EAuPJYOiA+WUaR04uXw
	Ujl1tUYGZzqeUUAkKYBy2KSg=
X-Google-Smtp-Source: AGHT+IHYha9ZYRUR7w04GSYrL78W1NgyppshTXLOckZR4pG6N/j6QycRpKcE2v1wKnchhMgp2lDmOA==
X-Received: by 2002:a50:c04c:0:b0:608:f973:1bd8 with SMTP id 4fb4d7f45d1cf-60c88e9c1d5mr10426160a12.34.1751329447686;
        Mon, 30 Jun 2025 17:24:07 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60e26b7ac4esm979532a12.7.2025.06.30.17.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 17:24:06 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: arm: fsl: add i.MX8ULP EVK9 board
Date: Mon, 30 Jun 2025 20:22:38 -0400
Message-Id: <20250701002239.972090-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701002239.972090-1-laurentiumihalcea111@gmail.com>
References: <20250701002239.972090-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_172409_376732_58EE1B0F 
X-CRM114-Status: UNSURE (   9.48  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DT compatible string for the i.MX8ULP EVK9 board.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index b23bc1e48866..683efaa3b4a1 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1372,6 +1372,7 @@ properties:
       - description: i.MX8ULP based Boards
         items:
           - enum:
+              - fsl,imx8ulp-9x9-evk       # i.MX8ULP EVK9 Board
               - fsl,imx8ulp-evk           # i.MX8ULP EVK Board
           - const: fsl,imx8ulp
 
-- 
2.34.1


