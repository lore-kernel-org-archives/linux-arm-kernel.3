Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30732C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 10:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A5oO+cMTbQ47NycpUxUJcMEhXz8+yRynclZhYTmvhis=; b=RrdKsJ67tm0Ob+
	SDYnNn20XqoDiuVCSd8aDKH7dg1p0Jq2gjGz9L9KE2WSTuNK362rddpFMjrZylKqxS+ACgJRy0+3N
	HVZ5A0ghDCOrfNqVJswK2uMKsqnApCp1txG2oP8niLTTNo3HWyzN/WN49Vj6QaLc4Wr6JhQuXyFcY
	ZVaiGWmsOwo8SZj37p4Bc9XAxb2iIgOtGUteEb7hZCqvQ39MFBRqqIs9BwmFifEQoB/2eGprxS2Xh
	Bq4G5GEtsY3z6rr+lt0pfwYZC3axhKhxLjj3PZlnnZ1RgsSusoA27vWtKY2R4yHWADj5F0Nq1JALZ
	1/F1XVmzVL5nBRbHULIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ENz-0000000HE8x-0B8I;
	Sun, 20 Sep 2026 10:03:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ENx-0000000HE8n-34Ud
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 10:03:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 353D4437ED
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 10:03:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D7F1F000FF
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 10:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789898581;
	bh=A5oO+cMTbQ47NycpUxUJcMEhXz8+yRynclZhYTmvhis=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=Tco057qgWvgMuPuc4/91xhT2/7OKkAszD83wQzIYe3mDkMMJxIBWH4LbtRvfobKUQ
	 yAhKphrUMBpepjuzK5gt+voyHNIhtbk1Qa4gtqAR5NrZ52Fukpcpc9QKE1Si744HIW
	 3M1wAMKAnSNIb8pbkJcltguiMRTchvMg/2OUShSix9qONcds0jja/ROfDQVtNqEEAX
	 XP51rAlP9Kf1UOGcpl/6AeG7aWjQYJH6oAilT6SEEfZN5JeF5ACfrxtXmLdhK3aF3D
	 creBqK1Tsbt9p3vxcj1K0VKo88iBq2tpSkIeFO4SN7/qwr62XWYK4tdL1P8ffIY7dd
	 sjugVvnfX9l7w==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a5919af2eeso18343131fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 03:03:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzc/OKoU/QHiRuaFbh5YKBdxwxYHYfaOyuQ9W6SckoDGqZs7VEDXuvaIGEgxb1Q4NeA7QuFJ5obIILgWSPpvsII@lists.infradead.org
X-Gm-Message-State: AFuF++nsL/gHQwqJdMSsIQZd9zADYUm6hOnHLa1TD/1KigTw4uYLwn2Q
	oM0OsHXsOsdSyx7oue1ZXzhh5s6iQRlB90Ldf1X8RcgVj3H4IuOtQ9kCsYP5dlljh7r3LiJoATA
	pJlOEVEwPY0WJvyGCw3tVIwVnkzVrI1c=
X-Received: by 2002:a05:651c:31c5:b0:3a3:7681:6d60 with SMTP id
 38308e7fff4ca-3a5fc0aa3afmr16089621fa.24.1789898579440; Sun, 20 Sep 2026
 03:02:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260913145527.18148-1-iuncuim@gmail.com> <20260913145527.18148-5-iuncuim@gmail.com>
In-Reply-To: <20260913145527.18148-5-iuncuim@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 20 Sep 2026 18:02:45 +0800
X-Gmail-Original-Message-ID: <CAGb2v64SfV4wdXwn2Si8w87r6E+PidAAKJJfUJDWqz3kHn9chg@mail.gmail.com>
X-Gm-Features: AcwNN1WNiiqZx-dirR42ASsi4bsV2jdbUXD9xI8djW0wkB4hBsUX1s8oMylt76o
Message-ID: <CAGb2v64SfV4wdXwn2Si8w87r6E+PidAAKJJfUJDWqz3kHn9chg@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
To: Mikhail Kalashnikov <iuncuim@gmail.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	=?UTF-8?Q?Juan_Manuel_L=C3=B3pez_Carrillo?= <juanmanuellopezcarrillo@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, Sep 13, 2026 at 10:56=E2=80=AFPM Mikhail Kalashnikov <iuncuim@gmail=
.com> wrote:
>
> From: Mikhail Kalashnikov <iuncuim@gmail.com>
>
> The A523 processor has two temperature controllers, THS0 and THS1.
> THS0 has only one temperature sensor, which is located in the DRAM
> controller. THS1 does have 4 sensors:
> ths1_0 - "big" cores
> ths1_1 - "little" cores
> ths1_2 - gpu
> ths1_3 - npu
>
> The user manual for the T527 processor describes 4 sensors, whereas
> the one for the A523 describes only 3. As additional information, the BSP
> driver was used, in which the value SUN55IW3_CAL_COM(5000) is used as
> the calibration value in the formula; in the mainline driver it is
> treated as the ft_deviation value. Also, in the BSP driver the NPU sensor
> is used for both the GPU and the NPU =E2=80=94 its actual purpose is uncl=
ear;
> both sensors are functional and show temperature changes depending on
> load.
>
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

I think we can ignore Sashiko's concerns for this patch.

1. calibration likely happens at room temperature
2. it is not the drivers responsibility to guard against incorrect
   device trees

