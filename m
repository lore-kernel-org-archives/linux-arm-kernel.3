Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5734CD36121
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 19:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2YLBx9MU/RnKu6hw2T7hL3H8SirYRCnW93a3oWsqcq4=; b=T9xNdst+VQBG+mOpMvcOqmVRo8
	doUrYjaZLR87r8dfnVZ16oyUR9nogqdAOvDo327DoXy+pbzV+HmSQM0Zv41dlMKdebGQTmzv4ZjqP
	ygii6/uJNZNdjldY9u1JWv2LHOm5N7/b8c1gdU5E4/eDPG9oCWBpx03J6eCo8LRgmuRYqowLiXOSk
	s7NqSu6zwuUINESm8rxVCRI0Y5oZ9HcBUlhTQsoeFl4YYQJn4o1avro8uhswMedOb7qVOiFpIRMuy
	PFPZs5WBf75YqU7Y6ENskTibzTwRSjxP8Bwf12UbYRbhngBowq38segyJcAY5MS7OhNfF3qr35Qd1
	mV8JMH+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Pby-00000000bq5-3IR2;
	Tue, 05 Nov 2024 19:53:10 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8PaF-00000000bbv-2eqi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 19:51:25 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so7453724e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 11:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730836281; x=1731441081; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2YLBx9MU/RnKu6hw2T7hL3H8SirYRCnW93a3oWsqcq4=;
        b=a+kYHTzTXBziExH008xSQRgktC/jbdSfrrogbE3E5qoP8aQX+yEHRcsMoPcJHD93La
         FZuYhG7bo9KGCzRcsmWXTn8E8TPXrlhzATSAv+q7gE4JDMFUJbblBqIzSfR7xKSlpKyi
         tTrwqOH19dyLoCg6iPGYr2y1GXWdOqEz2xCGFvd6/Wl/Q6vulkVduhcOvW7nKkzz1g10
         qBKcOpd6L1/mPVwZ9Q16mZRyOqhrlzbzjS4zeNCKlg4pmu8GzHpAMhiYNJUSZL6FB+qa
         yPDLBDz+jsKhRnBfJwuW1mo3f+1IELfRIJ/HVJAxf2nQk4BUwKYuRnTnInfinWPhaNU1
         GTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730836281; x=1731441081;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2YLBx9MU/RnKu6hw2T7hL3H8SirYRCnW93a3oWsqcq4=;
        b=Leqqek5NSkukP97QiWsfZQ9mBqiQEbd57uMwSs0xIkSCTcGjDjwgBRgtrFV0MkI3AC
         IXiP4cqFdLstDxoqnc8u2pzdbS0OE3uTDYuT/o4ulkdkJgSOn+EiQm8npsQU0jnzoPve
         STJGPYTMA4fuXiSxFUDDApHD1/KtWLIcVECWXoyohWL0rOcyUSGNBsugp3q61EFP5nDb
         WRvaDAX076L2O+m5Rkx6DUUwigYzrIQLKdC4zi6vBysnb6DgsRoLLpdh3d3QQwO0VcwN
         0sCGj1NuGD+oBnqwU1MGxnxWaVkaf+GTbsnd02Zm8iLetyle3rRFOnR7VV5cdTjFlh9g
         g3NQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhudfkr4keF8S/vEXFiGQDU5Ywk9H/Odlf5k9z33Ld+qICgMyF830hG/rVH6UroS2pIy3v9t633oKL6FZTem1K@lists.infradead.org
X-Gm-Message-State: AOJu0YwNcetc21x7q82mzCBTF0xcYiTkiWOAa5N1dtZ8FKi6I8MR6sVW
	WI3CMIe511+12uVFEmpmiuMK4TMwqYetioW2j8U5NKagAt+Qfudl
X-Google-Smtp-Source: AGHT+IEAvEwNFxRTIOEiFD35riTRwne/MzbdGzBgbKGwTB2zttyozqFADQNfZYmsA8AsuGWxLbzgHA==
X-Received: by 2002:a05:6512:2398:b0:53c:74a7:43e1 with SMTP id 2adb3069b0e04-53c79e2f714mr10900704e87.13.1730836280887;
        Tue, 05 Nov 2024 11:51:20 -0800 (PST)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc9580bsm2249998e87.34.2024.11.05.11.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 11:51:20 -0800 (PST)
Date: Tue, 5 Nov 2024 22:51:19 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, Shoji Keita <awaittrot@shjk.jp>,
	Icenowy Zheng <icenowy@aosc.io>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH 1/2] arm64: dts: sun50i-a64-pinephone: Add AF8133J to
 PinePhone
Message-ID: <Zyp3N9pGWhLqmtq1@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, Shoji Keita <awaittrot@shjk.jp>,
	Icenowy Zheng <icenowy@aosc.io>,
	Andre Przywara <andre.przywara@arm.com>
References: <20240908214718.36316-1-andrej.skvortzov@gmail.com>
 <20240908214718.36316-2-andrej.skvortzov@gmail.com>
 <CAGb2v65Laka+YaPyAecwxEhMkoodrXnDPn+UTwZUS_wsSBMzyg@mail.gmail.com>
 <ZuazIgLz5PP_Z8Cn@skv.local>
 <CAGb2v66-saec9RcQsCTNOz_Tz4+BSFPdDd6CEA+RrGcF6kCY=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v66-saec9RcQsCTNOz_Tz4+BSFPdDd6CEA+RrGcF6kCY=A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_115123_721008_6ED7451C 
X-CRM114-Status: GOOD (  31.19  )
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

Hi Chen-Yu Tsai,

On 24-10-19 10:04, Chen-Yu Tsai wrote:
> On Sun, Sep 15, 2024 at 6:12 PM Andrey Skvortsov
> <andrej.skvortzov@gmail.com> wrote:
> >
> > Hi Chen-Yu Tsai,
> >
> > On 24-09-09 16:08, Chen-Yu Tsai wrote:
> > > On Mon, Sep 9, 2024 at 5:48 AM Andrey Skvortsov
> > > <andrej.skvortzov@gmail.com> wrote:
> > > >
> > > > From: Icenowy Zheng <icenowy@aosc.io>
> > > >
> > > > New batches of PinePhones switched the magnetometer to AF8133J from
> > > > LIS3MDL because lack of ST components.
> > > >
> > > > Both chips use the same PB1 pin, but in different modes.
> > > > LIS3MDL uses it as an gpio input to handle interrupt.
> > > > AF8133J uses it as an gpio output as a reset signal.
> > > >
> > > > It wasn't possible at runtime to enable both device tree nodes and
> > > > detect supported sensor at probe time, because both drivers try to
> > > > acquire the same gpio in different modes.
> > > >
> > > > Device tree fixup will be done in firmware without introducing new board
> > > > revision and new dts.
> > >
> > > FYI I've been working on an in-kernel prober [1] for such alternative
> > > components. This does not require firmware support.
> > >
> > > [1] https://lore.kernel.org/all/20240904090016.2841572-1-wenst@chromium.org/
> >
> > Thank you for the information.
> >
> > I've tried to use in-kernel prober from your v7 patchset [1] on top of
> > -next and it worked without any changes to firmware.
> >
> > Since there is still on-going review of your patches it looks like
> > it's to early to submit my changes for review. But I'm ready to test
> > your new patches.
> 
> FYI I'm open to either approach. If the firmware can do it, that is also
> fine. I don't know if it makes sense to have both disabled by default
> though? That would break existing users, but so would the in-kernel
> prober approach, which requires both components be marked as
> "fail-needs-probe", and also requires that the kernel driver be enabled.
> In other words, I think the firmware approach is friendlier for existing
> users that have the original batches.

Current patches leave original magnetometer enabled as before. So only
the new alternative magnetometer is disabled. Firmware prober will set
the correct status. So you are right firmware approach is a bit nicer
for existing users, nothing will change for them with any combination
of kernel and firmware. Let's go with a firmware approach with current
patches then, if nobody 

But I like your in-kernel approach as well. 
JFYI I've applied your v10 patches [1] on top of next-20241105 and retested
it with patches for magnetometer. It's available here [2]. 

1. https://lore.kernel.org/lkml/20241030072229.1013235-1-wenst@chromium.org/#t
2. https://github.com/AndreySV/linux-stable/commits/in-kernel-hwprober-magnetometer/

-- 
Best regards,
Andrey Skvortsov

