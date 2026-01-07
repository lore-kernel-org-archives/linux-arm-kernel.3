Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D931D0D16D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 19:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CE3ABoMb+Vlizhz6kCziTM3FHPDucALbbiym7WlJ74E=; b=f/c+RfxBsic3dHB8Fwbped3nx/
	dcd9L9P3uw0lDzddQgl7xLw58vA1SLIx7R079mTSFXvc5v2GCmfsWfGri2XGp9I9GLGwkKimAf4sP
	gV/0l/rxSCTSwWNazjAYeEhn67e6WhhyaoIDDkimngcY18325ZNrgD80gIyXZyLOaYry1zqasGaeE
	vYewlVvFoovtHqWXSUDm5/8iiP0tboBP18Y67Jkpwmk8TSDEY71PRmqRql2DD53u6AQQ6ZKb3M8Va
	TiSjBY3wMXaAKJTuE5g5gJd/mYtmNHV1uEf//THpZwLX3FyQFR5ydhmZFnFLV+8/XQnFz4LS6UZZh
	kxji7pUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdZTi-0000000FZEB-2x71;
	Wed, 07 Jan 2026 19:45:58 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdZTZ-0000000FZCV-2Z2n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 19:45:54 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so422875466b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 11:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1767815147; x=1768419947; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CE3ABoMb+Vlizhz6kCziTM3FHPDucALbbiym7WlJ74E=;
        b=aTgAZg9BXhDHZtjbrnFV2Khtbu+9JSGnelq+Q4N+ph6gpXiYZCHE1HKkVLpklBmdnF
         r8TomdR5+tBT7iMRDFBjp3iaQ5YHdOdebdHiy9q9fR9/xQSK7/cJnBlw8DJ10x1eX1KU
         vUSr2eFLio+CDwOpV98n7xzy/Fq5V2eFGqQT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767815147; x=1768419947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CE3ABoMb+Vlizhz6kCziTM3FHPDucALbbiym7WlJ74E=;
        b=JrB96mqgpQkx+ikpbJgfMsUcHcvVDvaoeUrpkYJ/QHM03pixNvTQbbIIb+ge797skD
         vQKPxDShQrAOHIg5WOr2mQRYmOG0AyuxCRGRwvQdjdxE0WZ41es+IOOeisp5DFrJDNo6
         rm6Rge/jkmQ4mut35uSY21XmLwLM7ATREYFyuMWzb0/VAHPNeLf6rR6l0+9OGAlEqd0o
         P5mkglDhs+V5t/q0jfiWUZ66B9HI7wAJ+KBTH//olkJuXrPsRM8u4+xPCZZOeVdplJF+
         QIML9+34seqMVeHZP0WK+C6k5yMuuWg5OiG/2zCPNlIcAeYcwU50uhcCig3y+oJsXROL
         6l8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkrU59fxNoT6qw3vyqhOvYEi4fb2yQFNxvvGzj03LOgvrL6zExRyGAUDiiNZ9eQG9S8Yzrk0Acja2ZnU1Jd9fp@lists.infradead.org
X-Gm-Message-State: AOJu0YyxiOjoMrjDXdAVq4DWjqmZWFacL1bmLcg8jCCdb9ta7c5OCed7
	VZ4XyZ0wPdzKG8Rd0EE8WICSvjAJ88I5o8RQojTgTMWdieiiaipcbPHxh3cUTab9mVc=
X-Gm-Gg: AY/fxX7SKScLU+K43NeMg5BbNtBq+dTB50W7Ax2rBVMK0z4er2pPv2wtef6w76a9FDu
	wVaW85UYD2WHI7/2Zdbj6WKz+baCX0lYld2tagTpSEaG6D6gZj+OUE9/t7+998xIzgdPH6fh+KX
	/UTyM/Qa5wnHQjMDfI8xDpeCXReZg4pagj5JtUuqCkEWvMu79bCWayKna2Ds2eCuHAg75Cqpwzs
	cXsc972JL5GROaHPyE788Wn1RL19oEJWlTPHn/K8J5GIjwyc6c1xqUtDx4JNVMtntl7lEqN3B8a
	CpvX4XeweX/r4PVo8IL3PtztUxyMEXiKmep1NQvbKOnSCYKq3ixl6ekrnpuA+h446ohifA88Shr
	paPKaDGnmUBXrfYUqVlWfOG9CaX5+c6MOK0YLK7n5T+tmLOiPtz73mYweMOHGL+x+qQCkCuYnPO
	FqEXIDpvh/E3UjrmEzo6eWgwkbXT0bcOCvwhV0123mD7j22LKLJIjxQgBa2u5PKVjkj/DOmYHOO
	vcKPhJeZEpnNiEgGW5aZpdneul6f3rne8E=
X-Google-Smtp-Source: AGHT+IFQ1zeeMjHCI/Trkv1q4PKObKTS13+fRskV7eQs/QQ1YzbP9PGEh8tMjNP2uYGa5sBa/tjusQ==
X-Received: by 2002:a17:907:d0a:b0:b76:d734:d459 with SMTP id a640c23a62f3a-b844506436fmr387336366b.57.1767815147362;
        Wed, 07 Jan 2026 11:45:47 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.41.122])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a233fb3sm591201066b.12.2026.01.07.11.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 11:45:46 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 2/2] arm64: dts: st: add TAMP-NVRAM support for STM32MP25
Date: Wed,  7 Jan 2026 20:45:33 +0100
Message-ID: <20260107194541.1843999-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107194541.1843999-1-dario.binacchi@amarulasolutions.com>
References: <20260107194541.1843999-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_114549_663762_F737D795 
X-CRM114-Status: GOOD (  10.60  )
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

Add the TAMP node along with its NVRAM child node and define the
fixed-layout for fwu_info and boot_mode registers.

The TAMP (Tamper and backup registers) block is a system controller that
provides access to backup registers as NVMEM storage that persists across
reboots.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index a8e6e0f77b83..c7839e732f31 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -2084,6 +2084,32 @@ rtc: rtc@46000000 {
 			status = "disabled";
 		};
 
+		tamp: tamp@46010000 {
+			compatible = "st,stm32-tamp", "syscon", "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x46010000 0x400>;
+			ranges;
+
+			nvram: nvram@46010100 {
+				compatible = "st,stm32mp25-tamp-nvram";
+				reg = <0x46010100 0x200>;
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					fwu_info: tamp-bkp@c0 {
+						reg = <0xc0 0x4>;
+					};
+
+					boot_mode: tamp-bkp@180 {
+						reg = <0x180 0x4>;
+					};
+				};
+			};
+		};
+
 		pinctrl_z: pinctrl@46200000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.43.0

base-commit: f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
branch: stm32-tamp-nvram

