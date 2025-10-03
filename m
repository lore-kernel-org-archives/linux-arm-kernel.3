Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F187CCCD182
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 13:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHKBwm7NMk1wAiAxUu9pldFnkwOOCl4Cy9AyP1TphGA=; b=MZ+Csyla6vvF9nV4RholdqXYmO
	JLSKG7ilTtfoXgC/vOutFwbg1idVpaoz5X8kd2/rtoNFh/z7/rMYMJQAj4ufppwgoNPyaZzguBWAx
	yQrajZCRd12vead2acsTHNAGRxZWtBgzLZhS9Z1K2WU2zGAUWZTj4AJBK1dECRjygeqDXxFMMzGpT
	KEbU8qBso+oFl6o30mM7Nfd515W8Q8z5MPNBeHFhEcWtY98b/6GwNh2FD4mQNsAMYM83UJci30FmL
	XlC50chbab6RynJlC3Fb+bQf4WBD57woW+JYY/j5DhP1DllyU6ydg4yTbukV+OW2fn3r1TZ1jic3I
	79UF5qZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4ff0-0000000CNAo-006g;
	Fri, 03 Oct 2025 13:17:22 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4fex-0000000CN9S-02aT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 13:17:20 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-4de66881569so421781cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 06:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759497437; x=1760102237; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHKBwm7NMk1wAiAxUu9pldFnkwOOCl4Cy9AyP1TphGA=;
        b=cYTu5WzRV66nRbVoZkIWHZ2vvGPIZm8Y+r5K0bgwIyaW3AEEP2P+HSPm70Zi9wscjo
         dbiDNh6czP0P0eib47uPBcJWCBlhIe3YGJDULVy/p75kokxXepnAY+7WbMLmVpCWrmd6
         PYqAw2UliQogYROfXMtsySQhdclAMbWOjnPvcUmCE9tZ69Olu1P7mT/qAl6VZdaNuQGi
         FNevDgHFtJbWOIRlSyJz0rQDD+iudUkKPhzRGgduFscnIMWucjNQn3DaJHCP04yLdsmu
         UMTzMWx7itKxJEnfD89uqY1swuLRvUc6s889i0zb6DghXVgRqPDlfN6V3vr/nGEEvUfW
         hYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759497437; x=1760102237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MHKBwm7NMk1wAiAxUu9pldFnkwOOCl4Cy9AyP1TphGA=;
        b=qPubfON3X3PCRngDFnFFRKZpTP1zq5vTfEogmaii8vJnCNh/lhBK5Xwe3f7FZQlnKV
         iNJ6VcNd4Q79mNs6gDxuZVSQjH5yJAWmeS22bJxk/yHw/LcR3RwwLOQoLueWxeFUnqRo
         VFhnIFR9EcmRxQn64T0PgpR0CYTvZmGwPaJ88eqsnR3bDw4Dg0TeZbqmHSSFXAHIWa9y
         E2Ytbd+h0TQPWT3MUNX45P+lNPAiHoAm20vIqq6sSRtSFEFt7XiCzFkWVVvC3MnSZboS
         3seQspdVibCDr+w745y4ew94evAAXhND9/G0pm09kQckh1lhazxrFrRoPMA7TVy8xhBu
         ox0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWSkDrMnGhnmVqGNJ0BThgdeFhf+s45te0O2dsgMq4o5Jgp1ytd4GB4Y+lZUW8OU1xwXwUT6ZjBGpXKmrMtqaM/@lists.infradead.org
X-Gm-Message-State: AOJu0Yyn/SbqWkoJ9/7el/X0g0If8mThq5PyvguOCkJOq536U+aQK1WD
	SGRIcaM0Sen1uYeah5q/ECaE6CgTHGoBok1lQkaVIWt5tolb47fwZrVzNMz8zSeOSzXNeO6NWLY
	aqnDXf365RHc6WNo9Thla08tN1znDYrkOCvJOYFJG
X-Gm-Gg: ASbGncvzhtuILq9I42YD+ob9Y8q2JCr7K7k9LBV3N47ODOFJHVnQk+qV1pjlHB2n7iV
	m0USmO5rfcyWawtkEReIbUDaNUWqgMsje2C/1vFZbMCvAhMIIJUYry7UiQrSYXxaPmNf1vcKa2R
	GrhXbD3LAQLxxSIAIb1Za9IOZhOHlKOVlUxMI+LBELb88fw88GoEie8/Jp7lJkOeO4Pb5g+aUuk
	EUDpR2g2STMx57q7SNATagMCWpwdX4q3YzGwDLbkWbJD18OIU0Cw+zqTZ3NxlGSh28qHNyPb3ob
X-Google-Smtp-Source: AGHT+IGE7+IByknaVWxiVR31VKxGd14F277kivObfOi7gJMj93c83sqsD1zVicMJpTqN29wJP8C6PN1mQCF/t55gEto=
X-Received: by 2002:a05:622a:2cd:b0:4b3:1d1:fddd with SMTP id
 d75a77b69052e-4e576ac8af5mr5570341cf.18.1759497436448; Fri, 03 Oct 2025
 06:17:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAFgf54oYjUEg9KkQUzneYTZH1Z8cX56va5M0853eWPFaYT+Z2A@mail.gmail.com>
 <638b9565b90714f56caa9535b7b9b96cd86100d6.camel@collabora.com> <aNaq72xKS4QaNjwx@google.com>
In-Reply-To: <aNaq72xKS4QaNjwx@google.com>
From: Mostafa Saleh <smostafa@google.com>
Date: Fri, 3 Oct 2025 14:17:05 +0100
X-Gm-Features: AS18NWAzGDKh7rPw80AiVMNesJmz-wqevOZz6iqXp8GuPpGGv1cVAqCeWYGrVWI
Message-ID: <CAFgf54r=0T=AbSm4BVOf6+8mHRxOPje+zSbfZbwb8d6u46HPyw@mail.gmail.com>
Subject: Re: Support for Rock PI-4b
To: Sjoerd Simons <sjoerd@collabora.com>
Cc: devicetree@vger.kernel.org, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, linux-rockchip@lists.infradead.org, 
	open list <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_061719_065065_CF408F6F 
X-CRM114-Status: GOOD (  34.32  )
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

On Fri, Sep 26, 2025 at 4:02=E2=80=AFPM Mostafa Saleh <smostafa@google.com>=
 wrote:
>
> On Fri, Sep 26, 2025 at 04:28:48PM +0200, Sjoerd Simons wrote:
> > On Fri, 2025-09-26 at 15:07 +0100, Mostafa Saleh wrote:
> > > Hi,
> > >
> > > I am trying to run Linux[1] on my Rock PI-4b, which I see is supporte=
d in
> > > the kernel in =E2=80=9Crk3399-rock-pi-4b.dts=E2=80=9D.
> > >
> > > However, compiling =E2=80=9Cdefconfig=E2=80=9D (ARM64) and flashing m=
y Image doesn=E2=80=99t
> > > work,
> > > It just hangs before any console (even with earlycon), I tried to als=
o use
> > > some of the vendor configs with no luck.
> > > I did some research and found that [2], which indicates that the upst=
ream
> > > support has been broken for some years?
> >
> > We've got the Rock 4b in our automated testing lab as part of kernelci =
and other
> > efforts. Upstream works just fine on those boards, so it's likely an is=
sue in
> > your setup.
> >
> > See e.g https://lava.collabora.dev/scheduler/job/19978558#L525 for a re=
cent
> > upstream kernel boot.
>
> Thanks a lot for the quick response!
>
> I can see some differences between this log and my setup.
>
> 1- My uboot seems ancient
>    U-Boot 2017.09-00026-g2431fa34678 Compared to U-Boot 2024.07-rc4
>
> 2- The board model in this log is not 4b as mine
>    Model: Radxa ROCK Pi 4A while mine shows Model: Radxa ROCK Pi 4B
>
> 3- I am using LLVM not GCC (I don't think that matters though)
>
> 4- I am using MMC to boot and not TFTP
>
> I will try to look more into the differences, and update this thread in
> case I was successful.
>

Update on this, in case someone have the same issue.

After updating u-boot the same issue persisted.
However, I was able to boot with eMMC instead of an SD card.
Which is strange, as I could boot an older kernel on an SD card with no pro=
blem.

Thanks,
Mostafa

> Thanks,
> Mostafa
>
> >
> > Regards,
> >   Sjoerd
> >
> >
> > >
> > > Has anyone tried to flash a recent kernel successfully on it? or any
> > > tips are greatly appreciated.
> > > Otherwise, maybe it can be removed to avoid misleading other develope=
rs
> > > (I got this board to do some upstream kernel development on)
> > >
> > > [1] base: 4ff71af020ae59ae2d83b174646fc2ad9fcd4dc4
> > > [2] https://wiki.radxa.com/Rockpi4/dev/kernel-mainline
> > >
> > > Thanks,
> > > Mostafa
> > >
> > > _______________________________________________
> > > Linux-rockchip mailing list
> > > Linux-rockchip@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-rockchip

