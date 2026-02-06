Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B47EE2091
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 12:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDiq+0d3D0Yh0TtokVVa4rN0HvOe1emmSsmHz5APNsw=; b=Of166hIrEM3t7sVmoM+vG1kOSz
	qKfvxUunHMxR7q9HW7AKcEzQSkWPPcsyHKIz6FEsffKqnypaPm0ESySIu9lpw5A4TQrlnQeX0sUKd
	StYGskkQx6OK2dB2V2nl82sLdejQ98gl/bcHWP6erMVmrRZRPwvS6KFfiq5bqBbu2K5x4KWh727xp
	9FMuag1jUe5ACCayO4dhMUPnUU9MvNATNBX1+WucOI+/BY6Z8T/pooDHIV/vZzV4Mh8y7V3HtzKtF
	MB6icq0ptidK1RMIiHe14nVgkY42yXhcxIuwTbXrkweuwxT/bxqvb9FMhSN5aeeNvbK4fUYLb1p/x
	RPXp0HMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voLD2-0000000BJs6-19Ye;
	Fri, 06 Feb 2026 12:45:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voLCz-0000000BJri-00lD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 12:45:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3FDAA444B0
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Feb 2026 12:45:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21A80C2BCB0
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Feb 2026 12:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770381911;
	bh=bDiq+0d3D0Yh0TtokVVa4rN0HvOe1emmSsmHz5APNsw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=D7iQgMSrfb8X5LrgDkoYgqcj8jN848P8JFQuK3dAC22+zbgJ+VhW/NsA+3UqqSg5a
	 oz0tneyrhQggAcSa2ei1F1qpuiahxNWyXyuqUKIjYkKiv0o3gHoPyXrnKQbzo3ocW2
	 +fJXboJnSu92gfyk9K6xq+IEjvkVWRH6gV7bs8IdUdwih8q7HFRv98MEqPLCPPAKuj
	 4dPxuia5U5C3jsQqCFTDt8sQP/gpopd42YbsGCYsatSWqdXUQn2Ht0pdvq3rJLqnu8
	 wTqp8dsR2O4ooQwZ7QWturXjllshjXZOd2FcA+Qn0jinU71seSIRNsR6Ae5KH5FfKJ
	 /xrAM5yb5pO5Q==
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-649278a69c5so1780251d50.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Feb 2026 04:45:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWq/4lanuH55Mu7njIZ8luYODq4ATwDh/raJUjTEGCJUQ+cZ9QHERID2dIVBRsSNMEIx0wBbQBz10C+lTRFCAF5@lists.infradead.org
X-Gm-Message-State: AOJu0YyyZn0Rj6MjQb1026ONgi/Pykalq5vSj0zdRC3IAMt/Z4k7nmSk
	vR5YKd5jj6/c8HWttcRrn9zPxAPUomko/mCwwNgNM43I16qSbhx2Bsu2h0rfvzmhf+4IsRvuNDd
	0bD1P0YcdEcF9axpRvoROXYgW8HIthXI=
X-Received: by 2002:a05:690e:d89:b0:649:f002:582b with SMTP id
 956f58d0204a3-649f1e9a146mr2416290d50.7.1770381910243; Fri, 06 Feb 2026
 04:45:10 -0800 (PST)
MIME-Version: 1.0
References: <20260203161843.649417-1-wangyushan12@huawei.com>
 <20260203161843.649417-2-wangyushan12@huawei.com> <CAD++jLn+TDfu-aQ+Kfm=unYp4Zjg=endP3GGzZcpuYFR=s1K1g@mail.gmail.com>
 <20260204134020.00002393@huawei.com> <4c5eaf8f-2433-4971-b5d0-4f35acb2820e@huawei.com>
In-Reply-To: <4c5eaf8f-2433-4971-b5d0-4f35acb2820e@huawei.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Feb 2026 13:44:59 +0100
X-Gmail-Original-Message-ID: <CAD++jLkK9av2X4mufdTVA53yvt-yzfsLwF-R57JT3gXRBsAe3Q@mail.gmail.com>
X-Gm-Features: AZwV_QgG2qCN21qfdFqp1_uUoU1snEr_v0VrvR5O7tyuWNyeNMKM9kSQmQYe5Q4
Message-ID: <CAD++jLkK9av2X4mufdTVA53yvt-yzfsLwF-R57JT3gXRBsAe3Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] soc cache: L3 cache driver for HiSilicon SoC
To: wangyushan <wangyushan12@huawei.com>
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>, alexandre.belloni@bootlin.com, 
	arnd@arndb.de, fustini@kernel.org, krzk@kernel.org, linus.walleij@linaro.org, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, fanghao11@huawei.com, linuxarm@huawei.com, 
	liuyonglong@huawei.com, prime.zeng@hisilicon.com, wangzhou1@hisilicon.com, 
	xuwei5@hisilicon.com, linux-mm@vger.kernel.org, SeongJae Park <sj@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, herbert@gondor.apana.org.au
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_044514_322333_493C0818 
X-CRM114-Status: GOOD (  17.52  )
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

On Fri, Feb 6, 2026 at 11:08=E2=80=AFAM wangyushan <wangyushan12@huawei.com=
> wrote:

> Suppose we have data on SSD that need to be transferred through network.
> We have technologies like DDIO and IO stash to make data flow through
> L3 cache instead of DDR to avoid the influence of DDR bandwidth.
[https://www.cl.cam.ac.uk/~rnw24/papers/201708-sigcomm-diskcryptnet.pdf]

So as to decode, encrypt or run some AI training/inference stuff on the
data, I get it.

The paper immediately gives at hand a use case the Linux kernel
(not userspace) could use: lock down the code and constants used
by in-kernel cipher algorithms to reduce latency on encrypted disk
or networks.

[Added in Ard and Herbert who may be interested]

Which means that if this could actually be used for these "hard
kernels" in Linux the proper way to abstract this is to give the kernel
a generic interface to request L3 cacheline lockdown no matter
if that is employed by the kernel or userspace.

> But if something is to be done to the data instead of merely copying,
> and cores needs to participate,

When you say this, is it "CPU cores" or others cores such as DSPs or
GPU/NPUs you are thinking of, or any kind of data processing core
(all of them)?

This surely need to be abstracted in such a way that either of these
can use it, Arnd mentions dma-buf which is a way devices think about
data that the CPU cores doesn't necessarily (but may) touch,
and resctrl could very well integrate into that I think.

What I think is important is that the modeling in the kernel is consistent
and that l3 cache lockdown is something any part of the kernel
needing it can request.

Yours,
Linus Walleij

