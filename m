Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12AED116F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 20:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0bhHfw++5pSOrL1hyiPHtXVUoiR0H8FhFS8GHD/WRn0=; b=hAl/L7hcunGLJ0phx3dBhKnQLe
	P/OQ/PaOIZusCRJuH8CbFI6pLiUCIh1piao3IbUkJLS0mEjmP948rl4wGVriIqhi+V1PsTR6Ap/qk
	WtEBXf5APBboBdWdaPQFHaaUQTfEqFevNkYEaCPV+WvlZegm22oUAXliS0f6HDtAyQHeHCysNH9X3
	ZoH0XfxP6GHkJEXOcdS4eEaAxIpLlpKMrznOaFIidDZzA3oDZ6CzV6alDlo/354+ovlLcFbYpNjBV
	91O4ay0quOWbX/wa6Y0Mt3wj6GJ2pIX8gQNCIhtwLF416+OYlta7a4jx/DN3yxQRCRfuQ3aYy6Nd2
	keNTRTEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQAzM-00000004WDb-2Knf;
	Mon, 01 Dec 2025 20:59:16 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQAzK-00000004WDB-1HuN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 20:59:15 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6419b7b4b80so7048748a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 12:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764622750; x=1765227550; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bhHfw++5pSOrL1hyiPHtXVUoiR0H8FhFS8GHD/WRn0=;
        b=FkmLcweZ/g+ZpFjzK2cRnVFK7Ei8eoCId6DT0HoaQikznI21w4Wm9S2AD4MPU0OdST
         ldWkAyw4uhUsTsJZc0a3DHYUxAPje7D4+NA5M41X+Lc69G5g6DXnMEtXpFbHgs3JjxIK
         h8rb0Q8byWCa6qYyfZB8Vm5aRZzdL0VOBSSu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764622750; x=1765227550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0bhHfw++5pSOrL1hyiPHtXVUoiR0H8FhFS8GHD/WRn0=;
        b=HMgWiHhijlb3hXYO5XI0YNkTOV2wqS0sSpOvZsDBM86gsjOIIT+740GRITeRjqSsbH
         25S5cwNOWtgFGvrgqQAFlEnhCZ/HP1h69Fz37WVjDtEA0o7LO6gdHlDklj7bOzv7zvPg
         DMuB/rQZFMwEIBO1Y5TLS8ihdy6vGCnu5OXnLyaMVtbJJoYSYGkuIWLeb8El3e6MFbAQ
         ZOZ6ojE2sV9L/4rQMOH/Qe9zkzp5AhePGsMbFGXmtSFkiTvEb1OSJHCDWxEyWt55uvuD
         +3i0ODkMv+OF+nkv2dCdXNXGBoyJOqsmV2SDkYSlkC/dW75EXzGj+jq80ya01Gb3Y+6s
         826w==
X-Forwarded-Encrypted: i=1; AJvYcCUaAi9YZi8dpG71dD6eITU9DNq6vVwsHBjn4K7/W/ou3OAREzuiIVzmz6f1T/1M1nljoBGsnj2KKHKoAwa3SfOx@lists.infradead.org
X-Gm-Message-State: AOJu0YzwSwJA+0zSxV2odA585mbAROV1/ZM3daRYFLRQdhD/l0pjjYi5
	AlmUaciEbrLbUQjhn63KxhxMm20BhEFektP5RbzleqRoOKYM89qvYT15TRdqZ7GQTjd6MUUtqnT
	xWtL2Ouqt
X-Gm-Gg: ASbGnctozxHsePzOBdWfG20rKfdvztpxPzyEw/Fy98tDebCUE/giYXkW8GTCns4r+fs
	cwFn3rkdWdip88C0uw5EQVFGDeLvmqDTG2uQz3jE8jEIqk32gbazVlsadyW/hDa2v7JxgHbDA+0
	Dujzpo1yifjfz800cWsVU/V/L8IN+7zLUES+WXFVGH91j+pHOPwnJJgPZLqqj7301bejJYZ/485
	BGBOLO5twquhsApxSbUpJfkXumlwz6+2WafsQFeAkJqjC4T8dBBJdh+13q7t7SKxuBRBnxGq8N3
	QinnvD8TY4OGRJM1ZrQfiv2J7IrMN/gX+9tqU1+AdYlHbDoxY9W7bcR8l2hB/AUALCtOZ/46g/X
	B8RTj31XzFb+eUR9qx0dkBhXHKhZXnlrcxCG0CPNTR6BOFGPXJZoPEqz9D38CpA7WSgqcskfHSW
	nkPEofo/7XrbobP+8JUgcqJzHyWuzQRAPv7xksV9XsgXg3wd5uEf7FZQms6XtS
X-Google-Smtp-Source: AGHT+IFIRA0PgA88zbBYyvd/j2plTWRfIpw2dPkKAEbGM6QIkYpCwugkX62grojna3gp+bAKQIz2ng==
X-Received: by 2002:a17:907:6d20:b0:b73:70db:49ab with SMTP id a640c23a62f3a-b767170e64cmr3848959866b.35.1764622749966;
        Mon, 01 Dec 2025 12:59:09 -0800 (PST)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5a265d4sm1311249666b.60.2025.12.01.12.59.08
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 12:59:08 -0800 (PST)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42e2d02a3c9so1532300f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 12:59:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXtJrgEjxOCVilCllwivlw8zFDIPf7kByzV2qvJnYt+1KR4zvL9FW6zwK6+uSmQQ3aiscz6TeYuCxR8DbaMFsRK@lists.infradead.org
X-Received: by 2002:a05:6000:2282:b0:42b:40df:2336 with SMTP id
 ffacd0b85a97d-42cc1d19a9bmr43036897f8f.39.1764622748258; Mon, 01 Dec 2025
 12:59:08 -0800 (PST)
MIME-Version: 1.0
References: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
 <CAD=FV=UbejKdD2q2Z3RuYH0Ooc6XRb0oynchDsqnq7GzM6ah0w@mail.gmail.com> <aS3eXBDtaoNLfxZy@shell.armlinux.org.uk>
In-Reply-To: <aS3eXBDtaoNLfxZy@shell.armlinux.org.uk>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 1 Dec 2025 12:58:57 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WBbqSDghm+o2ZVa4-AbL4aggFQO0xdtmZNrYOQRjF5Vw@mail.gmail.com>
X-Gm-Features: AWmQ_bnKBMj_4BZSGQ_zt34CE203-diDNxdOfHh2BJz5uCaYVKDBch65v2RkB6o
Message-ID: <CAD=FV=WBbqSDghm+o2ZVa4-AbL4aggFQO0xdtmZNrYOQRjF5Vw@mail.gmail.com>
Subject: Re: Proposal: Officially allow "incomplete" trees as a base
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: devicetree-spec@vger.kernel.org, boot-architecture@lists.linaro.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	William McVicker <willmcvicker@google.com>, Julius Werner <jwerner@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_125914_419440_07AD46C6 
X-CRM114-Status: GOOD (  63.62  )
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

Hi,

On Mon, Dec 1, 2025 at 10:28=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Mon, Dec 01, 2025 at 09:42:40AM -0800, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Nov 18, 2025 at 2:43=E2=80=AFPM Doug Anderson <dianders@chromiu=
m.org> wrote:
> > >
> > > This is a continuation of the discussion that started in reply to my
> > > patch adding basic device trees for Pixel 10 phones [1].
> > >
> > >
> > > Problem statement:
> > > ------------------
> > >
> > > We would like an officially accepted scheme that lets us more
> > > efficiently ship compiled device trees for a handful of related
> > > products by breaking the device trees up into a common "base" device
> > > tree and then applying "overlay" device trees atop the base to make a
> > > full and complete device tree.
> > >
> > > To make it more concrete, we'd like to build a "base" device tree tha=
t
> > > describes a SoC and then have the overlays be enough to make a full
> > > description of a board. In theory, one could also imagine wanting to
> > > expand this to 3 or more levels (perhaps SoC, baseboard, derived
> > > boards), though this is not planned at this time.
> > >
> > > The primary reason for wanting to break device trees like this is
> > > efficiency of the shipped binary device trees. A large portion of a
> > > final device tree just describes the SoC. We save space in the final
> > > compiled device trees if they don't need to contain as much duplicate=
d
> > > information.
> > >
> > > A secondary reason for wanting to break device trees like this is to
> > > more nicely handle when a board has a socketed SoC that can be
> > > replaced with a finite (and small) number of different SoCs (usually
> > > revisions of the same SoC). Even if this secondary reason is
> > > considered invalid or too difficult, the primary reason still
> > > describes a compelling need.
> > >
> > > In order to make this proposal work, it's expected that a bootloader
> > > will understand the scheme and will know how to combine the overlay
> > > atop the base before passing a complete device tree to the main OS.
> >
> > It's been roughly two weeks since I sent out this proposal. Do DT
> > folks have any comments? Are the goals I have stated understood? Do
> > people agree that these goals are reasonable? Is there any question
> > that there is a need to solve these problems not just for Google, but
> > for the community as a whole? I'm happy to reach out to people and
> > have them reply "yes, I have this problem too" if it would somehow
> > help. I don't doubt that there are still people at Qualcomm who would
> > like a solution even if I think Elliot isn't driving it there
> > anymore...
> >
> > How do we make forward progress? Does anyone have any comments on
> > Julius's reply? At the moment, I think there are some conflicts with
> > what Julius would like to see (no changes to the rules for how
> > overlays are applied) and what Rob said previously (we need to find
> > some way to combine the compatible strings). Did I misunderstand? Can
> > we find a common ground?
>
> My feeling on this (and I don't have much time to consider it tonight)
> is that this isn't going to get a quick answer.
>
> This answer is based on my authorship of various device trees, and is
> solely my own opinion, and in no way represents any position by my
> employer.
>
> While the DT files are dual-licensed, the license that applies to the
> copy in the kernel is GPL v2, because the kernel as a whole is GPL v2
> licensed. The dual-licensing of the DT files is to permit them to be
> taken from the kernel and used in e.g. boot loaders etc.
>
> However, as the license that applies to the kernel copy is GPL v2, and
> GPL v2 requires distribution in source code form, or an offer valid
> for two years of the corresponding source code etc (check the GPL v2
> for the exact terms) it could be inappropriate for the kernel tree
> to distribute binary DT blobs without their corresponding source.
>
> It seems to me that this is a problem for lawyers, and you're probably
> not going to get a quick answer on it.
>
> So, I'd suggest patience, and don't expect this topic to move quickly.

It seems like perhaps I wasn't clear enough in my description of the
problem I'm trying to solve. I'm not trying to change anything about
the licensing or where the device tree source is stored / distributed.
This is all about packaging. As you can see further in the original
patch series I pointed at [1] that I include both the base and the
overlay source code [2]. I just want to organize things such that
SoC-related nodes and properties are in the base device tree (whether
"dts" or "dtb") and then we use an overlay ("dtso" or "dtbo") to end
up with a combined device tree that represents a complete board.

Today, there are no technical reasons stopping people from doing this
and many phones (including Google Pixel phones) ship their device
trees like this.

That being said, we can't land device trees like this upstream because
the base device tree for the SoC is not "complete" and can't pass yaml
validation.

According to Krzysztof, this is simply policy. As he says: "SoC does
not meet this criteria, therefore it is not suitable for DTS" [3]

If I read his response properly, Rob wasn't dead-set on this being
against policy. He said "I think it is worth having the discussion"
[4]. He was concerned that the final compatible string needed to be a
combination of the base and the overlay.

My goal is to find a solution where upstream would accept device trees
that are split into a base for the SoC and an overlay to "complete"
the board..

There are no legal questions here. I don't even believe that there is
any true technical complexity, really. There are a few small
differences in the way we can slice a solution and how we do it will
certainly have impacts, but I don't believe that some magic solution
is going to come up and make everyone happy (someone should feel free
to prove me wrong, though!). This means we have to either decide this
isn't a problem worth solving or we have to pick some compromise about
how this works. At this point, I'm fine with any answer (even a
definitive statement that this isn't a problem that upstream wants to
solve). I'm not terribly happy with just ignoring it for another year
or three.

[1] https://lore.kernel.org/r/20251111112158.1.I72a0b72562b85d02fee424fed93=
9fea9049ddda9@changeid
[2] https://lore.kernel.org/r/20251111112158.4.I5032910018cdd7d6be7aea78870=
d04c0dc381d6e@changeid/
[3] https://lore.kernel.org/all/20251114-elite-refined-yak-bf9e64@kuoka/
[4] https://lore.kernel.org/all/20251113022719.GA2281498-robh@kernel.org/

-Doug

