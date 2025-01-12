Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C87E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 22:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLFoOBjbfRh1gjNLtqlPfhaemkSZmfUAGDlcNvem/wg=; b=a8LbwgYinziUkRVws6J8ODI/A1
	X5O0s6Ul9k4wdthi0vbYdwKA/vokfNdJVAV3BWYX9Q6SW+cHXLOFk+MKerCP5aOfwRVUVrIW244Hg
	iwDa4T4PrShAGoOrItJiJkC/HHFixUYmrJFXw9Qpd6HXhFn/myHm1CRaD/bu5lhyR/fSOAZspEJ/x
	fnN5FNPC4aVsskQ7z3mxnnensVIabYA68UY22nHnB/dhJl9jSWnZ3WT6nQXMo2OXjl04aH3Ul40B5
	d7dsXmYTGbXKhWw+kxp7OBjXgsduYj2Kcv0ZqbpN4JIWHMQ38gy1fBV2NNI/UZb8lMfobdKi0OUjx
	5p8Pj1Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX6jC-00000003Z8m-2Hv0;
	Sun, 12 Jan 2025 22:46:42 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX6hc-00000003Yua-2fjG;
	Sun, 12 Jan 2025 22:45:06 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-21669fd5c7cso63884815ad.3;
        Sun, 12 Jan 2025 14:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736721903; x=1737326703; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLFoOBjbfRh1gjNLtqlPfhaemkSZmfUAGDlcNvem/wg=;
        b=A1UrZTBQwgCo/+3rmx/hB6Qm2/ZeVbSMfv7H8AymP2m3LYrNGTUCTPyuPUn/xVtMV/
         xcg6ndvbqJa2JcGsTFEan0gVBMrXIYDIlM0psG+Ws18X3f+gNQyOnPC+QgpNfdkTQKZl
         uozNk9so0AKoUulODuz/vsEZDs96MjFqzdwkqZDTO7b03ZKBYNu6oGPfVXenWprabHME
         WNXfs18/xSfTyQ/+fUdNBsLlxWXQUZia8OT+WlmPGG+kruNzTduvLJqGeUfA4KKGhkW1
         mCFgTMReV6jQGhQ/xmxxM337Y8F1FkOepGf5ij9MbgOw6OYcqZiWN4dFa9aq8hh1gekc
         sFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736721903; x=1737326703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLFoOBjbfRh1gjNLtqlPfhaemkSZmfUAGDlcNvem/wg=;
        b=sJHM5DRJQode7brZMlofSDJbczuVd0AQavFfqo9TDOzZP0P3HIHPPFbiaj7KgZteI6
         55e8LWxthMOjDUu14QpEUOEchxrzMhg4OMdSdLURQEATCJAgMXLRRHQJkHOUemzeDRa1
         YR27xBY6NmkeHw53snckxDyWQj/7gP6Osd8mvvM+rViIv8tie9ehO8xcVdR5BKjj4vUV
         nj6Jl3VubjCfUfJhPPXQQbyn5+fTTVr229Q8Air480XbE8Z0HtBojI50ZRHF0zRGBg8P
         Eh25UkxWJwe7STDTsDQtMq9zHE1484+D1xZ7hIQUpP+7VGEBeM8WVWXzqoL2o3E3XlMh
         f/Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVkFI+s8D9ueksQPboyDjLU+bDZPa+CbXNYpBLqYZn105hwmMo7L0r6S0wX0mkGrnXY0n6ZkOAqhYaGogOQ@lists.infradead.org, AJvYcCVz5ogLwxIt302FVWWnpWv/qGrZ/28CVlUn5OK4nNHjzaJS1a7pawmcy6RKAq/mQwE5ENdcGt0nEJ+EMb2TOaQRVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXVdmxZOO5ACr/cDDMC5exDyckWwzFui+HRTfwJD2xj5dpeix+
	WAMu3fr+azxlTs5fgMgqXY80O5hMksvQID2SaAIyCWkntTIjiLcOq+uiopaDw4KBkss6EIP+q4r
	0MqNpmXUsJYrX7Zmv6fukrWfFQNI=
X-Gm-Gg: ASbGnct80ClVuFseKsufOtgI+qASDnFnytyT7StlHmW7ArM45a3qQUVcOVI3vLHoEIV
	M0AgBHcSX5fCT72ZKqWjoieYP2TmSrc26oTg2/OgNqCjeKj1QdWSn92M+NZp4pPecOKSIBog=
X-Google-Smtp-Source: AGHT+IGNz3Ruf0X+gVj7nBY3APrFarUB7thQVZMZ4m+s7QUu/pm1goAfZAGCOZYY8Z7GpsZnqZtOgbL3BA33uqULwts=
X-Received: by 2002:a17:902:d510:b0:216:5568:38c9 with SMTP id
 d9443c01a7336-21a83f765dbmr291330955ad.31.1736721903273; Sun, 12 Jan 2025
 14:45:03 -0800 (PST)
MIME-Version: 1.0
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
In-Reply-To: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 12 Jan 2025 23:44:52 +0100
X-Gm-Features: AbW1kvZsSUpdzbvzbuZJcXAZ1UAOMHLx_A3msCo-ZlE0wKJxebqo01Qyaki1jEQ
Message-ID: <CAFBinCDG2in4ZZAp2LXnz8bgiZoPL3G_c9+aCo9+Ort2W-tFCA@mail.gmail.com>
Subject: Re: [PATCH 00/11] Subject: [PATCH 00/11] Add DRM support for Amlogic S4
To: ao.xu@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_144504_706648_92BE79E3 
X-CRM114-Status: GOOD (  25.31  )
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

Hello,

On Fri, Jan 10, 2025 at 6:39=E2=80=AFAM Ao Xu via B4 Relay
<devnull+ao.xu.amlogic.com@kernel.org> wrote:
>
> This patch series adds DRM support for the Amlogic S4-series SoCs.
> Compared to the Amlogic G12-series, the S4-series introduces the followin=
g changes:
Thanks for your patches. With this mail I'll try to summarize my
understanding of the situation with the drm/meson driver as I'm not
sure how familiar you are with previous discussions.

> 1 The S4-series splits the HIU into three separate components: `sys_ctrl`=
, `pwr_ctrl`, and `clk_ctrl`.
>   As a result, VENC and VCLK drivers are updated with S4-specific compati=
ble strings to accommodate these changes.
Jerome has already commented on patch 3/11 that this mixes in too many
IP blocks into one driver.
This is not a new situation, the existing code is doing exactly the same.

Jerome has previously sent a series which started "an effort to remove
the use HHI syscon" [0] from the drm/meson hdmi driver.
In the same mail he further notes: "[the patchset] stops short of
making any controversial DT changes. To decouple the HDMI
phy driver and main DRM driver, allowing the PHY to get hold of its
registers, I believe a DT ABI break is inevitable. Ideally the
register region of the PHY within the HHI should provided, not the
whole HHI. That's pain for another day ..."

For now I'm assuming you're familiar with device-tree ABI.
If not then please let us know so we can elaborate further on this.

My own notes for meson_dw_hdmi.c are:
- we should not program HHI_HDMI_CLK_CNTL directly but go through CCF
(common clock framework) instead (we should already have the driver
for this in place)
- we should not program HHI_MEM_PD_REG0 directly but go through the
genpd/pmdomain framework (we should already have the driver for this
in place)
- for the HDMI PHY registers: on Meson8/8b/8m2 (those were 32-bit SoCs
in case you're not familiar with them, they predate GXBB/GXL/...) I
wrote a PHY driver (which is already upstream:
drivers/phy/amlogic/phy-meson8-hdmi-tx.c) as that made most sense to
me

Then there's meson_venc.c which has two writes to HHI_GCLK_MPEG2.
I think those should go through CCF instead of directly accessing this regi=
ster.

Also there's the VDAC registers in meson_encoder_cvbs.c:
I think Neil suggested at one point to make it a PHY driver. I even
started working on this (if you're curious: see [0] and [1]).
DT ABI backwards compatibility is also a concern here.

And finally there's the video clock tree programming in meson_vclk.c.
My understanding here is that video PLL settings are very sensitive
and require fine-tuning according to the desired output clock.
Since it's a bunch of clocks I'd say that direct programming of the
clock registers should be avoided and we need to go through CCF as
well.
But to me those register values are all magic (as I am not aware of
any documentation that's available to me which describes how to
determine the correct PLL register values - otherside the standard
en/m/n/frac/lock and reset bits).

I'm not saying that all of my thoughts are correct and immediately
need to be put into code.
Think of them more as an explanation to Jerome's reaction.

I think what we need next is a discussion on how to move forward with
device-tree ABI for new SoCs.
Neil, Jerome: I'd like to hear your feedback on this.

> 2 The S4-series secures access to HDMITX DWC and TOP registers,
>   requiring modifications to the driver to handle this new access method.
This info should go into patch 1/11 to explain why the g12a compatible
string cannot be used as fallback.


Best regards,
Martin


[0] https://github.com/xdarklight/linux/commit/36e698edc25dc698a0d57b729a7a=
4587fafc0987
[1] https://github.com/xdarklight/linux/commit/824b792fdbd2d3c0b71b21e1105e=
ca0aaad8daa6

