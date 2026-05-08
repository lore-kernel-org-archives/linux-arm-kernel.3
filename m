Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E90DCD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 21:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ERaGkPa2BHE69E4IMnGlovcf5AF4jmFFgtyAS+o0qU=; b=pUqkDl04vLLT1x52U+dxnJfgvJ
	RogQPQNj04B25eb5bMRZlYiOu1HJwlvWKp1bHm30Jj6jZNg1lbXpT6rd2tgQrJzYKn7RiTQ6+BSC1
	ASaCZb/7QRb8d/5zBZTSezgx4fkjIQYiwecMeoMo3c3BTwbCDv7dyQ4hk4xiQutrgmS8wW8pz8NYf
	R/vaoW5mm4mf5zQJUNJDSst9T56rtgqVeQj/sOLoycfS3RVgBjsnfYbboyRTQfMlpda+riPxXEV6z
	cOC/SZKgAU+tH/fExU9jZJX84XLv580UnArv88E+Fd+Klkq5gurzLYv+0iwe8bE5KAR+QL1n/R0Uu
	cxWHRcZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLT39-00000007aNL-0Dx5;
	Fri, 08 May 2026 21:47:59 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLT35-00000007aMV-3bW0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 21:47:57 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-56a9c5cb48bso984585e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 14:47:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778276874; cv=none;
        d=google.com; s=arc-20240605;
        b=XnLh/RJje+aWj4tzRf6ClNCaU+cWJCiyg2LKbXcC5GhAzpccEuWM5Y4UCl/hfRW8xq
         qILP28rYYuRduf250qRvN1G2Chpoq8WrFl9XJMOmv79y/hDx2GUTj8IcwBp9St+5Yu85
         j51/YnuFKWVHc+VIch6o2veKaKVWdsVINzqpVoBv926j4Vg8bMcVs2uOQ+YtN780oF+z
         GyvT1+V8AuCfhtZ5c+nY/QOkg4JzjW4gqhGsuVULEwFlzLVRS9d11DwFlJl4xQ3nMfMB
         oxkYzhM8QAOESoer4L5cGGvdUfq/OQxzuCD+T/ZvBBsMHT9b/ooNr3syRxaPxyNUTv1s
         BU2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/ERaGkPa2BHE69E4IMnGlovcf5AF4jmFFgtyAS+o0qU=;
        fh=p/t9ZlOXabt3FRiQ8EjZX0my3GEs8KJ4imtO+bYoToI=;
        b=Ggup91l323J2A4/Yjt14ZSrK9TyOTiGxipSEubVlDpN/8KB3n42bb6DP5dAiaVQ+yh
         ZhouK0AHgwmjWN5syOW0DO5hmQzwGOVlFCybGUMB3jX/odAsCRPKMlNf5oReoCrGmRId
         632rNswPhzTMLbDRfyNAVQZ47g/zUpkJOXQfHKMd4Z4/EZRGiU5KftAgJPR9WRDhXJrU
         XsWP1fcREpMP+ydJa3LFCHM36vjtgz35qiFvZQeVeJ1bibrlRZ+b0I/s7KoSNuIwLwK6
         5jfQRZec7rNCNEzydQNDPxYT4Y7qVKqRtdd8xr00c69S7c4YT3nzEB2QzHquisk6VB1w
         35Hg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778276874; x=1778881674; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/ERaGkPa2BHE69E4IMnGlovcf5AF4jmFFgtyAS+o0qU=;
        b=Twu6odCevGVhnsBbHF8WFoOK4fTMYo43gQkbA6cHx04bJ6ofJ75x0AABEadVUW3/Dy
         x2ymNoHOEiWpzK/JKOTG6XHc0K501zbuyYQhhAunzpyR/M27rJUNC64fGXu17q8pyBQk
         di+Z+4C+r/xsndDtBSDlxJ0hhpfHFa9j42l/dUzt214IJ1T62bw5J0ZWpq6Tc0L0gTBt
         1abX9gxxgIynJHo2dmUFMO8FlsPnY7uH23Zl2eFiLmEfaPd1VQ1RnOlIho9Q9cuHkkn5
         CaLz+yMTMuTaSe19KMbOXNRCJ2es413zs7kjsogFn74p0NuB2iu0mrkCGibVgRzcnOGF
         NBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778276874; x=1778881674;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ERaGkPa2BHE69E4IMnGlovcf5AF4jmFFgtyAS+o0qU=;
        b=V5dA2TotsXm5iZQfCIFEi+egwVw2jE/deWfThi9zI7F+oD0lE6sYLRFUoWRklAzonI
         N1I6uTqtuu8+hNaqiggCCXEp/dYaxsa8HXnunxS5cFZ3LCPNa5Fo8MPlvYJQ4WXRQBgz
         tOkDijGFFSEj+DR558t1hrdu07qtcfJLGzV1chpJ4OGB8i+YFpmEUtmGLTVWzPjfk3Xr
         ntTQFIhEaId5os+3ihKA5ReiHM4lx5rfaLv6SBk6u8VRYsWw0kPx9mfTo53krZjbGh+w
         nCnGm+y8WSHX9gzQKrM6C3T5gu/WOXGsHDwU0vlFBI5Zx/EAnLdMHL5Cr/0CHaPWtlD9
         OwUA==
X-Forwarded-Encrypted: i=1; AFNElJ/xW3ir3i+QFDGq6PXNdmwq75nvHuH8F6HoREO6V7iVKrJjznYjRn1tVekxloqeCN9dzUCL6WQr/z3wS1vshTBO@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi8Z6haGMiOYBj4Z/kUB6Ei5pXKWr/yLs7x/PyBHevMD8Gkme1
	h2due52Gh+bPf7iUbJceLP532JNlPuy1i5j5yiI/xUCBM4ai0Ecwj5ULcM4pXZgMHk+EmP6PDak
	128DS7WLJwpGlNqs2MmpCh3VMxHlnIzEslmUuz5dHtg==
X-Gm-Gg: Acq92OEyykEjVKZ3pIDdPqZBJ+rokKy5pwDE1x4Gc6q5XHbioTtT9gcNd4ydDVCH7lq
	P5iczaAMYXd9Eerxk6hLt8GKUW8l32e4K6qJ3G6tV1jPjH62t0260500AtrUhrHRRlUnZyUrFii
	a8uMEt6YtPG1S831sQTWNyL5Z/oZwkNJ5U7/f4wsJsm5OibE1vp7fxBRZYV9BSPoDu7Mg7ylFTG
	b2eq35rKF3XxghcRaDwQMkOS6Qf8XP7g2QbTG/GdW3B+KIQgEHDD7MC4WiH6hFsDVOEsdKr99y/
	Zt7TCSAXkTTsg3k8XtwSJfTyqP4jevXhLYB9kOrZTA==
X-Received: by 2002:a05:6122:d28:b0:56f:1c32:bd07 with SMTP id
 71dfb90a1353d-57599081e26mr75702e0c.2.1778276874401; Fri, 08 May 2026
 14:47:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org> <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org>
In-Reply-To: <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 8 May 2026 22:47:40 +0100
X-Gm-Features: AVHnY4Jx9Y0PnI-yLhX3azc912MHhiYNtX9S94HKUZHkESLUhrPpwLh3zoUEOQU
Message-ID: <CADrjBPr3Piw-sQ043EuwdUZTes-9pxoVP4fA7-AX=ssjvniJcw@mail.gmail.com>
Subject: Re: [PATCH 5/6] firmware: samsung: acpm: Add TMU protocol support
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	jyescas@google.com, kernel-team@android.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_144755_942169_2A7BF8DF 
X-CRM114-Status: GOOD (  25.96  )
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

On Wed, 6 May 2026 at 12:39, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> The Thermal Management Unit (TMU) on the Google GS101 SoC is managed
> through a hybrid model shared between the kernel and the Alive Clock
> and Power Manager (ACPM) firmware.
>
> Add the protocol helpers required to communicate with the ACPM for
> thermal operations, including initialization, threshold configuration,
> temperature reading, and system suspend/resume handshakes.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/firmware/samsung/Makefile                  |   1 +
>  drivers/firmware/samsung/exynos-acpm-tmu.c         | 239 +++++++++++++++++++++
>  drivers/firmware/samsung/exynos-acpm-tmu.h         |  28 +++
>  drivers/firmware/samsung/exynos-acpm.c             |  12 ++
>  .../linux/firmware/samsung/exynos-acpm-protocol.h  |  18 ++
>  5 files changed, 298 insertions(+)
>
> diff --git a/drivers/firmware/samsung/Makefile b/drivers/firmware/samsung/Makefile
> index 80d4f89b33a9..5a6f72bececf 100644
> --- a/drivers/firmware/samsung/Makefile
> +++ b/drivers/firmware/samsung/Makefile
> @@ -3,4 +3,5 @@
>  acpm-protocol-objs                     := exynos-acpm.o
>  acpm-protocol-objs                     += exynos-acpm-pmic.o
>  acpm-protocol-objs                     += exynos-acpm-dvfs.o
> +acpm-protocol-objs                     += exynos-acpm-tmu.o
>  obj-$(CONFIG_EXYNOS_ACPM_PROTOCOL)     += acpm-protocol.o
> diff --git a/drivers/firmware/samsung/exynos-acpm-tmu.c b/drivers/firmware/samsung/exynos-acpm-tmu.c
> new file mode 100644
> index 000000000000..c68d60b4c0b3
> --- /dev/null
> +++ b/drivers/firmware/samsung/exynos-acpm-tmu.c
> @@ -0,0 +1,239 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright 2020 Samsung Electronics Co., Ltd.
> + * Copyright 2020 Google LLC.
> + * Copyright 2026 Linaro Ltd.
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/firmware/samsung/exynos-acpm-protocol.h>
> +#include <linux/ktime.h>
> +#include <linux/string.h>
> +#include <linux/types.h>
> +#include <linux/units.h>
> +
> +#include "exynos-acpm.h"
> +#include "exynos-acpm-tmu.h"
> +
> +/* IPC Request Types */
> +#define ACPM_TMU_INIT          0x01
> +#define ACPM_TMU_READ_TEMP     0x02
> +#define ACPM_TMU_SUSPEND       0x04
> +#define ACPM_TMU_RESUME                0x10
> +#define ACPM_TMU_THRESHOLD     0x11
> +#define ACPM_TMU_INTEN         0x12
> +#define ACPM_TMU_CONTROL       0x13
> +#define ACPM_TMU_IRQ_CLEAR     0x14
> +
> +#define ACPM_TMU_TX_DATA_LEN   8
> +#define ACPM_TMU_RX_DATA_LEN   7
> +
> +struct acpm_tmu_tx {
> +       u16 ctx;
> +       u16 fw_use;
> +       u8 type;
> +       u8 rsvd0;
> +       u8 tzid;
> +       u8 rsvd1;
> +       u8 data[ACPM_TMU_TX_DATA_LEN];
> +} __packed;
> +
> +struct acpm_tmu_rx {
> +       u16 ctx;
> +       u16 fw_use;
> +       u8 type;
> +       s8 ret;
> +       u8 tzid;
> +       s8 temp;
> +       u8 rsvd;
> +       u8 data[ACPM_TMU_RX_DATA_LEN];
> +} __packed;
> +
> +union acpm_tmu_msg {
> +       u32 data[4];
> +       struct acpm_tmu_tx tx;
> +       struct acpm_tmu_rx rx;
> +};
> +
> +static int acpm_tmu_to_linux_err(s8 fw_err)
> +{
> +       /*
> +        * ACPM_TMU_INIT uses BIT(0) and BIT(1) of msg.rx.ret to flag APM
> +        * capabilities. Treat zero and all positive values as success.
> +        */
> +       if (fw_err >= 0)
> +               return 0;
> +
> +       if (fw_err == -1)
> +               return -EACCES;
> +
> +       return -EIO;
> +}
> +
> +int acpm_tmu_init(struct acpm_handle *handle, unsigned int acpm_chan_id)
> +{
> +       union acpm_tmu_msg msg = {0};
> +       struct acpm_xfer xfer;
> +       int ret;
> +
> +       msg.tx.type = ACPM_TMU_INIT;
> +       acpm_set_xfer(&xfer, msg.data, ARRAY_SIZE(msg.data), acpm_chan_id,
> +                     true);
> +
> +       ret = acpm_do_xfer(handle, &xfer);
> +       if (ret)
> +               return ret;
> +
> +       return acpm_tmu_to_linux_err(msg.rx.ret);
> +}
> +
> +int acpm_tmu_read_temp(struct acpm_handle *handle, unsigned int acpm_chan_id,
> +                      u8 tz, int *temp)
> +{
> +       union acpm_tmu_msg msg = {0};
> +       struct acpm_xfer xfer;
> +       int ret;
> +
> +       msg.tx.type = ACPM_TMU_READ_TEMP;
> +       msg.tx.tzid = tz;
> +
> +       acpm_set_xfer(&xfer, msg.data, ARRAY_SIZE(msg.data), acpm_chan_id,
> +                     true);
> +
> +       ret = acpm_do_xfer(handle, &xfer);
> +       if (ret)
> +               return ret;
> +
> +       ret = acpm_tmu_to_linux_err(msg.rx.ret);
> +       if (ret)
> +               return ret;
> +
> +       *temp = msg.rx.temp;
> +
> +       return 0;
> +}
> +
> +int acpm_tmu_set_threshold(struct acpm_handle *handle,
> +                          unsigned int acpm_chan_id, u8 tz,
> +                          const u8 temperature[8], size_t tlen)
> +{
> +       union acpm_tmu_msg msg = {0};
> +       struct acpm_xfer xfer;
> +       int ret;
> +
> +       if (tlen > ACPM_TMU_TX_DATA_LEN)
> +               return -EINVAL;
> +
> +       msg.tx.type = ACPM_TMU_THRESHOLD;
> +       msg.tx.tzid = tz;
> +       memcpy(msg.tx.data, temperature, tlen);
> +
> +       acpm_set_xfer(&xfer, msg.data, ARRAY_SIZE(msg.data), acpm_chan_id,
> +                     true);
> +
> +       ret = acpm_do_xfer(handle, &xfer);
> +       if (ret)
> +               return ret;
> +
> +       return acpm_tmu_to_linux_err(msg.rx.ret);
> +}
> +
> +int acpm_tmu_set_interrupt_enable(struct acpm_handle *handle,
> +                                 unsigned int acpm_chan_id, u8 tz, u8 inten)
> +{
> +       union acpm_tmu_msg msg = {0};
> +       struct acpm_xfer xfer;
> +       int ret;
> +
> +       msg.tx.type = ACPM_TMU_INTEN;
> +       msg.tx.tzid = tz;
> +       msg.tx.data[0] = inten;
> +
> +       acpm_set_xfer(&xfer, msg.data, ARRAY_SIZE(msg.data), acpm_chan_id,
> +                     true);
> +
> +       ret = acpm_do_xfer(handle, &xfer);
> +       if (ret)
> +               return ret;
> +
> +       return acpm_tmu_to_linux_err(msg.rx.ret);
> +}
> +
> +int acpm_tmu_tz_control(struct acpm_handle *handle, unsigned int acpm_chan_id,
> +                       u8 tz, bool enable)
> +{
> +       union acpm_tmu_msg msg = {0};
> +       struct acpm_xfer xfer;
> +       int ret;
> +
> +       msg.tx.type = ACPM_TMU_CONTROL;
> +       msg.tx.tzid = tz;
> +       msg.tx.data[0] = enable ? 1 : 0;
> +
> +       acpm_set_xfer(&xfer, msg.data, ARRAY_SIZE(msg.data), acpm_chan_id,
> +                     true);
> +
> +       ret = acpm_do_xfer(handle, &xfer);
> +       if (ret)
> +               return ret;
> +
> +       return acpm_tmu_to_linux_err(msg.rx.ret);
> +}
> +
> +int acpm_tmu_clear_tz_irq(struct acpm_handle *handle, unsigned int acpm_chan_id,
> +                         u8 tz)
> +{
> +       union acpm_tmu_msg msg = {0};
> +       struct acpm_xfer xfer;
> +       int ret;
> +
> +       msg.tx.type = ACPM_TMU_IRQ_CLEAR;
> +       msg.tx.tzid = tz;
> +
> +       acpm_set_xfer(&xfer, msg.data, ARRAY_SIZE(msg.data), acpm_chan_id,
> +                     true);
> +
> +       ret = acpm_do_xfer(handle, &xfer);
> +       if (ret)
> +               return ret;
> +
> +       return acpm_tmu_to_linux_err(msg.rx.ret);
> +}
> +
> +int acpm_tmu_suspend(struct acpm_handle *handle, unsigned int acpm_chan_id)
> +{
> +       union acpm_tmu_msg msg = {0};
> +       struct acpm_xfer xfer;
> +       int ret;
> +
> +       msg.tx.type = ACPM_TMU_SUSPEND;
> +
> +       acpm_set_xfer(&xfer, msg.data, ARRAY_SIZE(msg.data), acpm_chan_id,
> +                     true);
> +
> +       ret = acpm_do_xfer(handle, &xfer);
> +       if (ret)
> +               return ret;
> +
> +       return acpm_tmu_to_linux_err(msg.rx.ret);
> +}
> +
> +int acpm_tmu_resume(struct acpm_handle *handle, unsigned int acpm_chan_id)
> +{
> +       union acpm_tmu_msg msg = {0};
> +       struct acpm_xfer xfer;
> +       int ret;
> +
> +       msg.tx.type = ACPM_TMU_RESUME;
> +
> +       acpm_set_xfer(&xfer, msg.data, ARRAY_SIZE(msg.data), acpm_chan_id,
> +                     true);
> +
> +       ret = acpm_do_xfer(handle, &xfer);
> +       if (ret)
> +               return ret;
> +
> +       return acpm_tmu_to_linux_err(msg.rx.ret);
> +}
> diff --git a/drivers/firmware/samsung/exynos-acpm-tmu.h b/drivers/firmware/samsung/exynos-acpm-tmu.h
> new file mode 100644
> index 000000000000..8b89f29fda67
> --- /dev/null
> +++ b/drivers/firmware/samsung/exynos-acpm-tmu.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright 2020 Samsung Electronics Co., Ltd.
> + * Copyright 2020 Google LLC.
> + * Copyright 2026 Linaro Ltd.
> + */
> +#ifndef __EXYNOS_ACPM_TMU_H__
> +#define __EXYNOS_ACPM_TMU_H__
> +
> +#include <linux/types.h>
> +
> +struct acpm_handle;
> +
> +int acpm_tmu_init(struct acpm_handle *handle, unsigned int acpm_chan_id);
> +int acpm_tmu_read_temp(struct acpm_handle *handle, unsigned int acpm_chan_id,
> +                      u8 tz, int *temp);
> +int acpm_tmu_set_threshold(struct acpm_handle *handle,
> +                          unsigned int acpm_chan_id, u8 tz,
> +                          const u8 temperature[8], size_t tlen);
> +int acpm_tmu_set_interrupt_enable(struct acpm_handle *handle,
> +                                 unsigned int acpm_chan_id, u8 tz, u8 inten);
> +int acpm_tmu_tz_control(struct acpm_handle *handle, unsigned int acpm_chan_id,
> +                       u8 tz, bool enable);
> +int acpm_tmu_clear_tz_irq(struct acpm_handle *handle, unsigned int acpm_chan_id,
> +                         u8 tz);
> +int acpm_tmu_suspend(struct acpm_handle *handle, unsigned int acpm_chan_id);
> +int acpm_tmu_resume(struct acpm_handle *handle, unsigned int acpm_chan_id);
> +#endif /* __EXYNOS_ACPM_TMU_H__ */
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index 1a0d98b55439..2cebc5456968 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -33,6 +33,7 @@
>  #include "exynos-acpm.h"
>  #include "exynos-acpm-dvfs.h"
>  #include "exynos-acpm-pmic.h"
> +#include "exynos-acpm-tmu.h"
>
>  #define ACPM_PROTOCOL_SEQNUM           GENMASK(21, 16)
>
> @@ -688,6 +689,17 @@ static const struct acpm_ops exynos_acpm_driver_ops = {
>                 .bulk_write = acpm_pmic_bulk_write,
>                 .update_reg = acpm_pmic_update_reg,
>         },
> +
> +       .tmu = {
> +               .init = acpm_tmu_init,
> +               .read_temp = acpm_tmu_read_temp,
> +               .set_threshold = acpm_tmu_set_threshold,
> +               .set_interrupt_enable = acpm_tmu_set_interrupt_enable,
> +               .tz_control = acpm_tmu_tz_control,
> +               .clear_tz_irq = acpm_tmu_clear_tz_irq,
> +               .suspend = acpm_tmu_suspend,
> +               .resume = acpm_tmu_resume,
> +       },
>  };
>
>  static int acpm_probe(struct platform_device *pdev)
> diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
> index fbf1829b33db..08d9f5c95701 100644
> --- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
> +++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
> @@ -35,9 +35,27 @@ struct acpm_pmic_ops {
>                           u8 type, u8 reg, u8 chan, u8 value, u8 mask);
>  };
>
> +struct acpm_tmu_ops {
> +       int (*init)(struct acpm_handle *handle, unsigned int acpm_chan_id);
> +       int (*read_temp)(struct acpm_handle *handle, unsigned int acpm_chan_id,
> +                        u8 tz, int *temp);
> +       int (*set_threshold)(struct acpm_handle *handle,
> +                            unsigned int acpm_chan_id, u8 tz,
> +                            const u8 temperature[8], size_t tlen);
> +       int (*set_interrupt_enable)(struct acpm_handle *handle,
> +                                   unsigned int acpm_chan_id, u8 tz, u8 inten);
> +       int (*tz_control)(struct acpm_handle *handle, unsigned int acpm_chan_id,
> +                         u8 tz, bool enable);
> +       int (*clear_tz_irq)(struct acpm_handle *handle,
> +                           unsigned int acpm_chan_id, u8 tz);
> +       int (*suspend)(struct acpm_handle *handle, unsigned int acpm_chan_id);
> +       int (*resume)(struct acpm_handle *handle, unsigned int acpm_chan_id);
> +};
> +
>  struct acpm_ops {
>         struct acpm_dvfs_ops dvfs;
>         struct acpm_pmic_ops pmic;
> +       struct acpm_tmu_ops tmu;
>  };
>
>  /**
>
> --
> 2.54.0.545.g6539524ca2-goog
>

