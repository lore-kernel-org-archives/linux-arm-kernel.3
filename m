Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8023DEB362A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 18:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81g1AQ9LUBvNGZAcgE0oE1RFZWKZ81udvij0ADF9Goc=; b=XAO47JSzhAyAT8H9P+BFRbaO0C
	plYoPwwNZvzsKC/LRlQD+jtlHu2DzKBDfusRpPH5w0ttRYR2ggJYQGbUGLIIgRrxDgwBxegiH+W83
	sFSX+v38LOmdWYEXQFSLUeXLZ7RUJBXisXEzy/ThfBCSrazfSH+60b2iVQje/dY2h1yQsSuRVw0ub
	OEiMzayymhFDGMVB8Kq9/YN0TJHe35rDUWyUp+m82x9PC4e0UzUVzLLOqpVnj3hPgeEcwfgA1QOhc
	lPIcpzqwdq6jDr46Un61s1UMmF2b/ew4ndrYdPBPsa2JE49EKVtOxAa8o68epbGABXGF9QMCzbkGj
	izmVexUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx82v-0000000DgYn-3qBO;
	Mon, 02 Mar 2026 18:31:09 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx82t-0000000DgYQ-1ZSM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 18:31:08 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-64cb577e79cso4807329d50.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 10:31:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772476266; cv=none;
        d=google.com; s=arc-20240605;
        b=fxXJx+YPpOs7+GFAa5TG5uPGWA+MVm0cl6Nz2sf7AWEmrL/WS/8MvjtBztwa0LyW/e
         YtkTSXM18DXpW19iL8d7tM8a77VZRnzS1de7pWqPVNvo4858GFaDeHji3aIaZmyxJMKD
         ZeC+8uWk64pqisoITXiQ95Tndya+vo2wdoqTUOmzs6zDNsKF4UAgnlVmVhUnc2mucc0V
         B9vi1B3Yon/rlCIWSmsXznwKjmb9rrjH5JKOEE3JvPO7xUIq54rtq1zEw+hmt4c677Rb
         4t6rKu19bjbYNU6mwIhbGzEtZwoqBo/x4/YAn3oHnBPW7Xp7UdL1xSSr+F+qwuI8N227
         qEXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=81g1AQ9LUBvNGZAcgE0oE1RFZWKZ81udvij0ADF9Goc=;
        fh=rWt6FH/8jyd4xGgm/uhODrlQFs7HcyAUrdiL3SHozIk=;
        b=f7WNUImYcXMvQC1BhxgvW1R9nnpJoN9Bh9Z8DSILAQZIRuaeZz0UqAsLf2/NfS/Byi
         bWvhW1SUkeE/Y4vmXpa6X7IQnX3MoMwt62v+pvxvHOb4WngmdD+NeVlJu71WLEIWOQf/
         nLn1UlkvaguCn7yQiKIZOtOho+XCgHLKeCFILdb0lZYHYlQkcKLZkQYkt/z0LPGNDQvR
         9x1qZS1+jOdCu2eZxubjlWhEjIIPZr5GXBYBJf5WFIBMNcytzQzMUy/sYAXeLNsjk4gF
         bQzXYA2Szl0F2tCq447o/SGp8QKeus1OzZrsGu/WJyf+9PYICOUPx5ui1tIJ3BhYm8Rn
         AXYg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772476266; x=1773081066; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=81g1AQ9LUBvNGZAcgE0oE1RFZWKZ81udvij0ADF9Goc=;
        b=XKYMtGAj4419NteJymS1LzTNDZ65FyKIwVfbCFATgBkhOfdtn1n/TdYo5cxx4QdgVR
         hvvWzuZfJR0Xd4l1OoJoOuN5AQPKY6REelW69ALZ6f0wd6rBBcWA5jC8J/N3MZdmhbSx
         MYxeTfqlUQR/Q3Bg1duE8cAmlRjtSCkzaecJgB3DvNEnNVewHFDO8TU6jcjOOK7bd8Fz
         3VtdaxQYJS2UBBTzmIvkhNfAlSJApxdpPMsLsmu2gc0/X531EqODe5wPQlaeSuWh8r42
         hsQ1i9fgMpPsyCe34P/HqargBAEMS167bsDbUh6xY2fzWDlwBW4rhdjTomHEX1WEn6I2
         ghjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772476266; x=1773081066;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81g1AQ9LUBvNGZAcgE0oE1RFZWKZ81udvij0ADF9Goc=;
        b=M4Abxu6bJkyH8VLDPlWlaArV1RTNVFjWgxgELrxX/AC3vuHNy+9Hl0CKI4JK/xnBqj
         oDrIqzcJMZULuKdYGo2xIjz/WCLFZkzlY/MTKLr4Gm4A3lh9Qj3qLxx++WPgXD6/fRp/
         zuW1UsVdBSqePdPdvyt4k5FYxtqywbLfjdGQobZA9f6bjFJMwAX5EGBWlURWsHgrGjqw
         Rl1fv9TGQ8YH6df6LplpHhtLWZUVB40TRFX3qSxg1BkkQaCgMG/24yqs2q+ctZCuonGe
         1clf53BoxTf5K2SoxhP4w41/p5IyKxiDUEa9vEWZQBqKzld/KlEeGdCrb/4Dfsw67Gkl
         rF9g==
X-Forwarded-Encrypted: i=1; AJvYcCVVg9lpZdzkZIibfU3FdAJwkM0B57sa9x3ISMd3RGqh7jmey/mwSxBD47VX8u2Lp8bfx8XjggPDOWl/x/XEHQFl@lists.infradead.org
X-Gm-Message-State: AOJu0YxUwm3N6G1ECljGzdO5B/FT+caT+MOscHdyvu0SP8OGkvNHCB/a
	mlT4zK5hqNKjxU8Lrro8XI6crGieb6CgTORs/iapNK4LiHr6OxDrYv6UcfqhNT2qF0P9hQ6oNJ/
	LEfdH6gocM1x5I4W/LR34RCGZmMIQRKxpidpyp4RnOQ==
X-Gm-Gg: ATEYQzxK2oRsgEJljWBv9uKnAVmRi2aHmQ97M4gQoY+Pe/jChta7v1qmEZ0gYnk27kK
	705dcXJSRegqro5jMZMpc0bV5nDExiF1Rc6nUGGCopBIWif3nQcVH8dCkolr4G2Bn0UkIYUQVcZ
	KROq9ltlH5lJ61hV7eQTihBKmm8g8EpZJNHCTHnm3sOWsTDTXn/YuvbOGU0WZhHXZyl3k7fzy6j
	fW7Z8y2kEP8zGNlrEjHQ5EHBzm9pLSvIpu5HjDcIeDbyiGlKcWf+YmD2bP2xL4wfjk9nn7KgbTI
	LBynjcAp2ydgi9dZvK80mp0Rpokd1/POCB715NyhVyIYOf7CQlpjzU2LCxkqP96MDw==
X-Received: by 2002:a05:690e:2060:b0:64a:e1de:e830 with SMTP id
 956f58d0204a3-64cc2025a5cmr8768669d50.16.1772476265235; Mon, 02 Mar 2026
 10:31:05 -0800 (PST)
MIME-Version: 1.0
References: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
In-Reply-To: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Mon, 2 Mar 2026 18:30:54 +0000
X-Gm-Features: AaiRm515e3WzwnsMys39sfPXCKSu89p0-qrgz1al4LhQ_1OobhhtPkQJhg_LdoM
Message-ID: <CANgGJDpjsyoCnuXuMMi1L3nWNJsM4aMs6C=NvBcTkWeC3NFadQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] thermal: samsung: Add support for Google GS101 TMU
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_103107_460755_754E0458 
X-CRM114-Status: GOOD (  13.98  )
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

Hi Tudor,

On Sun, 1 Mar 2026 at 02:26, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:

[...]

> ---
> Tudor Ambarus (7):
>       dt-bindings: thermal: Add Google GS101 TMU
>       firmware: samsung: acpm: Add TMU protocol support
>       firmware: samsung: acpm: Add devm_acpm_get_by_phandle helper
>       thermal: samsung: Add support for GS101 TMU
>       MAINTAINERS: Add entry for Samsung Exynos ACPM thermal driver
>       arm64: dts: exynos: gs101: Add thermal management unit
>       arm64: defconfig: enable Exynos ACPM thermal support
>
>  .../bindings/thermal/google,gs101-tmu-top.yaml     |  67 +++
>  MAINTAINERS                                        |   8 +
>  arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi   | 209 +++++++
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  18 +
>  arch/arm64/configs/defconfig                       |   1 +
>  drivers/firmware/samsung/Makefile                  |   1 +
>  drivers/firmware/samsung/exynos-acpm-tmu.c         | 212 +++++++
>  drivers/firmware/samsung/exynos-acpm-tmu.h         |  33 ++
>  drivers/firmware/samsung/exynos-acpm.c             |  35 ++
>  drivers/thermal/samsung/Kconfig                    |  16 +
>  drivers/thermal/samsung/Makefile                   |   2 +
>  drivers/thermal/samsung/acpm-tmu.c                 | 643 +++++++++++++++++++++
>  .../linux/firmware/samsung/exynos-acpm-protocol.h  |  30 +
>  13 files changed, 1275 insertions(+)
> ---
> base-commit: e2211f5d980086dd9fbdab3bcd86b715e12cae13
> change-id: 20260113-acpm-tmu-27e21f0e2c3b

JFYI, the series doesn't clearly apply on today's linux-next:

Grabbing thread from
lore.kernel.org/all/20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 18 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Analyzing 20 code-review messages
Checking attestation on all messages, may take a moment...

Base: using specified base-commit e2211f5d980086dd9fbdab3bcd86b715e12cae13
Applying: dt-bindings: thermal: Add Google GS101 TMU
Applying: firmware: samsung: acpm: Add TMU protocol support
Patch failed at 0002 firmware: samsung: acpm: Add TMU protocol support
error: patch failed: include/linux/firmware/samsung/exynos-acpm-protocol.h:40
error: include/linux/firmware/samsung/exynos-acpm-protocol.h: patch
does not apply

Was it done against mainline?

Thanks,
Alexey

