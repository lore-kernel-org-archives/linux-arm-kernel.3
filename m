Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA10107BCE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 21:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+/kZwgdWmNGCktNPe763uSTYgyKSmDilnHXCY6tJkRM=; b=mdscRa1hP3Y8oiT/Y2A66Re1cy
	WCS5AQdM7oYtb1IWwoRPH365Hv5+V2kdToZ6yvPNpNctqZvBtLOwJMCvnyvhsRPttyVV8/vZQAvTK
	sy/J7xgrrKOfPVHa9kwTQAnEg5d0wiIwx8Nb58/zdVhh1dI6iHu9Z7hBjCgtEmn+NIA8Ef9V6KTrp
	vd6QedDL1ZVodmKszl8/s0lMydYGhnQ9XVNmNAzBl3lMM5+KCxXvS7EooyE2kber6lzRXkZFPJPB2
	BKfk2etYWTnQmchfhqc5gmX4qFaxOtrFiMSktjLSYoxFbH4wzI75pJwDdA5JHDl3loRpehUEwtiO/
	x4SXMHgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w19ft-00000001CHm-1YmA;
	Fri, 13 Mar 2026 21:04:01 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w19fq-00000001CHQ-1dof
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 21:04:00 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6642a16be1cso1456930a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 14:03:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773435836; cv=none;
        d=google.com; s=arc-20240605;
        b=QWbLfjxALb9R36BlyKCb6ULo5cBJ7vSsWAVB/r7B37lr62O/BBc8CIXKr/2mUdFr93
         +XypbchoWNVwNbBRLrKzGJkARKXrFvLUEsRYHQ41ec+zdRNztVEZCGAfqK1pauBpJ3nX
         dBaPA+8lsLi+0EIHQwM/RoTVvEdr5y2q07Tu4XZvT4gRkT/hRk8iLMikC2IYT1Iln6ig
         CrxBGF/cH4k1abHQtQtMJYDASmgVo1y4Z16IRmZhy/THk8th+y0nbVnFJv3mgcEdk5sC
         HBYAs13fzLhFgKklFERDgp3rVGpIQ/Ih4KceWWOdFkdkYg8Q3gZ2WWU7mfMhm+uuM1gb
         4TrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+/kZwgdWmNGCktNPe763uSTYgyKSmDilnHXCY6tJkRM=;
        fh=8dnyOd/i6qZCiNBreG5mXqf7O+AgKkk/E5yYxRfnKKs=;
        b=XGZj4Q4+6fKf5slUobh57GxqN1mtPiUfm7aAzZayYtT9H9o57uXr3gTngmJOmjisBR
         t6YJug7F8nJGWVYksEOStVHojdQLNHcWVctMXrVXGIpMA0nzQ0oxAMNtNGMOK7o7G5kt
         mOUKMnoXbDiIEBwz3KqTTrSkI6lc5JojKlErIgYzXlaXvjGCAVZwLk6zx1P9hkrWRg3q
         JaCn+BOR+NcHEaVgKd2wo64CAj5yQhHOdxfSGabvIl6nSfgCQv5NteQl+2dE3z2+GB8G
         YFRUWkSIg5cqYEkGB5ASXX+WApHQfVEq2v7PkXb82orcfe7Rx88c7vc24USHYDELQ/SL
         Q3cA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773435836; x=1774040636; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/kZwgdWmNGCktNPe763uSTYgyKSmDilnHXCY6tJkRM=;
        b=SN1l6CIljPwccHzTVzF0blzrCUoBphQNgHJQrazEf1253Gs1lyaJcQnDkuJti4Sm/5
         +djcTouYpffO7TSg0IpA1Tn+O9bwcUzHgGnCxbQKvqqvvFCKd+y1PZYLZ0pKxpHF8Zny
         92rBVI0kKQHTf9R3/h7iR5ER7+Hs80RLixZCS1kc5k42jDHPjehf3Q/mUi2tfaHclleu
         NocWje2G14HotxNtKyM4QpZrC9eGk9GObafnkFxn+oujKDTFJpJKr3CXKkcwiILxOieP
         NzhUc+uqahbnz0c6f3JeIWa0m4eLIxEohT5HH7Yb0Yq4C0lAegj4IQyt6inOwlWvJJEl
         N6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773435836; x=1774040636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+/kZwgdWmNGCktNPe763uSTYgyKSmDilnHXCY6tJkRM=;
        b=G6SJp71+3KKi6JUdriloGI10PNfA8ei+cs4BHpcc04D/TFOT6TvhknJKurgj/PeFki
         RTL7QGlcYhiBR7ywdP6LzEPGRavouOHjO8cRwxIEfXtwERSW/wSwckO40rxTbDABQtwL
         rqQEa12j+5nXojxsHFFVrxcAVQuyJ/rkHBh0RSAx281yjT+1FX03DWpay3YAB6u5501q
         tYQLw9NpMQIuLG39hGl5Z7O0kEMq2mqOfEC/WBogc1DGF0h5FRlBLMnIVHdxktC2WmXR
         3VksZDXZwqgXRp8/eyW7ZiyRV744BDmJJNsbenG/DA3tJWMlarIvtXSLz6zEPoTRRm0y
         TXvg==
X-Forwarded-Encrypted: i=1; AJvYcCVxQ2CDR2A2WbMxzHdHvL2PIM1KXJ3PErkQ/pGb7/CkXoq2jYA5chKCHscpwo3bSMmOpIcZTNdqen/ZXrVRhp56@lists.infradead.org
X-Gm-Message-State: AOJu0YwuXgYpGR42QVVsQ2XsJpqwi6u6K59jK9A5ZQBK4migTZUlP+f6
	SgPYFrSuAhI22plPS9+Ni+9O4DJEYR9riVFvDT0YH+p984+grv013S5HDTPDoki+U3+i8qvqo6L
	IDRhAE3Uz1xI45N6mBHjc8o9gAZ3/o7Y=
X-Gm-Gg: ATEYQzwvBQyAJ09TZwUsmI7lLs7jsRtXQyyGzJ+H/Em99LAU4L9bGVCx1h9DsbvNqbe
	mmJphoOIL+nfHtbGHQgkGdW9PallsB+F1VNRv9eLEPNXV0QVCJkMLaJJjtrb3CAfMmW3T4HRwYq
	n0tekWo6Y6jRwX705m3FYSj55vkzDGA2AgedS2I7dXIAdHxvUsH+iIddmuRGsOi58lPRKgE2bKL
	1Id5dMv8YR3rCKR8k84sQrP9KFYYf2yfqcVPIXbJSQsBezLSZd8jOqsivcHOcdQEmvHuP7GwjXB
	prHBRiJ2svmBfrC00EDqlCP2lLF7T7+bRL+1pj4VLQ==
X-Received: by 2002:a05:6402:1ecf:b0:662:a4d4:abe0 with SMTP id
 4fb4d7f45d1cf-663ba9c2abemr3063467a12.3.1773435835673; Fri, 13 Mar 2026
 14:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260313180352.3800358-1-puranjay@kernel.org> <20260313180352.3800358-3-puranjay@kernel.org>
 <CANk7y0jjd6XC7nd2BxtsVhs8vWp_9cC-ckXPGRQK_CW5BSuogQ@mail.gmail.com>
In-Reply-To: <CANk7y0jjd6XC7nd2BxtsVhs8vWp_9cC-ckXPGRQK_CW5BSuogQ@mail.gmail.com>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Fri, 13 Mar 2026 21:03:44 +0000
X-Gm-Features: AaiRm509-qHusHx4y7ZJiuiluPbpVvicudHEcA8o5FlqQsneTuZnsmCxW0jMUuM
Message-ID: <CANk7y0iGmXCLNPJ=W4ZV9tRwWXXK4KmTATfV081kLX51RxJmkQ@mail.gmail.com>
Subject: Re: [PATCH bpf 2/3] perf/arm64: Add BRBE support for bpf_get_branch_snapshot()
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>, Breno Leitao <leitao@debian.org>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_140358_497852_E015A976 
X-CRM114-Status: GOOD (  35.49  )
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

On Fri, Mar 13, 2026 at 7:59=E2=80=AFPM Puranjay Mohan <puranjay12@gmail.co=
m> wrote:
>
> On Fri, Mar 13, 2026 at 6:04=E2=80=AFPM Puranjay Mohan <puranjay@kernel.o=
rg> wrote:
> >
> > Implement the perf_snapshot_branch_stack static call for ARM's Branch
> > Record Buffer Extension (BRBE), enabling the bpf_get_branch_snapshot()
> > BPF helper on ARM64.
> >
> > This is a best-effort snapshot helper intended for tracing and debuggin=
g
> > use. It favors non-invasive snapshotting over strong serialization, and
> > returns 0 whenever a clean snapshot cannot be obtained. Nested
> > invocations are not serialized; callers may observe a 0-length result
> > when a clean snapshot cannot be preserved.
> >
> > BRBE is paused before the helper does any other work to avoid recording
> > its own branches. The sysreg writes used to pause are branchless.
> > local_daif_save() blocks local exception delivery while reading the
> > buffer. If a PMU overflow raced before that point and re-enabled BRBE,
> > the helper detects the cleared PAUSED state and returns 0.
> >
> > Branch records are read using perf_entry_from_brbe_regset() without
> > event-specific filtering. The BPF program is responsible for applying
> > its own filter criteria. The BRBE buffer is invalidated after reading
> > to maintain contiguity for other consumers.
> >
> > Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> > ---
> >  drivers/perf/arm_brbe.c  | 70 ++++++++++++++++++++++++++++++++++++++--
> >  drivers/perf/arm_brbe.h  |  9 ++++++
> >  drivers/perf/arm_pmuv3.c |  5 ++-
> >  3 files changed, 81 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/perf/arm_brbe.c b/drivers/perf/arm_brbe.c
> > index ba554e0c846c..db5e000b2575 100644
> > --- a/drivers/perf/arm_brbe.c
> > +++ b/drivers/perf/arm_brbe.c
> > @@ -9,6 +9,7 @@
> >  #include <linux/types.h>
> >  #include <linux/bitmap.h>
> >  #include <linux/perf/arm_pmu.h>
> > +#include <asm/daifflags.h>
> >  #include "arm_brbe.h"
> >
> >  #define BRBFCR_EL1_BRANCH_FILTERS (BRBFCR_EL1_DIRECT   | \
> > @@ -618,10 +619,10 @@ static bool perf_entry_from_brbe_regset(int index=
, struct perf_branch_entry *ent
> >
> >         brbe_set_perf_entry_type(entry, brbinf);
> >
> > -       if (!branch_sample_no_cycles(event))
> > +       if (!event || !branch_sample_no_cycles(event))
> >                 entry->cycles =3D brbinf_get_cycles(brbinf);
> >
> > -       if (!branch_sample_no_flags(event)) {
> > +       if (!event || !branch_sample_no_flags(event)) {
> >                 /* Mispredict info is available for source only and com=
plete branch records. */
> >                 if (!brbe_record_is_target_only(brbinf)) {
> >                         entry->mispred =3D brbinf_get_mispredict(brbinf=
);
> > @@ -803,3 +804,68 @@ void brbe_read_filtered_entries(struct perf_branch=
_stack *branch_stack,
> >  done:
> >         branch_stack->nr =3D nr_filtered;
> >  }
> > +
> > +/*
> > + * Best-effort BRBE snapshot for BPF tracing. Pause BRBE to avoid
> > + * self-recording and return 0 if the snapshot state appears disturbed=
.
> > + */
> > +int arm_brbe_snapshot_branch_stack(struct perf_branch_entry *entries, =
unsigned int cnt)
> > +{
> > +       unsigned long flags;
> > +       int nr_hw, nr_banks, nr_copied =3D 0;
> > +       u64 brbidr, brbfcr, brbcr;
> > +
> > +       if (!cnt)
> > +               return 0;
> > +
> > +       /* Pause BRBE first to avoid recording our own branches. */
> > +       brbfcr =3D read_sysreg_s(SYS_BRBFCR_EL1);
> > +       brbcr =3D read_sysreg_s(SYS_BRBCR_EL1);
> > +       write_sysreg_s(brbfcr | BRBFCR_EL1_PAUSED, SYS_BRBFCR_EL1);
> > +       isb();
> > +
> > +       /* Block local exception delivery while reading the buffer. */
> > +       flags =3D local_daif_save();
> > +
> > +       /*
> > +        * A PMU overflow before local_daif_save() could have re-enable=
d
> > +        * BRBE, clearing the PAUSED bit. Bail out.
> > +        */
> > +       if (!(read_sysreg_s(SYS_BRBFCR_EL1) & BRBFCR_EL1_PAUSED))
> > +               goto out;
> > +
>
> The code below doesn't implement filtering, I am currently trying to
> figure out the best way to implement that by reusing
> read_branch_records() somehow.
>

So, I thought about this more and feel that we don't need to filter
for a specific event because the BPF program is not associated with a
specific event, rather it is associated with the CPU where it is
running, So bpf_get_branch_snapshot() should return the branch records
from the PMU of that CPU. Now, if there are two events on that cpu
with different branch filter types, let's say
PERF_SAMPLE_BRANCH_IND_CALL in one event and
PERF_SAMPLE_BRANCH_ANY_RETURN in another event, the perf subsystem
configures BRBE to record the union and then does per event filtering
in software (brbe_read_filtered_entries()), but the BPF program should
still return everything that was recorded on the CPU, which this patch
is doing.

