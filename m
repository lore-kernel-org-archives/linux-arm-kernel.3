Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C471CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 12:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qdXNkcQjzCNEHwtxMUsJMjryZy0SRyjlhMAU8fqcfII=; b=4fpe1/M7g60G/SaYZvNH0wsBqB
	6sS3B+B1gZSMKh1D3HPvzP/UuwEmHYQ4nbPXhaJiXY5fKGVeyTAjUhkpvqmTh8+zVXfZc+xnJqGTt
	+1DlrQk9PtI2z3b+7dzylo+jNE+q5RE4fQ9u5FxD7TMFEELEflkv2Fv1oEDBgnNAkRYhcwwTie7Kh
	nz0LPOL/SU71m6giiRBihVQme/37DLfI/3mWZ4Oazq5N1skf7zi1OdLytbNyVw9fCg5rJ5X/3wmNT
	4MvM5RBfD/OEpmQ1t8b3djzWT9EOOriWYCqspwUwxqhMfo4jq+pxJIOTNk8vrS1ZW/S0QIb80M17+
	Lv/tACzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCH97-00000009Oiy-1rqo;
	Fri, 24 Oct 2025 12:43:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCH94-00000009Oh6-3RZ8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 12:43:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 72F494537C
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 12:43:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 535D1C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 12:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761309830;
	bh=OQJRTxbLkUJSG6Hfj2aAMLp/CQvFmEMNU2nFsDW8/O8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mfCVHAVopZMSe5zGbZ7DqcXCJxa26UWCs9cnJYJIS8/ZfVKoEmbITymqnbZp13Rmb
	 SKXsOkiuvT2pufWs0wyCCT10nrtYmnr8bn0WAbXaibCgDVgaWxpTYsrOOlXyIutW/Y
	 BDFd0r9LXGWVDCYMPoQl4B8oBfqOP+Tpbv9bGDjZEbjcfZTpvlS3RpvhBtyKAkWPrL
	 vtdTPyXUqe+wpqbRyE2JiEXzYUmsjfa2Fyjlu4YA1XURxLE2vSCBaukH2D3211hZyS
	 pQ3EREfiU0k2d+Uxh5Ae8DrczsY6IUqrC3KlTS8BNgwZIKifHR/klhFJAlhFwqbdyH
	 9EcaMn7voKNdA==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so409701266b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 05:43:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXHL5XGuW9roceVY1RzfEJ/NpeowqQEc6TrBjvFLS3Okdk+Lt1zb1B3zGdCk+pXvmmUUJgh5Cu0+QZ/2ZujIRVm@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/4faHy61a4RG10MLZFiVyTpOu2GblbDss/rN6qxaWjQhvkrhS
	Nl+yF94qSlTKGk9/7Tc1A6F20YX0qwt8nf8D6Mr4AGAWgfmef+D8UPjv8soFSG7rIxdONEf3TZ5
	/GCyNSBkt7KWoNWOdbfzFEYhOPbfOCg==
X-Google-Smtp-Source: AGHT+IGaCIdcHozNq55y6tCOTnaSA8JKLNglQntYyplKKBr4Kfb/fniPDz4m4msgsNYHeZxxULr+Js+tkAFFxxxkJ0s=
X-Received: by 2002:a17:907:9701:b0:b3c:a161:6843 with SMTP id
 a640c23a62f3a-b6d6fe01905mr270557266b.4.1761309828886; Fri, 24 Oct 2025
 05:43:48 -0700 (PDT)
MIME-Version: 1.0
References: <20251021124103.198419-1-lpieralisi@kernel.org>
 <20251022140545.GB3390144-robh@kernel.org> <87v7k4ws58.ffs@tglx>
In-Reply-To: <87v7k4ws58.ffs@tglx>
From: Rob Herring <robh@kernel.org>
Date: Fri, 24 Oct 2025 07:43:37 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL5f4_qQ=YmQcYpaxsUx8vZDkuquK=G3YTw9qC1QibVrg@mail.gmail.com>
X-Gm-Features: AWmQ_bms1S4lGlWI8WRswebTFx9muu0IxPjIPVEgFBEKLoJV1JkaFYbmMfNU7gQ
Message-ID: <CAL_JsqL5f4_qQ=YmQcYpaxsUx8vZDkuquK=G3YTw9qC1QibVrg@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] of/irq: Misc msi-parent handling fixes/clean-ups
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, Sascha Bischoff <sascha.bischoff@arm.com>, 
	Scott Branden <sbranden@broadcom.com>, Bjorn Helgaas <bhelgaas@google.com>, Ray Jui <rjui@broadcom.com>, 
	Frank Li <Frank.Li@nxp.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_054350_886275_EEC5C5C9 
X-CRM114-Status: GOOD (  14.38  )
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

On Fri, Oct 24, 2025 at 4:44=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> Rob!
>
> On Wed, Oct 22 2025 at 09:05, Rob Herring wrote:
> > On Tue, Oct 21, 2025 at 02:40:58PM +0200, Lorenzo Pieralisi wrote:
> >> Lorenzo Pieralisi (5):
> >>   of/irq: Add msi-parent check to of_msi_xlate()
> >>   of/irq: Fix OF node refcount in of_msi_get_domain()
> >
> > I've applied these 2 for 6.18.
>
> The rest of this depends on those two.
>
> >>   of/irq: Export of_msi_xlate() for module usage
>
> Can you pick the three of/irq ones up and put them into a seperate
> branch based on rc1 so that I can pull that and apply the rest:

Yes. This series is the only thing I have queued for 6.18 fixes so
far, so I'll add the 3rd patch and Cc you on my PR to Linus.

Rob

