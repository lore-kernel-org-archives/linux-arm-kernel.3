Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAC5C369C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+3LVTpn0Xg5k9Tehr7H1EBP9tClnp6JDsKrJApop4TI=; b=1UnVbkHN4Xkjj72d3pawvf5uG8
	QIXzqZ68Twud2gamMpRhauJWXBYm2iusEMNth6+T3FXH6irsJN7MUMGKva/0p0rEbYzgQo2CSvDZh
	/i1J4xywBrZthn7jMiAL+yIxrDPVyeGZrF6ZDG80A1elZeS321XtN4gATJqGc2rkB+eWZwROmngdb
	i/6T9qI1L/V1+cynDzKeMgyJl4H5IeECMApZWo9rrUxQAe35iEw9ty1tD0wUxWbG68SnuoNWVqOEI
	/EG5h23l7c9tL7Klpi1ovUy94LsS2DIbSOqMGleI7dDenbJmBbMgT+G9UB/zXih/ypBXEpjPzlggr
	ojnEyLhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u502X-000000098Eu-3Edp;
	Wed, 16 Apr 2025 10:30:45 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4y2j-00000008nlq-1gX4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 08:22:55 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-30beedb99c9so57176651fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 01:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791767; x=1745396567; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+3LVTpn0Xg5k9Tehr7H1EBP9tClnp6JDsKrJApop4TI=;
        b=OA6IH9DvWy+O1eaIdA7NYN4W1fooCGYXFDMaXqo8pNJ5xirTichFYLsSSet5i9AEYc
         eaJcZdMgLP5oX4ZY/ZEln9H8X+/OMYcxB8ZKTlFqO+9I3gr/7G4jb2Sf6ya3DpiRaQ3C
         JcWTBP2+Mnd82kGUJWx761NK9UbP5MTr/a7QEN/s1xyqc1FhAP8c+TzushJA08zTY/OC
         i1r0Pclx9eXgvRn9VwCJ8XQHSwRyDNvfSgRuPWbmw0ZeOqoDvwlciQ/L/LyB41KxOaty
         G4o/rwh/ce0ZN3/4W7gJ1Gi1xoToveG6NsVkqQMctLBMXI6ro5xlK1jdV0s3RVo/Zz5a
         X2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791767; x=1745396567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+3LVTpn0Xg5k9Tehr7H1EBP9tClnp6JDsKrJApop4TI=;
        b=RuRjkZI7afbp6mMe11KQHDubC5wZ9n1/lzlUPSwx2x4KTalGPZhnc8fgPD9JDzPl6l
         ZZpD8bJC+FeIbUsjv6iVqIjzyRCjRYUwWf63qeoNLLAft/IqCXHgpzQjEBzJPY1prZmQ
         Jr/LDH0UBHnQ4j+q6I3BJrCt4HgulEAEvDCJ9IiR66rN21OhsG4RmDN4N3NuOOXV4B/6
         ujlm/XKuDJF6nxF1D7WszRK1C1E3TGlkgURUG0LhlEQwHV+0+ewT7Eu2CHzPMiGZWfQp
         1/RtstrC67ArkggoP6ZheG2fGP1LDQjMgYjiostXzDUanPGkPiK7tJ2RaKzklG6iIJu1
         MQLg==
X-Gm-Message-State: AOJu0Yxq5ZKCCKWqX5fgLVjuM512HHz+mEddVd40aBQ49VJN6cd62myJ
	ZB1p+jXi5RCAV1OODYURRdWKXveVlPdN6wCCtXGRMjpYSSP2hbIcELf6XBpKvPM=
X-Gm-Gg: ASbGnct/2hbT3QeBUr0RDrJzCDsOZMA+IUxAPrDb9UqDWPKbxSoZPo7WufCr9DH1GD/
	BCCxKCHpFPilA1as/GdAx8krL3mFmXdIYvLEjhLnVY7PZ3avBHLjqd5dWOwboadqd9JFs79vrRs
	bNh7Peaj7fLbZ0/XPxZClru7FD+IqwoLREvPyAJzAb8uFpA6FZ7aZ3Yu/mwV0hakgJ20bti597w
	l7AF/2ymIBVL2keybijR5hUkEJMH+yeUpeOQr0h/rHrTepxGFaFHG6is9mmiUbGROx0YHfkauWr
	qBawgN+UvgrXug1whIqFosHXiNBueIZkZ6yVC6O44AXtbWuD9OIe
X-Google-Smtp-Source: AGHT+IHqcPN9o0/2W+ihJOoL8R+C0j9ItIkZ3xAgrlrtLNcdSKg3RGRu1iorfo2w+SRNd3v44qbbRQ==
X-Received: by 2002:a05:651c:1988:b0:30d:b89d:aafd with SMTP id 38308e7fff4ca-3107f7168bamr2633401fa.31.1744791767234;
        Wed, 16 Apr 2025 01:22:47 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f7b20sm23025391fa.97.2025.04.16.01.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:22:46 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 16 Apr 2025 12:21:38 +0400
Subject: [PATCH 13/13] ARM: dts: vt8500: Add L2 cache controller on
 WM8850/WM8950
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-wmt-updates-v1-13-f9af689cdfc2@gmail.com>
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
In-Reply-To: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org, 
 linux-pwm@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744791712; l=1582;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=cwXMxbJL24jYAsCezvOT4x+AE9GW0GoMa7cMoc0+DnI=;
 b=zNlgXlbjTA/8oLRF/la27qlvLFN+mq15FgWHalIAboJ5Rc0SQ5ohznWcA0ndpi8Xffn25dAwF
 VMGz2yvXW2mBR4Ak2oml/1A0L6geaDMoSzUi03H78YHdpMDuX54g+/e
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_012249_467258_6169A765 
X-CRM114-Status: GOOD (  12.05  )
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

WonderMedia WM8850/WM8950 uses an ARM PL310 cache controller for its
L2 cache, add it.

The parameters have been deduced from vendor's U-boot environment
variables, which the downstream code uses to initialize the
controller. They set the following register values:

aux = 0x3e440000
prefetch_ctrl = 0x70000007

Their initialization code also unconditionally sets the flags
L2X0_DYNAMIC_CLK_GATING_EN | L2X0_STNDBY_MODE_EN, so encode those too

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm/boot/dts/vt8500/wm8850.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/vt8500/wm8850.dtsi b/arch/arm/boot/dts/vt8500/wm8850.dtsi
index 55de8d439688c5710d1e9a37890bbd274895be42..f2fb2e0b04c31dbdf320387f24c3b09d231d90b8 100644
--- a/arch/arm/boot/dts/vt8500/wm8850.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8850.dtsi
@@ -18,6 +18,7 @@ cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <0x0>;
+			next-level-cache = <&l2_cache>;
 		};
 	};
 
@@ -35,6 +36,19 @@ soc {
 		ranges;
 		interrupt-parent = <&intc0>;
 
+		l2_cache: cache-controller@d9000000 {
+			compatible = "arm,pl310-cache";
+			reg = <0xd9000000 0x1000>;
+			arm,double-linefill = <1>;
+			arm,dynamic-clock-gating = <1>;
+			arm,shared-override;
+			arm,standby-mode = <1>;
+			cache-level = <2>;
+			cache-unified;
+			prefetch-data = <1>;
+			prefetch-instr = <1>;
+		};
+
 		intc0: interrupt-controller@d8140000 {
 			compatible = "via,vt8500-intc";
 			interrupt-controller;

-- 
2.49.0


