Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36ADD3EE84
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 16:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/R070KT8oROqLN3BFkqXY5hruM9USOWGp5+1iDcDEUY=; b=vs+JwhlZiJzsblDlrVpdEncEFM
	G/vr/X4y+oD6F8JMdJ5t9ym5yCN4aZNmKLqXtVQ/dHBH3eym59S5X3J2vHFIr9ZR6CTBZYjPahb5G
	QnNFSz0WciGs2QDcriK3EBuJXkAit4qbzhUcwmE73maMwHJ35dGNLhD7ckQad1Th9N9Rjp+de9mg2
	Epoq0OMnuYLxVVTOSgmYOsoPRNK+V4jdvlRRXC1uiog9wM5iR3P93B3e/L2p6e6futYEEPIoTTuev
	FgkonvjuHGkBvui0JdCF/cG7UXQGpPx0ZIM0I30d3qw7HJmU3i7evn/Xo8Emd3PrJ3EDSImc2YJ03
	JT4ke1dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixOa-00000007Pn3-00Vl;
	Thu, 22 Jan 2026 16:18:56 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixOX-00000007PmF-1xFT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 16:18:54 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2a09d981507so8014485ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 08:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769098731; x=1769703531; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/R070KT8oROqLN3BFkqXY5hruM9USOWGp5+1iDcDEUY=;
        b=E33+tKwajBBO7TbWDdZRVIXAcy1IzioD8ayq0/F8Szmn/xz0qeLJtmVU8Bi64Vep/2
         FU9XttPxQRyw6TczvoCFb0BSaNEc7QMa5F4ZaOv0sODVB2nnyKt1hwq23wUQeXoccm3d
         TlQKNniSdaoaPs6vov7AJayddtkjvyGIarTWcS+95CoqOdYSN8+mhDU77kklxCgcFs+o
         GUM0LnIFDiV0gtdTQAsc/YEgY00qM3f7E9MtdoWcT13PQcNxEX6DqLQ5iAQFQbEN6644
         2EPrNJ0vEsmuzo25DfS6PDWbcS5QQgAW0tw3n3OsL7+6tjah37yKcv3Nr0Q2xeOzy25n
         E0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769098731; x=1769703531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/R070KT8oROqLN3BFkqXY5hruM9USOWGp5+1iDcDEUY=;
        b=u48tiw++o91nnwHanhU43TWW0gKaxROV+DYMany+p37StLnfV7a9Eh5j4ub7Z3wn9w
         QZb8CwMcHGgK+PxDQheVjZUwMjyJ7ST7niCcH+PKmToVMB09VW15MgbOtkAgZGTsr6ee
         ZvLtpZk5xau2dBhBNu0cNlETlUgpi1sStrJIghv7A79jfhEEGmNZwXZSlE7ji6jOtDWJ
         etyoufLGSXyyZwlsMSl/1LLqLAMglOMVBOhIv5HunZ+Lks3VdE/zbDnCNueJflvaiWb2
         vho6Ahl6mJ/5Jys0tRny2CJY2lUXGynDrhvV1PR7+zwyVMaPtHjpJPplTbbIo5rsHbK1
         P16A==
X-Forwarded-Encrypted: i=1; AJvYcCWLvrH0wUN81QFTQv4wpoLQEK30JM0nXUfvLPJE2m3pfh+XYY96CsJ2UjCk2OY4a8kOyQtYycV4gxrmvuViN/8O@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0xQNs5+SzxGdrYiTWoSBy95q/vWlxXbraB2pUUNfTkbWCny4p
	DYIAuWdwmC+MKFRyg+NvCGgOFcLeZ8/dcagammx/uaMwiJgjCFq0QDVx
X-Gm-Gg: AZuq6aJ7qnhnOTZ5inpX4OWVCWFlAyUeY43wW7Y/j4YyN0T9K1xU5PXI271GNX8K6Sa
	rZcBBevmYSHOkEKFWfbQ5w1xz9PlcYs8J1d4fwvOrA8W7m4iPViSOwqitZQJaQgQVAQe9kTvsb8
	uteqqQT4TluR3yjWJtGQMCSgrhaSn3MsLrYciTXoaya9Wu0SPfFXlTB7KrAn/tTKB6wp94dZcZV
	PoKI0YOoqpC+PHn1Uf+SXQ7yADwi67oDL57sGYpD0CG71FyAYo2kSSscaGSmE573DWeJTvKYEZ4
	22rsfXI6bSUMQB0Rzzy2eNYc1+kX99i0nlGlJrgBn5TeAG9Ryo9o7xRba47d0t19Ann0CcTjIFc
	tyLb4AWc0aecdAutVm3Zo80cBlFt7bdc+jkmfFo4AJ2OAOzvSMxPH6sncR1LxfIDLMQ1vHpEvHS
	/LGpHPQmKGdF0P+Y5ifQg=
X-Received: by 2002:a17:903:4b0d:b0:2a0:eaf5:5cd8 with SMTP id d9443c01a7336-2a7d2f17f93mr28973445ad.9.1769098731446;
        Thu, 22 Jan 2026 08:18:51 -0800 (PST)
Received: from localhost.localdomain ([58.29.79.238])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fc8d9sm186704275ad.79.2026.01.22.08.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 08:18:51 -0800 (PST)
From: Lee Yongjun <jun85566@gmail.com>
To: rjui@broadcom.com,
	sbranden@broadcom.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Yongjun <jun85566@gmail.com>
Subject: [PATCH] arm64: dts: broadcom: ns2-svk: fix AT25 EEPROM node and properties
Date: Fri, 23 Jan 2026 01:18:23 +0900
Message-Id: <20260122161823.105404-1-jun85566@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_081853_509891_C1C78D36 
X-CRM114-Status: GOOD (  13.36  )
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

The AT25 EEPROM node on the Northstar 2 SVK board used legacy vendor
properties and a non-standard node name, which triggers dtbs_check
warnings.

Update the node to follow the dt-schema by:
- Renaming the node from at25@0 to eeprom@0.
- Replacing deprecated "at25,byte-len" with "size".
- Replacing deprecated "at25,page-size" with "pagesize".
- Replacing deprecated "at25,addr-mode" with "address-width".

For "address-width", the legacy value <2> corresponds to the EE_ADDR2
flag in the driver (include/linux/spi/eeprom.h), which is explicitly
defined as 16-bit addressing. Therefore, <16> is the technically
accurate value that preserves the existing hardware behavior while
satisfying the at25.yaml schema requirements.

Signed-off-by: Lee Yongjun <jun85566@gmail.com>
---
 arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts b/arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts
index 5939d342aec7..c4412c6b4cef 100644
--- a/arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts
+++ b/arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts
@@ -127,13 +127,13 @@ slic@0 {
 &ssp1 {
 	status = "okay";
 
-	at25@0 {
+	eeprom@0 {
 		compatible = "atmel,at25";
 		reg = <0>;
 		spi-max-frequency = <5000000>;
-		at25,byte-len = <0x8000>;
-		at25,addr-mode = <2>;
-		at25,page-size = <64>;
+		size = <0x8000>;
+		address-width = <16>;
+		pagesize = <64>;
 		spi-cpha;
 		spi-cpol;
 		pl022,interface = <0>;
-- 
2.34.1


