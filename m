Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8B4C982DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 11:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dZ+UU0cW7lO7sc/YWjbCFQdvW29aK3TMctUKE8s0RwA=; b=efMmgTSHspVMiWzpPkHSuVL0ES
	c+zjWQYUB6T93GGqav7AoabL+bZJ6GpUe9msTdmSkpV5V9BTdPiEI6JOhO74ZOXnlrURFdJyA/vV6
	1+iTi6Tf1Xan536jCKs/lkeeC8bcmz04Ir0TYvawIKwRbD4l1mCIrtyAAE4Ch/M7OTYlui6l/AIKU
	wNZfs88i9221+Khy0hRez+cbuW3JIXRcqthBMsUjmtMqC2vn2zT7DSB8jnEXFnihWkCQZdSIYvrvM
	JxN37uDprl+m5i4cxNgHhRWFcy5hbp/FfBaegzC8/iJDPCEhKIufB2vopnWbBn1v3cEN80vOuP+W8
	KWBYd2aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7XFL-0000000EJGf-2c5C;
	Fri, 18 Sep 2026 11:59:15 +0000
Received: from out-119.mta0.migadu.com ([2001:41d0:1004:224b::77] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7XF7-0000000EJER-3PTe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 11:59:03 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=dZ+UU0cW7lO7sc/YWjbCFQdvW29aK3TMctUKE8s0RwA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789732738; v=1; x=1790337538;
 b=ldKEMTrFEy3fmKEVUcGHUBddV4/P9fTB3fA8AVfBU/OtKa+YViYhDrOqfKBcA9/FzLerUcYJ
 +WhO1hmKDnphOMGOEVszkvAVYumPbFtorQCdA9scFqpQNrsH5Uulh7crREiWacPSIwLET2M83hc
 sPs+LPXMFcMv7RpKzp/+P5DU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id cca0b0410c54eb2f;
	Fri, 18 Sep 2026 11:58:58 +0000
X-Mizu-Trace-ID: cca0b0410c54eb2f
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b83c1421ecso6310e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 04:58:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxq1J+Zo8LZEu87EON/op2iPAZPhvZl4cv7iT02tmSzrKvnd+tr60VtIg3wFNnrJv01ghl6xfqOdjD0mOylQ+GT@lists.infradead.org
X-Gm-Message-State: AFuF++mMkgRScsD/c0VCaHqhe4Yr/uqzQx12fu2xWuyNsprQYdMA0SPQ
	XBKpLvWW6BBuI8QW54bDJYBvdL1dy0J4Hff5eX4zxODNyYz9SokdJ9rKMwf7RzMYDmAEmZjitSI
	YY+h/tNwK9K2FS3z8j3wpBtYxSfnL9vYYRhm+GMF0
X-Received: by 2002:a05:6512:3c9f:b0:5b2:a967:c0e1 with SMTP id
 2adb3069b0e04-5b8c0fcad95mr166760e87.0.1789732733287; Fri, 18 Sep 2026
 04:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260918040214.85580-1-ndaugoing@gmail.com> <20260918040214.85580-2-ndaugoing@gmail.com>
 <CA+EHjTx8zzvgqj99TKWfRD58X-M8v+hs9358_r_1zZonFNEsgw@mail.gmail.com> <CAC2BP3K-fvW2s2j2ys+kPMuxrzeMw9yc6MrAk7U7CqCpb2WePQ@mail.gmail.com>
In-Reply-To: <CAC2BP3K-fvW2s2j2ys+kPMuxrzeMw9yc6MrAk7U7CqCpb2WePQ@mail.gmail.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 18 Sep 2026 12:58:17 +0100
X-Gmail-Original-Message-ID: <CA+EHjTx9bTDuTnGgkrCcaAG+1S1Lx6+1BZnuhJcWNTJxWXkAHw@mail.gmail.com>
X-Gm-Features: AcwNN1W8n3dmMVZr53drbRK261wAXv8qWFmrNE31MdA1aY5Yy24oy1p3VG9UCp8
Message-ID: <CA+EHjTx9bTDuTnGgkrCcaAG+1S1Lx6+1BZnuhJcWNTJxWXkAHw@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: arm64: vgic: Do not remove in-flight LPIs from AP
 list on disable
To: Yuchao Zhang <ndaugoing@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_045902_225907_99D51067 
X-CRM114-Status: GOOD (  23.42  )
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

Hi Yuchao,

On Fri, 18 Sept 2026 at 12:51, Yuchao Zhang <ndaugoing@gmail.com> wrote:
>
> Hi Fuad,
>
> Thanks a lot for pointing me to that thread! I was not aware of
> Hyunwoo's earlier report and the discussion with Oliver and Marc.
>
> I'll read through the thread and their rationale on the ap_list_lock
> approach. I'm happy to defer to Hyunwoo's effort to avoid duplicate
> work.

I'm not sure you should defer to their effort. It doesn't seem like
Hyunwoo has done any work on this for a while. I just wanted to point
you to the existing discussion.

Cheers,
/fuad

> Thanks again for the pointer!
>
> Best regards,
> Yuchao
>
> Fuad Tabba <fuad.tabba@linux.dev> =E4=BA=8E2026=E5=B9=B49=E6=9C=8818=E6=
=97=A5=E5=91=A8=E4=BA=94 15:22=E5=86=99=E9=81=93=EF=BC=9A
> >
> > Hi Yuchao,
> >
> > On Fri, 18 Sep 2026 12:02:14 +0800, Yuchao Zhang <ndaugoing@gmail.com> =
wrote:
> >
> > [...]
> >
> > > Note: this closes the primary race (the last_lr_irq node itself is no
> > > longer unlinkable while in-flight), but the fold traversal can still
> > > race with a remote flush unlinking a subsequent non-LR node in the
> > > ap_list tail. Fully closing that window needs the fold side to take
> > > references before dropping locks (in the spirit of the prune-side fix
> > > in commit 7258770e5814 ("KVM: arm64: vgic: Handle race between
> > > interrupt affinity change and LPI disabling")) and is left as a
> > > follow-up.
> >
> > This is the same race Hyunwoo reported back in June [1]. You might
> > want to have a look at that thread first: Oliver and Marc's view there
> > was that the fix is to take the ap_list_lock in
> > vgic_v3_fold_lr_state() [2][3], and Hyunwoo posted a draft of that
> > [4].
> >
> > Cheers,
> > /fuad
> >
> > [1] https://lore.kernel.org/r/aiHrGM1f8czcUby4@v4bel
> > [2] https://lore.kernel.org/r/aiJi5a3JJ-TbWL-s@kernel.org
> > [3] https://lore.kernel.org/r/87a4t99z9n.wl-maz@kernel.org
> > [4] https://lore.kernel.org/r/aiXvwGD1hS6vwLEd@v4bel

