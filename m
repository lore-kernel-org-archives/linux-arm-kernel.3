Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CD2C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 17:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oGxJ52G0965+naj8sthJZ/JUdTvHZgUdBTpUQ5K5ulc=; b=DptakIrLBcNcV0C+Aso1sGbkNa
	OUezqEThPD3lRKIsU5iUY/YDEI94I3dEermsShcIWq0We2iFt+1EMOPXyY66gZdcQ3Ch6fHsA6ARh
	Tkz4Sb/AYnB0FOLvoxAxNPVBSASWKFcvX2/B3KOmANKJittPl1rjgeKOi3zWbI9kNWkLKfuNiEQ2V
	3znKtCw0vEIc9gjM2keV5/sEiY7hNloVksWCAmNUoVHGEOyQ+AYlfFQIsVsBP6qwF1HiaoRo4NhRn
	T3Us+rqkb6kxd+ClCDG6+WG6YIOveq+pMV4NDuYDYjbeT6rQrK56dL2iXd/iCcmlmzVzCCbHYTIHR
	KYSiBImg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuZfF-00000001L0N-1rUB;
	Thu, 13 Aug 2026 17:56:25 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuZfC-00000001KzF-1MOl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 17:56:24 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2cede6375caso9875ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 10:56:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786643781; cv=none;
        d=google.com; s=arc-20260327;
        b=My2TOvWtv2WUGHtttC95zqn3ZseC6rurIalSFCnMsslBUZwfICRVbHs7Neb8k8Bner
         LRNpi165bKe0MsNnWk2+xCx6hG8yZwSplyZyTZmyYIkNo1PpY0y4gXjdcmw0UY+ud2HB
         /5g+hytqUFH5Qt5Rq3aT26LT8dYov8CYkOI4u0R/TEdtsEYHpxIwd5KVU56LZeyK/n8p
         z/GBKKpxjtMXpHFCi5GrVqrZrC+25ry7CDMyhI/1KJMECEJDWe1akJbIOd78Vqb8s+3L
         HrBbM2RHrNqYMvT4Huop09mbCkvtus/E26w00wRRQaK5qG2VVYkNqX8qZe65hEzPR9Jk
         7Dhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oGxJ52G0965+naj8sthJZ/JUdTvHZgUdBTpUQ5K5ulc=;
        fh=xJonNqKfheFnn4oVVDthEmP/8nTaLPkw+JsqrG6iIQY=;
        b=AL0jcfs8MwnimHemDroOe2iwD/VG3+h6i0e3k/KrH6L4x4dBdLNeTkw/TLABpsCbMm
         Wxl1MPKd2BkqZJzsw07eZjSgjuzQuxOoj0mF9Gz4IRfL7FhEk+i1YPYXgEzIMlRPRFDy
         3rM3JGLyYVq/qjekA+WaJ0FvomJ3mtBejKXslTyYqSrTu8rRNCiqjZunNTqo0Shi673e
         hi3DcvaYvs32KD9+LvmLfwDWwTU9yS4b0MacdMuhUkn3erfGJGxT8tG5zJdhZrJZJ0iE
         nUtddDY1a306i3Wns0S5S7JAaOzIECI73owwqttGrU3vvvwKG0BttkuESkfLzleHBuhm
         vEAA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786643781; x=1787248581; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oGxJ52G0965+naj8sthJZ/JUdTvHZgUdBTpUQ5K5ulc=;
        b=FErc6NRXvU74wh5sBeKkaQg4cd6igR6vfCqCNuo5ZNMpVPLOaADuVHNswSr+h2kQYa
         BcxDFTfnnBqjOORILxNwVeJzHfqYq4IrY5ngXCpNQDlhcjwg61YWEOPJp25mNZIVactg
         ZgK+Gk7WezYDD3xQJVqfVweEiYx5ovkAwN4P35f8/YaGmR+WCXThU/hN/kzIxiAh1gDm
         vTPvXn35cMryc9Vr0k6kxl19Z5dB0RxEMg9vPHd32bD0+stSB+cYvxnYw/IeosKj2sxV
         RzX0KWTvO3uPlPKwmxr9c84P+/cWqs7c+Pmp1wLvtt+j9clPPQKB2AKKB9bhmhfULmjh
         mCHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786643781; x=1787248581;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oGxJ52G0965+naj8sthJZ/JUdTvHZgUdBTpUQ5K5ulc=;
        b=m+4DTv2iULYfjZwRlIhbQZy3nHOBBVpDB1UXXxxrEXoEhfjkJDd7el95baCA2SaJ9j
         15K7jskNtAjN5iXFimnp9H3KXo4yEBP5gk5fFy1LaAbUFQ+g1GMd5cXd8rpzZNVfodGw
         dKWTs03AuwA6vL0ib/9eapePTMaJ5hPFcSbyE7xoaa6GBQKl7whRrQeQB0wr3en4AysP
         0PpjfRTjohBeSAUcIRyc5tRv8k14Rbdzn04MaIWpzyNY6TDrQ1Za1WP/Zc8X7ylKOIMy
         c64CW9+F7CFC7CUymO5SxsHdylC+O3JHjKCa+PkZ0LbmMwUlmFpYfaqgwmf4Oyxr7jbU
         F5LA==
X-Forwarded-Encrypted: i=1; AHgh+RqkV95GfrLHwmV9/jNNijhKcV8OkPLNpi4CYlJtDGM0J0J3ODoXRC+jw9+wi4o4QFgqTcxjg24YNF7dS4vpMuNi@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5uy4BmDjCa2o2UiTUV7olntZGdg4j2j2zL8YWaRO2fbeicf6K
	euZaXp861+sOEGT6AMUBWS8ER0vlNP/BrRx+9v7LaK8nHj6Z0QpC3noNRem/wO0sw9oDoavn6Sn
	5RXwHl/nwkFO5FpMR86coyoYtV51AF7Hsi/67jLIZ
X-Gm-Gg: AR+sD11zo2m7zQ7eVeotZfUl1Uo2/9m5b2u+q0EKNB8aWGmGDxbvtQO9+bOhj0yvPuk
	jFEpHTgUZNCnYsklwZIA/np/W0Igo1IcX7Sw8r8MZbz2MnlW8/rxulnp0zd35jnDd3tkigTDFqS
	jroyWW3Gh6F+sj3L+ECY9zrNTcsu7WT5fuAsYigo7aA9uxEZh+PkJHf5WSMzLuvPFGpZhJ1RH24
	PeSo1y4UUVTIQI8ArWDLLLvqzEO0xmkwWsl/NjQzLE6FzwztJQOGeWNMXbAARgP+BjX3s/nESGn
	3Dfzsb8nBJE7FX5f+rlRoqkPWJTjI8wz8UQzDEwXt4dEkA==
X-Received: by 2002:a17:903:22cb:b0:2c0:defb:557e with SMTP id
 d9443c01a7336-2d3af569557mr618275ad.1.1786643780745; Thu, 13 Aug 2026
 10:56:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260812002728.2283079-1-irogers@google.com> <20260812052417.2361040-1-irogers@google.com>
 <anwuYYxLFbtDmmHx@willie-the-truck> <CALeDE9P1xZonVnZDExR_hMafd4mxahkjBVTDLJenQ6DKW5MSHA@mail.gmail.com>
 <CAP-5=fXd2HETe-484Pe5wMTGPiXbLheMaW6ZDpdD+YCtKoBHVg@mail.gmail.com> <4fc52c7d-85eb-40ec-9e90-2a20f194c64f@broadcom.com>
In-Reply-To: <4fc52c7d-85eb-40ec-9e90-2a20f194c64f@broadcom.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 13 Aug 2026 10:56:06 -0700
X-Gm-Features: AUfX_mwatuYIj4f9Cb7rMpohs4H2M2BSR-5YKqD8oWMTtc2hMKt-hXpbQb43pAE
Message-ID: <CAP-5=fU1y=NqqpRWTDyhvr1KEBnGNA8=b9XQvJLVie1AF-Ke0w@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] perf: Add Raspberry Pi AXI PMU driver
To: Florian Fainelli <florian.fainelli@broadcom.com>, Peter Robinson <pbrobinson@gmail.com>
Cc: linux-perf-users@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_105622_424185_54439954 
X-CRM114-Status: GOOD (  46.26  )
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

On Thu, Aug 13, 2026 at 9:34=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 8/13/26 06:48, Ian Rogers wrote:
> > On Thu, Aug 13, 2026 at 2:08=E2=80=AFAM Peter Robinson <pbrobinson@gmai=
l.com> wrote:
> >>
> >> On Wed, 12 Aug 2026 at 09:28, Will Deacon <will@kernel.org> wrote:
> >>>
> >>> On Tue, Aug 11, 2026 at 10:24:15PM -0700, Ian Rogers wrote:
> >>>> This patch series adds an uncore Performance Monitoring Unit (PMU) d=
river
> >>>> for Broadcom AXI system and VideoCore VPU performance monitors found=
 on
> >>>> Raspberry Pi SoCs (BCM2835 through BCM2712 / Raspberry Pi 1 through =
5).
> >>>
> >>> Why are you sending four versions of this patch series, at -rc7, each=
 in
> >>> reply to the previous one? Nobody is going to review that.
> >>
> >> I'm also wondering why this is called rpi_axi_pmu where it very much
> >> looks like Broadcom IP, and is possibly used in other Broadcom SoCs,
> >> Florian can you confirm what this driver should be called?
> >
> > I'm somewhat agnostic regarding the naming, and having a more general
> > driver strikes me as a good thing. Fwiw, I based the name on a
> > somewhat similarly named non-perf-compliant driver:
> > https://github.com/raspberrypi/linux/blob/rpi-6.18.y/drivers/perf/raspb=
errypi_axi_monitor.c
>
> Given this uses the Raspberry Pi firmware interface, having
> rpi/rasbperrypi in the name is sensible IMHO, but the IP is technically
> from Broadcom AFAICT, so using a bcm2835 prefix wouldn't be far off.
>
> Ian, I am really having a hard time following all of your frequent
> submissions, would you mind waiting for feedback before spinning new
> versions?

Hi Florian,

I'm very happy someone from Broadcom is engaging with my driver :-) So
on linux-perf-users the norm is to address Sashiko's feedback, and
once that is down to an effective zero for humans to come in. For the
majority of the patches what Sashiko is complaining about are races
during teardown, potential hot plugging races, etc. Note that this
driver is more advanced than ARM's main PMU driver because it supports
hot plugging, thereby not breaking the perf tool were someone to hot
plug a CPU. Anyway, between versions, things are about 98% the same
and I explain the differences in the cover letter. For the v11 patches
Sashiko has 1 medium issue left regarding hot plugging:
https://sashiko.dev/#/patchset/20260813142608.2954099-1-irogers%40google.co=
m
This is a substantial reduction from the v1 patch that had 13 issues
with 1 being critical:
https://sashiko.dev/#/patchset/20260811083828.2057695-1-irogers%40google.co=
m
For the v11 review, since the boot CPU and the CPU hosting the PMU are
both CPU 0 and I don't believe it is hot-pluggable, this issue doesn't
really matter. However, having a robust driver in all respects is
still desirable, and I plan to address the feedback. I need to spend
most of today not having fun at the hospital, so I can hold off fixing
this and sending out a v12. My point is that v11 and v12 would be 98%
the same but v12 would likely include an "if" statement to address
Sashiko's feedback: "Does this early return leave the PMU permanently
bound to an offline CPU if a hotplug event occurs during probe?". I
suspect your review wouldn't focus on hot plugging races, I am much
more concerned that the counter reading logic is valid.

I'm on some sick leave and this work isn't part of my job. I am trying
to finish it before someone might misconstrue my sending Raspberry Pi
patches as me thinking this is a part of my job. While the mailing
list you are coming from may experience low volume, it is much more
the norm on linux-perf-users
(https://lore.kernel.org/linux-perf-users/), where I am a significant
contributor and Linux MAINTAINERS file reviewer. I do my best to avoid
Sashiko catching issues (bisect builds, hardware testing, scrutinizing
code, Chris Mason's review prompt analysis and local Sashiko runs) but
I think with the way models are the churn is something of a feature of
the moment. I expect that when the next level of AI agents (which I'm
using to assist in writing the code) emerges, the number of versions
and churn will reduce dramatically. I don't think we should ignore
Sashiko's points, and my own time constraints mean I want to send
things out ASAP in order for there to be the best driver I can see to
on the mailing list. Suggesting a week-long reply delay is so silly
that I was amazed it was made in this thread. I can only apologize for
the distress receiving an email is causing people. Please print out my
picture and abuse it. Come to Linux Plumbers in Prague and use one of
the 3 talks I'm giving as an opportunity to throw a microphone at the
back of my head and never issue an apology (fwiw, this happened to me
while hosting a perf related mini conference at LPC in Vienna and so
the abuse isn't just verbal).

Wrt will the code be merged, etc. You can bring a horse to water but
you can't make it drink. I believe there is significant enthusiasm for
the driver:
https://www.phoronix.com/news/Raspberry-Pi-AXI-PMU-Linux
But the number 1 refurbished laptop is a MacBook M1, which one would
think is an excellent candidate to run Linux, yet its PMU driver
appears to have little maintainer effort applied to help it land:
https://lore.kernel.org/linux-perf-users/20260101-apple-cpmu-v10-0-48812c52=
9ffc@gmail.com/
Everyone is busy and I hope to be respectful of that, but this is work
I'm giving away for free that I genuinely think will improve things.
If you want to read the patch or email tomorrow I don't mind, it is
just an email. If you hate me and want all my emails in /dev/null,
that's your choice. Maybe the patch only ever ends up in the Raspberry
Pi's flavor of Linux, that's fine with me. Maybe it is just a driver
people have to pull from an email thread like for the Apple M1. I'm
genuinely trying to be helpful while doing my best to smile at the
"you don't know how to use email" and whitespace vigilantes*. I do try
to privately escalate issues with more senior members of the Linux
community when I think the goodness of Linux for users is being
impacted, such as drivers for popular hardware being ignored. I can
only do my best, but people I work with avoid engaging with LKML and
the "reviews" so far on this patch series are a good example of why.

Thanks,
Ian

* If you are upset by whitespace, why not add it to the Chris Mason
review prompts that Sashiko builds from and automate the process (you
can see my PRs doing similar things for things like musl libc):
https://github.com/masoncl/review-prompts/tree/main/kernel

> Thanks!

> --
> Florian

