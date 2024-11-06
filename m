Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528BFD3E783
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 02:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tVfMiN/1G4bL7S20Au2tc2qwX+CMUgs+LUTAdwJcbZw=; b=u8KMTkOTlpYyee
	U2vxTcIEmYh4xSxgiAdF6sdviJzPh7k7IFkQ8CWL8nwhFqnwYI9PR6fhaiYHydgni3QeEvPiOcQ4U
	k0bUPM66lo2ym8BgKN2woiKzch5YJyXQMiCpdLxUfEsiBsmj9Tfz1crBIO4v36ocDvivFLwq6CaYD
	FvYCxSWjubIUVXWdpkOtdIXd8EX9uoIAD8FgqQQVk6y3MTJNRwCsUizzbND+qPJZCe1oJgoSyRXnb
	MJNQF8EgQQtyteVaXh5bvM30Sfzk6OTfZpBDlMd5EA1V5xaCMe12efigJmdh+tw+8UuakwStCFMPK
	WnthgCPa91ZOtjBFSHFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Vra-00000001UyG-47hU;
	Wed, 06 Nov 2024 02:33:43 +0000
Received: from mail-lj1-f173.google.com ([209.85.208.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Vpp-00000001UJY-3BIq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 02:31:55 +0000
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fb498a92f6so54691881fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 18:31:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730860311; x=1731465111;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tVfMiN/1G4bL7S20Au2tc2qwX+CMUgs+LUTAdwJcbZw=;
        b=WMatMeUCnEJG0DH5C6bxwWodYocgAaSL9+5vvcKj2Iui2VoEH+WlJOpeVhwtSaRhT/
         OmKmqOuwBC9eL/ucrAxURlrZZeNg8IG94ijFuiCkqN5UCLKZlSn0IioW0PYJHjUkx1Pr
         k+tlGGZ5JXvae0apEDylfr/G65+I6HNkaCweM3/tzmovULHZhY43/c08mt/roJGtNX+c
         VZg9kwc0rziqaSTbUSLO4qrxUIBCGdGw4MSNIl8VnWVT26tK7rIh1/O1av4bqqLqgSYj
         gw0+Tmkhy5lqzRLWRpEeoBFg+VmpmbCeFk4pCMdz09B8+RPo63pDrVVD99LT89Lg/Qf+
         NFXw==
X-Forwarded-Encrypted: i=1; AJvYcCXYVlUtcifwwTQMMSiUZNQj7gCB7Z1nv9j2RRev5HMBy7XgwQkKDrA4JZaIDt02FCRhd1OPCFjJosnBF7nEjt7c@lists.infradead.org
X-Gm-Message-State: AOJu0YxJU8KR6FWDmOfHZhhGlG4DYuJ8uO/K3JvupL0m34sSbDXW6vAQ
	JtqnXUfDEF5J1zccZPb8de4tDx3YPOhftesWRVBqPCIhYcTQXessfIxJA171
X-Google-Smtp-Source: AGHT+IFCkVoeszUYaD+ubmxn2iXJEoag7aSauiXZ+G3gihP1RZiVH3QB7Vt/oOBHyMmayVNlZoI1mA==
X-Received: by 2002:a05:651c:1541:b0:2fb:5bb8:7c23 with SMTP id 38308e7fff4ca-2fcbe005e2dmr185313841fa.26.1730860310415;
        Tue, 05 Nov 2024 18:31:50 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef3aec91sm23331631fa.7.2024.11.05.18.31.49
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 18:31:50 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fb443746b8so54883381fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 18:31:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUpTxFdr4k6NnAtOHSdckaxRo2GTiAwkAqNGK7PW3CVHb8DNXnwoot0wUH/bwEbgVKwxbMYXEO/iGF48W2JdUZQ@lists.infradead.org
X-Received: by 2002:a2e:be21:0:b0:2f4:3de7:ac4c with SMTP id
 38308e7fff4ca-2fcbdf68626mr221087231fa.8.1730860309696; Tue, 05 Nov 2024
 18:31:49 -0800 (PST)
MIME-Version: 1.0
References: <20240908214718.36316-1-andrej.skvortzov@gmail.com>
 <20240908214718.36316-2-andrej.skvortzov@gmail.com> <CAGb2v65Laka+YaPyAecwxEhMkoodrXnDPn+UTwZUS_wsSBMzyg@mail.gmail.com>
 <ZuazIgLz5PP_Z8Cn@skv.local> <CAGb2v66-saec9RcQsCTNOz_Tz4+BSFPdDd6CEA+RrGcF6kCY=A@mail.gmail.com>
 <Zyp3N9pGWhLqmtq1@skv.local>
In-Reply-To: <Zyp3N9pGWhLqmtq1@skv.local>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 6 Nov 2024 10:31:35 +0800
X-Gmail-Original-Message-ID: <CAGb2v66DgOmfm0U_dm-+=3nEXaZWUMZiajCdkqVJ6vUPvGC8tQ@mail.gmail.com>
Message-ID: <CAGb2v66DgOmfm0U_dm-+=3nEXaZWUMZiajCdkqVJ6vUPvGC8tQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: sun50i-a64-pinephone: Add AF8133J to PinePhone
To: Andrey Skvortsov <andrej.skvortzov@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Shoji Keita <awaittrot@shjk.jp>, 
	Icenowy Zheng <icenowy@aosc.io>, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_183153_839583_ED5F36FA 
X-CRM114-Status: GOOD (  33.32  )
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

On Wed, Nov 6, 2024 at 3:51=E2=80=AFAM Andrey Skvortsov
<andrej.skvortzov@gmail.com> wrote:
>
> Hi Chen-Yu Tsai,
>
> On 24-10-19 10:04, Chen-Yu Tsai wrote:
> > On Sun, Sep 15, 2024 at 6:12=E2=80=AFPM Andrey Skvortsov
> > <andrej.skvortzov@gmail.com> wrote:
> > >
> > > Hi Chen-Yu Tsai,
> > >
> > > On 24-09-09 16:08, Chen-Yu Tsai wrote:
> > > > On Mon, Sep 9, 2024 at 5:48=E2=80=AFAM Andrey Skvortsov
> > > > <andrej.skvortzov@gmail.com> wrote:
> > > > >
> > > > > From: Icenowy Zheng <icenowy@aosc.io>
> > > > >
> > > > > New batches of PinePhones switched the magnetometer to AF8133J fr=
om
> > > > > LIS3MDL because lack of ST components.
> > > > >
> > > > > Both chips use the same PB1 pin, but in different modes.
> > > > > LIS3MDL uses it as an gpio input to handle interrupt.
> > > > > AF8133J uses it as an gpio output as a reset signal.
> > > > >
> > > > > It wasn't possible at runtime to enable both device tree nodes an=
d
> > > > > detect supported sensor at probe time, because both drivers try t=
o
> > > > > acquire the same gpio in different modes.
> > > > >
> > > > > Device tree fixup will be done in firmware without introducing ne=
w board
> > > > > revision and new dts.
> > > >
> > > > FYI I've been working on an in-kernel prober [1] for such alternati=
ve
> > > > components. This does not require firmware support.
> > > >
> > > > [1] https://lore.kernel.org/all/20240904090016.2841572-1-wenst@chro=
mium.org/
> > >
> > > Thank you for the information.
> > >
> > > I've tried to use in-kernel prober from your v7 patchset [1] on top o=
f
> > > -next and it worked without any changes to firmware.
> > >
> > > Since there is still on-going review of your patches it looks like
> > > it's to early to submit my changes for review. But I'm ready to test
> > > your new patches.
> >
> > FYI I'm open to either approach. If the firmware can do it, that is als=
o
> > fine. I don't know if it makes sense to have both disabled by default
> > though? That would break existing users, but so would the in-kernel
> > prober approach, which requires both components be marked as
> > "fail-needs-probe", and also requires that the kernel driver be enabled=
.
> > In other words, I think the firmware approach is friendlier for existin=
g
> > users that have the original batches.
>
> Current patches leave original magnetometer enabled as before. So only
> the new alternative magnetometer is disabled. Firmware prober will set
> the correct status. So you are right firmware approach is a bit nicer
> for existing users, nothing will change for them with any combination
> of kernel and firmware. Let's go with a firmware approach with current
> patches then, if nobody

If?

I'll wait a day before applying this patch then.

ChenYu

> But I like your in-kernel approach as well.
> JFYI I've applied your v10 patches [1] on top of next-20241105 and retest=
ed
> it with patches for magnetometer. It's available here [2].
>
> 1. https://lore.kernel.org/lkml/20241030072229.1013235-1-wenst@chromium.o=
rg/#t
> 2. https://github.com/AndreySV/linux-stable/commits/in-kernel-hwprober-ma=
gnetometer/
>
> --
> Best regards,
> Andrey Skvortsov

