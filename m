Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF11E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 17:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r7kyhS+AN7mALzi6gxFmcRFltHcX9PkTUE9xxZswSTo=; b=2Ilp9kpLeA3ZbUw9WGmVnpwL+c
	O8R7abFZHdccdowY4FANioYa/wa+o51gRZUE/tKsAblpMLsRUGYzUs0Sm6xZv8AklwjhdS/D9LkdI
	6Zx/t0PuIdOKf7a0Dao11Gb2jeCd2rAHPiKK2I7gJjqvxrIAhOnaNh9zFWkXJ15kBdlSrpRIdWyxN
	s6PnyJkA300IVCj8dqK6Gt6XU3dydZ3aFmsb6Mzxj0weW+BKs6tBfkzLXwTsRFrZafprLtvr2Y1Qw
	EmgPSOb8E/Li7LmFj5WhV+6/tIjhFrOQwAOHKEs+ZnKI1r5artg+MxzotnP8MCAVoIvED+7I7x2yP
	NvNo/B3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXl4s-00000009FTh-028a;
	Tue, 14 Jan 2025 17:51:46 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXl3b-00000009FGk-14vu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 17:50:28 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4361815b96cso41352155e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 09:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736877025; x=1737481825; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7kyhS+AN7mALzi6gxFmcRFltHcX9PkTUE9xxZswSTo=;
        b=JaMwXUnAtRDX6W0nPzDBH7iFKqZxE8zignj6Odn6+NkpikSHb8PVKo7myg9H284f28
         AyBDzSxD+zq0ge2pS5OXbvvc/p7bKRXyamH4NQWJYaFCcW5CqhmUtRyYXbwTIWdit0Nw
         +ukWZTSEx9DJNxBFsAx1hH0UdC3Cmj/0swoxGnQEux34VN2feZ1uxySb5EF7PJUf8EGb
         LuqRocvrILXZg9bs9C7Y8NTssgrMmPlzpo1+x7306ZYozCmwWYNLicXHoo6OG0AsmlZf
         UTuIxgbs30GIPa3xUYJjRQ2c7Hfp5pB97h3h1bQ4lfwEBKWmyCj8fWK8CuttV7ZJY2hI
         +WbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736877025; x=1737481825;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r7kyhS+AN7mALzi6gxFmcRFltHcX9PkTUE9xxZswSTo=;
        b=ZNbq4xqyKnj0CvMkXk+DBGhIWVTw51zA+7CiHInr0IMDBP4Nh/Q4Nof8AgO+EZBlug
         /fh+gdEYgFTsU/aCAghX2JeC8rmTn8wEF5iQQvvfkVPSkFtzJ/kmYLQK3pcKV3wFRiuX
         97bwo96ugGD4ZbHWu22IPmioBswShMSATbb0d2t1zOrKrp7hfF7R1XaTnwzg2PVRCZys
         3rrsADEjGLeASkmRrtrPoU6JDXC0Dl29+iJca3NW8K/GAnSEC39Ol5qzmp/gkv4+4uQx
         rWROEdsB/Lo4tV3YHAz16aV8KbF/oKUoZp7OiOCabLDLONEyln5Jq2HKbLUI9CQ+DSdY
         suFg==
X-Forwarded-Encrypted: i=1; AJvYcCW0GZhjE+xA4g3lj2ylb+O12+GO01FiCEl8K6yQaSt/ytQgffax8ubsqlg6vAy0RLsV5Cu5/GUqchQ9EFyke2oF@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq1DzbgjeV/HW7jKl/x/J6vlmGc+e+WJc5aqwQPd4YbePk029J
	S3BWoPcrHV70VrRqdC0rV3y4T6PMC7xgRq1HMytrdnXr2UNPUUVpvzs0qUX87n8=
X-Gm-Gg: ASbGnctriBvxumYYaR8bs1b61kHyNm9KtkZQqiEC5k08uNwKQJM969xiPUVUH/mutNX
	vKuxQ7BLRKzrlpudJfWF1LrvP7NfrjLT8Rus2lidNCKRye7e7pQP0okpFFO7RYifilEFyFO1H/G
	mryuNoDInx8TwghAbDVX40jVACufJK+qUeKtmyKdQiorqz9nw32eUVtKfG9F3esqYTvRWVDIapW
	xbLvtZ8/VdtxXFGsvZyx026M5rlwuYbI9esKqo3wF1+cT6yN7Sxbai+
X-Google-Smtp-Source: AGHT+IGniaS5vKpw5UThOug4qTnk81tkkU2MITchcBy/hQw5sKSXoGOKno5PQ4PZG23+YM4eJ9Ctww==
X-Received: by 2002:a05:6000:1547:b0:386:391e:bc75 with SMTP id ffacd0b85a97d-38a872debb2mr24343563f8f.16.1736877025045;
        Tue, 14 Jan 2025 09:50:25 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:317c:3d93:b7d4:96cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c23dcsm15192221f8f.101.2025.01.14.09.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 09:50:24 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: ao.xu@amlogic.com,  Neil Armstrong <neil.armstrong@linaro.org>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,  David
 Airlie <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Kevin Hilman <khilman@baylibre.com>,
  dri-devel@lists.freedesktop.org,  linux-amlogic@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/11] Subject: [PATCH 00/11] Add DRM support for
 Amlogic S4
In-Reply-To: <CAFBinCDG2in4ZZAp2LXnz8bgiZoPL3G_c9+aCo9+Ort2W-tFCA@mail.gmail.com>
	(Martin Blumenstingl's message of "Sun, 12 Jan 2025 23:44:52 +0100")
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
	<CAFBinCDG2in4ZZAp2LXnz8bgiZoPL3G_c9+aCo9+Ort2W-tFCA@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 14 Jan 2025 18:50:23 +0100
Message-ID: <1jwmex5lpc.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_095027_288509_A5011CB4 
X-CRM114-Status: GOOD (  44.30  )
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

On Sun 12 Jan 2025 at 23:44, Martin Blumenstingl <martin.blumenstingl@googl=
email.com> wrote:

> Hello,
>
> On Fri, Jan 10, 2025 at 6:39=E2=80=AFAM Ao Xu via B4 Relay
> <devnull+ao.xu.amlogic.com@kernel.org> wrote:
>>
>> This patch series adds DRM support for the Amlogic S4-series SoCs.
>> Compared to the Amlogic G12-series, the S4-series introduces the followi=
ng changes:
> Thanks for your patches. With this mail I'll try to summarize my
> understanding of the situation with the drm/meson driver as I'm not
> sure how familiar you are with previous discussions.
>
>> 1 The S4-series splits the HIU into three separate components: `sys_ctrl=
`, `pwr_ctrl`, and `clk_ctrl`.
>>   As a result, VENC and VCLK drivers are updated with S4-specific compat=
ible strings to accommodate these changes.
> Jerome has already commented on patch 3/11 that this mixes in too many
> IP blocks into one driver.
> This is not a new situation, the existing code is doing exactly the same.
>
> Jerome has previously sent a series which started "an effort to remove
> the use HHI syscon" [0] from the drm/meson hdmi driver.
> In the same mail he further notes: "[the patchset] stops short of
> making any controversial DT changes. To decouple the HDMI
> phy driver and main DRM driver, allowing the PHY to get hold of its
> registers, I believe a DT ABI break is inevitable. Ideally the
> register region of the PHY within the HHI should provided, not the
> whole HHI. That's pain for another day ..."
>
> For now I'm assuming you're familiar with device-tree ABI.
> If not then please let us know so we can elaborate further on this.
>
> My own notes for meson_dw_hdmi.c are:
> - we should not program HHI_HDMI_CLK_CNTL directly but go through CCF
> (common clock framework) instead (we should already have the driver
> for this in place)
> - we should not program HHI_MEM_PD_REG0 directly but go through the
> genpd/pmdomain framework (we should already have the driver for this
> in place)
> - for the HDMI PHY registers: on Meson8/8b/8m2 (those were 32-bit SoCs
> in case you're not familiar with them, they predate GXBB/GXL/...) I
> wrote a PHY driver (which is already upstream:
> drivers/phy/amlogic/phy-meson8-hdmi-tx.c) as that made most sense to
> me
>
> Then there's meson_venc.c which has two writes to HHI_GCLK_MPEG2.
> I think those should go through CCF instead of directly accessing this re=
gister.
>
> Also there's the VDAC registers in meson_encoder_cvbs.c:
> I think Neil suggested at one point to make it a PHY driver. I even
> started working on this (if you're curious: see [0] and [1]).
> DT ABI backwards compatibility is also a concern here.
>
> And finally there's the video clock tree programming in meson_vclk.c.
> My understanding here is that video PLL settings are very sensitive
> and require fine-tuning according to the desired output clock.
> Since it's a bunch of clocks I'd say that direct programming of the
> clock registers should be avoided and we need to go through CCF as
> well.
> But to me those register values are all magic (as I am not aware of
> any documentation that's available to me which describes how to
> determine the correct PLL register values - otherside the standard
> en/m/n/frac/lock and reset bits).
>
> I'm not saying that all of my thoughts are correct and immediately
> need to be put into code.
> Think of them more as an explanation to Jerome's reaction.
>
> I think what we need next is a discussion on how to move forward with
> device-tree ABI for new SoCs.
> Neil, Jerome: I'd like to hear your feedback on this.

I completely agree with your description of the problem, that and
Krzysztof's remark on patch 6. This is not new with this series indeed,
so it does not introduce new problems really but it compounds the
existing ones.

Addressing those issues, if we want to, will get more difficult as more
support is added for sure.

>
>> 2 The S4-series secures access to HDMITX DWC and TOP registers,
>>   requiring modifications to the driver to handle this new access method.

Regmap buses are made for those cases where the registers are the same,
but accessed differently. There is an example in the patchset referenced by
Martin, to handle GXL and G12 diff.

> This info should go into patch 1/11 to explain why the g12a compatible
> string cannot be used as fallback.
>
>
> Best regards,
> Martin
>
>
> [0] https://github.com/xdarklight/linux/commit/36e698edc25dc698a0d57b729a=
7a4587fafc0987
> [1] https://github.com/xdarklight/linux/commit/824b792fdbd2d3c0b71b21e110=
5eca0aaad8daa6

--=20
Jerome

