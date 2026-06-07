Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D24CD8C8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 21:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vyqe1/V8LOLZRRB2tkc6YkttN2Ie/2+WN0mY7kcvXhU=; b=XyG9g884kdgzjqo4N8VElwrpZN
	b5kxj87JX6Sm+A+h1ISHM61nSArPrQmd0x3u6wvRxq3rzn/1cdgVtMgXn7KKYZUJfCVIGkbe3rn5x
	FxWzGrv062t6hlkoBJzW0hQmxv8rLQMXd6e+/2E8ofByJ2Q+vHbJc2z1tF0LeMq4cqqviLZLmhR8S
	q/e42vyGKlH3/goNoEywmEuUlwJqIirK6IPGk90SGu0aNzIB5pZ4YIPrKdjZKvG72LnpAy97r9yoD
	re8aaih6zYhzLAjhr40fdBm6JfSIJI5gm4YPSx5S8/hbUQcFBCduT8i6zjsb+5qYrQqtDH6pwxWdO
	xi3yJ63w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWLGk-00000002WiV-27HB;
	Sun, 07 Jun 2026 21:42:58 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWLGc-00000002Wfi-0YjY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 21:42:57 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-5177d1ff061so1234281cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 14:42:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780868569; cv=none;
        d=google.com; s=arc-20240605;
        b=AK5y0GMoIX7/xxVuxFYHW0CFpMwH/3cL4Hqre1DMEDMgObWrvKMBE/03vrqmDdiWnQ
         sofzk9L7UhOF83dmo/gQDTrixUIhQz5qHETz2/nPmWDvWHDTl5ElFE/x/AOXWgew4AzO
         n+HgcUhRX1M+qp5KHzUCsqomh19ZINKBUAmOiJTWSBJn4upnb25EX2cxOUvHfVY3dVYD
         oFnw1QfGgCiQW2O7efBRy0WHrwLnV0SIxXlo4sf+vqO5BskD+gM/5ed+iH3hAESVQSmE
         NI4hDlTaLWJk5AXFHXpOdMEoRGeycn54C9aI4K4Yr+LOUNdfOB7lu4/z0qTzHDpGrLBY
         CIaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vyqe1/V8LOLZRRB2tkc6YkttN2Ie/2+WN0mY7kcvXhU=;
        fh=ZAcz3A4/ypOjbf5aweNvpPjrPjFcEoJbis/I4CKYGZs=;
        b=kym02LRUwqF5JXCGj5ABFPCN5TEdqkrms7KoxJOH/F8EWQywV8zb1yW4wd3Iv1yjDn
         QS+kisqyimGGhrWm31jETPx+DXokhprOIm68e4/ptNfQgBtX0aRP8sBAp8bR8CjNZBiP
         OTCBXIa7PqmIEDWkLfHW1ygwTYo03rJklE7v1WEEQR8x04pD6aUqcmOlDPY2PK6qehep
         onU0EdgJgSmRuRmRpo4EoXWTJ7Ra2PCc5kZ0QjOCtVM6GfOZEKipITmwGCFNMyF7heVc
         A+a37BNeB+uWSOGey8vTLjR5pVPpdVW/RmxZg5M/0H2TngN0SI+LGLivOtpbkJXh0tA6
         P1zg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780868569; x=1781473369; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vyqe1/V8LOLZRRB2tkc6YkttN2Ie/2+WN0mY7kcvXhU=;
        b=ESjv3WYbkq+PtXIV8CIJ66X/2HwN4c+M1GCKMlTft/fIxslxuUJY0na1c9ZFW/LmRE
         KrxgOjT4x2OvUajtGoAjmadzMKBoMjmAiahAgii93zp8eRzgzAE4yrZqwJ10CjP3L0LD
         COW4Caj3oAg5JbuO4UVuoY34BoO6wlWIZu0L+uXoIDlxur8pVGrXFX3HA5UDoqXSwnsL
         m9cHaK0TwY2KoUXz4NeJ1SvX3B+pjRQ9wLQAZqzRfzTzFHgrNGIUg79X7jregfrps/CJ
         z7hmpwiKVVJYKEThssQiXIWtcLMdZFJUMqmh1zIFAPRLQYZlgGeTH4MHfIakPAGj+/xP
         TAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868569; x=1781473369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vyqe1/V8LOLZRRB2tkc6YkttN2Ie/2+WN0mY7kcvXhU=;
        b=AOZZ0pRLUsSR29j3aHquZ1cIIgD/SP4vzWDSnsuIjYuCVOYb67bmuo9MdWP9ni5/4j
         C384FGE2xSHIATCY0Td6WWDPC6hKFmYR6MyOqgMtfkuJrcf+e31VCQIkLX8Y+k+U2SYY
         PGQKJpMhMjKvrGDF+tv9FYclSoECVC/v31YSp/9FUWOlTA262ZPPQAtjr4YjoSld6y+L
         wtpUeVFOhBj35CVsNVV4JtsVeIbxOuknLs80bBMpfgVjFnp5MyX7hbZ2RpIoQbOOCSzH
         dEL5YwRV7LFjqDYDEUnP6c4VtRpxaCBh1wk2ehDp9qh8rxZGi48Xx1vOy2HgY2gafNXA
         rixg==
X-Forwarded-Encrypted: i=1; AFNElJ+Wz+ZmUETkQTxUyIJ+5j5k/iHqGvdXI/aqPK8sCdekQSFwvvVtnI3gUT4kc9Bg5e6N3ZJWTPK+8y/eEqbuWybu@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/bECtGeYCPW7A3ViBd+K5AZMB4XVEMj5aORaCtexq8PIWvXDb
	xvpcMu1BOs5ukTp7/GmFmQEPHnmX/wuywgwsxJ5r09iQRNot8yeeabCVXJxstWO5AUPbmbN3d0o
	cqYzwWS78hWx91JYlluYrV/pdhVzLyOjOK7xQw0hp
X-Gm-Gg: Acq92OHwhtoWnG36EixFEpGjN/LH7IV7YbQZXd8SXqKEhmJSHUbokRYN4qhST7jFCKM
	KxcZjzNxyNaFhkdKYrkNlpqTIcybGfr1AlaZlgbGfIH027ituYXnYLOrmj6dNFBSP5px8l+CoOJ
	bg5PvTXN+hjI/dzkZhytgkGugzRinX5p7rmeAoa3Zsj5nYyNKDOgv9hwwDJ+ya/1/sn31/OTte+
	h7hEN64AvYyhkxn4ocmeBPQzHXGfXDONaJuGy3IMapil29ukCz27FLuKrtLvewol2Mozni2PbLv
	CtN3wogCdxBkNj0=
X-Received: by 2002:a05:622a:178a:b0:517:99ea:ab7c with SMTP id
 d75a77b69052e-51799eabedcmr13790861cf.28.1780868568251; Sun, 07 Jun 2026
 14:42:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260601215909.3958732-1-praan@google.com> <20260601215909.3958732-8-praan@google.com>
In-Reply-To: <20260601215909.3958732-8-praan@google.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Sun, 7 Jun 2026 14:42:37 -0700
X-Gm-Features: AVVi8Cc7vDwsTYlZ7xArJ-OaI4SeEU2xRhvF0rVcM1tRP9imeosdVyxxnu47IE0
Message-ID: <CAE2F3rDF5dVJip2gc+vaxtM-FRttnUEnAetUYz6qDCXRM=fNYg@mail.gmail.com>
Subject: Re: [PATCH v8 07/12] iommu/arm-smmu-v3: Add CMDQ_PROD_STOP_FLAG to
 gate CMDQ submissions
To: Pranjal Shrivastava <praan@google.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Ashish Mhetre <amhetre@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_144250_205860_5A8091A8 
X-CRM114-Status: GOOD (  28.84  )
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

On Mon, Jun 1, 2026 at 2:59=E2=80=AFPM Pranjal Shrivastava <praan@google.co=
m> wrote:
>
> Introduce a new bit flag, CMDQ_PROD_STOP_FLAG (bit 30), in the command
> queue's producer index to safely gate command submissions during device
> suspension.
>
> The flag embeds the suspend state directly into the existing global state
> The flag checked in the cmpxchg loop in arm_smmu_cmdq_issue_cmdlist(),
> which acts as a Point of Commitment, ensuring that no indices are
> reserved or committed once the SMMU begins suspending.
>
> This prevents a situation of "abandoned batches" where indices are
> incremented but commands are never written, which would otherwise
> lead to timeout during the drain poll.
>
> Update queue_inc_prod_n() to preserve this flag during index
> calculations, ensuring that any in-flight commands that successfully
> passed the point of commitment can proceed to completion while the
> flag remains set.
>
> Suggested-by: Daniel Mentz <danielmentz@google.com>
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Pranjal Shrivastava <praan@google.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 20 +++++++++++++++++++-
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  2 ++
>  2 files changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/=
arm/arm-smmu-v3/arm-smmu-v3.c
> index 6c8631e2f153..c4315bdde7d5 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -210,7 +210,8 @@ static int queue_sync_prod_in(struct arm_smmu_queue *=
q)
>  static u32 queue_inc_prod_n(struct arm_smmu_ll_queue *q, int n)
>  {
>         u32 prod =3D (Q_WRP(q, q->prod) | Q_IDX(q, q->prod)) + n;
> -       return Q_OVF(q->prod) | Q_WRP(q, prod) | Q_IDX(q, prod);
> +
> +       return Q_OVF(q->prod) | Q_STOP(q->prod) | Q_WRP(q, prod) | Q_IDX(=
q, prod);
>  }
>
>  static void queue_poll_init(struct arm_smmu_device *smmu,
> @@ -718,8 +719,25 @@ int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_devi=
ce *smmu,
>         do {
>                 u64 old;
>
> +               /*
> +                * If the SMMU is suspended/suspending, any new CMDs are =
elided.
> +                * This loop is the Point of Commitment. If we haven't cm=
pxchg'd
> +                * our new indices yet, we can safely bail. Once the indi=
ces are
> +                * committed, we MUST write valid commands to those slots=
 to
> +                * avoid indefinite polling in the drain function.
> +                */
> +               if (Q_STOP(llq.prod)) {
> +                       local_irq_restore(flags);
> +                       return 0;

On second thought, I no longer believe that this is safe. I understand
that READ_ONCE(cmdq->q.llq.val) implies no ordering guarantees with
respect to any writes to translation tables. In the non-stopped case,
we can rely on the call to dma_wmb() further down in this function.
However, for the stopped case, I can't identify any barriers that
would ensure that the STOP flag is checked only after the writes are
visible to SMMU. Here is an example: Let's assume the following
program order:

 * Write to invalidate PTE
 * Read from cmdq->q.llq.val, determine STOP flag is set, elide TLBI

What prevents the CPU from reordering these operations as follows?

 * Read from cmdq->q.llq.val, determine STOP flag is set, elide TLBI
 * Write to invalidate PTE

Can the following situation occur?

 * Read from cmdq->q.llq.val, determine STOP flag is set, elide TLBI
 * (Different CPU resumes SMMU)
 * SMMU loads old PTE value into TLB
 * Write to invalidate PTE
 * (stale PTE remains in TLB)

I propose the following: If you find the STOP flag set, run dma_mb()
and check again. I'm afraid that running dma_mb() unconditionally
might incur too much of a performance penalty.

I have the same concerns with arm_smmu_cmdq_can_elide(): That
READ_ONCE in arm_smmu_cmdq_can_elide() provides no guarantees in
regards to ordering relative to PTE writes.

>
> +               }
> +
>                 while (!queue_has_space(&llq, n + sync)) {
>                         local_irq_restore(flags);
> +
> +                       /* Avoid waiting for space if the SMMU is suspend=
ing */
> +                       if (Q_STOP(READ_ONCE(cmdq->q.llq.prod)))
> +                               return 0;
> +
>                         if (arm_smmu_cmdq_poll_until_not_full(smmu, cmdq,=
 &llq))
>                                 dev_err_ratelimited(smmu->dev, "CMDQ time=
out\n");
>                         local_irq_save(flags);

