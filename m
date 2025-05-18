Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055F0C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 16:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R4350qFjP5pmMxVLhOYIwlVLJLk/mrj5F3+vFg2NAYI=; b=S+0fDFGenwy8au
	QaUAoeTLU0bGH30XzD/2yEWKZ+EsOKTrOWAOaTFcn9Nd2KiuhL2tiNB5gzXRNwNz7szNvzVsWT3Fx
	PY9jAK8ww994oKf5noa95UOm5CkSBsJs16FVbtdOtISec2WmOq3xHPNnB4VHveM42Ix/0tOpO/854
	6yvR3DJ8+9QQs4pItMYZGNR4//IBwqLRxgC4WF8ltStZXCavslLN18CPJ2X5ePxZYAydVXv4HHRok
	nc+XaVaxHGYD7FPI70/GPoOpLOPoov4NYaFpI/BG+HkY9eGiZC50RtNhqyGJp2f48mNFRBOKIw21p
	lvA+ojJhLbgfc8ZQ+ylg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGgvK-00000007Hl9-457V;
	Sun, 18 May 2025 16:31:38 +0000
Received: from mail-ed1-f41.google.com ([209.85.208.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGgtK-00000007Heu-2wOY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 May 2025 16:29:35 +0000
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-601609043cfso3321952a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 May 2025 09:29:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747585772; x=1748190572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R4350qFjP5pmMxVLhOYIwlVLJLk/mrj5F3+vFg2NAYI=;
        b=W16ZXDBkyt+NzMN3SBhxVkhkmO81eGukexVzr8Wqk7zHsnSsr7nHyVTJ8EUs/ShFWy
         t0MMycGZGMeW3qZoJZYjpXkRUBqtRYbRvSrLCn5PAbIVA3KN7rZ/0ApNEsMeDKecrG+3
         Oi9QXoxWaI9g4ntiPCA6W4Uj+usNPGjqlNDCdf3CMZ0xIyyoFsarHabCVsgMF8GFoKUP
         SX/Crwd/pZ9b35Q8luIeCfknK+NoMopqRZJLhu7Q/ekD7oDIT8qXJJv51epYwTLgHs6U
         ZvYu3L1OBHgDECFpsG754aesvpLA/MUw9ZmIuAzbkIkBhGEznF8qEur2FYxYoLtPvGrp
         Rc9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWAq+sIyHYLIwQ0TAB1oWIoc8bACu2e0y7E5zSJgCEyXyrl8N12g4YHkqiXo2fYE5is0ObRV471qaXILDc7oXEL@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4WSZeWufTQ+w/3WtlBoaGHQertmKT5eDbTteJIciE+JkwmsOz
	qLBjInoVd+dTp9kCvGIUE7KwimmNTUV3auQdzh85/zxXfKq4CrgjW6lE+C/dN6Q4fEE=
X-Gm-Gg: ASbGncumd7rpm6BtW5dB1tILgf/yeB/BPBicDcpleaRxiinhYAlZMVFziuwoOczAI9E
	m3i7aVzvc8trC2NbIb4JqIbmdfJAgk7WJX1LUGD7hJeYF91nXWeE4IWLcRJ+N27K+vqCQA95kEn
	9+ZxMugO99bEJ50AyNAR0S473j1LQ90Fx6Ef0v4OKYOuF5NaTqBD+6nhCYozaOgXrNZuQtCWNUk
	Esp809H7e8+B3B3XSYQagdoHvZmIIfeHgQM2FvW9HYXk961Gpbe0NlklHsw3UfydWjGMJkcOn2Z
	phNAtlMWhcMFoRRSdULSnVa3DW3F7E2jwOzuAuU7WmXloYdNgkmguxFfbSiWRl2lLzkU3RLkN2y
	Jc0Je
X-Google-Smtp-Source: AGHT+IFBs+h4Mquzo8iJbSUPaYW7VZZJce3qPeftJL11wVYMmxRylQshAXmFD6rAtHzICL+kOfYaZw==
X-Received: by 2002:a17:906:ef0c:b0:ad2:4817:6375 with SMTP id a640c23a62f3a-ad52d4b2e28mr715323366b.15.1747585771679;
        Sun, 18 May 2025 09:29:31 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d437585sm457439766b.115.2025.05.18.09.29.31
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 09:29:31 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a3683d8314so935431f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 May 2025 09:29:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQd9QdBMrSswZPGA/yCRPYGACX9xuh/7EUkMn0dthaYEglbovtr5dgZp2cBBsyH1V04+YSgP5iUZFtAhiUSPFJ@lists.infradead.org
X-Received: by 2002:a2e:8a9c:0:b0:30d:7c85:14f5 with SMTP id
 38308e7fff4ca-328077a2e48mr31714831fa.25.1747585276327; Sun, 18 May 2025
 09:21:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250516105101.11650-1-ryan@testtoast.com> <20250516105101.11650-2-ryan@testtoast.com>
In-Reply-To: <20250516105101.11650-2-ryan@testtoast.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 May 2025 00:21:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v67rSp-ap+QkBX=gATfaxDWbBM0aMn_kjNUP10giLKFaHQ@mail.gmail.com>
X-Gm-Features: AX0GCFuJznDa_ICl2sGWtQLsZH04UWSn1aHqHteb8YSDT7ZfJxBtky01EaefvaI
Message-ID: <CAGb2v67rSp-ap+QkBX=gATfaxDWbBM0aMn_kjNUP10giLKFaHQ@mail.gmail.com>
Subject: Re: [PATCH v11 1/8] drm: sun4i: de2/de3: add mixer version enum
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
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_092934_732561_8CBA769B 
X-CRM114-Status: GOOD (  10.29  )
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

On Fri, May 16, 2025 at 6:51=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> The Allwinner DE2 and DE3 display engine mixers are currently identified
> by a simple boolean flag. This will not scale to support additional DE
> variants.
>
> Convert the boolean flag to an enum.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

