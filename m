Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A10C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 12:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8WWWgeWVvcbHTtv0RBP4r1XUoDGKd++Wm/OvMpeSFds=; b=QLTRZwLMT+pwmcuXPQOGwBdMHt
	ZxXRidlCS1HlW5HlterexV1sGRl7v9XnDjjjyjfliQxRGEZNDRqjfSj6JYByirJ6DSbfBSDBmBvla
	oQFHAgDhvA1G6y2KpSfF+oJbo6V+Re2F3x/0PrKxQBDZYXSRnSRqWvdXzlh+4QRdidVBrUfIDzk2S
	lxu4x34+yMptQ6Xw0FOmpMGN/MzCOGEBH5Pk4o8xMGgkdvDVH6iBaO9Ez0gUWY4CuL3a9Pgl6F+LS
	48R3JIaOyqUJDwDHeEc0/YZnwTk6rzcYOMwpXm2ohRpuLu2blk1g9mb2yXBhURohctY1WANU2dbYA
	yGI3vPSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESRJ-00000009PQ3-1lBC;
	Mon, 12 May 2025 12:39:25 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERvy-00000009LDq-3Txp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 12:07:03 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so5255813e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 05:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747051621; x=1747656421; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8WWWgeWVvcbHTtv0RBP4r1XUoDGKd++Wm/OvMpeSFds=;
        b=hXYJioO7lpwsuDsU2TvGHnct5jGwR9om1qW8dok+/ZNA1wflmQfI2sk8AwHpR47U0V
         YiJb22n3je78PKTfdN3ebTpuZVYpK9Dry+MIqyY2guOpBe3QlZDV/FHhuZCmeRaHsZz4
         OXwDgGo4//sD+R8ILaoHp+Ck0cdU9AOnHqoryqr+Tm4hzQNsczV4T3+q0GMugw+LyyAt
         SOhkE8765QGqN9WJ8xhcp39DJxlrLusClrW5ODo1+Q3afriLqhivuxgrQIFADBue63ok
         HEajQxJj/r2U6M+aF7lUTvIEUkROSvNbX3FntIPQf5xi/lKfVel3+1l/n9SlZrhAVSNR
         9NFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747051621; x=1747656421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8WWWgeWVvcbHTtv0RBP4r1XUoDGKd++Wm/OvMpeSFds=;
        b=HBPJGvpkf6pkx5lkpTuztRyzt1m8oCV1ttun+/+Hy1NOhOPHWH6t57vVgSGwElzxF9
         1cyFaiSvZA++diW2I9Ht4f9ZXuYV8+CJC8Zl17q0Cws+ePoQanGRw0HC+9hY+KPTwO7V
         ENPPGShNgSksl4eAuOBseb+XCuKdYRGPCXuvisdV31ZKqRQ6YnEioRs3dYX3yxh1of81
         wrPrkHgy/QI55uK0Jgx36vCJSrV103PtDTRcbkRYdjh2zaeACzy7s462bLBYRI+ykX4r
         HoLw2S6uu10+lTqTyuqnDC5BvYfbJvWH+0iTh+tgHZYATctNeqnO6HFV/ws5Fue0fGu0
         s4Ow==
X-Forwarded-Encrypted: i=1; AJvYcCWU88YGxpCS97MHXzAkJxXGEIntNN8C1ghnxSevn41rJY09Cf7poN8KXrjw/U42o5fCCbDRlJE8DmDxszDKGyB6@lists.infradead.org
X-Gm-Message-State: AOJu0YwAQ66VyxmPUWgL+Vi/V55a8zwR4s79RfYQVnNdmcSquGtnV/4N
	1s/jjXURXWSaM+D6TgZWeZ+2nr2qgDH4DIeC2CcNLeqnQuIqdCArZoU7nOCY9roqalO8p1PGe0x
	Octngbnfbna8NGsffuWG1AcRQT6BU0oKvYDN3SagCSpV8JcM8
X-Gm-Gg: ASbGnctHM7fB+HlJvkayhOkmGho15YtJNWwerT8YHbuCsvIjPWMJ98n96P6dMq/bCRk
	RW+kxpParHF+XMFc40cs5ldkSW2apMXL1H+Vu1T9Sraew7tqHsk9Q02safzPz2vvVSP2BadsrhJ
	tKGEzxnC5LTphvJxd2793O/lUW2Isurcfh
X-Google-Smtp-Source: AGHT+IEx8k4So5xIBQnsOvPLJlE1JiI/knZvAo1IR6NtL1z/XpXpp8RjehZWw4mU/3r3Q3kmxi4fVz2sQoxO2BBk9mc=
X-Received: by 2002:a05:6512:6602:b0:549:38eb:d694 with SMTP id
 2adb3069b0e04-54fc67c477emr3402667e87.26.1747051621225; Mon, 12 May 2025
 05:07:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250406-bcmbca-peripherals-arm-v2-0-22130836c2ed@linaro.org>
 <dc47e9ba-e23d-45d2-bae1-cac8bac2310b@broadcom.com> <ac86467d6f0b2c531f7d1356ade78e17@mail.gmail.com>
In-Reply-To: <ac86467d6f0b2c531f7d1356ade78e17@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 12 May 2025 14:06:50 +0200
X-Gm-Features: AX0GCFuoFVJJ2KLgVFQoQTOvfp299H6PlFukenI3FYuId0cEte28aXrmVaRLmh4
Message-ID: <CACRpkdY0_u_7J_6JLAiVRz-oX+UZViUhyD0fSfi2u3ogVOPdbA@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] ARM: bcm: Add some BCMBCA peripherals
To: William Zhang <william.zhang@broadcom.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Olivia Mackall <olivia@selenic.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_050702_871914_350C50F0 
X-CRM114-Status: GOOD (  11.67  )
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

On Sat, May 10, 2025 at 3:11=E2=80=AFAM William Zhang
<william.zhang@broadcom.com> wrote:

> > Linus can you resubmit a v3 addressing William's feedback? I will drop
> > your series for now. Thanks!
> > --
> > Florian
>
> I wonder if you get a chance to review my feedbacks on this series?
> Let me know if you have any questions.

Sorry William, it fell off my radar!

I fixed up the patch set and resent a v3 now!

Yours,
Linus Walleij

