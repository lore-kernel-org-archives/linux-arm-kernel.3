Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4E8CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 21:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RAnpqMOGAC30OtTrLiH7M9o+wNye+/msCQcYjxQmy0E=; b=H714+/+miGmmtcc1L2T4v9X9Ny
	C5UYFe7oBBfIKwBl+k989LrFIidGSdGg/trK8HPuJQsbqMe9aPj+E/VQzcZmanjPFIHvcOj9wJTXN
	maUQB0yA5H5LeyqcJ1DOeshI6b80rdzP24AS8YJmHqHyRi+uBGRqmt+yTsnqsZVq28ixg3ZUarO8/
	XORzo7uWBm9IaPsAFJlPHRScv30PzZT6YFDxY2+FFb3pvNamobFRP/ZABqfG3fjiVrV27ktRdyy5W
	QV54mSkZURzm4zQbPuzArEIOWGqoP9ZZ0cdC6oFl5SdWiokUilaFKFF3iXUxBDzHXa7GcBPVPLuZn
	MJXmlJgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC2D1-00000007Jl1-02rb;
	Wed, 30 Sep 2026 21:51:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC2Cj-00000007JhE-3wzs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 21:51:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6246060A59
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 21:51:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1221D1F0089D
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 21:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790805069;
	bh=RAnpqMOGAC30OtTrLiH7M9o+wNye+/msCQcYjxQmy0E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IiqAcY6XN7b7mnGoxI4st6GCzLG1dzDIQHAAxIp10Ug3k0Rzkc/ZHNWkLnxHyuz27
	 KeS/MKg6YaOy9b+T42Eae8O7DRK9Dsl+xQ5CAY88KM680Q9sAwBHEgrcynoqEzMPjz
	 p/qN5IEpCQoio4C14Hon/nua9+YCSDJnY3qmRTr+mkmjRMnwWmS9T4hMXHGKOQZHE2
	 CPeB3n7g/voQ7CK/N8KmTBF5Ifvht6kB/EZHrrQRf36G76wBOIOIQVHBTHMX2ja105
	 itTWkCKf3hHoUplwZWTwYuYdIVs7hECztStoOJn1vRI0S2Mug3T/Gkctbsj0xIiRbQ
	 NgoEgFVgze10g==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a5da7416f9so50206101fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 14:51:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy7ttsq0iNIiUBVva1t+66nkqyaudOvETE7qzgN9p6tOUQoOdTFyHDaB68m5iozhmWIi4rVQeTlGTQzk5XVJu9j@lists.infradead.org
X-Gm-Message-State: AFq9FYLvM0Me5xlxhpAdJ2lRxKvfkHI3Rmsv5B/PjYEwEhollQ1avZKj
	zjepBMsH//pACRq7B8WQ00DWB8UI5GTjEpd0oiTKWYKa4RNtkFQJKZ+Uxr5CTacCnyCZHBP+IlK
	k6M6wpinlhB766hDcCK6t64SrlR8PulM=
X-Received: by 2002:a2e:be8c:0:b0:3a6:566a:5ca1 with SMTP id
 38308e7fff4ca-3a7791dc08fmr9115391fa.21.1790805067836; Wed, 30 Sep 2026
 14:51:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260918-contrib-pg-pixel10-initial-dts-v3-0-c94e51140509@linaro.org>
 <20260918-contrib-pg-pixel10-initial-dts-v3-3-c94e51140509@linaro.org>
In-Reply-To: <20260918-contrib-pg-pixel10-initial-dts-v3-3-c94e51140509@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 23:50:55 +0200
X-Gmail-Original-Message-ID: <CAD++jLkVO=NwD=Yt43v4FUK4orBuNuxGrYwcWS7vn9E27Eodaw@mail.gmail.com>
X-Gm-Features: AclHuK-YzUcFeKui-FBA-jpZiYYt9fNiuvjJIJfDEyhn_rhgVcM2vz6d1jIiXNI
Message-ID: <CAD++jLkVO=NwD=Yt43v4FUK4orBuNuxGrYwcWS7vn9E27Eodaw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
	Douglas Anderson <dianders@chromium.org>, Juan Yescas <jyescas@google.com>, 
	RD Babiera <rdbabiera@google.com>, Brian Norris <briannorris@google.com>, 
	William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-serial@vger.kernel.org, Brian Norris <briannorris@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Sep 18, 2026 at 7:26=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:

> From: Douglas Anderson <dianders@chromium.org>
>
> Add initial device trees for frankel (Pixel 10), blazer (Pixel 10
> Pro) and mustang (Pixel 10 Pro XL). These device trees are enough to
> boot to a serial prompt using an initramfs.
>
> Currently only Laguna B0 silicon found in mass production phones is
> officially supported. Further revisions such as A0 silicon and EVT
> devices maybe added in the future if they are useful. As of today,
> these device trees boot fine on EVT devices with A0 silicon.
>
> A few things can be noted about these device trees:
>
> 1. They purposely choose to use the full 64-bit address and size cells
>    for the root node and the `soc@0` node. Although I haven't tested
>    the need for this, I presume the arguments made in
>    commit bede7d2dc8f3 ("arm64: dts: qcom: sdm845: Increase address
>    and size cells for soc") would apply here.
> 2. Though it looks as if the UART is never enabled, the bootloader
>    knows to enable the UART when the console is turned on. Baud rate
>    is configurable in the bootloader so is never hardcoded in the
>    device tree.
>
> Changes by Peter Griffin:
>  - Remove dtbo overlay approach and add individual board dts
>  - Update to lga-pixel-common naming like gs101-pixel-common
>  - Reorder nodes alpha-numerically by the node name
>  - Add ramoops reserved-memory (tested with console=3Dpstore)
>  - Add reserved-memory for bootloader & gsa logs
>  - Add reserved-memory for Android BootLoader ABL (used on Watchdog
>    reset to extract boolotader logs / parse breadcrumbs / ramdump etc).
>  - Add osc 38.4Mhz fixed-clock
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Co-developed-by: Peter Griffin <peter.griffin@linaro.org>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> Tested-by: Brian Norris <briannorris@chromium.org>
> Reviewed-by: Brian Norris <briannorris@chromium.org>

This looks good to me!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

