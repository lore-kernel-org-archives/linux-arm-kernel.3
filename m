Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6A8CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 14:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2GhP8a/ZKQuCgI57gL3YaLW/ubXrMPM4jolOkHKTB/I=; b=YKRYCeJuvnkHREoJ7VC5o8s08t
	dRp7J9IfW/6GMeDMT22FdmG6noHHRjj5CEDTDP0yyhJR9yIR9gk877vO33YG729zP3FqyKd/m6LxO
	c1lpz06ySwt6VMwR2WovnVFt+jKHd87bDl/j2G3omH9hnPXLIEtSM+g/d2C5J+Y7BI2kiyu0TcfaG
	2B5Fg3IH3TBfWANYHsepqNkh1rRR7g7/E7mnaZ2E8EUOwRi4a37lhRV50pbcErvoGmqV9Clj9exiY
	u80dgkng6tSB6sZpYnsiid7evoCf3wjVNlvlxgKxcuMlgxXoENkXPUyoSq5mVP13Nu76QElMYqtur
	XAENEXxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v697F-00000002Dsa-1Yjw;
	Tue, 07 Oct 2025 14:56:37 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v697C-00000002Dre-1btR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 14:56:35 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-78e4056623fso52760796d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 07:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759848993; x=1760453793; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GhP8a/ZKQuCgI57gL3YaLW/ubXrMPM4jolOkHKTB/I=;
        b=WPZTGy40UfzvVU0ptv6p4HiGon7dyc6drwO7FjBivo8GPSiyfEPq3AfBFAKjkm1X/X
         XrbXez7vafvd3dGrb3lOTkb9SkVCaH5VN9s/WYsmfKTITEjDMRF24+dd5DXs/qp6iPA7
         bZ78068jQo1ulvMfgFCo5EPJ/eOgcPeGSsj3co5SYcvjSkgBhuU27Wftzk8lXaUCJlwd
         TEKd4tOZ2JQDAaqinV4cC3tIiRE/X6i8iqWvC8lnD4PFHU7pe927nmL+g04troCVds2B
         M7g3z+ZU0+tNVx5HlBDvb5Dl8VjVlQjYdFvporKLhuWmloN0jnA4nGCuJoYIZTYc4M+2
         oc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759848993; x=1760453793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2GhP8a/ZKQuCgI57gL3YaLW/ubXrMPM4jolOkHKTB/I=;
        b=YIY1laBnBNVGdBolEbOZpJsfXN2Z4AObJdL3E7fv4AhxEe98KnT7dw+aOMgcLMy0qp
         aSMaTBHk5cCuYi2eSmqpBB7FTizFZi2J2RauZLbYIPjGzW5P20DO38I8yXocniP9+nwg
         WG1Km5MpuDbu+wHd1ruTdh12L2MVF3I4QrI0KiFcF4ZOyzqWd4saHix4i42dMCok4D+n
         ErMvabb8Ibs8SUDR1ub3XFA++j90FCvWoz9FTCGFAFzHh3CdNRDh51t87QLW/YfJUBhp
         3rkZKw04xIRoJAZN6VpO4XdxkUQ7+law9kaouaLaY9SamKOVDgUml7MajkVtYTPjByK3
         V0Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUzB7tlxPX1HWRJXUJeNsgwEW2aE34QiFnCMCzLiNcLd1wh+ABITbnAp1s7mAoz8RMWB87BBcyTef7vRTsQUy+w@lists.infradead.org
X-Gm-Message-State: AOJu0YxNAE7QGuo5w9hW6/+J9Lkutb8NyaRS2i4dcax6QFMuUX6Wi+Xo
	XHJ52S38ZGrY+my/gAxhJ/kuzOhV04NmgXgdpUVBOgENED0hNuYowR0XQlcpUsdll44yfuSO6eo
	33XrzE2xJUg/lNuKO1ZCShnIxsvkMIv4=
X-Gm-Gg: ASbGncuMmEGquVQeoup4hID58jLJbp2gIVL8BbQzQLP+sjsVVlENv6fQoB/R60qTUJX
	g9daBLy9DgUJUhQlG5llzrAozXn+FdM9cre6AUbUw/RlJuGx8T4pjK4NK7SUNtmRSPa3rGAF+5+
	MapfJhJFhXh80HxB4tcOlZtP+p/AKvzWEkJF2XP3KNaeEl+6yBD5dD5lpB8yF3ch9LHA2tZZcp0
	m3qvYI0e8r4ph/A7ChIYEWe8uo+OLRg
X-Google-Smtp-Source: AGHT+IFrXi3dEsVh64oUPSZQJlGSlVMkDxHPAisOxAhnbSx/xiMMXQ/o7YtNW7v7WGp9iWQQ9a0t5dArstXdxIY4V5U=
X-Received: by 2002:a05:6214:1cc2:b0:78d:5f57:e91a with SMTP id
 6a1803df08f44-879dc860afcmr228051616d6.55.1759848992842; Tue, 07 Oct 2025
 07:56:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250929065714.27741-1-jjm2473@gmail.com> <20250929065714.27741-3-jjm2473@gmail.com>
 <5700676.tIAgqjz4sF@phil> <CAP_9mL6e8ekL14xycSfPmVSkL7pANLeyewWd=rjxbtMgMQXxxw@mail.gmail.com>
 <6a5b9e68-4f23-49b9-b744-e84fc28a96b0@lunn.ch>
In-Reply-To: <6a5b9e68-4f23-49b9-b744-e84fc28a96b0@lunn.ch>
From: jjm2473 <jjm2473@gmail.com>
Date: Tue, 7 Oct 2025 22:56:21 +0800
X-Gm-Features: AS18NWCQpv-6neUw-wCX8BxmrQo_hHgklBBZppkW0N1Nfv2AVai07jEpSNzQRn8
Message-ID: <CAP_9mL5C1vKJq=bGM6DoK47vU4p-qvPeF-k6kztdnEp3y=kUhA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: arm: rockchip: Add LinkEase EasePi R1
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiko Stuebner <heiko@sntech.de>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, quentin.schulz@cherry.de, kever.yang@rock-chips.com, 
	naoki@radxa.com, honyuenkwun@gmail.com, inindev@gmail.com, 
	ivan8215145640@gmail.com, neil.armstrong@linaro.org, mani@kernel.org, 
	dsimic@manjaro.org, pbrobinson@gmail.com, alchark@gmail.com, 
	didi.debian@cknow.org, jbx6244@gmail.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_075634_425479_01AF686C 
X-CRM114-Status: GOOD (  14.70  )
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

Andrew Lunn <andrew@lunn.ch> =E4=BA=8E2025=E5=B9=B410=E6=9C=886=E6=97=A5=E5=
=91=A8=E4=B8=80 23:43=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Sep 30, 2025 at 02:20:57AM +0800, jjm2473 wrote:
> > Heiko Stuebner <heiko@sntech.de> =E4=BA=8E2025=E5=B9=B49=E6=9C=8829=E6=
=97=A5=E5=91=A8=E4=B8=80 20:28=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > Am Montag, 29. September 2025, 08:57:13 Mitteleurop=C3=A4ische Sommer=
zeit schrieb Liangbin Lian:
> > > > LinkEase EasePi R1 is a high-performance mini router based on RK356=
8.
> > > >
> > > > Signed-off-by: Liangbin Lian <jjm2473@gmail.com>
> > >
> > > In v1 this patch received an
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > >
> > >
> > >
> >
> > In the next version, I will add 'Acked-by' to the commit message
> > and then run `git format-patch` to avoid missing it.
>
> Please consider using b4. It will automagically collect all these
> reviewed-by, acked-by tags and all them to the patches for you.
>
>              Andrew

Thanks for the tip!

