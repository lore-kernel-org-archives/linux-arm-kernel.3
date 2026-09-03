Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30DFC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 12:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6NNd/n53IWJVafKsKaqyvY1/0PdAbevrRC1wPXZom4k=; b=SzxqNGFxzSDbYx/l4JwYPdvuqM
	Dv5ABIn7spez4i+v5Y3QKrVZyXMDOh/8Uh9tC7Gz5OUNn1ICPs2tXye2vC6+KY7vIe/ODJvv18R33
	fcfRqfhaW5zKy3kgOY8lpnfz0iJ7TerTMEnJGFFeORXTwsDXW1squccr/gS5XxUuH3ylPfp02RuC2
	oDBEK9kVEBcn9RW/jLFvWoTz1HesWK9593aLp0ikjsLGYz6b2gE1XGk0CYgwlPFfolyd7cbWZhQm/
	8w7XtTy1mXwODQ2GksZQdqxpfduPvcMzPjUAhtxj0zQGuymrF8A058gBMxTKaeQ1dwMN6F2gkwM3I
	pYTKDSPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26kN-0000000HKEu-42eg;
	Thu, 03 Sep 2026 12:40:51 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26kL-0000000HKAJ-0o9I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 12:40:50 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso7321105e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 05:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788439247; x=1789044047; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6NNd/n53IWJVafKsKaqyvY1/0PdAbevrRC1wPXZom4k=;
        b=MKhnSuOY8LhLxbTpIxWhUXbblrTjxw2fwcC7mU7O26DNZY7RRbECyi3PkChv0lRlwq
         IV5Yv90XfM3iKjymlnOp8lH2r8KdMvX5CkknQeZV4DOSZ9sGxHuy0KBp9Kzq3d+2TYlx
         c+6C5W8+WP4ywiZ6gHiWjfABo9UkByjqAK7djg7y627Rf36wVkXm1eKrYboX9O3XszmV
         HpHr5JY8QoMf+7EpxwNlRvaRu7m2pAcAommDQ7BfLr6AezmYAG6AllYpKxP7ImNY1pjR
         KR3vWHM2aXlX7Jc0kqwJQBR3WyQaqmr+rUzbns51dMnU/ejmoQE3C866QWrwCjAr2Q4A
         /j4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439247; x=1789044047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6NNd/n53IWJVafKsKaqyvY1/0PdAbevrRC1wPXZom4k=;
        b=qt5exLlbzqYXzfWny3xKeJ+QPGnOAgxRT9/myjHEk8pUtn+hvgHIcPZVFHcQcroJOY
         gT54nEjcJ8g5donsgZbq2WrdU+wFsA8nLtkabNZ3X4oSdkRjFteGAGh/JBqnPq/5YMTV
         ZHixxEg2XACjVvazCviOLZjyZNyuu1OAYK3HKSP+rK6dRLepATUa32d9bZocPY/qbzqQ
         ume1YxsdbShSOKZpvo6EcYv7K6MksyVcIbH5Q/hiKgt5MV7zMOrMLMK+XvHT24Y13z09
         Rtmu14wJHa2FFrGtIOLQD1aRuo3YvwZYad+afyhMRTnpU6RJofWz+0NPIEljVeBDtlJD
         dqYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgkzFH+DhqihidIfC06OSs9ol/U0xZWp0/qDENsv4pHylFRDLlDpAWYCa+Gevt0zHxL+PclR4PNyGb/NvIi4WZ@lists.infradead.org
X-Gm-Message-State: AFuF++nfWwHf8CCmy3NP2nF2W94jzAXtW7RBIvnD9Goxl+rq9vtkkKTW
	Hyq49izOpHE1zGJ5eQui0PqC53onq6RQZ+Qk35aH5PN716I1xzm268/ryKHU31rx1KA=
X-Gm-Gg: AYBFou0CPnsjlEf/9VjbzrB6rDTdgLS7M7ViH1yIzry0rCqqNkU2aHTw069lef3McoQ
	rYQfPz5JWfD1Z1T4uKA5zDSNU7WKhYqhCbu0UW4yzyjCKppW0s97ggZShtZ3FBJ5bZLryYV6p/9
	/4Cf8TreHy3Qj4Q/vBIvoxV8x/oRjDymAexUNhT2Bpg7e67XSZSwZ/9zu968juwMUJHckOoMzBe
	ws5A0Omt9lSp2MKrkZM/8yKWBdAMLUtKBU3o8YV1m/rJ7ia4lcvRl3YXNyM7xmhHpWH0g21RlB6
	jw3a0V3y7qTDr/kIkbzBuVmft4Csm+R2Gb4LIOP9wokslTKJx/g7z9kuOwcK9skBqvmJCCxnENn
	DdHv+myMmke97LTOEPVZNLo5i1NX0mLUsHIHMwWdL2Yi9dDiL7fBDTinr2YbHE9nGbeJARcAjkS
	0i6ASw/UBJPn0AglwCRvawp9d6sJN0pHb+R53TCChUmdYbVv8riOkaXt2JeR22D+SK1a53uQ==
X-Received: by 2002:a05:600c:3b9b:b0:49c:f13e:e51 with SMTP id 5b1f17b1804b1-49cf15c077amr34714395e9.14.1788439247359;
        Thu, 03 Sep 2026 05:40:47 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:4373:6c2f:4372:b8ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee60d8a6sm68280925e9.10.2026.09.03.05.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:40:47 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 03 Sep 2026 14:39:30 +0200
Subject: [PATCH v8 9/9] arm64: dts: ti: Add wkup R5F nodes to pre-ram
 bootphase
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-topic-am62a-ioddr-dt-v6-19-v8-9-74c650dfdea6@baylibre.com>
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
In-Reply-To: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Judith Mendez <jm@ti.com>, Daniel Schultz <d.schultz@phytec.de>, 
 Andrew Davis <afd@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Beleswar Padhi <b-padhi@ti.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5070; i=msp@baylibre.com;
 h=from:subject:message-id; bh=owt8VV0sX3I0hSNu370JxdTN3eXzEsQZ3jkDls2/TBc=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqyZWXu9tctj2M02CkhvnD9HST9gKluSqCubiNBv91tn5
 KQ+Wyd2lLIwiHExyIopsnQmhqb9l995LHnRss0wc1iZQIYwcHEKwESqehn+p2r1FEUozjkWfLvx
 s6Hjkad9M1PzL+9x0dkp+nb3ohKdIkaGJb9XvLPbvYrZc9nGA+ei3nEc/jVpR7Pe0pe3pkmcW2/
 2iBsA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_054049_293547_F3FC32EA 
X-CRM114-Status: GOOD (  12.99  )
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

For IO+DDR the wkup_r5fss0_core0 and the
wkup_r5fss0_core0_lpm_metadata_region need to be accessed before RAM
setup is done. These are used to read the lpm metadata region in
which data is stored to resume. This needs to be done before RAM is
in use to avoid overwriting data.

Add the bootph-pre-ram flag to the wkup_r5fss0_core0 node in both
ipc-firmware dtsi files and to the lpm metadata region nodes of the
AM62A and AM62P boards.

The board level bootph-pre-ram flag of k3-am62d2-evm.dts becomes
redundant with the dtsi-wide flag and is dropped.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi     | 1 +
 arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi | 1 +
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts              | 1 +
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts             | 4 ----
 arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi | 1 +
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi          | 1 +
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts              | 1 +
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi        | 1 +
 8 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index 7fa19ced1a23..34c3b70e36ac 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -81,6 +81,7 @@ wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9ca08000 0x00 0x1000>;
 			no-map;
+			bootph-pre-ram;
 		};
 
 		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
index 94c1d60d8d7a..9e97e10b88fa 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
@@ -73,6 +73,7 @@ &wkup_r5fss0_core0 {
 	memory-region-names = "dma", "ipc", "lpm-stub",
 			      "lpm-metadata", "lpm-context",
 			      "dm-firmware";
+	bootph-pre-ram;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index 871ec227def9..f2059a90ffbd 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -75,6 +75,7 @@ wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9ca08000 0x00 0x1000>;
 			no-map;
+			bootph-pre-ram;
 		};
 
 		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index 7cba3ff99e6a..f87d6d515e2b 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -800,10 +800,6 @@ partition@3fc0000 {
 	};
 };
 
-&wkup_r5fss0_core0 {
-	bootph-pre-ram;
-};
-
 &mcu_r5fss0_core0 {
 	firmware-name = "am62d-mcu-r5f0_0-fw";
 };
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
index 84dfbfd1986c..a343166b815e 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
@@ -53,6 +53,7 @@ &wkup_r5fss0_core0 {
 			      "lpm-metadata", "lpm-context",
 			      "dm-firmware";
 	status = "okay";
+	bootph-pre-ram;
 };
 
 &mcu_r5fss0 {
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index 45ab9d947b3a..8976c0424cd1 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -184,6 +184,7 @@ wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9ca08000 0x00 0x1000>;
 			no-map;
+			bootph-pre-ram;
 		};
 
 		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index bb027c65eddd..c5f6ab73fcc8 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -71,6 +71,7 @@ wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9ca08000 0x00 0x1000>;
 			no-map;
+			bootph-pre-ram;
 		};
 
 		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
index 31f670fdd91d..9e87a59c5def 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
@@ -85,6 +85,7 @@ wkup_r5fss0_core0_lpm_metadata_region: r5f-memory@9ca08000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9ca08000 0x00 0x1000>;
 			no-map;
+			bootph-pre-ram;
 		};
 
 		wkup_r5fss0_core0_lpm_rest_region: r5f-memory@9ca09000 {

-- 
2.55.0


