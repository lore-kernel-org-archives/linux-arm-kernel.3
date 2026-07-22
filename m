Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE74DC44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 09:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=czz2pXk/RoUWqIRbuJa5XveWzwRZGqxPRQFLkTx/vUM=; b=GchUZRjnAgB+3o
	In4yHviTKvxtwJrtL/jKEERzewsyqBFUK6kyKa2qX0Z5RusFS/VFYvFDPoOdDiksqjFOd9XYlJ0mv
	AyCefYihKfs3gUiiBCV5x6m41ypbM8ACPvXn3EL4oOljS6GZzzRzT9RcbiYRklxKXgwy4rLI/BD4J
	vODnLk8/xzHF9eo7NaCl3btzIvqS4FFWMh2zIBDEuyrtKRTU1zAY5UB+n1BKrtBV2cJ+sAy2i6ur9
	XZrmqAj4FlqM+U8e7oy0nCGAievAt1IBjLcU8S4Sj9p3cAYILi3F+nMC6DhoEJponEb/hyd1BJOWQ
	fZvb3buraoNjsq6kd3SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTgU-0000000BSxh-1h5n;
	Wed, 22 Jul 2026 09:56:14 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTgR-0000000BSwT-2JHP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 09:56:13 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47f7444576cso2361389f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 02:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784714169; x=1785318969; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=czz2pXk/RoUWqIRbuJa5XveWzwRZGqxPRQFLkTx/vUM=;
        b=k2Z6X81RKxb44HvX0u9so1fJ757vWRrAIYMiSSDc3klc0A03SqP5LZyfqltTu/dY0a
         Itvd8RlME9Ru4i0OE7xM8s5juuuZxUK9+DqfGaiHJtpUF9OzEIFUxR+ePZo7pvI+4jpg
         V+IoLdRaANl/r9VZm843ojg92UzCQIKYQuOpe8WZs1/pZjww+iRhmrDi4vHAQkXa9nDl
         18LuU9SX0WkSy++BXSwKiEGlSAhuNE9NiAOFu+Jla28/nTcuect6IMU/Kp01bA9RcMdo
         sV8Xp14wfL39DdzEaZRvQXNxg8DDYyk69tDiZYxm+ZzROjso+g1tUHQXUK4Z0fd/i0pW
         xLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784714169; x=1785318969;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=czz2pXk/RoUWqIRbuJa5XveWzwRZGqxPRQFLkTx/vUM=;
        b=O8QRI1TB6E09o7gGk17ISv8LiOC6qNrgTIV0y7q+WJndY6ykJpbNBnu4D4aJqNclEE
         FxXVYrLaiSNA1sAa+eMu3c1P/ILapB0Zfjfyjh8psRVBMVNvt7q7HWaTJLqR+w7Bk31k
         bazjqFCvGrxttT3Qlq9V+tqE/hxyy3rPkNSshwM+ltJJlNHcK6EGUXXAdoL9gzysk1Ys
         D7Ksn4Y5xfwd6pPBmiAiDFi7NpVXkU0UKC4CaT9jn8kCKGKh0BoCM1pr70moKmVZRV4n
         DHrZOVLNIPQurYjmkERqZYJWQY0083zuwbxhFkF//Gqpn7BtfUHAdrO2cxVjxGSRPvyG
         Adbg==
X-Forwarded-Encrypted: i=1; AHgh+RqFhRbLP4HZkSNhhigqRYBWWHxySR6QOaZzRxsTZhFUL9x3jiRXnvJ+vVfUlm1XJxvO8qal1CbhvQzmeU7C9krI@lists.infradead.org
X-Gm-Message-State: AOJu0Yypwo4vKLsqd90KAgHR4ohMuhETk6oQpAg/ZGRavx1iXDXcWU19
	D4djEP4Krg0ncJMNcjd9FWwJOKiSseZpHCm/xtVAA7qlGfd+W0P5uNY2l5wAActkNKQ=
X-Gm-Gg: AR+sD10ywk3Wyl7AAUquRXEISLR8ud9jBfUUppJnW2GDBZSpU1fBbBOzzM1fIQmXukA
	Jcncs9t76WmDwBcx3ZakGZGzno3sjTX2mvsTaQQu1d5sB10AjY7YJkzFUYlScJOtd7Z8Zncthfu
	o0jgkziTrX5TDLKwCaLt1AFB9ltIkitjljP8M9eO05I4gEZBAnCCxyyFLXzB/nkNIpO0k9cjx8m
	LLGbu0mRtioVrcDty5RVfpJ0oEprsrSKAwu0cB2z85JAIUJxvu43Bk4OEsMrQbmUtJF7Bg5m0Cq
	liZ6wPtbxNDjwS7DviqXjBiIvwGfqyY67zyJ1QWdxi+0w4xCW3EerhuII+nUlvmB6V+hOVKBCQf
	uFzvAKE89AZCqn5t2BibPLQ6mM+VWGgdcfJbpDKDQ8pmQs4HPLTP3b/mcSlCh8V06ekQJS2qdab
	f2jtpQKvEccJK5qRzmHKtHil8Wi4rTk5TkOw==
X-Received: by 2002:a05:6000:4211:b0:47f:778a:6587 with SMTP id ffacd0b85a97d-47f778a6775mr15011918f8f.40.1784714168736;
        Wed, 22 Jul 2026 02:56:08 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:314c:4601:ea7:d5d4:79db:6d52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c532d4sm4414533f8f.22.2026.07.22.02.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:56:08 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 0/5] Add Laguna/Tensor G5 SoC and Frankel, Blazer &
 Mustang boards
Date: Wed, 22 Jul 2026 10:55:51 +0100
Message-Id: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKeTYGoC/xWNQQqEMBAEvyJzdiCGNbL7FfGgcdQGiSEJIoh/3
 /FYTdF1U5YEyfSrbkpyIuMICrauyG9jWIUxK5M11pmuMeyPUBImjitHXLLrhICCcee5ZP58l1a
 8a7vJOdKTmGRR7Q30w/P8AeIvXNlwAAAA
X-Change-ID: 20260710-contrib-pg-pixel10-initial-dts-49f5ec657b66
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-serial@vger.kernel.org, soc@lists.linux.dev, 
 Douglas Anderson <dianders@chromium.org>, Juan Yescas <jyescas@google.com>, 
 RD Babiera <rdbabiera@google.com>, Brian Norris <briannorris@google.com>, 
 William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5682;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=9LvGxvNSc04gEvH05YcEvZdgJ9Kd3n1dE0XAfkXYM4E=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqYJO1FTOQh2Xnhd1R6kiN2IChC7cxVMZrCc8kU
 SjI5BBvxR6JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCamCTtQAKCRDO6LjWAjRy
 utZ/D/4wrBAifd5y+luQ/441+vTlMrCYREjybtztCUiD/tsCMVGvmJX6JsWuKzD3N1w8sWe0eJ2
 lwslJS3RMayKq1WFUSKEdEz1Bq0HJyUNCElAfCPMOol9NbTj7L8J7ub+/Mo3yDSUEEZVvNBnqC3
 G19HjiPTb4oap+VioP5/pMyera50ImWZHgxqcQs52Y/6oxtkgrLVqpZlIdabE4ps7pWsw/oFP3L
 ANjgO3r3qtoQ6vY7FBqbvOLWC6c24ev8UUcrMpVFwqG67+sgJOLe7D2TAHJB+2ypN+/eTvbZfhe
 BfXceBHhitrTXlxeD1oSokjOgM9J02u8u59fGmCVGkoxj+abuQ2PLBfh+lnQjbQXpC31Ssc8WFi
 1E+FckfGMU1squp+92je+rF1O3bnhIuuOqZu1xvtlKRSMBDKCL3Q1QlDHnfPuO4Jmp6IwbbAoUJ
 dEijNChKVMegNUqTJYmkmAyDLhcZxFhe4Ix+CkIdYzTa28X8BSsFihdeaA41uAtRLDpjwRtAM3n
 DCB3cDtkEANg/D9Wu0/e9hzHN02sh/JE4cysKEYDE1W1CMzbgGUUCf+2hEnsG1OVLdXpL3FrUsx
 AaUDrBu6C9OeCou7ENSW5Dq8wwNvSWo8/cyPZgFE9PlWLZ3h8PR3DodkVNHBWQ364yw8U1pI08D
 u6yPrY8rMaW1phw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_025611_634698_5DB08E84 
X-CRM114-Status: GOOD (  23.33  )
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

Hi folks,

This series adds initial basic support for Laguna (Tensor G5 SoC)
found in Frankel (Pixel 10), Blazer (Pixel 10 Pro) and Mustang (Pixel
10 Pro XL) phones.

Whilst Tensor G1 to G4 SoCs (found in Pixel 6 to Pixel 9 and Pixel
10a) were offshoots from the Samsung Exynos family. Laguna is an
entirely in-house Google designed SoC.

Currently this series adds very basic DT capable of booting to a
initramfs busybox shell and is a v2 of Dougs original submission with
the contentious DT overlay parts removed.

Whilst there is still interest in resolving the DT overlay topic (as
I believe many vendors use this approach). I would like to decouple
merging initial Laguna / Pixel 10  support from resolving that
particular issue. I believe Doug intends to revisit the topic again at
Linux Plumbers in Prague later this year.

In v2 I've updated to use the usual upstream approach of having
individual board files e.g. lga-frankel.dtb, lga-blazer.dtb,
lga-mustang.dtb  the same as gs101-oriole.dtb and gs101-raven.dtb.

It is worth noting, that with what is currently supported upstream there
aren't any known differences versus pre mass production boards yet. So
lga-blazer.dtb boots fine on my EVT 1.1 board with A0 silicon.

At the point where differences do arise, we may need to either add A0
silicon cut and other board variants upstream, or keep upstream as
purely MP/B0 silicon and maintain a separate out of tree DT that uses
overlays for Googlers needing to use pre MP devices. So far at least
with Pixel 6 that wasn't necessary.

Folks interested in trying this out and booting a pure upstream kernel
on their own Pixel 10 device may wish to use the build system and docs
found here:

https://gitlab.com/LinaroLtd/googlelt/pixelscripts

Example commands:

make RUNTARGET=frankel flash
make RUNTARGET=blazer flash

Also in v2 I've added support for ramoops reserved-memory carveout and
tested with `console=pstore` kernel argument. Additionally carveouts
for the ABL bootloader are added (which is used when doing a debug
boot (e.g. after a watchdog timeout). This allows for the extraction
of various logs via fastboot oem commands (bootloader / kernel
logs). The bootloader log can also be quite useful as it contains some
amount of on device debug parsing which can provide some hints after a
crash.

regards,

Peter

Changes in v2:
 * Enable CONFIG_ARCH_GOOGLE in arm64 defconfig
 * Remove all the pre-production dt binding support (EVT, DVT, a0)
 * Remove dtbo overlays and add individual board dts
 * Update to lga-pixel-common naming like gs101-pixel-common
 * Reorder nodes alpha-numerically by the node name
 * Add ramoops reserved-memory (tested with console=pstore)
 * Add reserved-memory for bootloader & gsa logs
 * Add reserved-memory for Android BootLoader ABL (used on Watchdog
   reset to extract boolotader logs / parse breadcrumbs / ramdump etc).
 * Add osc 38.4Mhz fixed-clock

v1: https://lore.kernel.org/lkml/20251111192422.4180216-1-dianders@chromium.org/

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: André Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jiri Slaby <jirislaby@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Walleij <linusw@kernel.org>
To: Drew Fustini <fustini@kernel.org>
To: Kees Cook <kees@kernel.org>
To: Tony Luck <tony.luck@intel.com>
To: Guilherme G. Piccoli <gpiccoli@igalia.com>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Juan Yescas <jyescas@google.com>
Cc: RD Babiera <rdbabiera@google.com>
Cc: Brian Norris <briannorris@google.com>
Cc: William McVicker <willmcvicker@google.com>
Cc: devicetree@vger.kernel.org
Cc: kernel-team@android.com
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-serial@vger.kernel.org
Cc: soc@lists.linux.dev

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Douglas Anderson (3):
      dt-bindings: serial: snps-dw-apb-uart: Add "google,lga-uart"
      arm64: dts: google: Add dts directory for Google-designed silicon
      arm64: dts: google: Add initial dts for frankel/blazer/mustang

Peter Griffin (2):
      dt-bindings: arm: google: Add dt bindings for frankel/blazer/mustang
      arm64: defconfig: enable Tensor G5 SoC family

 Documentation/devicetree/bindings/arm/google.yaml  |  48 ++-
 .../bindings/serial/snps-dw-apb-uart.yaml          |   1 +
 MAINTAINERS                                        |   1 +
 arch/arm64/Kconfig.platforms                       |   8 +
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/google/Makefile                |   6 +
 arch/arm64/boot/dts/google/lga-blazer.dts          |  15 +
 arch/arm64/boot/dts/google/lga-frankel.dts         |  16 +
 arch/arm64/boot/dts/google/lga-mustang.dts         |  15 +
 arch/arm64/boot/dts/google/lga-pixel-common.dtsi   |  23 ++
 arch/arm64/boot/dts/google/lga.dtsi                | 423 +++++++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 12 files changed, 539 insertions(+), 19 deletions(-)
---
base-commit: 17c7841d09ee7d33557fd075562d9289b6018c90
change-id: 20260710-contrib-pg-pixel10-initial-dts-49f5ec657b66

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


