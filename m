Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9548AC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 15:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Pp+kkIFVs4gp4J7ADoVk3Rc5HkxtiGkD1fRapo9f6w=; b=P4ZR0f9BoTMzZ2KfMwZPBHI6zR
	/d74dLVnsM3GPzaELt2RvG83jpuPWDn8yfurq5vJDGUDuB49go5sdqHHNTeTt+d3KQudFIIbe2yHi
	ik2SwntgFmb3mxeYc1DAZkzTayk8xYwGddPPWAbIdDVodW07Bvnsj+M3pmMagWemdfQQPWefTqoPK
	k+BXtdesQk1wObhf8t4o0cm17rdlbES8L7O8EmuUX1RgN6vTrrtZ1Y4W/TmLX4d8wDGCQ4IXDWjZS
	pWq0D2e+52zFlc1DO4czQlJuQtkdnZvN0+azPI2M3d2jzNm9k9twsi1irAivvgNXPL2PIReu/9dXw
	WtHOM3Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDmK7-000000066jT-0mK5;
	Sat, 10 May 2025 15:41:11 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDls5-000000064DW-1ET5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 15:12:14 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-30a894cc07cso3050325a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 May 2025 08:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746889932; x=1747494732; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Pp+kkIFVs4gp4J7ADoVk3Rc5HkxtiGkD1fRapo9f6w=;
        b=IzNZNdP2dYcjWFM7i3YkL1rOUVakRP1tgqTpuswm5Jcb66PhHhv04qbifL3WZwFOcR
         F5yISGtNByzhiSnlyqXjbDVNcQwEL/rzYee4LsNemyiS4KZwdrp5QcyR61IT+VB7o0rD
         ih8iGFxoVAqpG1kI3g0KglAl00s0eFtkC38gBa+h8/6xg63u8Ti9Xcz49bHSHhKJDzRp
         pad3HsvaXrnjz2lvkGxYBPrD6If/vc4z5u7dvPnZfI/fjkkhVBDWjr+JuIVji85bnUdz
         2NPIYhkxFWBsLCB5uAQlhDLR889tCO6fXyIaWPe3FKH6xo2cNOvNoWMJjdHByG+PmydE
         W6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889932; x=1747494732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Pp+kkIFVs4gp4J7ADoVk3Rc5HkxtiGkD1fRapo9f6w=;
        b=MVYTJSX6PR99fi5qHptllCNkVGMxKPhVsLpER//rm/OzRGsQo3BF/G0pvW+0hiWyWk
         EhgC1vt+ZqmVAXTgHINXKUGahR6rmw3ZNc4l8gC39262LNJcuDCvOerJk1dYzUnPr2p9
         CUAWYd48AZ+IFhEZNp0ZyxqrmEzuYBy4+nGwnNSTZOvsJkKZoLBKoyxF53lMcucG24or
         a6J44fGG7KB1RAIyjzxcMRYss7/+8RdlH5JSyXV5kCVKLdCLTjXWcp9aaYqETB3dgoFW
         9hKsEjSkki2A5J6Ww6sTc+xz8OjuSLeK0r9WFyjx8WQLuk+3VOB8dBAAAMtt1+Y11frB
         pc6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4VSMA9tHONf8A+ZDXqZgnmm22vSQjKUFCHCebsMHuaP2cLGi23DIjbD5yp2qQB57c6oNjSJPFEcyLJZN2AFhj@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4aO4RnEtGOxtUUkB6xWHO85JH1oPTnOYBF3wAMD+QsFra8VyZ
	m5uAA74R6CKq0e+W0N9xCb22Oxs29bt5HgMKVUDWXKAdFaT42Z8A
X-Gm-Gg: ASbGnctT8jFoFy2Zrfn/TXGLjleebSC8xGnifDEY74wC0ec15eds5mN7m6+LGsPNch5
	PlE8V+YEZObLCsW8q7uA/72XAHNPwP/dHYGWKFL64C3+Yws0NfEzYkQHbN08HFKEOL+1CBZ9/KN
	VhtGImDhkeDeV0Tj7e9OZQFeQs+OoW3rPpjH8yn4KJQR2WYFuhvXZycQ/kHzHqz1JtLxl16dxqA
	VU9HkUB//6Q1UJuT/8oIZSndu/yGJTH7b+p/AQGpC6ydDqM2o5g6Xjux9y0o8st4qz7pM7KvsRG
	88yBEFIq47OZE4RGgkbz60SBlsH6nWTy7RAfosyXS244/7K9FBk0tA==
X-Google-Smtp-Source: AGHT+IF6SK68sLmJtQC8ae8t2fY32cS0CBR0w+qieqNRm3VrN23qLRaQmpfkG9X/qBR6YMGEaFOk/g==
X-Received: by 2002:a17:90b:1b4a:b0:2ff:4f04:4266 with SMTP id 98e67ed59e1d1-30c3d6442c9mr9677158a91.23.1746889932396;
        Sat, 10 May 2025 08:12:12 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2350ddca3asm2990493a12.58.2025.05.10.08.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:12:12 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 10 May 2025 23:10:54 +0800
Subject: [PATCH v7 13/21] arm64: dts: apple: s5l8960x: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-apple-cpmu-v7-13-bd505cb6c520@gmail.com>
References: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
In-Reply-To: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=914; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=LZ5pN5iqWz3OCuzIiw27nZWBzYhm/oPtBhWwt5qbJRc=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoH2yb5y2fqoC/fdcSp3Ef1ys5pQjLi/c/28MOY
 hzwkrGe63KJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaB9smwAKCRABygi3psUI
 JLtJEACGtvi7PRtgcZg5JXXQY5yb0eNp6s2gfhYT6L/7fV2P/+UfVvZzFMvdkZ8QX6Yt1RDSdCJ
 m3zmx9qHc0lIC5S/Yb5DdJ3yZo8KS4X63zfaxl1ILugx807I8wstIDyITdkEwSVxE7FUnD16kNC
 pjnrT0sEXbc/4fXECpJ/fvsV88zM+Vez/8dz3KpxhUtuPjumhUIHQzJSoxOeHPpD6DUnvzGD6nn
 qKxBaLRvpfgr83d2xzwtgUzY467Z3UBjlQQ3CYn5hk9qiLlLDxsIVB6l/88RELYFq1955W+98t1
 SP92R6N073rRUgLu4nG0mkx32PI8izDVwTXIKmMAFpXH4RGKITl1DhcLHrwxdHPf8y5SwurJAw8
 XswTwtH7IJF6S5sLwVpLZFz6wWG/4aKPIv1IhIr+si9NuXL+o0/3lNyQrZ11r7xH4lwPM/tp7yK
 HmBeGF6Ibk/rNrqBxiM/H3glFCDyB71T2uWbq2NqIMvgx2ClHHbmCYU4ZxE3wX15bquXLuvKyTQ
 o9d+ft6xPzsWioVouaQomogVD48C+p25kFknFSTqr9/DugRje3mjGDP6+ra2+7P9ecB+PRC0GF1
 lmK4xL44CvKzgIXtMBwK91lNfTlyhef4w4x7Y0D5waN1zWzhthMuN3f8SVph03902ui7vYmJtE5
 ZQJZUsxKzzLKljg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_081213_336321_6F35803F 
X-CRM114-Status: UNSURE (   9.94  )
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

Add CPU PMU nodes for Apple A7 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s5l8960x.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s5l8960x.dtsi b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
index d820b0e430507f681a5f2aa13a498be98080e1db..62d528d4b7204af28b66a90d68e27e1c78e2df26 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
@@ -138,6 +138,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,cyclone-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 178 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 181 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "s5l8960x-pmgr.dtsi"

-- 
2.49.0


