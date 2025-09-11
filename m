Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A907CAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 08:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RfrUIaFbCw2u4DmADOWE2bC7dcf1XW4YsNsgjdQgf1c=; b=fTFQvTcXDqSVM6
	uw+DjB/n+y7bocn1S33ZaTXKUYAj0KPwy2umHpueHN7ZfejDLk9Y9SHTM+t0P4Llv7HZP+AM+VJTh
	EmOWehsl2p9sM2uZhzYVfNKatCesqFOfM+xsPRf59oXsDbyLcmmkWuBF/85YRKS+QAOg1DFEUnirL
	npVWA+4Ltks8JFWqfp0IbYGVMpmFmDZGZ3VvBcL4ViXQKVVOA4d+BgN+geW08WB/rmOHWvPFJ2D5e
	wAiT67YfyJYJ6L/W4dttankh7eEbfJgGGQsWUBlkhWRDu9Bm2hly65BZclLi58TkUqI/N6kidl0MP
	wuu6pdp9J/ffppUBq8jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcjH-00000001puV-3paU;
	Thu, 11 Sep 2025 08:32:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcjF-00000001pu8-0KFQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 08:32:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 97D7244A95
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 08:32:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68DFFC4CEFA
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 08:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757579548;
	bh=b2VdI0oiFgANIQ5EcSr5TSR36SCbiu1w6XGUxBLPye0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=ggwfqerCBJ1oYsXw0auys/TMtk4zaG9x7lznAz0fZd/PEGMVwaFpxx0uC/OsvO39x
	 SiawMvf9VZHE+ShtVyxyx3ND5AFG23QTZC6RqijxgWVv7A/iT4xT3WqwkD+9SQjEFV
	 G16eIdL1mlAZGfESCa+MEFecoFzqyCZppbIosb/lkhblLK68WwNSwX/LhJzLFhlYSQ
	 cnkSQ7m6QIysXsCxnQM0mTpbpbScGyq/sDikZDPvF605zIhC/8WqxkIpOxdRp6pYBm
	 4ArupEjs/BkGtlCSwwFWRUXEfBCrPlMM1jVV/+yVuPaNFSJVB58j8RrqE8DEIo6Wx1
	 2ISRg3UigNqNA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55f6bdcc195so1422484e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 01:32:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3gCSiadKCmKX0qEf6rpDr4xYdqJXaw6uRyW70bOWFxsTQJa0DKmd2HsD/oLm289QGiejhXheOvZsa/YDMbwLi@lists.infradead.org
X-Gm-Message-State: AOJu0YwAjo1e4FkK4EvDp5lpJa5CHvPykM2VD+ZjtLpMLsPhpAVAWI4R
	ZKvefotN17b+brXLUm8WC+vzyj3W1nMwiqqq2c8LNHeSEGxSlO998WzG79pq9SJ7jbbi3b8cQ0f
	5lCuYVBd/iBtNhfpUEoLXeOAf6loZpb8=
X-Google-Smtp-Source: AGHT+IEz1m0zWqpjfWD3q5Mpqcxnmo7hPZOolLE36cs3jks02zZUBgKBjW6cLa1Fu1krMrNSe+ZBiHzMUOEzh8/ZDyU=
X-Received: by 2002:a2e:a78a:0:b0:336:e03d:6f2e with SMTP id
 38308e7fff4ca-34e315d71a6mr9066571fa.1.1757579546741; Thu, 11 Sep 2025
 01:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250830170901.1996227-1-wens@kernel.org> <175751929795.2643345.10671677254490584515.b4-ty@csie.org>
In-Reply-To: <175751929795.2643345.10671677254490584515.b4-ty@csie.org>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 11 Sep 2025 16:32:14 +0800
X-Gmail-Original-Message-ID: <CAGb2v64i8fU-KTE8A0sE+ZL2++c3faUPKyGp51S7_rWV9ydOGQ@mail.gmail.com>
X-Gm-Features: Ac12FXyr2JevaeRf3qm7Q61BcimJDVOxLg7_etSYLuUPLWauqufXTtpAA-OUUag
Message-ID: <CAGb2v64i8fU-KTE8A0sE+ZL2++c3faUPKyGp51S7_rWV9ydOGQ@mail.gmail.com>
Subject: Re: (subset) [PATCH 0/8] arm64: allwinner: a523: Enable MCU PRCM and NPU
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_013229_144334_0BF768B1 
X-CRM114-Status: GOOD (  16.51  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Sep 10, 2025 at 11:48=E2=80=AFPM Chen-Yu Tsai <wens@csie.org> wrote=
:
>
> On Sun, 31 Aug 2025 01:08:53 +0800, Chen-Yu Tsai wrote:
> > From: Chen-Yu Tsai <wens@csie.org>
> >
> > Hi folks,
> >
> > This series adds support for the MCU PRCM and the NPU.
> >
> > The MCU PRCM is a Power, Reset & Clock Management block that has some
> > clock and reset controls for the MCU, DSP and some peripherals that the
> > MCU could use.
> >
> > [...]
>
> Applied to sunxi/clk-for-6.18 in local tree, thanks!
>
> [4/8] clk: sunxi-ng: sun55i-a523-ccu: Add missing NPU module clock
>       commit: 1ec8e9ba1f663d6ca5e71ab9f5e919c338075ff0

I forgot this needs a bit of work and a new version sent. Backing this
one out (facepalm).

ChenYu

