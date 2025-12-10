Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49424D3C92F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 16:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kBtYSJJTly1m/YQDIhV4i8gYEOktE3RA8uKT8B/CUWk=; b=LQQEkL1IvpZnz+QLzr47/Z3a/3
	nk1ABLALfUytor+klWXBtwf6ZA90Zd84NR9K+AVxBsUOBmNmZFnyE7ENsl3Z6UMiagE8/2c5tMtYR
	oR0IwiBkPf5bLGfCupSP3bVAaBV40cjgt8HQDbw/H24v03zHYXyYgIXDWxrxAIC/j82mHlxA+72al
	cRWqM6wj3xRSYmXbetOpMi4QebmppJUathW2nSF7ZezqNntCLndsQQMSNsL6+QiIisc+qVl2uKdDB
	2UZmVj9YlZp35f0BOs08yzCrmzqr3lsocEBnIha56zcPfquLI5PJpQEjdgW76L5oq4oYidsO8SL/n
	PGsyeCbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTNEB-0000000Fehd-16vl;
	Wed, 10 Dec 2025 16:39:47 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTNE8-0000000Fegx-1qVb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 16:39:45 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-78c686aa4f9so12641887b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 08:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1765384783; x=1765989583; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBtYSJJTly1m/YQDIhV4i8gYEOktE3RA8uKT8B/CUWk=;
        b=ttr+WJsBCPm1iVghy9pNUp5zinWklNwERJJmpGjf3eoiip5toPm4l3DpPAi2ob9mNF
         6SjfHPlsVFMofQZojV0H/pQgfNnJsFemPB32igoAQehCR5ZdtrX67wIs0u8jP2cvmh4P
         V5fAKMcaQ+aEnLLIbP1ilMPe4rdb9xeBI07sfvyfDjpUR2DZ9wN7Pg86Ye3NPAaQDaWh
         ws6WwBNrG65SA2lCGfWu8TMXwrt6qhNOL3JL4SpvrBnXxPkl1/xay9uPmEVH2Bg6RSZb
         9CgBXHd0kJBze6V3goZhNDTVeaxfv7S38La+xvqrFslbTq1wmbu+xicMobp3X2Bgo4t6
         FcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765384783; x=1765989583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kBtYSJJTly1m/YQDIhV4i8gYEOktE3RA8uKT8B/CUWk=;
        b=HYo9MYVLZYK0oEquYZF1xQ3TtdC7KwPGtn/NhskbbjwC+vmMm3/h1HKlP4MULpqwrN
         pAwtfyG67dEHOaZsJ2juJh1n3Zha50DYg4rf9LGyJil5dqbxxf5CgygvXgA3zFnB/CaC
         u1QXcKlhrX5Vy+gASB23CLVF7jl6HOrFZWlN6VSJgoTJrWMO61a8t0ZOR6niQJbcNVBn
         EhwUG/GU/u/abDIVGZanrDr6XR5Tp8ECDXFtt5NHwAvjNwy5caV2ly+mCOTYi2m91ppR
         WywqvG51B3ys/dwyZ+tAFjIHZfVWvx+4rKqUWMocEGvkpHkpx9s70LjCgLCZOORsj+/L
         GXkA==
X-Forwarded-Encrypted: i=1; AJvYcCVgp3cYva7iiLMZsWRec7FY4eeAVT+zph9ZuLk8vKp2AdbhHbidFpKJ2YkRX+63NXs/pTvJcJI7F7uT94R/uI6s@lists.infradead.org
X-Gm-Message-State: AOJu0YzgaQryszMT0HYTgG8SmydCUdq1j3J0ADFEN5nvbe4XuH1vU+pV
	tOgs0QbWcoAfxdW2dZy+ROGNnYWKQ9z9AqXSm6SLpOtrZL1FDMhlVEaTIeX1iqiWOurAQoFtlJO
	RE0Ty/A8=
X-Gm-Gg: AY/fxX6B3BcIRCvEIj0Y12ui3sDBp+yswAfoSJ1luYASy51js0F7Q6Qvk2YE6bnhhos
	XKQ6eKEEuYYruhc0+yIkdveOfw6dNrQBl33rJEsi1EAozA6srOc4JdfP19MxED79rl2hJIE4cj0
	UW8ASKKuoyaW8/Fc9hhYO1eTtBQHj7D+NSjrk1sasI/+K5PS/k6Bvb1UNLWxegaF1a+jFpYXhnA
	0Dy0suNlw5Gbii2Rd1qs1RWE7spWHW+2l9ESblxEqWbnL15W+3Jvos3rzVJ/0Zjgr9NOgYYSXl7
	/EV/nU6vbydyCGBUoZ5IuLTipdr5FcS1ve/UMH6GZSJskb7M+aVq1sGC6EGkZ4gbO1YhF6va7T2
	/rrbe0Er9kdxyaG95DcbR1ncHDm7LCVPeF/Uo0wQD6kXH/VhjxKCX4S9sR6w2Gysmee620ZWvT+
	Dy69YW9zOhhfvgUN7RpkKuqeQT+wDqDGLaoZdw2TLiGj6PlfHgPDvZiw==
X-Google-Smtp-Source: AGHT+IHhbGzEqJaUrKYMscRg7qGIwItpnx9gVvQQIumXWiAUE24Ijxx+bnlgNDNb+aTXYGqzl1cNMw==
X-Received: by 2002:a05:690c:6c10:b0:78c:25fa:1bc4 with SMTP id 00721157ae682-78c9d7a616dmr22276017b3.61.1765384782905;
        Wed, 10 Dec 2025 08:39:42 -0800 (PST)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78d69c38edfsm551527b3.2.2025.12.10.08.39.41
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 08:39:41 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-78a76afeff6so261587b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 08:39:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV3JkK7f+Fa/CwjvVJ8NGDkSx96nQTEAu+/gnYvh1nZsxzvQwqAcp6Pt8KANwH4IzlbrAnlF/y0N/CX4tfpMt5z@lists.infradead.org
X-Received: by 2002:a05:690c:c96:b0:78c:69ce:c430 with SMTP id
 00721157ae682-78c95a7eaa9mr26279177b3.21.1765384781143; Wed, 10 Dec 2025
 08:39:41 -0800 (PST)
MIME-Version: 1.0
References: <0b20d760-ad4f-41c0-b733-39db10d6cc41@cherry.de>
 <77685900-2c34-49b8-8c7e-14718841ef17@rock-chips.com> <fa82d11f-ce11-4feb-bdb4-c31d360a2a62@rock-chips.com>
 <CAAObsKDYLXVf1GdYUNeaOya+pWD4jTOEf55ouXAL9iM_kWCcMw@mail.gmail.com>
 <75166475-d6a8-45b8-8092-f31d292d4206@rock-chips.com> <CAAObsKABYQnw9rUfxwTS-yiQSoH9rdxZ_ffUBtp2H3tMJqMb7w@mail.gmail.com>
 <e7b2ceaf-1fbd-4f02-9d75-be4feab724e3@rock-chips.com>
In-Reply-To: <e7b2ceaf-1fbd-4f02-9d75-be4feab724e3@rock-chips.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 10 Dec 2025 17:39:29 +0100
X-Gmail-Original-Message-ID: <CAAObsKBneQrciukH-eZ8qY92n1YxRFChpXV9s6G8oQP5jSMwRA@mail.gmail.com>
X-Gm-Features: AQt7F2oK_djIXTar93u9OLGWZFan2i2Sh0qJcTz592dnEpaCY5mBXS6eJB6vw2E
Message-ID: <CAAObsKBneQrciukH-eZ8qY92n1YxRFChpXV9s6G8oQP5jSMwRA@mail.gmail.com>
Subject: Re: Issues with DRM_ACCEL_ROCKET (Oops, power-domain, probe-ordering)
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Heiko Stuebner <heiko@sntech.de>, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_083944_500739_BACED326 
X-CRM114-Status: GOOD (  23.87  )
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

On Wed, Dec 10, 2025 at 11:47=E2=80=AFAM Chaoyi Chen <chaoyi.chen@rock-chip=
s.com> wrote:
>
> Hello Tomeu,
>
> On 12/10/2025 2:50 PM, Tomeu Vizoso wrote:
> > On Tue, Dec 9, 2025 at 10:31=E2=80=AFAM Chaoyi Chen <chaoyi.chen@rock-c=
hips.com> wrote:
> >>
> >> Hello Tomeu,
> >>
> >> On 12/9/2025 2:55 PM, Tomeu Vizoso wrote:
> >>> On Tue, Dec 2, 2025 at 8:00=E2=80=AFAM Chaoyi Chen <chaoyi.chen@rock-=
chips.com> wrote:
> >>
> >> [...]
> >>
> >>>
> >>> This need was questioned during the review process, and during my
> >>> stress testing I didn't find a need for core 0 to be treated
> >>> specially. So it was considered unneeded complexity and the code was
> >>> dropped.
> >>>
> >>
> >> Oh, I just noticed that the commit comment in the devicetree still
> >> contains a relevant description.
> >>
> >>> My testing involves running the supported models as a whole, and also
> >>> their individual operations as individual tests. I run them in 8
> >>> parallel processes, in batches so we have continuous bring up and dow=
n
> >>> of clients.
> >>>
> >>> I'm a bit surprised that that testing worked stably but we have still
> >>> failures in some setups.
> >>
> >> Could you please describe the failures that still exist? Thank you.
> >
> > I was referring to the ones that Quentin reported when starting this th=
read.
> >
>
> I believe this pmdomain patch can alleviate some of the problems [0].
>
> However, the problem Quentin mentioned still exists. For example, if
> there is an invalid device on core0, while core1 and core2 are valid,
> accessing the relevant data on core0 will cause problems. Quentin's
> patch can fix this, but he doesn't seem to have time for it lately...

Has anybody reproduced this problem with the pmdomain fix applied?

Thanks,

Tomeu

> [0] https://lore.kernel.org/all/20251205064739.20270-1-rmxpzlb@gmail.com/
>
> > Regards,
> >
> > Tomeu
> >
> >
>
> --
> Best,
> Chaoyi

