Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2E8106FD9D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 08:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2nRDxZu+d9TWrj4WVetOFAoz7B787w6aylEKVWKeURU=; b=Pw0V9vyEbrWXX0XEI5//MdAyuo
	I5bAC5hsX5Vld6RdQYnIc9J8QXQHKMFQ/gfo8MerHlmpKUcUZdK0FIjTSpzf41XiUuP6gWRE55F2A
	akP8CzlhEKHD9InvH0Px39tTpOxnAZSDSVvdUwgEPKy+XgA6pilioQGN22fv5g/guc6OZJA5bjgK4
	NhrEthuNMrIcH3EDnDUtNyPq95n4uFCl8ddFBOTXO+KHDDFZfvKxemGai5/TvOYKbHwc/vXw0KsgN
	uYoe60DxFh726MwXP2rUhyWwyBbBodMWGOfrEOf3Rn2ymMmudWBYo8SGd/aKInqxuOxbu/UEwG2Jj
	bA2lRMGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0y0t-0000000HHah-4B40;
	Fri, 13 Mar 2026 08:36:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0y0r-0000000HHZz-44UF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 08:36:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7258A4426A
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 08:36:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5690AC19424
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 08:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773391012;
	bh=2nRDxZu+d9TWrj4WVetOFAoz7B787w6aylEKVWKeURU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=pEVHVxmxlyR1AQS1tR8C2csZ0Qi99RNivHqgeYILFINvq+UgxBXoaqmb2GYX/Ld4+
	 Ggrfr8od449FzPXaxUdGgWt9/wtQ+twSFhI5ShnQhf+y7mcdjLtdJ57IX6OVMgv3Jt
	 xOfteiTDFayLyYkGt8Nn+e+3/sQZlOyOpu4k3d0cYbILyJZ19z4aLF5ss3oSCP/ncp
	 zA7ewy+LaQATTSk1EFJSIoXRBQdGPWQp+wlgdKu9Q4NxiAihO/U3kiiejZdFS5vghm
	 /+oIxRgcMibWkmCXvDtAKs8WeeBa7Hj0DtuJLWDonFuHitIlNZDOZIIG4fL0NK1iRe
	 KnIZQzvHZyJJg==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38a4a8421b0so15919111fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 01:36:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWwz/8rKuHH5woArqsU9ziIYad81eCbhu5xGfAZAppctPAt+lzZX+WJTozxRReb50PGj2Looftem4PY4x3fquhy@lists.infradead.org
X-Gm-Message-State: AOJu0YzJoRTbJ6V5bxpBV0Y09p+VZPhP5feAZBiSWa/2ALLPd23YsBkb
	VFqkxeArtRfMxux0VZwX8lskYLe8ctCOgtWcZKRZ4oEFd0nBLHgBHBBYwA+0uOV+tCsXgDZGsPs
	/nYZV3ihHefK4K8I/VJdReByLBjbUVfCjRaNODryGbA==
X-Received: by 2002:a05:651c:515:b0:383:20cd:52fe with SMTP id
 38308e7fff4ca-38a896b6407mr7399191fa.17.1773391010614; Fri, 13 Mar 2026
 01:36:50 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 13 Mar 2026 01:36:49 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 13 Mar 2026 01:36:49 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <2026031231-whiff-speculate-805a@gregkh>
MIME-Version: 1.0
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
 <20260224183832.GB3239922-robh@kernel.org> <CAMRc=Mft5vc-C8miKVdw6C-qRdYsqfgm-UgLZJOctFwagMF0iA@mail.gmail.com>
 <2026031231-whiff-speculate-805a@gregkh>
Date: Fri, 13 Mar 2026 01:36:49 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdhhEMJn5JTB3wn_ScmV=a0o6fTnaUDSDjOLN5WH5rOFQ@mail.gmail.com>
X-Gm-Features: AaiRm50bkC2plkyLpch8sSUugz619L6Cf_EZYcxggWcjYtxkwiUVoHYnqPIvC6o
Message-ID: <CAMRc=MdhhEMJn5JTB3wn_ScmV=a0o6fTnaUDSDjOLN5WH5rOFQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] soc: remove direct accesses to of_root from drivers/soc/
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Saravana Kannan <saravanak@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev, 
	Peng Fan <peng.fan@nxp.com>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_013654_047686_091A3056 
X-CRM114-Status: GOOD (  19.89  )
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

On Thu, 12 Mar 2026 16:18:38 +0100, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> said:
> On Thu, Feb 26, 2026 at 10:28:26AM +0100, Bartosz Golaszewski wrote:
>> On Tue, Feb 24, 2026 at 7:38=E2=80=AFPM Rob Herring <robh@kernel.org> wr=
ote:
>> >
>> > On Mon, Feb 23, 2026 at 02:37:15PM +0100, Bartosz Golaszewski wrote:
>> > > linux/of.h declares a set of variables providing addresses of certai=
n
>> > > key OF nodes. The pointers being variables can't profit from stubs
>> > > provided for when CONFIG_OF is disabled which means that drivers
>> > > accessing these variables can't profit from CONFIG_COMPILE_TEST=3Dy
>> > > coverage.
>> > >
>> > > There are drivers under drivers/soc/ that access the of_root node. T=
his
>> > > series introduces new OF helpers for reading the machine compatible =
and
>> > > model strings, exports an existing SoC helper that reads the machine
>> > > string from the root node and finally replaces all direct accesses t=
o
>> > > of_root with new or already existing helper functions.
>> > >
>> > > Merging strategy: first two patches should be either acked by Rob or
>> > > picked up into an immutable branch based on v7.0-rc1, the rest can g=
o
>> > > through the SoC tree.
>> >
>> > SoC tree is good.
>> >
>> > For all but patch 8,
>> >
>> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> >
>>
>> FYI Rob also reviewed patch 8 now. Who would pick the patches up? Greg
>> KH? There does not seem to be a centralized SoC maintainer in
>> MAINTAINERS?
>
> Sure, let me take them now, thanks.
>
> greg k-h
>

In the meantime Geert sent an alternative to patch 8/9 so this single one c=
an
be dropped from the series.

Thanks,
Bartosz

