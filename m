Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB60DFA3755
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 22:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/64Co2q0kgEgA6DPpVmvrLqtt4+bKlfMdoKNXVNCcsQ=; b=3/jXAJOzCGuwEIwDOHyc9OzV8E
	eoPX4SUJhzY+fpgD4DYEtvAHCbkJDnroLgS4bb/s4CSKg5upMyfn3yTLjwp/Yfidoz0DFE9xQG3sF
	Iy6StTpt9YpY/2MlkxUZf7kL3sV+Lg7/L1Uxy1Lxv6fb9gs3z7nvyTLyv3aVOhuuiKKXaOo2B023m
	XVeasdYp/NJB8J5SB8fh7+8hfsxc0M2HN6fClAa+0k7S1fanXrZrmxO2fsPN3iEQThLmrou6uu4GX
	luObKtFBqoWH4fF44JpvE1pXLmEplVj235o22K4C8AB/HxWGY7WWCHlizexpHrnpLFOftT6s0SBsq
	qA+E13hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbnSp-00000008kXN-1LWK;
	Fri, 02 Jan 2026 22:17:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbnSo-00000008kX2-1r6a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 22:17:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 23C7B60142
	for <linux-arm-kernel@lists.infradead.org>; Fri,  2 Jan 2026 22:17:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1561C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Fri,  2 Jan 2026 22:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767392259;
	bh=/64Co2q0kgEgA6DPpVmvrLqtt4+bKlfMdoKNXVNCcsQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ge2fF73iJ8fd9je/5EvWRvXS4+eNAXKRDPzkWl71vlZSnTL/QfKna/aIUVBrNzqh5
	 mDsdGxhIVjOAF5DgyQXjyPdkWInWTLYyR9nBQBjvEYKXdK4AlCDsxA4DRs7FKwJd55
	 qbNGH1+8COzIcaBwqUZtXwBOXEyk4P7MwVgy80b4xpW7IdeVJUU16yVWcdTMFVs1VE
	 a/shbiUuWL8wYX6p4iaLWpnQh2+AczJFAcfhA1YoN3SzJA9UdLIX7SN1jvxiC3iOfj
	 7D4GSVWzrtB2v8A78o2IxK2poTFA4PCSHN/pB4Gh1eYAhTxFCE8mUEEVm572e5YK5f
	 d5bdHvqxa8TAA==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b83b72508f3so292933466b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 14:17:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWlvGgaQqtPTS+sEZumzSiXVTFqQ3V13QN7BVzUlxfgEtfYVYG9l6R8QE+B8qFGuC//nMmLqkJAMMF0bOmzux72@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5AwVgBw2umYI4E1xkp72DgySXTXMAPRZ7kUDIsa2oVdODxTTT
	Wlt6GUtqX+w+K9kPYomPxFp0Jk4rKL3TTvK2aYsEEzh4mWQu5TGdlgIeAKLKmG7lUgp4un3kkAL
	cIhVGlhXCtqQa+jVSRcCYtHY9uOU5jQ==
X-Google-Smtp-Source: AGHT+IGcdjYMdq8WHlapJ12+Pohp79IeQ6Qp00t62ofYPur0Xu5Cyh0Zdwx3rcPrWR7fro3HFhzV7izpL+ysUdN6FT8=
X-Received: by 2002:a17:907:da17:b0:b83:3770:a0e4 with SMTP id
 a640c23a62f3a-b833770a15emr2280910966b.34.1767392258434; Fri, 02 Jan 2026
 14:17:38 -0800 (PST)
MIME-Version: 1.0
References: <20251217153917.3998544-1-arnaud.pouliquen@foss.st.com>
 <20251217153917.3998544-2-arnaud.pouliquen@foss.st.com> <20251229232530.GA2753472-robh@kernel.org>
 <aVOzHWmlJ-eneS-2@sumit-xelite>
In-Reply-To: <aVOzHWmlJ-eneS-2@sumit-xelite>
From: Rob Herring <robh@kernel.org>
Date: Fri, 2 Jan 2026 16:17:27 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+_S8UY7s7WQg9jXuBXCYMBWVCy=kVDMdkKTx6RctqQJA@mail.gmail.com>
X-Gm-Features: AQt7F2qSpJIFr1cZ7Ak2PMJj_kJpZOMaYqr6WPt7b6SXNB2GqwyfYzNGk02nLo4
Message-ID: <CAL_Jsq+_S8UY7s7WQg9jXuBXCYMBWVCy=kVDMdkKTx6RctqQJA@mail.gmail.com>
Subject: Re: [PATCH v20 1/6] dt-bindings: firmware: Add TEE remoteproc service binding
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	devicetree@vger.kernel.org
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

On Tue, Dec 30, 2025 at 5:10=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> On Mon, Dec 29, 2025 at 05:25:30PM -0600, Rob Herring wrote:
> > On Wed, Dec 17, 2025 at 04:39:12PM +0100, Arnaud Pouliquen wrote:
> > > Add a device tree binding for the TEE-based remote processor control
> > > service implemented as an OP-TEE Trusted Application identified by
> > > UUID 80a4c275-0a47-4905-8285-1486a9771a08.
> > >
> > > The TEE service node is a child of the "linaro,optee-tz" firmware nod=
e and
> > > acts as a container for remoteproc devices that are controlled via TE=
E.
> >
> > Is this generic for any remoteproc device or just ST's remoteproc. Look=
s
> > like the latter to me.
>
> That's true, the DT description of the remoteproc subnode is very
> specific to the vendor which in this case is ST.
>
> >
> > > In addition, the "linaro,optee-tz" binding is updated to specify the
> > > '#address-cells' and '#size-cells' values used for child TEE service
> > > nodes.
> >
> > I'm pretty sure I already rejected per service/app child nodes for
> > OP-TEE when its binding was submitted.
>
> That was the reason to have discoverable TEE bus in first place and I
> have been motivating people to dynamically discover firmware properties
> rather than hardcoding in the DT.
>
> > If we do need something in DT
> > to define some resources, then can't we have some sort of
> > standard/common communications channel? I don't care to see some sort o=
f
> > free-for-all where we have every vendor doing their own thing. OP-TEE
> > needs to standarize this.
>
> I suppose this requires a wider scope work as you can see the DT resource
> dependence from here [1]. By standardize communication channel, do you
> mean to say if adding an alternative backend to fwnode for TEE in
> parallel to DT, ACPI or swnode is the way to go for discovering fw
> properties?

No, not at all.

> Or do you have any other suggestion here?

What I mean is why doesn't the TEE define the communication channel
(mailbox+shmem and notification interrupt) rather than each TEE app?

More generally, is having TEE apps depending on random DT resources
really a box we want to open? Is the next thing going to be a TEE
clock/reset/gpio/power provider? Where do we draw the line?

Rob

