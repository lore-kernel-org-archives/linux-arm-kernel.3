Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C846AC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 21:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DFUI3MpGGkbseTkztZ+yIQpjol+PGIuUpMv3ocf4nfE=; b=KDFZzfumewMYU6EdKMhPeBaq9y
	9sZH7Uur46HYDQyOnFHM8VRMt+19F88t4vFxFkKD+EEclYKzpfiIFYCGIBWZgj/f6Dr3uaV1oU8pS
	fJSf4IV2HFISWFHPfXJG9jRxQMfBfSJo+LXULRblH2A2Cg9vYJmVX5DsZjw3DC4Yo+Al6lPSSZgqN
	bmzQZRzCnUlNW/re2sldL9dalgDoHH4zzCRPit160OkPmAYtPRZ6rYNArL6AvxKLC59oPi37YEvZG
	N1Q6QvWjJ0uHcfYMs+o4uerImBZ5Mc7dWOfdPJEsC+YqmOoKEUW9NwH/GwThhDBH5OTvHLxLbzohV
	fRG5WSSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taLtJ-00000008paZ-0uWB;
	Tue, 21 Jan 2025 21:34:33 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taLs1-00000008pRg-0I2U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 21:33:14 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2ef6ee55225so1272019a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 13:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737495192; x=1738099992; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DFUI3MpGGkbseTkztZ+yIQpjol+PGIuUpMv3ocf4nfE=;
        b=SbqVjQj/OnfA0mT5bXy4ez+6HTdz62ONnu0mSWNSP30uEqaX7WuxffxhbmpwbewHbo
         HmBwAEsgLsVoWWZcC9lqdqxmw+F4FfbfvZBhy74U37K7lxQdhH45qU6H8DWn0HpmNrEC
         rWFsD43C4r/bib6r3MEbUWI7q5HToWKvC6NXOqkQyL6MiVeei5u7iq5GuDQVdQDl9fcG
         Wp1gQx5Nox7n5pA2Vno8TISDgWHG7aRQ3HGNbRQ/e9E9X3IazMyU/VT6M/UikSUBXcIT
         o6v+4Lr160f8thee7p80zkwfgeFJYz3kheFhQMC19y/7Wyqxj6sYhIa6M4TBVUiL7wBa
         L7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737495192; x=1738099992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DFUI3MpGGkbseTkztZ+yIQpjol+PGIuUpMv3ocf4nfE=;
        b=aInG9eec5wWBQF2vKKHOY+9k9C+wnoTqsXK/h0RUyq1PFg4iqb5kGmp8mQ+QmQ75uQ
         OCXC/6LJ3L1x6b0310LiNfe2Sj1lc/g8t/fPczpdn/jcCa6EXkJp+opY22ojmog3zDvW
         h56zhes5kKRArxIrXaoZ26H0gccC3TvPl7BEUilNj74+LkMB9U/+ztvHdhOZDYGlbwZ+
         5bztOyAYYFWWb8YXVPqCNl/JAwjhWOFJWOTlX6hKo0tw/eG4kJ7CWVzjdL2cbTMScpEv
         uqO4bWIBnnyYrHLUWNEZBMfUW2FxzwyT6IKroHSGsM7TpqyPIM3gt0iSH0X3ald8pmzY
         HpdA==
X-Forwarded-Encrypted: i=1; AJvYcCUYsZlwm2pSoXyWqa3pGR5TE8LaNtrHuEIC+Wmgn+dkwev7TAeetE2+NThkUzY+/SSG/Xt9URnCMUJdEC/UhKmG@lists.infradead.org
X-Gm-Message-State: AOJu0YyKj9OA6GbqY+OehcX8YYDJBy9lxcAWXOsV/oGNzaqo05S0rSbk
	0dJA3jzCEJroDVSe/PNYrHD+aVPkTyGJx+MJ90Y4RwU0xEDMqTrFsJEwlhYs+7/WoxxgH5q1jrL
	tRArMruHwJev+c+mLPsthDT5fJOI=
X-Gm-Gg: ASbGncsOjBKMyrYH71zFnvzPnU7XYg4YynvxZg4k+RMfrIPejwqpY8erKzgazYPVTAR
	R01BpHlU0Ek3kLmxbLxBJGBKKYFUSeTnKGEgY2Bso76+5Q8rayl4=
X-Google-Smtp-Source: AGHT+IEcjzdGu7qYqGn5N4xEYIBOsyWiwpCUBMJHTPuLbHn2zBtCvYF5lxRNHxNZ86fRxljxMK5FHYvAnIcG7/4OKIA=
X-Received: by 2002:a05:6a00:2e14:b0:725:e499:5b9d with SMTP id
 d2e1a72fcca58-72f6ab9b6f0mr666087b3a.3.1737495191872; Tue, 21 Jan 2025
 13:33:11 -0800 (PST)
MIME-Version: 1.0
References: <20250120-msm-gpu-fault-fixes-next-v2-0-d636c4027042@gmail.com>
 <20250120-msm-gpu-fault-fixes-next-v2-3-d636c4027042@gmail.com> <20250121210818.GS674319@ziepe.ca>
In-Reply-To: <20250121210818.GS674319@ziepe.ca>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 21 Jan 2025 16:33:01 -0500
X-Gm-Features: AbW1kvb6ejz0Edpb-LSeUnSnuaoYq5_MYqcriJkrf00pfJrPDWvH4y-7_JTCMIM
Message-ID: <CACu1E7EgYzsU1AJfi7MJ9QjX8mypPw0mxcCkX-H59hSaDFnd5Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/msm: Temporarily disable stall-on-fault after
 a page fault
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_133313_111359_268BAD67 
X-CRM114-Status: GOOD (  23.14  )
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

On Tue, Jan 21, 2025 at 4:08=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Mon, Jan 20, 2025 at 10:46:47AM -0500, Connor Abbott wrote:
>
> > To work around these problem, disable stall-on-fault as soon as we get =
a
> > page fault until a cooldown period after pagefaults stop. This allows
> > the GMU some guaranteed time to continue working. We also keep it
> > disabled so long as the current devcoredump hasn't been deleted, becaus=
e
> > in that case we likely won't capture another one if there's a fault.
>
> I don't have any particular interest here, but I'm surprised to read
> this paragraph, maybe you could explain this some more in the commit
> message?
>
> I would think terminating transactions and returning a failure to the
> GPU would be fatal to the GPU operating model when the entire point of
> stall and fault handling is to make OS paging transparent to the GPU??
>
> What happens on the GPU side when it gets this spurious failure?
>
> Jason

It's touched on in an earlier commit, but OS paging is not (yet?)
transparent to the GPU, and we aren't using stall-on-fault for that.
Instead we're (ab)using it to stall the GPU while we capture a
devcoredump with the state of the GPU when it first faults. Stalling
prevents the GPU from moving onto another job while we capture the
devcoredump. We only keep one devcoredump at a time, so we don't care
about subsequent faults until it's read and deleted by userspace. This
idea is taken directly from downstream, which I suspect is why the old
Qualcomm MMU used before MMU-500 violates spec and terminates
subsequent transactions after the first one stalls - it's helping
downstream implement devcoredump without this workaround.

I can add some of that context to the commit message.

Connor

