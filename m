Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B368C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 20:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cdAQWN4AxqGOJCdFwI3NHZplXBxu4k7L9Z5qFft+R/U=; b=NdXBp37/CRo1Hh
	fHempqYqboRveSg3uZFlTLghHoFtfRp0+x5j8cuEeUcOyjPZa0D0wCT3eXHsE4tqijcKkjnDF3DbQ
	IXU/Hjio2TSUupskZi3sSFpgMG9NLljnba/0v7eSzaZwrT07t8XKV059uX32DKmmNw7xKRARSFyVM
	pysz2L5tAfLqALji9wyDJjUSNatVqOCrVOwivKLQHGjCya2f6JdoSRfKA2N8mtRlVCfLKiBBai5rX
	knGMKjY1b8K7IIACmd/eTBtLWnKvnH+eRGNlrLviSDPO9rRCjkV+u1ZK1YMEFOkozkXiA8zNJHi3e
	jvF647HWiOmqbnwm0G6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo5HO-00000001Zx0-0pqd;
	Sun, 26 Jul 2026 20:16:58 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo5HL-00000001Zup-0zb7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 20:16:56 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-47f707e5d75so1349245f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 13:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785097013; x=1785701813; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cdAQWN4AxqGOJCdFwI3NHZplXBxu4k7L9Z5qFft+R/U=;
        b=HhZTLgv+Jq4GFjutaAb+5A8h01QH/8cAKnEVjK379I+O8x5Z92FpNm3/bZBH4oEecE
         KXjsDkZGzkBS8EqY9fVU4Ou5WAFKMf9uOpThgxCObGqaP3gS5eijftZG+CodAqC5dFEr
         BlMkRZDjwYQSDp+3Uc2adHDoZ837ZaQI9gci/x894j5vjvnFCgt/DAhXdVFN555i5yod
         xhLsi8ewlBXdKqtvcek3D+7i7G7CJrLp+zP6rq7QWN52m11qQU6RnupTMo91zzUtV38E
         jlJjMEONWAU8mifYb7xpLdeEAd6nzyaQxnJC6zvwfTM7g/PQ4qN5J4Mgb3mcu5TfXuVO
         Bv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785097013; x=1785701813;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cdAQWN4AxqGOJCdFwI3NHZplXBxu4k7L9Z5qFft+R/U=;
        b=oFVDI79gZCkZzxwHxUnVMyC9aQEW8NvcbNa2Ggza74FW8umEjbahvQqkZsc6uDplon
         aNyoWnDJ7EqucZFhGpGKRGdjp+NfCHPhZxBT/uxvhmImqpOkobssOim6HJe4v3wQIwts
         uyD38NqF+uB2vAo6GPe/XvWChWKhW7H2jL/gzpj24uv6q+ZlZ+welMfj56dVrBX7wGAo
         SbtPH6t/M3VZuQ0N5BpocgsllXVhtfZaghZFZmrb4j8J7JXY+Ndbl93g/isqFQm9gkgO
         M9PTK8RbVZe6MAQAcq8Svx7L/kPfPzQObJUtsAHDIw3dChRoyHV/XFNyTic3SJn90F+c
         0oXg==
X-Forwarded-Encrypted: i=1; AHgh+Rrwt0SGJMFjjG/AUf2dY76XA+plIs290v7+xn67L9xxCXFQNyH8sZmUlEGSBLZXnKNapHzuRv35bBCCmR7LsEjz@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3Z1pH483DPcBYxkCGqmRKSoAX7jxKJdQjCpgbNKhxjflDh2nr
	tvd9GHeJaDfw16wiEPyaQbF7jNpishUfd9Qp7AS7uUBQiPUV1Akhxgk1
X-Gm-Gg: AR+sD11MwPrueOcLQIsOcOfF/qcOqT5g8P54fvKrSuL5o7loqxr307uDV9zpEeCHHaa
	nrT2VdRp0AbCnEsG3Fjf/HzEWIeTSmfB/HKrMG/buc+Nn+OuabXmxNjRlNbVaqFOZEfKStv6U0r
	g1+ndKKsh9HzURnJ8nowpTt/eKNxYydRpq3Wlo9jnTTZg+NmvXelQWq0QeMT1Hn/9b1828KPtVt
	nHEpoNIDnWaIsQVcDX2dGBRWL9GYF98zseTOWOs1fk91JhvoYItfbb2A6R0uxbXB6N6F6Wn4h5P
	o2JHJD2rQWEeTovXjfCN5Df9X0/XIDoz1UxUyEnTGZeKZeOkC8MeBuOKr65Lbf3ySNR7xBVkLBu
	0oEz3P//zUgLirxkqhMFiqaHxeK+3T9bZWQT4QrlEuHZCqC44HIG1OXy8I5+sTxiagZ62lqD6Zd
	w1Jx1XwLNlnz27zulj/XC4xLJBi8c3B1FrGI7QsA==
X-Received: by 2002:a05:6000:1ac9:b0:47f:8f5d:182 with SMTP id ffacd0b85a97d-47f9feba3c7mr8328950f8f.61.1785097013209;
        Sun, 26 Jul 2026 13:16:53 -0700 (PDT)
Received: from slackboot (93-34-145-231.ip50.fastwebnet.it. [93.34.145.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c52fa9sm43621117f8f.20.2026.07.26.13.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 13:16:52 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: robazza.alberto@proton.me,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 0/3] arm64: dts: amlogic: add support for Orbbec Zora P1
Date: Sun, 26 Jul 2026 22:16:44 +0200
Message-ID: <20260726201647.264108-1-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_131655_294614_E96172E9 
X-CRM114-Status: GOOD (  13.38  )
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
Reply-To: robazza.alberto@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The Orbbec Zora P1 is a vision development board based on the Amlogic
A311D (Meson G12B) SoC, with 2 or 4 GiB LPDDR4, an Ampak AP6256 combo
module (Broadcom BCM43456 Wi-Fi over SDIO and BCM4345C5 Bluetooth over
UART_A), HDMI output and Gigabit Ethernet.

According to its specifications and original device tree, the board is
a revised version of the ODROID-N2 with Wi-Fi, Bluetooth and an Amlogic
A311D instead of the original S922X. The device tree therefore builds on
meson-g12b-a311d.dtsi and meson-g12b-odroid-n2.dtsi, mirroring
meson-g12b-odroid-n2-plus.dts. It extends those descriptions with the
board-specific AP6256 wiring. The status LED is green instead of the
original ODROID-N2 blue and has inverted polarity.

This series consists of:
  Patch 1: add the "orbbec" vendor prefix.
  Patch 2: document the "orbbec,zora-p1" board compatible.
  Patch 3: add the meson-g12b-zora-p1.dts board file and Makefile entry.

The DTB was built, validated against the amlogic.yaml binding using
DT_SCHEMA_FILES, and boot-tested twice on the board. The AP6256 Wi-Fi
interface enumerates and operates with the GPIOX_16 reset and PWM clock
description present. Removing the wifi32k and pwm_ef descriptions causes
the SDIO Wi-Fi device to stop working on this board.

---
Changes in v2:
- Investigated the apparent GPIOX_16 overlap between the SDIO power
  sequence reset and the 32.768 kHz PWM clock. Retained the description
  after two successful hardware tests; removing the clock description
  prevents the AP6256 Wi-Fi device from working.
- Sort the new DTB entry alphabetically in the Amlogic Makefile.
- Sort the "orbbec" entry alphabetically in vendor-prefixes.yaml.

Alberto Robazza (3):
  dt-bindings: vendor-prefixes: add Orbbec
  dt-bindings: arm: amlogic: document Orbbec Zora P1 board compatible
  arm64: dts: amlogic: add support for Orbbec Zora P1

 .../devicetree/bindings/arm/amlogic.yaml      |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-g12b-zora-p1.dts   | 103 ++++++++++++++++++
 4 files changed, 107 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts

-- 
2.55.0

