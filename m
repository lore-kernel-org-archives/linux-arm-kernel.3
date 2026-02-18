Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3A3E9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 09:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wDpRMOozHNeMijvx/I3bTdYaHaiMFrXxZs8x05QVtOQ=; b=Zz5QXhmLGJuIeRgF5wof/dzomJ
	Hic+DwK9X3C78BWtRdp3K+O5wm7PXvm7ew5shLtXd58zcy3Wm+TzujvbTK23I5j3KjzdgUIKpz1p+
	cs8DLbvntx0Skf4WQQ1kge+xMTOaTrbeZHO4lwnMox1d3Us8SqU4x1U7C3YbMB1QTtCN6gYwaU+fC
	N6YPfeXrJghmwT/xbjVSYGi1QSlnTGpukmi1ddDG2BmZNDv4Tzd+Yw7EiWqBujT6DjDj5aT1Jlyfc
	UQsnY5+wAg+atZHwqMgIDj0izipA7zGs6oaSlnFaPkrvrM7byEp3D5z3wUEBEruG2g/WKURJHNuBF
	MrOZOAeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdtd-00000009Y8O-2oDj;
	Wed, 18 Feb 2026 09:31:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdtb-00000009Y6f-1dpe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 09:31:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5395540A41;
	Wed, 18 Feb 2026 09:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B57FEC19425;
	Wed, 18 Feb 2026 09:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771407058;
	bh=tn9Uei/m+yHgz3XhSAxcrYitPsHpRxoxxRPLQd9XWHg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IklZxhDFQnEUq4YeOqfXgvJp7EZ0+e2oocgjscquyWud55yusH0mmDNxFfYzqBrQs
	 1lmmSRNYopXnHH2UnpBJJBut+X7ZSJhQo4ZZLbTPRoGZLtVOiDeFj2840RtGsOsf94
	 89CFOS81zSusqajXcmNv+xLV3xL1nO3IO2xrxyCbQCtG1fsgx4cchk73CgBrwQcmd5
	 Lp0Wrj8LWW06vyDGt5+Bq9fjlgJhMCSuosomBSbZZYnXKcWyZ59ffpKkBYV+6h/fxS
	 UdN1nuPtWNxFnaWbu8ugb5QSA+R9hyUFO0mRfTeRW3r6uXTlR53IIjOAqk24IzMANG
	 v8AUOy4QafRzw==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 18 Feb 2026 10:30:50 +0100
Subject: [PATCH v2 3/7] ARM: dts: bcm6846: Add I2C bus block
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-bcmbca-i2c-dts-v2-3-5373ef82c50c@kernel.org>
References: <20260218-bcmbca-i2c-dts-v2-0-5373ef82c50c@kernel.org>
In-Reply-To: <20260218-bcmbca-i2c-dts-v2-0-5373ef82c50c@kernel.org>
To: William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_013059_462432_4062740D 
X-CRM114-Status: UNSURE (   8.56  )
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

The BCM6846 has a brcmper I2C block.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/broadcom/bcm6846.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm6846.dtsi b/arch/arm/boot/dts/broadcom/bcm6846.dtsi
index f5591a45d2e4..47f177323c18 100644
--- a/arch/arm/boot/dts/broadcom/bcm6846.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm6846.dtsi
@@ -242,6 +242,15 @@ mdio: mdio@2060 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@2100 {
+			compatible = "brcm,brcmper-i2c";
+			reg = <0x2100 0x60>;
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pl081_dma: dma-controller@59000 {
 			compatible = "arm,pl081", "arm,primecell";
 			// The magic B105F00D info is missing

-- 
2.53.0


