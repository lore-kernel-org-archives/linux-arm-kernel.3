Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B479E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 00:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AO3soVr9XeZIH5pXIRja1M9WT+SGZCTLZzJASS8mqEs=; b=jxoTT2QZU6bmgMpd0SbBhBbjUs
	fByWrPwh8ZvOvY8TroaLVIGDp3tvDSTP60j/PHlx9WLjkjlm0QTYF8iHCMG8fZdOasn1jLbbJJiaY
	/3db886PEBlruvy+EDBo708cYp5qVsFsKfyNA7H6zaYCZ+ULIWsELQZfVOrcFwSK9pQs2wNyW4fo2
	6pJY7FA6OilWI+6+XscUrnY/3+MyIPZJNfpK2Ut8j3roqKTcLrHSKfXPAkbK5WGzewIYT6AThfTpJ
	8/vjxUSQUAmvNnUdCylgIXZJyU6N8Ep3aeMIBYat3okmBFLywvk+51BQkCydRfOW/AMQmgi2igLEZ
	QXo96kEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVgPe-0000000AExr-2coD;
	Thu, 09 Jan 2025 00:28:38 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVgOE-0000000AEar-35By
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 00:27:11 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2167141dfa1so6064415ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 16:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736382390; x=1736987190; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AO3soVr9XeZIH5pXIRja1M9WT+SGZCTLZzJASS8mqEs=;
        b=TyHRfCzborHuiyPg9Ool9UXUOL/CbJQ42CAXIdV4/9vyR8ZUiYUvU74WKuA4zKlyA7
         oZVfFRFwgXj/14o1IY91y8YVcHnV1GxY1oKYIkWaXfOxXBi1UB8fGv7pjHFGbnvGFhnQ
         4ulqGJXYofCJvbDHLHt9jrQ2c7+jC812KUe+IiHbhY/1iGo5Oi3hIsap3tWMxle0K/G9
         cVPaymfiZ0vPd3HbZoD8jVzEKTulBh4ZXoJX/g18BL3O3EU48eEt1zggLjWb0kc0UC4I
         rTSSqWNm+Jr8dIn+4XO+SDyxvjY1haPiuvXNQsCMC57RpzB8TdQKippIy8KNjCXdLKYU
         53EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736382390; x=1736987190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AO3soVr9XeZIH5pXIRja1M9WT+SGZCTLZzJASS8mqEs=;
        b=nk/BDnjiGf1VxojLMw8ndp1AqYlsTLOk1Tavs7WnjI1YjZ6lBw6wmNEkq6DtJWrLhC
         oiS67+qfhMDyU1pISyviTd7Ir6vkNKlzv7wpG+t+1PnJ+yie5VzSV1UseNdBtI68+WQA
         A/RTrSW6qWoKS/oqWgp+dLcL/LveinFx9owNR2OGU0eIXLKxYyGKIigiPYYgAMSINcI8
         KiPFQhFX18SztZuh3KnSvfJgrOCAGyQ7QDNxLYmyhLVnE4e4UhMTi0ECzg8sHL9S+H9Y
         aAn9+BPENITP/JNquw5YLOvW//o3KYCdoNT34jJjLkE+o2wDLvsvJ3Tc1EyiI9adbG2c
         vcUg==
X-Forwarded-Encrypted: i=1; AJvYcCVLUqOpWWO4Pa3/vINiu0n1T+RqvF19QBLOet9URwVSLQoIs9v9Y4Tix+Uzk2u6jx4+eu+mHGAEj/TW5mR+mbzX@lists.infradead.org
X-Gm-Message-State: AOJu0YyrQDeRa2UfTON/YTJxTtw3FM/3xf/mUikW52cRoKgveqUxGDae
	i1Or1+M36ExwV9aahX1tWZHbRPdniIOjCG3UEL6Bl9XCA9E/mwnn
X-Gm-Gg: ASbGncul1NsUv2tFUvyNt7yMJ7nZJF+C8I4sv4wxAIy0e0gyZ5d9PTsqyu3Q02nM7ib
	k/AB4wL8oyvUF8kyvUDOkpR78ueA/lhErs1gFFrDE8+0J2/sHgcX9kQbtua37yt51G8BicdRvLe
	i+aPGVjbK1mjDOyCCwzMSIuH9VBAntH6aI+HyQHpuo6xb6frezdzit7GPc7EmQ8y3kPwbeU425d
	ICsJlpWQx1eM324hb4HlPplCvOK6+U+ekSEHk/x9aMoupRf37QHzM5jCIG0rTXva45a7ksooehT
	XUbQzR48vUYGsEa35gcM3wdsPAd8WRsTHv5AJNeZyg==
X-Google-Smtp-Source: AGHT+IGZ19XFod5H279cQEJQxq+N9mtr7cuGpxjJ//cedm5qqwrbk5U+JAChJTS472ukQNG6oHnvyA==
X-Received: by 2002:a17:903:22c7:b0:215:3998:189f with SMTP id d9443c01a7336-21a8d64ebe1mr22385795ad.6.1736382389772;
        Wed, 08 Jan 2025 16:26:29 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca01989sm333481435ad.239.2025.01.08.16.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 16:26:29 -0800 (PST)
From: Ming-Jen <mjchen0829@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	mjchen0829@gmail.com,
	sudeep.holla@arm.com,
	arnd@arndb.de,
	peng.fan@nxp.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	dmitry.torokhov@gmail.com
Subject: [PATCH v6 0/2] Add support for nuvoton ma35d1 keypad controller
Date: Thu,  9 Jan 2025 00:26:20 +0000
Message-Id: <20250109002622.771-1-mjchen0829@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_162710_777448_DD977F05 
X-CRM114-Status: GOOD (  16.53  )
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

From: Ming-jen Chen <mjchen0829@gmail.com>

v6:
  - Update nuvoton,ma35d1-keypad.yaml
    - Modify 'compatible' to make filename matching compatible.
  - Update ma35d1_keypad.c
    - Modify 'compatible' to match the name in the .yaml file.

v5:
  - Update nuvoton,ma35d1-keypad.yaml
    - Reorders the items in the properties and required blocks to ensure 
      their order and items are consistent.
v4:
  - Update nuvoton,ma35d1-keypad.yaml
    - Kept the same order of properties as in the required block.
    - Changed register addresses to lowercase.
v3:
  - Update nuvoton,ma35d1-keypad.yaml
    - Removed vendor-specific properties and replaced them with common properties
  - Update ma35d1_keypad.c
    - Modified the driver to reflect changes in the YAML properties
v2:
  - Update nuvoton,ma35d1-keypad.yaml
    - Fixed warnings and errors generated by running checkpatch.pl
    - Removed the previous version's properties and rewrote the
      properties in the Device Tree schema.
    - Renamed the Device Tree binding file to nuvoton,ma35d1-keypad.yaml
  - Update Kconfig
    - Added COMPILE_TEST to the depends on line in the Kconfig
  - Update ma35d1_keypad.c
    - Refactored error handling within the probe function.
    - Fixed the mixed use of devm and non-devm resource management.
    - Corrected alignment issues in the code.
    - Updated suspend and resume handling methods.
    - Fixed variable naming to remove camel casing.
    - Used for_each_set_bit() to check key states.
    - Modified the code to align with updates in the device tree binding

Ming-jen Chen (2):
  dt-bindings: input: Add Nuvoton MA35D1 keypad
  input: keypad: add new keypad driver for MA35D1

 .../bindings/input/nuvoton,ma35d1-keypad.yaml |  82 ++++
 drivers/input/keyboard/Kconfig                |  10 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/ma35d1_keypad.c        | 387 ++++++++++++++++++
 4 files changed, 480 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
 create mode 100644 drivers/input/keyboard/ma35d1_keypad.c

-- 
2.25.1


