Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4948DCCD18D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 13:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4pEYynqLlf97tqquz7gBzDn5fbpmeV4yt44zAz5u1qM=; b=vAA9dfCocwpwSb
	iEbzadXl1MOMeHQiFVjb/01HXZYadGWDERfElAQCULyvMpgE0HugNQf0HnlbHvnv5Z9qEed81dgjz
	/hcRbR6147UW2zAYiaR9HIeBOAyKd70VGdNFD4rKg24OlhjberBhMcfCanisUY7nu+vr/pDQ0DalI
	bIurJx5YLoDniyLjsF2lfwphyy+ANKI6U1RWHZXrgrsCJbmbqkcd4NPDOQkIWp1byPhjbp94NFntI
	fhinGV9ZzaKIG3Asnhz2JW6uHqNkWZeN5nBQFiKg29CWQFYf7fo5Zm13jKJo/ohvzRRb7OqPf6fcz
	BhP5RjK0qt9kGv6XeuGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8IoJ-0000000DFRD-0TWO;
	Mon, 13 Oct 2025 13:41:59 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8IoH-0000000DFPv-0SyD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 13:41:58 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-63bad3cd668so1521490a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 06:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760362915; x=1760967715; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4pEYynqLlf97tqquz7gBzDn5fbpmeV4yt44zAz5u1qM=;
        b=hjrZXrDTyBrGq5TXB1HS66HB/rKdHEMFC5qNz3nw3qWIyKOmeMVb/JbTb7lISiGUJC
         IDHkzHfsl5QrfKbK90v359QEr4sVU6WBewjN10ppvdZRyLmpBIMDr0x10yAJQbiUi+oP
         LJfJ6NVv7pAc8pVZSgh3xR8bl2S0QLh1DZbDUXEB7s4JouKCaOySQVxHBk2GhPAzx/05
         I8Pxcf80tRAIRTZpvpWaZsU9Mr6kMcvfTtOhOoewFvd6w8DvCtRkt0mj7mQIlKr1K222
         yufqImM7da0nT7+PKKJMZawigZWQTofgBstyGjGrftRyMGCUON+6yhPgyYVB4rPYu2rM
         nnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760362915; x=1760967715;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4pEYynqLlf97tqquz7gBzDn5fbpmeV4yt44zAz5u1qM=;
        b=pwrMDE8hryFTIobQktyE1/TESPfFa1wYDoV25viBJPmHKITlhl6GVD985R/ZHYB1X7
         rI+8WNUG/9uhsDJ2GZODXkTiIfN4GXy7wfILUvl+RF3UNc7X8R7IcnefwBzy42wqlwV1
         /h4DwE2SaMcP0JRN+vMA1YYOg0GLf8pibLMw5Rr+Yd+xHvMQHXWWhlZUIVmOXrkmviY0
         LIDP3aQ5k4TUKreBf/EItyXcHbAU6z9Gi0s6lWX30rRPdawnbRrJnylj5OveXpVi0Bbc
         uvnw4dhpzEJox8FWOBPBVZGrJA3vI6sdfrRZAzQzOfouA5G6T3dhhvtvBj8kxH08Kjeb
         SLOg==
X-Forwarded-Encrypted: i=1; AJvYcCXm5H2m3087KPvRToxK8fA+yqJqoEU8x/YZuixk9imdU2WdbxD9ezEHXqrrss4QncAZZJc4APO+NhvQmKpLyXRl@lists.infradead.org
X-Gm-Message-State: AOJu0YzBT9nSUvTq/f4t1N/7IizM+0RW2j62JqHXLp5VRkU2aADjgi0S
	v1CLEL9RewyZW3Q4Ya1EMhwyrW5wx6D4CtyGFUMo0hyal1zjxWsGm9+P
X-Gm-Gg: ASbGncsuh017nGzVTvJAGPKwdyPqN5LMNC72zCBoU7s0QLGq25+/SbCHfIFudyMFses
	6EjxS7Y/Q7Id9sY+I8LQJbo+aWrDyXv1wxkOqBZKU9p07lXaLslUUlZVEx1276Kg7ms6b236/k5
	sK8UCNisPNvdfy8PwWG8O3BfuSCBJ+xEFVRZLwG3Kx93RQb8igR6nlZcGZQScjhHfFK+NWcD3pG
	WCsbVABa+UK93erHWEF/QT3TxKz5JQAI3LE8xClkWGg9fCV7WId4SRH7fMTCloTVcaP5VKJ31xs
	ctbqNt3ETb6xdChzNY0+ahz/53PGiBeH2KaQtjj56jRAKTGB9Ed451PHKVrePlcBRplH4f1JYKZ
	voxI8WDt9tGOK7UXU7ON80jzBSPlTIomUoP96CRdj07F5hKNG7A8t3xJEbf6+P8bdRSN/i+f6Vl
	YSE5AtubDgZka5wLxc8sxB8kA=
X-Google-Smtp-Source: AGHT+IGTniZJrYciFFYZBc7bF6mk7b3Np/gZ8mj4KDQqFogc0fSKiYX5xC7hJ7v63RRcAe0CRjZAKg==
X-Received: by 2002:a05:6402:50c6:b0:632:930c:ed60 with SMTP id 4fb4d7f45d1cf-639d5c57a9cmr18367424a12.30.1760362914853;
        Mon, 13 Oct 2025 06:41:54 -0700 (PDT)
Received: from tablet.my.domain (83.21.75.22.ipv4.supernova.orange.pl. [83.21.75.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c32249esm8729019a12.41.2025.10.13.06.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 06:41:53 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH v7 0/7] clk: bcm: kona: Add bus clock support, bus clocks
 for BCM21664/BCM281xx
Date: Mon, 13 Oct 2025 15:41:47 +0200
Message-Id: <20251013-kona-bus-clock-v7-0-8f473d99ae19@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJsB7WgC/2XOQW7DIBCF4atErEsFAx4gq96j6gLwkKAkpjKt1
 Sry3UssVbHs5Rvp+zV3VmnMVNnxcGcjTbnmMrRhXg4snv1wIp77thkI6ARI4JcyeB6+K4/XEi9
 cgzNEyZPTgjX0OVLKP0vw/aPtc65fZfxd+pN8XP9TuE1NkgtO1hjXG+Mxwdvp5vP1NZYbe6Qme
 HIl1I5D416hiugxGGe3XK253XHVeI8pdCFFFdBsuV5xuee68dRpLZGsApu2HJ/cyv3zuHCPqtc
 OhNdrPs/zH0h8yMqoAQAA
X-Change-ID: 20250212-kona-bus-clock-4297eefae940
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, 
 phone-devel@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alex Elder <elder@riscstar.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3090;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=jofWWnwmoG4Nrm+u2R6rEX8xNv7yEnOjBBXdOGfBxTY=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBo7QGfsqDN//gqTt9R3qAwvz9aqyD+IazKsaM/t
 knYTxVTgLeJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaO0BnwAKCRCzu/ihE6BR
 aI39D/0X/eu+v0YEBQ0VmNui0QudP42X0o5jin/jjC4l4X2qk9bEyFuipLBEKShMoN5CDEQuK8V
 bnKcFkFtzfrAVHLAbS3MZeEtTaSnV+RGe72uuMIgWvN0HloBShTTvLPscfE6eqjFNjEHW5KL4Ir
 c2hidjnG8fM9YuITj2TECgcG/V0GMVAItCQmfonCSDSghJ4EkJhGGW7UXK2txDfeeHbukbopNt0
 xQPoCJj93OpDPADkXeBrm+vHPWVrvC9EDt8NSXf8ZVv6On0YYgcjDYPFsN1VgfbkXjZpWwnkHJA
 oJkg+dtKNCnbdyYcgfi4NvSTYYfpgNj9AZcaijsN0nzD7ep6bGmcJRjzbcI3nTwQUagfdys2WHG
 otC++HrlPcukmFX9awoCuCDwvHtXFxmXN54nQD1DUv7T5zohwHJw+wucfIOneEyx19B28e6jTFY
 4cDuQGs6X+9zKFr8tVD49njdwjtyCw9aXx/G6CFwOOSrQ6gIVaj3lmhJKiTt8Hlq+K54GTel2Gs
 En416gwixlgYjlSg0wkIZvImSVTe7n0HS2gZAkNNidKHDT8tJrV17CIM6meumFN6Qix2ifiG2XA
 01uG5sL5Yt7K5X0Nc10SbsgYY8pOem5KpOc3mYGerELAqODmicLitZsg6bTLDa/XZ7Ic70DAxIQ
 8CeferthCAFGRwg==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_064157_201967_B48C0B18 
X-CRM114-Status: GOOD (  12.78  )
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

This patchset does the following:

- Introduce support for bus clocks. These are fairly similar to
  peripheral clocks, but only implement policy, gate and hyst.

- Add matching bus clocks for BCM21664 and BCM281xx peripheral clocks
  and update device tree bindings to match.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v7:
- Drop DTS patches to make merging into the clock tree easier. They will be re-sent
  in a subsequent patchset.
- Link to v6: https://lore.kernel.org/r/20250813-kona-bus-clock-v6-0-f5a63d4920a4@gmail.com

Changes in v6:
- Rebase on v6.16
- Make kona_bus_clk_ops const, add a new commit to make kona_peri_clk_ops const as well
- Link to v5: https://lore.kernel.org/r/20250430-kona-bus-clock-v5-0-46766b28b93a@gmail.com/

Changes in v5:
- Pick up Reviewed-by trailer from Krzysztof on patch 3
- Rebase on v6.14
- No code changes since v4
- Link to v4: https://lore.kernel.org/r/20250318-kona-bus-clock-v4-0-f54416e8328f@gmail.com

Changes in v4:
- Rename moved CLOCK_COUNT defines to CLK_COUNT to avoid redefinition
- Squash BCM21664/BCM281xx bus clock DT bindings commits together
- Link to v3: https://lore.kernel.org/r/20250308-kona-bus-clock-v3-0-d6fb5bfc3b67@gmail.com

Changes in v3:
- Fix DT schema example in BCM281xx bus clock bindings
- Move CLOCK_COUNT defines from dt-bindings header to the driver
- Fix BCM21664 UARTBx_APB IDs being out of order compared to clock
  driver
- Link to v2: https://lore.kernel.org/r/20250303-kona-bus-clock-v2-0-a363c6a6b798@gmail.com

Changes in v2:
- Drop prerequisite clock patch
- Move clock/bcm21664.h dt-bindings header change to dt-bindings patch
- Add BCM281xx bus clocks
- Link to v1: https://lore.kernel.org/r/20250216-kona-bus-clock-v1-0-e8779d77a6f2@gmail.com

---
Artur Weber (7):
      clk: bcm: kona: Move CLOCK_COUNT defines into the driver
      dt-bindings: clock: brcm,kona-ccu: Drop CLOCK_COUNT defines from DT headers
      dt-bindings: clock: brcm,kona-ccu: Add BCM21664 and BCM281xx bus clocks
      clk: bcm: kona: Make kona_peri_clk_ops const
      clk: bcm: kona: Add support for bus clocks
      clk: bcm21664: Add corresponding bus clocks for peripheral clocks
      clk: bcm281xx: Add corresponding bus clocks for peripheral clocks

 .../devicetree/bindings/clock/brcm,kona-ccu.yaml   |  49 ++++++-
 drivers/clk/bcm/clk-bcm21664.c                     |  99 ++++++++++++++-
 drivers/clk/bcm/clk-bcm281xx.c                     | 141 ++++++++++++++++++++-
 drivers/clk/bcm/clk-kona-setup.c                   | 116 +++++++++++++++++
 drivers/clk/bcm/clk-kona.c                         |  64 +++++++++-
 drivers/clk/bcm/clk-kona.h                         |  14 +-
 include/dt-bindings/clock/bcm21664.h               |  17 ++-
 include/dt-bindings/clock/bcm281xx.h               |  24 +++-
 8 files changed, 499 insertions(+), 25 deletions(-)
---
base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
change-id: 20250212-kona-bus-clock-4297eefae940

Best regards,
-- 
Artur Weber <aweber.kernel@gmail.com>


