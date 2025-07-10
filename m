Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D89FAC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 18:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SrX0jpsTLwGSB9oK+ETN0s3AYD2g6Vce7gGJ6DvgxDU=; b=h7wDHZZWk5CKDmzWyNZgrZEWSf
	98ZoeXQIIdUnPsXnj/BbXEoJ6Dvi2GkvWJWt5wSuItKHNItNwHv0LyayQJQv7haDR0tZcbUampvSJ
	O2K9Ua7bul6L/CRo1J+j7RqlN+W+bCjevSt2GJ+AHUB0nddOnhDFUNh35KK0ZlhwuC6IuZRYJ2d0c
	nJatluvG7XSudzjMl2OtipLlNk8zqNxxhIK2ugIk4ke/4t7c+QwFqGxTNd2LlS9Ln5LMxiDrjOMYx
	fvEtsiviuswd0ppkdh8GpGUfBlDH1DxK5kbIJv1ONmdDUEVYgtajvBmuJzUG6u4mvfMZRGs2OnZL1
	J6oocKWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZwHw-0000000Cjr5-44Po;
	Thu, 10 Jul 2025 18:46:32 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZu84-0000000CQuC-3gCp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 16:28:14 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so13151485e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 09:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752164891; x=1752769691; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SrX0jpsTLwGSB9oK+ETN0s3AYD2g6Vce7gGJ6DvgxDU=;
        b=lm0KwEeFBJN0fHW+IDKECnh1mGIjLlx0P9i5L8bRoKXKlsQtMQ6sTWcaXj/P/9dJCi
         TsvBXYa+IWJ/mFsrhJj1nJgvksJuzNRAZs+eo10KBCNScROkkj4YlEZlcHdFOFX9hhhW
         9QCC9Uj8fZmSt3GRYhLOR++UKipjeUBTayoIxOyUbIlxex737rMcbC0zUpD9D03q3YFN
         cE2lKH3r999xy0nkq5H9dm6+lkewwrPOuRljk+o4ByfOO5mQeiua90j7sX0vh8jAai2g
         gtTCnkV04rtQ4JRxrgaRzurSzeQJc9yFb0ufOQpkX/93gLSXcv+5jRthstRotMQOHJlZ
         v/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752164891; x=1752769691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SrX0jpsTLwGSB9oK+ETN0s3AYD2g6Vce7gGJ6DvgxDU=;
        b=dd5xY8HdDD9dHkY5mN5kNiiIAl7ZjkvPxuJ/g5594jrFkZZkcoGfrmad2aw0D9Xuvi
         2JHSYHG0sFx0Z7hNPHDLce1s/hYoe1bapmD6jxurAQxFwwZjMf+f62YO5NJpiFmfSpsh
         VW7EjZI5Ifwt/SOxt1ugX8IruQcGYPY0KjcDQQnatYFv+PX7s4v6jQzseOO/ns9TXGXc
         8SdIOQx9/X95pPEqRDG3fqQ0VRRbg02MVXHq+D/z9WpM6p7Sbp1uk+eo+G1fbfOraoD7
         LHAB1tOBayC4UW5dmTw04unDWVgqrCUr1BWF7/M0mJ38Red7pI/vTUpGgLctCzVKAG2i
         cHMA==
X-Forwarded-Encrypted: i=1; AJvYcCUmiuJ3zyesT8Nh2au2BC6F0xDiP4Xfro+EgAFwZco3F92DtmHqsWSPe4lm7fmgND0fhCn5vApazwwbx2uaN7Uz@lists.infradead.org
X-Gm-Message-State: AOJu0YzyLBPlVD1OJkzdacfTMGo0USzeWpL+ZLdUyBgOgTEFHyXJrwLz
	B4ZL/0VOt1gOppSvL4Gk4OB9tL14U0ELkVNEZXn3QU3JRTuhcURDcVdV
X-Gm-Gg: ASbGncsBetRzb9Ubhf/JNAieCCWwVZufwMJq2GNXlEgVfFnAcdv7bvba8Am0IXlM+qx
	PlXbe21KYXFPcVFgWaayCPXkXqdwRfYpJtTOSErGptYpo6xI5XKosDnfhEhXq+1YM2CQ9pi2skG
	zyKJtMghW2zYzS6UJWLKLRWadWPqfpooSfiSFS0Vk+CTb+Ffh2AlMEJhGA1oqhX9jpYNVLZn3yR
	bcDjBxkw9Yl3QbzXA9pkUYWrFmR/ed5oJsjA7t8mRToohkNxVE1kpzF8CA11mKN+W4Vxkc4ROCX
	ehBB3aZkeCp8dNsGvQRFpm4TEs56N/tlQ3KcVKBnmyxSn4mlj/6l20w96H6FEJc4Wl1ep5YSV2t
	I3G6WqslVoyvcBbgSGGUwsRePLdmaGujmEqCrUpPGyPBe0g==
X-Google-Smtp-Source: AGHT+IHfYUJWjLQik9Y+XlQa66TouPxnoB5rs7T/jhXvw5uiN8G0FF4CZRMj9bSEyBlCS/JHOIjkRg==
X-Received: by 2002:a05:600c:4683:b0:43c:ee3f:2c3 with SMTP id 5b1f17b1804b1-454dd1e7e72mr32290775e9.7.1752164890975;
        Thu, 10 Jul 2025 09:28:10 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-70-53-177.cust.vodafonedsl.it. [93.70.53.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d50df125sm60871005e9.19.2025.07.10.09.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:28:10 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/3] dt-bindings: arm: ti: Add bindings for Variscite VAR-SOM-AM62P
Date: Thu, 10 Jul 2025 18:27:26 +0200
Message-ID: <20250710162737.49679-2-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250710162737.49679-1-stefano.radaelli21@gmail.com>
References: <20250710162737.49679-1-stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_092812_947942_E71A8A2E 
X-CRM114-Status: UNSURE (   8.98  )
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

Add devicetree bindings for Variscite VAR-SOM-AM62P System on Module
and its carrier boards.

Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
---
v3:
 - Change compatible string to match existing mainline format
v2:
 - Add symphony carrier board compatible

 Documentation/devicetree/bindings/arm/ti/k3.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index bf6003d8fb76..d56046e439e9 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -100,6 +100,12 @@ properties:
           - const: toradex,verdin-am62p          # Verdin AM62P Module
           - const: ti,am62p5
 
+      - description: K3 AM62P5 SoC Variscite SOM and Carrier Boards
+        items:
+          - const: variscite,var-som-am62p-symphony
+          - const: variscite,var-som-am62p
+          - const: ti,am62p5
+
       - description: K3 AM642 SoC
         items:
           - enum:
-- 
2.43.0


