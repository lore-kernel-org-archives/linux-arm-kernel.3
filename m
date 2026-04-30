Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29BEFF886F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 00:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L/stw2Li+z9zBw8IsGsJQTT0j6lAz8JjDjcZka6O6Bc=; b=45N80kUgVDSAoFOnTjZ+bROF+6
	/wzDOzlffzvHFyBbMENB5P+/v0ZvW9vax+wvBXNpetTanPw2IQEldpTUKLSf7OTeN9zqv0Y6cnKhI
	IiTkUbKK6i2R0uV4WZ3Ub8O2bXFEt1EppgDAtOMlrvx6ptFm+OHNuzPEr/qw5eVzaNP5MH7lEkKNI
	XWjFoja3A5YMKSuAqVZdw8yp6jykZX5fbSqvGio9j+SFkehq1u/JXx50CUWBJVBe1ZENN2qBvYGZQ
	bY+Tec1Iw5q3nAR1Ds34mIb1F/vBSDj9DEVsyRLbDX0AAZaWDVLZf1+TWNNmD2IDaXxWGjCykzBuT
	DF+RTM5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIbLu-000000069fC-3khU;
	Fri, 01 May 2026 00:03:30 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIbLt-000000069eq-0bjf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 00:03:30 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-bbe539fc355so74966966b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 17:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593807; x=1778198607; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/stw2Li+z9zBw8IsGsJQTT0j6lAz8JjDjcZka6O6Bc=;
        b=eK4FztNRga6BWmduqcTSySji1ZQclcT5PQVfD1WYxgLn9PNyfdEjgpGTkwlOauFTls
         zdlazX/qHfPKFFtZQdr0e4uEqOk8a1uyceo31qMr8vRf9nazqGhntYv3IaJKKuvwXLcF
         JPSE29dgzfiVXS66D66qsDX46Hng4xLC0K20o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593807; x=1778198607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L/stw2Li+z9zBw8IsGsJQTT0j6lAz8JjDjcZka6O6Bc=;
        b=p16m0/R6Qo8KdhyhFDhQ32e8TkIxeAPEs/AbmfKWIuWqoBXXcot4YlOz6gEu2f6e4T
         vyKwOi+pISeahNZYwwrQWWf46RSEtvPeb4F9kFtd7YtBmDY3elay+42cdEaR1KCEKzEc
         RmDQpkpPywYho47m1AQu/3GL7KtHhIy33p4A+shTLTZ4DKJ1V9X40fCq5Bt82jVn6JRK
         MDTNqoTWiuBocyHFaNOwlF1/DqceqjGCXPRFCc9WFonqiTezijeuzJg3zXtFKLBrdqFx
         aj2JWZ5ml0pAPnOslAxuWMShf/3+gpapn46qV12uxBVNTtB/duC0sIDYaAmBSyxkD423
         fSlg==
X-Forwarded-Encrypted: i=1; AFNElJ97dxydyQN0CFWwijPeR02krfxTlykHIILKWuyUvLLeNi1UT2Uop38xdxxFolzSWSCO69qFMS6gvsz2/4St6Lp8@lists.infradead.org
X-Gm-Message-State: AOJu0YwzMQRTWRLAgyajKY2jRaYUd+Um8eE8yKk+CFLGsQ4n8E0sBCDm
	2emKU8ipjhu5OU0JRdRjLsLtnc75RjlDCLEo1tn2fsRZvvfjJtxhLbZm5K1PrXUXKLD7Hss89qz
	MC4xgwkPR
X-Gm-Gg: AeBDieuW597JQITI3R2bm0vh6JVdr9aeAYeEl2sKAVHIRF7OCJ5DsvuDLREZlrXTk7w
	pNFt6aVbAGITkKq6pRaQNjRdCY+4T0J7S6RXI/vRn219YMMxDYvX5BPVI/vHCAvh7AsyO752MmB
	vQac8qAsQv0MJcsaFezpWF9zhOeF4u97/L/WEBWN43LwmOX0fKUJuTJgThOscmQInOpeDbf0gz+
	XMKqoDcmeHud6qakq+aZAh4/JaOZ5Sbrc44FQIQx1TAQPAK0G5XFV7L798IvDvm0sVxu41MxQGH
	7VGNvbhRBPYAlWf1/oiJr4yX6EehENMhjG1c7fnYImL66P1OyvikAORB6brpd5exWG/E4dZv6gY
	91kHjnJo0GmeGrmXOa/XB+vtfZqIatDt189o3F5vyHuVSx0pY2CAw6ev2C+AaueL+uqQz6JDEcN
	sU9ax9SIE7SFiUDMKQ+sKinmPYUUYj7Hyxrx1ijmwnycXlU0Z+17tNEg5+yUMDvdmTb1sjq00v
X-Received: by 2002:a17:906:dc90:b0:ba4:d724:1730 with SMTP id a640c23a62f3a-bbec04096e4mr32452966b.20.1777593806731;
        Thu, 30 Apr 2026 17:03:26 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b85e28d6csm432452a12.4.2026.04.30.17.03.25
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 17:03:26 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d73352cf2so1313969f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 17:03:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9bUB1JVlzI1eMatXVyQacXyczPaGpQRM4AZbRkNlMxaYv0fZShwYKdov9AOPrQzvY+zdweXN+4wOEUtKhWtwuX@lists.infradead.org
X-Received: by 2002:a5d:5846:0:b0:447:55b5:d532 with SMTP id
 ffacd0b85a97d-44a87f60a32mr1080919f8f.37.1777593318187; Thu, 30 Apr 2026
 16:55:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-8-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-8-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V2H426VR8z5EEm4bWuK-Fvg_wr+mAkkaAfJrWcU0kV1g@mail.gmail.com>
X-Gm-Features: AVHnY4JV5Y3mu38iXutrpDHLS51XF8wv90SD0VK4jxBhsJoT2PtDnx5IHddvQ_U
Message-ID: <CAD=FV=V2H426VR8z5EEm4bWuK-Fvg_wr+mAkkaAfJrWcU0kV1g@mail.gmail.com>
Subject: Re: [PATCH 7/7] arm64: dts: qcom: Add #{address,size}-cells to
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
X-CRM114-CacheID: sfid-20260430_170329_213870_30EC84F3 
X-CRM114-Status: GOOD (  18.56  )
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
> / {
>         firmware {
>                 ranges;
>
>                 coreboot {
>                         compatible =3D "coreboot";
>                         reg =3D <...>;
>                         ...;
>                 };
>         };
> };
>
> Notably, the /firmware node has an empty 'ranges', but does not have
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
> ---
>
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi   | 5 +++++
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 5 +++++
>  2 files changed, 10 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

