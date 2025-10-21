Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A6FCCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 03:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MIc5Jk6uXrpT5vKhUN3R3BidtAKxdUPzX/dU/naleU8=; b=3DybIJ00cid8dFG10+YJBN+IKS
	Esif/To1Ov1OHqHTrJlLiZScVREoGj5GVhUCYVnj9C02Il0V7PgYdbEPAl9Yz6RcQUgOrRLG1bRm3
	DXRPz77KqP3FeNh59uqFYhl49VokWfmpmbJPnhDE84QL8GjhFoSzJIvd/Rij0GDzHJDlnkLLIqb1H
	Uy8ugkkQaAcm+oIAAd6dCdRxqY6SGaWTO3GlsM0RetyzO3aMz7/yWWLGHlv9qVgFY0/FZgMmEw/DM
	McrgS6rfV4nkBZGqxWtPf4CSsFg2M+I86E3ybTqdyhbhGRzPeV7oaklMGztW3W9DSUS5kN3PTxWPm
	NXx+PUjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB2qp-0000000FgZT-1aOZ;
	Tue, 21 Oct 2025 03:15:55 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB2qm-0000000FgYk-12Tu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 03:15:53 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-28e7cd6dbc0so63712695ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 20:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761016551; x=1761621351; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MIc5Jk6uXrpT5vKhUN3R3BidtAKxdUPzX/dU/naleU8=;
        b=cA7lvjdTzEhG6amWXzosoz5PhdFLSTbCCpRd92iDrkxWAo2/TzUt2pPD5iGRgdYVEM
         6IstwysjOw2QdvQBhiWD7htoi4PRlBgYdJ/4u/vGaebTVG4gq0x5Wv3yq+bD8IetixRy
         uM2zPe5m8+uUuOamwJWZDoIGn9+NPUJH4g1qv8UQj54tOVCQTaIp/Xr9kbfTDCT/oIph
         INl1HbZ9iz6d0poY+p6DWVlZpSoyOrC59gj+oSqQ4EGx8lrafODi6of00X0uSeDN+s3c
         1Iv/oX8z+iy987+CL7n212kIByHcmfWfGvoldeWpVb070QLEUDaqGforqBJ5GWbw3Npl
         GuWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761016551; x=1761621351;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MIc5Jk6uXrpT5vKhUN3R3BidtAKxdUPzX/dU/naleU8=;
        b=YrfFb0sPfXOm+epimiKfPwBY6x4DBciabWNwNjSznqzFGdF4ggZ9Ovkol11c3khf3b
         YJJ+rQ0o+74W25CPN61piWPu3rC0kbN68nuOk0+m+zNzzS4FlgHuH66FdmXgWUAXfp0Y
         RM4AjS0plRDwhWcGKG8akmPiBe07GyFe7xJri+91EI77EBoBCy6LFAogjPoP6GLlOeqV
         Zp5s1z73+2GxzhDZLkZhVKBEF3buvvJJOpjJKj/WLz5v8arbBpkDmUrPs5gAfh2nVuLG
         67DfFmOiL9ZPR9//c//dLziIE6JWfuvVFQ2kKO0ihDg9Hfu3VLiYok2v4ulmXXr6evcV
         l9yA==
X-Forwarded-Encrypted: i=1; AJvYcCVXXEf2sRt8x1MUbyBznVD1p195rnU2R/l5MDNkQEkhIjqjPXFgXs7K9P60Zcrt/y2jYwk+I4B19FCyq6F9twUe@lists.infradead.org
X-Gm-Message-State: AOJu0YxS9w0VNvOElm8i7qkCclAexBPekyDaZYAJuMqFWoa2I57I8Vl0
	mQt6EIFX51dSaRk4twtSMcVQDkeu1B5HAjR7wZJEAVPBHVfRYWTzIJNF
X-Gm-Gg: ASbGncv97FQR2ViSqZN4WgCkjKTTmvDXYlz7jZwCIRFXbDOTmQzvvI9W3rN/OY7KUHQ
	RCp5h/gYT+z325ewSGxlGujuh8j09NYL1I4a0UnTUMqG+bf2ZjUVuABIUWj+PWECDp1D0dGwcdk
	o4wJgCYijGAauwB1qx7Xhd+WUHUA1lhUNKdmGid9RxUB7NIAI4/r6IoQLUDkGDAUT6CSMOD6GDF
	OXotxrjNI9SyYI/AjrabC3BwTy8yla5kmlxw+ccfw5HpyZti0svZbKZxuWav8ZyBbldrls56CAl
	5t8nzvvcW5i50lFKZB6bvFedcmKRT/O/Jm1rtqvieGA1wCXa94UbL1VCvRIK7KEMyyIk4MOMFp8
	DAeyYIxah+3S3Yn4092V0zDRygDIDKzeZRExqeJVZMP0TpUJxA1ToFr1x8bNSCFORZynvet7wWS
	p/SRQDOVGXkUlEQnlanOdeOKPO0DOjTzEBB6Yj
X-Google-Smtp-Source: AGHT+IHvc2OdIns7Dhqd5TV4LyvC/HJfGjCUatzoXh06HQxZAcairq7EJA2klU28lcwGsK1CQQDx2g==
X-Received: by 2002:a17:903:2b0d:b0:272:f9c3:31f7 with SMTP id d9443c01a7336-290cbe2ae84mr56298125ad.50.1761016551034;
        Mon, 20 Oct 2025 20:15:51 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246fcc2b1sm94889765ad.27.2025.10.20.20.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 20:15:50 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
Date: Tue, 21 Oct 2025 11:15:39 +0800
Subject: [PATCH] ARM: dts: aspeed: clemente: Add EEPROMs for boot and data
 drive FRUs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-leo-dts-add-nvme-eeprom-v1-1-33166b3665b4@gmail.com>
X-B4-Tracking: v=1; b=H4sIANr69mgC/x3MQQqEMBAF0atIr21IZ3REryIuxHy1YUwkERkQ7
 25w+RZVFyVERaKuuCji1KTBZ0hZ0LSOfgGryyZrbC3GCv8Q2B2JR+fYnxsY2GPY+CPfqpG2bid
 rKNd7xKz/99wP9/0A40cKRWkAAAA=
X-Change-ID: 20251021-leo-dts-add-nvme-eeprom-316471959c20
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 george.kw.lee@fii-foxconn.com, bruce.jy.hung@fii-foxconn.com, 
 leo.jt.wang@fii-foxconn.com, Leo Wang <leo.jt.wang@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761016548; l=2272;
 i=leo.jt.wang@gmail.com; s=20250618; h=from:subject:message-id;
 bh=FozCj5Qtilnm6MTFQqUJJBi0+f5aDzs/7epoDnQr8Rw=;
 b=8BInr5iA6wBDcAL4sY8DnyKW4muBdm9myjKyhrNgz4zvC7PgZByz+aciemOqaw2l3lP+Dk17F
 WiRuYEfnT9MAdWDDJm8CfcmcWioWtAmA94gNx57lZN4uJoHCmtiSswe
X-Developer-Key: i=leo.jt.wang@gmail.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_201552_294330_CA8D27C9 
X-CRM114-Status: GOOD (  10.64  )
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

Add EEPROM devices on the I2C buses used for the boot and data NVMe
drives. These EEPROMs store FRU information for each drive, allowing
the BMC to identify.

Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-clemente.dts    | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
index 450446913e36b1418fab901cde44280468990c7a..885c50a7d66593dfa8493d2d031700174b452382 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
@@ -311,6 +311,12 @@ i2c0mux0ch1mux0ch0: i2c@0 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					reg = <0>;
+
+					// HDD NVMe SSD FRU 0
+					eeprom@53 {
+						compatible = "atmel,24c02";
+						reg = <0x53>;
+					};
 				};
 
 				i2c0mux0ch1mux0ch1: i2c@1 {
@@ -323,6 +329,12 @@ i2c0mux0ch1mux0ch2: i2c@2 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					reg = <2>;
+
+					// HDD NVMe SSD FRU 1
+					eeprom@53 {
+						compatible = "atmel,24c02";
+						reg = <0x53>;
+					};
 				};
 
 				i2c0mux0ch1mux0ch3: i2c@3 {
@@ -493,6 +505,12 @@ i2c0mux3ch1mux0ch0: i2c@0 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					reg = <0>;
+
+					// HDD NVMe SSD FRU 2
+					eeprom@53 {
+						compatible = "atmel,24c02";
+						reg = <0x53>;
+					};
 				};
 
 				i2c0mux3ch1mux0ch1: i2c@1 {
@@ -505,6 +523,12 @@ i2c0mux3ch1mux0ch2: i2c@2 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					reg = <2>;
+
+					// HDD NVMe SSD FRU 3
+					eeprom@53 {
+						compatible = "atmel,24c02";
+						reg = <0x53>;
+					};
 				};
 
 				i2c0mux3ch1mux0ch3: i2c@3 {
@@ -619,6 +643,12 @@ i2c0mux5ch1: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <1>;
+
+			// BOOT DRIVE FRU
+			eeprom@53 {
+				compatible = "atmel,24c02";
+				reg = <0x53>;
+			};
 		};
 
 		i2c0mux5ch2: i2c@2 {

---
base-commit: 6953afcd81a2cc73784e3dd23faa0a1aaf97441a
change-id: 20251021-leo-dts-add-nvme-eeprom-316471959c20

Best regards,
-- 
Leo Wang <leo.jt.wang@gmail.com>


