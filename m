Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8A6E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 09:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GsOvowfLLjNNwGhyFlvSXDZYnGxjPiihM7jqeMZ3c/o=; b=Fi6BNEUIubSId7wqBnW8sZz9pn
	wjmxSgJT14a+T4EhnB5+sx9M+NPac9OmMtm468oC5TqMzY47YaiL2MerlOSEL3yIwyPmLPyQHRAqK
	D+T8jVnqSkSlq1jwWb+oOTHn93Pn3fXo+gRe4eE43QtKYqIGnEuPniqKD81dT9dX2LJzMNM5Ypbdj
	YxbihhfPJ9bxRRSJldA4NvLIbeLL11EXqAmnNchWht4OCL8tg7FrM+MCVrmWzApNw9tdV6WRlJ8/p
	b8Q/Yq5EhX7JASt96ITOWrCQEBlEZUbp+IwlH5qeW3KedLclrNW8gksSZN0zzTBzVO5tmrq0zA79j
	icSi3HGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJV4k-00000001AMW-0qzG;
	Fri, 06 Dec 2024 09:56:42 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJV2h-000000019r8-3yoW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 09:54:37 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e388503c0d7so1899557276.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 01:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733478875; x=1734083675; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GsOvowfLLjNNwGhyFlvSXDZYnGxjPiihM7jqeMZ3c/o=;
        b=h0tD9RxD2sDEMZKfpMC/h8WtSW4BUF+EXhD95rxS1ukkhRxVsVw/xeBkXis4OCN8ON
         GZfxc1phNjw2/JekMO/SszEVz3WdlFK4z2mbdb4A7Gwun4pA4sIiQAonAoYsaP7YT9bH
         ZYG5vrsrsCHO/ms2yknEPxD9tAKnl/ITcZYAstRWRCH/RWKD/O/ahAJ6HMZp4Vu4aCN2
         jaWEmG7vySI8XsHXvDlb6CItAnTMtGMAaYY+Sq0RXRFHb6YpcY4RsTAHUc8BTMm6vs/Q
         pY6JwcDEdC8C/y/qSvA7qAHugkFPwt+qiVp8XDgXvz2YcKH2QX3EV8iQzLH4n1/eRthT
         9Mlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733478875; x=1734083675;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GsOvowfLLjNNwGhyFlvSXDZYnGxjPiihM7jqeMZ3c/o=;
        b=ntbgtmakM7pQOElRtB9G+GjBSMqhw0GMSZXTWDeqOn7ogkJ7sZPyvptUi8eeYzeL+C
         cXJJSmsAqRnshpoL97nuph4E/mfvSYvUEakRzW6UTHP2JaQMnULFQ/sbMATYK96RSdOb
         bbrPheLzijKB1fSfR6BnsSRJv1TmAj3e5kVfO+e6Ex07GL7mxHmbqONSguO7DVodiEoH
         tQ4BxkllR66PW9mRf+6XbJ1l8+quOmltw/avFW5g+KcGoeuIUmZ+4aH+7F9yhpQIvOA0
         d3ZsziYI5hI0ExIha8eQ1eEvJfsZ5ImKeRaU5q4lcTqDwuSRsZT55i2hAbSj0LZ19bF3
         +0zg==
X-Forwarded-Encrypted: i=1; AJvYcCXKlgrKYuXF1d0tXXqcEB3uH4Jddct5rvA+0D8K+QYAobvCtkloIQJB5qXZ3Fu4NSZcv7KD7Ta7FYm/igQ2RPfu@lists.infradead.org
X-Gm-Message-State: AOJu0YxF81A8j+YgpnJ2SpLjryiFTZP2cCGaoFALPagk7lHOe5hHDpTX
	J4yiN8vESjIE6Mmtb/Clmn12vyEm/qXk8CANzrlzdarjY8jHVp8tauntUWYhn7nHB3gm/0Q3R2e
	/hZHC+HbPD5TzvaS+wDmPv+E9WLPXVcisb+qawA==
X-Gm-Gg: ASbGncu1v2nOtW8nxkNajKTlogMxx9sbfpJTNJJ7OWzxc55ZABBUAffxRg0toaBRIWE
	Q2k07Cr8CtTugxkl6Ihv6Y4R85DyL0F7r
X-Google-Smtp-Source: AGHT+IG2PPzmCv1pgcSI90k5Rm9y9v17QaBnFLGhMJzvsqYhGx2gb2GCPvaJ4EvSx5NnUUYyYVZdxWz2xiUdxk4w8+w=
X-Received: by 2002:a05:6902:248a:b0:e39:8174:7f2c with SMTP id
 3f1490d57ef6-e3a0b4d09d5mr1967202276.46.1733478874767; Fri, 06 Dec 2024
 01:54:34 -0800 (PST)
MIME-Version: 1.0
References: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
 <CAPDyKFpGrw+vOs=-TxfChBeORjzkpaL_iVB08MtmaC4sFNKzcg@mail.gmail.com> <72add0ff-db2a-44f8-b4af-0b5fe5f65f20@oss.qualcomm.com>
In-Reply-To: <72add0ff-db2a-44f8-b4af-0b5fe5f65f20@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 6 Dec 2024 10:53:59 +0100
Message-ID: <CAPDyKFq5+HWmHK4E4ERx1rb8O4mubHGqRHP8AAiq2KyZyX1GSQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Allow specifying an S2RAM sleep on pre-SYSTEM_SUSPEND
 PSCI impls
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Maulik Shah <quic_mkshah@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_015436_000749_CFC1E5C1 
X-CRM114-Status: GOOD (  42.37  )
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

+ Maulik, Vincent

On Thu, 5 Dec 2024 at 21:34, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 14.11.2024 4:30 PM, Ulf Hansson wrote:
> > On Mon, 28 Oct 2024 at 15:24, Konrad Dybcio <konradybcio@kernel.org> wrote:
> >>
> >> Certain firmwares expose exactly what PSCI_SYSTEM_SUSPEND does through
> >> CPU_SUSPEND instead. Inform Linux about that.
> >> Please see the commit messages for a more detailed explanation.
> >>
> >> This is effectively a more educated follow-up to [1].
> >>
> >> The ultimate goal is to stop making Linux think that certain states
> >> only concern cores/clusters, and consequently setting
> >> pm_set_suspend/resume_via_firmware(), so that client drivers (such as
> >> NVMe, see related discussion over at [2]) can make informed decisions
> >> about assuming the power state of the device they govern.
> >
> > In my opinion, this is not really the correct way to do it. Using
> > pm_set_suspend/resume_via_firmware() works fine for x86/ACPI, but not
> > for PSCI like this. Let me elaborate. If the NVMe storage device is
> > sharing the same power-rail as the CPU cluster, then yes we should use
> > PSCI to control it. But is that really the case? If so, there are in
> > principle two ways forward to deal with this correctly.
> >
> > 1) If PSCI OSI mode is being used, the corresponding NVMe storage
> > device should be hooked up to the CPU PM cluster domain via genpd and
> > controlled as any other devices sharing the cluster-rail. In this way,
> > genpd together with the cpuidle-psci-domain can decide whether it's
> > okay to turn off the cluster. I believe this is the preferred way, but
> > 2) would work fine too.
> >
> > 2) If PSCI PC mode is being used, a separate channel/interface to the
> > FW (like SCMI or rpmh in the QC case), should inform the FW whether
> > NVMe needs the power to it. This information should then be taken into
> > account by the PSCI FW when it decides what low-power-state to enter,
> > which ultimately means whether the cluster-rail can be turned off or
> > not.
>
> This assumes PSCI only governs the CPU power rail. But what I'd
> guesstimate is that in most implementations if system-level suspend is
> there at all (no matter through which call), as per the spec, it at
> least also projects onto the DDR power state (like in this i.mx
> impl here [1]), or some uncore peripherals (like in Tegra's case with
> some secure element being toggled at [2])

Right, I certainly understand the above. There are different parts of
an SoC that may be sharing the same power-island as the CPUs.

The question here is whether the NVMe storage device is part of that
power-island too on some QC SoCs?

>
> > Assuming PSCI OSI mode is used here. Then if 1) doesn't work for you,
> > please elaborate on why, so we can help to make it work, as it should.
>
> On Qualcomm platforms, RPMh is the central authority when it comes
> to power governance, but by design, the CPUs must be off (and with a
> specific magic cookie) for the RPMh hardware to consider powering off
> very power hungry parts of the system, such as general i/o rails.

Right, that is why the "qcom,rpmh-rsc" device in many cases belongs to
the cluster-power-domain (for PSCI). This allows "qcom,rpmh-rsc" to
control the "last-man" activities and prevent deeper PSCI states
if/when necessary.

>
> So again, PSCI must be fed a specific value for the rest of the hw
> to react. The "S2RAM state" isn't really a cpuidle state, because
> it doesn't differ from many shallower states as far as the cpu/cluster
> are concerned. If that all isn't in place, the platform never actually
> enters any "real" sleep state, other than "CPU and some controllable
> IP blocks are runtime-suspended".

We recently discussed this, offlist, with Maulik - and I think we need
some more clarity around what is actually going on here.

In principle, it looks to me that using S2I with just another deeper
idlestate specified (with another psci-suspend-parameter, representing
a deeper state) should work fine, at least theoretically. Of course,
we may not be able to use that idlestate during regular
cpuidle/runtime but only during S2I, which we need to control in a
smooth way and that is not currently supported (but can be fixed
easily, I think).

In the end, it's the psci-suspend-parameter that is given to the PSCI
FW that informs about what state we can enter.

That said, using S2I may not work without updating the PSCI FW, of
course. For example, there may be FW limitations that require the
boot-CPU( CPU0) to be the last one for these deeper low-power-states.
Whether that is just a FW limitation or whether there are some
additional HW constraints that enforce this, needs to be clarified.

>
> This effectively is very close to what ACPI+x86 do - there's a
> co-processor/firmware that does a lot of things behind your back and
> all you can do is *ask* it to change some handwavily-defined P/Cstate
> that affects a huge chunk of silicon.

Yep, there are similarities.

However, ACPI is for generic device power management. PSCI requires
something additional, such as ARM SCMI or QC's rpm/rsc interface.

>
> Konrad
>
> [1] https://github.com/nxp-imx/imx-atf/blob/lf_v2.6/plat/imx/imx8m/imx8mp/imx8mp_lpa_psci.c#L474
> [2] https://github.com/ARM-software/arm-trusted-firmware/blob/master/plat/nvidia/tegra/soc/t210/plat_psci_handlers.c#L214
>

Kind regards
Uffe

