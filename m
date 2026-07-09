Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD0BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 00:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ujm2++fOaQbhOA4MmQSTLdq4gprqLzthH/E1smRUGkc=; b=xpQkA+mHw9VSGiykI7cdAwU1tS
	FltUkOZOXP8cgW0DuXygQMpDIOcg/ssqL5tHPDQoZQ77Mmuxd9VRd24a9IuwKLmKmmoN1KzifwbPh
	auGxac3xMFVdLu+ACpidng6UHwVpoVqHi4huWPE01TOAUEwT+BPpD2AC5gZdwK9Nc60bDABGcDqyS
	CqUcbrM41Vs2s3rvyM3XkaMxaCm3ip5Qd8UMQR/5bdlEuqEP6GQw7ddpKakjZlo1SVXh++ZIBbrAs
	1TfriiLxhfH5TmCzcy622Tmzh61A94OOq0FyFF0SWkFEsu3q9J3TNAap7xUrIv7gDuAzLXemRff3Q
	iXbIJbxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whcNH-00000000eJu-1Wek;
	Thu, 09 Jul 2026 00:12:19 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whcNE-00000000eJ7-1Cgo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 00:12:18 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-69a5ecbbfb2so2130143a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 17:12:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783555934; cv=none;
        d=google.com; s=arc-20260327;
        b=aofHnzz7xzrGBiReI3dYT04zDCVL0JwT6mddwFOSgraHfowtaEnvtuEqg567tlL4Gv
         75phCapcITrZZ6uxOjcO2T5csmiBET5JqAinb+zKkubBcXZx94k0OWs2en3SzGlNQOMy
         BddIm6jsMOsM7dLUkZ56cj9Y1ZTBpJbPV+vUPo6twjQH1Y7vcBGh+JtIOtaJkbfvOs59
         ppeyNvd1WW+KkcmyGrncjQi5kTP9/M5S4EEIaNAtlx9E/OicNigfbTyRZhVv/jjsASwY
         inkdrO8dfH2ZBrm5gMwaGZ9VGsqf1MRh8qCAmsMsZUP48CrsjDd4dPJQw/qGmXmJHOvQ
         L0zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ujm2++fOaQbhOA4MmQSTLdq4gprqLzthH/E1smRUGkc=;
        fh=y4AFJu7YLconBZaTZSQVhp8rDtW81KP4ikoGir0tYDs=;
        b=BGfJssDPS9lVW87zQ87C0mkS0AAtLidZhxIBQsK+Wimii94ScyZQhefLYyDr1V2JqF
         pTfFAkHfAgT0+GEm5y07IuM6jNehA03IFi12RWrgy5oaM0CyRl3cXqfiHvTi+sm5lJAC
         A/1rVfazELYNP4nw0KOVNYEYbbdj+8EryAw6wLRNspQYQ0Vm90XgpgY6uJjfo62YKnxr
         Z3C95AOKHI2B37yFSLIKEoOtQaZ1tV4b7gyGVS5ZZjp638vHPWKbE6qs9zqPv8HBYCfi
         0woFcWcGNt+TvbmAP/TRqf6ltCYXEEjBwwSP41y940XFcTveutc7f+c+U37yvJ6n7LKt
         Hi9A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783555934; x=1784160734; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ujm2++fOaQbhOA4MmQSTLdq4gprqLzthH/E1smRUGkc=;
        b=MFyATvdH0fEzEtvqLFt/Sji8naBt2ovlMC3DEYMmvpStWht0Wt0NHBCRfZJRfu/wOB
         LNKtozYfVDsjGuxKNoP/YzyBRQcxSUYFM8EhNuoyJ8p9nwgk8LXRVMLsuUpoU2jJ3wpM
         rIfFrc4+7wgxt2WppZDYFVYEclebhflWFCiNKz6l7XDb9ZKMozkE0QacNdS+7qggbR5Q
         7QPcULJIpRqbIHf6CAIU0glN+78pHtsBLtbn7fIUvLy13JgV34lyK/c6hUkdg1mZa3Rs
         /m9c5bBc+ySvkFqZO6n/IFWYz4NSzkIqH9jzmtqELu/7dRgosuVgU/1lP0kmMIQ8qVP5
         Np2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783555934; x=1784160734;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ujm2++fOaQbhOA4MmQSTLdq4gprqLzthH/E1smRUGkc=;
        b=XRbgfBVOQZhTjfkWe0aixdY4V3VUMKTN5YJ/+gpIPFOXROZJ019S8EeBaZoFAnuIF5
         i9nJvXNrDbEZQ/ccDQvSAhxM2XwuNsQEwAc+S2tkUCqsoFsHNaXrVXP1WZR9mpxIyBP5
         VQJJVIrEQ3H9PLoXvfvZ0BepNIyDlKGjmF6H2uKM1PX1yxMsdmWDHgA2rwFmtLiUDBFP
         niNyuRx4x00+wL+47T216qv9vwQIuMwekAyMICgxojHpFXnM4kDREiIrX/Yn7g1aNpv9
         lEnqZpIZJE+KR7BXyGjEVZGjO/Db7NmefsCxQlJceAtNuu/Bq9exysRkZCIU0vbtRnEh
         +iug==
X-Forwarded-Encrypted: i=1; AHgh+RrwgWPl4oJ1hnQ3B9r9LA/pprMvCZxBrCcf0DErKrq7eVwLGUjp198I4bR0lOB+Dx3hKi05XaK6IvHtVKUtO5Dm@lists.infradead.org
X-Gm-Message-State: AOJu0Ywns3HQd5itvAsvrP8N5y9iZtJGyHGT8WC8EtZFbcfcAn7F44MO
	fKAxEvZHsrHKncpkRhWa/fPlL7kDhraeFPwBUwCyeRVJ4rW5IYT3qTJitG7lNxV+cpHz4yZ9kfU
	o4scfvcCiN2j5LgLI2V2Dwf42iQdUtsAhwUrQLVys3w==
X-Gm-Gg: AfdE7cknIzc4HGVe/3sgmUNd47nGoBaEJ715jxWQbNICf92bXPYk/fHMjg5ZskFm3j7
	4JUjOLljy2eMbTauXcpuUO4oCGM0Ajm5tjQPKuO0onRn8cO1kCAyTSfY8R/XOIS4wSCCsaGEOKM
	A+KQ4wVrDoBAbAutscjOoxeIjuASLp2ypBC0KfvHWbkjC3JWUI7FAzg3J7ra5QMkBrarB5GECaS
	HKrZGpkC8borvCwTMEQYu3afTbfjfMwfyoQP1Xy1VzEMzA+2nW6Q3yqZtNPF7g8rIBqS8AO5HAy
	FL6E/tPvkNebTX6Oe+5G7cTO4TS1xUKQ9+1ToIfP
X-Received: by 2002:a05:6402:4283:b0:69a:b3ab:dbea with SMTP id
 4fb4d7f45d1cf-69ab4460cf7mr1758244a12.13.1783555934141; Wed, 08 Jul 2026
 17:12:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260604135255.62682-1-midgy971@gmail.com> <20260604135255.62682-7-midgy971@gmail.com>
 <e44b506e-e9d2-48e3-acea-ab28b7be9b37@rock-chips.com> <CA+GS1Y16++cztPxdUGLrPA73ENm4vJGFrjm-jP8r=8OQqcMJGA@mail.gmail.com>
 <0919ffcc-81c3-483a-a3ba-404b455c2040@rock-chips.com> <42f1f39f-ab2b-4473-a82a-7ccefad41fcf@rock-chips.com>
In-Reply-To: <42f1f39f-ab2b-4473-a82a-7ccefad41fcf@rock-chips.com>
From: Midgy Balon <midgy971@gmail.com>
Date: Thu, 9 Jul 2026 02:15:34 +0200
X-Gm-Features: AVVi8CcApkElNM_3Z1d6_PvamEAEJfcZGBI9cxUob9-qJkpZOuLDZsOO_EVsZe8
Message-ID: <CA+GS1Y1i87vkv+9NAdqRGNCNsxjQwat2yqEFxjgDZRAPsQjaQA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 6/9] iommu/rockchip: Clear AUTO_GATING bit 1 on the
 RK356x v1 IOMMU
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Simon Xue <xxm@rock-chips.com>, tomeu@tomeuvizoso.net, ogabbay@kernel.org, 
	heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_171216_377957_8F331BEF 
X-CRM114-Status: GOOD (  29.89  )
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

Hi Chaoyi,

Sorry for the slow follow-up =E2=80=94 and thanks again for the pointers, t=
hat closes
this out cleanly.

I read the two rockchip-linux commits (7f8158fb, 6a355e5f) and the merged
patch you mentioned: "iommu/rockchip: disable fetch dte time limit"
(Sven P=C3=BCschel, From: Simon Xue,
20260428-spu-iommudtefix-v2-1-f592f579e508@pengutronix.de), which Joerg
applied on 2026-06-02. It adds DISABLE_FETCH_DTE_TIME_LIMIT (BIT(31)) and
does exactly the auto_gate |=3D BIT(31) read-modify-write you suggested, in
rk_iommu_enable() before paging is enabled, for every Rockchip IOMMU. So bi=
t
31 disables the DTE-fetch time limit (without it the newer revision blocks
after four consecutive master DTE fetches racing the CPU's IOTLB zaps); the
RK3568/RK3588 erratum is the same one as RV1126/RV1109. That's the accurate
description I was missing =E2=80=94 thank you.

Since that fix is already upstream, I'll drop the AUTO_GATING change
from my series entirely rather than carry a
duplicate: v4 will rebase on top of it and the NPU MMU picks up BIT(31) for
free. For the record, on the ROCK 3B the NPU IOMMU services the NPU's reads
with zero faults both with BIT(31) and on the reset value (0x3), so this is=
 a
no-op on my hardware/workload =E2=80=94 but rebasing past the merged patch =
is the
right thing regardless.

So my v4 IOMMU dependency list becomes: your per-device-ops series, plus th=
e
merged "disable fetch dte time limit" patch. My series no longer touches th=
e
IOMMU driver itself.

(The convolution output is still uniform zero-point / the job times out =E2=
=80=94
that's the separate NPU compute-completion issue, unrelated to this.)

Thanks again, and kinds regards
Midgy


Le lun. 8 juin 2026 =C3=A0 05:40, Chaoyi Chen <chaoyi.chen@rock-chips.com> =
a =C3=A9crit :
>
> On 6/8/2026 9:45 AM, Chaoyi Chen wrote:
> > Hi Midgy,
> >
> > On 6/8/2026 5:05 AM, Midgy Balon wrote:
> >> Hi Chaoyi,
> >>
> >>> As I said, it is v2. Could you please try using the code below instea=
d and
> >>> see if it works?
> >>> [ auto_gate =3D read(RK_MMU_AUTO_GATING); auto_gate |=3D BIT(31); wri=
te(...) ]
> >>
> >> Thanks -- that's clearly the right shape (read-modify-write, before pa=
ging is
> >> enabled, keeping the reset value instead of my clobbering 0x2).
> >>
> >> I rebuilt v7.1-rc6 (with the rocket RK3568 series + your per-device-op=
s work)
> >> using your bit-31 version and tested it on a ROCK 3B: the NPU IOMMU co=
mes up and
> >> services the NPU's DMA cleanly -- the NPU probes, attaches its domain,=
 and runs
> >> repeated conv submissions with no DMA_READ_ERROR and no page-walk stal=
l. No
> >> regression from the write.
> >>
> >> To be precise about what I can and can't show: I tested both ways on v=
7.1-rc6 --
> >> with your bit-31 write, and on the reset value (0x3) -- and the NPU
> >> IOMMU services
> >> the NPU's reads with zero faults in both cases (no DMA_READ_ERROR, no =
page-walk
> >> stall). So I don't have a failing baseline here that bit-31 visibly
> >> fixes. Is the
> >> AUTO_GATING write needed on current mainline, or only under conditions=
 I'm not
> >> reproducing (a particular traffic pattern / silicon rev)? I'll keep th=
e patch in
> >> your form unless you'd prefer to drop it.
> >>
> >> One question so I document it correctly: what does bit 31 of RK_MMU_AU=
TO_GATING
> >> control on the v2 block -- is it a master "disable internal auto clock=
-gating"
> >> for the page-table walker (i.e. so a TLB-miss walk's AXI master keeps =
its clock
> >> to completion)? The RK3568 TRM I have doesn't cover the IOMMU register=
s, so a
> >> one-line description would let me write an accurate comment.
> >>
> >
> > Glad to hear this works. Please refer to the commit below.
> >
> > [0]: https://github.com/rockchip-linux/kernel/commit/7f8158fb41b5cc8e73=
8aaeebc3637c50ebd74cae
> > [1]: https://github.com/rockchip-linux/kernel/commit/6a355e5f9a2069a230=
9e240791bc3aad63b7324e
> >
>
> It looks like RGA needs this patch too, and it has already been merged :)=
.
>
> https://lore.kernel.org/all/20260428-spu-iommudtefix-v2-1-f592f579e508@pe=
ngutronix.de/
>
> --
> Best,
> Chaoyi

