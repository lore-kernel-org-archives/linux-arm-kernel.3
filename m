Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCE5CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 14:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OY4GJHvVYK+N5LUJGUaOnp3q0oNX2or2mbmIQLdKleU=; b=gYDW5RGMeW9BAQNDSOJeMcsgDF
	ryTdjI4gCPJ/9xgLR8ktUe2fBXZPTFMj7IFINLY0KUZT9yY4YLwYc12t3qBTSyhNbw5+wIpYI22UX
	XlTHE/3rgum0ft/rAyVmt/L0ICiymA3vTqtaxvIpmDl6j3RAzennphzaqjetaFrXoZWNwY76z5eaN
	Qhy7KUz5B8UKLHUKbNov8hUlLwS+6C747kLQLf/JncXhI9cqGJ4qvSEYlSsbbbY0sbXtZbsox+H/x
	w/496AoE8MxGSER1rPgYAwbNBfi24cus1y07cRjfVUSb6aIIAamZ1+ITsI9eh+3SpFvfcD31CvIi1
	SevFISIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSbQ-00000002kyM-3A2U;
	Fri, 22 Aug 2025 14:18:48 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upL3J-00000001fdT-0ulw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 06:15:06 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b476fedd9dcso1191070a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 23:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755843304; x=1756448104; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OY4GJHvVYK+N5LUJGUaOnp3q0oNX2or2mbmIQLdKleU=;
        b=hu/5Ng/lMWv1HJvR6o+nx/vqyzMMIvHSpl90x7kzR3QBHm0et6s5F3sy+U4/6Gtj9b
         xuZtXwBTrgVZtbEa3ElD/uQZjBq2Gp9RUqaY9s+M1lpQSIX1q1EvTV0DjRyAbCPB/AzI
         yLfc62MDRUIwddnuc56it7VfA0iWE8Jw4cYBsXagh8oBIxyrXQU43nBTnZn+AomuE2si
         WjPO/hOXuB7z/PuhFPWJbNzRMkPdzgBOirSIp8U1x3vHZGpgGbXOHG2+yw8u5tahwNFP
         DJFwxpL387C+xyj1OlZ2zHF6yUDvKJeHRXbyNQoHNW1HHpdKsEbwSw2WnCKC/9BGirov
         p35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755843304; x=1756448104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OY4GJHvVYK+N5LUJGUaOnp3q0oNX2or2mbmIQLdKleU=;
        b=JcAXfvyzhA3fA0U4yyaxnnFeJti/B+3Yg14AVnTCdvMXeVHBUNwd9IJNHs0SfsRGTi
         p0wk9RNjpFwmaBtzQl4jv83+tl2M9cx/MJdGTy7+SZQYcGohAKI/R2iQ93AagQkB5F+K
         7v4gAlw2F9VJml+z9yzc11ruu5yzcB7F/qY0p7dmmZqUKk3Z/bPSvTEKM4wWkhcem+if
         UFWlzFCEKLMIQ/7RILd0j2Ss7Tz2mePOsKG9jBcTUAcA0cHuFe2hyKTmRfyWDi/K7k+D
         rdE8dAsjAvRM8kh07druckcG00S4zPIoKYVY1Ci344oUBoLS1kwOtfI+hCAagCDJ0Cno
         SY9g==
X-Forwarded-Encrypted: i=1; AJvYcCW7qSzfu9CADVc1pR84dW2ws67i+7i566LJu2c8XRbvZCF5TDg5GrI9R+4Lyx9wtAuQrEaIl0yyacjqoyWEkcWm@lists.infradead.org
X-Gm-Message-State: AOJu0YwfbOYTRhEC/GQsHSEwFVRfRb4EjX6o07R01QPkCG5WMU9pKxKL
	eWRmDMhgpUj2l8inXvyddCcMSgmkYjWTTbGvSCeIEbof2xvIhL28rZHj
X-Gm-Gg: ASbGncs6GyYAY8oybTaCfMDWIdB6tcziEKUEwBiwToNkr7aSDwu9cSIe/dYelCTPk0Y
	9JD8N6VHDP5qZR00gpa++iFA7z/+vpHXthY1SnpIB49x4fAKHfYiyF7i0OB4SRZC4evsJQZLLXa
	sOEcLi9aZVBsRepi/9on3CdWGd/r0VgVRj4cEB6ReTtOIzpAnielOsyYqv2wEptrrbQMtB3/Rq/
	ZilAnIYv4qKgGKAaB+zWAFhLNM+aIv4iQrSbavBT/6+nl3lreZ5rRDh5Y2snuI4Y7+0I+FQTEut
	B22M6YhPLTAUWPfnZiuSeBQwNXv10AKl5fbeYnEMU9M1EAF3ENkzGS9qwLTVJG00lravVrWDD5g
	fIZx6B3vShG2lUcXGcv/FE16wkcKDDV8/J6SFq+xMnmTywsQifp0n9R+enRNlCcDHT1S9v06gQN
	gdC58if79o2EQqQ7dwszgwQ6MzMxN5
X-Google-Smtp-Source: AGHT+IEX8roGyBHGJ/i9ej1bGUzipkk+L88noriLAZ1+JU3Yv/i6WVdaBF5O/2TerwAvPB7SMxG8mg==
X-Received: by 2002:a17:903:2ac8:b0:234:986c:66bf with SMTP id d9443c01a7336-2462edd7d39mr20587355ad.11.1755843304375;
        Thu, 21 Aug 2025 23:15:04 -0700 (PDT)
Received: from peter-bmc.. (2001-b400-e35d-8041-a0f2-62d1-f7aa-e5b7.emome-ip6.hinet.net. [2001:b400:e35d:8041:a0f2:62d1:f7aa:e5b7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246181c48c1sm28660385ad.116.2025.08.21.23.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 23:15:04 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] ARM: dts: aspeed: harma: revise gpio name
Date: Fri, 22 Aug 2025 14:14:52 +0800
Message-ID: <20250822061454.2610386-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250822061454.2610386-1-peteryin.openbmc@gmail.com>
References: <20250822061454.2610386-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_231505_255900_EC1B662F 
X-CRM114-Status: GOOD (  11.52  )
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

Update GPIO label definitions in the device tree to reflect the correct
power and control signal names. This includes:

- Rename "fcb0-activate" to "fcb1-activate" and "fcb2-activate"
- Add labels for:
  - power-p3v3-standby
  - power-p1v8-good
  - power-pvdd33-s5
  - power-pvdd18-s5
  - power-asic-good
  - power-12v-memory-good

- Replace unnamed GPIOs with appropriate labels such as:
  - irq-pvddcore0-ocp-alert
  - irq-pvddcore1-ocp-alert

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 21 +++++++++++--------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 741d2d9b6d03..81278a7702de 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -234,7 +234,7 @@ gpio@12 {
 		"","",
 		"","",
 		"","",
-		"","fcb1-activate",
+		"","fcb2-activate",
 		"","";
 	};
 };
@@ -308,7 +308,7 @@ gpio@12 {
 		"","",
 		"","",
 		"","",
-		"","fcb0-activate",
+		"","fcb1-activate",
 		"","";
 	};
 };
@@ -698,14 +698,14 @@ &sgpiom0 {
 	"","",
 	/*A4-A7 line 8-15*/
 	"","power-config-asic-module-enable",
-	"","power-config-asic-power-good",
-	"","power-config-pdb-power-good",
+	"power-p3v3-standby","power-config-asic-power-good",
+	"power-p1v8-good","power-config-pdb-power-good",
 	"presence-cpu","smi-control-n",
 	/*B0-B3 line 16-23*/
 	"","nmi-control-n",
-	"","nmi-control-sync-flood-n",
-	"","",
+	"power-pvdd33-s5","nmi-control-sync-flood-n",
 	"","",
+	"power-pvdd18-s5","",
 	/*B4-B7 line 24-31*/
 	"","FM_CPU_SP5R1",
 	"reset-cause-rsmrst","FM_CPU_SP5R2",
@@ -749,7 +749,7 @@ &sgpiom0 {
 	/*F4-F7 line 88-95*/
 	"presence-asic-modules-0","rt-cpu0-p1-force-enable",
 	"presence-asic-modules-1","bios-debug-msg-disable",
-	"","uart-control-buffer-select",
+	"power-asic-good","uart-control-buffer-select",
 	"presence-cmm","ac-control-n",
 	/*G0-G3 line 96-103*/
 	"FM_CPU_CORETYPE2","",
@@ -801,7 +801,7 @@ &sgpiom0 {
 	"asic0-card-type-detection2-n","",
 	"uart-switch-lsb","",
 	"uart-switch-msb","",
-	"","",
+	"power-12v-memory-good","",
 	/*M4-M7 line 200-207*/
 	"","","","","","","","",
 	/*N0-N3 line 208-215*/
@@ -809,7 +809,10 @@ &sgpiom0 {
 	/*N4-N7 line 216-223*/
 	"","","","","","","","",
 	/*O0-O3 line 224-231*/
-	"","","","","","","","",
+	"","",
+	"irq-pvddcore0-ocp-alert","",
+	"irq-pvddcore1-ocp-alert","",
+	"","",
 	/*O4-O7 line 232-239*/
 	"","","","","","","","",
 	/*P0-P3 line 240-247*/
-- 
2.43.0


