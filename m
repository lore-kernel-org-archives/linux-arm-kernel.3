Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE63C982DD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M6CPqEr4SU9cbA7obY1MdT4FutuIOLbY8+DXgp/Ikck=; b=x5zEQJCGFsiu+TYWPf076uGAiO
	TcJ4/T7ocF3VM0sqobYj3lPvZJEfof7zjsQirUmvzpBB84bKkhjRrNQk8bv80kH9iPTF3U7dUKypj
	jjVehSWAs929YUFPvC0htD/eNq4y/ryDcmFaeA0ifnoxiZ0LYIxkf1xh8ucRGU2QScHsmtwMHx7TH
	/P4yJxPpDsk48GqczKno71zDeb3v2X/wyr65licxSKKhyFsQj1IfQ6Zq0guRrPhqv67PktunALE6L
	jnAQpf+/ODJd8QmOx1aXaRbF94IPfTCu6imrzQWILc+U4fNaGRfkaCzPWBvCJs7kY0i0dKQSl1rwL
	LCBixVFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Uke-0000000DvQ2-20Ev;
	Fri, 18 Sep 2026 09:19:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7UkU-0000000DvHR-1qGL
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Sep 2026 09:19:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=M6CPqEr4SU9cbA7obY1MdT4FutuIOLbY8+DXgp/Ikck=; b=VKFftUVfpVuHGZlZed8yiY7yuJ
	W3g0nXrQNt2CQYiDeUofC7iigtM+9bAfjIerCJQihONX9mU9czAURt4Nafnlj949B3h0KyLov7+oS
	XUcpAsyd0lRnlc4SSDtVrG2RGVoyID1lIqmR56vxyUbcR+lUssPXAKN/Wy3JD++DbfoLZw6iHF5Ba
	Jnq0QNMbZPYEG18Itp9zA9Gjuj7RZ3XSbrkSTUb6WiKTtfUuF2QswxsF3g3kXtpoAZodqJ8Fn+GhY
	IojVUDc+1RXP/7H2DubMe6Vn6s8apUiRuiTl6BTF7YWfchYrrjNwZIvpVQFfYo3MD4LnpGCzVCpcv
	alkNi+Bg==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7UkR-00000009qbS-2YSe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 09:19:13 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d822dso3616905e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 02:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789723150; x=1790327950; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M6CPqEr4SU9cbA7obY1MdT4FutuIOLbY8+DXgp/Ikck=;
        b=nanZcxjjnXAj7IPoj6DJ35Aq3628qfxXND0ZR5gUURfNcEWll9rKkNh1knvcJB66VA
         BioZF/xf3pzwMlRmbVZirzG4RQ1qJkCzJwuih5MfYAGAt5ELYoXmOGPuNQEqH+xxxqWo
         EknzWRmbNN6Pf2ap1Y83AiEiWzgY9N7b9wMCdq8F2ODqMlYY7jqIXp0O8ZV3/Z916j3F
         0Be3T+WYFnTCRkBxImyj4cVXXLu1+/fRcPEL1OuhSteA+8flpxRFizlM+mVR7CirrV6D
         JGydX+jiHEc8BBVxnh9kAachy18A6PUHWLsmFgkELuHyMAAiMuLOiVYVXGeS35DWPXTt
         dnCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723150; x=1790327950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M6CPqEr4SU9cbA7obY1MdT4FutuIOLbY8+DXgp/Ikck=;
        b=mZJveDf7pArpwiUFpO62qeDtfZT2q4AqNrBQ7gnm6KmWby9CUPd0uOyUZT4ITQZPr6
         /mPaaHvf8JE4ZU7/v+zGNQWykNF6K+OifK4Od3aG+zYxJAnVBgsOkVuTqPPvnw7rdR3p
         LToTYoA1OnI8CsOyU6k5KCNy4d5nYpyQGczwK+h3AH0umEgwa2TXqO+OaBQxoFTyKFsY
         mkxkwfsRQ8esJ8dqetN3M84iQctruyQ5GlqlQ715dYHIUQL146kLTvN1PzJzsLMh0eHL
         VMUIPWWTJWPlnyZOTOcDtZH3dSvDP2c2IGc8Ntw/e9T6fbOuDL4lS16hj/qdqtN6z9l+
         E5Nw==
X-Forwarded-Encrypted: i=1; AKwUvBzH1Vjgymsw4pRcHhz3absLPhO0KEzMhf36O42vyGDdBEPk/NXdtrWAL41btbQYcTIXslGlbWhuRXZkQSnyJMAv@lists.infradead.org
X-Gm-Message-State: AFuF++nUp5/txTBWmxVmyEVY5ppPda85tsWBNtyNtv4LpBTvv8ynFg/7
	rUcsTQDrtXYzW7MK6kMvl1DeXHNqJMo+oiEPEKxKRdOfYOukuDXxZIMpSwDfaDPEHlw=
X-Gm-Gg: AYBFou3Fof6dR7o2LzypGFkCUlPNi2Z0zdtBy6yL2wMwD65qvinalObxO3RO9RVyZJ1
	lixX8+gUpLAVdLY9Ek99s8kAwURRIz8Vgp7zGDIfI3O+AX12hx4aRR9bFWAoLhEbTHD/LbvzBzk
	KU9VnkLfH/FZEH3i4Mfor0NV+jdMS9bKRYCTcLFqThGTT/bnxVAItkU9/x1lbNxpXVnf88/tWVd
	NomZqEb+cMXWAfivVsq1CfkmV8vcCFO9TnEkGViSV9t5H1zFBRChf0qE3MRbRa9smZGJbHfe+/8
	s9arIcZzuuHgTNqAe6r+UwCeaeZlRHfx72DVzfsDahuflvrupKBHTjPKLesumSZRlVcbt22ZdLG
	KzfPnMnh3bFhqhTbZoCtS0Qb7ekhaPyRS6vllvWyw9/lHnvzJhLhdk5xrXl7DYXe8zpUes6qPZ8
	cWIvbR7PEcKgk7fGV7PMQo22tnXdFb0Wz+vGhkTWsj5hfmCzceqpN7J7sKbBJ8SkLQMZAROarlE
	GJ4/A==
X-Received: by 2002:a05:600c:6206:b0:49c:fff9:f684 with SMTP id 5b1f17b1804b1-49fc5735339mr21824685e9.21.1789723149820;
        Fri, 18 Sep 2026 02:19:09 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:7a95:1dd3:2926:35eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc585920fsm103172735e9.4.2026.09.18.02.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:19:09 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Fri, 18 Sep 2026 11:17:52 +0200
Subject: [PATCH v9 8/9] arm64: dts: ti: k3-am62p: Split r5f memory region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-topic-am62a-ioddr-dt-v6-19-v9-8-40972ef1f663@baylibre.com>
References: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
In-Reply-To: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5450; i=msp@baylibre.com;
 h=from:subject:message-id; bh=ZJzy9E8PlgkB1b0i/bkQxUTFa8ZhyIY8E8Ayom+Mjrg=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqy1jE9f9/s8XZ+rv7HG//mU7EOanrMe9qlkdxyq/dKct
 Ct1rej5jlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZjI4lBGhr6fZns44/erdF6R
 bl6uoZ0eOMEquzL8z4kKhx97/knsSWZk2Pfz9q45ZgwJXJ2GNVfv70/bKb6/ojOCWTPs9vlpR9x
 12AA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_101911_768349_5FC04CA6 
X-CRM114-Status: GOOD (  12.40  )
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

Reviewed-by: Bryan Brattlof <bb@ti.com>
Reviewed-by: Kendall Willis <k-willis@ti.com>
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 .../boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi      | 10 ++++++--
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi        | 28 ++++++++++++++++++++--
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts            | 28 ++++++++++++++++++++--
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi      | 28 ++++++++++++++++++++--
 4 files changed, 86 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
index 5d7f701420e2..84dfbfd1986c 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
@@ -44,8 +44,14 @@ &wkup_r5fss0 {
 &wkup_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
 	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
-			<&wkup_r5fss0_core0_memory_region>;
-	memory-region-names = "dma", "firmware";
+			<&wkup_r5fss0_core0_ipc_region>,
+			<&wkup_r5fss0_core0_lpm_fs_stub_region>,
+			<&wkup_r5fss0_core0_lpm_metadata_region>,
+			<&wkup_r5fss0_core0_lpm_rest_region>,
+			<&wkup_r5fss0_core0_dm_region>;
+	memory-region-names = "dma", "ipc", "lpm-stub",
+			      "lpm-metadata", "lpm-context",
+			      "dm-firmware";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index 8a5ff5c45757..45ab9d947b3a 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -168,9 +168,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
+		wkup_r5fss0_core0_ipc_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01d08000>;
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
+			reg = <0x00 0x9caa0000 0x00 0x1b68000>;
 			no-map;
 		};
 	};
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index b8af9ec81b0c..bb027c65eddd 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -55,9 +55,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
+		wkup_r5fss0_core0_ipc_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x1d08000>;
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
+			reg = <0x00 0x9caa0000 0x00 0x1b68000>;
 			no-map;
 		};
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
index 3d1a2c5bc464..31f670fdd91d 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
@@ -69,9 +69,33 @@ wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
+		wkup_r5fss0_core0_ipc_region: r5f-memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01d08000>;
+			reg = <0x00 0x9c900000 0x00 0x100000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_fs_stub_region: r5f-memory@9ca00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca00000 0x00 0x8000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_metadata_region: r5f-memory@9ca08000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca08000 0x00 0x1000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_rest_region: r5f-memory@9ca09000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca09000 0x00 0x97000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_dm_region: r5f-memory@9caa0000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9caa0000 0x00 0x1b68000>;
 			no-map;
 		};
 

-- 
2.55.0


