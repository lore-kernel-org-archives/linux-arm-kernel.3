Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F99CA0EDB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LSqLNFw5ZoJT+eJ+R/4RbrBYWHEJxUchO4svyAYAyHQ=; b=pMkT9ROVaBN/Bc
	K8zHRpaCGGk4vGTQhPz8YeKzkC7xqV72kC+992nZj1x45eUlsWQj6hPt3eIkc/lf6pKdVu9B45T5x
	rnUCMQOfj7hrwipoJZgT8abVB/I4rBJBo+zVmOwhpjDSnVgKd/vyhrFdTiz5c03L06PS7uMGzqcKY
	xNwKVpIHMJi8YPhEscRFPePVABopW98gWMWdbkgMfRUZkhhaBLRyITJkbMwDl0vp6puz69QuHSQVM
	MQ7JXnnIxCt3IvAaRDFPgrynDyxWa6pyghTghy3/k3BMq6yUzrKTtXQnRoYuIjBllST/Ywly5Qleu
	r6vPGYOrcMJdwiU6CAdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloEu-0000000Ai2r-3YBz;
	Tue, 12 Aug 2025 12:36:28 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkLe-0000000AEar-0Mk6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 08:27:11 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3b78127c5d1so3350577f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 01:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754987228; x=1755592028; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LSqLNFw5ZoJT+eJ+R/4RbrBYWHEJxUchO4svyAYAyHQ=;
        b=C2nHYIpkWxp09XHPIagRi3oTW87t7L3OzMw5LMQgu/T5Hk+2PqfauE1jcJfquvY6nk
         tMB7j5J641i4nKi1lf8m1bYMK5ITv1BnJFJN3GfU0bm/u0Zgxme5jT2bIrg2gwFHs9zR
         AxinZ39RtbfT7HiGwV8nsXGk0GmguRsGOfBOpeSNRt/I32Yo54s5+SwUr0A1xH3umF6+
         /ZnBefsvtvMlJBm0LTL95DSwbl5JMWtkMFOKsokwAuvzSVgyXFQzP35LltQjkjlUiLkY
         JlVyeOsikKCADpeouiYFLc6yvxCpkQAQv7tfHZ2IS9gFohsoecHmyu/0fKgrEmoDcXB2
         NUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987228; x=1755592028;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LSqLNFw5ZoJT+eJ+R/4RbrBYWHEJxUchO4svyAYAyHQ=;
        b=mhipSc0Viq9d9IXv9xYQFSjuZzog8Pkz0Yv7jh78sRPm6vFnA6rj/JecPH/jf0AqUr
         20ZspT0vex8lFiE+E08qyn1pESH42j8wG8pIL3Uk+jI+Lkx96X3/hCuPC7Ak2kyh0Yih
         xW7Y5tE5F1+tbRM8vIjXhRxQOzfkkfVnypY0Y1MI0dYtGgMB36nGyX/fYTHXjUMNGREt
         Jz9e3S3BnBa8KY9U4CmXE00sXEI6G1RR6OssGqH8zko+qF0snFaq+hQpzf8MVwBHlL+7
         gXNEVVOd2CQCoWvvPL1Qnc8rXl5vHFCyZZLpt6v35nWBzTiScwDci3G6yqsGuYJjaPEH
         P6NA==
X-Forwarded-Encrypted: i=1; AJvYcCVTi+EuJCWbSfIwRJHi3LDC8ncF0fRWL4ixjkVKSnyEHa+d7dDfpB3zTG7KJsA5AkyiPAZtbYzioT88r8Fk96ZX@lists.infradead.org
X-Gm-Message-State: AOJu0YyMtdie2uFGZYAqjhqKLgaNbqGd3u0/vwjFTMzmVF2XreA2Gi0N
	ZyhyJb14gQ2nABsHnbw7GqmNR0XIAwe+Cfh561XAL6T1xxa4CVWL+u+fiY/LDbbwEZ0=
X-Gm-Gg: ASbGncvh+EFckEC4PE7kMsX+hhVaceOvZIoRuB4TpPxDc759vYIj4oyjCHAICICotD6
	Y8f5+/Rmy2T7qWMzmvPY1crwADg/tpycNwEGTfbn63PS+DhRoC/kDr+/aBOHZRn/jvg5LZD4xJe
	zn8OB/strLGwYHTKwlNltVnFiEVZARDMRjXIpnWZlCsjFbEvP9yqJ5bb+ICmbuD5XAN0a0mcIJG
	wx/bO+lcNH0N5Q26ASqb+dSUc+6krhoAaAMC50QfjlQ/CSlILhUKufnNqLHl9RXeQwkYpTdQbvk
	OLX1HcG+YyLsouhvnP9FgtsLWYW4AMHIu90v9bQ0sRfYVpa+gUNRvijHt3LeVXpYQTOqM2VeOlX
	9xfIKnnUEjH4DdPU=
X-Google-Smtp-Source: AGHT+IGt1Qdhl1SeHXbcRrXyromUYjuvLPhngmkyHILzZlpKPBo/s3ygqlYuwwSu6svvDg9bM89tcA==
X-Received: by 2002:a05:6000:400b:b0:3a4:ee3f:8e1e with SMTP id ffacd0b85a97d-3b911031495mr2033996f8f.39.1754987228110;
        Tue, 12 Aug 2025 01:27:08 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9386sm43549423f8f.18.2025.08.12.01.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:27:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v4 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
Date: Tue, 12 Aug 2025 10:26:59 +0200
Message-Id: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANP6mmgC/3XNTQqDMBCG4atI1k3Jn9Z01XuULmISdUASSWxoE
 e/eKBQsxeX7wTwzo2gD2IiuxYyCTRDBuxziVCDdK9dZDCY3YoSV5EIoHsHpKQy4G8Gv0T6djtj
 YmjVGKqUFR/l2DLaF1+beH7l7iJMP7+1Nouv6FdmBmCgm2JqsklaKqja3AZwK/uxDh1YysT0jj
 xiWmaaivKRCamLkH8N3DBNHDM+MaoVpJCfMWPHDLMvyAQqoo11JAQAA
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10405;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=UDQSxGWEdaNlEt2M7Mav0VdZbGU+CXX3IOWp5CNXy64=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomvrWB2qIjviAYzOzF9rGQxbtFl0bfNv3xt3BN
 hJcX75YR9WJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJr61gAKCRARpy6gFHHX
 cnenD/9QVkiYWaN45se9mVCv1Kmd7fcDNhqOnqO5k+01l7TQAlPMrQt3gTyvoe7CiEK5dDfa5ng
 aIbDkSuHtaZBpDsgc/BXeJMoESoAl36UvqOBfrX/zRL+EXlA4pE843GNpasFYss8kGdRGKbtO4U
 gcJKcstwSwRux/gfffXVtbEZO+jh7/3gggLSCCZHX0R6kJJWHhzou5kJ0h6bek677sBClWVmoY8
 eysYG00x5CQE0RPIPIM+4S2fQfWfxzhhRWIEq/YuuvJ4CuJ3LFO28NteYEEc4Y765gqgO5aQ/Go
 cn/UlbQCcl5oTQDS++2t1KbaW3KN/GDVlTpprFJQPsNzI1LyfcnlvtpUkvJeqZgN6oh3GCf55Ss
 gI0pMQB3Mudri5qmQ/yBPMY9RoPMVyuVEEfItLwmQVPnFBCFaUtksAM7oU6HqbEoLI4QwIN9XsE
 CFIHwvjFLRP9nqeDtNCtAUwKro0rLOkIkDmnsCkXIIZnZfimLTmSyBrLTY/elmWUlxfkqfAEYKV
 +z4qBQkVA4AJg6liF53vwd12SvKxjZQ8h93srCOICJ9uz3tOlOm/ZNpgXBuy0xTOpxbL9hJk2t0
 RGNzvJ1D4MnTaRwEHz9bw+spw3G0XBBakwDrnhB7sOPsN9dUclNtSpGJxeVXc4cqeavZgYMr3mj
 g7yTIfabzK5/L/w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_012710_212562_3C860E82 
X-CRM114-Status: GOOD (  26.42  )
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

NOTE: This is obviously targetting v6.18.

NOTER: This series is a bit all over the place and looks like it should
be split into at least two separate ones but I figured sending it in its
entirety better shows the whole picture - namely the fact that the
pinfunction handling rework is there to allow using the generic pinux
functions in qualcomm drivers without ballooning up runtime memory
usage.

NOTEST: I tested several Qualcomm platforms but I have no means of
testing Mediatek and others. Tested-by tags are appreciated.

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

 drivers/base/devres.c                            | 21 +++++++++
 drivers/pinctrl/freescale/pinctrl-imx.c          | 42 ++++++-----------
 drivers/pinctrl/mediatek/pinctrl-airoha.c        | 18 ++++----
 drivers/pinctrl/mediatek/pinctrl-moore.c         | 10 ++--
 drivers/pinctrl/mediatek/pinctrl-moore.h         |  7 +--
 drivers/pinctrl/mediatek/pinctrl-mt7622.c        |  2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7623.c        |  2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7629.c        |  2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7981.c        |  2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7986.c        |  2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7988.c        | 44 +++++++-----------
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h |  2 +-
 drivers/pinctrl/pinctrl-equilibrium.c            |  2 +-
 drivers/pinctrl/pinctrl-ingenic.c                | 49 +++++++++-----------
 drivers/pinctrl/pinctrl-keembay.c                | 26 +++++++----
 drivers/pinctrl/pinctrl-single.c                 |  4 +-
 drivers/pinctrl/pinmux.c                         | 59 ++++++++++++++++++++----
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
 drivers/pinctrl/qcom/pinctrl-msm.c               | 45 ++++++------------
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
 79 files changed, 274 insertions(+), 225 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250701-pinctrl-gpio-pinfuncs-de82bd9aac43

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


