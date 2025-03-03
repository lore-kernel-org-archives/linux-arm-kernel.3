Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48BF6C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 16:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VH1ACupLvAJdNlA5THBalJEs0SiV1YT5szGP401I0g4=; b=k4L4LEeQBmW+IthV81P51OvY5X
	NxyTeEDz6yh5qxTM1yJh81rqBYTspwYxSDKJLw2y3xA3kNhoSSNRnTtTJl7dKi/5mil2IBFVn+Koe
	Fy8q4t0gDZSmabv0EDl9qt7jkzvy7Goi/gRAPVg8WDIz1AxNzEIium1ZhcMg6XVGQs6rYn9gplwv2
	SRUHeopVnF2BXYDuw5wcZDzepvp8wvLFIPHzJYw88t8beJW/oa9ybsU+vIui88ZYmHfBxh5grHZqO
	3BIZr4gXx9rp/lyoHG9bhZbBwsVLZl4L1tTWH/LuKhTCKn9VbWPcTEyu49EMg1bR6kPw4hRY7Id5L
	ihg9tdKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp8ov-00000001ZGP-1Xd8;
	Mon, 03 Mar 2025 16:39:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp8nL-00000001Yx0-2YE5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 16:37:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 02D285C5A53
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Mar 2025 16:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84305C4CED6
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Mar 2025 16:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741019850;
	bh=2xP1VNckQ2vULtbhOREqEVD3q8xkOcQG3iR8jMeveYc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JzugNjmB6+Sf/dusRt5fDnVooJlQ0gk4B4/Kjro31zYbH+GW18PBym7it18/y/woV
	 r5nKxsE3oayZkZ+4y1h0yhEX5KPXRPgdG/GVdMkPO6WVPDncCTsYExSKrEfNKatads
	 GFTJzo1CJPASgZpQWfwXzN1zjI1xh0JYYkWIS+hFYKgB5trllvAbt8Uu7VeBUYEPD1
	 paOuY0ay34eXjk/MjcUqv0ybymhfdiUM1r3kVlSP2DHuHUtkgVkl9antvRft7yjrIT
	 baCzkHvDUGppLEuhrM0TQwfUpjxJWTGOA8NNWXo6/LQ2+Cqd2tU6nDjIoR0m5DExKV
	 2DLBGdJqqlQVg==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e52c1c3599so2934916a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 08:37:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV8it1WcZG0Nvuwx/6BABJ7lPPND0SxbySjYOZPh7cEgQdBIEYM/1xAqu6kxr8OqHFUqcAgoxuQW7aM6u/k6YYC@lists.infradead.org
X-Gm-Message-State: AOJu0YwvxPEMA3E6LRePK0ohlKVUkffhcqgC7tHvWqWdCfIG2L4X8IQ/
	1hkKBtpLmkuMlBouDPzEEhLRl6mbldJ9BvwEY7mxMo6HYdcYJ3LS9lcQ92QYgFnmODCJDQAA076
	KzNeGkhq46NfgULLRn+KGWVbtVA==
X-Google-Smtp-Source: AGHT+IHUsZAUSMpJRbmPIa6fiiDfbENTCpBzluX0zXK2ogy8xG9qRfPLy2SEI9L4RS00s4IFwPqdkKyO7j94lM74OL0=
X-Received: by 2002:a17:907:7f1f:b0:ac1:dde7:a80b with SMTP id
 a640c23a62f3a-ac1dde7ab19mr235932466b.43.1741019848769; Mon, 03 Mar 2025
 08:37:28 -0800 (PST)
MIME-Version: 1.0
References: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com> <174047913824.2131221.6545389561298332217.b4-ty@linaro.org>
 <CAA8EJpqM8ZQ-ScEtEBXaUF2Nargtp_TBAyMYvbJ49PGbwPWjaQ@mail.gmail.com> <2d51cb9e-b8c5-4cf1-bd7a-751fb633275c@linaro.org>
In-Reply-To: <2d51cb9e-b8c5-4cf1-bd7a-751fb633275c@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 3 Mar 2025 10:37:16 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKXguOAK2pge-TwH4M8JC3UnEi_ia_7QjrgE_6KZzGucg@mail.gmail.com>
X-Gm-Features: AQ5f1JqXNkmMvtXvWaBKtRXTZitqf2vltXXW5gy5b2hrxmHRwoqFlvx_mv3N5EI
Message-ID: <CAL_JsqKXguOAK2pge-TwH4M8JC3UnEi_ia_7QjrgE_6KZzGucg@mail.gmail.com>
Subject: Re: (subset) [PATCH v7 0/5] Driver for pre-DCP apple display controller.
To: neil.armstrong@linaro.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	Janne Grunau <j@jannau.net>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alyssa Ross <hi@alyssa.is>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Neal Gompa <neal@gompa.dev>, Nick Chan <towinchenmi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_083731_756314_594A904A 
X-CRM114-Status: GOOD (  15.79  )
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

On Tue, Feb 25, 2025 at 11:59=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> On 25/02/2025 12:37, Dmitry Baryshkov wrote:
> > On Tue, 25 Feb 2025 at 12:25, Neil Armstrong <neil.armstrong@linaro.org=
> wrote:
> >>
> >> Hi,
> >>
> >> On Mon, 17 Feb 2025 12:39:30 +0100, Sasha Finkelstein wrote:
> >>> This patch series adds support for a secondary display controller
> >>> present on Apple M1/M2 chips and used to drive the display of the
> >>> "touchbar" touch panel present on those.
> >>>
> >>>
> >>
> >> Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git =
(drm-misc-next)
> >>
> >> [3/5] drm: panel: Add a panel driver for the Summit display
> >>        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/4011594=
7b59f2ca361a47615304dff0a2b69a2b4
> >
> > Without the bindings?!
> >
>
> Bindings will be funneled with the rest of the ADP driver, the panel driv=
er can be applied individually.

Uh, no. The bindings go with the user. Now 'make dt_compatible_check'
reports apple,summit is not documented.

Rob

