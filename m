Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE260C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 21:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WvCeOL9JP58AfB/MRzhZ0CTB3RYi+jJQ1QyJ9ty4SVE=; b=SdrMnTq+TGl/xahgB0XE0XEOZl
	nxmJkFqSSpsGEIqbKPO6QQs4p2kGKn6oNqRFezqJml36fFq73kEhfpnMmfq7m+OXm1LRGKeF0Zrxq
	+xACin6marWbrM59K+gcJ0rvQJJIeCiD67Lf4hV3Nua8oMaUDmcv8DKQPQQa8nM3Egf4OoxQINjvp
	FkxLP4sAftBq2WOZCEeUK75/+4TDxKLAWsuubwQa2ODF4EBARJx0+5o7huOLEFgEqoJOVBLSkHnvj
	anHoVfLjXcKwRvAaYJ9s83r249qMIQe5DO4V6wc+tEJGdrTy8lxxKQh5Wrhwam+nXJoMpT+EvRTsy
	ekHtD7pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wttxV-0000000Ez39-2MTb;
	Tue, 11 Aug 2026 21:24:29 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wttxS-0000000Ez2A-2oS2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 21:24:28 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-46f88060e8dso33835f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 14:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786483464; x=1787088264; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WvCeOL9JP58AfB/MRzhZ0CTB3RYi+jJQ1QyJ9ty4SVE=;
        b=oJQUBMhpvM99ZWXuHGto1Bp7ykVWmNX4Ze2O/EA9vp+ordAnUZ7NZkbz07Q3ttCo1N
         7J626cJRWnO8phPxODD48Fq6JewYYd2arMyo94ACyOyu6bbV45nhPg8JPcxT0mQg3x8s
         r56IpTaUbXIW5wUcz91F2kKKOEQIJ2A7OzI9yPKea5S1v+nc5T5dO628tyyuJ1XC9wdY
         UJd4nr+7KIQAc2R7taX2O7tz02DLkEtTt7kHXiKv8yUoKf0ZUy0TIbRiOxe8EDv2jWY/
         xTDLSjQTUrYUukSF1+e3m/h34ZSrfgK2PHJPilIiRCD8YtnscX7u52S067q8BV+IPJDM
         EfOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786483464; x=1787088264;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WvCeOL9JP58AfB/MRzhZ0CTB3RYi+jJQ1QyJ9ty4SVE=;
        b=lpCOo2edNeV490KQpyIJEMqE3o/HbZOWTcuEsEeW+s6YM+AyZMkHJeICvEmJUZEPJ4
         z1qmHZwR7GVFpR6asBSlMcxTnweunWnaGo+BKXQemdQk0+3I8zhsjNY1aar2iXKAQ8z3
         Z4zzjFA13Vn/CbhuskXjj8vSKsJBUdzW16Bmn4a+WpTgplygD2ibg+effAbYCx0ye3TR
         v9s/WjPYpiFfl474LHf5uUSiBSmlY02LwephCpxxMZUtB5q3ylu4Ug3nPQdctoL8CjTU
         4305E6puhdniBQ1E55HpjBVFen5Sbeva3mvHqPb37nJ5RoG0CJHyzLiMftiNtMNx41vg
         Aldw==
X-Forwarded-Encrypted: i=1; AHgh+RrNMQ75YT3gYODrmTEbnuDl3VzZjHCxR2a7o5GLlUws3trlLrj3DaWUE/T+QJikxQYWnmDwHc4Fs1JJ20OssS8z@lists.infradead.org
X-Gm-Message-State: AOJu0YxDpMIbBpWPm3Yj4j78yTwWCoWY3Q72OvdbdS7mNwUz/KloEYru
	9gfCB7IbhSkvoJFP336JooRZ8VERzbLCGZJJK3jXXNf4kjpZ0nk859sH
X-Gm-Gg: AR+sD13i8NuUVAd1jmsnz1UYof1ZrFOdQqYgvhfiysPbcxT9mATTurkL27xMTn1FCbt
	yqZ7cD/RD2976l4cT0WR6hhRvGlQmJf0Mo9Q6C3ktPmwyJ1Gydw+zP3BlOdO0wv+dEFUnDxloMY
	8FBzRdxXY7GbCvejMrrY/Sf4hjfcVX0j0V7DcT3/wqD0eCTEO3eS9aDQpS6Pf8Px9QIrGm2diHq
	7BNCa/ItbJB3IPKKfvFCEPzn13nDbDFtq5MV/0HR5ZfRXoeMvc3VerHPx9hpqXq3ucvR2+1EUwy
	v3/VMUrJpM0KGAab23LS0Nuv15pwRU14s4zgN1A35uSX8BMFEtnZ2P+tQBvmRjIQzVVber/GfJ+
	nWc6ETjMaC0bJOCQcvCYLPqPj1Vc86wwkBlnFXAtnr0L6mTBD98ZsO1pbD47n5nUtxSnzOdSAfl
	9l1C8NXG6jqqIHK/PmICLhcBUB3pEfJj7mugYCY5nKNCAOycJP40wCuDSy2FYxBQOnMtc91Zc6n
	zmaCE6jG8wMphqdDcta9F5MnoS24MVV3Ls3aPM9RDLnnNIhqCZ4w3fhEPszIoUu2K3mMA==
X-Received: by 2002:a05:600c:1f82:b0:496:bbce:ef with SMTP id 5b1f17b1804b1-4997c15bc31mr801435e9.3.1786483464434;
        Tue, 11 Aug 2026 14:24:24 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B94ED005B06BF1B5A09FFE4.dsl.pool.telekom.hu. [2001:4c4e:1b94:ed00:5b06:bf1b:5a09:ffe4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aac6e85sm20674225e9.14.2026.08.11.14.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:24:23 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Alexey Charkov <alchark@flipper.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: drm/rockchip: vop2: ACLK_VOP pinned at 500 MHz starves DP 4K120 on RK3588
Date: Tue, 11 Aug 2026 23:23:50 +0200
Message-ID: <20260811212358.9980-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <c0a7521d-9c19-4197-802b-2b64a6ddea28@rock-chips.com>
References: <20260808104240.13776-1-royalnet026@gmail.com> <33bd4a94-11af-4cf3-ae44-b7f8944250f6@collabora.com> <c0a7521d-9c19-4197-802b-2b64a6ddea28@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_142427_407465_1E5D0329 
X-CRM114-Status: GOOD (  24.22  )
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

Hi Chaoyi, Cristian,

Chaoyi, your reading fits my own measurements better than mine did.

The link in that test was running YCbCr 4:2:0, so dclk sat at 594 MHz
for a 3840x2160@120 mode - the interface rate was the cheap part. What
was not cheap was what the video port had to compose: a single
full-screen 3840x2160 ARGB plane at 120 Hz. So the case I reported is
one where the interface was modest and the composition was not, which
is the direction you are pointing in. I framed it as a DisplayPort
problem because DisplayPort was the only thing I changed; that was the
wrong axis.

I should say what this bears on directly, because it is not
hypothetical for me. I have a patch here that I have not sent, which
replaces the frl_enabled condition with a threshold on the pixel clock:

  static bool vop2_needs_aclk_boost(struct drm_crtc_state *crtc_state)
  {
      return vcstate->frl_enabled ||
             crtc_state->adjusted_mode.crtc_clock > VOP2_HIGH_BW_PIXCLK_KHZ;
  }

with VOP2_HIGH_BW_PIXCLK_KHZ at 1000000, so that any video port needing
the bandwidth can ask for the higher rate. It also guards the refcount
on the way, since atomic_disable() runs for ports that were never
enabled and the counter is unsigned. It is written against the
rockchip-devel branch, on top of the commit Cristian mentions, and I
was holding it back until I had a threshold I could defend.

Your reply says the quantity I keyed it on is the wrong one, and I
cannot argue against that from my own data. The measurement the
threshold came from is that at 500 MHz a 2560x1440@144 mode stays clean
while 3840x2160@120 does not. But in both cases the port was composing
a single full-screen plane at the mode's own resolution, so mode and
composition moved together and the comparison cannot separate them. If
the rule belongs in terms of what the port composes, then the pixel
clock is at best a proxy that happens to fit the two points I have.

I would rather learn that before sending the patch than after. Two
things I can run here:

  - your first case: hold 3840x2160@120 on DP, leave ACLK at 500 MHz,
    and scan out a 1080p plane instead of the full-screen one. If that
    comes up clean, the pixel clock is not the variable and the patch
    as written is keyed on the wrong thing.

  - your second case: a modest mode with several 4K ARGB planes
    composed at once. I can drive that over HDMI, without the USB-C
    adapter in the path, so it is a cleaner test than the first.

Is there a form of the condition you would consider correct? What your
description suggests to me is something derived from the composed pixel
rate summed over a video port's enabled planes, with max() across the
active ports rather than a refcount - but you know what the hardware
actually stalls on, and I am inferring it from an interrupt counter.

Cristian, understood on HDMI. If FRL and TMDS can serve the same mode
at different fixed rates, the mode cannot determine the rate on its own
and a bandwidth rule cannot be the whole story there. That answers what
I asked. Whatever shape this ends up taking should keep working for the
FRL case you already handle rather than replace it.

One thing worth carrying across from the dw-dp v11 thread, since not
everyone on this Cc list is on that one. Heiko reported that on his 4K
display he gets no output at all at the stock rate, and some output
after raising ACLK_VOP to 750 MHz, although that output is garbled:

  https://lore.kernel.org/all/20767137.geO5KgaWL5@diego/

So the starvation reproduces on hardware other than mine, which until
now I could not tell apart from a fault in my adapter. The garbling at
750 MHz is not something I see here - the picture was correct the
moment the write landed and stayed correct - so that looks like a
separate problem, and I have replied to him on that thread rather than
fold it into this one.

Igor

