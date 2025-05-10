Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7B3C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 15:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YgYxG+vTxBAlApfr9OfPBfVTpSGem7njEO/S/STMqlg=; b=nRTulnN6WxFy2s0VlYQBGR6N0j
	Byu5UmkE+bOGZ58h7+/1M0kphapQDVAYZuZe2JiWmlcdJUn/fephdnZNr3CufcriY3ok31NO96WSi
	5a+m2jOyMdt2E4xSV6ANNu26M99OovTrSxVCL1pl9zgcbYQUijuO7AF5JcXgEAcifi31cHJxwJoKb
	0reDv3jyOBs8f+XewkklnU3DDloCT4zMHkPFU2xHPTq4MZcZttoAH7u4k9/PchRFyH9Oo2Rk1XXDv
	ESfuTLI0cUXWirfMn1QU8B8yZSXu9LrQKjvHgfWP4iEsSM3Kmi7bOwXBC/IseljGNF5Mwnd74Bszl
	X3RQUlaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDmaY-000000068Ch-0Bt6;
	Sat, 10 May 2025 15:58:10 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDlsV-000000064J0-3csD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 15:12:41 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b245ff89c99so1300082a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 May 2025 08:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746889959; x=1747494759; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YgYxG+vTxBAlApfr9OfPBfVTpSGem7njEO/S/STMqlg=;
        b=S1m3S0fUOAww/k1UOa2QKI6axVwyiiRriKP865Wvh8omOPB8OjjRvvHl59bW65y7er
         uk5B4PS7eQ2rHpCAIxuLoa0wmQAzGioYH8LOpAp7//wBkjAkPvxsXeEtqQ1ZuBGplYNi
         QPa238LZ0jmy/3q9ajucOJxqZ3H98gIIYVPiirm0O+gPLcXF3Z+awcWHmXB7JUgXbHnM
         wowfRZVBuzzobaoSIPYC3jbXjj8hW+XhJKVh5z6YAw3ujlXgXwG5W5uVV9nvCdRptkBZ
         EkQEGzrxFWf8W58hgZW7jv1aVXAIdz7TCh/gGcr8ADI9xJ/ldmQakTNh4I4hjQxjxQ08
         RpnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889959; x=1747494759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YgYxG+vTxBAlApfr9OfPBfVTpSGem7njEO/S/STMqlg=;
        b=IBcIOPmoHWP15q6mn6dJtEtSmH7vhg2bwC4FbmciaDSa2bx0INXPydEh3BYCJ8DBTw
         JcZfa7faM8COBtRdNszx8aLEIEz76jIxLfnccHVxhrm1tgVd6nmoGXZshBcWSCcC8jzw
         lu51A9UacsHTRAuqhrRyZT7T/Wtje9DKOnocWh8JYfZqqidUtmEf45RWxw693/WAdPHY
         mrMSkL52qF8nDIjWeSBZ02lDTk1Ze+AyP5Y4A/hWD/PobXqGF83vQIoUufnEmPSm9TZ4
         HUuafni/1C5xayZyWxYFENxF6imq8JrVnHfksENkq3OgUTIv0oU+4Bjn3VNWnhe7QbKq
         WO5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUDbwGB+F9isu4b9ZJo0iKs1pa8hS1LNKr/rviLx83iP2KYH9pVkcnhyHJ8C4an98/qmWUKl6dX9Veey5RqCN2u@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+q9mG/6DE/4ZJG88yj60IAlP1v7ucA/WF2fgLfxqtCLskbfQ5
	fgE3/j7EbeSSjk027VZt1HUHyggN5IKrokA8jm42rBoznbYBBMac
X-Gm-Gg: ASbGncuJkm5OYTwAbJcgIrRxoiSvZwq72Sy5EffVWWnJEHpvmBjGhe9lnEQ+ZobhbXE
	GP/xAoRBp6AFHN1zqIu5bHfhNqYUTLDLf3xC62/gQE9K1dh4fiPCrjVboSLJmcOHbwVqvf8CwsJ
	gBHeB8FtXury0w8OoWFT77pF3ecqcZHW/AiuheeeqbPomNQoPaQgVnLscv3q+jiM4u2eXSywFz2
	e9wdU4Y93lOOXYYDZGEPcaeHP+2PGGs/QDXW2mkpeGxHxyCiGZ5mAC69Kjfiyh+pAu1ta7LVtfe
	2D+bX/Oal8Y5Kf9rnfYtznSb54preVQ7G77NFJ2ZULPOoy1+5PhTQA==
X-Google-Smtp-Source: AGHT+IGsbdop8plBHpcmpnMxKCFGsNL9XJ5fPzAac6FXRl20VRiIJR/5u5O/hLTD0QEvnuaKLrsa8A==
X-Received: by 2002:a17:902:e84d:b0:22e:8183:1fae with SMTP id d9443c01a7336-22fc8e94b54mr114728855ad.41.1746889958989;
        Sat, 10 May 2025 08:12:38 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2350ddca3asm2990493a12.58.2025.05.10.08.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:12:38 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 10 May 2025 23:11:02 +0800
Subject: [PATCH v7 21/21] arm64: dts: apple: t8015: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-apple-cpmu-v7-21-bd505cb6c520@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1462; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=ZHoXysjC3tKjwBhupXya9t0tvevKJFeLclU2Q2P4acg=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoH2yduqtId3KunRw3JTc76ysraowG5U1aETUds
 MsXaefV0bOJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaB9snQAKCRABygi3psUI
 JJ7ZD/9u11yUrcdGe9PhCwIpTccxOS51IX1XGrdagHrb1ZM3v+9lN4qeWlTrMOxBuROK4/nXWIH
 RIsz9GiQ+g/CCHfwPIS3FcjN72VgWIpwIAPfqgecQJDdWPcRYdm1bIkTv97/dmNwE/MFpyJP+tc
 yxR8s+nThG7coTj3wBo9tgft7eZRKJbkkB80TcacuCnzhHWZ2V6XqmFCAA5/PKI7Acl+tknBlSJ
 XXnBQ6y47hDMuxvGCWzy5izaStC5gqTSMjiaDA9d6QOzDHyc8pyXi3eOChsoUzoWSQ37ckcXzoa
 75qmgBw0CS5HwT5WhOaw8dl3Z1uTs/DUBCY973H+Vrm0BhUmv5knuoluH9fmoQUQUSM6cQ6DmpM
 O8BRUbOWVhMrdwRhOWIsrWq3IPoVbot1g9szKn9x/qHwpxbhjy4ToxS1SV8ajaS2OPDtpo0V8V3
 zeMsXe+9UaInXhwydyy1yCkB7WHmq7S85EYmA/yx6PmvtoY7Wz/57ZtBxvFp9kNv1/bIP3VaOeC
 y8gZj8hoCqGXM5uwv/cq+p0KgdNOpgACTlcRmJj2Wu0/51H6Kf+fxdDUln7UPeDggFz/YRbIHpy
 ZOYFxLYFvsPA7vqClpoRIXE3Ai/qiNuimeDeTod5UqNeHn1ZinnfgapBR/fspmBf93n4k1L9T52
 0d3mNZ7vF8d9zGw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_081239_915223_01583E49 
X-CRM114-Status: UNSURE (   9.89  )
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

Add CPU PMU nodes for Apple A11 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8015.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8015.dtsi b/arch/arm64/boot/dts/apple/t8015.dtsi
index 4d54afcecd50b50ed1fd386ccfc46c373e190e6b..e838b65ea63eef9c198032ee87e63dae282141dc 100644
--- a/arch/arm64/boot/dts/apple/t8015.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -252,6 +252,18 @@ aic: interrupt-controller@232100000 {
 			#interrupt-cells = <3>;
 			interrupt-controller;
 			power-domains = <&ps_aic>;
+
+			affinities {
+				e-core-pmu-affinity {
+					apple,fiq-index = <AIC_CPU_PMU_E>;
+					cpus = <&cpu_e0 &cpu_e1 &cpu_e2 &cpu_e3>;
+				};
+
+				p-core-pmu-affinity {
+					apple,fiq-index = <AIC_CPU_PMU_P>;
+					cpus = <&cpu_p0 &cpu_p1>;
+				};
+			};
 		};
 
 		pmgr: power-management@232000000 {
@@ -380,6 +392,18 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu-e {
+		compatible = "apple,mistral-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_FIQ AIC_CPU_PMU_E IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	pmu-p {
+		compatible = "apple,monsoon-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_FIQ AIC_CPU_PMU_P IRQ_TYPE_LEVEL_HIGH>;
+	};
 };
 
 #include "t8015-pmgr.dtsi"

-- 
2.49.0


