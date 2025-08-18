Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9799ACA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 13:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GuhsFBr0hPDOjSQgDopWNJ7fxxqkAvU6UwE4E9csdXw=; b=HzGX2ilyvsBu8FC4W9huJoGq2W
	oABKsBhiNzn725EgmGbk9cVPbwuUlqj4TvWeT+9kPr5/ajSWzupM1zcq+YBsLL1B9jjexxyPQdRgA
	ySHf/lUG1mVGcWgZcVidK/cN/DY2QM/nmEg7ufkZilat5fnQ5ziNIHsCy3+Se2VYro6wkIyoWT7kM
	AtscJL30p5fcpTkEHNZA1zPY8MP/2oJsp3r2Y9I9Oi92VyKpjKZgezOTme2pKI7FHBI6YAfvlDSRu
	qCFsehxXatd6NfO5gW9XY3V6RZGiWOJaOekxDHy2YT02yaBnfUPlgOaG6TGeeF5ieN8gM1j0THaCM
	1dDtAgpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo05H-00000007XV0-3E5Q;
	Mon, 18 Aug 2025 13:39:35 +0000
Received: from mail-vk1-f177.google.com ([209.85.221.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unviS-00000006zx4-3MPK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 08:59:46 +0000
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-53b171c1e82so3009009e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 01:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755507583; x=1756112383;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GuhsFBr0hPDOjSQgDopWNJ7fxxqkAvU6UwE4E9csdXw=;
        b=h86QaHIyp2SHDIXKmpN47dCKqJppMekwjrFX/y+kZlM3a6LslLF19fPnJVbgbBzKRe
         fACIf7UhwlFCMFRvijDlToT/mtupQBSABsYaqjGMq+U71ZG2hsQKBYcl1+hwbrgf6Cft
         1kXg5VEozs5HQYAAAbom7rfe6R+P1PjKGgyEEWSRmSZjXswyQRsYOy7NymY0rJoN6flH
         H0VqZxLKQVkgWs64Z2owAQoz9cXrwz/ra5LyJ22bpGgYh/n9x5a8C9udFgVUB2A4Wm3Y
         mMTrcm8KhwU94pCExyA35gmw+OY4G/t5uL1gVBFU0C7lr6puKE4rpW2FughGGlPg9VvA
         TpiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXT6O35bUin5Mm/wSjMm9muSHlaAQm9fIUZXILkyXLr6IdrryitSjZC7IErYFP+npBCw8r8OW/TbgvhyWeuhPtd@lists.infradead.org
X-Gm-Message-State: AOJu0YyIoPXvHIi9jsgabfr2DNcRIlD5f30u/eK2eiIecQMz5wox/8kq
	WwIjmnRIsgHchQ+bxvu5UPs3SvSM5Bvmpw3Y40u3OY9fLTX4zlFObAPThUl663Ow
X-Gm-Gg: ASbGncvbix/aiaTv0kbqnxybNvvMDwwFk67UlPOmeFqzZsukpxECFDHDPHn1cnVRgBH
	fHfFgxlA1qx12eUHR7tQnos2/Qoe5tB+aHi2BRmSqht2nzQyOLvPwH1EfhHVcsbNarO1eQfzofz
	ExcR13GxmivhjSqvlV1eOyLVVEI5Vaq9Q1d/1DwqQTw+jvgtJkpnrNLnSgLD7k1EVQw+oiriZ7B
	s5yIeN6fqk17bc44kWyeQuGmonahQ7+GdhAEWyYljR0E3TRJgstPW2LPB3qOBnDi4qhjsW22tNS
	lzE5CBhgDWwkXN9f3OtXbdoc98pbCK5KecXlgtPwQ/stF7iMVbAcQWyOFMhlu1sEVz7/muwnbGS
	tFrp0u0wkTF2siMckZJd9Shrx1yhuryE8aJxLlJBqmfe1pU2kU+1uC6wXK1l9
X-Google-Smtp-Source: AGHT+IGxUc1RDR4s+uOF4BIyt92nlbHWigbBbvZ5jnKWK1UbAM7aNOfSHJq9aY3uJItctdCHVj31wQ==
X-Received: by 2002:a05:6122:551:b0:539:46e5:cfba with SMTP id 71dfb90a1353d-53b2b85ef5emr3572949e0c.7.1755507583269;
        Mon, 18 Aug 2025 01:59:43 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53b2bf06c8fsm1715269e0c.29.2025.08.18.01.59.43
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 01:59:43 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-89018ec3597so2475255241.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 01:59:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUyudRFBAkM33MLs/bwaXlGxz97/FU02QM6T2ZSkVhSLQP21VuXm2flgT52LLPbfjgvkveZi9w4o/XDOzxUlW45@lists.infradead.org
X-Received: by 2002:a05:6102:5e89:b0:4f1:37f4:8c32 with SMTP id
 ada2fe7eead31-5126b112645mr4150542137.11.1755507582868; Mon, 18 Aug 2025
 01:59:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250625100330.7629-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdV3=c24KxO_Sbt50FGsFnNVYNnHAUhk-yoa+nM1f+7+kA@mail.gmail.com>
 <e1d465f7-43d7-471b-b8a7-7d24428bac4c@mailbox.org> <CAMuHMdX6naFbq-5LyuC4n+JRPTXGSSohKDTf95=MS_SMyHqfng@mail.gmail.com>
 <154ea688-8e06-40c6-944c-084fb9d5ce26@mailbox.org>
In-Reply-To: <154ea688-8e06-40c6-944c-084fb9d5ce26@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Aug 2025 10:59:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXHhwWyzKN7LrVFhyiQQSOpCa_MjJMUH5tOqiDdEwM2fg@mail.gmail.com>
X-Gm-Features: Ac12FXwusi8Q50H9ko56aKmi_551zQte_LhN-_Eru5-Jf3vH6_rggjPNmkPCoHw
Message-ID: <CAMuHMdXHhwWyzKN7LrVFhyiQQSOpCa_MjJMUH5tOqiDdEwM2fg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g3: Update thermal trip points
 on V4H Sparrow Hawk
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_015944_859779_E2CEF3C1 
X-CRM114-Status: GOOD (  31.90  )
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

Hi Marek,

On Fri, 15 Aug 2025 at 01:36, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 8/14/25 5:50 PM, Geert Uytterhoeven wrote:
> > On Wed, 6 Aug 2025 at 17:23, Marek Vasut <marek.vasut@mailbox.org> wrote:
> >> On 8/6/25 11:35 AM, Geert Uytterhoeven wrote:
> >>>> +/* THS sensor in SoC near CA76 cores does more progressive cooling. */
> >>>> +&sensor_thermal_ca76 {
> >>>> +       critical-action = "shutdown";
> >>>> +
> >>>> +       cooling-maps {
> >>>> +               /*
> >>>> +                * The cooling-device minimum and maximum parameters inversely
> >>>> +                * match opp-table-0 {} node entries in r8a779g0.dtsi, in other
> >>>> +                * words, 0 refers to 1.8 GHz OPP and 4 refers to 500 MHz OPP.
> >>>> +                * This is because they refer to cooling levels, where maximum
> >>>> +                * cooling level happens at 500 MHz OPP, when the CPU core is
> >>>> +                * running slowly and therefore generates least heat.
> >>>
> >>> That applies to cooling-device = <&a76_[0-3] ...>...
> >>
> >> Do you want me to add this line into the comment ?
> >
> > I don't think that is really needed (see below)
> >
> >>>> +                */
> >>>> +               map0 {
> >>>> +                       /* At 68C, inhibit 1.7 GHz and 1.8 GHz modes */
> >>>> +                       trip = <&sensor3_passive_low>;
> >>>> +                       cooling-device = <&a76_0 2 4>;
> >>>> +                       contribution = <128>;
> >>>> +               };
> >>>> +
> >>>> +               map1 {
> >>>> +                       /* At 72C, inhibit 1.5 GHz mode */
> >>>> +                       trip = <&sensor3_passive_mid>;
> >>>> +                       cooling-device = <&a76_0 3 4>;
> >>>> +                       contribution = <256>;
> >>>> +               };
> >>>> +
> >>>> +               map2 {
> >>>> +                       /* At 76C, start injecting idle states */
> >>>> +                       trip = <&sensor3_passive_hi>;
> >>>> +                       cooling-device = <&a76_0_thermal_idle 0 80>,
> >>>> +                                        <&a76_1_thermal_idle 0 80>,
> >>>> +                                        <&a76_2_thermal_idle 0 80>,
> >>>> +                                        <&a76_3_thermal_idle 0 80>;
> >>>
> >>> ... but what do "0 80" refer to? I couldn't find in the thermal-idle
> >>> bindings what exactly are the minimum and maximum cooling states here.
> >>
> >> The comments in drivers/thermal/cpuidle_cooling.c clarify that, it is
> >> the idle injection rate in percent, in this case the cooling can inject
> >> idle states up to 80% of time.
> >
> > OK, so I will add "(0-80%)" to the idle states comment, and sort
> > the nodes while queuing in renesas-devel for v6.18.
> I sent a V3 to make this more official. I hope that helps.

Thanks, I took v3 instead.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

