Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18ECBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 08:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ltAiiJOY4Rh6R3USCVTRewP6JRiLBCJCatFHoJxYfOY=; b=tmJJZ6pllPPvbu1GClLwa7i+AK
	5lOHjj9QJ2mUDCPSbGkPUHnk7ckwIp7mEzhrdpMFbDTGQeb1M8LDWa6TmZaAGFxVKOAKASxt9eEzE
	X9KK5I0i69ebYz36tbEVz28V7+/BV+0aLCrWIL7fDrnKFv52dtPO2yO2PVcfwNaYPIU7pASy1vo/p
	5W+yIXOG9Vu9l+Y0rnu6CWwAJTxMvndRPaCqL7/i/YKOaCb7nr+AZVYXvhibut9rrHcZw/OjmQ5Qw
	kIx6VSKg+Qhwp2Gx7ZYUwjc7pjk4u8ev8JSopUx3rgRDj5hXNfYzzhrmFtpzgLTR8ce8WdeFLjqaQ
	ZZ3xBFGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh14Z-0000000ESbS-06y3;
	Tue, 07 Jul 2026 08:22:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh14Y-0000000ESaq-024l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 08:22:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 605D4618AF
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Jul 2026 08:22:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1153C1F00ADF
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Jul 2026 08:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783412549;
	bh=ltAiiJOY4Rh6R3USCVTRewP6JRiLBCJCatFHoJxYfOY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=L0RTCN1n4h2MOCTtx/K1SWL7s1kbREzTYeE3CG9SXhN/tB5cuOAFtujxs59gfZM/B
	 H+2JJCNXQcWYFpd54b2GOsZWCrPavSHZX4v2nbHDU9oQZAQPRHqnf6fsdSicTG+kzw
	 0dBl9jrxU6w4/JDKsri7DfGc15iEe5DXDX2zjXNvJoL3hzIV4/kO5JxFtgpythM9dM
	 wafj4/9Yvblp1ubcGoy9DqcPVpQYdGkhHURM3IBd1KV1cTe2BthukMMG9fT2cN9KhM
	 9PCcJKoTz+gNcksL23jQwultmJ1GeyKYcyWNNxwr0slpIGzxbEVNyFAQnEuDQVq5Bi
	 HZ/aDKVkdrpSA==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39957d210f4so34065011fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 01:22:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro65XMBJ7BX1a3cBJYrOm97Gd7Wb5oAaQZCsuq2LE81HIPjUvcuEmmNqzc8ZPhOFOnVDotQtFh7oKCc4WjThZ8s@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0mYBH8l3Arf2irAJ/DcGaBi8fdVwSpTAHBJ538wbMEncsgu1K
	Q5IRMzkrBD7ekj/CIEFTxC0L0x5fPMTC2GWXT3WeKaCREAa3tGEC6O47yrlJjB3cfqRDQ7FnVGa
	zkItB28McIj7v3Dm2QsvbeQfe1LLXeRnSvA02RXuveA==
X-Received: by 2002:a05:651c:234d:10b0:399:8a8e:64e4 with SMTP id
 38308e7fff4ca-39c5ffc9258mr7569231fa.19.1783412547763; Tue, 07 Jul 2026
 01:22:27 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 01:22:26 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 01:22:26 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <akyxXxtj8nyCs-yf@ashevche-desk.local>
MIME-Version: 1.0
References: <20260622092335.1166876-1-eleanor.lin@realtek.com>
 <178246069898.6685.11577448681947659397.b4-ty@oss.qualcomm.com>
 <a00c475a6ce0469682305c4b4269b181@realtek.com> <CAMRc=Md-iOQ5qb5uPZcKJkpS8fmYscw8TRXqe7rRrJS7acE32w@mail.gmail.com>
 <akyxXxtj8nyCs-yf@ashevche-desk.local>
Date: Tue, 7 Jul 2026 01:22:26 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfD2j3xt1dXojFbyn=Df_9epMgEmLvSdCAfS7BSS6HD6w@mail.gmail.com>
X-Gm-Features: AVVi8CfM53nWTpEzDBmB2ofkWlre7XvkEwA0f3764nQdW9C9z_xUKQQo5Zl9o_8
Message-ID: <CAMRc=MfD2j3xt1dXojFbyn=Df_9epMgEmLvSdCAfS7BSS6HD6w@mail.gmail.com>
Subject: Re: (subset) [PATCH v4 0/4] gpio: realtek: Add support for Realtek
 DHC RTD1625
To: "andriy.shevchenko@intel.com" <andriy.shevchenko@intel.com>
Cc: =?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-realtek-soc@lists.infradead.org" <linux-realtek-soc@lists.infradead.org>, 
	=?UTF-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>, 
	=?UTF-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>, 
	=?UTF-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	"linusw@kernel.org" <linusw@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"afaerber@suse.com" <afaerber@suse.com>, "mwalle@kernel.org" <mwalle@kernel.org>, 
	=?UTF-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, 7 Jul 2026 09:57:19 +0200, "andriy.shevchenko@intel.com"
<andriy.shevchenko@intel.com> said:
> On Tue, Jul 07, 2026 at 12:24:16AM -0700, Bartosz Golaszewski wrote:
>> On Tue, 7 Jul 2026 08:55:26 +0200, "Yu-Chun Lin [=E6=9E=97=E7=A5=90=E5=
=90=9B]"
>> <eleanor.lin@realtek.com> said:
>> >> On Mon, 22 Jun 2026 17:23:31 +0800, Yu-Chun Lin wrote:
>
> [...]
>
>> >> Applied, thanks!
>> >>
>> >> [1/4] dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio
>> >>
>> >> https://git.kernel.org/brgl/c/8f32808e1530b2229e07695fb39c54fee910bd4=
a
>> >> [2/4] gpio: Replace "default y" with "default ARCH_REALTEK" in Kconfi=
g
>> >>
>> >> https://git.kernel.org/brgl/c/b5d23fcdb12972c522e96f90ab48be8a0d971b0=
e
>> >> [3/4] gpio: realtek: Add driver for Realtek DHC RTD1625 SoC
>> >>
>> >> https://git.kernel.org/brgl/c/a57e27c43b0315ee86c6896510d69be5257e093=
e
>> >
>> > Thank you for applying the patches!
>> >
>> > I'm currently working on v6 of the patch series that incorporates Andy=
's
>> > gpio-regmap patches, and it should build on top of gpio/for-next. Howe=
ver,
>> > I have a conflict with the driver patch that was already applied.
>> >
>> > Could you please revert that commit from gpio/for-next?
>>
>> Can you just post the series as a follow-up? I try to avoid rebases unle=
ss
>> absolutely necessary.
>
> Would be just leading reverts in the series appropriate? Otherwise it wil=
l give
> a lot of additional work for peanuts.
>

Yes, that's alright. It will make the review easier. We can then squash the
reverts with the new patches when applying.

Bart

