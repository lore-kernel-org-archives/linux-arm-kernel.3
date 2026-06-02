Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188C0CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 14:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GnWXzQAZ0Vo/VANt7mtlbu3rnPUwPJXrj9Dado/eFQI=; b=qtEM8IZOvKIRmM1j9u4Z+VGD6n
	arCBhM2cQDgvH79JmIUhFntVRhKpMDN+2BiBN+PJ1BZ2Q3QLLoscZSAaLY7R26W5kyvMFKGix9ZgN
	oIUEYQ9GTKOTNOHeOZ/Hb5P/PuTWGtxr3nBo/NoQUih7IZl8ZKN/4vp9gfG1bViMcBVwJno4gDyGG
	Cu6iBJNriiPfW8sS2weOumB4tZRRqVKrJJsACdelnLeKZN5CyyyZ1d18JDS2MXKUU9KhUY6GxzTg6
	fWVs3vLoVZbYZktCzlkpZ5LBY8KPqtq/WN6/diW0h+nC+PmvkPZjzBwz14wNmuxTy39nTvpjER6mq
	kmdDtDFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPs4-0000000D9tQ-3DDu;
	Tue, 02 Jun 2026 14:13:32 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPs2-0000000D9sN-1rl2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 14:13:32 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-45f3cf907ceso1522709f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 07:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780409608; x=1781014408; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GnWXzQAZ0Vo/VANt7mtlbu3rnPUwPJXrj9Dado/eFQI=;
        b=SxcHxk58UMwklpkfyvxQmAcyZ+hIbXOjCUr6vV0r5m2C8DwNp1DuNTjSupnCDMVdju
         qz6o+oHF5WUQpLBWJxG6n/VbnAL6BU+p+DHgtJOoulnh+MAhxvq9+TxUvxYGLGhLjSwR
         moKUV7VbPNDdbSrmQfkUYgID/5y5hWTqj8o3BYjgG2KN9hRMX30SF6JU9gDg+rE1nnPD
         cUihvIxqI+qibht2/rN26GBqU8/Fx0Ph+7bcKsY1JVd/RA1DnzKwLPHTRfglJMPOpj4o
         Vl7AzTiQ+tEvT8LMSPVSdULHltm/t2WXw/s7mDhoM5dqofBGGncBV5ksZXI2Z/7Xy/kw
         p72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780409608; x=1781014408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GnWXzQAZ0Vo/VANt7mtlbu3rnPUwPJXrj9Dado/eFQI=;
        b=RSx2A6Vxr6q9+9VfI750G4fJfKB7csHJa14yh+fsdOIxAH0kFn68VQfz4wIgJS+9jY
         pfSb2dQetcSKdShXJd/NfRl84x145FTj7zHdaT+UD83XPsnWrSsBZisiZ3n4oFD7ZZbF
         vuHnknvFN35HJjNxJKphQAyAZTcQ6Hj7pSkcqHV73mHFpBNcnqM7GHEeSzF/WOJrM7va
         gdOgEh+slvFVuFLIeZdOPI6PgWANqPUCA9k/cnAEIHX6G0AqkiwU79GUfIQUs17aRKD2
         FOe/L881d+X+RngayiG/BRMndg9wMpxBDSpJznOQVv9GcIi3UEObzem1+tmxJEiHvBda
         Xcvw==
X-Forwarded-Encrypted: i=1; AFNElJ/By2+YFakH5XFesMGdErpmj3wshIT1k/GUXGsG7J73p6i1SrQX//SgBN8v5fJU+Y4yKKaXx/kUeVq9I66bD11p@lists.infradead.org
X-Gm-Message-State: AOJu0YxS8ekSPYEGciX8ekMQgT8ztcD8UFKRDB3M1DbhS6WDwIW6axhd
	qQMnuFvfC358iwZwn242DRGsp5wcRHIg1ByPZnRLqN/El5xmde/2VdaA
X-Gm-Gg: Acq92OFoh3Zk+L3w4wZXRgKSOTpTnHTDcrQhJFugs2wroruhPy6AwFV+/lCdi09zsOO
	V2D/h17Ih4nlZk+zSCGcLsEDG25J5kM2e88XbG6itu4O35PusnYPxSfokKIx3k4SrBvWYT8aiuI
	nviCvOjfRHNjqum8Nel2eVKJ0Am796YgSGT7poir7NoQn/akKL0t4S0IuvEbswAptW86rqXplda
	MxRN/yFnq6Jj2CVCxdRKYcZ19bZfp1W/jmYqSt9N03vWEMfgdEiY6yAFwE3jpYJv5M8U7iTCk5D
	6oecE3bDsSwMyOYzb7vK190N+vhMcaQZg/+JIqPLPbzeEJ5bbfopeAhWSr7vMRS0pzZnAbd7atW
	1Fxtz7XktcHlzRCYwe0WZ931iMAcfrpFyE9oKRyfH6wXHk/hpaSQXOLJm5vZ1dKaXxXRuaq5Hml
	HT/bcFgQKFHG/sktkBiCXV8jxzuQ==
X-Received: by 2002:a05:600d:8495:20b0:490:44eb:c1dc with SMTP id 5b1f17b1804b1-490a292fbbdmr208200895e9.20.1780409608315;
        Tue, 02 Jun 2026 07:13:28 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:e8c3:a961:5b26:a2c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e0de7bsm60816345e9.3.2026.06.02.07.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 07:13:27 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: ti: k3-am62p-verdin: Add NAU8822 Bridge Tied Load
Date: Tue,  2 Jun 2026 15:13:11 +0100
Message-ID: <20260602141311.1366818-6-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602141311.1366818-5-ivitro@gmail.com>
References: <20260602141311.1366818-5-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_071330_505379_D75CD378 
X-CRM114-Status: GOOD (  14.41  )
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

From: Vitor Soares <vitor.soares@toradex.com>

Add a device tree overlay enabling Bridge Tied Load (BTL) mode on the
Nuvoton NAU8822 audio codec present on the Verdin Development Board.
In BTL mode, the two loudspeaker outputs are bridged to deliver higher
output power on the X28 speaker connector.

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile                    |  4 ++++
 .../dts/ti/k3-am62p5-verdin-dev-nau8822-btl.dtso   | 14 ++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-dev-nau8822-btl.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 371f9a043fe5..f2db3c878993 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -78,6 +78,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62l3-evm.dtb
 # Boards with AM62Px SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-var-som-symphony.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-ivy.dtb
@@ -274,6 +275,8 @@ k3-am62p5-sk-csi2-ov5640-dtbs := k3-am62p5-sk.dtb \
 	k3-am62x-sk-csi2-ov5640.dtbo
 k3-am62p5-sk-csi2-tevi-ov5640-dtbs := k3-am62p5-sk.dtb \
 	k3-am62x-sk-csi2-tevi-ov5640.dtbo
+k3-am62p5-verdin-wifi-dev-nau8822-btl-dtbs := k3-am62p5-verdin-wifi-dev.dtb \
+	k3-am62p5-verdin-dev-nau8822-btl.dtbo
 k3-am642-evm-icssg0-dtbs := \
 	k3-am642-evm.dtb k3-am642-evm-icssg0.dtbo
 k3-am642-evm-icssg1-dualemac-dtbs := \
@@ -372,6 +375,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am62p5-sk-csi2-imx219.dtb \
 	k3-am62p5-sk-csi2-ov5640.dtb \
 	k3-am62p5-sk-csi2-tevi-ov5640.dtb \
+	k3-am62p5-verdin-wifi-dev-nau8822-btl.dtb \
 	k3-am642-evm-icssg0.dtb \
 	k3-am642-evm-icssg1-dualemac.dtb \
 	k3-am642-evm-icssg1-dualemac-mii.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-verdin-dev-nau8822-btl.dtso b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-dev-nau8822-btl.dtso
new file mode 100644
index 000000000000..e4b662519a6b
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-dev-nau8822-btl.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Enable Bridge Tied Load (BTL) speaker mode on the Verdin Development Board,
+ * combining the two loudspeaker outputs for higher output power.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&nau8822_1a {
+	nuvoton,spk-btl;
+};
-- 
2.54.0


