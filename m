Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2361EC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 16:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=16lKLKeXiKEhT1aqzPTlfh1MfJCWJqXdbVQD33iMWeM=; b=ln7iq4rmd85tCT
	XTk9vVYaueA/Oczu6ohOLKCDsLLLwdcZTh1QxO71gtbKkz/1AEsEiDzs4aRq05rzRJTBMW1DjfcI9
	PwUurPPf7tqCQe3an/Dukqk4PRkxwlgvbfn0GixGTQLPkTiR3Om+j5W6HJufBnBvAhKD5kHQc1f6i
	BeeIgDgL60/x3PZuUrI0M84KylOpzwVzEaKW4KkEONHY2wXnKLmecUHbtGVFyx/s+TLWnTZCcWw3C
	ELNMYmr+0ZZUbHLedSZtlnNRM65EUZyFRdVUzUGX2iaTz8UlCWZXqyWeJPnOhHWYNdm2wNiqGO3j9
	uc06rVw68E55BLeGUvpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGhEB-00000007JEW-0SQ4;
	Sun, 18 May 2025 16:51:07 +0000
Received: from mail-il1-f181.google.com ([209.85.166.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGh8n-00000007If8-0a6I
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 May 2025 16:45:34 +0000
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3db8356ee37so10497125ab.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 May 2025 09:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747586728; x=1748191528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=16lKLKeXiKEhT1aqzPTlfh1MfJCWJqXdbVQD33iMWeM=;
        b=hzv29qQf37oZTaAYNk13TLVYuxsZZ+De3KDaiZ8vvmOvw04qNRVFsOJMNk782Bu0YI
         d5Q7kO3+TdV8jvNlvvWKi3tl7c9WusqTh2/Szb6VenlwtLOUsFRe5uT7fi0F+khFttHh
         ujiBn//C26LWl5xcO9X0KdCQKb8f69jxSD+vazpkq3me4Js9QXOqGfokiZZwGbJB7o74
         fK4sQ99Zd25GRXVwS5P+B67m96LCnHx3OmV4iCgKWTd0AbNrGvWTmBtN02mNOBDZHLHA
         d8uDqu0qH1HtEHfB+8QTKcuKOeR6XvJvgYp1zy0R5R2OiEi9qmt6Dc46BAmGK9yVxuMn
         jSbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQeHXwVeLCbB/hvrydfx0XBV9fAVSdgsSzBvorEbWmeZuwY4JyI8th4N06ArrnrpRnI26NvL9zmZwVoWqC89Xi@lists.infradead.org
X-Gm-Message-State: AOJu0YxkppjwwqaPSRWYpby0ht2RGypoYJ7qj0lZTa7gmrMPQABZlDmc
	jIxeWX8omaZtz3y6klHpHsPZTBWZ8bEQKwpCzhAMGI7sd6LmtuuSctw8Nf1jP3ktJDA=
X-Gm-Gg: ASbGnctMeudKzk7JZoheYBhzt6LNj1+WwdTdqt/xmEaipOHdLKttCWGC72BOpnjqzEY
	gMe+WHO/gls42Bn5SJQjYbC1JmkUXqjSuSnOO4yoWSgWTp/qA+TtA+kXkXZ4sAILomCC1i3cti2
	ntaBrw1BVcIpEr4dVo/CiN2j9yUFJ0H6fha5beZ9KAyX7SA7nqSxVTG7F9YAlPLQY2VRbqNpGWe
	GFloZObl1QXRp5E4Cl2eHbz8X6JxevpCRf3+ujSIe80VlbI4y+TV9UIQA5Rx3t9dEXUWsT5MY96
	CQZbd8LYm5f3QzjSPSG6VLXLXbM6LAJP70t6QWLoPg0TOWFV+bo3DM8u9gorfs45cyIgB5C9Cwo
	KqM2WhGn5ih7JXOck868=
X-Google-Smtp-Source: AGHT+IFhd72atBkFZhB8X02NmcSbUsgl2lYYQ0xb9tGlIadYtUOPgfev/0/9Q3y9Ma/ZK9X3X4dxqA==
X-Received: by 2002:a05:6e02:2144:b0:3d3:f27a:9101 with SMTP id e9e14a558f8ab-3db85722413mr95064405ab.1.1747586727974;
        Sun, 18 May 2025 09:45:27 -0700 (PDT)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com. [209.85.166.174])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dc61e15b2csm6870345ab.58.2025.05.18.09.45.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 09:45:26 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3d817bc6eb0so22474435ab.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 May 2025 09:45:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVTushAbrxJbfDEKJ0dUoLTToTTYHuUzsWh6eW0J6fekxHw0ePWDbOlUSzToAFIubnRvNKgO2bo/eXw5eCP3z0+@lists.infradead.org
X-Received: by 2002:a05:6e02:351d:b0:3d0:47cf:869c with SMTP id
 e9e14a558f8ab-3db857b6555mr99202655ab.19.1747586726194; Sun, 18 May 2025
 09:45:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250516105101.11650-1-ryan@testtoast.com> <20250516105101.11650-7-ryan@testtoast.com>
In-Reply-To: <20250516105101.11650-7-ryan@testtoast.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 May 2025 00:45:12 +0800
X-Gmail-Original-Message-ID: <CAGb2v65S2B2tatzJP3fJKcEYaoX-UGG2MtQX1VbUoTK4xTsyxg@mail.gmail.com>
X-Gm-Features: AX0GCFslyTJW3_SklNq3JULGeTuerD-gifQjm7kfUwjIWTbHbiDIUF58cpuqmoU
Message-ID: <CAGb2v65S2B2tatzJP3fJKcEYaoX-UGG2MtQX1VbUoTK4xTsyxg@mail.gmail.com>
Subject: Re: [PATCH v11 6/8] drm: sun4i: de33: mixer: add Display Engine 3.3
 (DE33) support
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>, 
	Hironori KIKUCHI <kikuchan98@gmail.com>, Philippe Simons <simons.philippe@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	Chris Morgan <macromorgan@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_094533_175880_F705B024 
X-CRM114-Status: GOOD (  16.91  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, May 16, 2025 at 6:52=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> The DE33 is a newer version of the Allwinner Display Engine IP block,
> found in the H616, H618, H700 and T507 SoCs. DE2 and DE3 are already
> supported by the mainline driver.
>
> Notable features (from the H616 datasheet and implemented):
> - 4096 x 2048 (4K) output support
>
> Other features (implemented but not in this patchset):
> - AFBC ARM Frame Buffer Compression support
> - YUV pipeline support
>
> The DE2 and DE3 engines have a blender register range within the
> mixer engine register map, whereas the DE33 separates this out into
> a separate display group, and adds a top register map.
>
> The DE33 also appears to remove the global double buffer control
> register, present in the DE2 and DE3.
>
> Extend the mixer to support the DE33.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

Code looks OK, though I have not tried to check the register offsets.

