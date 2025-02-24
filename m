Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACFAC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 13:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=POfL+6dfVzHSa0WBaF5w8BJz+WCXYbwsAkcNiQ4P5TQ=; b=cebHHJMJMchfzMcHNAXSpzkIDg
	aKpRDzla3AZwXKL+ZX325/2UA0NX4xYo4Y/KTtDsOoBLyqwqYZHtEqTgT0Hq+nVL2cj0XS6Iv/N9x
	jAf4pMO8Yv0o3rnTrtu4nqeTyEJ3m2i4yGd8iDxvZNWzGc9K7RnKcgjQsRD5QzvsrNz9dCUti/xeY
	TZ9Rcsg4y2c510j42DrL5NiYnWk0JN5OQtf182L6pMpUTN021Y6rVGM72uesbtOS0S90+vwTMtlS9
	WxLHRBUkowtD05jayJXK0/YiGLnsEhCXtdvwSfT3IRlQmF8lEo53Z2sJ9MJ8W3TzXlZKwBnyN0wtG
	bMZoCXLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYIA-0000000Dodn-2Qnm;
	Mon, 24 Feb 2025 13:14:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmXrG-0000000DjcI-0HOs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 12:46:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AA06E611AF
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 12:46:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BEC0C4CEE9
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 12:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740401209;
	bh=0B0CsThfPjGTpaa60Jmv4WtnpWqz89tZ838PBLhiS1M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HKYjXcHvXoCFVXB33ypRTMi+qhyXXBGo35E/k5RKPWwJtemmIWmE54meLKFZs/EvJ
	 3Sj5yokM+60rAF5eOEJsXxZUsRSJTL9gieVYI7odceLW7YtFOAtpJ1f1jaiAT5QvF6
	 VdQYXKDiyS7Zsl9VeINxjotnJc2NhNY+pDqCZkUmoZowSL5okxpWuO9JuO5gDF7z8q
	 uEETt/7G+YPbqpb1AkdCI3osV8Gl0Qlpu2b4EY1Ebr+060OKuJkXRzM4z/5klxtS2w
	 kOZLWvJ8qoeFPZNxulPgsx3CZktIrjFRwFMc/itwI46QhFscpfyp6fY0sOMoWH7yPx
	 68tHEOSFVsICQ==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e04f2b1685so6515899a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 04:46:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUSyGZCvKn9kmHbEoOHqSNAGuSj0zu4gKp2M11ub76cYETxOiEVafvpK0hHYVaLsYl9W6FyHiaFMdewYaC2Tg0H@lists.infradead.org
X-Gm-Message-State: AOJu0YyHAlt88Sev/hF5qDo+pUx38sY81yYYhWB/IzUi1Speg8t1LsT0
	84ZMe3KHdj98E0ddH1KAhpDw7+6bCrT8e0v3meCh19pzijPlakBQLpVEm6SpvQyqd8GxYOfGmpu
	If4ceyvWCJpxLqK+jEmDofnDhrQ==
X-Google-Smtp-Source: AGHT+IFSrlzVDhPG7lgCi1VU8B1AxKksGxiI/QFAwg0k5D4fCtrCiSkO61qkvx8HAbvnWUGOsp8xAAa6cceHz1Shh+I=
X-Received: by 2002:a05:6402:278e:b0:5dc:cf9b:b04a with SMTP id
 4fb4d7f45d1cf-5e0b70bfd22mr30104043a12.1.1740401207751; Mon, 24 Feb 2025
 04:46:47 -0800 (PST)
MIME-Version: 1.0
References: <20250218-arm-brbe-v19-v20-0-4e9922fc2e8e@kernel.org>
 <20250218-arm-brbe-v19-v20-11-4e9922fc2e8e@kernel.org> <20250224122507.GE8144@e132581.arm.com>
In-Reply-To: <20250224122507.GE8144@e132581.arm.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 24 Feb 2025 06:46:35 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+0fZ2uasgAam7qGTdCeDBQxXeyL-J1_suyxy6GE_ERTg@mail.gmail.com>
X-Gm-Features: AWEUYZlK0yq7SIgMIaSVRny1cLnFGm1k0eFBcoGHQEZGYoT0-XXIWWwS_6M-XJc
Message-ID: <CAL_Jsq+0fZ2uasgAam7qGTdCeDBQxXeyL-J1_suyxy6GE_ERTg@mail.gmail.com>
Subject: Re: [PATCH v20 11/11] perf: arm_pmuv3: Add support for the Branch
 Record Buffer Extension (BRBE)
To: Leo Yan <leo.yan@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	James Clark <james.clark@linaro.org>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Feb 24, 2025 at 6:25=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> On Tue, Feb 18, 2025 at 02:40:06PM -0600, Rob Herring (Arm) wrote:
> >
> > From: Anshuman Khandual <anshuman.khandual@arm.com>
>
> [...]
>
> > BRBE records are invalidated whenever events are reconfigured, a new
> > task is scheduled in, or after recording is paused (and the records
> > have been recorded for the event). The architecture allows branch
> > records to be invalidated by the PE under implementation defined
> > conditions. It is expected that these conditions are rare.
>
> [...]
>
> > +static void armv8pmu_sched_task(struct perf_event_pmu_context *pmu_ctx=
, bool sched_in)
> > +{
> > +       struct arm_pmu *armpmu =3D *this_cpu_ptr(&cpu_armpmu);
> > +       struct pmu_hw_events *hw_events =3D this_cpu_ptr(armpmu->hw_eve=
nts);
> > +
> > +       if (!hw_events->branch_users)
> > +               return;
> > +
> > +       if (sched_in)
> > +               brbe_invalidate();
> > +}
>
> Just a minor concern.  I don't see any handling for task migration.
> E.g., for a task is migrated from one CPU to another CPU, I expect we
> need to save and restore branch records based on BRBE injection.  So
> far, the driver simply invalidates all records.
>
> I think this topic is very likely discussed before.  If this is the
> case, please ignore my comment.  Except this, the code looks good
> to me.

Not really discussed on the list, but that was present in v18 (though
not functional because .sched_task() hook wasn't actually enabled) and
Mark removed it. His work is here[1].The only comment was:

Note: saving/restoring at context-switch doesn't interact well with
event rotation (e.g. if filters change)

Rob

[1] https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?=
h=3Darm64/brbe&id=3D642985af34d2d6f54e76995380cf24d512078c56

