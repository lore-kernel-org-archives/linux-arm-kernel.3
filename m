Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FCFEE57CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 09:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vgzrS6iAvFIUlLKBejM9CRNPYbscxZNKJWP8/12+9Yg=; b=Lg58wWPrxx2qaO9TjTyMRPZMPf
	dDLuac8lJ1ajgEcALmOF1wlCxwO9tbvS3gSkpoD53q9g3wHqlCAzZr9GQZRlwj9kPQ0VWDdXd9DXI
	nhNrKlonWCo+JP3mblryorSUJ/s+BvXQ2Bt4fWeRgmn2TT9ffg/5Jrcqxjt7xdY0mj4HzOiLCbueQ
	AzOvj2Sbwop1jL85S46neGAgbhptN8520i62RVhDuH/UhLitYoFRcdQFX+1NnVg+16KZAL8Sn+XVJ
	8Rj9xs6ypGHktW5XcEan4r5NWTlIZGaLQA6Dv8Sp+Wx3mdm2DTNdzQlc1XRBJyRL0oIkKNh+jQzT6
	HHp9VOxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEah-00000006jHX-1KAh;
	Thu, 01 Jan 2026 09:03:31 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEad-00000006jBy-0fmp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 09:03:28 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso15255909b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Jan 2026 01:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258206; x=1767863006; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vgzrS6iAvFIUlLKBejM9CRNPYbscxZNKJWP8/12+9Yg=;
        b=aE7UXzyllimh/vyBxDSNwCDa6Ay2sAsjrBmb5ge77+vcxoRsfP70HoecUB1vbbkBgZ
         DilQbgJIPgye/7TrLzgUOntIclpBgvNSF9wVLe+QTKVhI5B9WicZqqR7X6YcTBb7zrgq
         OqsUm7VSVfWTI7uTaAD+8JGABbu/TJMFbBY+yb6sMHH3Y4FVVLC+WSESYMY+61Bvekgv
         AURuxgCeYhnVy33yUYuSCGOBZCRHRWrq2WlTaXB6piwIOGZ8Pfb+TurzSIeDR4pRTHbi
         F6OdlDjdlWpMJJ5UCZ2EW+kWrHB1/emOb8Mx0KAgtAHK/8l+2QBi+8OAtwbiyJwnJnG6
         J1lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258206; x=1767863006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vgzrS6iAvFIUlLKBejM9CRNPYbscxZNKJWP8/12+9Yg=;
        b=M9bk7ZHwdvG7El0mpo6X7g7sVe4y02/0aD3C5Oy4X2KURe2Pj++o7Hr7EhwfknaAe4
         0CeJOwSdjQfRpVy9PDXIfegi5gODhO6ybf9VrLnr2GorrjE2C49OosoVD9BpL7prbbco
         lQOsDuh13G5se4uBStl9JYS8wcatU6vkL/I54arkiVKXiD204FAJA+fEWjwy1cMn7WEB
         zCJSBRBPPpbbwHgJhlR8ZiooNZisK/1vhfitp76wMJatgOt5iNHHOGSmDfliApIF+PZC
         LDD7j8EpiiQOcC/ZEehEPfxBgbPZUlh637UrD9hz7Vdbdh+buJGmNvTVkBpHTmZ+r+L1
         qFvw==
X-Forwarded-Encrypted: i=1; AJvYcCXroZ973cuwwGkEWjghyqS/D0oHV8uTTipCaHkWQA15WZ8sVU9toWM/89WUep67SfFbYmIJ6RJWNrR2DMu++8X6@lists.infradead.org
X-Gm-Message-State: AOJu0YwblPl08seqNaBIzaYJOkL+jIRWOv//G2Eu7P21X8g8AU9pKxN5
	PV0sg+fXI0GFHi2yfKHmYOPQJ4RGMX74nQ+GqiSsXO0DTOTCZreoqzZH
X-Gm-Gg: AY/fxX4AtT5XYyhjHccRYYAhrwvhbVZRyyMhWVftS6Mc2gDKtciWFTSY18HrEOe44h+
	Sf0CX5FqDM8ft7g9TrOtHHIhWDOudCAWj+dPKt3N9X90K2z01gKM1mCW5vIVX+mIMaMmdr+B9D8
	MZPgnorltXcAO/MC5FmN1yRL6+OdqkIJHvSd/TN/pknJW6E9tAV0yBEb1WjpMQOwgeXgEyOC9Z8
	NFbb1ApQZ2Sbqm8dSM7JnKRiClL/76Pn++RzJ4UQ9LfBJa1EVGL/BGV7FhIA0+kg87p+ElaMFuX
	FmBAxq4IxPr2NrpX5Ioa2ezy/s3ksiIFalmQm7KX9upd2Az/2qrN1BRkPMX1nN850lJZPw9r8rc
	MSREY1H1w82mM5HX0DJtKGLPizE2E6aoq7FIr3s8rUotu1VKKRRc91BGZbmpp9YI47yTXiF7hKG
	wrsuHvF/0ZcOm8
X-Google-Smtp-Source: AGHT+IEA8A3zig71SDu0G7W/IVJ2/rh1z0era57GcwjPTkXa9sJlf6YO/DffuIhThSfawYNdiguECw==
X-Received: by 2002:a05:6a00:ab09:b0:7e8:4433:8fad with SMTP id d2e1a72fcca58-7ff6667b6d5mr37774388b3a.53.1767258206449;
        Thu, 01 Jan 2026 01:03:26 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm37182957b3a.39.2026.01.01.01.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:03:25 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 01 Jan 2026 17:01:51 +0800
Subject: [PATCH v10 15/21] arm64: dts: apple: t7001: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-apple-cpmu-v10-15-48812c529ffc@gmail.com>
References: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
In-Reply-To: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=946; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=8i2WC0AFNRoAyJx9LwHHLdlMc3fQP5/vwmujapLLxro=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpVjgoOPfHtMsOAsiJKy2RAlYxRutc4/IfGlOpr
 6nSyF0xe9iJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaVY4KAAKCRABygi3psUI
 JB3PD/9pfTa8LS1pIxQ2OvHZ5LKbz813YPJzHm97C5F2nFhIHy9H2UmYu4wBfnwSR60fyjGNfvn
 Ck0ncncFeFSNCllr+Tr1e/s2b6/BzhncgdjrCxuRfe1ip8rs4gbv3GICpHKa7JgFrfaoUvbjoLY
 X8nMbiOnVEqVsQ1oIMAdB8aiT6On61YHrRZNdt9Vp3JBw4fVZfn0G48JyyCsaNdeX7+zszZImoW
 +e49+fwpaoLD0XEvwK50ej3LScCvFzeC35qf1/THnDtt/Cb4oxenYY0ewKKOmvI3EHUikOb5fgl
 JmF6OBsESH0/lwe4Bqc7cvvPb6IC678xurUSaQN147BDPcIp/2W4iYSLJGkmzRiUnTZsyksfW/9
 Dv8B+r/cgzkvukbptzOpAUrpQ8K5ze4H+nk9Cy7p01PnJwdamIgsL2hoKZQuDlPvCly/1MVy0SJ
 Ths0xtEiSMgbfiEz4I+9sfExwgILd3uN7IGq3+TihpjMzlwaolYTc6SG3oY9w0JA759dqDFn+0u
 TRf4yRqLfyKN6lyWiQNnix9YtHmgsdg2KoVwr3jbDBCwjaoga7mvUg9A/ecJWzI/WG2Nj0vpho+
 tw+PLoDNWPpBGibqADGwQk/nhVICclVHqfRanZEXI38v3D+Fo+tZdvHSBdCxbc9qyliv5IL7VLJ
 35egjrAeqTTyliQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_010327_232015_AC8E6BCE 
X-CRM114-Status: UNSURE (   9.63  )
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

Add CPU PMU nodes for Apple A8X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7001.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7001.dtsi b/arch/arm64/boot/dts/apple/t7001.dtsi
index e1afb05423698223ebc15f2ae347e73fb46c7c24..b62122ea40f00a54ae42dc3cd0f864f25888489c 100644
--- a/arch/arm64/boot/dts/apple/t7001.dtsi
+++ b/arch/arm64/boot/dts/apple/t7001.dtsi
@@ -275,6 +275,15 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,typhoon-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 75 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 78 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 81 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1 &cpu2>;
+	};
 };
 
 #include "t7001-pmgr.dtsi"

-- 
2.52.0


