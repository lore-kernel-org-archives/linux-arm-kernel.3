Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E29DE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 13:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T66eNQvkCk8ULvCPWitWaVVqgBtMU9sicY2LjyOUOVo=; b=3wYf7HR49FoYpjm63uNXCuS/3Q
	MXQ+ggQMwFzgdmBS+uejoA/ZVI4XxzFt2PueKXNwztv3vVQd1eFxYz2REoUO6rBqVgJtFLSQYnj9/
	FD9gu1jqyjJpJh7e0iIiIeRbhMROBN0EwhE5NglkVKwweWY8KNOUK2jjmkcs7kdULL1lMSdWswbR1
	fvLMAziIGgdCc6AUzXpccV0sD1Y15KbYA17LoTFnl4cQtYWp2ccnGOa2/SmB4uoXtwadD8GDkNWD8
	iwqFgAESYGr/geviUwpRafEygEXDngDwXMc+204CYgHw+NOzk2sxUHB/kh8N6COl/aju5a2DVQpjf
	kDAhd3bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9O9-00000004xCI-2tIO;
	Tue, 07 Jan 2025 13:12:53 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9Lk-00000004wUi-1KiW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 13:10:28 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-385d7fe2732so1451606f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 05:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736255423; x=1736860223; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T66eNQvkCk8ULvCPWitWaVVqgBtMU9sicY2LjyOUOVo=;
        b=T39z7kpcTIkVWqaIMdASWLRq0rwk7eFeq8fdNLnbwCqEHV58J9Fl6tpEVbY+QlNNFm
         J2k1Sadecs3Kx4SnJtIQaK0R09+9K/Zpj8FP3WPJK3FvqJGYbctbHif5sUq1z3vmdHth
         9Vf6NEz9UI/H65GkttYUVEv3Nhk6wuCnmMErxdsdgs4KHH7AvyyofASPuBFa3nh2Kv6n
         MRLtZwXHkywYZrsppHISU+jWse0Nbx6igIhf13YXUzJHb+yOxpKRmhYg42FJaEBtK2mS
         Zb0F0LMiIjTFWWLsRpKAWRohDym+gXuw1xBS0yvVbKxW71EerH+iVHybrZ0ArdLoVG7P
         jLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736255423; x=1736860223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T66eNQvkCk8ULvCPWitWaVVqgBtMU9sicY2LjyOUOVo=;
        b=q6dUUWorL7Pzjaa5TYMziAm9r5xTVJBMM9FezRab/5jIQ4XxudkHHMagwU4lXyslnM
         uv4h4WFBT706d19tI4DsYC25VsNB+sZteYI8gEFqjsf4V7JhBajoFSrkbYN4ybdGY62X
         +cY5JNhrfn/2RVXgHTGUuSrf/dDSZzCrMAiYxN1JAnP8yEMmhv6Z9644t5sSubfPti1q
         ie7OgLYgCVcBFt3JR2nMLTZwoUt6/hGEspBydvSgkiSdT5SqNYngdY4QmHKgrLrOi/kT
         Jy6dT4TKk8J/BYf/vppRgH786R77lSrf/MdzxnDKet4M1V+fdR70tx8KQMVmPdR9MMPP
         Uxtg==
X-Forwarded-Encrypted: i=1; AJvYcCV5rUNaHUtVKeIBIG9g6/DbpDtMJXykD0ospwIjvyV8lSoHEJ+jjbRhAXrS2YylpWTbZZi5fGDBWVcJJbqnRZdS@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/kg/qR4YkN7mgVez4LAjLlluWFSa6nu79k9RC5c/cLC1o/ksN
	17TV34nxlu1OslQbwQ0aKhNH2htKSYWNJF/EoH8jwwc8WXPBRp/EIIhN42/oVO8=
X-Gm-Gg: ASbGncsFBQ6hStQ/qqlhGrXm6dJLhqpacMO7i5nqM+A3NEMa7nV4zINUz1QS/cDOZ3x
	xJwavYohTquXMQSLy3SeVR+bQ5HJO/9PmQMVeg65AEerLPOAIx133X3PGOoNusc9oPO1faJrNre
	nkVEobS3aqj5rnyZlu3ozIwhSV/5SpvOK0wt1Ufi8urpsyruCj/6zCH7uan10/BTW5xn8SI+eFL
	Nc+b1mlJjYzmkvm7ly91/E4goRMR9Iy4iRmTzX/NTqEcV4a/r5Jwt4qvP73a9zvtnQ3qKA=
X-Google-Smtp-Source: AGHT+IGJtRYkKYFK2PfPatv3vBYhYEZyX64bizP7nth8eSlErNUm+QXw16gIId4ACUxbkB0wlK9AkA==
X-Received: by 2002:a5d:6d0f:0:b0:385:ebbf:8736 with SMTP id ffacd0b85a97d-38a223f7484mr20095420f8f.9.1736255422748;
        Tue, 07 Jan 2025 05:10:22 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c4bbsm593719505e9.32.2025.01.07.05.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 05:10:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: ufs: Correct indentation and style in DTS example
Date: Tue,  7 Jan 2025 14:10:19 +0100
Message-ID: <20250107131019.246517-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_051024_354355_65FF478B 
X-CRM114-Status: GOOD (  11.13  )
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

DTS example in the bindings should be indented with 2- or 4-spaces and
aligned with opening '- |', so correct any differences like 3-spaces or
mixtures 2- and 4-spaces in one binding.

No functional changes here, but saves some comments during reviews of
new patches built on existing code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/ufs/renesas,ufs.yaml  | 16 +++++------
 .../bindings/ufs/samsung,exynos-ufs.yaml      | 28 +++++++++----------
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/ufs/renesas,ufs.yaml b/Documentation/devicetree/bindings/ufs/renesas,ufs.yaml
index f04f9f61fa9f..1949a15e73d2 100644
--- a/Documentation/devicetree/bindings/ufs/renesas,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/renesas,ufs.yaml
@@ -50,12 +50,12 @@ examples:
     #include <dt-bindings/power/r8a779f0-sysc.h>
 
     ufs: ufs@e686000 {
-            compatible = "renesas,r8a779f0-ufs";
-            reg = <0xe6860000 0x100>;
-            interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_HIGH>;
-            clocks = <&cpg CPG_MOD 1514>, <&ufs30_clk>;
-            clock-names = "fck", "ref_clk";
-            freq-table-hz = <200000000 200000000>, <38400000 38400000>;
-            power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
-            resets = <&cpg 1514>;
+        compatible = "renesas,r8a779f0-ufs";
+        reg = <0xe6860000 0x100>;
+        interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD 1514>, <&ufs30_clk>;
+        clock-names = "fck", "ref_clk";
+        freq-table-hz = <200000000 200000000>, <38400000 38400000>;
+        power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+        resets = <&cpg 1514>;
     };
diff --git a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
index 720879820f66..b4e744ebffd1 100644
--- a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
@@ -112,19 +112,19 @@ examples:
     #include <dt-bindings/clock/exynos7-clk.h>
 
     ufs: ufs@15570000 {
-       compatible = "samsung,exynos7-ufs";
-       reg = <0x15570000 0x100>,
-             <0x15570100 0x100>,
-             <0x15571000 0x200>,
-             <0x15572000 0x300>;
-       reg-names = "hci", "vs_hci", "unipro", "ufsp";
-       interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
-       clocks = <&clock_fsys1 ACLK_UFS20_LINK>,
-                <&clock_fsys1 SCLK_UFSUNIPRO20_USER>;
-       clock-names = "core_clk", "sclk_unipro_main";
-       pinctrl-names = "default";
-       pinctrl-0 = <&ufs_rst_n &ufs_refclk_out>;
-       phys = <&ufs_phy>;
-       phy-names = "ufs-phy";
+        compatible = "samsung,exynos7-ufs";
+        reg = <0x15570000 0x100>,
+              <0x15570100 0x100>,
+              <0x15571000 0x200>,
+              <0x15572000 0x300>;
+        reg-names = "hci", "vs_hci", "unipro", "ufsp";
+        interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clock_fsys1 ACLK_UFS20_LINK>,
+                 <&clock_fsys1 SCLK_UFSUNIPRO20_USER>;
+        clock-names = "core_clk", "sclk_unipro_main";
+        pinctrl-names = "default";
+        pinctrl-0 = <&ufs_rst_n &ufs_refclk_out>;
+        phys = <&ufs_phy>;
+        phy-names = "ufs-phy";
     };
 ...
-- 
2.43.0


