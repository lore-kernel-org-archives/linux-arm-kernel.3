Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51299CD6E7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 07:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KMKMXYkNxydSpTz7ZRDCxG2wY5Cxqn9vnpLFwt0ezvo=; b=lj/SABoPTuCVBC2tLvrrosBHW1
	LR4/UUqiLQ/OBdGJLHyIRI9tbk9KeRWkvu0EKvocSjubldP8FQIcQCtIX3rii5+7bJ8HeSXxUZzU0
	oKBem1eMHFlhYVqfEDl9gajL5t1KqjVQQmKBfI9lG5Vgm8DODvbwyPDfArBF/IF+YKtsIMgjy6wyv
	i/6H6nfYlojDq822rypz4fljqb2Qcr3MEf/v0uwsmgxlmaIU8VRwf3xVFlndCKXvxmte9iBPo7/Yv
	DyzGbtI/6s6wpFUKJxgdVs5tdGrHdO53Mf/y+JOSQBhmD/ti3HFwezWzsdaUQJe4MZuotZINu8yPv
	OBtajbTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVOgz-00000000CxO-11kZ;
	Fri, 05 Jun 2026 07:10:09 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVOgw-00000000Ctq-3PkU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 07:10:07 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-45ef56d9b67so1199651f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 00:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780643405; x=1781248205; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMKMXYkNxydSpTz7ZRDCxG2wY5Cxqn9vnpLFwt0ezvo=;
        b=B33gWJIUO0jDtnFEIdRAfshGhr5wTD+VIL8x1U0UmWeHdw/dHn6UtLBxg0RMpg1RTu
         o2c+fmbQG4tezTGsFhTkfq7deomKaDJyOM/CAc69Orf5t5x04enMI9vWAI9i8EI0Jo+E
         McHoZ9ap8YXiWNX2N9kupczoGk6jBHEApybdEjeBmG/ECOR7fEj3RgGfgq316AJLgTvL
         7/mESgRoZIX8VQm5/QqWj/elr+m2e874vGkgvYv0NQUfq8GgwgIKt3J4J7CSjG9gXrZh
         8xcgCsmqHs8c36GVSgJiDfzTest341+26vY14QCzH8YD7xhxa89ASMxi5qp1u3TZXwwQ
         S0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780643405; x=1781248205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KMKMXYkNxydSpTz7ZRDCxG2wY5Cxqn9vnpLFwt0ezvo=;
        b=W7M0jBrluRLqspOUfffP4LpmSNPRPGxLvZGcosy+2lr/t4gp9T+xcUWK5Wy4aDInJ9
         EDeG+9P5PfQ/AaM9zaLzZXU9rB7EL3AMiwMcy9Ml+f2BKpB5zcxaJ3XX5E4KgSv/s0W7
         7yyeO8xorHaW+DB6ZzquGsUi7TOisPKeNLIOGhN/8op4k+YejCbOBn4Sdcd20cxA/wNz
         Sf5zZFDD/CaCvztfX2/eM5R5R1aXUuLrAIkGSx5Xygq3yCsm6P/ALRtJurnWtehTWwm2
         +hlcKqlnV0Cfly97YhRSF4aA0R5RRIaEei9rU7gGS9UnMAww3lTQblqF36uN3y6sQP4w
         zzSw==
X-Gm-Message-State: AOJu0YwE/Lfwd1J/MZTYSVZvqadWKvaxkzMKnjYDjpEj3M/XUi7HG9bP
	Zv+ZApaZAa2k8e28y7xbXdLbmyvZAyLBxyZnkX7zkjgywKflxwolD+KnNotst8Oy+pA=
X-Gm-Gg: Acq92OF4cOZTyuNaQsyFJm09zKJvvhoup8OxYm7C6E4hO+npRDMygoeY7FM/V5mH0Js
	iMkTR93I6YKuJHWxawBYbRS52h12MUAca5sTJevyOf7FRvbIf3cLjV7EmxIsKIHwfa0LTMbhnZz
	YD7U9dkn0ljVt8xetKWCjddp8AZieV9YT7ja1RGNvBflRyhPZKSYRkbhWv5+eVqely2nfhCUPl/
	LclPRBY8qT8gd6sVebsFVEkLu6fsRM0DydIFalOl8cJsbLAYtWjvhTWP5fpyrdo+9ztvUUJBziC
	zpIeYEGLZIiVnKUFxlFMvq4OZ2dbtf0zKwA88uV8df/xHBFGhe+q11r/YC5BAvVA5S1iSKfa34D
	+Ql25fTZVcZDL0TzZ0EegkecFDWvXA8Mss41WCYzeguRjpLH6VbPJAkh4mbZo2l6tioCO+HlapV
	24AanYSfrY9Pzsgl5JaC9f2/LArasjjg4n67fenXolOOHsGDjLA5PUGyjSpnTemLOKyw6qKBk4/
	5EVKEyp/e5Cps9cuHDCzw==
X-Received: by 2002:a5d:40c8:0:b0:45e:eec6:5020 with SMTP id ffacd0b85a97d-4603063ff2dmr2697534f8f.38.1780643404687;
        Fri, 05 Jun 2026 00:10:04 -0700 (PDT)
Received: from localhost.localdomain (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm25132882f8f.5.2026.06.05.00.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 00:10:04 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Eric Biggers <ebiggers@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Sven Peter <sven@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v4 6/7] arm64: dts: allwinner: a100: reserve RAM for ATF
Date: Fri,  5 Jun 2026 09:09:20 +0200
Message-ID: <20260605070923.3045073-7-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
References: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_001006_891646_70908E1F 
X-CRM114-Status: GOOD (  12.26  )
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

Add reserved-memory node carving out Trusted Firmware-A region spanning
fixed 256K from physical address 0x40000000. Even though Allwinner ATF
itself passes the address range in the fdt to U-Boot, U-Boot currently
only reserves this memory internally, but doesn't carve out the region
in the fdt passed to Linux.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v4:
- new patch

 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index 7cb06b19b5a5..d8391663fd1d 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -87,6 +87,22 @@ osc32k: osc32k-clk {
 		#clock-cells = <0>;
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/*
+		 * 256 KiB reserved for Trusted Firmware-A (BL31).
+		 * This is added by BL31 itself, but some bootloaders fail
+		 * to propagate this into the DTB handed to kernels.
+		 */
+		secmon@40000000 {
+			reg = <0x0 0x40000000 0x0 0x40000>;
+			no-map;
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13
-- 
2.54.0


