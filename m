Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1FBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 05:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gOChh1ohTaPrZ+Y1GE41WGbMTNjpPj91qb2GtVmX2R0=; b=NtW62Zac1N+NA6
	Kmut2Nqs9qJ/o/F1sMd4LP8MlzTo9T8bjhmPInRqv6B5Mp8yZ+JoZ4QJAPpvgjA9y8qFXIB+w2yqU
	eSx02+qsc3Rv+BS2WDJ30J1La1ifruip2llHvonuWt6jKbH3vtG8dnPEaP+JOvMPY9GRI2gTn+BHO
	m1QLK760BJNJ4hwry9QtTMFKh6E56fZ7t7uvXDjsHMgAsQsMvsHuUQSlrVmi2Ra5zRAp2Yrzsxdwu
	k0hcDt988f2lRWwLZgoCYALuPOtgzQFkZotKAx8Ht5fA2+Ef6DZm9YCNcL7DGLa0AVRLrQJW0NDYa
	0tRPiScDlRI/PhT6ogCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wimcv-00000007APM-2z6u;
	Sun, 12 Jul 2026 05:21:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wimcu-00000007APE-2qSK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 05:21:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A1B743B77
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 05:21:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D18701F01559
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 05:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783833675;
	bh=gOChh1ohTaPrZ+Y1GE41WGbMTNjpPj91qb2GtVmX2R0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=eZYjivwv6VxAxWDT4CG10n7zgNfpl+yGBRHvlv+VwU8uXLyn1wc+PO5/iRDBxzHEp
	 9KERussY+0ce6BWxHPRqoemDGX6IuPvUd3Ih2HNqrgMdj67+8sUdKVVRgav1JTa+YX
	 EDha5Q+TqABhsIXaAEklbmTLoWflCd0PRwGn7XAgNUGeUV2YmVaiJQfvUrVeqVeohW
	 A20033eiVAXlsMW6vDjhh0/N3CbLB/FZNnmhuIrERosMXXNFm4RzA3qbWS6TNrbrXk
	 lHlxAfOC79bdb47Orlsx77kb6H1ka6RqU0CLyQL/lrSGy1acr7Dg2fnT6PVtc/DRk1
	 bcnnV44Nt5zvA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aebd52488cso2316006e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 22:21:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqTE3aHjr2cOCp/nqigd4tkLHjzcAgDuSjQifDjZdnchPYhMCsenpgvuPoZ1KCFBunwhxB1tQ/gaMtRBtZmeQq/@lists.infradead.org
X-Gm-Message-State: AOJu0YwGezw520qGfC1R6h4O65lE1/A/o0D1U/VKubAI+jwdNYcF+en8
	SDe0Sdcypte3mWX3wiG7m2luXAohssE9dbDKXZVUz0JsiHH3sVlpds3miMRge2CEyhiLXkWL5Qe
	psHcYBs4Z0ogDy9yGMg/jp0sQqTCf7SQ=
X-Received: by 2002:a2e:a54a:0:b0:39b:1e0f:5805 with SMTP id
 38308e7fff4ca-39caa80ec19mr9352491fa.24.1783833674238; Sat, 11 Jul 2026
 22:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260704171411.1413349-1-iuncuim@gmail.com> <20260704171411.1413349-4-iuncuim@gmail.com>
In-Reply-To: <20260704171411.1413349-4-iuncuim@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 12 Jul 2026 13:21:01 +0800
X-Gmail-Original-Message-ID: <CAGb2v64V9fXrEZD-mB8cLs0hwp6WbpKhhkDzBqLmnZe5DQBtUQ@mail.gmail.com>
X-Gm-Features: AUfX_mw9aYjn22Umh3bpOaSqB39rYIPvYv_r-wBdphks-YmEqPaE5LTT0cIaXBI
Message-ID: <CAGb2v64V9fXrEZD-mB8cLs0hwp6WbpKhhkDzBqLmnZe5DQBtUQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] thermal/drivers/sun8i: get calibration data from
 two nvmem cells
To: Mikhail Kalashnikov <iuncuim@gmail.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
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

On Sun, Jul 5, 2026 at 1:15=E2=80=AFAM Mikhail Kalashnikov <iuncuim@gmail.c=
om> wrote:
>
> The A523 processor has calibration data in two nvmem cells. To be able to
> add support, the ability to add data from two cells into one array must b=
e
> added.
>
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

Some of the variables could be moved into the of_property_for_each_string()
loop, but it works either way.

