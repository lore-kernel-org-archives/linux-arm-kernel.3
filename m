Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2A7CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 23:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eo0jWMvenzTcylQbtlD+TZFDQvY9IieO+xccEfDQfKU=; b=jYx9QXcPJvdJ7NxbPvCsgyOkC9
	HgYxkqjAj5B8kKBiSCwr6s5ij2yVxTwCykoeeqSsDqgTguCefto5S7L8cOdfNPZitWEPKMVPevYpX
	MmE2Re83WZScf46NfhlsZKfGN1LtuyJzTrFEAKSAbFuXEPPT2+wJwddEF3ISSTjxkyt8i5j1yOi+Y
	FlbNQQkppEYTBTK6bGxW6PSaRUiK7FQfgz1Ub91shbtJT2o1d7HRIMkpyfVu3nE4SC4HUESe9LJaJ
	kDpNjC3YpNYHoTStta8rziCGlESW+dqe+Q+BT1BhLafh+ZoTkbmTm/uqRDGAc66h36m2PSIxBezOa
	0mxaa+lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvPFH-0000000DScw-0ocv;
	Sun, 07 Sep 2025 23:56:31 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvPCT-0000000DSDo-1XOp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 23:53:38 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b0418f6fc27so633504066b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 16:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757289216; x=1757894016; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eo0jWMvenzTcylQbtlD+TZFDQvY9IieO+xccEfDQfKU=;
        b=Obt3aI6NQP5TkD14KWY+eBZsKO0+Dqn0fi2sf906aLANuMlQFJpP3HQSzOst8hJoPJ
         TkAqkxt/c1x+fDVZI5CkT94RE0AU9woZ12CkF0mTt0a7JS7u+dvpAvrk2Akrhsy1TSXO
         ccGEtB9AVYGPxTm07znuzTCR/B/FCXw9m0kMUDS17aXF0jhvGGge8lX51NxxykPBHXIc
         JgKW+5ADXvWjSLXvYewz/H/dJDwPXgd7YB4LQSu4zE92q6Vc3f1Gzt5NGVcye58Jb/e4
         urC9en5XsrBqAgSnOdvvGI+8qarHcHWPU4y6PsTafDBd+P/8lazhDvBEM3paBXae8hef
         dZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757289216; x=1757894016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eo0jWMvenzTcylQbtlD+TZFDQvY9IieO+xccEfDQfKU=;
        b=N3iSrOUE+ynqCtKp06cilXqShY1X4n8Bzf8F1XaxGPHh/muRH6flKADXaODc3hh4Av
         95AHAbjEn04LwZqNBrb+F65rAfSqCVvCDyvTjdcqXIw2X6C38+M+pbmwBuOSAhGhRtHJ
         jTtcWRuGQR2pSOScySKJLw0Rk5pxTZ50+e+xOvtG+Okl/JACdVm3Eq9ngaRp6sh0I//m
         xT17cw+6HzyeZVOvEXkeQWZJ2srsAV46CCkIDASc0xlbx93a8v8VwbK6jnfVlaRWiLEZ
         YFDKG0HCZAPi5SztTwb4pduCIKAbaQPhWsNSU4gD/0D28k3t0ByWC8Hry8VfS0I1QumR
         mDzA==
X-Forwarded-Encrypted: i=1; AJvYcCUrIuC9Qu1rUg49cXzqIBDoi30azgwnICyCWNbOtXwjsRdA3dEigML3aN3rEC8RQ6zKxvT396emZdyvUgjwSwbR@lists.infradead.org
X-Gm-Message-State: AOJu0YxMoYUg1EXKgYnSmPeLIfPV0OoJztRypxtoAUiSzvBkdy0uB4Ig
	V1z+zLlavLyYuyY7WV3rzbzwatLyBBmLsHTXMCpEpxrGe5bcn6CG5WzOR21yoZDYNG3fjMMmBb9
	1QwYPRlFNu1JT/78XqhlBl/VtVqjWUF8=
X-Gm-Gg: ASbGncssmtXqNrTGBEiWRqqkeOZtbozjOaesvXHHLeUHtj9c1bj2Fzutb8YFkJjEK8E
	EcUyGdbHR02KS65QDWSjj0shUZBQPDUkiVubDzDScQqIKgGvYPNMv4WH21Ei1ErKvP7pNLTuM5m
	2JXXXfCUdfJ4Uh6KcWMwTIkBasKD9fyvPjfYzqeP6V68jKFGmOPnBGqRVO08dkBBMpLK7mGfqM8
	9yrCWJw
X-Google-Smtp-Source: AGHT+IFt+a9QpR4i38miW/0BfGqA0U2+iw8J9V2j5KOHtmH84Q/NYOsmq7iQFaAc9EGDka3m0a2cVbFdrj5qMnsEfOA=
X-Received: by 2002:a17:907:7202:b0:afe:23e9:2b4d with SMTP id
 a640c23a62f3a-b04b16f07camr535958666b.43.1757289215546; Sun, 07 Sep 2025
 16:53:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250907102303.29735-1-klaus.kudielka@gmail.com> <to2mscnfphhypr3ml7hnkvedpw45fqoj4rnrmch2zfjre5i3qi@asawccwf2lgz>
In-Reply-To: <to2mscnfphhypr3ml7hnkvedpw45fqoj4rnrmch2zfjre5i3qi@asawccwf2lgz>
From: Tony Dinh <mibodhi@gmail.com>
Date: Sun, 7 Sep 2025 16:53:24 -0700
X-Gm-Features: AS18NWAc6vMudz21FKTD0SJAvjorxRi6NFkDGf4DA4tbyg0jkso42yHG7rMZMhs
Message-ID: <CAJaLiFwwTaok1JLTz=JCEhVacvL=ZB4X8TBDwR0NfhHrBp3YKg@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: mvebu: Fix use of for_each_of_range() iterator
To: Jan Palus <jpalus@fastmail.com>
Cc: Klaus Kudielka <klaus.kudielka@gmail.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_165337_410603_B868263C 
X-CRM114-Status: GOOD (  21.71  )
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

On Sun, Sep 7, 2025 at 4:42=E2=80=AFPM Jan Palus <jpalus@fastmail.com> wrot=
e:
>
> On 07.09.2025 12:21, Klaus Kudielka wrote:
> > The blamed commit simplifies code, by using the for_each_of_range()
> > iterator. But it results in no pci devices being detected anymore on
> > Turris Omnia (and probably other mvebu targets).
> >
> > Issue #1:
> >
> > To determine range.flags, of_pci_range_parser_one() uses bus->get_flags=
(),
> > which resolves to of_bus_pci_get_flags(). That function already returns=
 an
> > IORESOURCE bit field, and NOT the original flags from the "ranges"
> > resource.
> >
> > Then mvebu_get_tgt_attr() attempts the very same conversion again.
> > But this is a misinterpretation of range.flags.
> >
> > Remove the misinterpretation of range.flags in mvebu_get_tgt_attr(),
> > to restore the intended behavior.
> >
> > Issue #2:
> >
> > The driver needs target and attributes, which are encoded in the raw
> > address values of the "/soc/pcie/ranges" resource. According to
> > of_pci_range_parser_one(), the raw values are stored in range.bus_addr
> > and range.parent_bus_addr, respectively. range.cpu_addr is a translated
> > version of range.parent_bus_addr, and not relevant here.
> >
> > Use the correct range structure member, to extract target and attribute=
s.
> > This restores the intended behavior.
> >
> > Signed-off-by: Klaus Kudielka <klaus.kudielka@gmail.com>
> > Fixes: 5da3d94a23c6 ("PCI: mvebu: Use for_each_of_range() iterator for =
parsing "ranges"")
> > Reported-by: Bjorn Helgaas <helgaas@kernel.org>
> > Closes: https://lore.kernel.org/r/20250820184603.GA633069@bhelgaas/
> > Reported-by: Jan Palus <jpalus@fastmail.com>
> > Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D220479
> > ---
> > v2: Fix issue #2, as well.
> >
> >  drivers/pci/controller/pci-mvebu.c | 21 ++++-----------------
> >  1 file changed, 4 insertions(+), 17 deletions(-)
>
> Confirmed the patch applied on top of 6.16.5 fixes all the issues
> introduced with 5da3d94a23c6.
>
> Tested-by: Jan Palus <jpalus@fastmail.com>
>
Sorry, should have said:

Tested on these Marvell Kirkwood SoC boards: Cloudengine Pogoplug
Series 4 (88F6192), ZyXEL NAS325 (88F6282), and Synology DS112
(88F6282) running kernel 6.16.5.

All the best,
Tony

