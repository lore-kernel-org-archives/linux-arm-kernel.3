Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253EBCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 15:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TMVheGalK8FFbFn0JWrh/VoA/5vQNhUL74QB4lSqKMU=; b=O/n2wDBW0Pon8CIor0HHy8ph8w
	Gsvoc+k9/PIKawUmAqjhcQNrSc5QIz5DdEFV0fQskZBxietLIhDkpd59x0Pn/Y5hKRoe12GVkCC+/
	80ek+FPS0q4+s06vW5efPQVWXk1d7YdOt3xQ/HStaG6Ct0+ZzceAqbOlbn1JS8mxsAxDmrTL3z7Ho
	L7fxxihKf4aEvMzJHNUlaOd5skvM6kBneFhJOtdhAeUhm83TpGNDKTM2u3opH5XI2cLFKjSsAGptJ
	aU63g3I+gpY43Iq083JYAm9pupjhUzHZppRjd4o0gOm4fjd5El9QrwvAYa7AqR+ACYcCS20kQCu4T
	R1sPL1Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBECY-0000000HTwf-2Hi9;
	Tue, 21 Oct 2025 15:23:06 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBECW-0000000HTvp-0QLY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 15:23:05 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b3e234fcd4bso1015069366b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 08:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761060182; x=1761664982; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TMVheGalK8FFbFn0JWrh/VoA/5vQNhUL74QB4lSqKMU=;
        b=NvpKf4RvhKM3QECMcZTYZmseiWc/jMeGp4cTacRtJ33/YeqgNHGF2RW4KC6wmuABwL
         a/kFCrnF/B68h+Mj4a9j5L8nCpwcrTB3Wa0IFddFCC7pbfG8ZJE/AjhJDdbEzNvUiB3R
         H+UkbLcGelcORQesEFGAhP/Z76lvqGAInSFykVZmCQDkp8a0N0eo6wjmntI30jDC5/DS
         zuR9XkWCmADQau7rm3KjSNEZ1pOYSBEmYGQ0VjXH3C3nRvUPZzQ14ooMygG7EgWJpRni
         PFeg5Rd86bjeDLA34xEMwuDDb4x7IwXvydqqniaNbgH53CnFfigAnoSQcp+2YJM6Wkav
         jGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761060182; x=1761664982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TMVheGalK8FFbFn0JWrh/VoA/5vQNhUL74QB4lSqKMU=;
        b=kvwqExNsaJ/lGclvgX8l8fODiMCXfgC6hcA1oN5YOVHUy+uV3xuqE1+5hfjKv1caYO
         7yJfyBtalr0vvDqyi5Hs9D4RB11wDq0N/+SahpeDQjfX+lKVWTZR8pxw6mUtEwVF89Rr
         z4hcydLl94INhsp0F5eRgo4Neg2DcW3vUdkOdYgcGER0oVqVN14ViAmwY+rZz9aOqjFS
         YgdQSgPSuXMMYS+OjFCIAyue53xh1k5JcS7q9hhSTO3BWNO7GpdEZsLG7c6K/k1nvtIb
         1rfRL5aeyoZNyP83dy+HsPB7akL/kuB5IliG9Qi003IvTd7g6y0H3NRf53+qHar+xQhK
         6vJw==
X-Forwarded-Encrypted: i=1; AJvYcCVvMXWpIFoeH5iH+GttLTnvm2H27MDH/2fN5nPEdbqHPCSciUgCGBhJX8BreER/L7wsw9/0E+Hrc9PU98AVBQ63@lists.infradead.org
X-Gm-Message-State: AOJu0YxbKHZ4kFDYO/GGVHAWg8yGygfSRofdz+dO0Qm0dnBvTzSh4Jh9
	YiUNXlANRDLFe0/xJQiqJqwwwlJabYyO47/0Fp44U02aSOsA72dKUb+h
X-Gm-Gg: ASbGncvulaNI+lHWpIM5SUFiLuFh1433ArnDI2SZU7prJ3BoELBqgEhi5Hi6VU++xJX
	CgEQPXlxqWHfg2K/b6hLYhHkFd2P7A1caQt4ovgXNRijUinsYzgmJ7AsM/hao//qBKwl3w1CQRF
	T6/9ux7MKAnJ1ejo2pJ+GBfDjhgv1JAOS0ih2ULHApKuxBbaYVxCCNPNfJPdrTWzCCSYPEvpnzD
	OWQKkp3MaK5WCxRB/2sQOLRqBcaUaThc/8f7Dp1xGNDsCEArEUWhBg3mX7jgZt57FpDQtIs/z7p
	RlD2dLMb07eo8SRz22hDrA5QXR6lvhZbwaIgXIKTDpIHiNEfFGDwl7RTwrqQGyRZh7U85DNvXki
	wzgA3vC6LRuq9tJUCnXj13ZtBz8e/cuTe5l06OTb1COvzBvE553fP15WJT3y+KZmmRTrwVcYCMb
	zn2bZ5tvGqLsOQ6uo1cx9wiO1zIsKPJXiUac7D0Q==
X-Google-Smtp-Source: AGHT+IFjAc5AXcoHcQ988nnPs6wGFM+kl8yEEIE8fwdc9oeO900YlPPXdG3f/j1Bm9ul8xq81jy+LQ==
X-Received: by 2002:a17:906:fd87:b0:b07:c5b1:b129 with SMTP id a640c23a62f3a-b647195b8c3mr2176066166b.1.1761060181709;
        Tue, 21 Oct 2025 08:23:01 -0700 (PDT)
Received: from tearch (pc142.ds2-s.us.edu.pl. [155.158.56.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e8581780sm1082737866b.31.2025.10.21.08.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 08:23:01 -0700 (PDT)
From: muhammed.efecetin.67@gmail.com
X-Google-Original-From: muhammed.efecetin67@gmail.com
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	heiko@sntech.de,
	neil.armstrong@linaro.org,
	lee@kernel.org,
	rafael@kernel.org,
	efectn@protonmail.com,
	daniel.lezcano@linaro.org
Subject: [PATCH v3 0/5] Add Khadas MCU and fan control support for Khadas Edge 2
Date: Tue, 21 Oct 2025 17:22:40 +0200
Message-ID: <cover.1761059314.git.efectn@protonmail.com>
X-Mailer: git-send-email 2.51.1.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_082304_153646_7C7159F2 
X-CRM114-Status: GOOD (  15.15  )
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

From: Muhammed Efe Cetin <efectn@protonmail.com>

This patch series adds support for the Khadas MCU and fan control for Khadas Edge 2 board.

The first patch updates the device tree bindings to add new "khadas,mcu-edge2" compatible for Khadas Edge 2.
The second mfd patch removes unused nvmem code.
The third patch adds the Khadas Edge 2 registers to the mfd driver.
The fourth patch adds support for Khadas Edge 2's new fan control registers to MCU thermal driver and the last one adds the Khadas Edge 2 device tree node for the MCU and fan control.
And the final patch adds the Khadas Edge 2 device tree node for the MCU and fan control.

Changes in v3:
- Renamed the compatible "khadas,mcu-v2" to "khadas,mcu-edge2" for Khadas Edge 2.
- Renamed KHADAS_MCU_V2 registers prefix to KHADAS_MCU_EDGE2.
- Used of_device_get_match_data instead of of_device_is_compatible to identify the MCU variant.

Changes in v2:
- Added a new compatible "khadas,mcu-v2" for Khadas Edge 2 instead of cooling-levels property in old variant.
- Added Khadas Edge 2 registers with KHADAS_MCU_EDGE2 prefix.

Muhammed Efe Cetin (5):
  dt-bindings: mfd: khadas-mcu: add new compatible for Khadas Edge 2
  mfd: khadas-mcu: drop unused nvmem code
  mfd: add Khadas Edge 2 registers to khadas-mcu.
  thermal: khadas_mcu_fan: add support for Khadas Edge 2
  arm64: dts: rockchip: add Khadas MCU and fan control nodes

 .../devicetree/bindings/mfd/khadas,mcu.yaml   |  5 +-
 .../dts/rockchip/rk3588s-khadas-edge2.dts     | 58 +++++++++++++++++++
 drivers/mfd/khadas-mcu.c                      | 58 ++++++++++++++-----
 drivers/thermal/khadas_mcu_fan.c              | 20 +++++--
 include/linux/mfd/khadas-mcu.h                | 32 ++++++++++
 5 files changed, 153 insertions(+), 20 deletions(-)

-- 
2.51.1.dirty


