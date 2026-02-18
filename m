Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC88E9A047
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 09:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kaGLSRpxc0PwvRXRwcqPDUYsmksUtvC6Qds08OlyDTE=; b=buAo9qpqVI3vAuO4zwtqscqcB0
	fuy0FOc2hibjcx2rHg1IrsFBW0A//WSyzFyTcb9OuAsDpAoAxingoLpAKEuFJftsy4OcCfCRLXxw6
	ogFQS3HJNkmAq6oYVXrUA2QsKCD3+1WWE3hp2PjaS0bRRimpbOmDqlsvR12rX5RiVZY0ZYCDWc7XO
	l9vtHe0RkBhHvWqmexOmj48C6uaaylutXulrSet17IHiiy+yZthZPx+qMyveaoIOu6KZBCPq7RHPk
	KZQ+6h6vj12xGXuMkMpsnMhgcx0XaY1IMp5X3KCDo87s1g+WPTbiVMkod8rSLDEYQJmLzyKM6wbaV
	YPZ3aquw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdtg-00000009YAF-16KT;
	Wed, 18 Feb 2026 09:31:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdte-00000009Y8p-1iUX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 09:31:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2274E40951;
	Wed, 18 Feb 2026 09:31:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8296EC19421;
	Wed, 18 Feb 2026 09:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771407062;
	bh=J9fuLojC1G2g7o93daeDt5Fd/kAMP9PYlARTX3qeKHA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EYb0Tp20NbQLGYUfG6wq8TGQSU0H5FtfVirOU7w1K0ndHH77Dv9COVKhPsd8ArznR
	 NLaHVlSkU8LbZuxWzcPARjAY+QWSR7nkncq4L1BmfijI3I7lXeZ53DKon770wzAmqf
	 UTkvd4bgypZOsVXP6kA4OFE/Xbr58MNAzgGubFSM+uLsaqFTld7YU3UtBDJ9RSvGlY
	 ANYxPEA0ox3ezJS5KTE1VH3ynpAMzeWu6CdjwD+zsU/uaWJKIZQhD7TnMS9ibkj8yI
	 dWvi6JgWsC8p+VOT/CfMogFmdIz6T4XnaRzlEkBTY0gvLaaEwlezP/sZdFsXnntne0
	 zEWVHA5Jbe2fw==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 18 Feb 2026 10:30:52 +0100
Subject: [PATCH v2 5/7] ARM: dts: bcm6878: Add I2C bus block
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-bcmbca-i2c-dts-v2-5-5373ef82c50c@kernel.org>
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
X-CRM114-CacheID: sfid-20260218_013102_475902_EF1A4B35 
X-CRM114-Status: UNSURE (   8.80  )
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

The BCM6878 has an brcmper I2C block.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/broadcom/bcm6878.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm6878.dtsi b/arch/arm/boot/dts/broadcom/bcm6878.dtsi
index 5a37bfd7f53f..e7fb45ae1d49 100644
--- a/arch/arm/boot/dts/broadcom/bcm6878.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm6878.dtsi
@@ -239,6 +239,15 @@ nandcs: nand@0 {
 			};
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
 		pl081_dma: dma-controller@11000 {
 			compatible = "arm,pl081", "arm,primecell";
 			// The magic B105F00D info is missing

-- 
2.53.0


