Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF3DC71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 14:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9hYeG/lN/dobWu+WOAuHe6WhQ/AJqqM1f1NumulS6iw=; b=q4fpyEI+s9MJsdkxu3mfNd1Zvn
	IaGlsAbLeaxMm7L25+tMYgjGJVyt7wXmq6+Feye/wRlVMsNMMvqubtleWJCi9PTcKJ5Opv4sVANbE
	2mGjsqfC2muvfogPdnEP66nocQGXJC3Q/uKR7zVXYTTn61U0CconvxzYPCKx1eDwyqpBQ7FUyGgas
	z4ijktbwyfe2uvTCq4xNGAk2XpgfL/cKBKPsCppv8ogpaPxEc2hIY7i9ttKjs2zqw7A4KpaWp7h3o
	XOuiQQbSf5BJ7psICckBbMJNH2fvtvOdRnCqDtbV95MAjiPjeiF279lKSjjSiFYOasSsT1vK7w8ud
	sBHg1e+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uScvy-0000000FsZr-2oxf;
	Fri, 20 Jun 2025 14:41:38 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSctj-0000000FsCv-310c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 14:39:21 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-313fab41f4bso2673690a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 07:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750430358; x=1751035158; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9hYeG/lN/dobWu+WOAuHe6WhQ/AJqqM1f1NumulS6iw=;
        b=iQFwsBl6yp0K6qODDePTMELViM7WMbxIdZ0+LllWUTUTGqvquf9Mqlg+LGGJIbdRNy
         wJtQX4bcxIcMYj5uyda+HacNJ6N/p5Ml//JF8RH+CNy+rk1ZEMGGh6CcooFTm42iT0IX
         xwMZl0DF0VXbostGChdG9UU4DhXShzgEqw3gsVvDDLzVt34uPXCd55rGtEc5h1OYBQX3
         Nsew6iafKGOdu6RqPup7VJpxscTWnzNKcpUpI+y5WWj1YRap6IDuSAHAx5XGGKzixAtp
         8whRGGP/ZiOZ8am0g59PqDXRaloa0weNML92OhsmzsvC5c+r7ZIj1Ha5Mt15chWvEN0u
         AdbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750430358; x=1751035158;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9hYeG/lN/dobWu+WOAuHe6WhQ/AJqqM1f1NumulS6iw=;
        b=jqMdmF9fLV2HAvqjwW6VZL7JTarDmIaHsyAfKxkS6BC7+o9OSBF3x7DGKJZgkdUpQM
         0oXDAN7DCJRMrMPHEUq9blUJDYVtaQowHMMJIxtLcbsU1ET/7KY9BDWS86c4abzS7EF9
         oyj2TFE/XRRE4OnTS0psqnjMsRQmZhnMjJkuOSwzoOYFjNqItRJUvu5JIhzSyYXbmTKK
         QkAluy1JymJkdSk9KPM4MSnJ/FqW7yu6Oow5uiAuzAsJi3dABHEYdgfCFaFEj/Bla4Mv
         Ajb4b1ada2+MFxVcAGC/AXtSKbqTDLwlzsGRYHwy8QYs257o5RWGrjeCOicznG3JjFqw
         1aqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyHSd3+ZzQtpkigwmUpaUvB5ujbfbz2uFMiY/tUn6jvw+k0dr6kFBK5121pGubEgDAa9YXydRnVXDbsGVmQjHB@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+1/7Zi/Z61D96H4C1xmjx8srjY8ivVW0k0pb/RHMWs+2jZ+2q
	j4Rmbpay1JSUKaMmSyXrLAgJnsWioScqM3hU95tGspd+6e6N3QgHuX8vuU9V4awX8Dun//LUrLS
	THMGNRw==
X-Google-Smtp-Source: AGHT+IEu/kAyF65SAfQsKleZ41Vg0owDojNFVAMM/0F6gElDwFbB1sj7AbPvBVKqQ3YY8zBgnoMiSm1QDmM=
X-Received: from pjbee15.prod.google.com ([2002:a17:90a:fc4f:b0:314:d44:4108])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2e87:b0:312:51a9:5d44
 with SMTP id 98e67ed59e1d1-3159d61a5c5mr5175181a91.5.1750430358355; Fri, 20
 Jun 2025 07:39:18 -0700 (PDT)
Date: Fri, 20 Jun 2025 07:39:16 -0700
In-Reply-To: <2eqjnjnszlmhlnvw6kcve4exjnpy7skguypwtmxutb2gecs3an@gcou53thsqww>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com> <20250611224604.313496-19-seanjc@google.com>
 <2eqjnjnszlmhlnvw6kcve4exjnpy7skguypwtmxutb2gecs3an@gcou53thsqww>
Message-ID: <aFVylP1XzMoqocOx@google.com>
Subject: Re: [PATCH v3 17/62] KVM: SVM: Add enable_ipiv param, never set
 IsRunning if disabled
From: Sean Christopherson <seanjc@google.com>
To: Naveen N Rao <naveen@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_073919_753925_DCB4BF44 
X-CRM114-Status: GOOD (  16.59  )
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

On Thu, Jun 19, 2025, Naveen N Rao wrote:
> On Wed, Jun 11, 2025 at 03:45:20PM -0700, Sean Christopherson wrote:
> > From: Maxim Levitsky <mlevitsk@redhat.com>
> >=20
> > Let userspace "disable" IPI virtualization for AVIC via the enable_ipiv
> > module param, by never setting IsRunning.  SVM doesn't provide a way to
> > disable IPI virtualization in hardware, but by ensuring CPUs never see
> > IsRunning=3D1, every IPI in the guest (except for self-IPIs) will gener=
ate a
> > VM-Exit.
>=20
> I think this is good to have regardless of the erratum. Not sure about VM=
X,
> but does it make sense to intercept writes to the self-ipi MSR as well?

That doesn't work for AVIC, i.e. if the guest is MMIO to access the virtual=
 APIC.

Regardless, I don't see any reason to manually intercept self-IPIs when IPI
virtualization is disabled.  AFAIK, there's no need to do so for correctnes=
s,
and Intel's self-IPI virtualization isn't tied to IPI virtualization either=
.
Self-IPI virtualization is enabled by virtual interrupt delivery, which in =
turn
is enabled by KVM when enable_apicv is true:

  Self-IPI virtualization occurs only if the =E2=80=9Cvirtual-interrupt del=
ivery=E2=80=9D
  VM-execution control is 1.

