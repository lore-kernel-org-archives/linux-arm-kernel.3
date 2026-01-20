Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2901BD2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 08:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NA4JTGm5EKA0DtVd/uWEi4uM8RUpAnkAGhWVoxOqPEA=; b=2IvPG2qegHead4fYAsSdgJg07T
	glEEygHAbLiHL18emj5Et+Ft63P7M20cATUuGgjHfSUZk4BVFc84R2PDRtbkyOmfHq3JISpQW8n4q
	FzhQoEVyPeFuoZ0AlF/Y+Xik54NWoGCz9Who7mXhV0PFp5SUY19aNDulgswDxlBbkw3vhVIXBJmtU
	7h+suauW83uJZINEcrCmc6wCja/y7hT8Jd9H3GNXEr+SbPu4Q7OuROTPVhuAS4VddgYI9CQwwK5Kp
	SbnV7h/JRSDq0m7Ozepb3QPcarnGyp+IlWiv08pbfN7nlPSxPZ6ydCMASL3GyECmhBoCZRQP+Ls1E
	0JWo9gJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6mx-00000003RBe-3s5S;
	Tue, 20 Jan 2026 08:08:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6mw-00000003RBY-1swS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 08:08:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C7F86011E
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 08:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30270C2BCB0
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 08:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768896513;
	bh=NA4JTGm5EKA0DtVd/uWEi4uM8RUpAnkAGhWVoxOqPEA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E8ET/ZWaSEu9/MbotIBXsUekx0xcCP2Z8bYM+aLhxaY3CuxoZ4AvAvUMfE3WM0XmS
	 Jrsh+L+YxD4EVdd5ogjiMCP6QWRXv5diYGJKeccPips8pGytxydfbrUV3WeXaQ4sF4
	 522wXmz4PHiAlSnAt4eLThw90pMZTM29EFCPcSPxLmSI2dpv8SDGTQUXWaoQ4ia4V1
	 bfXw6Z2uyju/m6KIPVMor+RDkuW5DLkO3oXZ3o8fgsXjT1AJXJ8c+lre3mU0oWKDRl
	 BxU1QnmY6QFHDZJGWfsSLGtGTZInZPe4vIXgtFElZ5VrCdi6O1zA9rtslcb3GYIiZw
	 SCf0j35ZnVmfg==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3831ad8ae4eso43002841fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 00:08:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVZD3zYTl+uTDOyK1U+Lgk4J1QVmFZcQetKLVRFYtnuV/YqwhZyDyI53rmMWHH/ztJAfr1AucbrsBJfIQVFxNqG@lists.infradead.org
X-Gm-Message-State: AOJu0YwZH4/rt4W8gmYsYZX4bMZdZMaq+eAP5UeRU+juVgfI5WW9zseQ
	Pt43UN49Imha1vRsTDhI7t380CakVXuv/ROqdKpomZnUr2GJlsqNnxj6gPucFPtbqnsfL7ZiW1s
	Z5vmNPPB3XWPqVZFwJLvJSvVpyAgTe5V3NyQTWqH8hA==
X-Received: by 2002:a05:6512:114a:b0:59b:7a1e:d3f with SMTP id
 2adb3069b0e04-59bafdc1eefmr4627613e87.19.1768896511812; Tue, 20 Jan 2026
 00:08:31 -0800 (PST)
MIME-Version: 1.0
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
 <20260119-soc-of-root-v1-8-32a0fa9a78b4@oss.qualcomm.com> <CAGb2v64uUhbEkB+iFjs5FGYR8E7=2nyNxDi646PmnygBZa6hQA@mail.gmail.com>
In-Reply-To: <CAGb2v64uUhbEkB+iFjs5FGYR8E7=2nyNxDi646PmnygBZa6hQA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 20 Jan 2026 09:08:19 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfFU6xfy=_R3iEreiT2qcTnT4cqx3vbL=40vS-F0HHUJA@mail.gmail.com>
X-Gm-Features: AZwV_QiFAPGyibgg_I9f0WcLSHJHA7hiPV4XToJPEVHONcLHBS618t-hqReMSp4
Message-ID: <CAMRc=MfFU6xfy=_R3iEreiT2qcTnT4cqx3vbL=40vS-F0HHUJA@mail.gmail.com>
Subject: Re: [PATCH 8/8] soc: sunxi: mbus: don't access of_root directly
To: wens@kernel.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev
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

On Tue, Jan 20, 2026 at 9:05=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Mon, Jan 19, 2026 at 6:40=E2=80=AFPM Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
> >
> > Don't access of_root directly as it reduces the build test coverage for
> > this driver with COMPILE_TEST=3Dy and OF=3Dn. Use existing helper funct=
ions
> > to retrieve the relevant information.
>
> I was somewhat expecting a matching change to the Kconfig to add
> COMPILE_TEST to the "depends on" line.
>
> But maybe the case is already hit with ARM=3Dy && USE_OF=3Dn ?
>

Yeah, that would be the next step but there may be more weird
dependencies hidden in here so let's do it separately after this is
addressed or we'll get stuck looking and buildbot reports.

Bart

