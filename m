Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6F2C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 15:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6yVhZrBH2XJkvXeJPx485NaUg0f52uoxVNkAfcEPF1w=; b=H5v587UHJLP1gGzBguA9DgKczv
	1g1zkXvBuNHAYhobvF/j5ixRUSeqZPVJRenlB7Z+GroON61KW8WSdaMXIhL0DdQTo7ifQcEOM3M4V
	/pLqgV020FF9MNJhmshPuJJyo1vF3FTlvZWJWjpU6RmrF4dWQDPCCEnx0HsrsdVd+1tX7O7GqRmD4
	7U7rPYCCEto270GvSqKCY1/m4yWRfe+fG/UfeqgpUBwFjTo+pi5x+AcWzefc2/khFZF20KHnDHNZg
	2yXqYbgpfwyXZHNG/8eBmRLMxGdODRgq1+GoYe08B6Oz7MCdVzJuNJ0oHvl8KqtKSgL9pIvI4LCXj
	Zu67/hZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOeNA-00000004W5R-0Q91;
	Mon, 09 Jun 2025 15:25:16 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOdyn-00000004RTf-1sBa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 15:00:06 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-747ef5996edso3292257b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 08:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481205; x=1750086005; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6yVhZrBH2XJkvXeJPx485NaUg0f52uoxVNkAfcEPF1w=;
        b=bgxBckkFSl57vjkAEZvmt+0j+H5jWtf8bU2f+65hvMRC0dGHtp504IfdvELbbvELbR
         TA/o8xPmc61aty3yVmDP6TmPiSdc/io19OEn7k3HQxvi9bPk2gt4Z0/wGdolG6jUQW6K
         fQMZt59HL74TKY194rEAjP+N5HqOmAhHGrpm53Lc0MCH+QJx4sSdk5yz/rqjM3jm8bYv
         OQJKadOSnKO+ecLjeYPqW/xQKVdIIwZHEpow99fqJp8YrpSWgUG69BYu4EfpAHH33Mli
         ObubHDKMr1QPwkKe/x6q4d4oe4bpB2XYNDoNlwzxoCPEeaw+cT/aCEg2KhtM+JMAivk+
         4NFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481205; x=1750086005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6yVhZrBH2XJkvXeJPx485NaUg0f52uoxVNkAfcEPF1w=;
        b=he++9+yVnnAVvXjplnUYq+EzWe8vempZp8f8HzlwUrqnmAo9kRfOSz3jIzrEMT+UEP
         ruRpIs625sMh9rgKU6nPobwS1H1YjkS1cz7Hu6CzbkPiA5Rp5Vnld65F+NojWHRVdFX+
         O/VUWiukP1TZKRPo1ChvkQ2EhZaOcQP72cvKVGU3A1YIPTuBmfvdLKh7URbNWqWDkv3o
         FtBaS2HB8Vl1f9qmYyrFTZb1J4N/V5QO8mrFuuLykNBqfnt8zIUM7f0I8c8XIjoqys0O
         rnlAA1cDm70LwigZw2dSPpl2nm+2Y1SHx8eGOiixBpS4ullil+4eSVQYbXjIBncWLOR5
         faDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNlit6yH2RfXHMaBkO2RHbpw11o/aFBckOuFo/jmEA+KLsVCvoRjvyDfhFhCOHCFKgWYU7/9hjg1zs9Q8c3BkF@lists.infradead.org
X-Gm-Message-State: AOJu0YxZjsnkcmA9n1XMMtEFRGlvkQMhgXR9I/rUvw5EL+wbS4qmaemm
	dPd2ZxYKIDjkXpqB3s+s9IdkN8WyKlz79YmJcth5VsHP98083ocH7W5K
X-Gm-Gg: ASbGncsqwXBGoIuKUozPzDwwCItpY9SwhqYHwCTc3ox0yYPc3ro40SlckkRjPF41xr1
	EFX6wFl5fVDCZNTrM4Js1XvHNNVrU5VKhziKNUkvmdPbeQwfNYN3CeNnFlxsWiQEy1XOt5UA4PN
	H13Id6bdbnaJ8zcvrka9SHRC/d/+sU6FAAWjkuRF22wF4tyagvJY03EteUpolc7+SNRDqpCzuIv
	cFSwBl6sSHKagNc1Y8GQ88r2odQx3g7R0WIMdNairkiTMqu3ANqF51fb+SqxEcco0jgm1yzffAm
	zVkKvIpp+IzW4r2rZuU/0L6gP/rJ+lXXj/snJYtmrx3+/SGZr0kYYTomRqJ4GrQJ
X-Google-Smtp-Source: AGHT+IH+dUGtERHb0SkAjeq/UtecPsWqtL6oN8jrr+gftw/s1gpay7JsfqSU5olPdi8j+/+btNGsQg==
X-Received: by 2002:a05:6a21:5006:b0:21f:508b:1a19 with SMTP id adf61e73a8af0-21f508b265bmr6732985637.14.1749481204905;
        Mon, 09 Jun 2025 08:00:04 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7482b0ec4aasm5988402b3a.171.2025.06.09.08.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 08:00:04 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 09 Jun 2025 22:59:41 +0800
Subject: [PATCH 2/3] arm64: dts: apple: t8012: Add SPMI node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-t8015-spmi-v1-2-b3c55ad01491@gmail.com>
References: <20250609-t8015-spmi-v1-0-b3c55ad01491@gmail.com>
In-Reply-To: <20250609-t8015-spmi-v1-0-b3c55ad01491@gmail.com>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=eRCFJ8dvOjeUHBlZsV7soqFq1C8e016G7WXxzwjB5sU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoRvbsiqjS73g0fmtM9YceCfWNGbT+a21zFkYMs
 dMU+exBZz6JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEb27AAKCRABygi3psUI
 JPDcEACXAPeKbolXqg03eEru1TW7lWCQ6RPi4XUsGtQP3Qlrwq6TIxfHsjD/eNXSi85/dJM6UpE
 Ie7BDF8L4S6bVfsaZh8WLlGXe8/VpGEo0DK0aCdKUhg3yVYv5A+orpxheFgIEWS2cKs+/x4z4TR
 FSRtT1ovLmxeAoF6JJLPRnoUr6l7LTSHrkPQao9YztEv+yQ6ZoHwtamzhplHEVuFLvWMKiblQbx
 wLlDxQjEtcULk1pSUkfDIVaKWPmfoITGopUgumPwmEdZIO+5gNsuV1sKduLfjrs7wYGTePf1Ypo
 uyNu2ry41rRo10qw1rCAMoolpgbrYYXOAOnXEY3faGiHRy1/3WLv9WP1ZHV9uPmtmb85hPKN5DE
 hltsq9fErN+D7+nVrfXZst8JbNXfHkVTR78a5WP6wshssfqiorSS7tnkgKcoVSbsCtm7hpilhm2
 i7iLNLo2U+5IZX8K03KTf6NuACNl7ydxvBtZdgqOdyIA1UOn0Y5lm6bR5LZhPv9Pca5FPlw3yCF
 dDh58y1ejDI0tSzTE3weRFPT5CyjtQLbwV45+DoP7FNCOn6wLoNOk+PK3tM+pSTv300hdW7aMI6
 iv/PmhpmgtzkEZbwRE+X6DS1vffslZF5Qih3tdT2eeQ4yEDI9EDg6XnBex6jRJOy7T0E2fmzAmG
 5dJwu+lkn8Agqdg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_080005_536559_AA7AC09F 
X-CRM114-Status: GOOD (  10.99  )
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

Add SPMI node for Apple T2 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8012.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8012.dtsi b/arch/arm64/boot/dts/apple/t8012.dtsi
index a259e5735d938cfa5b29cee6c754c7a3c0aaae08..60e73a0401a80abd03f82d24845dfc12d8770ebf 100644
--- a/arch/arm64/boot/dts/apple/t8012.dtsi
+++ b/arch/arm64/boot/dts/apple/t8012.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/apple-aic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
 #include <dt-bindings/pinctrl/apple.h>
 
 / {
@@ -220,6 +221,13 @@ pinctrl_aop: pinctrl@2100f0000 {
 				     <AIC_IRQ 137 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		spmi: spmi@211180700 {
+			compatible = "apple,t8012-spmi", "apple,spmi";
+			reg = <0x2 0x11180700 0x0 0x100>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
 		pinctrl_nub: pinctrl@2111f0000 {
 			compatible = "apple,t8010-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x111f0000 0x0 0x1000>;

-- 
2.49.0


