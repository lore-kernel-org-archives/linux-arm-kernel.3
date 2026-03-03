Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2E1EDA687
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 15:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZfHnZo1dfLxFmlRErM/g2D0e3BjI58pYZzPrUU0N//E=; b=KrcFxmG23T76uLd3Wz3/k0E5Xu
	1MDqFyqLnvB7Pf8CKiJ3gZIfgZtXJ/ouEkAG9hLbHrwfPwODGuX6sp8x9RcUgKyuD+sbS6o/hqiW5
	V2qPOZSaa/wEio3kPfDBC8X3oNzCQsqSa6lz1xC8qAk+D9WC9spTVM4mM5ICk4oR+l0UyOiSPoRVs
	54iUv1wkVF4K6et2SdR22HjpatH1iKMSk5JRrI6TeuS3+G1Q7LKbc7MJF7NsMbS3oOBy4MGYcMcl6
	KsxkNCysDu8hqOS9x7hD1fess3x+faCUNpUm9dyg0RE2fIQ00DJOcIgj5DWedFvtDbHrAsnJ3c7n+
	+W6ZFnRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRRh-0000000FOuD-2PYv;
	Tue, 03 Mar 2026 15:14:01 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRRd-0000000FOqb-09em
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 15:13:58 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4398d9a12c6so4568501f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 07:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772550835; x=1773155635; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZfHnZo1dfLxFmlRErM/g2D0e3BjI58pYZzPrUU0N//E=;
        b=JVz8knZEOdpgLpwKt74XoiKUjJNfiw7RATjQaFQnjWChzn3wjIWgIDYHESoGFzN2Y5
         nhnWnL/Y7xJ2Q7PRTXagqxqbdkSRq/mk6Wb4Etq/Y3sCGywue4jPrKeW/9D3VcZRoFgJ
         ismGDabJN0CEAt3oNq880zCJzHf53voe/yHVCMU/tWLuTtOHghxu7RSUquIyu+z5ssCd
         rTykyu35jY7qDkV2PuHkGdPqlKy4GAP8eM/6tSsHe5PWprM0Jvt6Qh7T0SG0EzCIk2aK
         yDwuIJq8+wfI7NeOeQyypHBwWqfmoeUYsgZvsusHRWyLfHgfWhF2BPScNkIcKGBoJ8N1
         rAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772550835; x=1773155635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZfHnZo1dfLxFmlRErM/g2D0e3BjI58pYZzPrUU0N//E=;
        b=h6iQo53mNsGJ3TYFB8s96qZxnTKOBOefy1UsX9qivdj8rWuR34sQbVtwv6yU4mj1kp
         ZXaCjgL2u7ys7yJoaAbONPKJxA/fgbxLSvrnMUPCRJPB3fmp2nZIe4qnW6OeO9kviq+/
         NsTXdpIODWO9QJRwKGB7OPk7dnxGklff0D0n0RMcd2FYzEluQLdsPELoOHplg+8jOOii
         zE9Vp9QF0SY5gprYSCrWS496EZDPyNSuqZVvesxfR7YNQre9SXLk0gTbhD6/AgCFYdIH
         25zGMykxEG1dz2jnnQXkXT7UXz7YMKTAVZ9PBJUGGvR7DmME96yD23R0QBpmQZHKB/yb
         gm/w==
X-Forwarded-Encrypted: i=1; AJvYcCWRaP2t+i85qASPHvuZelPSb15jKgp7FZ7AHds/ry637/jw7OXGO9zK1jUqh3lSie58yxT+PePACt3Dgb5Gn8UT@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2g+1qHyJOVvPRxaMDvsFOJJctcb0PdQYLrkddEbl/SXxA8BFf
	ya4nZoPG5nxTc/NSBspTKGYt/o8xlNz+PcaEj7lfIrAws5urdfHmZwzcVfHnXfNn0Kw=
X-Gm-Gg: ATEYQzwPBABcS4Mx6ld9A14DoNj4Az5Ur4IfypsOb4LpCYSmTpUau20aqvDsYg0U4zD
	s2EeBhOxkQoX79UroB7C+IHZn5XWunBJ5iZ2k2LdYEttwRbna4NFtzVcSyGw87OFOo90tlifJ6E
	PeirZzhcWcqAnqhh1JfNlrvUkKQLQ5eGngPpSu21FpV9Dliub3p9X7omQBKZEexrOyEqAkvPxUr
	Mxzi4cVhtL+/dCBAFW7gFtuUnTgpssdc4ohP9RwqHyFe+qS4SMtnghalmtBvWitPNjAcxHvYVwZ
	2G4KhUuXfJnmWrmTA+7c1K483niOhuJbg44eP1pBmxRa37gZLFAP1Apj1Jo9HeeMRcyxjMyhPDQ
	jDA2JpuFyx6ssnFy0Myb6XFgzTbMfq4Xl2+82yP2Pkm00ydBmqV/m9hl9jFt0uz40uimx9PAAaW
	GiJnPaM1BK514RtStF7YmbGs0WLuFcva4=
X-Received: by 2002:a05:600c:190c:b0:480:5951:fc1e with SMTP id 5b1f17b1804b1-483c9ba7fd9mr278150565e9.11.1772550835019;
        Tue, 03 Mar 2026 07:13:55 -0800 (PST)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48516f74a1dsm10515885e9.2.2026.03.03.07.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 07:13:54 -0800 (PST)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 03 Mar 2026 16:13:01 +0100
Subject: [PATCH 3/6] arm64: dts: ti: k3-am62a7-sk: Split r5f memory region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-topic-am62a-ioddr-dt-v6-19-v1-3-12fe72bb40d2@baylibre.com>
References: <20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com>
In-Reply-To: <20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2273; i=msp@baylibre.com;
 h=from:subject:message-id; bh=8gzlbnd/lrhfH675InFOw6ENiznOrf5//f1/mKofVks=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxlv2YuYdvkp1713/DdRHeX0qL0Pae9jt4V1d4dlrROO
 VhBg/FfRykLgxgXg6yYIktnYmjaf/mdx5IXLdsMM4eVCWQIAxenAExEbRXD/+LSPTkWFQmhnucO
 f2P4/i+mozWU7+B2pgPaPv4RzWen+TIy9C1g+7HIde2CuaW27mfFfSU5VxyYXBIp0RJ/Wufqi9k
 LmAA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_071357_100677_A2277608 
X-CRM114-Status: GOOD (  12.43  )
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

Split the firmware memory region in more specific parts so it is better
described where to find which information. Specifically the LPM metadata
region is important as bootloader software like U-Boot has to know where
that data is to be able to read that data.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 40 +++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index e99bdbc2e0cbdf858f1631096f9c2a086191bab3..c381cc33064ec427751a9ac5bcdff745a9559a89 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -59,9 +59,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
+		wkup_r5fss0_core0_ipc_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x100000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca00000 0x00 0x8000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca08000 0x00 0x1000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca09000 0x00 0x97000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_dm_region: memory@9caa0000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9caa0000 0x00 0xd60000>;
 			no-map;
 		};
 
@@ -922,3 +946,15 @@ &mcu_uart0 {
 };
 
 #include "k3-am62a-ti-ipc-firmware.dtsi"
+
+&wkup_r5fss0_core0 {
+	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
+			<&wkup_r5fss0_core0_ipc_region>,
+			<&wkup_r5fss0_core0_lpm_fs_stub_region>,
+			<&wkup_r5fss0_core0_lpm_metadata_region>,
+			<&wkup_r5fss0_core0_lpm_rest_region>,
+			<&wkup_r5fss0_core0_dm_region>;
+	memory-region-names = "dma", "ipc", "lpm-stub",
+			      "lpm-metadata", "lpm-context",
+			      "dm-firmware";
+};

-- 
2.51.0


