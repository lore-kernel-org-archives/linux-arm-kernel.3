Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50657CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 21:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6w+/iSJRWut/D1sqx5dV3SWtkjaFwtBwoEXiJRSLQ+s=; b=sWbTlH4oNd3iWR
	SWSkvczG+fbPyef369JUoo1wpTy0jC5R6vDDLBthI8UW1ojLmeKUdRkyN/1VtMf0eW8x1Hz4sfg4V
	YYUlxspA41INF6LuD2fNbYxMGyyQmJdjMEouKmV86wsV/3DJhkO/yinPno934hago0U9oB79CX7QQ
	AHX+W1F0wz57JgQQAZDTjMXg8x3D53gsF7A8kM2WUThsDfYCu5emAgcpRxp7YZuFmLWzt/l/ebeDs
	nv+AhTrkZzcCGdJ2s46aoOsoIQSBdfOt6k0KY0wDFX8dbuKmtTw8k1Lq3s0TScXBgPZnIklyKWEwj
	rla7XzWTPfxHwfisuA1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRGFz-0000000FetJ-0Am7;
	Sun, 24 May 2026 21:21:11 +0000
Received: from mail-lf1-f45.google.com ([209.85.167.45])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRGFo-0000000FerN-26iF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 21:21:09 +0000
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a8cb92f26aso9734608e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 14:20:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779657658; x=1780262458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6w+/iSJRWut/D1sqx5dV3SWtkjaFwtBwoEXiJRSLQ+s=;
        b=tOmSyVFbg0E7q2Bxszi4qjVMSO22AhT4w5J2iyGjUABkRKKa/qTD9U+o1NYo0ogMYM
         zJKK/euGP5RzToAotDXy0k7Ph/AZ+7rtfa0KbHTE68zs7fiHjh/3QkP95iWfYqfvDdFV
         1YTLqjopXLsBCzFclOlMFrG87wsk0pD4parMbfjuaSt/GVXZ8pdbVMT+xIx/LrjtZq2W
         WzkTOr1PLf5/6p1m5/oWc3hO2TfEHz22NZsG872CDcTvGtHDuyXCFVa+63K2iXp7LpJe
         Ixmg4U/3xXGsI1JFB7eMHFLFG42gi5+YNf2EEs0/tuHUPbEdgI/XnfAgs+aqEPqxgiqH
         FF6g==
X-Forwarded-Encrypted: i=1; AFNElJ8ZQVaSw7X1blMjPJTFV5qDF9dLVWXfXhU9klgiDlGG2qyt6IbX1lmw5BaMWdBfhBbUMFF6IENckvrQbfJqqRKd@lists.infradead.org
X-Gm-Message-State: AOJu0YzdbY2+tmRHQbMeXP1e7hhcod5WNAUdTMQrf7X6ompgbdPLszPH
	RdlR01rGNnHmZZOMVvVYjBHkl7QzX4HaVjxk3qWCkraCqqnaM4vjSAuiFCaUv16DSuE=
X-Gm-Gg: Acq92OHTn9R5Xq1l/ro70IC0g7PmIiyakTusUjrecBOqhRoBFDvJnnDpAnlBwhAsX0q
	JW6IL6hLg8yjAx+/IgEufY6JP9tc6KDgTGImtD/7SQWFRyCJogSYvG/qF5mpHQ+txDXbmLCTa0R
	DQSGZBYxVZzIpVbvc1k1P0icGVxHu19zvgxfznxxYDINGLzNg6m52uOVsz42tuzqZJSoKiaSCZf
	8ZnKGCU6E/dKDim6WW09gk6e0fe565bpegq5eh0WU8y5qxNxeVWeSwfBA3g4bGpXdggD5b0ArP5
	3/CDUxfAGInP1SOCIo7YIU/VNVnNZde1tGnu/pCLcvM/W7lomfkQHIumekUNemKx/mp7AGX57o0
	thTLjGcH25IDaBX5hX/iH8RAjfMWsvN2lsFKRAl9mVgXRzb7GHfHcGIRKlTT7OUvEtgkIqkv6Yh
	me+sP1QzO5ALwQKf3IwGr8uBQ6Znr0ZOkQ9CqpruYCEsKE9hjU5wLt/m79XIYW+lQ7Ig==
X-Received: by 2002:a05:6512:3b28:b0:5a3:f2ed:87cd with SMTP id 2adb3069b0e04-5aa3239924dmr2972834e87.10.1779657657700;
        Sun, 24 May 2026 14:20:57 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cb36ddsm2216190e87.17.2026.05.24.14.20.57
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 14:20:57 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-393a49d2e5eso79437301fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 14:20:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ86bVJuvoIch6Dq6gKdvXYQlyajKAGkxBJzuIxcvhXsxgkcMAfgCXsldsU6FqQsRjSDhdEZIQSNN4GYp6l95K4y@lists.infradead.org
X-Received: by 2002:a2e:b8d3:0:b0:38e:4810:4f44 with SMTP id
 38308e7fff4ca-395d8bd88a8mr40151971fa.4.1779657657216; Sun, 24 May 2026
 14:20:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260509190015.79086-1-jernej.skrabec@siol.net>
 <20260509190015.79086-8-jernej.skrabec@siol.net> <20260514-valiant-ape-of-discourse-a4f5a9@quoll>
In-Reply-To: <20260514-valiant-ape-of-discourse-a4f5a9@quoll>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 25 May 2026 00:20:42 +0300
X-Gmail-Original-Message-ID: <CAGb2v64UvgqOPuZwayBmSUhQA1VwBBDpFn7ok0d7OVHjhzz=2Q@mail.gmail.com>
X-Gm-Features: AVHnY4LF9PZK6soJXHv0nl5iKDfqAVEgS-xhOR9JBN-5Ngh0yXQO9LbOCoc_jy0
Message-ID: <CAGb2v64UvgqOPuZwayBmSUhQA1VwBBDpFn7ok0d7OVHjhzz=2Q@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] dt-bindings: display: allwinner: Split H616 DE33
 layer reg space
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, samuel@sholland.org, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_142100_561901_E9FA3E43 
X-CRM114-Status: GOOD (  23.75  )
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

Hi,

On Thu, May 14, 2026 at 2:04=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Sat, May 09, 2026 at 09:00:14PM +0200, Jernej Skrabec wrote:
> > From: Jernej Skrabec <jernej.skrabec@gmail.com>
> >
> > As it turns out, current H616 DE33 binding was written based on
> > incomplete understanding of DE33 design. Namely, planes are shared
> > resource and not tied to specific mixer, which was the case for previou=
s
> > generations of Display Engine (DE3 and earlier).
> >
> > This means that current DE33 binding doesn't properly reflect HW and
> > using it would mean that second mixer (used for second display output)
> > can't be supported.
> >
> > Remove layer register space, which will be represented with additional
> > node, and replace it with phandle, which will point to that new, shared
> > node. That way, all mixers can share same layers.
> >
> > There is no user of this binding yet, so changes can be made safely,
> > without breaking any backward compatibility.
>
> There is user. git grep gives me:
> drivers/gpu/drm/sun4i/sun8i_mixer.c
>
> which means this is a released ABI. As I understood, the old code was

We held off on merging the DT changes so that we could rework this.
I can't find the actual request though. It was probably over IRC.

> working fine but just did not support all use cases. Why this cannot be
> kept backwards compatible?

AFAIK the "planes" block is shared between two display mixers. As the
commit message explains, this prevents using the second mixer, since
only one of them can claim and map the register space. And on the H700
(which is the same die as the H616 discussed here but with more exposed
interfaces), there could actually be a use case for the second mixer.

Hope that explains things.


ChenYu

