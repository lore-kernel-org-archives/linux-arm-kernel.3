Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C257FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 00:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E9C1umI5D1atr9W6hfkEvQCrhMpTXSs9QJYfV/9UKu8=; b=dlU1qdIYlXaCXsaLf/v2Jz9Gyp
	nRfdTTNr3uy7xlLlwjQ4sRybJmiyMbZX9AWl2kYr3eeUDF5pNbAAozMrP/KiGmX30Z/XDiEtucxKv
	mmeGak9nL/OGNX2fyI1pfAF5NyKQh/uNXF0fHqkPeXkW5unuFepYHIyZweAGvwaq3sO3g6T+XVCGF
	8fQ5Xs7o4iLCnqVt+UJpTGGqIW50TWXmX+Ae86fJ9suFAoPP6qFmGsilR9bBZnUb3PlP4WEzmzJs/
	7jebWu1xsVyTNO+c5mM+TKWA1n3vsCOZyAf5cjG4W+wIiYucJXi3GCxAW85FMpzAuMMvz+s8NxePJ
	+BiJo6Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIbJu-000000069LH-21WB;
	Fri, 01 May 2026 00:01:27 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIbJo-000000069Kl-37AW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 00:01:23 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-bba0dde4f43so221547566b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 17:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593678; x=1778198478; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9C1umI5D1atr9W6hfkEvQCrhMpTXSs9QJYfV/9UKu8=;
        b=OV1YRxRj+I98weK+fq0acWVqR8g7102C7SC9194VCM++uPrvnaFpVBC2nZsBm1VVHr
         16MHfVweEn6FPOo8vcWnGDnAVyHV+JMrCmRX912oK5udkkOOY2JcMVm2CMZJuUEcRZaI
         5wLCsCimGJAjLSfzfkdXHdi2l42GbR8rXVWwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593678; x=1778198478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E9C1umI5D1atr9W6hfkEvQCrhMpTXSs9QJYfV/9UKu8=;
        b=CqjHy2nwiKB+qk+waWg1WYCS/8W86phP/NVITFUyvViXd4kGxHcN0CP5bnkkunei9G
         n4iaDeM7E4LIzsBxDZhXu7E2469ZSi8yum+bgRj7uNaXsNUjTfHW+CHK2cOS6fdd2SXa
         EMawbYD1sPN/kiue+wPiUEPER8sP9u3uKOxr0aTO6xx6sJN9/W8lkcXEcQ3FRPEs2zrc
         Yoq2wE1hJBBgz3PAxWkSAqHCvuqP2nOvbOQgJ4Wk/8AcvyQX0uMulB89K/g2IeNNrqw6
         oA2wGmenA8F4kDcz5IRviHi8zzdH0emSlXj0qmYLyw6zD9Lct+NJEgiqZJR++leOjw6v
         Xb7g==
X-Forwarded-Encrypted: i=1; AFNElJ9SQFXtRzQlLMxebmNIJhP2lt92n5+ob7KV4PFUhLNZ0djZQ4Rtwtw305tJFa577dzOoboGp6pDew02Xw3BlT3j@lists.infradead.org
X-Gm-Message-State: AOJu0YwvW3AYoRhZH0U1lFKOObJFOL2qNDq0sv8hznf2GjEXfpCx6sd9
	ZK3e0fzDZx8/wCWj6CHSYxxJrnYMiTAisQpriHfmABQV4S3HehJrkXjV/ZuH4tIB30JPbie++BD
	mpjJp0tij
X-Gm-Gg: AeBDiesb+SZvT1/XjRLZVKUuAP46Y1Itjkrdvi41/d4BgYv0qO7SbXqlEAtDqq/+Ugv
	QXhLTEFxgqMEc6a3H9ReqOLNizwclre6I2eHyNLWKSQ2Qpdiigp87WZ/Lui6ocApQRn2UwTejjD
	kUECcQTT3+TW5bIsL8ymp0MNln6UR6Xgqyai6UIiMELICS+HDx4j9cw/ozP+gsPqtA2VPIO+mij
	fMgKwW+2PTs1N64Ab+PSdJ3PlI9A3bvZODn7t2ad5FhIetV3SJA/yZ1lNKZYcT26S3fh6reh+Jg
	8oEZjwiwEJ/ojCvwRQZV+Cob1gj87I71yymAGRAr1vsotB/YmzH1slYbeYYPZRT9QcFURFjUQ0z
	mwTbCUgbhtV8W9yDMN2WkgP2F17AdWzen56tkkNOzOj/c4aqcAXrpG75Ba3ww00CNJvz08Ogw8k
	PXHIWvaPRrzLJySac8JQg3MMRXaxp4q6JXzkU5HcypCSKZBu7skg55A/roiXj13iWLAvEHclQ1
X-Received: by 2002:a17:907:d706:b0:ba8:cad1:f6e2 with SMTP id a640c23a62f3a-bbb6b1901b4mr279191666b.23.1777593677868;
        Thu, 30 Apr 2026 17:01:17 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b88472df8sm395720a12.28.2026.04.30.17.01.17
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 17:01:17 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bb3c4d8cc29so237406966b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 17:01:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8DAy3MqbHeFVVYBhWu21KFOXgWnlbm5CIQINd10loCu7rN6O8NA/h6lQT7H505xHRfHGtN8BgDjC/lRkhhsvUP@lists.infradead.org
X-Received: by 2002:a05:6000:40e0:b0:43d:50c:6f18 with SMTP id
 ffacd0b85a97d-4493cc3fdadmr8678277f8f.11.1777593256152; Thu, 30 Apr 2026
 16:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-2-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-2-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WhtAz7WM+AsQ9yTwzQMv2B--c1ca27a=fpvVFccRVd6w@mail.gmail.com>
X-Gm-Features: AVHnY4ITNUkQNF1rYH2AzAfyi5kerkzeuZiwFrCYx_qZbGHsYv-60K7BAEKUu9M
Message-ID: <CAD=FV=WhtAz7WM+AsQ9yTwzQMv2B--c1ca27a=fpvVFccRVd6w@mail.gmail.com>
Subject: Re: [PATCH 1/7] arm64: dts: rockchip: Add #{address,size}-cells to
 Chromium-based /firmware
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev, 
	linux-rockchip@lists.infradead.org, Julius Werner <jwerner@chromium.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, cros-qcom-dts-watchers@chromium.org, 
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_170121_973783_C98D49FA 
X-CRM114-Status: GOOD (  18.05  )
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

Hi,

On Tue, Apr 28, 2026 at 1:07=E2=80=AFPM Brian Norris <briannorris@chromium.=
org> wrote:
>
> Chromium/Depthcharge bootloaders may dynamically add a few device nodes
> to a system's DTB under a /firmware node. A typical DT looks something
> like the following:
>
>   ## From a RK3399 Gru/Kevin Chromebook:
>   # find /sys/firmware/devicetree/base/firmware
>   /sys/firmware/devicetree/base/firmware
>   /sys/firmware/devicetree/base/firmware/coreboot
>   /sys/firmware/devicetree/base/firmware/coreboot/ram-code
>   /sys/firmware/devicetree/base/firmware/coreboot/compatible
>   /sys/firmware/devicetree/base/firmware/coreboot/board-id
>   /sys/firmware/devicetree/base/firmware/coreboot/reg
>   /sys/firmware/devicetree/base/firmware/coreboot/name
>   /sys/firmware/devicetree/base/firmware/chromeos
>   /sys/firmware/devicetree/base/firmware/chromeos/readonly-firmware-versi=
on
>   /sys/firmware/devicetree/base/firmware/chromeos/active-ec-firmware
>   /sys/firmware/devicetree/base/firmware/chromeos/firmware-version
>   /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-sto=
rage
>   /sys/firmware/devicetree/base/firmware/chromeos/vboot-shared-data
>   /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-siz=
e
>   /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-off=
set
>   /sys/firmware/devicetree/base/firmware/chromeos/hardware-id
>   /sys/firmware/devicetree/base/firmware/chromeos/compatible
>   /sys/firmware/devicetree/base/firmware/chromeos/firmware-type
>   /sys/firmware/devicetree/base/firmware/chromeos/fmap-offset
>   /sys/firmware/devicetree/base/firmware/chromeos/name
>   /sys/firmware/devicetree/base/firmware/ranges
>   /sys/firmware/devicetree/base/firmware/name
>
> The /firmware node has an empty 'ranges', but does not have
> address/size-cells.
>
> Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
> non-translatable addresses") started requiring #address-cells for a
> device's parent if we want to use the reg resource in a device node.
> This leads to errors like the following:
>
> [    7.763870] coreboot_table firmware:coreboot: probe with driver corebo=
ot_table failed with error -22
>
> Add appropriate #{address,size}-cells to work around the problem.
>
> Note that Google has also patched the Depthcharge bootloader source to
> add {address,size}-cells [1], but bootloader updates are typically
> delivered only via Google OS updates. Not all users install Google
> software updates, and even if they do, Google may not produce updated
> binaries for all/older devices.
>
> [1] https://lore.kernel.org/all/20241209092809.GA3246424@google.com/
>     https://crrev.com/c/6051580 ("coreboot: Insert #address-cells and
>     #size-cells for firmware node")
>
> Closes: https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/
> Fixes: 6e5773d52f4a ("of/address: Fix WARN when attempting translating no=
n-translatable addresses")
> Signed-off-by: Brian Norris <briannorris@chromium.org>

Reviewed-by: Douglas Anderson <dianders@chromium.org>

