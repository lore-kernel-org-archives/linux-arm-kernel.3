Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDD3CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 09:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qKLAYC4j9KDlgpKElsaQCZMFHUJovZT20hAAdQtCFec=; b=lajeW/l+KUMfeJEs/bffrPjUZb
	aG5AC5vRxF5R+oyUjdMUXglWDCQamVnaKJKrin14eZJ6lCKnMX03YBmVO1+bNENh7UxxXZruSsuSK
	bH9hYULSA6F83SPPhLuIi6FpcjuSNvIrRXNrp7DBrRXKPL9Ne/4zZEWd7fa5cc1dVKK6qeWu3xzoy
	AYfzAYVipZDj5g9j4wlXTiixp3wC0aigVMWsMSiPWm1GeuPaDiPLdzRQYOqCno+VFpw8F6Ki7C4Ho
	qD5preRavqyjlWvdT6/zztEob/KQYW7M5nP+ai8V14MizX5xNhjLidUtS3RXu4C1mNu5UoOlwoOqs
	gFSz8iqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOoF-00000003pwp-13Sx;
	Thu, 30 Oct 2025 09:19:07 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOoC-00000003pvW-24WF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 09:19:05 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-471191ac79dso8863745e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 02:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761815943; x=1762420743; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qKLAYC4j9KDlgpKElsaQCZMFHUJovZT20hAAdQtCFec=;
        b=1c0X833yN2jwhgBxHG6voYVswEqc9zkVbkxiiMjoH7RxCJEVFXi2Jqp2Vk2J3b/t62
         esBM4DZxaKnqSZeIJtZIRRUxRqb9bYy9/aIgw3fH+MTbpLadvIr2phV0FSYYReYi9WK8
         1yHu5pbuUnZeP/i4putPJdAnVjUOW5lt3gHAqmXNKjebKc8gy7bHMZlAV7oID3tUll82
         Fs6poUGOLVw6WLah6DsQ40Kz/y8Z0WoJlYbminpenhfsKrmQllUk9YM3tuYTFdLxSGMo
         xBa0HyZIQc9E3K9n4/otPOcWbCsp/RNloAyxOYVSq3+qkxyOq5hy4G5144kCki+toQN2
         wPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761815943; x=1762420743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qKLAYC4j9KDlgpKElsaQCZMFHUJovZT20hAAdQtCFec=;
        b=NnNGn6QUljShQpQZyToM6VcNxdgoLRDVQOLW22ys4YVJcMyI5LcFbCaAkwQNHNYiYK
         bYk+QlpJfA4Tt6dImIWVhn3uiF1106PLjsa4+24+XTktjzOj2Pxwo+5t+9rnbDs5Rlbj
         6k0t1Z+a9qeXAKvu1DLPV3pfjNk9uk4cC1doQsmHZxG6XQiVKdmSO1QPsAdY8CpbHnQQ
         n2g/m1dIjCSDmOolO5sSQn2ewyz83t1oIF8Qun7xbM8eAx85WKnj38j1gQA4U2Emy9Eg
         std8ye455jgAxNYmItr2OURzZysyEYlj3HE8qIw7pSC20SVzej0TLtla0w8p06dou7jz
         kZDA==
X-Gm-Message-State: AOJu0Yw+v3K6EKuEXIt2m1PWhXNOWlbh3ux+ZJIq9BDD23bvYt1FhA6J
	XmOCacrbZwQr0mGVMWArpvd7fTYU8cw9lXmAWkiMAifuwOIAh+McD6t2pj6Z1oyl/pQ=
X-Gm-Gg: ASbGncukiw92ATMP4NjMRyuVeucMY+CclPdNJSFq4x2snjPZpNh+Sxg7io5MIue7/wG
	GzDR5ICeC894eeSE1T4CbzBgbIU/KcNo3N+xvue/9kwwiML4QCLp0i5YKhvwTlgv+cSJYYb0c6m
	LyIFcPltC/wuC4mvoUJjHmR35Vn5y2s3QfAR4r4e8+DQZ5IVoeFcKD4euxitn2UiP3inTBiCV1p
	mvXiENpEHONN2jhxdtjE4NCAGRnHFPjeRgyQajVXnZLlbdIJ46wGSMM+pTCnoxX8giad/1c+xE7
	Mc4AfuEpV0KPfySwDsyvoPi+AZqPdbaGYchXNx+xoJ2ysxLjCpLn0zqAR7RZ6kAvUrEGN2glI11
	njg4bKZarAXEarC7UwLXsg66gh2tSwGUSTUXznKEtCaUa/Muz8eP421CsuFskoSoxDpQLu+yPow
	==
X-Google-Smtp-Source: AGHT+IHztpojphTrK7hZm2oje3psepYoKf66hj0yoiU6QXzl2hG676l4YpdtXTbxbphCE6chpMgWXA==
X-Received: by 2002:a05:600c:c16f:b0:477:c71:1fc7 with SMTP id 5b1f17b1804b1-4771e1d9248mr46322525e9.26.1761815942698;
        Thu, 30 Oct 2025 02:19:02 -0700 (PDT)
Received: from localhost ([2001:4090:a245:8496:49da:2c07:5e9a:7fb9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4771900dad7sm64230725e9.6.2025.10.30.02.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 02:19:02 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
Date: Thu, 30 Oct 2025 10:17:23 +0100
Subject: [PATCH v4 1/6] arm64: dts: ti: k3-am62: Define possible system
 states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-topic-am62-dt-partialio-v6-15-v4-1-6b520dfa8591@baylibre.com>
References: <20251030-topic-am62-dt-partialio-v6-15-v4-0-6b520dfa8591@baylibre.com>
In-Reply-To: <20251030-topic-am62-dt-partialio-v6-15-v4-0-6b520dfa8591@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, 
 Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, 
 "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1217; i=msp@baylibre.com;
 h=from:subject:message-id; bh=CD8jS3mi5l0ptE5mloshmhyPStp+3Ujo5r6yvkMZV70=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhkxm3YjSC1lFYsIRXHW1IbGyxxzaVD2iDZ5ycbnwvZtic
 dm4yKejlIVBjItBVkyRpTMxNO2//M5jyYuWbYaZw8oEMoSBi1MAJvJuDyPD8rXW7UzBFTKBrkt2
 XV2TtuveP+OHDM/vFHbOE79l8G7iJUaG1S1HrqSqzzM4czBtya37zDs4rvdMr4u98Gpq0noF449
 2zAA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_021904_553022_C7155A72 
X-CRM114-Status: UNSURE (   9.42  )
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

Add the system states that are available on TI AM62 SoCs.

Signed-off-by: Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62.dtsi b/arch/arm64/boot/dts/ti/k3-am62.dtsi
index 59f6dff552ed40e4ac0f9c7077aa25d68d3b5283..b08b7062060ca12ecae83917a831ee779f1a288f 100644
--- a/arch/arm64/boot/dts/ti/k3-am62.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62.dtsi
@@ -46,6 +46,28 @@ pmu: pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	system-idle-states {
+		system_partial_io: system-partial-io {
+			compatible = "system-idle-state";
+			idle-state-name = "off-wake";
+		};
+
+		system_deep_sleep: system-deep-sleep {
+			compatible = "system-idle-state";
+			idle-state-name = "mem";
+		};
+
+		system_mcu_only: system-mcu-only {
+			compatible = "system-idle-state";
+			idle-state-name = "mem-mcu-active";
+		};
+
+		system_standby: system-standby {
+			compatible = "system-idle-state";
+			idle-state-name = "standby";
+		};
+	};
+
 	cbass_main: bus@f0000 {
 		bootph-all;
 		compatible = "simple-bus";

-- 
2.51.0


