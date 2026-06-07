Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E747CD8C90
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 21:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vGjAiDQ5DI7hn7GSz64TnaLn5mVnu5JIIykSk0z4IsY=; b=tXEYdHYpya7jjitIVqKv5g8GK5
	WHa/djzW94qiF4NijF/q+Lze5LbOZOphebtZLzT7VDgMBNE5sCLI+qT4VPdsqnm43TLtrPyEllQov
	ghfyD3v17Z4h73pBWjtzDCMUX2CFLOKDaxDei3equ9Pl5MGy44Ok309vfF9kfjyp8TKS0slbFm2CJ
	gamfrELZ8vawnthz787RkqyAxFPw1KDLvPvKp5BhS0hUf+W3CAHBf9nCfcLlWUMDLdWJ9ixEq6mIX
	8CWNubmgLI6Am4dE4XDOFvUqRjB9ArSyk20RUbqDxrXDlc2FBHjquXAal3kFCOZCUIHhypPDGtt7R
	hAcAW6Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWLR6-00000002XRi-3tQi;
	Sun, 07 Jun 2026 21:53:40 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWLR4-00000002XQn-1ahI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 21:53:39 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-51765531803so1573931cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 14:53:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780869217; cv=none;
        d=google.com; s=arc-20240605;
        b=IAJ0M/eT4ga0iWcWNf2fBW6UeTkC3ESX5M+br35WMZ3EGqaDrv1lj9+tlPRb22syM6
         zhuAtP3vpToU4IPrEk4pTx23ToLRuyoZXUPhdo9g+pox+MrQrOXvyDYyk41GMw24AJIa
         +XVXvc1TihNHVEqIWvr+/Q8XDE8pZAAHHX0ZUKZpZ6lEJhW13ik40ZJ8kLrR0LIeUNWh
         EKUv7h2yYQJdLsIi9kj4GP/9tENpakf9FfLQ/vuHzDNzvDceunT0MZwxbNDgvA7AE97Z
         OrYthZNtZJVGbc3K9EAPVMFKh83cR3b1cAzC1VgWb0Lx3KZY4zUMGzGvBxf8vMz86Suv
         TEKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vGjAiDQ5DI7hn7GSz64TnaLn5mVnu5JIIykSk0z4IsY=;
        fh=Bpl3JYccjvzoTTzWIKeaqrFGKhA4Hfgi+rSGMvHmeXA=;
        b=fU38A67IZVG0xOHVjlz2IsyQ+dyhYPKikHHKfXnt++bjajupMRbj0iodyiI6nRElw1
         Toc+ZLhDfLBAyOPWF1Y2HMWk51AO/HV4NEWEaDAwp5M8YBdxFKBnZskwugIGRae8zvUP
         46VTxU98VGxzlVa+xBJwAcIap7ggL5OoZEQdmfrY6Q/jrr9obHCHt+zF1D4Gnm7rTKFh
         b2rr82yOdSv9gxZdPU793ajoVnJE9UjxshSWfE4Yvpaph0YX15K7jgIO4Kz6zaf2Ner5
         TgQE6+fw4cErjSZNPZB/mGo9eN5D7QPADT3b61HiVrB9I1axhrGtvMdqp49wxyYACk+T
         zEVg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780869217; x=1781474017; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGjAiDQ5DI7hn7GSz64TnaLn5mVnu5JIIykSk0z4IsY=;
        b=p7wNOwFh6h7UVsEbJaqlpcBnQkGFPxV1W2wpgcNNkyENHVCCs9VdepHUwgHf0afvQB
         ncl/e61GBUZ9r1CRaLME0Eh5QouKv9AQquP2tosi7mbD66V5OWQ9vQWYfSLdc/r7zYMf
         ldHXtyvXehrWIPqjAlFS+feNliZR+UOx5Z+h+Ug6PSdKspiXbZpv/EJkzfoXDxtuAuQr
         636gjACvbkgLbvkVY/vR+5RSvywsrKrSZrIzhmj3XbD/JFKcsyBEMpqA1JLKCA3qcRo1
         evWZ9DrpwB2cOx/u3QChBhdq30sFRngC25fmeA8//7sDOYBQKMdKl27WcUBVuHjaPhfa
         hp7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780869217; x=1781474017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vGjAiDQ5DI7hn7GSz64TnaLn5mVnu5JIIykSk0z4IsY=;
        b=FXw9lYZubziaS4XZorLqipMuAnuB1oXtmTurJEmifGX72JguLJ8GalPnMnGGJevVcp
         mECdi//9FY53qLIrCFUxNT2PDHSQEGOqmrd16v37grS0acsZWUIQc4jLM6a9Fb2s0OGv
         3he72IisK5slcdxLbpzuA3z3ewFErnJ0f2v89OaAcsngzs1NUZdI8nOl0av4CwVUitgw
         gwNtSeVsrGKCkNngz6psdYwgO/AaknTz4hotMriQr80oe2LwqUMZkmgQKBFw0njPX0QI
         VDlEQuKQaWMAzvz7E5drSZqXibhjeHmdFQXB1ZM/SQwzvyl7/2GizbZU4FWuc62MrA+M
         GIUg==
X-Forwarded-Encrypted: i=1; AFNElJ8MOPcZQXb7lRJdIwZMT+vFCunlj0GMVAG0v/O0Uknv1pSW3DlYNKokIWPuo/io44qpxEALrkt/GiijzDk3+UkH@lists.infradead.org
X-Gm-Message-State: AOJu0Yx68vCCqqg7f7jcIy2W8oac6O1tAqsUacPVhhVtiZFGyxX8/x2B
	gYQSixqLmaR7dRhPiD6DUifSe8/Lx0bq230DdE69FM/3wd2xTYq+lwU/Sx1gpWvdOX0h2p8Ione
	9dTd4WimKuKLRPikKTA7DFMXZL2icEc3JB6p8trT3
X-Gm-Gg: Acq92OH5sbgHJ4sM0D0TEq8c9vVf5Gacy4Y1x2PypjDBTOFwnQUIlmF4BHVKqMB/lZN
	4/Ug+enEXG2gS396vSW4XkygfqD0yKhXEokFD+uZhPiIxqnh/cUODMbgDxQsYx03DQIVsQbJWrC
	YKQzagpZc/hgpmVI95oRBc1fFd7bzOdOQ8cBU9JCTToOWips60jJLOX+A/r7ToMz0lVhU4Gfz5f
	1K+vFsTiXabdghlIVxNNYprlBWuP4+SI8sObB3NgEoRhqJ3j+RJQPrxOlZZ05ctz3YoDWFo3Cxt
	p0h+rn/GpeWdGFryziqvtw79Uw==
X-Received: by 2002:ac8:5995:0:b0:4ff:bfd9:dd31 with SMTP id
 d75a77b69052e-5179802dae2mr21524831cf.5.1780869216488; Sun, 07 Jun 2026
 14:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260601215909.3958732-1-praan@google.com> <20260601215909.3958732-10-praan@google.com>
In-Reply-To: <20260601215909.3958732-10-praan@google.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Sun, 7 Jun 2026 14:53:24 -0700
X-Gm-Features: AVVi8CfKncyI9LHnnKvLugy3BBPqZyYdVRq04rL-R-rQhbyBNf0ZfYmtc_38gXU
Message-ID: <CAE2F3rDjFwacP0_TA8tv5_p7ZJejsXAKEb=juNaXgPcMPag+Eg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260607_145338_448666_202ACE85 
X-CRM114-Status: GOOD (  15.44  )
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
> @@ -4898,6 +4939,21 @@ static int arm_smmu_device_reset(struct arm_smmu_d=
evice *smmu)
>         if (is_kdump_kernel())
>                 enables &=3D ~(CR0_EVTQEN | CR0_PRIQEN);
>
> +       /*
> +        * While the SMMU was suspended, concurrent CPU threads may have
> +        * updated in-memory structures (such as STEs, CDs, and PTEs).
> +        * Any invalidations corresponding to those updates were safely
> +        * elided because the command queue was stopped (STOP_FLAG =3D=3D=
 1).
> +        *
> +        * Since the reset invalidate-all commands above have fully clear=
ed
> +        * the HW TLBs and config caches, the SMMU will fetch these descr=
iptors
> +        * directly from RAM as soon as translation is enabled.
> +        *
> +        * Add a memory barrier to collect all prior RAM writes to ensure=
 the
> +        * SMMU sees a consistent view of memory before translation is en=
abled.
> +        */
> +       smp_mb();

I'm not convinced that this is necessary. I understand that the write
to smmu->cmdq.q.llq.atomic.prod needs to be ordered before setting
CR0_SMMUEN in ARM_SMMU_CR0. However, this ordering requirement appears
to already be met by the dma_wmb() in arm_smmu_cmdq_issue_cmdlist.
Could you provide an example of a scenario that might fail if this
smp_mb() were removed?

> +
>         /* Enable the SMMU interface */
>         enables |=3D CR0_SMMUEN;
>         ret =3D arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,

