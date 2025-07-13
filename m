Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6CDC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 13:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o7jORbIueyPIb6P/w2OASxcewnEp80SmMswdiqTs/zA=; b=ItsVyNxp661m6Ydo9ZmU95gL9n
	D0dx7Z3DxyT+WUcAGvvw4ZkC38hpDjifSCh6YqwPY0nYwU7xk/w3Z5qAzYDD8Ys40PblVPpZMRSbn
	46wuQNzTC0ndQkvP9pE75G+yMSW7IncEXCS/SVAqKZo1Kyi7MhMlybDxyPiF2PS09imz6oA5a+820
	3ycQKU+VeLvQa1iXrPMxncR9D/qzdAeTk43EiD9gz+HnaVeOqwnLoogcGPDDXVvKy6QkfvOIPg0LQ
	sMVFRinNbO5C9sengt9BToa6bhN7wNpZZHJ5t2SS30LQrKaGg9QxOI8siBsnRWK1Aq0CT/j0NzBSK
	lzoQuhJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uawpQ-00000000CB7-3RU8;
	Sun, 13 Jul 2025 13:33:16 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uawkf-00000000Bnx-20jG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 13:28:22 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4561a4a8bf2so1429885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 06:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752413300; x=1753018100; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o7jORbIueyPIb6P/w2OASxcewnEp80SmMswdiqTs/zA=;
        b=kIVOGlTiXcuBNYkuK1deneQMRkvI/gvtQGH2e242HyA4eRYIfiXMuFkFDASZ/TnXAB
         A8LJKEOHLhZ0GLcR3mG9oRgaH+mh91Wyq0emFu9saiMy49Ky2BfRmU4c66ZllT2a3g1G
         9gT7JIA3eZlLVvci5ZKeI8n+qSK9qXh+v8r82qEyk//9SYy77731yOAGpMjgJJ49eSNK
         x8pr/m6nf0InC3Y9nfWgFDaqJ7Pi5Q/Txf3RLv0BwzRSm4/EKbh1/KsNidEKU/nadYgE
         0ubuA2j6JLNCv9cQbBE+Y9FnMgbZm1bNwEZu7Fz/9Oh+b62nMrCC0mM4s57C1PYaXXV9
         3dvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752413300; x=1753018100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o7jORbIueyPIb6P/w2OASxcewnEp80SmMswdiqTs/zA=;
        b=gbghPBgE0j52tkTLynRtqt9ZaxzKTOLYqXQqPrOc4anvueuqSdn/r67tTDPP466pxd
         O37e2yzNcDZf7v9PlHXgb05VAOMggAnmpkPrN+HnjHqg1ZZ3BRPApjFSsgjERnMZJUX8
         lkYupQqmLbCWghSO+5OQ0WwE76bLRbUCS/0BLi22PelBinDPZFLRy+sIPVH3FyfeM9Rl
         MwolKgx6Hs0wdwBGLWdbWHvtptGofzgYurgAwHt8U/BiLH6y8opLcOh7AnmwULy+P61J
         0SiP9XlNJ2cYGyu4dOzYewzuZ05Kdu3+yEhuMTh2oicZ2pH0arcQ0jjr9crOL+g4IVoV
         CQpA==
X-Forwarded-Encrypted: i=1; AJvYcCUsD73MlqJE3E1B6r3U1qu4cdciULDkd37txqDe3y9QdDB5gYr0lps/FS79DGM+VA9+IO7ttb1xBqs73bXYFzUP@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz4/2344HLnjMViI6sPwYJSk9IQmZCTnnGzqA1aoD1THbq6tz4
	9v5XkW1k5GuVtFEX5djmOZWBFmn/u6MagwcVt2KegLIMDqRI4syoE6QE52rSiA==
X-Gm-Gg: ASbGncvgQlDtR4yyKUn6/OFmydrBE0eJa9CUgenQIe11HbV8l/qrDaK+VCA+oOzMFNe
	H8N+6yuVpeBxTcd0E4E+472/djWAPtyu64nq7bx+q9apNzX2FsePqIXDgsZ+DVX6JqRjdC8bi7n
	/oitNtZKbmViR6jXNq5L0QLe8RfELtKzaMQtQpADzEwl3iZ4uSp70B3wTH8CfKs5TycpCYrvdkI
	T8jq093jiHDaHk+UNDh2qNa+LC2LgHyuXAH59MnEt/OxVm/I+V0KMg2r/uQ6FBnIKMGkPzkf6YL
	HRJibUKvTwgLb2G0wcxv+vfXnHbj29mh3XYUS9ZEzI+GZkFcEWNT9yJ4Xf5CnkuXtJRlsf8J1uQ
	UDjAyVRjHGr72GFdz7gtAvg==
X-Google-Smtp-Source: AGHT+IG/isp/+F+EMDVBOgXHpFpGEyNOHJ4lSuJEljVjZygZXcw4Si/+IZOv9cUpilTVsp23fcjb5w==
X-Received: by 2002:a05:6000:1ac8:b0:3a5:21c8:af31 with SMTP id ffacd0b85a97d-3b5f2dc2178mr7549692f8f.16.1752413299626;
        Sun, 13 Jul 2025 06:28:19 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8dc91e3sm9675321f8f.43.2025.07.13.06.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 06:28:19 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Sun, 13 Jul 2025 15:27:28 +0200
Subject: [PATCH 1/3] dt-bindings: arm: sti: drop B2120 board support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-sti-rework-v1-1-6716a09e538d@gmail.com>
References: <20250713-sti-rework-v1-0-6716a09e538d@gmail.com>
In-Reply-To: <20250713-sti-rework-v1-0-6716a09e538d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=908; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=RK0JVUrTFe6QafY5lJlDHH3DxsifRIzU9YPxeSRbzQ0=;
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBoc7RxJv58Vyo6mm9ZDyB8hIwNrQrJV1bkcFgWU
 0Dbln56RKGJAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaHO0cQAKCRDnIYpo1BLC
 teUFEACOFmkruLOIg/Y7ihznC/BTFhzPpjSv6zwPE0K2BUQQ5AzUEQvCvvVNC1k/uc/XBTwx2g5
 b5L6ufz32SQYF4hWzi8TknveSmfjOatXaSKgtOPMM/A8YjfrmfbC2ILL2pNOLK6cHn+C2zkv1zZ
 SNhPNicebQW3C/Tj0rnvd8diYzPgUSFvzEVagypx3GbnhSWvC64y6F/QD8YbNj4xXC5sZ9Vy8Gz
 AGR1nV6feOlsGW6lfIIr4Kdao/qZfESNaQkf8spfCbx7jNSzVhuQbRQLcz/6orxb49QPycA6vFz
 ZpQ7jxnQ3SlpbI1o944eXsMefGDKoC/2Owg2HRMIw8sSg3LHNzO6drKKYVTiHC8Ui11KIAX82P8
 9aHdz0OeHblpB611X5Q5zoIRqNW9lK++5xJ93pXWd78jMH9wAKfkxG7L8LQlzhgEgwi6y6n7YaJ
 H8LSYyPxbRfNt1tgjWLSSZR6azuYuIu6zzmLpgpI7i23Hq6vHMxFau7+pCsmdKvM9EYKX8wfHw6
 kSezz05dCGeHg87zFsLoqz/rLjj4Bc1HTIv8jV5Hk3xCDxwBU5+pxKxYsy6oxcs9gSuVyqR0S7k
 9Jj9aHd+3zDCSxqM8scNvXu8r/Wnropgqv73POVDnOq7hDhRRbzCJbIixuTDSIbPi4KSqfl9GXI
 NI+GKecY89gf/dg==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_062821_521944_5EAF6636 
X-CRM114-Status: UNSURE (   9.87  )
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

B2120 boards are internal boards which never were commercialised.

Remove them from bindings.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 Documentation/devicetree/bindings/arm/sti.yaml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/sti.yaml b/Documentation/devicetree/bindings/arm/sti.yaml
index 842def3e3f2bce470763d3665c7603b9058b1e4e..177358895fe1c9f80f8c825142cf015d04286ce8 100644
--- a/Documentation/devicetree/bindings/arm/sti.yaml
+++ b/Documentation/devicetree/bindings/arm/sti.yaml
@@ -14,12 +14,8 @@ properties:
     const: '/'
   compatible:
     oneOf:
-      - items:
-          - const: st,stih407-b2120
-          - const: st,stih407
       - items:
           - enum:
-              - st,stih410-b2120
               - st,stih410-b2260
           - const: st,stih410
       - items:

-- 
2.50.1


