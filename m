Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086D1CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 07:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHqSm5NgIZTWpIeyFda2uZBgSRaGewPdAR8APEw7rw4=; b=d2ShqZ9LCXLBXEJIf7aS2lzcBN
	S3y3RW24ZcUR2vD/qeQV/XFb9KNkzRMHAaHFGiupY9wQhqqyz4Zf52JCJRYz4BDhevbntkk9QxbMA
	lDA6hUG2Bri9CdNYNmoaXG1QxQPe0WSArj32GyXckbBFgoen8dUPCuUKr5bw20hhJCM9shyeg7AAL
	swkBV7yoXL79anrGSShUE9tFdKbTu1OdAA1oPOcXzU/539cE/rFsgP7VW6w/WV1vt+2avFRZlnJ08
	ehF+u7Z2dn26txeBe5kjfZGYAbY/cB3nmEPUSp6uFhG71ViRk8IzGfpmlGeInz8YdyXPDvNgFPWTh
	vmAQcxCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v77wB-00000007uSp-1D9V;
	Fri, 10 Oct 2025 07:53:15 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v77w8-00000007uSU-3lxa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 07:53:14 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-635355713d9so1731364d50.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 00:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760082791; x=1760687591; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DHqSm5NgIZTWpIeyFda2uZBgSRaGewPdAR8APEw7rw4=;
        b=dmX01LRLIiFd7PvPc1hU46cL/Sge53XXDYvqRyHW/2D79I0fDw9KuKGpnD3h+/PtgE
         sSp40ZKtlA7smcVXmDgFsetl6NtM/nga4eCD3ACCtY+qhx5f00Aa0WPeVp5+Rbf/tFEN
         W9Mt+8V48PVgoT0uSYUugctOTIPX0MK3YZulDNFKtU6fnGaYqg4oW5djyUGwqh9/dTgM
         i0vFvcXr0HRVLFAQbqfmXfcZG3o9Eifb5sMk3O4rTHyoybthiKrAK9LNTvf8eXRUs3eT
         Khppqyer0ZfHNOUU2QjaAxMFmc5l23Uq3MFtROygRSRU72jonpJ3Wk9VrRPvKsAi6dvI
         rsDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760082791; x=1760687591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DHqSm5NgIZTWpIeyFda2uZBgSRaGewPdAR8APEw7rw4=;
        b=ST7n3naWOrp57AnyysCnhWVgblgk8JF6+zRrf/IdZbMACvFScAYfLrjOkFQ5tOAPft
         aiMRJt3kUkm5BOeZNOBe5/JKPt9iyRlTq55DfsBfYIQulD110WYgeBE1nDd3m10wUvR/
         nbcJipiDpT+dvyhdO8UATJkRAHdlGwMQSK8y7HPA+idTD8D2hs2BjffQJqMN8LTMrdyJ
         GPNgB2n2D6SnYoHfk8T85QY+f2ItlP6hzZpmsSAhXxw4KPX2grTBSadV3Z0IK3gtk8mf
         Jk5dCOS7hlItkwkXEXfXbdzMbZxCLWGmHd4YDo9TzDqoDfwoPceGD+lioI4MQFtFFKUq
         ov1A==
X-Forwarded-Encrypted: i=1; AJvYcCXEgvDX6KcgsFo62nJXHPm8i6ZwtPXMV/KIUKJJVLS1EMcQmip64Qzf1qxaHAKTEsHRM1FFf+HZwwD9XnOqYwQZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyAVNUW73fIljoF+YdVmnoITU16ALbUb4Gl8sNFy1kiNL9aMkVJ
	NMEiHWTM5+USXgXOdMWDX6C5+uqvR0BxU7pYIGnpgHWPMOwv/pQIakKNjkrHRdLrsSwBZTO8l1/
	TMEiympfAV9J6i6qieqKMABel73Fe+Ie4evQyAggKog==
X-Gm-Gg: ASbGncuWmTGUebpNK9JFHYTV88wa0bX91CaYGi2igFnWXjsnDloUefo08dHjzSDn5wu
	L5iZ3rzx7wgewfoPzmUKoDZPG+uXpPg/szqD8K8rS1sQ2HUVt4UGTMsiWrpign3Q9u1cBM6gNW8
	SSfepkeU+W/TVA8lQuz52nwsS9F0GVVhMs4CLCEqNYEcXU+fx2LxRFtdulO+XqaTFPlmoz+hx0u
	jKaJRqSehz+EBWzqDHNlibjBaJFj01x9otWgDXb1Q==
X-Google-Smtp-Source: AGHT+IEnyq80ACUu37tcZXlzziIoOjXYva5YJrTeAlxVjWlNNTGe7b3l2TEzAxaUZRDoT0ueLBKhVdK8QVQuA2xTx2E=
X-Received: by 2002:a53:b806:0:b0:635:4ecd:7599 with SMTP id
 956f58d0204a3-63ccb8dba03mr7918670d50.39.1760082791492; Fri, 10 Oct 2025
 00:53:11 -0700 (PDT)
MIME-Version: 1.0
References: <20251003150251.520624-1-ulf.hansson@linaro.org> <20251006-barnacle-of-pragmatic-faith-e6ca0d@sudeepholla>
In-Reply-To: <20251006-barnacle-of-pragmatic-faith-e6ca0d@sudeepholla>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 10 Oct 2025 09:52:35 +0200
X-Gm-Features: AS18NWDvepcO2JLruDjD5wrLTae5DuV85tbk2iUenQa_mEnTJqXVNaVAhQe1lcQ
Message-ID: <CAPDyKFq64RD6UAjfLyKSBG3EU=T0DFk7v6jzBCBTGGg_U784Jw@mail.gmail.com>
Subject: Re: [PATCH 0/3] pmdomain: Improve idlestate selection for CPUs
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Maulik Shah <quic_mkshah@quicinc.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Vincent Guittot <vincent.guittot@linaro.org>, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_005312_963415_21510698 
X-CRM114-Status: GOOD (  23.28  )
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

On Mon, 6 Oct 2025 at 17:36, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Fri, Oct 03, 2025 at 05:02:42PM +0200, Ulf Hansson wrote:
> > Platforms using the genpd governor for CPUs are relying on it to find t=
he most
> > optimal idlestate for a group of CPUs. Although, observations tells us =
that
> > there are some significant improvement that can be made around this.
> >
> > These improvement are based upon allowing us to take pending IPIs into =
account
> > for the group of CPUs that the genpd governor is in control of. If ther=
e is
> > pending IPI for any of these CPUs, we should not request an idlestate t=
hat
> > affects the group, but rather pick a shallower state that affects only =
the CPU.
> >
>
> Thinking about this further, I=E2=80=99m not sure this issue is really sp=
ecific to
> pmdomain. In my view, the proposed solution could apply equally well to
> platforms that don=E2=80=99t use pmdomain for cpuidle. Also, I don=E2=80=
=99t see why the
> solution needs to be architecture-specific.
>
> Thoughts ?

From PSCI PC-mode point of view (I assume that's your main target with
this above comment?), it would *not* make sense to bail out for
idle-states that could affect other CPUs too - because the CPU only
votes itself.

However, if there would be an IPI pending for the current CPU that is
about to enter idle, we should bail out. Although, as stated in the
other thread, we already have the need_resched() thing that helps out
with that, I think.

That said, I think this change is mostly interesting from pmdomain
point of view.

Let me comment on the architecture-specific part in the other thread,
as it seems like Marc also had some comments around that.

>
> I understand it won=E2=80=99t handle all IPI cases, but generic helpers l=
ike
> local_softirq_pending() and irq_work_needs_cpu()
> should already cover some of them in a platform-independent way.

Thanks for your suggestion, but unfortunately these don't really help
as they only have information about the current CPU.

Kind regards
Uffe

