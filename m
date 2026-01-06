Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3066CDC188
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 12:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ya1sAOZPqbB+uIx51gv5nxP92HQsWyz1EXco3LawvDc=; b=BhvdCM3I5KokMJofQles53v9z0
	0O02+MAURu/tvY57CHWZVySeqnvZKILHrU8/9PjpnTU+lxWNkcVlhhOZG/FUqe6xacxetc9skmJmR
	NoGYHxG82aTq6DpsLsyMe8a/Inb0T4KW7Y02IdDNYVsEXaSrWuIBqty/4eHcuYDMN2em2IPKjWY7m
	iATf6g5XzZ5A6ZTlDjq5T8LFGutBbhr8iR37bz+gB7jSRgme90vK4q/aWL41BaHOiOuWlB3+EG0CH
	G9OILEH9Q7cMwXqidkUPahy52xeSSYUYAZJ7XMcfwwz9P4nz2gYcRkLxp9nJV1YkKY1nzyX7u/g2v
	B/D90N1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd6CY-0000000D01F-3sq1;
	Tue, 06 Jan 2026 12:30:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd6CW-0000000D00F-1qRv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 12:30:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 685C34428D
	for <linux-arm-kernel@lists.infradead.org>; Tue,  6 Jan 2026 12:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48A23C16AAE
	for <linux-arm-kernel@lists.infradead.org>; Tue,  6 Jan 2026 12:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767702615;
	bh=FQLuWk6kGeepu32+iEhmSBIml17MKCpSgScV1hNzA5M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HXIQGolhJd+z2QWLEBFeABhZ47UV+ZqLlMYQZMSXGkXybgCSUMThTPkOhy7FP/DHB
	 l8qEm7zdPU/7hMyymyc2p/UCL70HdVwBwT2uS40GkLwO55PvUbyqaGP6ZIlOHCqBeM
	 faTczxDN9TEP/LXKveKplEs0dYoHtNbmuuIBJE6xkKVYfnDxROQaYvEx+oKTTCb6GJ
	 8Xm8HzxOMqVvj7qpTMHLTnSPUYGAX0ECoPgMi0z3KMNX51mbt+u6DkhTm27KqYMibG
	 Vi29sFMBXAgiQNvGUJfYg/1gaYhj8LmbE+kDtdkAbjsOU9rZL3jaf2pobGR4WqwFzS
	 McGbyE7qUafOg==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-382fa0dc9f4so1568991fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 04:30:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWX3j9eY+HR8Hr/ib4HR2bs3QQW4XRxjVwI8AInVcC3OeqkA17LXy0o7Kxgclq96OP9ThoFZK0MZmaPhuvUfmpz@lists.infradead.org
X-Gm-Message-State: AOJu0YwnxQdIFKOt/BXky7o2qSHqY0QDuhP5GpDnO6B4cNd8IdkqIusy
	i78LEeFZpo5GbV47s2WI/Kuiqm6YunhrXBb4kRPEN4lkbXXL8zYJo7bOeuaQqzef462M/tZ/mlD
	Sv9AnZs48zwBWyp8HavEDYW1y17DKQg/3fw2u6JapIw==
X-Google-Smtp-Source: AGHT+IEv1cDKis9ahl0NHeYL6ip0JnRoN/mEt3uGev0kmbqpRkYiA+Ba/VisBT/vnF4d+mRmFetyQymW+clo868a2ZE=
X-Received: by 2002:a2e:a58a:0:b0:37a:34e2:88e7 with SMTP id
 38308e7fff4ca-382eaab3976mr8018841fa.22.1767702613967; Tue, 06 Jan 2026
 04:30:13 -0800 (PST)
MIME-Version: 1.0
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
 <20251228-arm-psci-system_reset2-vendor-reboots-v19-1-ebb956053098@oss.qualcomm.com>
 <CAMRc=McEB+yVYxropzsqLExZCU5Pd_iy_=5N3pTxu28-ZX=7_w@mail.gmail.com>
 <acbb37a1-3189-4d4e-5c05-55b13cd40a7f@oss.qualcomm.com> <cvmtn335gwnl6rvmlm4vgyablsj735rknga4ffv53gpk4k7d6g@tt7ebuyusocu>
 <e4b01dc7-02dc-060e-d1a6-abd2c801a78a@oss.qualcomm.com>
In-Reply-To: <e4b01dc7-02dc-060e-d1a6-abd2c801a78a@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 6 Jan 2026 13:30:01 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfaCKe2-Eca6fZ00NQkdLqJV-NH0XAsTKHkU3N7P7pnEA@mail.gmail.com>
X-Gm-Features: AQt7F2qoW4mNxgIcydrH2q8rPkPDFlKCMFSE05cerY8eWHdGfV_LH-ZXO5y5uFs
Message-ID: <CAMRc=MfaCKe2-Eca6fZ00NQkdLqJV-NH0XAsTKHkU3N7P7pnEA@mail.gmail.com>
Subject: Re: [PATCH v19 01/10] power: reset: reboot-mode: Remove devres based allocations
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, 
	John Stultz <john.stultz@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Moritz Fischer <moritz.fischer@ettus.com>, Mark Rutland <mark.rutland@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Srinivas Kandagatla <srini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_043016_519051_0E9918F5 
X-CRM114-Status: GOOD (  19.46  )
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

On Tue, Jan 6, 2026 at 7:31=E2=80=AFAM Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
>
>
> On 1/6/2026 3:01 AM, Dmitry Baryshkov wrote:
> > On Mon, Jan 05, 2026 at 11:46:40PM +0530, Shivendra Pratap wrote:
> >>
> >>
> >> On 1/2/2026 3:35 PM, Bartosz Golaszewski wrote:
> >>> On Sun, Dec 28, 2025 at 6:20=E2=80=AFPM Shivendra Pratap
> >>> <shivendra.pratap@oss.qualcomm.com> wrote:
> >>
> >> [snip]
> >>
> >>>
> >>>> +                       pr_err("reboot mode %s without magic number\=
n", prop->name);
> >>>
> >>> If this is an error, shouldn't we bail out?
> >>>
> >>>> +                       continue;
> >>
> >> This is not an error as per original design of reboot-mode framework.
> >> The code as of now says, if the reboot-mode node has an entry without
> >> proper magic value, ignore it, and, process the next.
> >
> > Then why are you using error level for the message printout?
>
> I have changed from dev_err to pr_err. Can make it pr_info. Will
> that change need a mention in commit text?
>

If we can ignore something safely, then I'd just use pr_debug().

Bart

