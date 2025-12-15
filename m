Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4B9D5B85E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 17:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8aCiihqyfBhDBvKtwXzCvq/yRXu9gmrOv+bogwSRfMI=; b=NxbjLCj+F6uLq3/LmR70IX/DU9
	IDLezKlHOH20IVf5lEZ6vmfu8XnA9cfOHC85PMHgimvZzB+bBl07JkAmhX+eAvgXlkcNGRHRxxZxV
	z1rGVCBJN17Q9MURmgoUGrAkopFwCb1UhY+yP0XyPFCSYVk1DY3N9XO6MHFOkR3pC/KzaNoUQO6EF
	dhAK4ouWNRlKhyTVDA5Oz8+uUoB7xRAzwfWCy7V0e4mcFGSHL79P3pGu4rMK0wcRq1EbmLIuu+vPS
	DRvLEfafLLnwQue7RSasefFNrzaRi6kEkZTwvVovOhmK66yQM0sQ21LAGILl7b81RVQ/AtX6daM9Z
	ckdXF9yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVCnD-000000045r0-3QaU;
	Mon, 15 Dec 2025 17:55:31 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVCn9-000000045pu-36yO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 17:55:30 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4ee1fca7a16so29513591cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 09:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1765821324; x=1766426124; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8aCiihqyfBhDBvKtwXzCvq/yRXu9gmrOv+bogwSRfMI=;
        b=fIP3npMMtfICRTATFHQp8z+8eoqsGvxjMOluD5ghgdnc/0tLXvCmMEPBxF8jtpA2o3
         OMA8OEpjVrYDNIP9rlvCwkDyoic8iHxnl7yMu5yC8qK/qJTUBvVYoS8+wo3CjSc4sNcb
         G53aCAgIws73x4DC7281bM3xbroi72mHQw+20ysHmjxXCSb8bSfQ8tscjStvFhlnsaDh
         7/yYmcdIXshcQqjzu9kriBplNNGZw/WpPYfafqxM3ynnDAsnJj1t+SD7kFE3842xw2s5
         5sPG2A8VhHy5V+8CbQPyrswxm/3K9jSLgbnBsFquLZRHuopz4GS4nqJgQciPFWHm3hWT
         EVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765821324; x=1766426124;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8aCiihqyfBhDBvKtwXzCvq/yRXu9gmrOv+bogwSRfMI=;
        b=t9tltSGJGzKagzoHv1F678kE/JkbIjb0QQMBIVRLUorQXhgIsrVuBejsNYjDfuCqZE
         i5IMW0FDv8H7NEVCzRYA+ym9C2KdZIhFkcDOTAi12ebOLIA40dluF3ZGfRXiUnOVQoOQ
         beJkM8l9qiafDQYeKrRolP7vmuXD2iao3BCTrtz9dEN9c0ZkowPPjN89UQ6CM5vHENCp
         bPK7R6jt7YsJDPgXltiGGaVuBVWhPqnKz+SiB1DjOMctdrR1uxaNW/Dq+1makRJY/RW9
         vcFx9SBeJRihw7bPiexKXA8InFx5n4uzOFikWvFSZvkwEh50ilhCGcjLaOmif5K/cYOZ
         jHEw==
X-Forwarded-Encrypted: i=1; AJvYcCWsFBNSmUN8I3QtBXdu0pdXoXLAMBHOb4us2WVAqOEl+DBX4gmQCAqm74aOSg7mrW/HZQl4M6/6Q72sAtX6cfgC@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ5jf//4miz744qcvc0ab4NBw7x+XmKPwKP8TT39fMWDdsKzsU
	PLPIQCWivk/lmOwJ7adm5lOrdi9t8Fm3RO6X3aNh1oIueFV6yepCGFN5KGp6YaQiym27TIi5O8C
	g7lUnxF3XjbA4zcswsMLkhL4WMo6eVs6M1J2ayLzGPA==
X-Gm-Gg: AY/fxX5IT0SFzAS3FSBJvrahJjKgqcVwRnammwpR5YJ4/pVY8oaqn0vT4MuazLafwzz
	auSuBJgMqsUi9by20oEl6MmnasXoyCCENRbAY18LlIAotuoP1YEPFuB3V4PDkViihMxx5V3FSpu
	FwR458alNOb5c6saS5MgKchC/m6lrOGUxEo3Z8uAj1BFEuIJAolnqW5AhvHTwFCExBBIPihojm3
	ny3IDqbjSkKKZ3sztNaqXu0zYv22OMw1oltkjDenCAjna8TyK2YDjNkpUJiGFmQwFzpMOw=
X-Google-Smtp-Source: AGHT+IEquHwQ+urOMR2ohVWjSdQ8ANcymdBrTg3QcyuKio1k3FljEQrqH2T2Tn3/APITsfhyN5lzUFG1dY78glwUVow=
X-Received: by 2002:a05:622a:1e96:b0:4ee:12e0:f071 with SMTP id
 d75a77b69052e-4f1d04a585cmr184413841cf.20.1765821324595; Mon, 15 Dec 2025
 09:55:24 -0800 (PST)
MIME-Version: 1.0
References: <20251211-vop2-atomic-fixups-v4-0-5d50eda26bf8@collabora.com>
 <20251211-vop2-atomic-fixups-v4-1-5d50eda26bf8@collabora.com>
 <20251211223822.6eeabb4d@pumpkin> <14738785.uLZWGnKmhe@workhorse>
In-Reply-To: <14738785.uLZWGnKmhe@workhorse>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 15 Dec 2025 17:55:13 +0000
X-Gm-Features: AQt7F2oTFN8HvvMalRt84ZK6fte07GmPQ77VoQFhH6nEJYL6l1qYY_efw-Mj3bQ
Message-ID: <CAPj87rMeJWLm9J=7kMrEvbpzVOMiQc-TThSNE-Gfac7nhUB3bw@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] drm/rockchip: vop2: Switch impossible format
 conditional to WARN_ON
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: David Laight <david.laight.linux@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Chaoyi Chen <chaoyi.chen@rock-chips.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_095527_958567_C92952F5 
X-CRM114-Status: GOOD (  18.43  )
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

On Fri, 12 Dec 2025 at 12:46, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
> On Thursday, 11 December 2025 23:38:22 Central European Standard Time David Laight wrote:
> > Except that all the systems with PANIC_ON_WARN set will panic.
> > I believe that is somewhere over 90% of systems.
>
> I also like making up statistics. Warning here is the correct move
> in my opinion because this warning being triggered indicates a bug
> in the kernel code, and with PANIC_ON_WARN the user explicitly says
> they would rather panic in such a case than treat it as an abnormal
> condition that is recoverable.
>
> The reason why this condition ever occurring should be treated as an
> abnormal condition is because the DRM subsystem should guarantee we
> don't get a framebuffer of a format we didn't explicitly declare
> support for in the first place. So this condition being hit either
> means drm_universal_plane_init is broken, or the array of formats
> that's passed to it is out of sync with the conversion code, which
> is also a bug. Or someone managed to thoroughly hose DRM's internal
> kernel-side data structures, which is precisely the kind of thing
> PANIC_ON_WARN users want to abort for.

Yes, that's exactly it. We make all kinds of load-bearing assumptions
everywhere: that PM code won't pass in a NULL struct device pointer to
the resume handler, that our driver callbacks won't get called whilst
the device is runtime-suspended, etc. We could try to handle every
single one of those with if (clk == NULL) return 0; /* ??? */, or we
could not.

If you'd like, we could just delete every one of these checks and
replace them with comments, explaining what we assume the invariants
to be, and wait for an OOPS due to dereferencing invalid pointers. But
the MISRA style of 'handling' every possible impossible case is not
tractable.

Cheers,
Daniel

