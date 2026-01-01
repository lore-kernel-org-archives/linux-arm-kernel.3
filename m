Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E052EE57CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 09:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JJ2g7x+wr2VIeqIG6aJACDKejjD/eomNYXl10MONUeA=; b=zq8Dxcm02/Yxtebgdc/r9iAh1R
	mDIVpbUfAcv55RvSsz+VJeriFEPZe9uyXTFasXRSY0j6guNjfF9hLKYk2k1gBIjYyT8PIlWg5yXyC
	78tQ7lnRvL4Y6sZs/vb1lt2p5Yw7+36MLAwdt4gV6VPne0h9XzAGz2bicD4l5FsqKMRGqT/QNCn2m
	XKdafwlfIicmZ9W+DNoBEwOy4ttKcGRh6ZVXKeFwSVflRWLXUxsdWzRNhRZMHtPfGhM0zMrfD+okX
	pRd4klf05U1wR7U/CG2UoiO5o8d/SKslVEh2jBTZYxRQNIw952fcHhgRXgIgMlsTUAJoOVuQAUpXp
	JfWMdeyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEat-00000006jVN-0xVn;
	Thu, 01 Jan 2026 09:03:43 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEam-00000006jOL-1yph
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 09:03:41 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-803474aaa8bso4201774b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Jan 2026 01:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258216; x=1767863016; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JJ2g7x+wr2VIeqIG6aJACDKejjD/eomNYXl10MONUeA=;
        b=ZyBL+LDBqB2bEDVDBBxfNxB0q6yA33Fx8HnlyoqjnA/jP5PAel+4FrfetoWQpADyrc
         gWy0ydHCXQpYvcgtD5W67s+q5Nt+9CxNCcqMmavWyFyRr0ICI0XnfFnxufE3tbsTWqHY
         jykCHbLlW3bB3hoWh2DldDkkOfeEjSQhTBKPxnv2iwC2fn4QgQt9Con4NI83GK6ECag4
         KhlESYWTzv1DauDvijnoCp3bCnlDNJOQsMu5YsOQwSCgSyvHTOR60H4T7Sa7IJzIAjJm
         mcCumazH5hwJHmTUFcCq5kzk9mi+gXO9cybJB8HvUiQ816IkZFg+l+CjFXOcD9NuEpAU
         xELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258216; x=1767863016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JJ2g7x+wr2VIeqIG6aJACDKejjD/eomNYXl10MONUeA=;
        b=Fp0gqbYVoas04i8Zg7i/Lx484fLDKF4FweUzVguU4ObqEOzIUSJ6p79byT36w966j6
         2A3+oxAM67reUIbfsEcWfsHX594/puKDYhusN5RYP0enXgkU3STfDn7znwaMubcfVv9z
         /GtHGROJlWM5Ru4zoAyVcMhn0GQL9TpYLRW1EmbrIL+dJAEQEktlXu2NE1fmhPfuuOZk
         J23Dll/fC0hmhafMLBXnL199BwdJgwppWZDHMaTAL1wNOSyD6/wacjmHR6eAYafTaG2J
         Vhm8nutV3iuC1BpYm+Un/Iw1NgnMOYmqWu2MNN06SF6BusHMgtIs1d69miikSmqBjvk7
         pU5w==
X-Forwarded-Encrypted: i=1; AJvYcCV+Xu8+BjVv//q8tyCK4TujK9S0EHaSmWD1HcGx0eJOfHxhQvEuGFpQWBXE/ZI/wDr2SiOelBKK5BHlVMvvNGOA@lists.infradead.org
X-Gm-Message-State: AOJu0YwATof8HD1H8nmKf061b151qyqkZWHjR3q5AOvwSvYhdE7rKV7G
	F6V6hL8AhsJHCWHSWl2TFGte+Xmg9H4LjK1o4emW+Y7sd72rX8ilEas2
X-Gm-Gg: AY/fxX7f6smJPYdfTtvlbbKeiO0bAXStBxLqsOqHYEQxT0YdyuN/mbCqn06HkZEo4gI
	oIq+HU9jrmytjDJ0pUIQUIWqcJTRYeb+7+HQM63wfHvRbuidlqci0VLi7wgaCtrtEIuCKm1Aue/
	6s35tgBxHCOF0XklRYHwIEN8p2VX5G1+6p4qKeU5QHFQLa5f96mach61Y5XvpWhVgD5E7aT1ss2
	7J1LFEF6+IHIFdVHDFXpw64F3HacNcqofoQ8/hucdzd0wk8WNX1bbpyRxPcOQvwMjYDT3iKwJeG
	T6phxioRNm7+sBCrZONt08SwoSiLguyBbdtnMh0KuVHK3RLDQ6VhURfarjqB3EEiCEhsvEp+pSq
	dNVJvMpbMM2Evp8zzgPMq8TI2M2OUsvq9Or9NSvU7sKXOa3RK+wZM4JzMrcZ7DD1hP2x5hNiUGz
	284/Nxz37piqGq
X-Google-Smtp-Source: AGHT+IF5nymNXrscYDT3dfZdh6GZrjRO0nfuwmLLAofLcZomgir0Fi2suutrLyvR1ZQFse7dGezE3A==
X-Received: by 2002:a05:6a00:8e02:b0:7dd:8f68:a812 with SMTP id d2e1a72fcca58-7ff5284dc0cmr32900240b3a.6.1767258215759;
        Thu, 01 Jan 2026 01:03:35 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm37182957b3a.39.2026.01.01.01.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:03:35 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 01 Jan 2026 17:01:54 +0800
Subject: [PATCH v10 18/21] arm64: dts: apple: t8010: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-apple-cpmu-v10-18-48812c529ffc@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=894; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=+Y0a0WIcF+OvRh+wENdR2K0SnXmQmB8D5lWAyKi2wlE=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpVjgpIAo0xFMf0/lApSkkk6hUOoy204imPMcjy
 aXS1LJup1WJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaVY4KQAKCRABygi3psUI
 JDK1D/wOEdgWStw9HVNv4Na47OndjFfy4bu/mK4iGWWoIefk/T2VvbgoQA9qKBH1Bz0/5hn97ez
 lZAcd12ujwX3IusRLbxduIvwDMJhxrxY/odfYYDZaD2hSWxVQ/15w2CIV3gYHMXc1uQF43qxIOn
 h0fPSd60uZ3TIueTTbk3nG/BVUhkDstWOFr1azPiXt/9KEWsKeH4DYS2gBbcvuW9RRhu11FFK2m
 DGo6B7z+kKVIy/LpVLq7IEppxVp6t5DnTqBasHuPPMcJhZ2e4UUlbVPEzpdMjIle9zW2omJdMnv
 Wp+OPa1976ZvNhUSdyMJUJZzvBa9GYkcIWIBHdVZ/aMDAYhpyZucYyl12UyLjuuexsrsl+5IwN1
 23TVJfsTXzm0FOUfXMPVoCLIXSlvJU7Yqq1GV6hT+06JWFRE0AQkW648yTNFixp2CNYDvtT0sxc
 swkJaMlrjCQUZUYIxV+5zqAaQyuNPGAEEEoDPPv2EoHsQ3KZKHZCItuzNvjiC5WHUaxH9cklUcd
 qio3aGsjyKHPn4P31pgrd1Mk5yltKydQ1AyUGVPxIagPvcMuKauERp4M+ABwIXNzgUeA1pjaOh+
 hY0tCYa41usCDXiyVUvCKJOKfKwCOCnknbbFb6huqvxWYvQXTnDhJK1BFeNTEqVzApWPKQezKhd
 cl6H9+JAo43VIdQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_010339_767462_434F3017 
X-CRM114-Status: GOOD (  10.15  )
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

Add CPU PMU nodes for Apple A10 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8010.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8010.dtsi b/arch/arm64/boot/dts/apple/t8010.dtsi
index 522b3896aa87eb290dc831cbbf2cc8e593844097..3cf1eef5cc261fa1dc699e8b5c9991e2215a6010 100644
--- a/arch/arm64/boot/dts/apple/t8010.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010.dtsi
@@ -332,6 +332,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,fusion-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 83 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t8010-pmgr.dtsi"

-- 
2.52.0


