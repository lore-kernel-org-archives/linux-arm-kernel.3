Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE29C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Jun 2025 03:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ACa23R2a+vWrpVNOMeXLchvOc5aLFqZI4f5KCyJMeas=; b=Kr2Mzp1AOIWx62ShOZEIHj7vTd
	3qrPbTvGyG89J1vZfNNHN8PBanzhPEwUf/d6ty6Y+6vPl/XVIICVqhZDO/fd3pQCBK130DPXsAjVf
	VvYtqgqpJ5WPMNNtpgmog8w/dX1l5hMHZotg1q27LxaQmv9kd/xiuGutfmPDvchu3yVPzpb7K76pw
	nlyzRxULL5XhIc7BngM14nWJZONSVFfBmuD5yoZVCvZxGoyIaQ3F73d66FmerGN5LZtIUIdN1CSTJ
	4EjykFRlPwVNib5rbz6VIMFVYJjbeEiouJu6HwPMscUhzsOW0K7LyjBTD1ke+1irqRB5zpPAHVMb4
	1XO6Xg6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTBds-00000000UjI-1IZh;
	Sun, 22 Jun 2025 03:45:16 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTBbc-00000000Ucc-0TTb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Jun 2025 03:42:57 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-311da0bef4aso3265034a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Jun 2025 20:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750563775; x=1751168575; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ACa23R2a+vWrpVNOMeXLchvOc5aLFqZI4f5KCyJMeas=;
        b=LJkQfSr1B6/B+/8EVC4tY0AFNNcZwWn/30T4d6B3xftbclcT+nUwfGLFkaBgdNjx6R
         QOfqogpXE39uB7aNXSdXVfUsF5Gn0Sp2O6DjCBR2JkxtUvOYD0gotBzp4oXVY7QKbwAk
         ZHWrUeUY5O2tlLXFpXmLSHxVuzeZiwfy9SqHm6ecSOlC8X5ZwUpO+zL2mCN2YP8bDZcR
         Gx6Q/cKz6nOQK10yV3M/BwjO4/kg0zB3AaJZIOZv4i6x5AiIo6PCVbHBrV85HByOgoO8
         bwyfQLPhJNXcYHLOuysQye8cDTMPEDVksb6DCbyDXC2RBlR1+swIMGUZ94H0KcggTq46
         MtRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750563775; x=1751168575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ACa23R2a+vWrpVNOMeXLchvOc5aLFqZI4f5KCyJMeas=;
        b=eh92QYw49bLuzmGJh/nsRHDwrQ5KPX8bml0PxAASb/NcTrc7VG7ECq/lYqcCX4I5aQ
         p5tf0/MsPL98LHHzuywcgrD/a1NuzzoTFzNPU2jIAvx9ms2NmUJ2NsXIGjZyWEWClXiF
         jo9p+g09nyCoM0JW3jDWNK4a0glWxI5X4Jkf1oUyzxJ6l93zMJkyOxcYmOwujUM650ah
         BuazmvoE2iPTcMku5V60nRAXgzrHSDpNGKo7LNYyKnlrRyFdhbhueJ472bIpwBXYu7bd
         AMI+I9fo/jP/twUUVVqRRYbGHgRdlCSiflPmP1/mAPs6ti+KvYaGuw00cqBpNh5wrYmM
         MHZg==
X-Forwarded-Encrypted: i=1; AJvYcCUZpEQNOx2iW6ko8ZeFUTbrOaJC0FA0kBeQFRM8NyMdq/0jsaMb01j1R11ZrOFpCCc9oa91JuMxiNsSbIJ6KiUq@lists.infradead.org
X-Gm-Message-State: AOJu0YzpVs/PgTseR07I5MOt9SecmEk9DvblHKzHABrPOfTbBIvD1WKa
	Kpg/Cvbxm4VJJVM3ls41L5A2tVSUJeCWY3if5cEtELCTQrPrnDo/0dPu
X-Gm-Gg: ASbGnct8LyOm5Xnsfbr8M4TqMnu2rPLP2JsMqrg8Y6tY8UyMWKGQRhxFCZXPEL+f4IJ
	6BmDRDoRB+LN9ba9GC3jrtixWq1726u3C5RdLRgSPRq6GRHymQmrkuki2QJTFyo6UU6ckyI88kY
	jvOD3Udhb+Ce9GWxzBpU458J2LEnwt60RHkN5KKq9i/G8JETWkviUxVQJNPD4Fz1wuGN2geBSXb
	GYLfLk+l2gabLMAVgtficu8KKL2hZw273ZrvQC7bB1gc3bGXotPKRaMtDTjbU8Y2CO6xwX26fDp
	QNCEueDvz5mTKM5hOzpvZp/AHhIlv9WwAgqgpENOAo8r4IPfE5CJA+H45/5ThrAj8Mdr5hts38b
	0wmYBPfxO/V1b2kASh1w6Pci5E0OCNxs7BAxCG2Fcr4RshlDYs8B+g7EXD0J/0y+r7VJ6smpVWw
	==
X-Google-Smtp-Source: AGHT+IEpj0VOlzI9r7mWn9sjy0q/1s9TFnZUb9JfOL27IcJREPBlXh9zEia6LgG2v+7itLsR3B9dEQ==
X-Received: by 2002:a17:90b:2703:b0:314:2a2e:9da9 with SMTP id 98e67ed59e1d1-3159d8d661fmr11658363a91.25.1750563774425;
        Sat, 21 Jun 2025 20:42:54 -0700 (PDT)
Received: from cosmo-ubuntu-2404.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a333a79sm8222291a91.45.2025.06.21.20.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 20:42:54 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	chou.cosmo@gmail.com,
	cosmo.chou@quantatw.com
Subject: [PATCH] ARM: dts: aspeed: bletchley: enable USB PD negotiation
Date: Sun, 22 Jun 2025 11:42:47 +0800
Message-ID: <20250622034247.3985727-1-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_204256_148140_83D01992 
X-CRM114-Status: UNSURE (   8.87  )
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

- Enable USB Power Delivery with revision 2.0 for all sleds
- Configure dual power/data roles with sink preference

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 .../aspeed/aspeed-bmc-facebook-bletchley.dts  | 66 ++++++++++++-------
 1 file changed, 42 insertions(+), 24 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
index 5be0e8fd2633..ad0051825a32 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
@@ -398,10 +398,13 @@ sled1_fusb302: typec-portc@22 {
 		connector {
 			compatible = "usb-c-connector";
 			label = "USB-C";
-			power-role = "source";
-			data-role = "host";
-			pd-disable;
-			typec-power-opmode = "default";
+			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x20>;
+			power-role = "dual";
+			try-power-role = "sink";
+			data-role = "dual";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			op-sink-microwatt = <10000000>;
 		};
 	};
 
@@ -484,10 +487,13 @@ sled2_fusb302: typec-portc@22 {
 		connector {
 			compatible = "usb-c-connector";
 			label = "USB-C";
-			power-role = "source";
-			data-role = "host";
-			pd-disable;
-			typec-power-opmode = "default";
+			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x20>;
+			power-role = "dual";
+			try-power-role = "sink";
+			data-role = "dual";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			op-sink-microwatt = <10000000>;
 		};
 	};
 
@@ -570,10 +576,13 @@ sled3_fusb302: typec-portc@22 {
 		connector {
 			compatible = "usb-c-connector";
 			label = "USB-C";
-			power-role = "source";
-			data-role = "host";
-			pd-disable;
-			typec-power-opmode = "default";
+			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x20>;
+			power-role = "dual";
+			try-power-role = "sink";
+			data-role = "dual";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			op-sink-microwatt = <10000000>;
 		};
 	};
 
@@ -656,10 +665,13 @@ sled4_fusb302: typec-portc@22 {
 		connector {
 			compatible = "usb-c-connector";
 			label = "USB-C";
-			power-role = "source";
-			data-role = "host";
-			pd-disable;
-			typec-power-opmode = "default";
+			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x20>;
+			power-role = "dual";
+			try-power-role = "sink";
+			data-role = "dual";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			op-sink-microwatt = <10000000>;
 		};
 	};
 
@@ -742,10 +754,13 @@ sled5_fusb302: typec-portc@22 {
 		connector {
 			compatible = "usb-c-connector";
 			label = "USB-C";
-			power-role = "source";
-			data-role = "host";
-			pd-disable;
-			typec-power-opmode = "default";
+			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x20>;
+			power-role = "dual";
+			try-power-role = "sink";
+			data-role = "dual";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			op-sink-microwatt = <10000000>;
 		};
 	};
 
@@ -828,10 +843,13 @@ sled6_fusb302: typec-portc@22 {
 		connector {
 			compatible = "usb-c-connector";
 			label = "USB-C";
-			power-role = "source";
-			data-role = "host";
-			pd-disable;
-			typec-power-opmode = "default";
+			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x20>;
+			power-role = "dual";
+			try-power-role = "sink";
+			data-role = "dual";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			op-sink-microwatt = <10000000>;
 		};
 	};
 
-- 
2.43.0


