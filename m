Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF950E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 00:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PyIc6yU4ZfdiFedyh3OQtgtht6mvw6kI7JI/5pE8Y2k=; b=OYuu8XZiFoUfFr+PR9rS7PgOHu
	mBDDG7XZLA57Z4X3LI0UW1HFWOlY7EAOTKpOEMuO6yDI1i0jMjSk3oj3DVw83K7xoggrfzLDFtyCE
	DxbGR0aaHoEI6ZQC/2byoajrAQDRBYzaO0g4hVMmlD6SaMBr5V0UAJzNLCZdKBFcflQ0oMz/ZB8xO
	ocbu8XCFff7fiviQOlaxzPcQvLvQBLiU1xcrI8QTJXYOrfOc+d/5UDhR4uLWTfqB4UkyVL50kZthu
	s+ltQDHplCc+xYgrPX7x0KDAGNGLUdDr6q8rdd3qyE7n/3MiwoJbuFg3G/7X/CoOETrOhkIPsQwZs
	PwwqltGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVg73-0000000AD7T-3LC3;
	Thu, 09 Jan 2025 00:09:25 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVg5f-0000000ACwQ-2qqP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 00:08:00 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-518957b0533so119933e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 16:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736381239; x=1736986039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PyIc6yU4ZfdiFedyh3OQtgtht6mvw6kI7JI/5pE8Y2k=;
        b=guV2U94egvv+xTISiREBrUcUfHwxdLy/yiFkBwDnDtSnLxdJAFMBPOOScpEvDf1+n2
         IKjEoD25TkM5+JRJl1RyWUREchp3JiCWQkurNoYljZRB9Ii9pszyhamGbrPGFclhKsWS
         ruLQL2UY8xXk8dwFc8GyEM2sXrDtaIrnRHggJDfYXwyku0nDm047RpDaMjUDT4p1VaDv
         Ww+xQsMZquRNk3oH1C8+c/Cm8o12pOf6ZJfjE5Q5QC/4hJS2ACWi7ooMLt4WFkxblHlB
         AVL+Pdu+PcV4/gQ08D81zhISJTh3F8WDW0r2KVHQPliMZIG9GSrixaDazAEkNEXW4jvx
         he5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736381239; x=1736986039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PyIc6yU4ZfdiFedyh3OQtgtht6mvw6kI7JI/5pE8Y2k=;
        b=BP/vhNq9lRBCcJEMfxZVcGX9tvuEIyY4x/iz7HuB+7tkQ68kve/dCn3tfTMRTzOyWz
         R/lJAo2jXrB0YO9a2LpH4PM5dRQIhKruGMM9zIPgVkcDCUaYPCnCbo6kEXY+/kQTr0kZ
         /tGRXz9I3t/snoTlMsk8VKqo+Y1nq8xRDWv2HxtDjzz9/6Mr9UARrb3dpbL2XVPDTBDW
         toKr5zUwzJ4N6PzsHTprCgKgxDiASB2CO96meA1TmjaKp92MmuyShymh8H4nxK+IKA2s
         0CkxtpaBCQS721NVTrmbAvmRBbezJc2MJqp7QPyTYL58XQOz9xC0E8EFK8iDblcgNeGr
         4j8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXuF4dhPej53DmvWSiTMye8w9HCZrM3GiPG0LSyxndZQzMfWAQz1B4hQ404bLupc4qJasbOQxMeQMnQq9Gqvh7p@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6lsq94qMkrT1daBjEUiFwu9XfXdpwsIfTX3CurSUlGA5pehFu
	mDPA5l+faWSdGppj4DkKkC9dzrLXRFjXRzc5oj+RFi8wRMiJBIBOffg1/w==
X-Gm-Gg: ASbGnctn1j6ySNy73SAEwtfh1jXyZibN+wfeXxnCCd4k4jeXoa46+NBUVhToXn7KR4R
	RkUa0+CLFHBX4ZJ+nZ8X1cR5UUovPS+8Wzr8wl49053EKGdIe/ZYqwMAvN+yspX9Rai8XfygEz9
	BtfI5AHEYCZbnVSwFY5JZlI1qwBuKzJ0TXUfWm4293DHWgcBGdVwzuXRTNuMOYXaV1+lJ/Bmqel
	xNl4ZW9ckele909cvzmT9faew1i7CWFW1RCA4yzmvAOSk18L4qK9aFcaDBQWusyYCy9jA==
X-Google-Smtp-Source: AGHT+IHrcsxJGuJAbLr5VyzTnPtT7aOD4fYARPdNYasi2ld9gikWaoi/cMWLDjA1ZSO9YrZKefwOnA==
X-Received: by 2002:a05:6122:510:b0:515:daa7:ed07 with SMTP id 71dfb90a1353d-51c6c1cd3dcmr3762486e0c.0.1736381238565;
        Wed, 08 Jan 2025 16:07:18 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:32cc:f64f:9e3:fa63])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8623154b10fsm18121241.23.2025.01.08.16.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 16:07:18 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2] ARM: dts: imx53-ppd: Fix touchscreen reset-gpios
Date: Wed,  8 Jan 2025 21:07:10 -0300
Message-Id: <20250109000710.45574-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_160759_716426_8255095C 
X-CRM114-Status: GOOD (  12.31  )
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

From: Fabio Estevam <festevam@denx.de>

According to atmel,maxtouch.yaml, the correct property that describes
the GPIO connected to the touchscreen reset line is 'reset-gpios'.

Change it accordingly to fix the following dt-schema warning:

'reset-gpio' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Fix Subject.

 arch/arm/boot/dts/nxp/imx/imx53-ppd.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx53-ppd.dts b/arch/arm/boot/dts/nxp/imx/imx53-ppd.dts
index e939acc1c88b..2892e457fea7 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-ppd.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-ppd.dts
@@ -593,7 +593,7 @@ &i2c2 {
 
 	touchscreen@4b {
 		compatible = "atmel,maxtouch";
-		reset-gpio = <&gpio5 19 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&gpio5 19 GPIO_ACTIVE_LOW>;
 		reg = <0x4b>;
 		interrupt-parent = <&gpio5>;
 		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
-- 
2.34.1


