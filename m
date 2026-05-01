Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7399BCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 13:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qkMubkfdTMo3EqsOQjlsb5eV0ALKcf2vjXa+TTJKq1E=; b=IaL0dYH1MWvk4wdTg3z7SSNo5V
	6xfiXBjMbdu94pQ77mL5JbiquvusI8aCvs4gzWSaotutt2Ib61G7BV6dJvUX6ndSm7jhsng9Tper5
	6TSCRseJr9oc13Ii9h2adHPzndFyaUjRf+tormxWePBOz5ldzWjvGZqpzuMB6MIIv1IbTJunfew4H
	0EaNqsvsTtUyJtwS5SB7sd8Zl51t+o13Pv4Ex1jJ8cG1cC/co0CVuR3hgzU7+JvaunG9lAJNJE226
	QYoAC5m9btgwFfGJg0tHgzt9MP9SBbA/wuCvmV1ZjiaGFvws1yylp7FIo2ll2k2IbmhOtHsacX3qJ
	tdvHTTbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIngB-000000079wl-2MWv;
	Fri, 01 May 2026 13:13:15 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIng8-000000079vi-0fQy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 13:13:13 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4891f625344so20447695e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 06:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777641190; x=1778245990; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkMubkfdTMo3EqsOQjlsb5eV0ALKcf2vjXa+TTJKq1E=;
        b=jlmzDmyHIG+64AqahiDI6EhA7pC9pj27dweuVh5U4txUDIpAgYf9HTVPCEBaWpNBq/
         NGj8IIYRYyKCZxOxSnGvQD/HYs7ue6+eY9MdL8RQ+Vz+uj10Tjmhl4ljLLKdq69Lm+Sx
         SVdp5+LS1Y8P7Vb0pCvvL+lIWiZb/a5LFJL8x27yVTUpz1MwC8QvVBYYQvBGmI64+1nu
         dxzmFxyba7g4vx7dHrwTfuYqKJpqvpl8ZvnEY+TkqGp0wugGTXJj6MMkptRelRf/Ttg9
         H6CDqfu4O71WMRLAti28ZLKhKfPBz6R/Kn99MakALA8QsRYYrDJLcn3lslyWuaAvLg62
         lBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777641190; x=1778245990;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qkMubkfdTMo3EqsOQjlsb5eV0ALKcf2vjXa+TTJKq1E=;
        b=A7nEOHtQRTjqGDdVOuItMmrYwWmRHsBoEmjqA6E3TUeQoHfV8WaRoXJ5qGgTKFQ5wf
         9xJH7ozEOyEzs6+22Q6xoAC1gYQRVnKFCp1xD0NgcfXST3jQ5Y83P57jlHbFkS0tzqvi
         CThRjzgnwD0XedrnDIt3t9GzFG3l3BKfWN7EWbO+NI9hLV4KHInkTMANiwaY0saISBNA
         0qthmIyVP0myWC3mLAovnyQki9m2zpMV+ELm8g67fTD3xx6YSbX4fEW9g8SGjjDwDhzc
         sgnFcx/iYhVH7Ug1zRzR/+TQYCA6xSe2lttvQ7yjTLjPrBJvgMMfH/8L4KNWZHE5KiVm
         kEhA==
X-Forwarded-Encrypted: i=1; AFNElJ9DTVTupDVWpH9T5USGM2iPh0y2D4Zo4n3qMXeXvqqj6cTfQ1l4oWOn0gA/+43tkIxm/XRLcSJQy3+HHJlrlWNa@lists.infradead.org
X-Gm-Message-State: AOJu0YxHcjNajMggrKpbze9ItFe+gFaXWXiKuD+xemzm2Lj6C/4TjRZt
	lldKztSoX9Y2F/tbQ+L51tmp6YKO+3tDWAXYq0FEUb3Sm5fmrFBRJPQbdYuJl3T8o1Y=
X-Gm-Gg: AeBDies309tGVCdx49zzR8We7/WQWGnZPt6yWEf8n5daRWndY/c8fy0vZP9jW6O/M5W
	b/ISBeHFlutB9Ix2ZELjIo/ZnPbhErSDc6e/Jrn2fb2Yt5YrXPzE82RXZPrYExemp2sE+5wfUwk
	2256qpir52MfMuaoRUjXzNlEdHfuewpDPuwo/cX96WWSWvhQpA5NVcv2XBqqzMDqefdQZwksJTW
	HdWwq5LVilwKb0r3++ZZHecGSTCwwrFtI+jdXM5Vl8aLfjbYt6Ty/uj+8s2CZlKKzqhRtH4izwe
	s3iX1IIZKHs8z4xZPNt41qlk09u18cfuTXAAnDhbA383z/gWPJivldSQI+sBCGUT8vWmGc64lVG
	Sd0v2fX1t5UsfP7nniF1lizkfZvaHiY2t+V6pa5QUCCHpEx0T/dibANA+PmXqxQrCBelqMWVchc
	GgsaVkEoqYPhbehQFbaPi3XJC5cjqrqdL+oCAW/aLAuVe1itcCjFKPAqBvYI2c2Ezd1ESfbFCxi
	J83riVwDA1PoWINw7zSHeki
X-Received: by 2002:a05:600c:6291:b0:48a:79d8:a8d6 with SMTP id 5b1f17b1804b1-48a85e75173mr108865535e9.7.1777641189806;
        Fri, 01 May 2026 06:13:09 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb6fffcsm56790225e9.4.2026.05.01.06.13.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 06:13:09 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 May 2026 14:13:07 +0100
Message-Id: <DI7D7JXW4RGK.XB0BE6ZXNMHS@linaro.org>
Cc: <willmcvicker@google.com>, <jyescas@google.com>, <shin.son@samsung.com>,
 <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-hardening@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 00/11] thermal: samsung: Add support for Google GS101
 TMU
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Zhang Rui" <rui.zhang@intel.com>, "Lukasz Luba"
 <lukasz.luba@arm.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Bartlomiej Zolnierkiewicz"
 <bzolnier@gmail.com>, "Kees Cook" <kees@kernel.org>, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, "Peter Griffin" <peter.griffin@linaro.org>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, "Daniel Lezcano"
 <daniel.lezcano@kernel.org>, "Sylwester Nawrocki" <s.nawrocki@samsung.com>,
 "Chanwoo Choi" <cw00.choi@samsung.com>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Lee Jones"
 <lee@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
In-Reply-To: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_061312_237798_08D778AA 
X-CRM114-Status: GOOD (  17.56  )
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

On Thu Apr 23, 2026 at 4:22 PM BST, Tudor Ambarus wrote:
> Add support for the Thermal Management Unit (TMU) on the Google GS101
> SoC.
>
> The GS101 TMU implementation utilizes a hybrid architecture where
> management is shared between the kernel and the Alive Clock and
> Power Manager (ACPM) firmware. This hybrid ACPM TMU architecture is=20
> also present on other Samsung Exynos SoCs (e.g., AutoV920, Exynos850).
>
> Dependencies
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - context dependency on the ACPM fixes sent at:
>   Link: https://lore.kernel.org/linux-samsung-soc/20260423-acpm-fixes-sas=
hiko-reports-v1-0-2217b790925e@linaro.org/T/#t
> - cleanup and prep firmware patches 2, 3, 4, 5, 6, 7: required by the
>   thermal driver (patch 8).
> - bindings (patch 1): required for DTS validation.
> - thermal driver patch 8: required by defconfig (patch 11) - logical
> dependency.=20

I've took series locally using b4 and result doesn't compile:

  CC [M]  drivers/firmware/samsung/exynos-acpm.o
drivers/firmware/samsung/exynos-acpm.c:485:13: error: static declaration of=
 =E2=80=98acpm_set_xfer=E2=80=99 follows non-static declaration
  485 | static void acpm_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t =
cmdcnt,
      |             ^~~~~~~~~~~~~
In file included from drivers/firmware/samsung/exynos-acpm.c:31:
drivers/firmware/samsung/exynos-acpm.h:20:6: note: previous declaration of =
=E2=80=98acpm_set_xfer=E2=80=99 with type =E2=80=98void(struct acpm_xfer *,=
 u32 *, size_t,  unsigned int,  bool)=E2=80=99 {aka =E2=80=98void(struct ac=
pm_xfer *, unsigned int *, long unsigned int,  unsigned int,  _Bool)=E2=80=
=99}
   20 | void acpm_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdcnt,
      |      ^~~~~~~~~~~~~
drivers/firmware/samsung/exynos-acpm.c:485:13: warning: =E2=80=98acpm_set_x=
fer=E2=80=99 defined but not used [-Wunused-function]
  485 | static void acpm_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t =
cmdcnt,
      |             ^~~~~~~~~~~~~
make[5]: *** [scripts/Makefile.build:289: drivers/firmware/samsung/exynos-a=
cpm.o] Error 1

(applies cleanly though).

Could be related to "[PATCH v4 02/11] firmware: samsung: acpm: Consolidate
transfer initialization helper".

Anything missing from dependencies/prerequisites?

[..]

> Tudor Ambarus (11):
>       dt-bindings: thermal: Add Google GS101 TMU
>       firmware: samsung: acpm: Consolidate transfer initialization helper
>       firmware: samsung: acpm: Annotate rx_data->cmd with __counted_by_pt=
r
>       firmware: samsung: acpm: Drop redundant _ops suffix in acpm_ops mem=
bers
>       firmware: samsung: acpm: Make acpm_ops const and access via pointer
>       firmware: samsung: acpm: Add TMU protocol support
>       firmware: samsung: acpm: Add devm_acpm_get_by_phandle helper
>       thermal: samsung: Add Exynos ACPM TMU driver GS101
>       MAINTAINERS: Add entry for Samsung Exynos ACPM thermal driver
>       arm64: dts: exynos: gs101: Add thermal management unit
>       arm64: defconfig: enable Exynos ACPM thermal support
>
>  .../bindings/thermal/google,gs101-tmu-top.yaml     |  68 +++
>  MAINTAINERS                                        |   8 +
>  arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi   | 136 +++++
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  18 +
>  arch/arm64/configs/defconfig                       |   1 +
>  drivers/clk/samsung/clk-acpm.c                     |   8 +-
>  drivers/firmware/samsung/Makefile                  |   1 +
>  drivers/firmware/samsung/exynos-acpm-dvfs.c        |  20 +-
>  drivers/firmware/samsung/exynos-acpm-pmic.c        |  20 +-
>  drivers/firmware/samsung/exynos-acpm-tmu.c         | 240 +++++++++
>  drivers/firmware/samsung/exynos-acpm-tmu.h         |  28 ++
>  drivers/firmware/samsung/exynos-acpm.c             | 113 +++--
>  drivers/firmware/samsung/exynos-acpm.h             |   2 +
>  drivers/mfd/sec-acpm.c                             |   6 +-
>  drivers/thermal/samsung/Kconfig                    |  17 +
>  drivers/thermal/samsung/Makefile                   |   2 +
>  drivers/thermal/samsung/acpm-tmu.c                 | 547 +++++++++++++++=
++++++
>  .../linux/firmware/samsung/exynos-acpm-protocol.h  |  32 +-
>  18 files changed, 1195 insertions(+), 72 deletions(-)
> ---
> base-commit: 2e68039281932e6dc37718a1ea7cbb8e2cda42e6
> change-id: 20260113-acpm-tmu-27e21f0e2c3b
> prerequisite-change-id: 20260423-acpm-fixes-sashiko-reports-ae28b6ed5581:=
v1
> prerequisite-patch-id: 18d89d0e2bc0efe2cb366746ac4db36f4682f061
> prerequisite-patch-id: eb4f90add371877a1930c442c5464c4da7242889
> prerequisite-patch-id: 021cd1ee6d2b93f554dd5098cd1158977294dc41
> prerequisite-patch-id: b5da16b5c6d6731ea519ed68302fd52ce57c7ffa

Best regards,
Alexey


