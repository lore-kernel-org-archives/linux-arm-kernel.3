Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5CAC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 17:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NtDV2qePoVhIO7myU7o4OO3ITr/ClHLDVz8qgdkxKAk=; b=UrdXMv7CAprCuAkvqGttQfhd7u
	sjXCGWPeK1Rzsd+PDwTwvOhbTD2AXZRX5QBV3IDohBBXK8pykZQhxUjxKqMCpY06bqEhHozaJ5EH+
	NT1N+Brcw6jx4jXjUSKtRHRrlG1+vqEVXbUc7u5DUW+5KQENpx8EbCMqeRXmSyDRVgcUDLJ/TS4Md
	rda4e1ZE2JnkKY+MdcxokRIvTPx70hud+AmN4Aoclv8TiU0Z1SU5V9EFTt3v1xiFhkgAL5FO7GVt1
	GtaAvpjDdnzVV+ZeKUM6vv8s/3J8VQK5hUlXxhzXnzS4n1+YmBkgsWE5Qm/t/vtbIJZnvKHUU3U0o
	AYI1B6AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuwmB-00000009caZ-1v92;
	Wed, 19 Mar 2025 17:00:19 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuwcH-00000009atg-0AHP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 16:50:06 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so2210791a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 09:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742403004; x=1743007804; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NtDV2qePoVhIO7myU7o4OO3ITr/ClHLDVz8qgdkxKAk=;
        b=e6djNKnSogxhHZu6AspFDTSZP1ZEbnwGXuxK7T4KuA/SpXFLFi5N6qoJIOg+MUSdsK
         OB9o3nm0t9aQpxpBHc72Gbf6Vb3ORvMV174DJ1BsPVDD/F8MPUEvE1x2xxOm0aJmmBII
         MF93MntoVmKZC6yQHnC44rn3WWPl71ASsN+6iD99qGEEWuFmYrhjJv8rwJJW4JIA1KQK
         wxJ3s92ikJB4i/OPt/GqfjlJubejPNQCDWAS8mWGYJiLXRLgQNpfmDrHrmfPXxSAUAH9
         Bx4qTPpchI4dGGqZY1Bzv+14eN+Pm0OF1u4L2YBVqs6FIbd6bkrOETnV9+Zc+OR2Mb9I
         08Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742403004; x=1743007804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NtDV2qePoVhIO7myU7o4OO3ITr/ClHLDVz8qgdkxKAk=;
        b=HyMJeIEj5FwZDbn2Lezgt88G4lyuNLC1XPvUaDRGwGZSWjLR/DwGciPnFZzZjQxEQl
         FDD3NfD9MO0XzKbPEHzRCLJ6CEetYML/YOH6xV+8ADFkaR0VsKJLcvAtP9i2kayj8uNw
         ja1ULxqhaZcanWjf3vEgFU1Gny0CA2iCecojIt5PcuaQrgoyZVF0oyDdN9lsZH7G3kM/
         pq/PoPKCkVbLYeA6xwdyq0Avtb6+g/3P6T7GvbCpPhVINoYVZV9vOCJa++2m+e/QsttI
         gyRD7QlVLgkbLEC8BZwTctD0WiLjF0ZNZIwB4q7GvsNBcdZ+3cIqWyU7NB7Goryg/xEm
         rynQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnljs5r+KuStGzqJ3ZmN/U9sFGFelW0RCabr5aNFWL+xK69WgWgVhNZlKVOzu57LcgJAViu3KiXfnO+UXnL7Xt@lists.infradead.org
X-Gm-Message-State: AOJu0YycRWP8hiFbxmuOwoXgUIEeSgO1aSPGD0tM0LghL7q+xBzfSPJy
	9S+zJXnr7CXaW0Cz6KHL3oCVFMm1YQS17I3wltDF6S9sQAT0peKk
X-Gm-Gg: ASbGncv7NR1PkkdlWD/aU1/KvqfOAI3eWqxXhm+2Zns0BnS8YgEZEU0s5+yihK62RBp
	UKGrjG/7aoKpzIiXgAWBuUYvuualSQCs91m8gbJR++x2Ic+Ml+mNew5n7ToKCFq6sfUnXGjMb1b
	t4IrphOBA1/Q5Y/UvL0Bx3goGYbmorySyI8tm4bkvM+YozUSUgIIvKj8sn6P9iOHYatTvzXt+Gb
	bPjiDZ0wZB1lxdTkb6HHjhlXoWgS/d28rS3+IdMKwbuZ3HavVs+DLIu4X/PGrSPrf3dtgnwBaop
	HQ5GjJw3YTLs1UEAdYVbwC1v33DxmPuLn30UNLiVFdkYkDHLQzgspXY73twfuEWA9LrTcMoLgJS
	Q9XEZZbZ7erOZyqEGi/8317wb/sQfcKrS
X-Google-Smtp-Source: AGHT+IFN4xqZ1OLU99SGczgLx2oieKzcfT0iY6TvB3Y4MQWRTtuA9YjNQIktJCnp+uH4ztiFhzc8GA==
X-Received: by 2002:a17:90b:2dc7:b0:2fa:21d3:4332 with SMTP id 98e67ed59e1d1-301d43a269cmr281466a91.12.1742403004071;
        Wed, 19 Mar 2025 09:50:04 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf576bc2sm1863641a91.5.2025.03.19.09.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 09:50:03 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 20 Mar 2025 00:47:26 +0800
Subject: [PATCH v4 5/8] ARM: dts: aspeed: catalina: Add second source fan
 controller support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-potin-catalina-dts-update-20250102-v4-5-7c34b8139014@gmail.com>
References: <20250320-potin-catalina-dts-update-20250102-v4-0-7c34b8139014@gmail.com>
In-Reply-To: <20250320-potin-catalina-dts-update-20250102-v4-0-7c34b8139014@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742402988; l=2445;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=h3bH8SXx0sv5QPMnsoufX0caq8JBi/sA4S632p7NQak=;
 b=FByKFEmN9gtAF1PY9hztEVRBx/ZpnMOF38icLce2VbtLLN3YjWOo+vR6jPl0ZMfIInOn+oiMg
 xOHUPTmqUKEAHo/98tsXfXF43X1ak7YIUHl+IJ1W2/Ac0Z4hscbZBn6
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_095005_085526_5ED0B91E 
X-CRM114-Status: GOOD (  10.83  )
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

Add device tree nodes for the NCT7363 fan controllers on the second-source
Power Distribution Board (PDB).

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-catalina.dts    | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index 0b513829f2de..e11be815a6af 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -527,6 +527,82 @@ i2c1mux0ch2: i2c@2 {
 			#size-cells = <0>;
 			reg = <0x2>;
 
+			hwmon0: hwmon@1 {
+				compatible = "nuvoton,nct7363";
+				reg = <0x01>;
+				#pwm-cells = <2>;
+
+				fan-9 {
+					pwms = <&hwmon0 0 40000>;
+					tach-ch = /bits/ 8 <0x09>;
+				};
+				fan-11 {
+					pwms = <&hwmon0 0 40000>;
+					tach-ch = /bits/ 8 <0x0b>;
+				};
+				fan-10 {
+					pwms = <&hwmon0 4 40000>;
+					tach-ch = /bits/ 8 <0x0a>;
+				};
+				fan-13 {
+					pwms = <&hwmon0 4 40000>;
+					tach-ch = /bits/ 8 <0x0d>;
+				};
+				fan-15 {
+					pwms = <&hwmon0 6 40000>;
+					tach-ch = /bits/ 8 <0x0f>;
+				};
+				fan-1 {
+					pwms = <&hwmon0 6 40000>;
+					tach-ch = /bits/ 8 <0x01>;
+				};
+				fan-0 {
+					pwms = <&hwmon0 10 40000>;
+					tach-ch = /bits/ 8 <0x00>;
+				};
+				fan-3 {
+					pwms = <&hwmon0 10 40000>;
+					tach-ch = /bits/ 8 <0x03>;
+				};
+			};
+			hwmon1: hwmon@2 {
+				compatible = "nuvoton,nct7363";
+				reg = <0x02>;
+				#pwm-cells = <2>;
+
+				fan-9 {
+					pwms = <&hwmon1 0 40000>;
+					tach-ch = /bits/ 8 <0x09>;
+				};
+				fan-11 {
+					pwms = <&hwmon1 0 40000>;
+					tach-ch = /bits/ 8 <0x0b>;
+				};
+				fan-10 {
+					pwms = <&hwmon1 4 40000>;
+					tach-ch = /bits/ 8 <0x0a>;
+				};
+				fan-13 {
+					pwms = <&hwmon1 4 40000>;
+					tach-ch = /bits/ 8 <0x0d>;
+				};
+				fan-15 {
+					pwms = <&hwmon1 6 40000>;
+					tach-ch = /bits/ 8 <0x0f>;
+				};
+				fan-1 {
+					pwms = <&hwmon1 6 40000>;
+					tach-ch = /bits/ 8 <0x01>;
+				};
+				fan-0 {
+					pwms = <&hwmon1 10 40000>;
+					tach-ch = /bits/ 8 <0x00>;
+				};
+				fan-3 {
+					pwms = <&hwmon1 10 40000>;
+					tach-ch = /bits/ 8 <0x03>;
+				};
+			};
 			pwm@21{
 				compatible = "maxim,max31790";
 				reg = <0x21>;

-- 
2.31.1


