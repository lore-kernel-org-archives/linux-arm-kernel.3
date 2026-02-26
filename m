Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE10DFC5918
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 09:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q+JPGjs/pGTsOGNIOl36KuUbk8oNei+wKcehtvsLCRI=; b=TRpEGrG96d5ma4HyF6xUb3I6nw
	sXSjrNCejc0MnuPGwZSUwnc8rokIXOS5OMXxHjg50B1kh2mxXAQ/8V9oJxPtdx3SJiP/J7OGALoXu
	kclcZcbDNqslK0ABC24BIusk5RNQL6PlVSGN7+MEEtEjuDNODjB8WB+B1qu4y2xsIns5wyM9yjrzv
	6TaPGAQox58h28DkM76wGX6s3IPQvJJA1qaDbAHnKRSl0xOHrNqyQc/6My8V0vE179EyFdFN+SpWj
	h2wqWa+g9CYciEM+s51uMS/6HXpgwW680rcd5aPHGol0ZGNuQv+gjttXWbQKMMpxyXcElB4etv5+k
	WGFI3AMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXfn-00000005oTU-0kns;
	Thu, 26 Feb 2026 09:28:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXfk-00000005oSn-2p93
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 09:28:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 93AF04338D
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 09:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 416D5C2BC9E
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 09:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772098119;
	bh=Q+JPGjs/pGTsOGNIOl36KuUbk8oNei+wKcehtvsLCRI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pGu5+ci+Wn2JAlztc6J6f17nc1u7YqME6JKT+8WKxBgc0aHcELhW8ukVtK0us1QEk
	 vZNR+ptEg/K6oY7fx9VRoFz+7glIPSL8J/f3xTV38nfSLG2Pn+yOHDraiExxbpKF7/
	 RMy3y7yR6cPFN3QrnZsiNvy5AjcqAc72iEN6B5FcJuEqSOhXp2VLav781RZKXGrhyp
	 i9Dll60Oag+79Jj6SFxp8iQwslow7Q5Tc5X3tHYLya1ez1aOHjdGBcNxkq/3lzqwPX
	 wA2XfnV170zB6ymSkxYEUufb58p0kTvV/FvZXmY++w5oMjSHRFhKZm882IOP6064bh
	 MDBQX4QmjpAWQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59e5bfa4f33so493468e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 01:28:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVqngKbfS7zZRCCTZqfww4aQjMU52RsCIWZckPWoORSXNAxrCol7QBquBHib1B1Z4tuKTiIy9bEGq275D/zAxIO@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ/hvtrdM9Q4iiCC8QQrzX5+0Np0p16CYGhiPmX5jjjzek1YQW
	Pkz6b5kXxJkYvGXBPSwzcXkxrp87fU7tLvk07juGKbiX1il4FGsJFJZWQaZSZeUFHBwY0PF9tPr
	es1VFy3dMbhiMzjTNi9Y3sUIc9WT8w81mXX/DQsBVRA==
X-Received: by 2002:ac2:4bc6:0:b0:595:9d6b:1178 with SMTP id
 2adb3069b0e04-5a105eb321amr948844e87.40.1772098117903; Thu, 26 Feb 2026
 01:28:37 -0800 (PST)
MIME-Version: 1.0
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com> <20260224183832.GB3239922-robh@kernel.org>
In-Reply-To: <20260224183832.GB3239922-robh@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 26 Feb 2026 10:28:26 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mft5vc-C8miKVdw6C-qRdYsqfgm-UgLZJOctFwagMF0iA@mail.gmail.com>
X-Gm-Features: AaiRm51IEGv2tkqYAUL_wlvSqsaBCZdXcGaMbPUU4umqiYT87HTd0LJXBirO8Tg
Message-ID: <CAMRc=Mft5vc-C8miKVdw6C-qRdYsqfgm-UgLZJOctFwagMF0iA@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] soc: remove direct accesses to of_root from drivers/soc/
To: Rob Herring <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Saravana Kannan <saravanak@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_012840_759086_B7C9C996 
X-CRM114-Status: GOOD (  17.93  )
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

On Tue, Feb 24, 2026 at 7:38=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Mon, Feb 23, 2026 at 02:37:15PM +0100, Bartosz Golaszewski wrote:
> > linux/of.h declares a set of variables providing addresses of certain
> > key OF nodes. The pointers being variables can't profit from stubs
> > provided for when CONFIG_OF is disabled which means that drivers
> > accessing these variables can't profit from CONFIG_COMPILE_TEST=3Dy
> > coverage.
> >
> > There are drivers under drivers/soc/ that access the of_root node. This
> > series introduces new OF helpers for reading the machine compatible and
> > model strings, exports an existing SoC helper that reads the machine
> > string from the root node and finally replaces all direct accesses to
> > of_root with new or already existing helper functions.
> >
> > Merging strategy: first two patches should be either acked by Rob or
> > picked up into an immutable branch based on v7.0-rc1, the rest can go
> > through the SoC tree.
>
> SoC tree is good.
>
> For all but patch 8,
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>

FYI Rob also reviewed patch 8 now. Who would pick the patches up? Greg
KH? There does not seem to be a centralized SoC maintainer in
MAINTAINERS?

Bart

