Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26E6C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 21:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hGrB9f7DjLu6cDd5Ib9pvL2PAo84lAV08rjfm0+WddU=; b=LN1tlRPK07jTkPZ0qU1nmxcj0C
	GkCytxqSEioxPUiPoGl7AVMXUw4U4TJuVEsiFoAPvhbP0RGv9Sp21Ch/x6Hc5bUJTgUA+ZTjiMm01
	sr6E3GSSz3V17IObKP8p2sFewC/0YHK97060pArP35xEBK99wjNvMRYn3Nl9jiJXSdHijfT+UC3U1
	zrRGmcBen0AI1mT1SBlHX9cpVFWNkYLyvQeu3Adib+RFfALs26SAjfLPM1MpNk3OVY/r3sfJfWAE0
	m1M5GA9eGVRcijoF5EDQOjeN928t7q7bevJtKfprppUNLEzLDdveBpij26NKNZblVFYKcS+luO7N6
	Vnuw/GBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2F5D-00000000fEl-0lIu;
	Thu, 03 Sep 2026 21:34:55 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2F5A-00000000fE1-3a37
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 21:34:53 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-90cbff85fa9so4600846d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 14:34:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788471291; cv=none;
        d=google.com; s=arc-20260327;
        b=TAEVpTBL+EVqPYMiuapULo0wXZIGtE/zJaQjDy48TTmuqC/rcNvF7uLldSmV8mgZsa
         Wq3d9wuo/okwROnx3G1N7WMa18fGCPCXyXuv4iVIsV4Ff8rWTMkh1J6NaBWmcUnhVzUP
         n/SfHH2I1IMMVXAJo7POQb/jtYZd1EEovFY3RGo6UBe6dUzmjP9EwIhdqkNCDy1gU0l5
         1nA6eAoMl6sk32LI6OZJX08qeWlAP3BvwRPoP7G1nsmcnW5/5IRSS8JXGfSitQ7S5QJ6
         HIKcOqTofnv9xM1ZlWSCVOouIp5mRtrvh1GFQQiZRUCZoUi61VMH6b30gAGwdlZa6qwr
         BqPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hGrB9f7DjLu6cDd5Ib9pvL2PAo84lAV08rjfm0+WddU=;
        fh=h/UwiJOmCQ4JdDoOXgv4I4OPRD0MkG+P6AYHs1wgUfk=;
        b=Eg4psROh99RRb1TxaRXFIpvb9G6qaCfs8oQ42Tt1Uh63IxRdzVLt4Kofk0m/2V1gC/
         OvOwbitS1wqCkpkcpSOBr2oP9mOG6CLr7ZMOX4k6mJQUXw8lucOZmo+A+T+4YcpijXAG
         Kl19m6LvocGh3fquJfrvTCwtWVbbuubcsNuLW+kG1MLMCg36VMZ7gwGkDlddx8rM1ImG
         i+xrbZlzRAERQvSJraNPybTNM+Eayt8Ussau+k6N4YlCGWWrS46y7iwtCjnfPIekiW6X
         Twu7+QAlZ8QoU8KdFowKaxJj9PPpDV++IH++wFEwyIvkWisLPU/CojKWvyR6ccIiJEFS
         eypA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788471291; x=1789076091; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hGrB9f7DjLu6cDd5Ib9pvL2PAo84lAV08rjfm0+WddU=;
        b=gQC1rohxc5t8medCyLlW53jwhkFL2No10LDjLniXiggV74V8spFzWf8Qsc6qpRGgsS
         We9Fvjc/2ZWWmKmlgdk+Mt2u7LvazqN8N0N7zdUTVpNB685kuWUYh0yFF73+YBjY4dM4
         szfPKdZZRhSmwg2gtfv+ve/l0yE/p/7gSD9yGmGBynaZzf/wVp0s8WEVPjRBEOFrKcn8
         uwJNwxSzsuu2tN/IUPu4DoJLs0nZr5Ci5y6I1eXx2nSNBg26iLflmticiptzqu8RpyJN
         W6E+5Q1cc7o48MoO+5cccXMO8qsFr/FS3Y05QpYb4n+fPB6yQSctrRyit5XMYB34fPkq
         +2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788471291; x=1789076091;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hGrB9f7DjLu6cDd5Ib9pvL2PAo84lAV08rjfm0+WddU=;
        b=r1Y8SfkRPfqbHmvxc7EOmVqzF2tckW7f3gtHUh3Cyn7XtmwQlAMJZUkV7+N/I+qJP6
         pyK5vYBple5RDyDDkOuO5vpy8ycFB8xhXfUtu3vivEaREZCh43NTo67jMwAHXqkDe5e4
         W+qdJld21raYL5uEPCvXeEAlb3s+kNa8qBXSxJi0w/fkHFyNhB+jGdesFMxZzxS6Yf6A
         TRFACWhqb6aKOWlhXdaBDYR82S1lQgFUE89hcVeIsk8RyACLOt6KmbZivEB/tVYJfINY
         FsLYlUPZT4b2MESWA2cWXTUv8Pb9D+KeyhwfgRI+c3XM8XIvXuiZollK62Df8H93rHSO
         WccQ==
X-Forwarded-Encrypted: i=1; AKwUvByB0UruacaLFbWgRiGV+gw05uaOwrKWzG8mUsMiuxYk1gaa36RtSnRSYZAh3JtdUY63NVGc4gEsuO62MquEVxXM@lists.infradead.org
X-Gm-Message-State: AFuF++mKCPFOKy/6HU5Z18sHpLqR489ISRlRI8MQC0SXpUNUqx0zd2OJ
	25tAn4+FWZcnT99AwgA97Oyus51RKGn99XgwcKEX6WMF3DSv11+bRWlZsR86Mj+QEmVlGr+cI3f
	g1QfLyT4EIOiDgUf3R1GCnp8EWkWJyUSEBA==
X-Gm-Gg: AYBFou1BIx38OIH/nYWGIb8KaZBCjv1/2/ZDsgAJdbMVBrSTakGWRWldngUkg0S7hJv
	6+Khssaeh+5ei86DkN+xWKGpDI/Hr2m2v+Hy95quH3QGRfkatomH3yk0RkiK7kBtH1MFPHN6/vK
	LwpbgQX9G0Rr09qv1OYeg3hjknUayHrOHNy9FaGa0rKDt3Vgkf7Je4Lg4EKazxX16uFGXBkg450
	NCuRdnGw0XJkZXzKCr8TiWXKtli6FrUOe+UCu/1kr9cGHCTwgY3QX2fub36JML0HiNd+oJbHH6G
	mM8Wl6UwQJAxCHmpTaIJeV8eaeu55h+qNRPOanMYNC74ZBR8EORDerArtRmwgMuQ0KFKkPbALZG
	P3xklUvTjkK/ZWU46jPSSNYgwbjEGkEL3qiJpKBCtbG2T6gJXOFBEjKZvTRh8MtseDLbSiWZalw
	VYSCniK/Wk1T209nxloT7TJwX53Syhar9vxvihXsA=
X-Received: by 2002:ad4:5e89:0:b0:910:3903:5155 with SMTP id
 6a1803df08f44-9103ef2b2e8mr27924686d6.12.1788471291386; Thu, 03 Sep 2026
 14:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260802145109.728793-1-pbrobinson@gmail.com> <20260802145109.728793-3-pbrobinson@gmail.com>
 <apl6RddLcPz8Q2-O@apocalypse> <CALeDE9NCSb_-DugUBkpa3iBBXbFxccfpt3gKw0-fN8czwnurSw@mail.gmail.com>
 <8f948621-fbeb-4807-a4c2-0214ce5d3bc3@gmx.net> <4c67126b-798d-40d9-9ab6-8fc876fc5630@broadcom.com>
 <CALeDE9Mr4asKmQaQ3yRfnf5B4cvVkZuDTB+8BesPUy6djpkmVg@mail.gmail.com> <636a448a-0711-4844-af62-4b38ed7cce86@broadcom.com>
In-Reply-To: <636a448a-0711-4844-af62-4b38ed7cce86@broadcom.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Thu, 3 Sep 2026 22:34:38 +0100
X-Gm-Features: AcwNN1Uv2D9v_pw-GfsGiOZWG3HscrogeRdJ_FG015jSQ-YyAbQg2DlcsnVPCoA
Message-ID: <CALeDE9OCZJBKpsAhNJdN9yZTv009PxbLtprg4ErivhQ+boQo-A@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: broadcom: bcm2712: Add thermal monitor
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, Andrea della Porta <andrea.porta@suse.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Phil Elwell <phil@raspberrypi.com>, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_143452_897610_42486855 
X-CRM114-Status: GOOD (  15.64  )
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

On Thu, 3 Sept 2026 at 22:17, Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 9/3/26 13:55, Peter Robinson wrote:
> > On Thu, 3 Sept 2026 at 19:55, Florian Fainelli
> > <florian.fainelli@broadcom.com> wrote:
> >>
> >> On 9/3/26 11:47, Stefan Wahren wrote:
> >> [snip]
> >>>>> Doesn't seem to apply cleanly on v7.3-rc1, could you please rebase?
> >>>> It should apply cleanly against Florian's next branch here:
> >>>> https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next
> >>> this branch based on 7.2-rc1, not sure this is intended.
> >>
> >> It is intended to be based upon the last -rc1 that was released.
> >> v7.3-rc1 is not cut yet, but when it is, I will rebase all of the /next
> >> branch on top.
> >
> > But  v7.3-rc1 was cut on Sunday 30th Aug IE 4 days ago ;-)
>
> All of the /next branches have now been rebased against v7.3-rc1.

Awesome, thanks, much appreciated.

