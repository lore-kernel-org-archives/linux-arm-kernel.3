Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AF7C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 10:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wIz5Dg4pJALggVCJV3aAQrkAcnenmZfu2TddhDFfjFE=; b=lf82tyNww82GcETQrJxhbaYqVX
	AnziBDjAcAt/2r9okUdh0rapXfO7hc5RMiH/qVOJKyEJw0I1mXYs8DvH8iM8/HzZONf7f/NIS3FgM
	3i1X8JvTAfD3UpqCNg/UOeQONoFhBZwdWZrYTWv+3Ywl8bpavvtnLDjADUsPzqQafzTrxsCPzgEVY
	ysJ2NshPNPHDlLsqIo1xlMM0Mw1QebTJdOrSH0+O5yeNxnoocTP+ktu7+vKN6Qmu2PMHiGpYpmC/p
	FCjBp9Gic0fP3FVcTfdWAAcY4Dx4x4qD3MOmISJoa8c0wiA4TGvqRQp7lWQxTXdsXfiA42G25eH/X
	KYuE9Axg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taYD0-00000009z49-3eRl;
	Wed, 22 Jan 2025 10:43:42 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taY8I-00000009y5t-1PKc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 10:38:52 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-436341f575fso73565495e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 02:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737542328; x=1738147128; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIz5Dg4pJALggVCJV3aAQrkAcnenmZfu2TddhDFfjFE=;
        b=iBm3UadQkGDKB/6e8z9COJ9FTNh5dhh6sUkBlLYug5/aZHXtTBaNNbtB9sQX3LQ7KP
         7ne26xu4WUPOQArVLJZwqJBfLl3iFytWPg7THVl6biWAh6/inCF87oYZs20amG2swh4s
         n5RQdJUjGTUEagu/gI1O8dT6gEa9ZZva/0ZSiWYpiYZJmqbGCrsO1NV8vWQtEjlrFx9N
         uoWJ99Nhywu4NitwPL1UEJ+GPlK6/jarJjyoIKiZyPSohefdbmv1AcLyFOVDK9QZC4W4
         J+GVd9y+m0jLlCZCIeKtZnLoo33OIIdf0iW4HgbJ43zM6KDU0b1xVIgUmtug5d7SdX85
         v7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737542328; x=1738147128;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wIz5Dg4pJALggVCJV3aAQrkAcnenmZfu2TddhDFfjFE=;
        b=LKmrtiPFnMhT2D5tqwvyZtAqxKBRyFtQQ8uvQzlmXEaU41wRgP/b/VI6PC8Gy60Gmv
         VGMSx/CmOGZUoxnB6NQFk4wrVhBZaJ/Ych0kvfk8JF5Yh9GAJIeSiONYxpPx5PcfMQqW
         KDBcZbIqYpFIzFB0xX5yNRqfdX2+YlqoJJhUQIeA1XD3JMOdNONeieeOtBuH8ayyQahe
         eJepvI5iChW8TfQbXC6IL1MO7+tirtZaJzKZnQV13CYPR7yt9XFz0tHNC+Zc84W1dbyt
         x16mRQlI/tdHFNu+nHs/Hp7tniU0EBNHHEMpmyz1poHPLa2wVSz1j6H98hAy36hhCQr/
         wMug==
X-Forwarded-Encrypted: i=1; AJvYcCWK/HK8i3Fs2+9eREDrlPUDtQesWn6hzFEhrl3EKaRzq0hrv+2NkHH3zLRC+puDBERcxXg1TdH3h5MKgPzQKGyA@lists.infradead.org
X-Gm-Message-State: AOJu0YwPtU0Je1AtLAuXu18TywU6MpanRdhAlHJSBCJhuNXgwYJHUhs4
	AvLLMJV41bT+dd0OvQANzxQFGACltjabVeL8watsMBPwUfz3d9ZVq3zQ3z1IkLo=
X-Gm-Gg: ASbGncs57b19r/PO18mC+FNo2QFJ0VfvxdUJFNDi4klkrRG/rp9VdBYfb8eWglocNUD
	6gXm0jIbZED/st8Knr7wBz+g0oKfKbquRbMv+KOpg1j5b0fC7wrlyBUY/eaYP7FlAgLmbr8ubMt
	B/KwYTjUOszWnMZb15P0Am07EfIXPvM9yUGeVS+Os+ykzrpplrU6O1TmdPSILlJtDald9wbGChg
	vzjr2xvhTFPLk4CxPEuzwvIQCwlZkbi8r/f6eZhLFOnLEDVEuPHMnKQndZdOKf3DmjVJQ==
X-Google-Smtp-Source: AGHT+IGHWICVymyczl4ii8tG0TEJPCRASpGt6Bh6um0Z96LWBrB4SGwG4XeA1Yko2Ghrm1yauaArzQ==
X-Received: by 2002:a05:600c:35c3:b0:434:f131:1e71 with SMTP id 5b1f17b1804b1-438913cf2e0mr197285195e9.8.1737542328421;
        Wed, 22 Jan 2025 02:38:48 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:c6fe:2fe2:acd6:8e99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31b1566sm19283775e9.24.2025.01.22.02.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 02:38:47 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ao Xu <ao.xu@amlogic.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
  Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Kevin Hilman <khilman@baylibre.com>,
  dri-devel@lists.freedesktop.org,  linux-amlogic@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/11] Subject: [PATCH 00/11] Add DRM support for
 Amlogic S4
In-Reply-To: <3aa88bdb-ce84-4029-b497-2502ab1eb7a5@amlogic.com> (Ao Xu's
	message of "Wed, 22 Jan 2025 17:50:25 +0800")
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
	<CAFBinCDG2in4ZZAp2LXnz8bgiZoPL3G_c9+aCo9+Ort2W-tFCA@mail.gmail.com>
	<1jwmex5lpc.fsf@starbuckisacylon.baylibre.com>
	<3aa88bdb-ce84-4029-b497-2502ab1eb7a5@amlogic.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Wed, 22 Jan 2025 11:38:47 +0100
Message-ID: <1jldv3i154.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_023850_369351_1AAD225A 
X-CRM114-Status: GOOD (  32.75  )
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

On Wed 22 Jan 2025 at 17:50, Ao Xu <ao.xu@amlogic.com> wrote:

> On 2025/1/15 1:50, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On Sun 12 Jan 2025 at 23:44, Martin Blumenstingl <martin.blumenstingl@go=
oglemail.com> wrote:
>>
>>> Hello,
>>>
>>> On Fri, Jan 10, 2025 at 6:39=E2=80=AFAM Ao Xu via B4 Relay
>>> <devnull+ao.xu.amlogic.com@kernel.org> wrote:
>>>> This patch series adds DRM support for the Amlogic S4-series SoCs.
>>>> Compared to the Amlogic G12-series, the S4-series introduces the follo=
wing changes:
>>> Thanks for your patches. With this mail I'll try to summarize my
>>> understanding of the situation with the drm/meson driver as I'm not
>>> sure how familiar you are with previous discussions.
>>>
>>>> 1 The S4-series splits the HIU into three separate components: `sys_ct=
rl`, `pwr_ctrl`, and `clk_ctrl`.
>>>>    As a result, VENC and VCLK drivers are updated with S4-specific com=
patible strings to accommodate these changes.
>>> Jerome has already commented on patch 3/11 that this mixes in too many
>>> IP blocks into one driver.
>>> This is not a new situation, the existing code is doing exactly the sam=
e.
>>>
>>> Jerome has previously sent a series which started "an effort to remove
>>> the use HHI syscon" [0] from the drm/meson hdmi driver.
>>> In the same mail he further notes: "[the patchset] stops short of
>>> making any controversial DT changes. To decouple the HDMI
>>> phy driver and main DRM driver, allowing the PHY to get hold of its
>>> registers, I believe a DT ABI break is inevitable. Ideally the
>>> register region of the PHY within the HHI should provided, not the
>>> whole HHI. That's pain for another day ..."
>>>
>>> For now I'm assuming you're familiar with device-tree ABI.
>>> If not then please let us know so we can elaborate further on this.
>>>
>>> My own notes for meson_dw_hdmi.c are:
>>> - we should not program HHI_HDMI_CLK_CNTL directly but go through CCF
>>> (common clock framework) instead (we should already have the driver
>>> for this in place)
>>> - we should not program HHI_MEM_PD_REG0 directly but go through the
>>> genpd/pmdomain framework (we should already have the driver for this
>>> in place)
>>> - for the HDMI PHY registers: on Meson8/8b/8m2 (those were 32-bit SoCs
>>> in case you're not familiar with them, they predate GXBB/GXL/...) I
>>> wrote a PHY driver (which is already upstream:
>>> drivers/phy/amlogic/phy-meson8-hdmi-tx.c) as that made most sense to
>>> me
>>>
>>> Then there's meson_venc.c which has two writes to HHI_GCLK_MPEG2.
>>> I think those should go through CCF instead of directly accessing this =
register.
>>>
>>> Also there's the VDAC registers in meson_encoder_cvbs.c:
>>> I think Neil suggested at one point to make it a PHY driver. I even
>>> started working on this (if you're curious: see [0] and [1]).
>>> DT ABI backwards compatibility is also a concern here.
>>>
>>> And finally there's the video clock tree programming in meson_vclk.c.
>>> My understanding here is that video PLL settings are very sensitive
>>> and require fine-tuning according to the desired output clock.
>>> Since it's a bunch of clocks I'd say that direct programming of the
>>> clock registers should be avoided and we need to go through CCF as
>>> well.
>>> But to me those register values are all magic (as I am not aware of
>>> any documentation that's available to me which describes how to
>>> determine the correct PLL register values - otherside the standard
>>> en/m/n/frac/lock and reset bits).
>>>
>>> I'm not saying that all of my thoughts are correct and immediately
>>> need to be put into code.
>>> Think of them more as an explanation to Jerome's reaction.
>>>
>>> I think what we need next is a discussion on how to move forward with
>>> device-tree ABI for new SoCs.
>>> Neil, Jerome: I'd like to hear your feedback on this.
>> I completely agree with your description of the problem, that and
>> Krzysztof's remark on patch 6. This is not new with this series indeed,
>> so it does not introduce new problems really but it compounds the
>> existing ones.
>>
>> Addressing those issues, if we want to, will get more difficult as more
>> support is added for sure.
>
> Hi=EF=BC=8Cjerome
>
> =C2=A0=C2=A0=C2=A0 What are the next steps for "an effort to remove the u=
se HHI syscon"
> patch set, and what is the schedule?

I have no idea. You should check with Neil whether or not it is something he
wants to do and how.

If you (or anyone else) want to make a v2 out of the first clean-up I've
made [2], you are welcome to. I'm handling other things ATM and I don't
expect to get to it any time soon.

[2]: https://lore.kernel.org/linux-amlogic/20240730125023.710237-1-jbrunet@=
baylibre.com/

>
>>>> 2 The S4-series secures access to HDMITX DWC and TOP registers,
>>>>    requiring modifications to the driver to handle this new access met=
hod.
>> Regmap buses are made for those cases where the registers are the same,
>> but accessed differently. There is an example in the patchset referenced=
 by
>> Martin, to handle GXL and G12 diff.
>>
>>> This info should go into patch 1/11 to explain why the g12a compatible
>>> string cannot be used as fallback.
>>>
>>>
>>> Best regards,
>>> Martin
>>>
>>>
>>> [0] https://github.com/xdarklight/linux/commit/36e698edc25dc698a0d57b72=
9a7a4587fafc0987
>>> [1]
>>> https://github.com/xdarklight/linux/commit/824b792fdbd2d3c0b71b21e1105e=
ca0aaad8daa6
>> --
>> Jerome

--=20
Jerome

