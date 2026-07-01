Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04913C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r7ceLvJFGDWzpb591woUgz7GBOYPJ1IlL6PiiR38W78=; b=i5nrNjhlJgl9qlYMRlrkqJtgp6
	fX9bDDsleKJASww+RhYucGlroukZbuAyLiiH6i7dzpgSY1pUfgDb0bsgoNa5AugZjz3TRAq1rffdz
	lwrJo1IdpZdxDRTzuUIr58m4G4DXf7hQRhKknxSZ1z+IiVw6jU/cYl2hb6XGBTvLzy9uZkB+AEpbQ
	QDaGA59HNZE0Hq/wZV8jFoWQdEJdBSKuIIh+jne4ykYm0aJFbHmfQPxlVa7vCd3rr45xsKJCu2MBB
	rv37DlcW63SgSa8NaR2t9j7D2XOhMNgSeTGEx+XPV7utOVkE97m1MLduW4udUHcUzMsXLeP5vazkY
	axxfiGnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuFW-000000021WZ-2k4Z;
	Wed, 01 Jul 2026 12:41:06 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuFU-000000021Se-2wwQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 12:41:05 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4763b0c1dcdso723883f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 05:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782909663; x=1783514463; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r7ceLvJFGDWzpb591woUgz7GBOYPJ1IlL6PiiR38W78=;
        b=U/+DUwHdh6E7ixlulDInLH/9JbWA+5f6segCkWBTxVCa47L+i/mU+dfX+S1LdeDG+k
         wUsioiMcqe8u7+P5DuxIG4awCHaR9X9jvClrmrJcPocGxZnPxGWl/ATynS9AXduxjaHn
         FAT7Bz03mxfS1I9inwNd/3YyccpcSaMKyCyFMX67rtkVBtyp2nUP16wS2vxyBNkA9YxU
         7eZNynoHj6BjPlWoeenEEksJFd3H1Oknaj5BX1LWcPz6KdTnTqOUHq+/qJYPAXTox7KB
         CbcEuU3sSvO0npHrCzHy7qaFTOdENYPxY+3xOKrOQP03CmL0DNxOvoaGtTFEoIzCLuwU
         3/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909663; x=1783514463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r7ceLvJFGDWzpb591woUgz7GBOYPJ1IlL6PiiR38W78=;
        b=BBVwd9i7pJi+30GP0jfadp+tZLML+w+pztatxBbG8PLXQcYZqCQj37ThpoOCniUKhx
         WZdI8aQyPitRZ4tOVb/1jO3p5VVL9QGSeBFRQTtXgF3kevPiCU/lmzrLDbz4zDuW8PN/
         5GrDbPNY828mr1hnlRNEMnmkRqc22E/vTd1MPokvQA1GFn0NcjD1k9PRZHd99JvYOYqO
         JP44BDNhrRbswgRVTIoNy5lzS1tM7Kc4rGztoo3NNGaB6r0ECUBT1N9YCCAcGsrRKBYp
         4bX3DeWkMv+8EKd2sBHrp8F38rJkJ+eIgpUmBRSjsTJLvXq65EA0rLpaAQE0Bb4LaUZc
         BIkQ==
X-Forwarded-Encrypted: i=1; AHgh+RodgZKfktmLetgIQzK6i8zpwVyteZ3a6M0tBP6fCD3HeSSHsXpl31VY5h1PyCNtUqIeij5f6Wo7Z/7U/3YjS6tW@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2r2XxmlXz/JdTrqeSiBE6FmKljYe0dgQyuJjCOdxh+3hcciLT
	n8jkWBi1wmf4JtEuaPir8JeLng+agFv5qqTiX1037+agJNllS431BlSzulPusb5A8Js=
X-Gm-Gg: AfdE7clDVhmrQ3wMR4mCHq/X8+0RgZaMQT0tebV3/GmfaikMhPLpGE7FmoVc2IXBb/M
	WEUMWkndYPdwqvPQ1pHvx0Zwx/IKbUw8HLHZbEm33tmWOOScttPBtM0IjCRBjzm+Hiu9x8OnyZF
	+7dy/DlW5I6jJcOy3avC0BMfcyBpXyIAwRIRR2WotHd308pACVg7DQM9wdLZftOKzI9QUsa9f2Q
	FpYvxKrBuZgRcqQBps5P0QVymxJZe05hKXL/hfUkCtEZ2AGbdmeHPxY0dssuXD1Fe45+Z5Dgf4e
	9K/QdUsEFZHi8j5I1l4EU/UqfBt6NTLs3KABacrWabBQMM7U5ur5VesDUtoux6htAJ7FuW3bkXy
	fFQn7N6clZMOQnv6ZzLcevfsy/vd8zIDSYmjq+xB15vtaP5U90AZg1i373IxF1plsbKLUbI1caR
	vjjFerM9zfJgWrPojKGpq5
X-Received: by 2002:a05:6000:46c7:b0:470:2fb1:3db5 with SMTP id ffacd0b85a97d-477b52962ebmr358057f8f.30.1782909662884;
        Wed, 01 Jul 2026 05:41:02 -0700 (PDT)
Received: from localhost ([2001:4090:a246:8638:a73d:f626:6582:90ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47563d194b0sm17422911f8f.1.2026.07.01.05.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:41:02 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 01 Jul 2026 14:39:23 +0200
Subject: [PATCH v7 11/11] arm64: dts: ti: k3-am62p-ti-ipc-firmware: Add r5f
 nodes to pre-ram bootphase
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-topic-am62a-ioddr-dt-v6-19-v7-11-e9db8b16821a@baylibre.com>
References: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
In-Reply-To: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
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
 Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1228; i=msp@baylibre.com;
 h=from:subject:message-id; bh=vgTU6IpqehS35f26r2q57NqAGrF/RDXF3lubDqCB+Bg=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixXrqOMLZ/SpPQcPUy3F2Rk3LwuqBFyOC34z/l3E1l28
 oVtX+3ZUcrCIMbFICumyNKZGJr2X37nseRFyzbDzGFlAhnCwMUpABMJmM7I0KZ15LlN4vNVXPvu
 v/t0m2nK6YWn6idE/mLv5npdlaZYXsXw3/vkTmO2mFwRP4V/C6/HMifyveY+mHhfyWKCxflsE9/
 X/AA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_054104_767141_8DB34C94 
X-CRM114-Status: GOOD (  11.22  )
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
setup is done. These are used to read the lpm metadata region in which
data is stored to resume. This needs to be done before RAM is in use to
avoid overwriting data.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
index 8f7409da83392d2d1f160a9645ef4d68f7aaa1bf..04fcd5115b9d95e6e23c4e43782c06501a0fa601 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
@@ -40,6 +40,7 @@ wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 		compatible = "shared-dma-pool";
 		reg = <0x00 0x9ca08000 0x00 0x1000>;
 		no-map;
+		bootph-pre-ram;
 	};
 
 	wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
@@ -89,6 +90,7 @@ &wkup_r5fss0_core0 {
 			      "lpm-metadata", "lpm-context",
 			      "dm-firmware";
 	status = "okay";
+	bootph-pre-ram;
 };
 
 &mcu_r5fss0 {

-- 
2.53.0


