Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F10FF4933
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 03:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FVMXYmRNSK5Aq3wZtSGqZwzT1AZquu20CiOVo+iR0q8=; b=sqi9Tb/7gmXEJuUGqyymQ18BP7
	CRnUnfAiqlHYNHSlJ5YOc4PctQIbZua4opvBPCxPiEyJ97CQ3YryitkPRZkUUDMHpuinBouJEPqY0
	qQbd0dpfpd+G9Sf3DGPNb7Dz4/MnNrDraQvJcx9OKPFt314Lw30zAEwpu5kFgZDaiXPtXqINeg6SD
	GyJkymwRHy2++y8mQutZw9B0FudPEgNkfLEGvixF5HK39+4Cfx1QrU27v9bSpzcci53Sb1H0eY7St
	RXzgznB3zUTqkEqz0O7QFYbDqcAw4jYZ+VVcYgD/yAYenGVWx1P12mJ6oZh63qMGo1s9gSTp592EG
	/CmLXvLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w736V-0000000AYHe-1XPW;
	Mon, 30 Mar 2026 03:15:51 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w736S-0000000AYH8-0lSN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 03:15:49 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-35d8e548a05so2080315a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 20:15:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774840546; cv=none;
        d=google.com; s=arc-20240605;
        b=lUmM/tlzJkGmKj0XMWp3vhsYybgm+wftZ7jTRwtE0qtLjhA20rA0LE3deOpzSnnu5R
         q3NbmXtkrvNJByxKu53Q+WNl4QvUtDqlAyK4CJItFq7j4DPvInraTpuuEkfbKmnajVUO
         2jb9CGPv0iKJpqEGknEKnIFGpqYY2c9RVuoC4V0IyZ/7zbUxUtpW/qdkjwNQguzcnAnU
         Kg3GBR9cEsjmhPI2xXVjIArdMHlUYgl7tIpjDf0ZS80z5aQHnmJ+R8RrlvY3ZbtHNO83
         t36DcDnvgEhudKhBeP/wRYeQ9gHexSnHBCv0NvGmCIkYuOMPE8C9a6XTJ91KK4x6672g
         2KnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FVMXYmRNSK5Aq3wZtSGqZwzT1AZquu20CiOVo+iR0q8=;
        fh=XDzj6M0UH+PlIsVpRMzOL3mflsdfh9Myq0rjdvcpy6Y=;
        b=h82symWTzniA/PmrGV4qOJhgFAwm1+Uhm01NEjrt+aTnGHhGmQ26xlvw3m/3qD5xon
         p0HOD3cwzqI1jxTzhy7SRsvLhXzccShkDSkzX9QClU5Kz3c9PuoFDIYfg8nLVUk5goxA
         niULj0pSfs7C+IC/0IXBE2dCaiRwHdxu7gT3VK4NDQcXS2CsxmTer2JUhQB9yWJA5nEm
         dWIfGRhcvyorQyLoPScMxqPpJPqWqr1Ly3nSF1y9EIyw4qrDsX9a7UPEbjGrCARfyAEb
         MTGKHnP1ty87knjWQ5PKr34y/aOLIFEVYXHotWeWo7iQfhx06WrM9K851OqHFI2YdxId
         wEhw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774840546; x=1775445346; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVMXYmRNSK5Aq3wZtSGqZwzT1AZquu20CiOVo+iR0q8=;
        b=TNANwp6NL3QPAKrrdBfyzdS33BOD6ra6H1Nnnnz4cD7pcyPIxmP8VjD8nrSfSbWGH0
         UkHVqWGYvFp7V3/gZ/PiuX2zexiQViW+CBBcyOIuGxGdE38VjF4tCaAoJ/5FrcYNPDCR
         HZpf+U90UNNx6y8TjKTJTkC8m16O66LbGcvkRoODzo/VZKfgYKjKDqH5z7ztFtFnNgQd
         /ZZ8108lan89bUKaxPsjML631Ubpboox3SyeORV1+FdsI9xckzH/KCRoab+iJ8yX1k0z
         ZAHRlut/nOEBHb/kCvzcf2DmzsVdqZwp+aobb/RwZ15IqA8cVBj3NB0Q+rjckVb+y215
         uK/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774840546; x=1775445346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FVMXYmRNSK5Aq3wZtSGqZwzT1AZquu20CiOVo+iR0q8=;
        b=gqtRS/4zGWW07G62yPbZYlj7MJkoRIuJ7CbxZYqbM3AGJaLnlH4Qn1zqkgfZ1bXreM
         VawmLqGht/xRoagvqRTXJqkAFhkY1cGS+ROH09mvVgIq/AuFuQAedm4QHgTUDXLbrM50
         H5wXQpKraMQesitecIwWCPfoGm7q2I9zl7U+c4Ewkar5cg5ym+D8vfplKey7DakX+7kb
         OemH0D79HbqfPMvnTDaoQ90LOOqZFD83UtQem2rYjEJI6UOPJ+pzMocPjz2hgbFB5eTQ
         8dLO25uOO3iiSW/kWPfBlMyI5bYHA9+FPaWw6R7f+JiVtsgRS7Wa3dRp64B3whdY9NPl
         09Yg==
X-Forwarded-Encrypted: i=1; AJvYcCXshXnK243yLkhcxHWIRayTMGKTAu+AFxjO52XqUYeGqAfELpKxq5J1gg1zMxXftCQLfFEi+msfTChDhumdX2lv@lists.infradead.org
X-Gm-Message-State: AOJu0YxdBLCTb6qgGm8mwuisZEBK2eGXmgcuApCFnrqiBL55mcxgBefv
	zzCewpjbFQlxmkr0rQrBfTkdrTPU1Kd88/2HHNrgZY3gyYaKqT+KjPpmJ5o/1Umy4vkquGe66mi
	oZESkRA7nJXuqi1Z4N8QOiFBm5rpIzng=
X-Gm-Gg: ATEYQzzAcR1MSsjfvoa5fH57FFVmeuI1/k2UlpbgRlAlZyOfl99gDHOigrtjbp1L20x
	d2wUH2G6Ka0k0JpzDnmh85I7UkoXsNPOCEhH0pncKleEwKazYjSjmNgBvYmr1HEY2TdeL4HLew4
	ZzFInheR9Uctb+Bl1XuX0S6uXlA5Wj0SgtTO7sAkDO/qzHQBw3r4Clk4iEISWDhtOrJo0kFksDE
	Gyjbogp34pzCeXMD6L6PsR00Pun4VvMQO6/tR9BXpH2n8wZteuwFJ6Bmo41a4kgAckHUCRoD9si
	x7Kftz0VbTK8OLHNvfE=
X-Received: by 2002:a17:90a:38c6:b0:35d:9d4f:f595 with SMTP id
 98e67ed59e1d1-35d9d4ff8a6mr3077625a91.17.1774840546438; Sun, 29 Mar 2026
 20:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260223-yv5_revise_dts-v5-0-fc913e902488@gmail.com>
 <20260223-yv5_revise_dts-v5-2-fc913e902488@gmail.com> <73ea41bf341df0e3215c58a029c9ea2386c4ef8a.camel@codeconstruct.com.au>
 <CABh9gBd3b9TB1-s=Gq1q-M8bX+4UioXePUF0DPVrU2N3N8S9yw@mail.gmail.com> <d7794f74b26bbc1ee0a70e39c5671acc018f80eb.camel@codeconstruct.com.au>
In-Reply-To: <d7794f74b26bbc1ee0a70e39c5671acc018f80eb.camel@codeconstruct.com.au>
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Mon, 30 Mar 2026 11:15:53 +0800
X-Gm-Features: AQROBzAgZ9-0Ybc9ZvULPVMA1y-kfdj-DVMBBwWYIa1fxoX4faQR_SIhsXqj-zQ
Message-ID: <CABh9gBddmoLWyJpuKr8ieWCCHXgPPNn+zCS2WDkUn8x2NBkzqQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] ARM: dts: aspeed: yosemite5: Remove ambiguous
 power monitor DTS nodes
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Amithash Prasasd <amithash@meta.com>, 
	Kevin Tung <Kevin.Tung@quantatw.com>, Ken Chen <Ken.Chen@quantatw.com>, 
	Leo Yang <Leo-Yang@quantatw.com>, Jackson Liu <Jackson.Liu@quantatw.com>, 
	Daniel Hsu <Daniel-Hsu@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_201548_324398_6CA52266 
X-CRM114-Status: GOOD (  31.92  )
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

On Thu, Mar 26, 2026 at 2:07=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Kevin,
>
> Sorry for the delay.
>
> On Mon, 2026-03-09 at 11:41 -0700, Kevin Tung wrote:
> > On Tue, Mar 3, 2026 at 6:41=E2=80=AFPM Andrew Jeffery
> > <andrew@codeconstruct.com.au> wrote:
> > >
> > > Hi Kevin,
> > >
> > > Sorry for the patchy replies so far, but this series bothers me and
> > > other priorities keep bumping it down the list.
> > >
> > > On Mon, 2026-02-23 at 19:17 +0800, Kevin Tung wrote:
> > > > Two different power monitor devices, using different drivers, reuse
> > > > I2C addresses 0x40 and 0x45 on bus 10 across Yosemite5 board varian=
ts.
> > > > Defining these devices statically in the DTS can lead to incorrect
> > > > driver binding on newer boards when the wrong device is instantiate=
d.
> > >
> > > There are effective methods of maintaining devicetrees for variants.
> > > Why are we choosing to remove information about the platform rather
> > > than use existing techniques to properly describe them?
> > >
> > Hi Andrew,
> >
> > This is due to hardware design changes during earlier development
> > stages, and the fix is expected to remain stable as the design has
> > matured.
> > Could you guide me on the best way to maintain devicetrees for
> > variants? Thank you :)
>
> My expectation is your platforms move through several design phases
> prior to (mass?) production. My suspicion is that you have sent a
> devicetree for the pre-production design phases, and you're trying to
> evolve that one devicetree to match the design for whatever current
> phase you're in.
>
> So, ideally: Send a devicetree only for the finalised design. Don't
> send devicetrees for pre-production designs.
>
> If you feel you can't do that for some reason, an alternative is to
> have a separate .dts file for each phase in the design process.
>
> This may sound tedious but it doesn't have to be a burden to maintain.
>
> For instance, you can use one or more .dtsi files to describe the
> common components and relationships for your platform. These .dtsi
> files are then #included into .dts files as usual. Often .dtsi files
> are used to isolate different hardware scopes (SoC vs board, for
> instance), but we're not limited to that, we can use them for the
> purpose outlined above too.
>
> If there are only (very) minor differences, there's also the option of
> #including another .dts file. From there you can adjust properties or
> even delete nodes where it makes sense. For example, we maintain a .dts
> file for the latest revision of the AST2600-EVB, but we also have a
> separate .dts for the A1 revision with a different regulator setup:
>
> - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts?h=3Dv7.0-rc5
> - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dts?h=3Dv7.0-rc5
>
> Any of these are better options than this current approach of trying to
> justify incompatible changes against unclear design boundaries.
>
> Andrew

Hi Andrew,

Thank you for the guidance.
We will submit devicetree changes for the finalized design and ensure
they align with the hardware to maintain stability and avoid
incompatible changes.

Kevin

