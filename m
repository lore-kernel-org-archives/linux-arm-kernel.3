Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67564CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 12:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=enkQkZGsTu5Ejn7bPMtLQWGX4CJyf4VadQp1YlFyeL0=; b=uY32IelTy46NFN
	kq0mdlbQ9G2L9wURWS83SxYmDP+HB/JTkAZMajoD55se/UeALUH245N0r1dfSuCVtOvaiG+3NM/YP
	W0K8gO9K2zd4EZdNFtGDBUHsxim20yWRZAOtV2p7ZDRUNDbrpRix5NAqFWZRblXRlZ95xPt2lL9IZ
	jKLxT86k1wIJtnzg00cF+lpXfnFnrDyv1PDXb/T6RzX4mqv96ADeQEK7YeKHVSisReV+A4RQjSPKe
	qEra1OwMdhLg99Z91nim9wNUkuh3wt2ZxFGeFUjr3mGWbLqLSsIOR8X9D5r3pqme8YaacmcNXFmOr
	pnqCPasVOspqMiy8KA7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umtFL-00000002QON-32z6;
	Fri, 15 Aug 2025 12:09:23 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqR4-00000001zox-0wuQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 09:09:19 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45a1b05a49cso11139885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 02:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248956; x=1755853756; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=enkQkZGsTu5Ejn7bPMtLQWGX4CJyf4VadQp1YlFyeL0=;
        b=GZaZEsgR91ZN3QdRnYfY9CjQXrSSPt/202BPwGui6AN6A8r0iDirGGR+cBQnktLPZ0
         7YPAts0Ev3pzc4wLqCcOd5f7srKuxzGtjCbilZRawxnuMakS83DgVQK1Q/DOG8E60APe
         AJISSQS3b0w1gW03gXNEOKJeXPLzRLmTpJPPwtiJcNoRobVqwHycVNVZXUIntLYCu4vC
         QXoJaIxsE5kQs1bfG6I6fr6VSFkh9HEqgNgJ3+391s+e3Jvmih+tg6zx9E1UR5VOaBI+
         7nhKfmEYUUujHd+CHX1CCNPgYAaexorZMm4ptRkekbK9pLyERoRXBKlXVJQ4VoP0H3T7
         5Eqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248956; x=1755853756;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=enkQkZGsTu5Ejn7bPMtLQWGX4CJyf4VadQp1YlFyeL0=;
        b=dQfPaymsFeLBen79PtDcgnJ5h7IttqyxZ9/YxULpeJHLH+VI3cfWV0vCPXFTJQqXe+
         sPrTj4tpRRS/81UClE9qUcvXF5ki32oHaB6WfYGzersa0CC8Q0FoynihpBvAGZv+yrZi
         kkDeN9nvjPwIr6Q/muo56T0NA/QBNM1ZEHB9b7D28z7yGEL5MAC6NmxOoKv5xiNx8ruK
         JTWoTBeLxluB9wjpmkx6FnaxhnrdnRjL+BxQQXqVppd5tb6D8Qxt9WmXz1uppqQwZVPd
         17g4ybDXK3w3BRquKsY9wa2wGPIcQQ0xnUDaAEQGFRuPWoUiejJNe6VjWo1A4S4ht9XQ
         txeA==
X-Forwarded-Encrypted: i=1; AJvYcCWTAk6qtiRDkigFpbENVmkBMWSg4hsRb5xMjQR75TLH1fdLTgpvuqGaR5ct/fupj5C+dKLBhXOLbOcuAV3yFGCX@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg4BFjdzqt9beCP2WVdSIvwVQhFads6ZobPtM4Tgbftuq2tcTe
	NTs1iqzjpzn8MPvJFbCgVT2Q7iyQtWIENvRIK1oIgN5NMVISte04L/u0WwR6XGBZOlQ=
X-Gm-Gg: ASbGncuxJJIC3C558cVBpYolq293bhkd/yhM4Ly/RtcqnhDTEU0WtyCSLnMQVmbLiUr
	IJPh0E/6aah9GfpD8Dy3ep+h/VlXqnvWT+2Vp/edfQOgRxUGckeRlpVMBrGNs/+b3V/xaN6sDzM
	burb+dQOnenkHr35AzZlX94/3t5nLUc/oswIRlpX4GgXssbJTYUucvvsh5X3jpr9x41AWMFfKCa
	qyOGFNUWUGRddvBVWt63ASIWj018yrK7ZQ4NExEtFLxg3GHDXgupiru0bd8a8MpUpYsAOpGdhKj
	okz+VD3f2UUZWuS6x8r4ba/vSppjveNI8upUXTjUwYN4lNBDYDr/xENBDeP0+K32/HjyEbbHN+/
	QQeJHjVUgBB4Ggk8ZHw==
X-Google-Smtp-Source: AGHT+IETwosYftjhdV8p+Likl49ZpfXMwjHWmXRrMHjpM0MTRDDNGmCKeSbWr4F4hU2LlJ7QpApK7g==
X-Received: by 2002:a05:600c:4687:b0:458:c059:7d86 with SMTP id 5b1f17b1804b1-45a21803dc2mr15628805e9.10.1755248955950;
        Fri, 15 Aug 2025 02:09:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9a67sm1205210f8f.35.2025.08.15.02.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 02:09:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v5 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
Date: Fri, 15 Aug 2025 11:09:02 +0200
Message-Id: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC75nmgC/3XPSwrCMBCA4atI1kbyrI0r7yEu0mTaDpSkJFoU6
 d1NBVGRLv+BfDN5kAwJIZPD5kESTJgxhhJ6uyGut6EDir40EUxotmecjhjcJQ20GzEu0V6Dy9R
 DLRpvrHVKkvJ2TNDi7eWezqV7zJeY7q81E1+mb1GsiBOnjIIvKmuNqmp/HDDYFHcxdWQhJ/HNm
 DVGFKapuNRcGce8+WPkFyPUGiMLY1vlGyOZ8KD+GPVhar76KbVc00jDKqc1VL/MPM9PsgKXVZA
 BAAA=
X-Change-ID: 20250701-pinctrl-gpio-pinfuncs-de82bd9aac43
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Chen-Yu Tsai <wenst@chromium.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10104;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=DurWDiucFvPBA8sbuna9NkDmBqGsZJ8DeZKL5s26L34=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvk2isQHLGpRy3y0WrOW6tqbpkM2bpmCoWB0g
 yBRK/UrilOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ75NgAKCRARpy6gFHHX
 cl57D/92hWlQb3DzUjtVYK4DFWR2XBhYoB8xxBt68yWz/1iuQ0XlGF4mwdSgsICW8pxswEQV2z4
 xkJqfwCUHMewQWjB0hSrEkO+8LGmVC9+OvWyxFCbE5D01kxon4iFTt8CbPniuOwxR7xb01fhsAb
 6e0eBpZtQwcYH9PsZET1nwmbG1hVfYlLdGyEc61gaRemMRhJ4ucU8KAp/lPa0xIp1oRc1qg6kMr
 nE+V0+OLrcvuMA7h+xahYOFWyOCftRRUX26mPdOkPZfx42XeJo6eAGqzjkxrB532gssd11Jrazb
 j19gnVHlh1RI33LSXakN5/ZGh8SDm1NUcU/YUnqh9CpJ3s8FioeXo6USrxWohzIICKumoyWkOzN
 idNlZ+Ob5EiMnRMmtLVd4jSZ0lbOwuI1WNNVT1KKg+wtFXwAyM/e/EfX2E6OdNU5WyW/WFr8ULk
 qAs2OCl2+zGD7kScSFP7D2w8cxg8yXB6jyBcSvGx9XXGPyW5Qc9esVQJ9Stg2w4vFqeRztZJqR2
 XTS3awqGnYRdgo/yIDMnnZbjGjkHo+DAsTIKF56haKnLkSxwpDmrbdVKsr8rx1PTQSOP5UXYNL6
 b6r+Nwa1VEImT8+GP2QLYWLauFu6dJ+Vg0TyflXWCOLYNyk38WZas0O+D2HFcJIEXvk/Y5138qD
 Fjtl8TbdDWfai+g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_020918_283669_382736E1 
X-CRM114-Status: GOOD (  23.23  )
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

Problem: when pinctrl core binds pins to a consumer device and the
pinmux ops of the underlying driver are marked as strict, the pin in
question can no longer be requested as a GPIO using the GPIO descriptor
API. It will result in the following error:

[    5.095688] sc8280xp-tlmm f100000.pinctrl: pin GPIO_25 already requested by regulator-edp-3p3; cannot claim for f100000.pinctrl:570
[    5.107822] sc8280xp-tlmm f100000.pinctrl: error -EINVAL: pin-25 (f100000.pinctrl:570)

This typically makes sense except when the pins are muxed to a function
that actually says "GPIO". Of course, the function name is just a string
so it has no meaning to the pinctrl subsystem.

We have many Qualcomm SoCs (and I can imagine it's a common pattern in
other platforms as well) where we mux a pin to "gpio" function using the
`pinctrl-X` property in order to configure bias or drive-strength and
then access it using the gpiod API. This makes it impossible to mark the
pin controller module as "strict".

This series proposes to introduce a concept of a sub-category of
pinfunctions: GPIO functions where the above is not true and the pin
muxed as a GPIO can still be accessed via the GPIO consumer API even for
strict pinmuxers.

To that end: we first clean up the drivers that use struct function_desc
and make them use the smaller struct pinfunction instead - which is the
correct structure for drivers to describe their pin functions with. We
also rework pinmux core to not duplicate memory used to store the
pinfunctions unless they're allocated dynamically.

First: provide the kmemdup_const() helper which only duplicates memory
if it's not in the .rodata section. Then rework all pinctrl drivers that
instantiate objects of type struct function_desc as they should only be
created by pinmux core. Next constify the return value of the accessor
used to expose these structures to users and finally convert the
pinfunction object within struct function_desc to a pointer and use
kmemdup_const() to assign it. With this done proceed to add
infrastructure for the GPIO pin function category and use it in Qualcomm
drivers. At the very end: make the Qualcomm pinmuxer strict.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v5:
- Fix a potential NULL-pointer dereference in
  pinmux_can_be_used_for_gpio()
- Use PINCTRL_PINFUNCTION() in pinctrl-airoha
- Link to v4: https://lore.kernel.org/r/20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org

Changes in v4:
- Update the GPIO pin function definitions to include the new qcom
  driver (milos)
- Provide devm_kmemdup_const() instead of a non-managed kmemdup_const()
  as a way to avoid casting out the 'const' modifier when passing the
  const pointer to devm_add_action_or_reset()
- Use devm_krealloc_array() where applicable instead of devm_krealloc()
- Fix typos
- Fix kerneldocs
- Improve commit messages
- Small tweaks as pointed out by Andy
- Rebased on top of v6.17-rc1
- Link to v3: https://lore.kernel.org/r/20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org

Changes in v3:
- Add more patches in front: convert pinctrl drivers to stop defining
  their own struct function_desc objects and make pinmux core not
  duplicate .rodata memory in which struct pinfunction objects are
  stored.
- Add a patch constifying pinmux_generic_get_function().
- Drop patches that were applied upstream.
- Link to v2: https://lore.kernel.org/r/20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org

Changes in v2:
- Extend the series with providing pinmux_generic_add_pinfunction(),
  using it in several drivers and converting pinctrl-msm to using
  generic pinmux helpers
- Add a generic function_is_gpio() callback for pinmux_ops
- Convert all qualcomm drivers to using the new GPIO pin category so
  that we can actually enable the strict flag
- Link to v1: https://lore.kernel.org/r/20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org

---
Bartosz Golaszewski (15):
      devres: provide devm_kmemdup_const()
      pinctrl: ingenic: use struct pinfunction instead of struct function_desc
      pinctrl: airoha: replace struct function_desc with struct pinfunction
      pinctrl: mediatek: mt7988: use PINCTRL_PIN_FUNCTION()
      pinctrl: mediatek: moore: replace struct function_desc with struct pinfunction
      pinctrl: imx: don't access the pin function radix tree directly
      pinctrl: keembay: release allocated memory in detach path
      pinctrl: keembay: use a dedicated structure for the pinfunction description
      pinctrl: constify pinmux_generic_get_function()
      pinctrl: make struct pinfunction a pointer in struct function_desc
      pinctrl: qcom: use generic pin function helpers
      pinctrl: allow to mark pin functions as requestable GPIOs
      pinctrl: qcom: add infrastructure for marking pin functions as GPIOs
      pinctrl: qcom: mark the `gpio` and `egpio` pins function as non-strict functions
      pinctrl: qcom: make the pinmuxing strict

 drivers/base/devres.c                            | 21 ++++++++
 drivers/pinctrl/freescale/pinctrl-imx.c          | 42 ++++++----------
 drivers/pinctrl/mediatek/pinctrl-airoha.c        | 19 +++-----
 drivers/pinctrl/mediatek/pinctrl-moore.c         | 10 ++--
 drivers/pinctrl/mediatek/pinctrl-moore.h         |  7 +--
 drivers/pinctrl/mediatek/pinctrl-mt7622.c        |  2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7623.c        |  2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7629.c        |  2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7981.c        |  2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7986.c        |  2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7988.c        | 44 +++++++----------
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h |  2 +-
 drivers/pinctrl/pinctrl-equilibrium.c            |  2 +-
 drivers/pinctrl/pinctrl-ingenic.c                | 49 +++++++++----------
 drivers/pinctrl/pinctrl-keembay.c                | 26 ++++++----
 drivers/pinctrl/pinctrl-single.c                 |  4 +-
 drivers/pinctrl/pinmux.c                         | 61 ++++++++++++++++++++----
 drivers/pinctrl/pinmux.h                         |  9 ++--
 drivers/pinctrl/qcom/pinctrl-ipq5018.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-ipq5332.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-ipq5424.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-ipq6018.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-ipq8074.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-ipq9574.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-mdm9607.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-mdm9615.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-milos.c             |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm.c               | 45 ++++++-----------
 drivers/pinctrl/qcom/pinctrl-msm.h               |  5 ++
 drivers/pinctrl/qcom/pinctrl-msm8226.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8660.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8909.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8916.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8917.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8953.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8960.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8976.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8994.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8996.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8998.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8x74.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-qcm2290.c           |  4 +-
 drivers/pinctrl/qcom/pinctrl-qcs404.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-qcs615.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-qcs8300.c           |  4 +-
 drivers/pinctrl/qcom/pinctrl-qdu1000.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-sa8775p.c           |  4 +-
 drivers/pinctrl/qcom/pinctrl-sar2130p.c          |  2 +-
 drivers/pinctrl/qcom/pinctrl-sc7180.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sc7280.c            |  4 +-
 drivers/pinctrl/qcom/pinctrl-sc8180x.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-sc8280xp.c          |  4 +-
 drivers/pinctrl/qcom/pinctrl-sdm660.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sdm670.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sdm845.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sdx55.c             |  2 +-
 drivers/pinctrl/qcom/pinctrl-sdx65.c             |  2 +-
 drivers/pinctrl/qcom/pinctrl-sdx75.c             |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm4450.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm6115.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm6125.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm6350.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm6375.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm7150.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm8150.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm8250.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm8350.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm8450.c            |  4 +-
 drivers/pinctrl/qcom/pinctrl-sm8550.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm8650.c            |  4 +-
 drivers/pinctrl/qcom/pinctrl-sm8750.c            |  4 +-
 drivers/pinctrl/qcom/pinctrl-x1e80100.c          |  2 +-
 drivers/pinctrl/renesas/pinctrl-rza1.c           |  2 +-
 drivers/pinctrl/renesas/pinctrl-rza2.c           |  2 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c          |  2 +-
 drivers/pinctrl/renesas/pinctrl-rzv2m.c          |  2 +-
 include/linux/device/devres.h                    |  2 +
 include/linux/pinctrl/pinctrl.h                  | 14 ++++++
 include/linux/pinctrl/pinmux.h                   |  2 +
 79 files changed, 275 insertions(+), 227 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250701-pinctrl-gpio-pinfuncs-de82bd9aac43

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


