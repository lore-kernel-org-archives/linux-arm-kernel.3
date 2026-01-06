Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E0ECE9D79
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 16:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JrveI4iw+ccmBDg2EkS6K3aw9Wh+g41Y1Md59+n6Qt8=; b=Y1vW1/Qp2RWm8wKimoBYnOOVw/
	C7eVM14E2THlmiAQ+uGA+vFLYH6G+cM5EzsL2MDJiQ9Qszj8JprUhEEYnmjDo1DMwHPLnkztfuvud
	7hmXfpDYko+lD5gT+UiQl2AgxBXeOUy2u/mC+xb4KJ1cfNDTyzVMPkkd3mflQSRtAj7j2gPr6uy/b
	3Hq0vTOy9t8FPrOlFq4NYFuVl//7Ja8qWCw5quUYjYCtWmg1gZpfrb60e0Rdc7Kx2HBH25NC7s28f
	+HKnrHwfYMZbuXiz/TcVsgLEkzqWIout9ZMmAbx9IMgFDoi/H1j4E/yJwo6XB8kKPsa8sHVRpZUxs
	AAeEvaAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9pJ-0000000DTg2-0T5c;
	Tue, 06 Jan 2026 16:22:33 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9pF-0000000DTfL-3Rgd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 16:22:32 +0000
Received: by mail-ed1-x543.google.com with SMTP id 4fb4d7f45d1cf-64ba74e6892so1863974a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 08:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767716547; x=1768321347; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JrveI4iw+ccmBDg2EkS6K3aw9Wh+g41Y1Md59+n6Qt8=;
        b=eMyzOj2SlRfUzzjV3iNHmUNNSbbRWvx3ElReKpHXWYEKzYuLi/U2wDCbM93nM56jST
         FV6d9WN14/UI7VCp5GIhODj28lKIvtNtuHPEU26PAAjMmst7QvntjU/6krcOP33EDhPY
         pQrmTynuaYLdu9rq1kfMuKC5Hbpr4WoB07Uu+brGrobHvaEqttWjbVBAxZB9uDqIV+Ff
         DEN1FDRhEe0hqlbDZWd9LNcK3qiZzYFrHio81Ewpsrur3YgFBaZxFsZ34ap2YVtWRWpA
         Fwcgkhhxsj40YMkTXGZ3E+jfcjJY89Q30angjsQftqYKXpD2dEYtGV7iVGdxaBz1oAJ2
         lgKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767716547; x=1768321347;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JrveI4iw+ccmBDg2EkS6K3aw9Wh+g41Y1Md59+n6Qt8=;
        b=R2XS4aFeugbXuMhuBuQ6l2KuCiicXTnh2LvPL6asowVmXNdkVmMQ44OmbOao0+DpM/
         3OknWo0QD7HWcZnEmWngbvawGeBFzhYE3tvD3wmBtZGLtnWR1Cys7q4VqZlMtDUODKvW
         zLx6bpfeTUPxcl2LxIRGn/gQto2VKl35ba/rTgiko4yIFeepyKJ/wxYWGffXVR5qyIRh
         orvzPFDFcPtyctCYbZhVW1D4Dzqmm5mZ9EJOCbaF2AuY6pWV27VdIzJbgRfIRyEXXMks
         uGzM/2naS/mNdXSdtW2ZzQ5rN/5FKP/3HdycPaNtfDOixj7w6BHusR9xlc1f8/lXKZVL
         7oBw==
X-Forwarded-Encrypted: i=1; AJvYcCV2HX69PwdQz4V2TBsjG2WuvMVS1jNjhGgGnjlXCfULQxw/gWxSb8pAAseiymZS6Q22iOOtbFIOK4/pCRKW4vpu@lists.infradead.org
X-Gm-Message-State: AOJu0YxeOi5xvNxo5ZcLx7OfGLWdrIVUDIVBTFwNUig62ZuLDbZ1lQiQ
	x4IwtqNw+ZT7mLbr2RuCeJergIOYVkME0EMQFxIaY6KC59YTQigfbMh0XEdr8YyadiM=
X-Gm-Gg: AY/fxX6RT4dm7Oze++toyIl0WVYGvXrhefu2G5s8Y0h8eWdvhl19l5odjTcENBHZa1L
	vAff3cs4fRB1h/oidG3HY3/WoRW4nGiABih3Q91Slz/KPgsOX9tqwYAf9a5OBFeDSOeI08W50fh
	GBNigSFtilNLFYs/iPpdO80pdDDjrVOjragiA4HcnAD+ZzxtSGXkX+rPZ3oWSGPypR8jAIRIgYd
	PpXQ+5inRrGE7eFpw8rbg0NcjFOR5d7zxmnpeuTQC5Hchu6HApXU87h3UityGqDNt634r1vuZx7
	naG1uCzvsLnWo1hhI8UOHY1ZMkP1SNqeVZ1OoeHh62MCQ2G0oc3+pJiUowlvD3+y5cFR1UeSQLz
	u1rCyboEClxxw09KCa+Y7CrSypTrLH77eRJgI6yewg51GBgCG+rEOC2zk1CaVwrV+uKc0cGQXS/
	EnDwa5TuMX
X-Google-Smtp-Source: AGHT+IEVw/SMrnYS2cOO2tMjNOVxr1/A+HqYsJSdrqzmCDrLk/jonm+qx/H22wDBUNlHq/f3K6UqXA==
X-Received: by 2002:a17:906:d551:b0:b84:200d:15b5 with SMTP id a640c23a62f3a-b8426bb8790mr406180366b.31.1767716547453;
        Tue, 06 Jan 2026 08:22:27 -0800 (PST)
Received: from localhost ([2001:4091:a246:82fd:4350:c3d9:84a3:70dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a2340a2sm266826266b.5.2026.01.06.08.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 08:22:27 -0800 (PST)
From: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
Date: Tue, 06 Jan 2026 17:22:10 +0100
Subject: [PATCH] arm64: dts: ti: k3-am62a7-sk: Disable mmc Schmitt Trigger
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-topic-am62a-mmc-pinctrl-v6-19-next-v1-1-1190ac29aadb@baylibre.com>
X-B4-Tracking: v=1; b=H4sIALE2XWkC/x3NwQqEIBCA4VeJOTeghgPtqywdzB13B9JEJYLo3
 ZM9fpf/v6ByEa7wGi4ofEiVPXXocQD/c+nLKJ9uMMqQ0oqw7Vk8ukjGYYwesyTfyoYHoZ4x8dn
 QhImtpSmsq4UeyoWDnP/Je7nvBzcHj4l0AAAA
X-Change-ID: 20260106-topic-am62a-mmc-pinctrl-v6-19-next-2f3e5563fbb5
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4118; i=msp@baylibre.com;
 h=from:subject:message-id; bh=A2mAWoAH+naUozBaIfs4pgf2PbMEbZdWu7l+93SxTY4=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxYs93nf6Y+uKp7T/HFWnndZUdsvn+urNgYueV9i3Z9o
 tmFNVImHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjCRnjSGfxY5wry7Wf97/xNQ
 8Ly1935mZZBVWSvjt3n3ua5YNPpVdzH895rjXCDU61o/y6lw6pb169Y5zO+qdTl2lfWv57u90a4
 NfAA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_082230_159179_B7DAFB24 
X-CRM114-Status: GOOD (  11.43  )
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

Remove Schmitt Trigger from mmc pins. With Schmitt Trigger enabled
u-boot SPL is not able to read u-boot from mmc:

    Trying to boot from MMC2
    Error reading cluster
    spl_load_image_fat: error reading image u-boot.img, err - -22
    Error: -22
    SPL: Unsupported Boot Device!
    SPL: failed to boot from all boot devices
    ### ERROR ### Please RESET the board ###

I bisected this issue between u-boot v2025.10 and v2026.01 and found the
devicetree merge to be the problem. At a closer look I found the
k3-pinctrl.h changes. Disabling the Schmitt Trigger fixes the u-boot SPL
failure to read from mmc.

Fixes: 5b272127884b ("arm64: dts: ti: k3-pinctrl: Enable Schmitt Trigger by default")
Signed-off-by: Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 36 ++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index e99bdbc2e0cbdf858f1631096f9c2a086191bab3..9129045c8bbd3a83dba6ff6f2148a3624b91b546 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -315,30 +315,30 @@ AM62AX_IOPAD(0x0b4, PIN_INPUT_PULLUP, 1) /* (K24) GPMC0_CSn3.I2C2_SDA */
 
 	main_mmc0_pins_default: main-mmc0-default-pins {
 		pinctrl-single,pins = <
-			AM62AX_IOPAD(0x220, PIN_INPUT, 0) /* (Y3) MMC0_CMD */
-			AM62AX_IOPAD(0x218, PIN_INPUT, 0) /* (AB1) MMC0_CLKLB */
-			AM62AX_IOPAD(0x21c, PIN_INPUT, 0) /* (AB1) MMC0_CLK */
-			AM62AX_IOPAD(0x214, PIN_INPUT, 0) /* (AA2) MMC0_DAT0 */
-			AM62AX_IOPAD(0x210, PIN_INPUT_PULLUP, 0) /* (AA1) MMC0_DAT1 */
-			AM62AX_IOPAD(0x20c, PIN_INPUT_PULLUP, 0) /* (AA3) MMC0_DAT2 */
-			AM62AX_IOPAD(0x208, PIN_INPUT_PULLUP, 0) /* (Y4) MMC0_DAT3 */
-			AM62AX_IOPAD(0x204, PIN_INPUT_PULLUP, 0) /* (AB2) MMC0_DAT4 */
-			AM62AX_IOPAD(0x200, PIN_INPUT_PULLUP, 0) /* (AC1) MMC0_DAT5 */
-			AM62AX_IOPAD(0x1fc, PIN_INPUT_PULLUP, 0) /* (AD2) MMC0_DAT6 */
-			AM62AX_IOPAD(0x1f8, PIN_INPUT_PULLUP, 0) /* (AC2) MMC0_DAT7 */
+			AM62AX_IOPAD(0x220, PIN_INPUT_NOST, 0) /* (Y3) MMC0_CMD */
+			AM62AX_IOPAD(0x218, PIN_INPUT_NOST, 0) /* (AB1) MMC0_CLKLB */
+			AM62AX_IOPAD(0x21c, PIN_INPUT_NOST, 0) /* (AB1) MMC0_CLK */
+			AM62AX_IOPAD(0x214, PIN_INPUT_NOST, 0) /* (AA2) MMC0_DAT0 */
+			AM62AX_IOPAD(0x210, PIN_INPUT_PULLUP_NOST, 0) /* (AA1) MMC0_DAT1 */
+			AM62AX_IOPAD(0x20c, PIN_INPUT_PULLUP_NOST, 0) /* (AA3) MMC0_DAT2 */
+			AM62AX_IOPAD(0x208, PIN_INPUT_PULLUP_NOST, 0) /* (Y4) MMC0_DAT3 */
+			AM62AX_IOPAD(0x204, PIN_INPUT_PULLUP_NOST, 0) /* (AB2) MMC0_DAT4 */
+			AM62AX_IOPAD(0x200, PIN_INPUT_PULLUP_NOST, 0) /* (AC1) MMC0_DAT5 */
+			AM62AX_IOPAD(0x1fc, PIN_INPUT_PULLUP_NOST, 0) /* (AD2) MMC0_DAT6 */
+			AM62AX_IOPAD(0x1f8, PIN_INPUT_PULLUP_NOST, 0) /* (AC2) MMC0_DAT7 */
 		>;
 		bootph-all;
 	};
 
 	main_mmc1_pins_default: main-mmc1-default-pins {
 		pinctrl-single,pins = <
-			AM62AX_IOPAD(0x23c, PIN_INPUT, 0) /* (A21) MMC1_CMD */
-			AM62AX_IOPAD(0x234, PIN_INPUT, 0) /* (B22) MMC1_CLK */
-			AM62AX_IOPAD(0x230, PIN_INPUT, 0) /* (A22) MMC1_DAT0 */
-			AM62AX_IOPAD(0x22c, PIN_INPUT, 0) /* (B21) MMC1_DAT1 */
-			AM62AX_IOPAD(0x228, PIN_INPUT, 0) /* (C21) MMC1_DAT2 */
-			AM62AX_IOPAD(0x224, PIN_INPUT, 0) /* (D22) MMC1_DAT3 */
-			AM62AX_IOPAD(0x240, PIN_INPUT, 0) /* (D17) MMC1_SDCD */
+			AM62AX_IOPAD(0x23c, PIN_INPUT_NOST, 0) /* (A21) MMC1_CMD */
+			AM62AX_IOPAD(0x234, PIN_INPUT_NOST, 0) /* (B22) MMC1_CLK */
+			AM62AX_IOPAD(0x230, PIN_INPUT_NOST, 0) /* (A22) MMC1_DAT0 */
+			AM62AX_IOPAD(0x22c, PIN_INPUT_NOST, 0) /* (B21) MMC1_DAT1 */
+			AM62AX_IOPAD(0x228, PIN_INPUT_NOST, 0) /* (C21) MMC1_DAT2 */
+			AM62AX_IOPAD(0x224, PIN_INPUT_NOST, 0) /* (D22) MMC1_DAT3 */
+			AM62AX_IOPAD(0x240, PIN_INPUT_NOST, 0) /* (D17) MMC1_SDCD */
 		>;
 		bootph-all;
 	};

---
base-commit: 6cd6c12031130a349a098dbeb19d8c3070d2dfbe
change-id: 20260106-topic-am62a-mmc-pinctrl-v6-19-next-2f3e5563fbb5

Best regards,
-- 
Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>


