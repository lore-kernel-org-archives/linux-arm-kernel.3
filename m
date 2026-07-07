Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BF7C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 07:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BmN/CtMHKh2mi0fzV1uYYinbEdOJFdIHKPvunHZGayg=; b=NknteY5iOY8FaOuu2EsFv8AXHq
	q3AxZyDZCKrMrmuQg3UEqcOrC/FPiR2PwalXJClj+Rs+NsFdOdLETDJMm1wKTMcJcjt4DXIGO6fha
	trI3J4TrCZ1u5/qzK9ucOt09lxYaYyI1gqesIdEmmNyboOVtCZnetoGcfemuuIqGHIXW+9n10GGFS
	R4i2030jva/rX7fy66zmx98RSJ3aUiSEU+N/qBTwV1YySMm7O4mUdrCxmYwLeXFKo/yR/Y40mSsd3
	AqCcLDz6v9NL+3UQGhBJKd1sFT9GuxSS1F4uqrIaN9BvvgFUetE+tnf2i1n+1l5YWHRvQ0TEVV6Xs
	tDaAzKuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0AG-0000000EJT9-2ZAm;
	Tue, 07 Jul 2026 07:24:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0AG-0000000EJSk-030e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 07:24:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A8584382C
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Jul 2026 07:24:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 828171F00ADF
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Jul 2026 07:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783409059;
	bh=BmN/CtMHKh2mi0fzV1uYYinbEdOJFdIHKPvunHZGayg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Dogw9t1qgCmIsDdnvQaTCTWALTInBBGi8HB27yI7UrR0lEhiFFIeMPUhr0hfDd7sw
	 V1D5uUhbXTZr8TUwRxxBd8GAek6ajzymnUT3DSem7drqjehorC2XXBqA4mhEV7Pe2N
	 d/hK4U1KZSltIZO3Pp2tSstITinTjvjwKhq1ZDHpIak/AMDBglQ4Xmz48vVOJrzb8v
	 wAAZyPCqjoP++rNIVXgZw91GSI/r8MJ9N0GVDCrv6i0eVQwVcvR+w+GPsC+A0dyVm+
	 K/gzHXactxhE5XUoiobevKTvCBUFG+nGjJ+091KQp6/BGAegiFYYiZYeKMUxK1gKyN
	 z23TuGevvYhcA==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39957d210f4so33548731fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 00:24:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqwc1QLj1O215E9kRs2uwKqKMlBaFSZ+IoWpKY0/i/q3/0uU8A37vS6/Hypx+xCXMht2y3dnWdDdaCjd7a5+Jiu@lists.infradead.org
X-Gm-Message-State: AOJu0YxlGhUR4MDzcgidOVEg/ZVsmuuODbqeOfxgzRiizZp0b/LSx/77
	Fyn5eF5VrRJGfkl3P627Dp1jVwpMMhY2hI01CiDWRbS9k+YCWEH/1DzvYn03/magX46s3T99y1D
	VQLwmiDLlmMqjKq4qdgoKE4bwjVopwv1iMGLAxszDwg==
X-Received: by 2002:a05:651c:1a25:b0:39b:2ff8:64ae with SMTP id
 38308e7fff4ca-39c5fd460femr9013721fa.9.1783409058001; Tue, 07 Jul 2026
 00:24:18 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 00:24:16 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 00:24:16 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <a00c475a6ce0469682305c4b4269b181@realtek.com>
MIME-Version: 1.0
References: <20260622092335.1166876-1-eleanor.lin@realtek.com>
 <178246069898.6685.11577448681947659397.b4-ty@oss.qualcomm.com> <a00c475a6ce0469682305c4b4269b181@realtek.com>
Date: Tue, 7 Jul 2026 00:24:16 -0700
X-Gmail-Original-Message-ID: <CAMRc=Md-iOQ5qb5uPZcKJkpS8fmYscw8TRXqe7rRrJS7acE32w@mail.gmail.com>
X-Gm-Features: AVVi8CcrbLMeNkZ5-bNIIYKlmy2rYvKumhuTS6KL5a6DXiAW3YJ-4dQor06ihkY
Message-ID: <CAMRc=Md-iOQ5qb5uPZcKJkpS8fmYscw8TRXqe7rRrJS7acE32w@mail.gmail.com>
Subject: Re: (subset) [PATCH v4 0/4] gpio: realtek: Add support for Realtek
 DHC RTD1625
To: =?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-realtek-soc@lists.infradead.org" <linux-realtek-soc@lists.infradead.org>, 
	=?UTF-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>, 
	=?UTF-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>, 
	=?UTF-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	"linusw@kernel.org" <linusw@kernel.org>, "brgl@kernel.org" <brgl@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"afaerber@suse.com" <afaerber@suse.com>, "mwalle@kernel.org" <mwalle@kernel.org>, 
	"andriy.shevchenko@intel.com" <andriy.shevchenko@intel.com>, =?UTF-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>
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

On Tue, 7 Jul 2026 08:55:26 +0200, "Yu-Chun Lin [=E6=9E=97=E7=A5=90=E5=90=
=9B]"
<eleanor.lin@realtek.com> said:
> Hi Bartosz,
>
>> On Mon, 22 Jun 2026 17:23:31 +0800, Yu-Chun Lin wrote:
>> > This series adds GPIO support for the Realtek DHC RTD1625 SoC.
>> >
>> > Unlike the existing driver (gpio-rtd.c) which uses shared bank
>> > registers, the RTD1625 features a per-pin register architecture where
>> > each GPIO line is managed by its own dedicated 32-bit control
>> > register. This distinct hardware design requires a new, separate drive=
r.
>> >
>> > [...]
>>
>> Applied, thanks!
>>
>> [1/4] dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio
>>
>> https://git.kernel.org/brgl/c/8f32808e1530b2229e07695fb39c54fee910bd4a
>> [2/4] gpio: Replace "default y" with "default ARCH_REALTEK" in Kconfig
>>
>> https://git.kernel.org/brgl/c/b5d23fcdb12972c522e96f90ab48be8a0d971b0e
>> [3/4] gpio: realtek: Add driver for Realtek DHC RTD1625 SoC
>>
>> https://git.kernel.org/brgl/c/a57e27c43b0315ee86c6896510d69be5257e093e
>>
>
> Thank you for applying the patches!
>
> I'm currently working on v6 of the patch series that incorporates Andy's
> gpio-regmap patches, and it should build on top of gpio/for-next. However=
,
> I have a conflict with the driver patch that was already applied.
>
> Could you please revert that commit from gpio/for-next?
>
> Best Regards,
> Yu-Chun
>
>> Best regards,
>> --
>> Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>

Can you just post the series as a follow-up? I try to avoid rebases unless
absolutely necessary.

Bart

