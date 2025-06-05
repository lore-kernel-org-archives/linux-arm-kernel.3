Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C838C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 14:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1Aw1oATIRI4U6r0tJJxa/pTsMT8z1zs/O7llSWlNeU=; b=dBFWRRVijtoS+n28S3tRS4CMOx
	7pvJPpXh2+F+AyOkDPLK07/VrWpGI7cWWt8Z0yCh7oi5I1nSHH8anNYgWtUdAHg9V4iaK1tRot3/1
	9BlB8S+j9S9zI8Fu6LGC8piSu/2KO1StydYMoh2zXBYaPDybRxO/Y6cboLlApnwJfasuBOB50YtAS
	+Cp51SBKkaLFTStfOzsW++NQ1tp4DxUXpB+eo/wHccuJCZVaiLNGoPzWKQWajwqvn+1cGEtR0ZXn/
	aXW+u65QqSZzv5JWVDDnPlGzlIZp2NIdJp8wgNYp+Uv4refxkSl1lGQq2I5Ey7T2x8UHfPfl68hUq
	tJULr19w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNBHE-0000000Fjgd-1zVK;
	Thu, 05 Jun 2025 14:09:04 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNArn-0000000FgJN-3tky;
	Thu, 05 Jun 2025 13:42:49 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4a4bb155eb1so10364681cf.1;
        Thu, 05 Jun 2025 06:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749130966; x=1749735766; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1Aw1oATIRI4U6r0tJJxa/pTsMT8z1zs/O7llSWlNeU=;
        b=nTj0X2RhLDU7vnpfXjXQFlthSIDDh55r+tVVSU2PfFeTgtvMQ5FTumQ4+nhTMwEaGv
         JZ4+8wCoxCvPjUXAbThxWARUfwJ9sOIFi8MKFSYooB3XuwhScX9N72o9ev6y0fHD4r9L
         7zzr4/4Qp6IQ75ei5wclnjawL0is9sNS/KML4kZ1/SJpaNLYEDhIKFO01DatwIkiKjp3
         fbGQv4I0rQCc1e7LWGrW496kur4TJGjPmZm50Pfsb+1DCP1m3E94tFRuXhGPDfNZKPH1
         xGUOhZ+8hlmwqHyMEx4VmtIOh2XP/yGtFZoh9J5QCi4n6FqACwBcbVl4MnLGkLEHWZpR
         K9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749130966; x=1749735766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1Aw1oATIRI4U6r0tJJxa/pTsMT8z1zs/O7llSWlNeU=;
        b=kRX0yYR/Toj96W6CYn6bTBimYeVOZw2Ip+lzZJE+jXo8ogDmmi7xIv67E6uvhOHQvS
         2Xrji41DFrEZgLvCOd5SP/l3ODRFkijm5iPx/WWi14a+aZFXrySftxTwGuwx6f5BdtWZ
         iUWkohldvHh3VfUv0XStLB4Vi7XKUrmEiGO7sSCpkpdEVBM5slxmcRhAvLVSNmY6qct3
         ZwR84ltPc+x2co+jorHE24LC88CiL/mSa3quk66fmOMowJEQc6jcAlOOawBOu/ii/4wm
         Bh4SIegnpPjZL0faFyOqFtoWGMhNoDz3zcU5Y4g/IW0fwvE1PFlq62AJDABul2GmjGlM
         TTtw==
X-Forwarded-Encrypted: i=1; AJvYcCUGaDv5WJkQJx4dTjoAG8xuRgardE3KJrzVOwktD/95p4Ymqaq2Q3Hx3JSQEPgke9IRSHyMKOiYsgXqv6Gcy4ht@lists.infradead.org, AJvYcCUaoA5mqY5VyijEUO4GqUUFENFViwtsDWc5DlOJV9hO/Cxs5dGHMtdHlL7elikCeEGdlTUgby0keF9vcJpt8WU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyOGEYH/zYGAZrpU6jFPIw8xEyKeuZUFNVCbQULJYOqXR3woBW+
	4HHXphlGeqZOO8quCQzcHwZunhBHguLddcL2197hwoOlONu/4ZdaNMQerxVPhz0dvp9ynERh5hW
	GxFl+4xVfr0hZrlPpmvORyQcRdpzoFSk=
X-Gm-Gg: ASbGncvdNLMrD+ZAY2+KbXaI2XomDNRl+TuFx94QwESAHUMzJA9mEbagYiD3XvIADd/
	4akqJazs0tfhmaZioXcidMiyVT/BsCCtFhD6n5s6gb10tyHzQDKzKNmFZCjIQ7pLZscI3tXCMnG
	pFsWAMv7JdEiEXvgYIeee5KtmT8qAujp6QWq4IME9ISud2
X-Google-Smtp-Source: AGHT+IG0MMWP+x7U8tsJQ6YRTMkTZzqpNjJO/whvvcK/0u3aHGtE8WDWz1uwITy8x/Dviq7md8X536qbBtEfOUabryE=
X-Received: by 2002:a05:622a:8ca:b0:494:b2db:eeca with SMTP id
 d75a77b69052e-4a5a585f3ecmr94610721cf.26.1749130966422; Thu, 05 Jun 2025
 06:42:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <20250603-sige5-updates-v1-1-717e8ce4ab77@gmail.com> <6656934.DvuYhMxLoT@workhorse>
 <CABjd4Yx05SCm+03jWbsEP-A5AuhL14wLj=+VdKyQgqMbnxi3xQ@mail.gmail.com> <512E950E-E8CB-443B-8E47-79F073D217E8@gmail.com>
In-Reply-To: <512E950E-E8CB-443B-8E47-79F073D217E8@gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 5 Jun 2025 17:42:38 +0400
X-Gm-Features: AX0GCFsTzLQL93s6ofhHt9HSu3m-CxEmKHnPQLzRarGwazT_7OOgybpDR17U5os
Message-ID: <CABjd4YxGQP=rH15EX12w36b7+82Dedf+rVH3v5V6gBwNv3V3iw@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_064247_972035_F37F11E6 
X-CRM114-Status: GOOD (  34.89  )
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

On Thu, Jun 5, 2025 at 5:22=E2=80=AFPM Piotr Oniszczuk
<piotr.oniszczuk@gmail.com> wrote:
>
>
>
> > Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchark@gmail.com> w=
 dniu 4 cze 2025, o godz. 21:12:
> >
> > On Wed, Jun 4, 2025 at 10:38=E2=80=AFPM Nicolas Frattaroli
> > <nicolas.frattaroli@collabora.com> wrote:
> >>
> >>
> >
> > Frequencies are fine, but I don't think the more power hungry big CPU
> > cluster gets any voltage scaling without it. Once I try to load the
> > system enough that the governor decides to bump the big cluster
> > frequency up, the regulator stays at 850000 microvolts, causing random
> > reboots when the whole cluster starts starving. With the patch,
> > voltage oscillates between 700000-737000 microvolts in idle and jumps
> > up to 950000 under load, and the system seems stable.
> >
> > Here's what I used to monitor the voltage (there must be a better way
> > to do it, but it works):
> > sige5 ~ # watch cat `grep -r . /sys/class/regulator/*/name | grep
> > vdd_cpu_big_s0 | sed -e 's/name.*//'`/microvolts
> >
> > And in another terminal:
> > sige5 ~ # stress-ng -c8
>
> Alexey,
> I see you are using rk3576 board like me (nanopi-m5)
> Have you on your board correctly working cpu dvfs?
> I mean: [1][desired clocks reported by kernel sysfs are in pair with [2[]=
cur clocks?
> In my case i see mine cpu lives totally on it=E2=80=99s own with dvfs:

Hi Piotr,

I haven't tried to validate actual running frequencies vs. requested
frequencies, but subjective performance and power consumption seem to
be in line with what I expect.

Big thing to note here is that on Rockchip the kernel does not really
set the CPU frequency directly. It only issues an SCMI request to the
ATF firmware with the desired target frequency and provides sufficient
voltage via the supply regulator as defined by the respective OPP.

What the ATF firmware (running on a dedicated MCU completely separate
from the OS) then does is it takes the desired target frequency,
matches it to a loop length for the PVTPLL block via an internal
lookup table, and PVTPLL then determines the stable frequency that
this particular chip specimen can run at with the provided loop length
and voltage. This frequency then gets applied to the hardware via the
CRU - and as you can imagine, it can well differ from what the kernel
was requesting via SCMI.

> Requested is [1]
> Running is [2]
> Measured is [3]
>
> random read 1:
> Requested CPU4: 408 MHz
> Requested CPU0: 408 MHz
> Running CPU4: 1800 MHz
> Running CPU0: 1416 MHz
> Measured on HW: 1579.03 MHz

Hmm, have you tried pinning a particular frequency on each of the
clusters, so that the governor doesn't change it while you are going
from the point where you read the "requested" frequency to "running"
and "measured"? Also I think it would be a good idea to "taskset" the
measuring thread to particular CPU cores - otherwise I'm not sure what
it shows when the scheduler can bounce the process between cores as it
pleases it.

> random read 2:
> Requested CPU4: 1608 MHz
> Requested CPU0: 408 MHz
> Running CPU4: 2016 MHz
> Running CPU0: 1800 MHz
> Measured on HW: 410.33 MHz
>
> random read 3:
> Requested CPU4: 600 MHz
> Requested CPU0: 1800 MHz
> Running CPU4: 816 MHz
> Running CPU0: 1008 MHz
> Measured on HW: 2275.07 MHz
>
> random read 4:
> Requested CPU4: 1608 MHz
> Requested CPU0: 1200 MHz
> Running CPU4: 816 MHz
> Running CPU0: 816 MHz
> Measured on HW: 2114.58 MHz
>
> this is on rk3576
> on i.e allwinner h618 or rk3588 all looks quite normal - [1] and [2] are =
equal...

Are these taken on the mainline kernel or Rockchip one? Binary BL31
from Rockchip or opensource TF-A? With big-core CPUs linked up to
their supply regulator (as per this patch) or without?

Can't see why the behavior would differ vs. RK3588 though, unless
there are some bugs somewhere.

Best regards,
Alexey

