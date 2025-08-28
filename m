Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6FFC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 18:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q3CIOP6R6addBexxPK/W78uDHfXq29xFqD2s2SzRpU0=; b=nyenkTJw4fk+iA
	qDKNyi3sNo/FlDeN25gOPPF8Pf1rfm0GK+EOVbIwyl0/YfBckS1RuFtg74/lYvOQLFiylKua8D+f2
	TpF+VAvMB20lMNMkdW8OCfSdf6r65b5zLtXFFDEpMMWq+qrQASDM0unrIWj9kxZw1xxqv1kNuHcyx
	CfOEfCxJMotCpPg2tIkkKEXRZbzHeapK2nCekUCCJeo1P+OjIopnR4t7yT3dFlqqq/9Kp9zDBxtIW
	HMsprCg5PxNhnXwWIBGj3FErxu5JOAoM8Hk63mJ7igH/5e4GUtDWGQqlHPnJAKm6pkR8kNEPeDmjJ
	twT/LNgy1y/J03Ewj/vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhgQ-00000002rQ4-2Vh7;
	Thu, 28 Aug 2025 18:49:14 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urf2x-00000002BES-3w1J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 16:00:21 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3c6ae25978bso843467f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 09:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756396818; x=1757001618; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3CIOP6R6addBexxPK/W78uDHfXq29xFqD2s2SzRpU0=;
        b=eTWkP555VbRc+/FGMSiyuJ8g8dTnj8OA+lv3Z7R4cf0oDaBrPs0GxxzjjyE1ddEnic
         SVK7ex+au0jqmk6JBBqU8Y+RQhMs5pSOKegFXvm8PTfr9E1YKKxBu0sBQoO7F+n3wVXh
         YGJOoThkARf8MHrMc9PytVJx+R6WLXC8TFDfdKmR44KiKajCahyrJOUyxSZAk5ONzvJw
         b+75nZdZxIb+uaX9fFq0TEckX1DYdiW4yYGbVAmh2aoPyrMZa+YoFRt15HBTdTTKZT17
         plFpqb5w+YbwVRkwiLJIHQt6hVdmuWyFZGhOwCuiolqbWJoI1nbXN+fOiBWWy+nSRLDC
         IKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756396818; x=1757001618;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q3CIOP6R6addBexxPK/W78uDHfXq29xFqD2s2SzRpU0=;
        b=D+NuLQCr3HEQysZIc98ZEqs66AoxaCdIobY2kBDUmkYCcRPQCbb8lBhRoaX0hvyVaW
         CUqE1x1eZt3Tp2M1ZZrtOE/+l18Bs1cVBCz271Ujcf4My5WJgpVzCBAa+5QsYOwxZzS1
         k6Ix8r6JGjLBB42CkPAd3UQU9gfXJgIS1JIxh2ZTtgWy+DZ4fYMQ5nyR7f/z+SWu/jpO
         NBWG30Z8Zmqe8mjfYNYaZShU0FwTulI4OgFXHePFh0NAkZ4v2u17MQNYjJGX5IWiPw3f
         n6CFWynC2stZqYM7sODuJ5qHtxbukTYBDnvroK/qbOxVr0xLAzwMhaDwZL71nBdh1rNs
         6CUw==
X-Forwarded-Encrypted: i=1; AJvYcCUrwhC6mSjFkhNVhZcj31WNIEC5r5e3L1KUQPuN3OkZQhhaQ7LRlLGCmyimXvBmkxCuS6GXDKz0cfhXcHNTiUkO@lists.infradead.org
X-Gm-Message-State: AOJu0YzKddg8BEN6UT/XQqgoEUqTI0/rt+FDl/hYxZJDUinfoZq2qyvJ
	1OdqEMl9CBQG+mMh3nihkVbdEYLE7kHQKvWU467ibaKkodjwflBYJuGSN0x9XWOx6zs=
X-Gm-Gg: ASbGncsNSbXiKssLDK3tmwrCYq8KeaJd02C/kfADSzpgkfO5YzLhujNsYeTh2N++zPO
	jG7iUftTWDMb5EEOs8PVQZ3URiPN1DoSJm/9NDILHHOUisqiBfAu5AcCvj41DJQNUKjthcYAoKX
	AO5qvOuueLfwgaA0LlWHK0VEswDUb2I7E7SIlsPqcgmOjQ1ETD5uqKv7ALzopr8x6lQFhB5Obex
	/RKM2fWHIxPG8/MGaE5QXQUgBWa6TJSrAkAOisK2EUPqfnXnhWMg2b04QxdcNqtv60cm1UQbqc5
	jPhewvmxXBadpI2zzLqz7KnQbbXGe/JLdhV5YeS23RmGaWV4hqt8Q5NvUw4YuaIUsKYE1lwDKiN
	AsWnVHmFtiNDdCmpp2to4EK2iIQ+q853hWEheIzo=
X-Google-Smtp-Source: AGHT+IEax7Hew3jsLvNYH4xon4aFBZ/JBXWjMTMDF00VvdVLreO0pcRYuKVWTA10YqneXY1x51eFaw==
X-Received: by 2002:a05:6000:2dc1:b0:3c9:80bd:3905 with SMTP id ffacd0b85a97d-3c980bd44dfmr10059968f8f.4.1756396817837;
        Thu, 28 Aug 2025 09:00:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6fe5sm80211675e9.5.2025.08.28.09.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:00:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v6 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
Date: Thu, 28 Aug 2025 18:00:08 +0200
Message-Id: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAh9sGgC/3XPzWrEIBDA8VdZPNfidzM99T1KD+poVlhM0G3YZ
 cm71yyUpgSP/wF/Mz5IDSWFSt5PD1LCkmqacgvzciL+bPMYaMLWRDCh2RvjdE7ZX8uFjnOatoj
 f2VeKYRAOwVqvJGlv5xJiuj3dz6/W51SvU7k/1yx8m/6KoiMunDIasKksgjIDflxStmV6ncpIN
 nIRewZ6jGiMM1xqrsAzhAMjd4xQPUY2xkaFDiQTGNSBUX/MwLufUts1TgIzXutgjozeM7rH6Ma
 A1hggInB0/5h1XX8AITxfCtcBAAA=
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
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Chen-Yu Tsai <wenst@chromium.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10810;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=+xm9ctteKlRxD42EDR1zdrOeMs5o/GA0lLEb6Y0rrpY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosH0MwrPbFoV4GZkMoDdVVaOUxpVp7U/c8MssJ
 qU6kA2eW32JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLB9DAAKCRARpy6gFHHX
 cgb4D/9PADdsTN9gxtnrHtc5xZV7pVzONv73YMK/u1KSov3qKPyQjqwxGuHQBIFqzzUfXSAOEP2
 7hI1n+5dMS1DeMi1Q/sRVjKOEebynFeSuWyiGmFdtLVrsf3zg/HCKd7k33jTt1poNmzgXhIUxTn
 ZYw5+px+NaZCPz//mcdoCHlhl+p3oyIUC3z2MhkNRbCCSnb7X4iRIq7kXxAzYpvrH6IXHZfy3+f
 sH3fwESIO/pdMDEnURbwOIMYhvCJGSNc7zqDl4r8tF9Ode8CC2WDVrKLgS4HPkbLCsH5vtfMbda
 dyIu+JFIN7E1gg0vxKlGrA7X4cnmFaoq7dNGFUuw0ZBjQ3VvgOxNxaaV3SP/Pa1TCKtqgOXi9Wc
 SAq+st1DSTS1AzZjZwb3iokyci6IpY3zLYiVd+dB8QyanV/hskbkXj7PNNd4KROm+k5jy2UiFFQ
 0PeknHN/530ttMustKEn/1f06I66DwtlekBROl8IQ3+XrV5UkkNezbdzDCbXaOegEEVuyc8Qtyp
 dy2DwnOMd6Wjd3HY6KmxVLszY040NDdMxbh1l82rfS9El1T6Lyh+C//mAcnEn8tJ7S8eGSLeWRD
 W7UAqkG94BghIA/fEXzSdPBH2aoJ8sFbAtKm3zPAxVuY6hHTh1dtvoUJm6VmF5kNCXHCa6zifxf
 SC/u52U1dkhgB8w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_090019_998281_4D38D2DF 
X-CRM114-Status: GOOD (  27.10  )
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
Changes in v6:
- Select GENERIC_PINMUX_FUNCTIONS when using generic pinmux helpers in
  qcom pinctrl drivers to fix build on ARM 32-bit platforms
- Assume that a pin can be requested in pin_request() if it has no
  mux_setting assigned
- Also check if a function is a GPIO for pins within GPIO ranges
- Fix an issue with the imx pinctrl driver where the conversion patch
  confused the function and pin group radix trees
- Add a FIXME to the imx driver mentioning the need to switch to the
  provided helpers for accessing the group radix tree
- Link to v5: https://lore.kernel.org/r/20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org

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
 drivers/pinctrl/freescale/pinctrl-imx.c          | 43 +++++++--------
 drivers/pinctrl/mediatek/pinctrl-airoha.c        | 19 +++----
 drivers/pinctrl/mediatek/pinctrl-moore.c         | 10 ++--
 drivers/pinctrl/mediatek/pinctrl-moore.h         |  7 +--
 drivers/pinctrl/mediatek/pinctrl-mt7622.c        |  2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7623.c        |  2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7629.c        |  2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7981.c        |  2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7986.c        |  2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7988.c        | 44 ++++++---------
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h |  2 +-
 drivers/pinctrl/pinctrl-equilibrium.c            |  2 +-
 drivers/pinctrl/pinctrl-ingenic.c                | 49 ++++++++---------
 drivers/pinctrl/pinctrl-keembay.c                | 26 +++++----
 drivers/pinctrl/pinctrl-single.c                 |  4 +-
 drivers/pinctrl/pinmux.c                         | 68 ++++++++++++++++++++----
 drivers/pinctrl/pinmux.h                         |  9 ++--
 drivers/pinctrl/qcom/Kconfig                     |  1 +
 drivers/pinctrl/qcom/pinctrl-ipq5018.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-ipq5332.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-ipq5424.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-ipq6018.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-ipq8074.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-ipq9574.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-mdm9607.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-mdm9615.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-milos.c             |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm.c               | 45 ++++++----------
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
 include/linux/pinctrl/pinctrl.h                  | 14 +++++
 include/linux/pinctrl/pinmux.h                   |  2 +
 80 files changed, 287 insertions(+), 224 deletions(-)
---
base-commit: 1b237f190eb3d36f52dffe07a40b5eb210280e00
change-id: 20250701-pinctrl-gpio-pinfuncs-de82bd9aac43

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


