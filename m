Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603ECC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 06:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N3j/1wK63BWsGUKsDNrpQgGtCBr1VsAlvbOLyb+XR7k=; b=yWPb9E0ipBo7M5SqT8qvwDKGr8
	J0DxQatdNGvQtNxOa3yE5iwfOFaDcJIUawO9WU59HOWxXf/RB07s9vGvk6OAmidpjfk4McftIkKyj
	Q7GNLbGHb7Oyhe7MKXIt5wDaYtEk5sYam89U49gTZPShlvHVcGqSRaO4EqYid86umGk+PFysESMpy
	T17SG7JXz9UhCowIp1gPnLHfiYwcQVROl/M1iAcMIwha2xFScmYyYb3SKolQgVCB/yMDjVOcBk0m6
	/1oV5xJCeCxualEfiVWDd24KDmWVlgA/R9OShBqhCIG3NQ2cJ9C7T2jO1Wh7zp+DnB+HKHHr5OnCE
	ol9F+caw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ25P-00000004TXM-16VL;
	Tue, 08 Jul 2025 06:45:51 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ20p-00000004ShY-31GT;
	Tue, 08 Jul 2025 06:41:09 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3121aed2435so3872731a91.2;
        Mon, 07 Jul 2025 23:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751956867; x=1752561667; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3j/1wK63BWsGUKsDNrpQgGtCBr1VsAlvbOLyb+XR7k=;
        b=e5Euh1/+NO4wO3hpntYJ8DWt476awEml/78BkkGZoiRmhZA4VZo2ZdQZfVS22TLKMg
         SudAuR4nFsZohLdwllvtmeQUA+BCqGIdvNQsgAQi9YVjvMHFwSYgBQcXys1XPumKwbYs
         g3Utr8rnyF3+xzynlxvrFaLTI4M9FvVbRiR0zfzehc3Z9Pl3eGsFEIUMzhZzueoQW6V+
         qHlvhBiLw4wyvsgg3hYmxR7E3sTKozJCZNcJwHekffe6dvkp3dQq95LhVtZiLc9wMUoR
         aAniVSzmb27fpqnAIR8XseKvdLvd1kDWYi4bOTHjXJilDGweaD6FQiiLfpl6LYRAONGf
         Nfkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751956867; x=1752561667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N3j/1wK63BWsGUKsDNrpQgGtCBr1VsAlvbOLyb+XR7k=;
        b=cnm4H8G6XtJyWDXD84ozsW/kUdZ2KxAn/djNzbHPJdfuon6HCrSV7ohBCEZ9JO12xg
         buf4836HwufzWpK5Xoh/EEm22EvllE2q01y+eckbcgJqVm48Rz16jLhJsjPrXlJrCFuM
         yAmrFYec3a51g/wMIOB9nh7PqKLKUgokHPLl68ueo79DcxDllBPQY3xTWWWeHpUVjYCr
         kejDxFWwGBGUarvkOuxU3nx9a+ciMp0/9u+04+ExZGEA6fl+tIF3U7xmfzFMi+MEWnLk
         dg9QwjzQ7PV/JBr2vSAVTsC9Zef4IQp5oBhULBUobrnZSsqmFq5AOgs8WPYshDsxMWyJ
         Z5zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBbUNpjFqdsmP7Epm0mGr8vlGhrmtv9rIGE3+WVACYIW65927RgCtKkFRSAt5i36Wb8fI7PyZ5LgA4m1EzNcND@lists.infradead.org, AJvYcCX5tC8Ma4uo7kEEeypGKmy2jwHs96Nzs1mhyfGJV6PMnFJDZiI5R5cwVHRgan44Hs9Ca9MAxpLUbMfVpNI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv9/l9tDXQ4KLIGEUmPrSp5hMaCUlFvHXkriK2kEJ9VlFnt7SW
	mvwNqcw0/89TjiOuzu3EizWQ6jkd6EIWki/ixb9Jh60kUrEbu0XigzLS
X-Gm-Gg: ASbGncsIgHGM32QHvNbKWnBuMu7UN05WXqNigAQEqVCIe8FG3FUYt2YBsQaWom1uYIs
	3tBJP8lFNYtTFq1a5yNZhHytGYozGBjywckFZiCkThfJz89ufn4wAn8A9CFcp3uQ5JBmHil++4R
	yMSgNLOUAh2nourMkW5x7Fd4CVPvexILyZDU5UDx/T387EUo4886gEXVFAuKlc7Xmte7K2UgBp4
	FlY0nteuVCWFH3m6Scd4e+tep5GGNpq1YxZ91qGoOKZiSOb8iObG707qwUtIDeaKFm3wo4vHwem
	5YhhlTRdiudjNtMtCiuA/E7z0Pys8lHfs4CKnvikkN9QlPkp7qeia9jqvt7mqwxotM6w563a
X-Google-Smtp-Source: AGHT+IFucR+T9yvI79HtHogx0QhFDSYy7llkys4A780hO83hxrf2HV5i0axwF+kJgvPkACEuBN1BIw==
X-Received: by 2002:a17:90a:d00f:b0:31c:15d9:8a5 with SMTP id 98e67ed59e1d1-31c21d8adbfmr2332382a91.19.1751956866836;
        Mon, 07 Jul 2025 23:41:06 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-31c21d2e948sm1323277a91.5.2025.07.07.23.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 23:41:06 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH net-next v2 1/3] dt-bindings: net: sophgo,sg2044-dwmac: Add support for Sophgo SG2042 dwmac
Date: Tue,  8 Jul 2025 14:40:49 +0800
Message-ID: <20250708064052.507094-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708064052.507094-1-inochiama@gmail.com>
References: <20250708064052.507094-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_234107_758062_B839C2C2 
X-CRM114-Status: GOOD (  10.25  )
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

The GMAC IP on SG2042 is a standard Synopsys DesignWare MAC
(version 5.00a) with tx clock.

Add necessary compatible string for this device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Han Gao <rabenda.cn@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml |  4 ++++
 .../devicetree/bindings/net/sophgo,sg2044-dwmac.yaml  | 11 ++++++++---
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 90b79283e228..4e3cbaa06229 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -30,6 +30,7 @@ select:
           - snps,dwmac-4.00
           - snps,dwmac-4.10a
           - snps,dwmac-4.20a
+          - snps,dwmac-5.00a
           - snps,dwmac-5.10a
           - snps,dwmac-5.20
           - snps,dwmac-5.30a
@@ -98,11 +99,13 @@ properties:
         - snps,dwmac-4.00
         - snps,dwmac-4.10a
         - snps,dwmac-4.20a
+        - snps,dwmac-5.00a
         - snps,dwmac-5.10a
         - snps,dwmac-5.20
         - snps,dwmac-5.30a
         - snps,dwxgmac
         - snps,dwxgmac-2.10
+        - sophgo,sg2042-dwmac
         - sophgo,sg2044-dwmac
         - starfive,jh7100-dwmac
         - starfive,jh7110-dwmac
@@ -641,6 +644,7 @@ allOf:
                 - snps,dwmac-4.00
                 - snps,dwmac-4.10a
                 - snps,dwmac-4.20a
+                - snps,dwmac-5.00a
                 - snps,dwmac-5.10a
                 - snps,dwmac-5.20
                 - snps,dwmac-5.30a
diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
index 8afbd9ebd73f..ce21979a2d9a 100644
--- a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
@@ -15,14 +15,19 @@ select:
       contains:
         enum:
           - sophgo,sg2044-dwmac
+          - sophgo,sg2042-dwmac
   required:
     - compatible
 
 properties:
   compatible:
-    items:
-      - const: sophgo,sg2044-dwmac
-      - const: snps,dwmac-5.30a
+    oneOf:
+      - items:
+          - const: sophgo,sg2042-dwmac
+          - const: snps,dwmac-5.00a
+      - items:
+          - const: sophgo,sg2044-dwmac
+          - const: snps,dwmac-5.30a
 
   reg:
     maxItems: 1
-- 
2.50.0


