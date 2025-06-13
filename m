Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0DBC71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 21:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TPUzIppHcu65DcXjx+xmQ4p2o7TM+1lbGXLpXn/D90M=; b=MtbGkht6+vRZI9GeemZfaDjK9U
	YzLjB3pCgGoTjNcbGOq4PPyASWfw3zzjtaS5Mq2yOVb51t7KiD/N+VVOxnDolbFyskJqZbJBhNcKx
	BUPJQyfLMU8AuWe3Z0c9eqJNrYwgpy+QUBmLpiJEjSwli7u4irBDnyiWvWPRBSSs9QPvYk3WVngmG
	0WD9R+nuTMKdeFizWtiwYCASPmaecyUGcdgROXDM+npAeGh/bAHTmo0r1kgzcIA+F7xcbR+NYiR2j
	ym0ULcChDGV22Akz2QxwgzIIDQ/bV02VZJkz/xNj0DX/KD3tdd5SpaG8lQgPd8RXy5l2t/gxWVwE3
	/W3KsIrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBwK-000000007k5-0Gzz;
	Fri, 13 Jun 2025 21:27:56 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBuA-000000007bl-3jwO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 21:25:44 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-4a5ac8fae12so114091cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 14:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749849939; x=1750454739; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPUzIppHcu65DcXjx+xmQ4p2o7TM+1lbGXLpXn/D90M=;
        b=LLdT8fGte+jktypIRwSDB9/ZMDrj4aDmOdDL9ytv6iDaqMyak84XF/dVvMJPxLAWyM
         LJJXZkrbYoikJyvF2DnZgeqGq8KKjFfs9LlqNnUoOs55pHJo0r7m8PiieeY67JBKk9uO
         fplAABP5Hiv8l00qhKate2Sv1VVoH4a+LGVyD6Wpit2J5fECICY0hAaow59HCBDmclH4
         awebTJ9xlVX2TwuQC9msRVdpQ1LBSJwhene1ARJnPm3tO14UOWg1jCAUZWOQIvdzEvOF
         xLDxImloTIVSnNYOvbHh8dTNamCn6ryXNqC4U/uGlO1FVj8gOWnEoEYExoI/4DZxtv2N
         5o5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749849939; x=1750454739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPUzIppHcu65DcXjx+xmQ4p2o7TM+1lbGXLpXn/D90M=;
        b=MOZ1cyWlj7ev7Ftv1SRPdoeUTK7x7LGm7VaHPx2QYh115+ncfp7BTErXgDcKWX92rs
         t0OSKcC+3QKBNEB3+cIHLH/bw0ArEOOdK5bjUUSR68Npywv+1wfHJUZz+vquMpeAXRyr
         fwSawhz1hnaGBNx78g+7eYGqEz+2jHhi8wS3RwzIC5RC38UFwxLsKA5NnEKGldOBpXzE
         tMY0P5P8pD7NAf5uTPlOUs/1WArZuoeaiuh4XvGWt2ydrIiFUyPPP9TGDBHkjP2W7Uts
         HfhHTQjCEv1YmjTaDUT+RaOkMMciBW6Hhag+Q92nkYJANT/jI8GJiAgMdf3owLnAmlcf
         ucRA==
X-Forwarded-Encrypted: i=1; AJvYcCVM5MmhZ2xF2KukCyFEFs7n6fYrgKdV1tF6RenzjRAS2D/z90LxNrlU4oZrhogMiSKcNPmuQYneNIiTZM5UsXgD@lists.infradead.org
X-Gm-Message-State: AOJu0YxRz81waf1iW1JkGhts9hJKubpkYOz1FaeSDT8wrw8/NWOVABV2
	OT05jPFTYOQKfxv2OKm0/EDMwHk+QANlKykx7UwDj6JhIzxRN+HqjL6sinohp/1WQYvB3m6N5Qp
	MiCD989r331EoqJWeJZM61OzIOEzNwmK1jzx0RG54
X-Gm-Gg: ASbGnctiDXZ19yfHTF18v3k4C+ChPCKU7wELLb/0xHF/VuirBVM+Dxct7m7Zh11yVj4
	wc+4432yco9O5a4g1ki//yz2wPzNE7cU9EGqDqMN4wI467FoZ6I7D7bGZ0qpb0w9zoayqhv7pL+
	H6Ek9o0KiVKWGrh6JFCJtgxmKmQWzXofskpB3MfUrkGsv/aNa4nbwuBw==
X-Google-Smtp-Source: AGHT+IHRTXKzQVq2KTm0RSt5qVgrnPAP0bkIbd607Uu6/KmOUX6+sJKqoHDdBmms0U0ufq7rNkEH/UqGIKX1Oa8Sr14=
X-Received: by 2002:a05:622a:610d:b0:498:e884:7ca9 with SMTP id
 d75a77b69052e-4a73da5803emr310651cf.13.1749849938737; Fri, 13 Jun 2025
 14:25:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250613155239.2029059-1-rananta@google.com> <aEyPswyvfJ2-oC3l@linux.dev>
In-Reply-To: <aEyPswyvfJ2-oC3l@linux.dev>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Fri, 13 Jun 2025 14:25:26 -0700
X-Gm-Features: AX0GCFvCkuSdtDxaxbaw03np7924c6ya2dvq2vPeL3lenyiqTkrCE5acxgbNPCk
Message-ID: <CAJHc60yacW7-1K3Uw9RT7a8qH9JyTXouiP=6VP3gifqzHgMaQQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] KVM: arm64: Add attribute to control GICD_TYPER2.nASSGIcap
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_142542_949472_0AF7E445 
X-CRM114-Status: GOOD (  21.17  )
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

On Fri, Jun 13, 2025 at 1:53=E2=80=AFPM Oliver Upton <oliver.upton@linux.de=
v> wrote:
>
> On Fri, Jun 13, 2025 at 03:52:34PM +0000, Raghavendra Rao Ananta wrote:
> > A shortcoming of the GIC architecture is that there's an absolute limit=
 on
> > the number of vPEs that can be tracked by the ITS. It is possible that
> > an operator is running a mix of VMs on a system, only wanting to provid=
e
> > a specific class of VMs with hardware interrupt injection support.
> >
> > The series introduces KVM_DEV_ARM_VGIC_FEATURE_nASSGIcap vGIC attribute=
 to allow
> > the userspace to control GICD_TYPER2.nASSGIcap (GICv4.1) on a per-VM ba=
sis.
> >
> > v1: https://lore.kernel.org/kvmarm/20250514192159.1751538-1-rananta@goo=
gle.com/
> >
> > v1 -> v2: https://lore.kernel.org/all/20250531012545.709887-1-oliver.up=
ton@linux.dev/
> >  - Drop all use of GICv4 in the UAPI and KVM-internal helpers in favor
> >    of nASSGIcap. This changes things around to model a guest feature,
> >    not a host feature.
> >
> >  - Consolidate UAPI into a single attribute and expect userspace to use
> >    to read the attribute for discovery, much like we do with the ID
> >    registers
> >
> >  - Squash documentation together with implementation
> >
> >  - Clean up maintenance IRQ attribute handling, which I ran into as par=
t
> >    of reviewing this series
> >
> > v2 -> v3:
> >  - Update checks in vgic-v3.c and vgic-v4.c to also include nASSGIcap (=
via
> >    vgic_supports_direct_sgis()) that's configured by the userspace. (Ol=
iver)
> >
> > Oliver Upton (2):
> >   KVM: arm64: Disambiguate support for vSGIs v. vLPIs
> >   KVM: arm64: vgic-v3: Consolidate MAINT_IRQ handling
>
> Make sure you run checkpatch next time before sending out, it should've
> warned you about sending patches w/o including your SOB.
>
Hmm, I do run checkpatch before sending, but I don't see any warning as suc=
h.

Example:
$ ./scripts/checkpatch.pl
v3-0001-KVM-arm64-Disambiguate-support-for-vSGIs-v.-vLPIs.patch
total: 0 errors, 0 warnings, 107 lines checked

v3-0001-KVM-arm64-Disambiguate-support-for-vSGIs-v.-vLPIs.patch has no
obvious style problems and is ready for submission.

I do see an option to tell the script to ignore the check:
--no-signoff, so I'm guessing it should check by default? Or is there
any other option?

Thank you.
Raghavendra

