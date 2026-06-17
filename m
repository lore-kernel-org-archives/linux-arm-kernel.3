Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA7ACD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 07:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGqxYO2Oa1YzQdRB279ndYOf99EMUYTgi9douNfsaII=; b=Rz+x4pJNgKE4r4cy4KQYeS2cHw
	gBwFk9SZK9+IBx9HksFMakhPWK0rW878mzMazChmyaGHmlOXU7arBAPX7sflQkgu/7gRJ70g0mV+5
	0ewMI2aVx13SmNSd2o7zdUSRAAEzN3KHHXLmJ+wJViuyJw9UR6P8mTdq/670/NLSwZQXjP6EdsDuj
	NR9kmWGZoh7eUYsjXzZlZusIUuLpSS9o5/hYa69HxaeamiufuTA+Az1lE1bk43ztIv59cyncgLXOU
	bQWiXROAgiTwaigxlMCKPrQBEqYgkMPyLQt+o/dHGu8VI3iaHOjgK+lSaaNhT3Kh+ibH12omPjGvE
	KiwVnZ6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkVx-0000000Gnuw-3wzv;
	Wed, 17 Jun 2026 07:16:45 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkVv-0000000Gnrq-2H2a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 07:16:44 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c85ba774551so2017165a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 00:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781680602; x=1782285402; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGqxYO2Oa1YzQdRB279ndYOf99EMUYTgi9douNfsaII=;
        b=lLSaOkbHm82LxDiGSRii2nOprQHwhtd0lhSkGH78ZiQJ+ATy++ehqGKIkgcyKn0Yye
         jcvQ/0EYpi6sOvPaLUK/DUTZh3TSldUejCcPdz/mi1lMzpW0xJeHJ0DmyQJV7tkxgmF9
         wXkKjZsYUaj/aG/Yt6GxnA5+9LTigp8um8Fx+GVKKQ6GkqEd+tbTYa8DBNRFaiCVjw6B
         LRCIbluXz2/auxJfd1oXfkGnmYxxhi+5fb1Ft3jFJihuiWiS8+ulEG+kBCi/En8KMjkH
         hWgyUF1Ga/ZTebCDEPqSJfQAF4XP/ULKD2D4HXhsMX5n+urEUSKpx3SuHH2s+q3BMsjL
         Nn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781680602; x=1782285402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kGqxYO2Oa1YzQdRB279ndYOf99EMUYTgi9douNfsaII=;
        b=L5E8x59L7LgDNwkow4Re/ps5YeXZvniAbh4lvaJGnbW5pWwsme0peisYlklpyeGuwC
         PupQVRUEf9lnICc/NxgwsuozyDmS2FqBBV2LtV2vwmCEh4FozmK9c4zlvzk9y51Z9rBW
         OhZe9PRRw2YFXIkMbQFF856zTaeYun/wx37yEvz9/uZI1n6osEaWYMQmBhO6gTuIDZnn
         q6Iu6Y9QfntqrSI0BotXN1ZP3tC+B3eLKWJlf1sYsea/o4dgKph4+hKgjr/rHavb/8nT
         tYadhLDkkD6OiKdGwu7Xv5nWp3AC1gXTMBP5bcv+5rWTMkeo5TZ9v8qLRBown6buzXKw
         Novg==
X-Forwarded-Encrypted: i=1; AFNElJ/soVgW7+nEiiCH0Nb43rQqXc3V01n7oB5OAAo6CtoaM06agXVxwHFAsMQ1QmBG+RCppcKt5sqrmKYwHadM5hLE@lists.infradead.org
X-Gm-Message-State: AOJu0Yx79pRW6ZFHSJrfq5B67yZprk4ugMukYfZddy5Y9EZwgOOv03/M
	hJE6B5ZCdZ8qQ8ilEn1FVf5TqOPDOpSW4CNrE+8gtW2E2ZfqYTfg7mu0
X-Gm-Gg: Acq92OG3MR2P2VyFYQxCWVWB0ylhb/pJumyFaKR2bG/gmP8x+ifkqKWOc8H38ZxsGVP
	ifzgkXqIF7Gg4X0aP2uptdZVwGkuf/v3FL78U3MBV/7Zoy5TQldHspeUk6IIq+9I/RUY1J56et7
	j/s7kzDR7wgiEvBGk8p9ouo5aVZygPUyqVFVhup5NK1f6TqefqipAC2ICL+0NCkQShR4GLtzoBM
	5dfYJiSy+mP2K1fT3eGxwWkgjD7fzEAevpOpMn41Q+FHpIReRrkLF+rg7RhBvZJtnvqeWvVIXw7
	uvHeEqNOw0tClrdNFEuueZvGAXe18aRAlHbwO5HCU89evXbBhPDu+ujnC0CxPx38NdeLw1WK5Vg
	BB4BzHICutibSnzeTkrBarH1bfWzotIMoZo+y1ZRuZxhuVuJhUsExyf5ivz1HqkVWCbstzkWc1P
	m8+17Pv5ifGA==
X-Received: by 2002:a05:6a20:6a09:b0:39b:d937:8020 with SMTP id adf61e73a8af0-3b8b80f27d5mr2810990637.42.1781680602489;
        Wed, 17 Jun 2026 00:16:42 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866519faabsm13653439a12.24.2026.06.17.00.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:16:42 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] arm64: dts: amlogic: meson-axg-s400: Enable pcie_phy
Date: Wed, 17 Jun 2026 15:15:59 +0800
Message-ID: <20260617071604.635627-5-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617071604.635627-1-jerrysteve1101@gmail.com>
References: <20260617071604.635627-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_001643_576174_3138CBF9 
X-CRM114-Status: UNSURE (   9.62  )
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

The meson-axg dtsi now disables pcie_phy by default, so enable it
for the s400 board to support PCIe functionality.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index 285c6ac1dd61..7ba249cc3d56 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -448,6 +448,10 @@ &pcieB {
 	status = "okay";
 };
 
+&pcie_phy {
+	status = "okay";
+};
+
 &pwm_ab {
 	status = "okay";
 	pinctrl-0 = <&pwm_a_x20_pins>;
-- 
2.54.0


