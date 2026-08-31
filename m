Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA36C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 07:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bFWfbb/gIctZHoo0CDVoZsBSY4wt/NAsN/U4bJzB5KM=; b=btrFCLAKZ8lfVXBPSD7xTMv88H
	dnWmfe06CoqCfNvFgffzG36Yswuk/CeEqX5vac1HvXXlt5g2lBS1xhVckHhLcf2SHwQ2HcFjhg1a1
	FW0KI9SeCWf2QziBTMbBRS47zUZaRpjkknGbk4XjNtuIqLtBALWNkvIZdG1jlTm9DAvFjS9YwDPmN
	XseWffqKn3mvpL+EqjMxor1F0v1ayjQJzHqbpaGV8eZ4eRcVL4Uny1vAhCFVaqaB9+Yw49jGbnYkS
	ktHkNvgokM9xQp2vWCPY1ugrtLzUx/Ie3kLny5wXE1hVmQpqPWo3x2aQd51vEmt0KIrWUAbSimjNG
	KVh3Nz7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0wJe-00000008iCq-1SIF;
	Mon, 31 Aug 2026 07:20:26 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0wJa-00000008iBX-0RXY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 07:20:23 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-52f9fc510e1so35857581cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 00:20:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788160820; cv=none;
        d=google.com; s=arc-20260327;
        b=qITNxePfcb8yhO4JvKUq4Ng/eYk2VYGPzLaj81XVqh1yYhH1UGKJ80rNsEqQMq9XNA
         b0dAFkUJ+bOHB86UqkerQFvOqHIkTlzWaPMv4fYW0GzYxijdqVYIrBE3H7+VXI6QJ6vg
         YI1mWM9cW9K9URZ5ZHzA9pX0vEkWOqNXGCv8fNoLzES4LMYSDbReY9GRcARsixmiGSz0
         0ickIgwISfyu6aIVFtCJ1XStg5Y981IM56tvYKJJyhxtJte4BhTAII6/s+fwlzw6vePT
         Y+VF8mzkzY0YbGnRDmlObIoiEmH8x8GeS2WDcrxSFqTh6Xu9YypuSFsy5A0FsWXg2Dps
         clLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bFWfbb/gIctZHoo0CDVoZsBSY4wt/NAsN/U4bJzB5KM=;
        fh=2QHC6UEjsIoWt0VN8EzIiylQcvauwl1dA0hE3xuE1cM=;
        b=Dkj0zVdePnAPYhOvTrq0qjFVoMMOcCrGChJCB97mlgrhsRx5+JDqSBYkBTDxxn9ejL
         x7IXNKE/2VQApQ4XCXxVa+ThIHixB0DHl1C0ZRDAzFfdBBDp/+rhvsOSRt+c1brI1Q2x
         IF1MzaN19xzPXcoyqmRI8QuM4ESgf+wsnBK2oF7meeF2UPXse0yTw00wJlu+m63VhwQU
         EuYrnRCwaPM5M+g4G/7ppO9Kakc91VPg8kxwjdTbwORNbqf8KyWB3BWX67wFYCMqUARh
         ai6b42mSFKLmiO4fe5zHogj/DxZTL5N/rMvFU4SQap3Y/LWPAmSljgN+m7FwPbqznl8H
         jdBw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20251104.gappssmtp.com; s=20251104; t=1788160820; x=1788765620; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bFWfbb/gIctZHoo0CDVoZsBSY4wt/NAsN/U4bJzB5KM=;
        b=P4//qHTtA2qNNV9z/ddUiSwZA9ppOMYo505yFR6zFIpNPqoFoptYnOnuNLpLAbpBfT
         2NdtuLt0Cb/bmNFGt1B3YqQdqxug0vlfw0mFhRkh2QiudNPZ/3xLWBdmcy7xbL7yqPYN
         6L1G2j/LTBNe+xYaM0RrmdwlynKXu9qd5wTctp9+EJFCIq6dEz91kox84z4gbBUnIutH
         2nCqnfSsDoy0yqTzT2BiVjTh0dyakpYY6doFXGgIjrRL4KuXIqUHvuYNSEcCwjukGuPN
         imGARhXFGugpsBwtERjHkVVvcyE/FmDZgsD5Vk5k0PbbCZDUVhxl3kCecN9Kf1Fyx/3a
         A05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788160820; x=1788765620;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bFWfbb/gIctZHoo0CDVoZsBSY4wt/NAsN/U4bJzB5KM=;
        b=agogWaAmuMN8MuwUZw1AJ8wmSTeylLyOW4quVjMPR90PyEuV9lky3LrxJQZzZ6ovGG
         QjzTKNMjFMZTOklSgJ+unEbaVQLHTwYcbY2dru/+QFKQY6XBKQyALvcWVVcj/9bdmhC5
         Y49P6bs5IlI8bFpgqXC6pyfeNj+/Q2VH96JsrR56p1bE5BRTvWy5l0nMATZqKuTcTYqN
         czjAnEoxy4gTgYcDdIBnDnZD1dB3kahN1nA0hqP7c9cJuzxu9yd8QkmyErF2FCJ//ype
         rL41bdyQxLC4TRzIUZYzjFdEk33un3Igb1Roq3eh8Gk5L8HWCRWBXQAx5Ti5VuRZOcCL
         NZsg==
X-Forwarded-Encrypted: i=1; AHgh+Rq1tPexajz6M4i7Z+CkoklEqn2eVkvApjxfS2wIP9ZVKG4mT79T9bMWVP2V1gz583Bwdo5d27IqruDjoKQZUyeG@lists.infradead.org
X-Gm-Message-State: AFuF++kKr1I3sIHccz88j8Jxmy9QDQmuj2WX3pe4vLw0sByizho1bso7
	lKZZmLjlUMjm9lZ/Zx8iHo4odTeHPEcCT1PIX3SvHm5JCQjIZQFuhrC+re4EZhCP8CvHpfwO/If
	jhhN2Gazn9YIvELpMqiB2BoY2q1hmfxxtz8DgQMhj2A==
X-Gm-Gg: AR+sD10rk34407hABfj+xRWHBFDeccUIj0wqvvGDRbF+apXP54AhwDFgj6EHAKAJD7h
	Rlftko9VGBsbvfgErsqkheI3SoS6BB+YkZHngAAuak58SD3IXvskTjuhlHatvcoUDVEqwpxMJzZ
	COUQnt2g0z4JyfQ7VPKBRi4RmfvhBG+rlkC+jUQm15dQmIYZfWq9lNSX6wE3qN8lul1UN+BwEoY
	0a1X3oC3+1TJaFSwqc5PPcoJOFokSqr6Yr8fx7DB0j1LrdnaY0rGCVhnWItNaM1/M40d0pjnH9x
	Zgf5W0NBm88SlsgDzxJW8w+Emt8Wnq3RVdVAUSMSimeT
X-Received: by 2002:a05:620a:1d02:b0:939:619:c6eb with SMTP id
 af79cd13be357-93936c7a141mr714176285a.8.1788160820472; Mon, 31 Aug 2026
 00:20:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260831040804.24111-1-gahing@gahingwoo.com>
In-Reply-To: <20260831040804.24111-1-gahing@gahingwoo.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 31 Aug 2026 09:20:09 +0200
X-Gm-Features: AcwNN1Uwr5NzEhJ7J-T4GkpAbcQEn3hzAH0qQngAbR_wX7Qh73vwn6zU-qNzhjg
Message-ID: <CAPsqS2TGXOCOL8BzaJ4NaJqtuKid7vhRdJq-80ngGxhNN_UWCw@mail.gmail.com>
Subject: Re: [PATCH v10 00/13] accel/rocket: RK3576 NPU (RKNN) enablement
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, ulfh@kernel.org, 
	p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com, 
	royalnet026@gmail.com, u.kleine-koenig@baylibre.com, 
	chaoyi.chen@rock-chips.com, diederik@cknow-tech.com, alchark@flipper.net, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	iommu@lists.linux.dev, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_002022_417783_0926DAAB 
X-CRM114-Status: GOOD (  39.01  )
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

On Mon, Aug 31, 2026 at 6:08=E2=80=AFAM Jiaxing Hu <gahing@gahingwoo.com> w=
rote:
>
> Based on Igor Paunovic's "[PATCH v2] accel/rocket: request the core
> clocks by name", as v6 through v9 were.
>
>   https://lore.kernel.org/linux-rockchip/20260729130743.128876-1-royalnet=
026@gmail.com/
>
> Tested on a Radxa ROCK 4D, on next-20260814. The tree is byte identical
> to v9, so that is the same test rather than a new one.
>
> This adds the RK3576 NPU to accel/rocket, which today supports RK3588
> only. The RK3576 carries two cores of the same RKNN block, wired up
> differently. Two extra convolution buffer clocks, two power domains per
> core, one reset rather than two, no NPU SRAM rail, and a PC_TASK_CON
> that packs the task number into sixteen bits rather than twelve.
>
> What changed since v9
>
> No code. Every patch's diff is byte identical to its v9 counterpart, and
> below the --- the only change anywhere is 5/13's git note. Above it, six
> commit messages each gained one trailer line and nothing else. Six tags,
> that note, and the base-commit trailers back where v8 had them.
>
> The note first, because v9's cover letter said 5/13 carried it and the
> posted mail did not. Rob Herring's bot asked on v8 for the dependency to
> be recorded in the patch rather than only in the letter, v9 said it was
> there, and it was not: my send script never passed --notes. Igor
> Paunovic noticed while applying the series and said so before v10 rather
> than after, and he had the cause right. Nothing was lost in a rebase;
> the flag was missing. The script now regenerates with --notes and
> refuses to send unless exactly one patch carries a Notes block.
>
> Igor also ran the 19 August protocol again on v9 as posted, on RK3588,
> an Orange Pi 5 Plus with all three cores bound, PROVE_LOCKING=3Dy and
> DEBUG_ATOMIC_SLEEP=3Dy, and a local test-only patch lowering
> JOB_TIMEOUT_MS to 2 ms so healthy jobs cross the timeout. Two passes per
> kernel at console loglevel 8 and 4, serial captured on a second machine.
>
>   v9, two passes         12 and 11 induced resets, all recovered,
>                          48 of 48 within 1 on both, including the
>                          inference after a forced autosuspend and
>                          resume. No MMU faults, no lockdep hits,
>                          nothing on the console.
>
>   without 1 and 2/13,    8, 10, 12, 8 and 15 induced resets, all
>   five runs in the       recovered. Four runs clean. In the
>   same session           remaining one the inference after autosuspend
>                          reported success and returned a constant
>                          buffer, all 48 output channels at 0x80,
>                          which is not this model's output zero
>                          point, while the CPU reference varied
>                          normally. Zero kernel messages, zero
>                          lockdep hits, nothing on the console.
>
>   1, 2 and 3/13 only,    13 and 13 induced resets, all recovered,
>   two passes             oracle 48 of 48 throughout, including after a
>                          forced autosuspend and resume. On the 1+2 arm
>                          a round that ends in a timeout leaves the
>                          affected core runtime-active even through a
>                          forced autosuspend; with 3/13 applied the same
>                          sequence leaves all three cores suspended.
>                          That arm is where 3/13's Tested-by comes from.
>
> A job that signals completion while its output buffer is never written
> is the silent form of the race 1/13 and 2/13 close, and across 102
> induced resets in nine runs that day it appeared only on the arm without
> them. It is a better statement of what those two patches are for than
> anything my own logs have caught, which has always been the loud form:
> a message, a wrong answer, something to look at.
>
> The tags, and where each came from:
>
>   02/13  Tested-by: Igor Paunovic   # RK3588, three cores, induced
>                                     # reset, differential base,
>                                     # JOB_TIMEOUT_MS=3D2
>   03/13  Tested-by: Igor Paunovic   # RK3588, three cores, induced
>                                     # reset, JOB_TIMEOUT_MS=3D2
>   06/13  Acked-by: Conor Dooley
>   07/13  Acked-by: Conor Dooley
>   08/13  Reviewed-by: Abel Vesa
>   09/13  Reviewed-by: Abel Vesa
>
> The two Tested-by comments are not the same string, and that is how they
> were given. 1/13, 4/13 and 5/13 keep the tags they had; Igor checked befo=
re
> testing that 1/13 is byte identical to v8 1/12 up to the base-commit
> trailer and 4/13 identical to v8 3/12, so those tags still describe what
> was tested.
>
> The bindings are unchanged since v9, where dt_binding_check was clean on
> all three with dtschema 2026.6 and yamllint 1.38.0, and CHECK_DTBS was
> clean on all 13 rk3576 and all 48 rk3588 dtbs.
>
> Two things I raised in v9 and would still rather hear about than guess
> at. 8/13 does three things: it adds the settle delay, renames a macro,
> and gives RK3576_PD_NPU a regulator, which also makes every RK3576 board
> force that domain off at probe. I asked whether it wants splitting;
> Abel Vesa's Reviewed-by may be the answer, but nobody has said so, and I
> would rather split it than have it merged on my silence. And 12/13 gives
> each core both NPU domains, which is the description that has been
> tested here rather than the topology; if it should be one domain per
> core, 5/13's minItems has to change with it. That one has had no reply
> at all.
>
> Nothing else moved.
>
> Jiaxing Hu (13):
>   accel/rocket: take the completion register writes under job_lock
>   accel/rocket: wait for a running IRQ handler before resetting a core
>   accel/rocket: let the core suspend after a reset
>   accel/rocket: factor the completion tail out of the IRQ handler
>   dt-bindings: npu: rockchip: add rockchip,rk3576-rknn-core
>   dt-bindings: power: rockchip: allow resets in a power domain node
>   dt-bindings: iommu: rockchip: describe the RK3576 NPU MMU
>   pmdomain/rockchip: add optional per-domain power-on settle delay
>   pmdomain/rockchip: cycle optional power-domain resets on power-on
>   accel/rocket: select the per-core clock and reset counts from match
>     data
>   accel/rocket: add RK3576 NPU (RKNN) support
>   arm64: dts: rockchip: rk3576: add NPU (RKNN) nodes
>   arm64: dts: rockchip: rk3576-rock-4d: enable NPU
>
>  .../bindings/iommu/rockchip,iommu.yaml        |  28 +++++
>  .../npu/rockchip,rk3588-rknn-core.yaml        |  47 ++++++-
>  .../power/rockchip,power-controller.yaml      |   8 ++
>  .../boot/dts/rockchip/rk3576-rock-4d.dts      |  13 ++
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi      |  82 +++++++++++-
>  drivers/accel/rocket/rocket_core.c            |  28 ++++-
>  drivers/accel/rocket/rocket_core.h            |  11 +-
>  drivers/accel/rocket/rocket_device.c          |   7 +-
>  drivers/accel/rocket/rocket_drv.c             |  28 ++++-
>  drivers/accel/rocket/rocket_drv.h             |   2 +
>  drivers/accel/rocket/rocket_job.c             | 119 ++++++++++++++----
>  drivers/pmdomain/rockchip/pm-domains.c        |  75 +++++++----
>  12 files changed, 385 insertions(+), 63 deletions(-)
>
>
> base-commit: 4477a78374a57c3809b172ad30cceabda48c47c6
> prerequisite-patch-id: 46ebb679e93d3d25393e8cbf8fc3c955bcc01bd4

Hi Jiaxing,

I want to get soon to review this and the other pending rocket series,
and in the meantime something that could help this moving would be to
get a review from Sashiko.

As you can see in [0], Sashiko is not reviewing this series because it
doesn't not understand yet prerequisite-patch-id. Can you please
resubmit the series with Igor's (presumably) patches bundled in it?

[0] https://sashiko.dev/#/patchset/20260831040804.24111-1-gahing%40gahingwo=
o.com

Thanks,

Tomeu

