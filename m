Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64130C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 16:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=feUYG+ADKxy5u46DUzbwJ3yPnREVGzj+yGdWXxrHRlo=; b=yKHtTObAVOftkU
	EWcI0YHFQ4M4UKh3E1sQeD2CEOEYlweLfHc1VN7+rfE+A+TT0z/d2oIwTbJlsemuyMUs8uXefge8Y
	73ZmWCrBq+0SWhtMQZfYtIpfWuzLtCZyrqW27c1FqVk779o8NDMHo2wKZlzDxtRA7dpAhWZswpwJ5
	OG6YBsa3U6gk6IXy9lbo7FmuPkC879K9T6VAxPK+OgoXghWPZrpCkfAQQHV0+HQumCc7NZKjXSQoz
	bexwxmDtz1kWgaEfgMQiY4pPm4xoqWDujMwH/gsYjvzDje+VE/J/8ZEjPCUa63awjarxLJmaMRCkC
	KHgHiLqE8onn+eX1vXwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8M0t-00000000EoX-07Rl;
	Fri, 25 Apr 2025 16:34:55 +0000
Received: from mail-lf1-f41.google.com ([209.85.167.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Ky4-000000002cr-33xp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 15:27:58 +0000
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54298ec925bso3131678e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 08:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745594873; x=1746199673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=feUYG+ADKxy5u46DUzbwJ3yPnREVGzj+yGdWXxrHRlo=;
        b=U0mvQTfuxC5mACHmLf+I9FbFTWP5TGqmcp/N8oDpRWmmoKNPjILPk8fKZTTT1S5q07
         GfZnaS2NZi2ahORUzVprilgr6Dl2NHi89pk93SgGhzRvQtkLovJ3S+l6PgDWf9s6gTFZ
         ++JEUNx9+TW+Gy/n1snk1ScyYiXZxJx9C3cZxgwzEMhdH4Clka2o2OrA64O+ukzR7QR0
         am7ChFsOuoH5mPpCxpiT62FSCQPHcD+e0ucblgqP8L1MRbcgGTowfRDqPEgVOY6s7C1I
         57UE4deu8BzQZY5+IXrdleAtRToj+0x7lYz7VlfPtgzKpOtH6oaSuGWsUo8f33c+Kf8S
         35kw==
X-Forwarded-Encrypted: i=1; AJvYcCUOsITE4jvzlcfkrq0UUFzZ+zrl02eC7hPb+bx5Vx7Dapc5r4ByMBNfWzyH6HZ6ZZgebWzTM7+iM2WYtfikoZ1L@lists.infradead.org
X-Gm-Message-State: AOJu0YyeocHkVn8iQGzTjF8OrYKFY6kfWNvSBho1Ctsnqcuz5qhBn6Ph
	mv1U5BcKK1pzfSknolB+qd2phZK5k8pNp/OHZAoIkKrUqYq85SipDzFM9Elf4FM=
X-Gm-Gg: ASbGncttbl4XBL3ZB9VKFhUY2iR5X2oX/p1xD9/z84055O6I96IDkyowZSMCEWOof6C
	I10zEewnNIg1c+Szp0CStIHUMzfX4b+lm+2CjTSJoaM/l84BmdFH/X0zsqL+y7kPRfyEb/XXWic
	yix/EyDAxUhsiq3ZIjk6HWF4Czk8NAA3W67LRHdVkCd3pbp0cK4Sl0CDkotWkdqu6uCLFnMsGzj
	I7PzAWCUGTHVdCfsxrLkWFMexxdYmP0xFASspL4eTGjPbA3MMcd+iGd2FmFJ4VE+oZ46yu88yIE
	nDXAXPUpmGxMKV6xIc2QRa+kEMnCXF7qROM+lV8/57K0Nd3eCwJ7x1r3XWo0sc9cPmlysZNddA=
	=
X-Google-Smtp-Source: AGHT+IHAwZ5fbmhhbxY5DJKTwtUUSPv1tvigvdVxSdjsXu4Gwu/Tr3f73V6/h7GtTeqYiRlsTxKG0Q==
X-Received: by 2002:a05:6512:acb:b0:54e:751f:4094 with SMTP id 2adb3069b0e04-54e8cbd6df2mr936625e87.23.1745594873153;
        Fri, 25 Apr 2025 08:27:53 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccaaacbsm644946e87.195.2025.04.25.08.27.52
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 08:27:52 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-310447fe59aso27686641fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 08:27:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXskhJxGs/xIUUqZa53ZgL84/aCklJk7POYCKHQ4gvzkqRZh0ekF2B4FVMuoJx+yvPoHn+W1pncM8YJuGLTo2Aw@lists.infradead.org
X-Received: by 2002:a05:651c:154c:b0:30b:efa5:69a8 with SMTP id
 38308e7fff4ca-319080e4888mr10622571fa.36.1745594872478; Fri, 25 Apr 2025
 08:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250425023527-GYA50272@gentoo> <20250425030006.45169-1-amadeus@jmu.edu.cn>
 <CAGb2v649ntfAEUdV5S1wM8nUGhvaOP-RBw07XcxwdbafbC2PYQ@mail.gmail.com> <20250425044747-GYA50408@gentoo>
In-Reply-To: <20250425044747-GYA50408@gentoo>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 25 Apr 2025 23:27:39 +0800
X-Gmail-Original-Message-ID: <CAGb2v650hzgWGC6H4gL-YkaWCw7RJjBYkdcXGwXaRCa7T6G71Q@mail.gmail.com>
X-Gm-Features: ATxdqUHtlXlW5ElJgIFQbcm5VC72kEfcPm_-jaGId3qhnAcscv0DyPelGJ1i-0I
Message-ID: <CAGb2v650hzgWGC6H4gL-YkaWCw7RJjBYkdcXGwXaRCa7T6G71Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: allwinner: correct the model name for
 Radxa Cubie A5E
To: Yixun Lan <dlan@gentoo.org>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, andre.przywara@arm.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, jernej.skrabec@gmail.com, krzk+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, robh@kernel.org, samuel@sholland.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_082756_771400_4357F3EE 
X-CRM114-Status: GOOD (  26.29  )
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

On Fri, Apr 25, 2025 at 12:47=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Chukun, Chen-Yu,
>
> On 11:52 Fri 25 Apr     , Chen-Yu Tsai wrote:
> > On Fri, Apr 25, 2025 at 11:00=E2=80=AFAM Chukun Pan <amadeus@jmu.edu.cn=
> wrote:
> > >
> > > Hi,
> > >
> > > > It seems I'm a little bit late for this, but while we are here,
> > > > Can we also append 'cubie' to dts file name?
> > > > e.g. - sun55i-a527-radxa-cubie-a5e.dts
> > >
> > > Usually we use the device name (without the vendor name),
> > > maybe sun55i-a527-cubie-a5e.dts would be better?
> >
> > I agree with this one.
> >
> I personally would prefer to keep vendor name, it's more explicit
> and easy for poeple to distinguish/find the board dts

We really only have the board name, which sometimes combines a brand
name, but not the vendor name.

Same goes for all of Radxa's other Rockchip boards. The file names
are all rk3xxx-rock?????.dts. And all the LibreELEC boards are
????-nanopi-???.dts.

ChenYu

> but, this isn't something I really care, so I won't insist on this,
> please proceed either way, thanks
>
> > I can probably squash in a name change (since I'll be squashing in the
> > SD card slot fix anyway). Andre?
> >
> I think it is better
>
> >
> > In that case would you prefer to keep your current patch separate, or
> > squashed in so that everything is clean from the first commit?
> >
> > It's up to you since you lose out on commit stats.
> >
> >
> > Thanks
> > ChenYu
> >
> > > Thanks,
> > > Chukun
> > >
> > > --
> > > 2.25.1
> > >
> > >
>
> --
> Yixun Lan (dlan)
>

