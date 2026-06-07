Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3695CD8C8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 22:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s75AHbz4vBuayfk9+70x5zzjz+DkRAGgcB9JhZnUsTo=; b=otjwuw9zS3xQh4PgimBZUo7N0x
	ZM0CBEikQS1i14/kIgnVFFWLZcWJFMehc1oyweuSIkrT4DGX1QYY1GlPJidu+qKfd6gR4ToHBgBLT
	psuZ3Kv5tmUYHKGP69DJ9F6eOeuYyT2mf4B7uT43+ZSfkWqJVZMIJD/te4URA0ZDve5i/taMhDyaC
	pza7yyd7f99PsNrUNR5J/BUkXY+PAF24dIgp9rE8YXEo7H5eMOIj4bz0kLeTNs5BtvUEG3ztoxPz9
	9k8sxnbeed2+2hj7sl0hJWjO/ZrMExoWA9f8bFXGbHXz3/xzlY0/TdFHSJtvknkhLWRhHr2E79Tu0
	pafM4qsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWM0U-00000002ZE5-41wk;
	Sun, 07 Jun 2026 22:30:14 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWM0T-00000002ZDa-01id
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 22:30:14 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-51765331535so1341331cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 15:30:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780871412; cv=none;
        d=google.com; s=arc-20240605;
        b=GVIE98kGf2LTe21NO+Yd+x1qtULyzVcKo7wFjQr1PZLBBi/nqhYup3hKR6baQ74OAR
         YKtEYRsD5flBN3frQGqXFGDw7n1nJW3Vn97rGptcQuGw+LCG/oRHdH+XXkgOJOC/XEJg
         AWxLtyopIGS8DuZ30iciO9lzIyYD0CDDqB9eawD/sRHlVoKRL5KSVrRQ1YZAYO2I20f8
         Cw2suq/VLcSW6ZPFvxWLojXhthPg1dxBi6WuUze8uBxiNLMDFt25rdtb46s273RZ9Mk2
         gel6udgIZt3kDF1Swr6/fTNsNQSMReyBz29OVNOjhfEgr3gRb1qmhqK5WJ+ICLm9Xq7/
         Ew0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s75AHbz4vBuayfk9+70x5zzjz+DkRAGgcB9JhZnUsTo=;
        fh=QVqHAbf5jG4LJnnj7ED1/psz03FZaw6eimQrTmMnR14=;
        b=DWGfmMEVDjRP5x4UCEqGUDKR1U5aTzYNF02MRvvvK2iJrc/ldZBfzkkkEyW8asSNW8
         cz+siqI8wRf1S1GsCznZN5tFSXCgGKmL4x1+UD8LBw93FRPaRo+M1VXfPbh1kx7kF5Sz
         sxa6AUu/EiaIrLr1fb58vLYyf5rTVrSE89or/at60jp5ruIHfdeQUhEZz89RUYfMa1zZ
         rZ3Oh6kElKXWc2LR9I4iofaZnVKvZ/VJCTU0zCqtxzHBIRS9ox9LuLdcHtHEgrxdDLbM
         qGLEjl3DLM7Z3eXmqGivXLIBdwKvuApU72z/c09KfFkQhgGMnwJRZqgMhJxiWZCFaUnW
         Vdfw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780871412; x=1781476212; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s75AHbz4vBuayfk9+70x5zzjz+DkRAGgcB9JhZnUsTo=;
        b=bKEkH7P4iElzrCOPn6jmeFNffmIO3DBGX9y0xCJDzBf0UUbtHHaUp97F94bCFPTduA
         F4iQr0cI9oIpwzf2fa0HX6iXKhLkWxfyc6Xnm10ecD8zGKNCq/m2+7llsmddAAOdUdbY
         XeH81k5KZmBcAU6jaH1X6OY73LVqAnVLN1Dq/mdLSNUvSiVcsJ8Mr7HPwAo+Jp3MkWe3
         Ca9XoCVGu4mUK+6+6WHLu6mAm43AnTWIqfft0e1xWmbujaygmUQHVi0+SwAc4U0zfMkn
         AYv3dwZPsq38wstq7M0cn6HfrTk6NoyVygU2b+H3Yb4ioqmOSBAMM0U907/wEhid7Wxl
         2ICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780871412; x=1781476212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s75AHbz4vBuayfk9+70x5zzjz+DkRAGgcB9JhZnUsTo=;
        b=G7XW/3qPIh0R1p8ixCNvHexeHxdj0TJzSYq6rRLpNT8QoJQVozCHgKquyOuAmqt2mt
         MFByttZMdg4mwAybN4dsgjwGLYeorXD6dTEV0JYRAFF1thVnUTlAkSlPwY7/udi8feVP
         EYoir2BHoK9hg9lbp1uZ1FooUhMNPxE8IaNlBQRgFYLOiOy5gwi3SKcfUdtkyhdPLrWf
         0ZPNSbdR9AW4BoPMD7pIqMCfNzHY6nGWSCeqpC0RiQ5I51wd+WVm6CC/9IY0kque1pIT
         Cu1ZO1noeKxrTr9sBiLx/d6y2UGCrP8SDuCJfREcs3wqTI1GWkJCSfUGch/ljUBWZOD0
         9KrQ==
X-Forwarded-Encrypted: i=1; AFNElJ+NtHoP+4xVzSxkJWKPG5oFcTxjYt4ONcyMWz/uKiZAFMiujVDlG7S6KkDFNwZ1bhOY278BvZw4CH2ObutdZlnz@lists.infradead.org
X-Gm-Message-State: AOJu0YwxkWODWHRWekDYL6ysmUPXictwTWJufMjHpPdNq3VA923r+xty
	hHv1bQaxUlQBihet99Ywek0ZbMdJ6tm1fEFwXybExE+NZ1UY/wPnm8qjgUktDJggqO9TMhaI5M2
	v8AWr/TUKgY/AiHqEYizQOIu9kbQocjO/sgD3ArJY
X-Gm-Gg: Acq92OEOhODuEj4PgzUbF5TyzzgLi6sUBWvgu2rtgdsbAeyLWPw7rK5Jkwpj7dNh+M6
	1zTmhodLuXXliGkdEeuWV1aFQGcyeoL/KQLAFM+dZRizK5d/XwGFqFddVx5GGREd/hNoKc/N9I+
	EG7joBW4Q75TCviGQZFzrCBkioeL6nvLp74Kezbn1DCd5d1atcR2Nw+pEvZnw+KrapgWe2XRBqn
	MVzu+umcx3JiOvKxck1l/mHS+BV0DcybTligqd9Sxu+INyjQ8uD2Arl1Pqp4oT9oNkg/ItybQ1c
	zM5cHBRiaTbHe7M=
X-Received: by 2002:ac8:5ad1:0:b0:517:99ea:ab7e with SMTP id
 d75a77b69052e-51799eac04dmr21324091cf.24.1780871411109; Sun, 07 Jun 2026
 15:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260601215909.3958732-1-praan@google.com> <20260601215909.3958732-10-praan@google.com>
In-Reply-To: <20260601215909.3958732-10-praan@google.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Sun, 7 Jun 2026 15:30:00 -0700
X-Gm-Features: AVVi8CfILy1w6zPPcSCqno87gNyBXrRqpCu4Tsw4twa-VACBxAdN7lY1rhDrUoA
Message-ID: <CAE2F3rC4a55Hfg+JZZora4UYxJyz9WgUV_kqBt_ejUy+9RLzYQ@mail.gmail.com>
Subject: Re: [PATCH v8 09/12] iommu/arm-smmu-v3: Implement pm_runtime & system
 sleep ops
To: Pranjal Shrivastava <praan@google.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Ashish Mhetre <amhetre@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_153013_175008_A0406CDE 
X-CRM114-Status: GOOD (  13.62  )
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
> +static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
> +{
> +       struct arm_smmu_device *smmu =3D dev_get_drvdata(dev);
> +       struct arm_smmu_cmdq *cmdq =3D &smmu->cmdq;
> +       int timeout =3D ARM_SMMU_SUSPEND_TIMEOUT_US;
> +       u32 enables, target;
> +       int ret;
> +
> +       /* Abort all transactions before disable to avoid spurious bypass=
 */
> +       arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
> +
> +       /* Disable the SMMU via CR0.EN and all queues except CMDQ */
> +       enables =3D CR0_CMDQEN;
> +       ret =3D arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0, ARM_=
SMMU_CR0ACK);
> +       if (ret) {
> +               dev_err(smmu->dev, "failed to disable SMMU\n");
> +               return ret;
> +       }
> +
> +       /*
> +        * At this point the SMMU is completely disabled and won't access
> +        * any translation/config structures, even speculative accesses
> +        * aren't performed as per the IHI0070 spec (section 6.3.9.6).
> +        */
> +
> +       /* Mark the CMDQ to stop and get the target index before the stop=
 */
> +       target =3D atomic_fetch_or_relaxed(CMDQ_PROD_STOP_FLAG, &cmdq->q.=
llq.atomic.prod);

I'm wondering if we need the non-relaxed version of atomic_fetch_or()
here to benefit from the barrier guarantees. Otherwise, how do you
ensure that CMDQ_PROD_STOP_FLAG isn't set before SMMUEN is cleared?

> +       target &=3D CMDQ_PROD_IDX_MASK;

