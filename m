Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6861DC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 23:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l+I5q8ocBYkmAGG3bQeirsTiO5x3ALmlbHtk/JRr4K8=; b=QINITR5jClMhm78A7mrHOKg6oC
	IbSfHRHRF6o2HcRKT0Z5sU0YfFjd0/Yw3C1o/eUqsx0FKuIWkJk+Bsk0G4SuI2N2DjMPc5rn/m2q5
	fxOqbqamPM0KZyvZYcUXQKXhSVOB4ObZFLDn9RwuHE38cezB6O3cRGtdJ8gAjGaMhf9uzYh2CMtJK
	UxvGNGGt2PiuhDcmaR0GT04UijtylEyaKMG+hMW1DKWkAnXi/NblsFVZRy8lWGGsdKHwg56IQlSLE
	QIj/Sd7/2YsXCpMFfHQfREO+wsvEE4VGA/90UE0hUpilmFsHNYZPcaW9aRsSktELXvEI/GT4tmALK
	li+V7c/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOmC1-00000005SuJ-3Qza;
	Mon, 09 Jun 2025 23:46:17 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOm7i-00000005SDc-3ZcK;
	Mon, 09 Jun 2025 23:41:52 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so4023917f8f.1;
        Mon, 09 Jun 2025 16:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749512509; x=1750117309; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+I5q8ocBYkmAGG3bQeirsTiO5x3ALmlbHtk/JRr4K8=;
        b=GJPmO4eEvbBPKvoCZ9LhT0BI/gfxX7iy3eWqttAvnBbgWiBM8gPH+PAAHqL0glqjb3
         +fwR/cUxfyVI16nbbJcM5y6vOHZtM/6hV5XFv34PqONEpb26Kja32WAqxpEfV2i5QszB
         vswAM+LamYpg6eDOEYPt7WexHkaqI8Kehq5hdJNGwIWLwb+6oxoFiVWfqdTxM0uwhFeS
         usZHDhSBbTCVQz3ueIIff8NV0HCT7oljkn8YP1zGHiOAI1SP8pVt7O4bOv4eI1lP2tlm
         WS6eyE04vp4A+Rhg7kbt9kDolOZobOX19hrN+akF30UzGSSoJj9cwMVN6snmf5YcKTTx
         Tu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749512509; x=1750117309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+I5q8ocBYkmAGG3bQeirsTiO5x3ALmlbHtk/JRr4K8=;
        b=kMS/ZYtUuSbdO/OA7KmyqxNsAJAbA/81ETMxc1EaLdRKmTxROUPuABaOBMG+EZ+tZm
         uBtPM/bzGRVDohNqPHrWZ3UxmIYVRj3Gwex++reUfSqqERY8PA8gy+MI62rDjAauMHuT
         E6nLiJ/fvy3Wp4wfe1Wp1hUOz0dfRlvbPa6n+4BorT64/GWkSlBbJ3O4fWj6vy8vtdn8
         uTpclTZEw1UL8h7gswuq13DbxRaaG90t9WuLgijxAzmb98xjdCirKc7mEK0leQb96UxF
         8T/FETbfT7giMrsc0q8YmVrTLbjuA+uixfDHR+IZuVhll1Y49+IlrJnPWE2Fvye1dzUu
         Gn4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWtuEkjKgOY9DVukzpon9RPm3B3lMZtU1yG97OjNxmWwMAOFsZMtYRu3g1T1S7ws7kppBAg6qK5kEPy/ZsF4kg4@lists.infradead.org, AJvYcCXQGBsePcs758SSj/EhpCbeA7dO1EKlNR60kN2lriAj37QtW/R34ifJDS2w1nI8bMN73UwBNQOXGU/k128=@lists.infradead.org
X-Gm-Message-State: AOJu0YytnGawfsPOj4crw7zv3jQhyg1jmIVKh0geRkFwdhch+RTiYTRb
	BnQhfvXydzz24P5PBAIeAi3uyxRUe+ul90v56DOjEkC2SBL6ApIEc6dj
X-Gm-Gg: ASbGncsA9rY/88lhFOEzDxxzgI+NhGtOaUYfG2cNEXUIrqqAJ3ALUCYGk1pW/iYvSkQ
	auuefJpTm1ydyPWlgHgnCIti4hIYuPPhzlzmu0A0chtQyFh0sHGnEwcoDN2uXO7xXge6ScBCDx4
	QEDn7v1llwTWDhXkF7JH+ESsMb4S6lIt7h1tlYkEpsTc82rEdpIppzrWHweN2RQLIjex+niIWeY
	hsnc/pWUE/XVrvgvkHAlzL0KpcP5ziavubx1jQ7/ZSDyZ/qDbs10vnQSOWh+Zmea4etlb85xHIz
	8rH/gPTdoHN/wv/9EiAUtm28T1krVVtvSjFziQqqNBqPaT8J+WtXcX1izAdBxtQLUylW7m94s1I
	=
X-Google-Smtp-Source: AGHT+IH7NDEGMIC05I8s3EhjGk1K/ehAcQxaj+kxcQV2s84i3k/Szs+b90p3CrDVe2+PWCJhk4iWsQ==
X-Received: by 2002:a05:6000:2407:b0:3a5:39a8:199c with SMTP id ffacd0b85a97d-3a5522ddf1cmr376314f8f.53.1749512509285;
        Mon, 09 Jun 2025 16:41:49 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df34sm10849846f8f.71.2025.06.09.16.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 16:41:48 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 1/6] dt-bindings: soc: sophgo: Move SoCs/boards from riscv into soc, add SG2000
Date: Tue, 10 Jun 2025 01:41:12 +0200
Message-ID: <20250609234125.722923-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
References: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_164150_889973_D2712DAE 
X-CRM114-Status: UNSURE (   9.37  )
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

Move sophgo.yaml from riscv into soc/sophgo so that it can be shared for
all SoCs containing ARM cores as well. This already applies to SG2002.

Add SG2000 SoC, Milk-V Duo Module 01 and Milk-V Module 01 EVB.

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 .../devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml  | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml (81%)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
similarity index 81%
rename from Documentation/devicetree/bindings/riscv/sophgo.yaml
rename to Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
index b4c4d7a7d7ad..602c092b4ad5 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/riscv/sophgo.yaml#
+$id: http://devicetree.org/schemas/soc/sophgo/sophgo.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Sophgo SoC-based boards
@@ -26,6 +26,11 @@ properties:
           - enum:
               - sophgo,huashan-pi
           - const: sophgo,cv1812h
+      - items:
+          - enum:
+              - milkv,duo-module-01-evb
+          - const: milkv,duo-module-01
+          - const: sophgo,sg2000
       - items:
           - enum:
               - sipeed,licheerv-nano-b
-- 
2.49.0


