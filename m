Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A39C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 00:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Jcyaehq/+QqsulhvvKI66SG0KEO38Prj04gQdC0eF4=; b=JO2htCSdmmefVnPJQthBnbRi+H
	NRvIvQLpAwhrTHrHV1FFEn+UQZY7CWsygoQRP3ohPrKtpC/MqXLHkuJ9mLuAA9yOoL5mWcIMRVkr8
	wI3eEzDDJ+L6qjvk91ShSS30Ds0+7Ca7RSDXJIRTbjt8y+4sq1oLPtEvAnkXCINjJigrKXVOkx14t
	DhnEMW8STwmc0Z4agzlLsn6groKAdpThAoGJIMf0AgojuTGrIuPHd/+qCUmW1/9/vdzIl7sVACw3I
	EEHfeC+VlIf/gMG0yDYZ356m/u6ArxHX2V3PD2BdlT8fWIn+oHo/w/ltYkBZKCdTf1tDJWh5KwgrX
	u8HvedMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whcy3-00000000fnV-47HQ;
	Thu, 09 Jul 2026 00:50:19 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whcxw-00000000fkH-2vwZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 00:50:13 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2cca24023edso5205635ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 17:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783558212; x=1784163012; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Jcyaehq/+QqsulhvvKI66SG0KEO38Prj04gQdC0eF4=;
        b=YgqIoHJY84uEb3Z0pb/H92VG5BiJ6liifV79lVGoAYZwFmZzNc8BoKUxgCUE0Im5T8
         YBwXkQuVUeUbsfz7qn3PFtyHXnHoC8yqaVZMo5Cv6DqjGkhNJNTAfIJ82CQmWUiwA+ad
         PvBcmEzqvql3mnD98/Gm+v6zyekLy3xETvFR59w7Klg2zw+/GKU+qh6pxguO+tEttSdb
         B9vq8lZqJ90wEKKyFNSOjWepbAZlFKHYmbppcHT0MO2UL8+3ktfunZQmf94bjbBGTQwa
         ZrBgQv8g6T959nv/1ouJvyLTX2oRvSgD1+NH0S85kmSbi00pDoUIBAzgOA0KmhTBE/Vs
         OMmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783558212; x=1784163012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Jcyaehq/+QqsulhvvKI66SG0KEO38Prj04gQdC0eF4=;
        b=XO89Ai2gORhAxV8PR2+vg+WPWIbIJehQ7u50CtmV6GSmMWAkuUfQGlu883DyVnjgIl
         PW1mO3GOQnxJ1WgOLThdayUvVRKu7iNdzQxxW736Zw9Ari5d/WJJZg9lWQrcKUG2L6jQ
         oEqyH/wLLB4vStdSbQYVg4Fj4CIgnlIY1AZsOT8YG3l2UKHVPJ1BwiaQhophNcmJFPRm
         BZB75QY5UVFu8N9SgDIi/VL6SP0+EZYwNRlLyYLzW4DaIEQMaDocBWr8psFY7fOr5r+n
         oNWM1YaGowV8e/1kGV+u8GPM18UCJAq1WE2aubXYzmStnfwMxqHGCDjFwLpjCI/LTOE9
         /oqw==
X-Forwarded-Encrypted: i=1; AHgh+RqrZsap62HxIqIEyPKXUSyawW8aFTA1AsWgd1lcj1IcipLFi3hpWIm76QjMnvBROgKkokElvO0skgnUw/twTnKD@lists.infradead.org
X-Gm-Message-State: AOJu0YzrJhIG/4uKW38SLSebTSC9jsOTAWpQumEtdFDm9pu7KOy+mwIf
	ZPrblIZUuGMra2Zj4WTtbN9fU/q7WMOEwaNmPZtTHrYSypiFbD2QN/TTavNXug==
X-Gm-Gg: AfdE7ckBuWfHsCt0vf2scS2LkLlzrDBfsQN8tjatojzZyG4sGycWp7dJ8y1S1gE1dwF
	7onsXX6Vo+ep7jn/gBJr+SnBDaYIHGOn0YySnfRc/ukKYyQLkci90M0QNv45I9ueOcxzKZh5LTA
	wwzaRkXwZM84gkxgcs/GtBcYi5xGwG/uEhu7I9m7D8NzPrmdyCJsST3AbA4U64spaZufRmSL3jf
	zw+DWi8hj7k52TkQm6FW1X/td8HcVp8F+MdYfRj1c06tF4Z5D0pboPsxnFlCmfUGghHDyGWxX94
	I1m6lR4E6wtI4oeOAInGSLM40nu/zbDVxv8iSk1uBMZqVJespVaY1wDBuxDYVaap8NkdxEATiAW
	1FPm4oKE0/TMiwxrhJKOj2bK/72N7ven8EhTeBdPZ3Tz/5BgVYQxybKVQK85Vfnus9LOj8Utw8U
	muJUYCn8Oiukj95C1YUnFn6xFAuJ2BfowC5obyPwV1W6oumJBfnG25wFAFRgPcNrYK3rFYjva95
	4muHoBRETTEch/8vkM0OV6u6THwvuVAqlGAFu0CCoVrAHvx0y02Rz+jlxpKIa0WrmKL5Oog/9sf
X-Received: by 2002:a17:902:ef08:b0:2ca:d151:383a with SMTP id d9443c01a7336-2ccea3ca6bdmr51355305ad.20.1783558212088;
        Wed, 08 Jul 2026 17:50:12 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d59e51sm35604605ad.76.2026.07.08.17.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 17:50:11 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 3/3] ARM: dts: helios4: add SATA regulator supplies
Date: Wed,  8 Jul 2026 17:50:05 -0700
Message-ID: <20260709005005.1587852-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709005005.1587852-1-rosenp@gmail.com>
References: <20260709005005.1587852-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_175012_739668_9659EFBA 
X-CRM114-Status: GOOD (  10.45  )
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

The ahci-mvebu driver and libahci_platform request three supplies
on SATA controller and port nodes:
  - ahci-supply  (controller power)
  - phy-supply   (PHY power)
  - target-supply (disk power per port)

Without them the regulator core prints notices at boot, e.g.:
  supply ahci not found, using dummy regulator
  supply phy not found, using dummy regulator
  supply target not found, using dummy regulator

The SATA controller and PHY inside the Armada 388 SoC are powered
by the 3.3V I/O rail; the four disk bays are powered by the 5V HDD
rail.  Wire the existing fixed regulators accordingly.

Fixes: ced8025b569e ("ARM: dts: armada388-helios4")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index cf0432a0e71a..626a7339a5d0 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -222,13 +222,17 @@ sata@a8000 {
 				status = "okay";
 				#address-cells = <1>;
 				#size-cells = <0>;
+				ahci-supply = <&reg_3p3v>;
+				phy-supply = <&reg_3p3v>;
 
 				sata0: sata-port@0 {
 					reg = <0>;
+					target-supply = <&reg_5p0v_hdd>;
 				};
 
 				sata1: sata-port@1 {
 					reg = <1>;
+					target-supply = <&reg_5p0v_hdd>;
 				};
 			};
 
@@ -236,13 +240,17 @@ sata@e0000 {
 				status = "okay";
 				#address-cells = <1>;
 				#size-cells = <0>;
+				ahci-supply = <&reg_3p3v>;
+				phy-supply = <&reg_3p3v>;
 
 				sata2: sata-port@0 {
 					reg = <0>;
+					target-supply = <&reg_5p0v_hdd>;
 				};
 
 				sata3: sata-port@1 {
 					reg = <1>;
+					target-supply = <&reg_5p0v_hdd>;
 				};
 			};
 
-- 
2.55.0


