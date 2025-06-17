Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6AD2C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 17:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VYJnE0bLpXfGXAhOdoPj9sjJfon5avZzMzwtb4GEZQ8=; b=p4rDk4q/gVsGX4ha/lOwW9/vmx
	91US6L+6ChmcWfjlxCTiw5h5GocacjwAnzXTq9apMDJlQZelnhK0vlf+aarv8ShME2k+QJk0AClhH
	/4CHCVuQo05rHK934HyPNAx8qUatCjdzz31DufzydpSoYUSidiDG29PJwctbsGYBhLSlP4wLHWkR4
	RHywgN1TFm4HhSFmngOSet6V5jqiUc1xSLrBthqScCBrF4I6kdxBRMuwYrykHd7zy5v63Ax4+rqRF
	gH1kyRDzkuErupZ9QRmRcHnkiGNEFM5UWUTnPhrkRAomvFnLw3z9dUkN9+RqV8tzKRsMgbElk96Jk
	GN/PRnAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZu5-000000081my-0KU5;
	Tue, 17 Jun 2025 17:15:21 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZZM-00000007vt4-2C20
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 16:53:57 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3de210e6076so3185ab.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 09:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750179236; x=1750784036; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYJnE0bLpXfGXAhOdoPj9sjJfon5avZzMzwtb4GEZQ8=;
        b=jo/qBEMW9Z4IT5LUTNjzrNenUToXpddK/YbUwQUdYiWSUe3ftSo1mTwmUVikiYhTJB
         SQgOc+vvksEPX6O8Cqtb2YVfNquIIV69GvBmybzFX6+W0etV508qKw2L8sgaUe8Qvtm5
         ugvoDPzbI/pQRQlj0/vQZ/HnBwDI9MFJgavS90dvpD9ELzcjFeIXoQ/1892oTKw/3BGd
         giHWc4GVOEXI+LOEoEWRJr9R59dQMOlK4lD1ebfhK+78o1Hkx0GMlyC6tr1H5gPefbGx
         jMgDBpZf9Yg+S7/QjkkxYkCZXKH+WBJZdFQkapTdjBfCem6NJxNkltxXuuXY+tHz5ZK3
         chZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750179236; x=1750784036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VYJnE0bLpXfGXAhOdoPj9sjJfon5avZzMzwtb4GEZQ8=;
        b=tDV9BDG+gRVbLABPKAgk1e94uDxJtef/yDdgRiuG9lwg+VdQB5IAx9cC6qdM2AVGIm
         4cd+ElK5g20pyuVuifwknQosTcx0rk+xtV28IEKPPFPNJlwsfbf+tWdmmEzhKUbmA2nu
         GPTUUsCLgtal0iU8jFMVgOFikgXdfL924eihXkcm0d7CrFvukjyjZzusJdP3FEiahO9A
         swF+slFdF3Y6LRhNoF0fUWGN980eMRBYnMnFNCBaomSCjZLdSsC4x/pzgpJm0L6RtXMB
         AR/Hwf8bvdwwFji3w+PBy+b6CTGQXVnee+KfYRMC7rGNC7vhIWrWxoq5rhE2SAxnhxy+
         6I0w==
X-Forwarded-Encrypted: i=1; AJvYcCXOMCaaBMFF2waGGJkC6a6sTy55DctGOuQcDV0jAX8SNr7t5r3XpE/ioJgqDGmzS/mXXQStm+UoUtbW+907bRQJ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywkht1Ps5/Lv+b3Q/ck0Wwsj89PTtyt2W3mHpECEFc5dPetEdiB
	iNT0jrCymjsM9YqCXRzO7GO8ZCpl+MPMGCjGv7KsVDdXJKbN8KHYZQA8jzsEh41dBf1nJUgHgv5
	4HkeQGneBarY8p37K//2VbT71hyOXB5OYEFSnsUtH
X-Gm-Gg: ASbGncsur6XIn50PLUyCQPQS6aIK7WmAYBX/MA7TBMxK5OkCKb2Ql2ubQJHQ2I+FAfw
	DULcK+zcT/HBgQo0z3R6vUtIaqot+w+vreDXJT7kbDAoa18XsGqD52Vl8Ii9FLPa/Qk1Lh5gARk
	vvhBcmInRFQj9V1jhWMo5Mp7hdRHe52+aDj/kTjeyuLgGS+t1kW+mXY1Pv1JBwLw+2MLdunepd
X-Google-Smtp-Source: AGHT+IFxzIYnRwPkTPGsw15J0FvFqBPucLmLVdUh15Kwq1Q2Op1ssWJY8RG0XKYKAwujDL/N2ht0/4WAcdskUuxdyGc=
X-Received: by 2002:a05:6e02:4819:b0:3de:20ec:5c71 with SMTP id
 e9e14a558f8ab-3de20ec5f19mr5234075ab.6.1750179235473; Tue, 17 Jun 2025
 09:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
 <CAP-5=fXSwgxMc+uh=PBAFh4Zm96tL5RDyKPOJ8Q40O4s=EaArA@mail.gmail.com>
 <20250616102945.GA17431@willie-the-truck> <CAP-5=fVjJyV2eA1aDnk6cqAhJGc9FZVyHhP7-f=1OyWmzxjN8w@mail.gmail.com>
 <20250617141649.GA19021@willie-the-truck> <86msa6co21.wl-maz@kernel.org>
In-Reply-To: <86msa6co21.wl-maz@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 17 Jun 2025 09:53:44 -0700
X-Gm-Features: AX0GCFugvPzuB-Difn5EDUPVkKbvplUqcVBXc7z721G-mrMOHZ8e5lOvCFsdSTo
Message-ID: <CAP-5=fW51G0Wc227K1o0T==wF_3DN-UhBrU1VzncwmfPcWP3fw@mail.gmail.com>
Subject: Re: [PATCH RESEND v7 00/21] drivers/perf: apple_m1: Add Apple A7-A11,
 T2 SoC support
To: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>, Nick Chan <towinchenmi@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	devicetree@vger.kernel.org, asahi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_095356_561919_C822A093 
X-CRM114-Status: GOOD (  40.80  )
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

On Tue, Jun 17, 2025 at 9:47=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote=
:
>
> On Tue, 17 Jun 2025 15:16:50 +0100,
> Will Deacon <will@kernel.org> wrote:
> >
> > On Mon, Jun 16, 2025 at 03:44:49AM -0700, Ian Rogers wrote:
> > > On Mon, Jun 16, 2025 at 3:29=E2=80=AFAM Will Deacon <will@kernel.org>=
 wrote:
> > > >
> > > > On Mon, Jun 16, 2025 at 02:36:18AM -0700, Ian Rogers wrote:
> > > > > On Sun, Jun 15, 2025 at 6:32=E2=80=AFPM Nick Chan <towinchenmi@gm=
ail.com> wrote:
> > > > > >
> > > > > > This series adds support for the CPU PMU in the older Apple A7-=
A11, T2
> > > > > > SoCs. These PMUs may have a different event layout, less counte=
rs, or
> > > > > > deliver their interrupts via IRQ instead of a FIQ. Since some o=
f those
> > > > > > older SoCs support 32-bit EL0, counting for 32-bit EL0 also nee=
d to
> > > > > > be enabled by the driver where applicable.
> > > > > >
> > > > > > Patch 1 adds the DT bindings.
> > > > > > Patch 2-7 prepares the driver to allow adding support for those
> > > > > > older SoCs.
> > > > > > Patch 8-12 adds support for the older SoCs.
> > > > > > Patch 13-21 are the DT changes.
> > > > > >
> > > > > > Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> > > > >
> > > > > Hi Nick,
> > > > >
> > > > > This is substantial work and it looks good to me. Do you know why
> > > > > there's been little progress on landing these patches? Buggy Appl=
e ARM
> > > > > PMU support in the kernel has led to reworking the perf tool. It =
seems
> > > > > best that we can have the best drivers possible.
> > > >
> > > > You reworked the perf tool to support these things? Why? These chan=
ges
> > > > are targetting chips in old iPhones afaict (as opposed to "Apple Si=
licon").
> > > > I think that (a) most people don't particularly care about them and=
 (b)
> > > > they're not fully supported _anyway_ because of crazy stuff like [1=
].
> > >
> > > I was meaning that we reworked the perf tool to work around the Apple
> > > ARM PMU driver expecting to work as if it were an uncore rather than =
a
> > > core PMU driver. More context here:
> > > "[REGRESSION] Perf (userspace) broken on big.LITTLE systems since v6.=
5"
> > > https://lore.kernel.org/lkml/08f1f185-e259-4014-9ca4-6411d5c1bc65@mar=
can.st/
> > > But in general it would be nice Apple ARM PMU support were well loved=
.
> > > I think we went 2 or 3 minor releases with the perf tool not working,
> > > threats of substantial reverts to avoid the PMU driver bug being
> > > exposed, etc.
> >
> > It's unfortunate that you've had a torrid time with the Apple PMU drive=
r,
> > but I think it's important to realise that it's both unmaintained (it
> > ends up with me via the catch-all for drivers/perf/) and was written
> > based off whatever reverse-engineering people could be bothered to do i=
n
> > their spare time. It's frankly remarkable that it works as well as it
> > does.
>
> Also, the "broken" driver actually works as expected. Ian blames the
> userspace breakage on that driver, but that's only because the way we
> deal with PMUs on ARM doesn't match his mental model. Oh well.

I'm not sure what this is in reference to or what you mean by my
mental model. The linked patch was that legacy events didn't support
the extended type bits added by Intel for hybrid. Prior to this legacy
events were broken on ARM BIG.little PMUs and would select an
arbitrary PMU - not good by anybody's mental model.

I'm happy to chat with whatever issues you think I'm creating. I think
you are making reference to situations where I've cleaned up a mess
with Intel hybrid and then cleaned up a mess on ARM. I continue to try
to clean up a mess for RISC-V. Sorry this makes you think I'm a bad
guy.

Ian

>         M.
>
> --
> Without deviation from the norm, progress is not possible.

