Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02BB6C4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 17:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E/g1N4QwqpckT0NASK2yVHIbntEJkDAoohaN0e1WJsM=; b=4EcdkW3FOKqY8m
	+G2EpMsztGNrhkvtblR05ZNJcufTosNkZgbG3CH0qw6T2d3V2itVdNQ91G7hCnAZITSaRkBDxfuby
	+Rh3PgR0vX7EKcOaqxpFok+TF9uiW9v5a0xanZxKJMhg2wDstxE5NDF856+zZSgtpqW5bfQoTE1iE
	R9oeU/v5TPPFRzC4TvvLX7o1Jg+2ZpOGDz2hJL1AKCubkWmObbD9pa714uw1312zZx7MxhlIsJRNe
	65mAav0rKs4O65NR89d/KJ0fRNpHSZhYzcowL4r4tpLHEkvHmn4CBJmPrB44tUQENWW+7JQ1f4vYr
	auSkEEuTcYWPgDhS3d7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmazA-0000000CV0r-3uyZ;
	Wed, 22 Jul 2026 17:44:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmaz8-0000000CV0l-3MPK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 17:43:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 26BF943BFE
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 17:43:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 168D61F00A3D
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 17:43:58 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39c8ee87f7eso77840251fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 10:43:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqqYaCvEC1Gysal2RtHjZwfm29NIpgaXrJwm9N4XnXdlTtpiN0JxXA1HkGx79uB4CTLDwpOTPwB/aIhwpNe5lDb@lists.infradead.org
X-Gm-Message-State: AOJu0YxDi9CF3HMD3y+Zuy39Vd7dFln6vm3dmxX6TZdmW/jVs3C7ADzs
	uaal+DBv8u6IGnSuuagnyj713/AfE3FMhiPPqxEfgNjtze1QI8A4RbjdPRNRal0bbHzAoTtLoOs
	tIymwy5ih4mKZx9icNbwGusgyXqIxB6k=
X-Received: by 2002:a2e:a593:0:b0:39b:14ba:a5cc with SMTP id
 38308e7fff4ca-39eb294c024mr42599721fa.41.1784742236447; Wed, 22 Jul 2026
 10:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260722005643.1208942-1-enzo.adriano.code@gmail.com>
 <CAGb2v67GDBTq8vdxNxBfNVSe=oStcgaJzm0ig2WAEXNQSkVa1g@mail.gmail.com> <20260722173714.2394348-1-enzo.adriano.code@gmail.com>
In-Reply-To: <20260722173714.2394348-1-enzo.adriano.code@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 23 Jul 2026 01:43:43 +0800
X-Gmail-Original-Message-ID: <CAGb2v668dnH4BT=2rrWq+s0Bc_qfpRpS3a17wEeDWNxifD3t2w@mail.gmail.com>
X-Gm-Features: AUfX_mxhUF5O2qxLlZC_gBBNFeiWZssw5GcuKnEBQjVfI4pbcu03QcQpsETrUsY
Message-ID: <CAGb2v668dnH4BT=2rrWq+s0Bc_qfpRpS3a17wEeDWNxifD3t2w@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: ccu_mp: fix clocks without P dividers
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Junhui Liu <junhui.liu@pigmoral.tech>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Jul 23, 2026 at 1:37=E2=80=AFAM Enzo Adriano
<enzo.adriano.code@gmail.com> wrote:
>
> Hi Andre, Chen-Yu,
>
> Correct, this was not tested on hardware; it was build-tested only.

For future patches, if you only build-tested it (which is a hard requiremen=
t),
please mark the patches with "RFT" (so the subject prefix is "[PATCH RFT]")
and note in the footer that it needs to be tested on actual hardware.


ChenYu

> Thanks for the review. Chen-Yu's point is right: these one-divider clocks
> should use the single-divider clock class, which already supports
> CCU_FEATURE_UPDATE_BIT. I'll drop this generic ccu_mp patch; there will b=
e
> no v2.
>
> This analysis was done with AI assistance and each finding was checked
> against the cited sources.
>
> Regards,
> Enzo

