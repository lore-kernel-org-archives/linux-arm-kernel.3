Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A27FF9D0FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 21:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbQceU69YI8zlRogIjlJ0Jefj/2QvndFBDUyO3J/F8k=; b=cbU3bHCvviWeIW8ZiEx7mbD9EG
	BNDOzcLRrPS0cTo+yVtWziXvQzUEWyHIq40zUnN4ACw1HsBw6sxb2o2WRqdNXsV2inEpQgysxw9NS
	ZNfWpBkFBe9nosp92m4CUcGqjyhUSa9VP2FpGJ7tC3a8lCis53XRETLQ8wIeEAjfj8z7gkvA6RcHS
	GZWFzuA4aGEBTx7uOAwSqjUWKD9ZNNYXwZxnEOA3bx2JsnPy3ZgA76t0hbHWhYdGyK3hVSRdWkDur
	EMzLZexJlbesgiYer+Lx/SicjDEp7bVIjHB+4hbb6ERa2NZEFa/fG7UBqdc0QYeMwNT4uKSXezdiV
	JqG004nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wClVF-00000000FZC-2aRs;
	Tue, 14 Apr 2026 21:41:01 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wClVC-00000000FYq-0ny0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 21:40:59 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-89fc4147f2eso74139916d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 14:40:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776202856; cv=none;
        d=google.com; s=arc-20240605;
        b=jfGFDjFgRtfee/v+8nIsHtQNnenXigFc8ddVHP65ACxzfQQzKnrtukub79PVzkNqQM
         4nyTmUEk/LyUZ1AhKWhhPv1FNEuUpUwPMMry0vleLp8doUjcbzTKR8yEbeC3LrfZ9COa
         qYTnM7x6NN7EYhQGuFIGAtjow5VFmbz1MX6IzJG2OFQc+70vP5H2e4pREzaubvDPa6M5
         9MsuwHJ6fxbwv8P6llFPGPutxf1ETx4NAj1TvIXjNbcKBR/L6vtAr+o2fjN8V5RTjnN7
         K3NRsgkxcKCsFarc+DiBxmfVkie+PUYS9MxwLsOIIMhSSARPPN+CcvfRfVfhY+9zKDKK
         ZJAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kbQceU69YI8zlRogIjlJ0Jefj/2QvndFBDUyO3J/F8k=;
        fh=vTiYygZ+4k9E7AdPHCnZH3ktqHgIZr2vItgNryWeyiI=;
        b=LSgiDcm3tV6NwdK1AS5QNhRQkVUQPNdM5D/Vn7Gjx7MIF7FRocpMOPWr2syOtbxdrx
         v/bXV9PPVCafgnnoDCclM2HbZVb/gLu1U1r6zpruv3dL4147w182ddZg9loM9bSTUeeG
         nyp0unhsEm942/DWrEdRtZq0vF/CQCiB2TWW3ABmh6G9PE8/hgEYKN9jrjbAfrJzfe7r
         9k5kb8Nc2zqge9q6k2mDBeOzBPMhVcFseeK82aLs0CdP37/uIe7Cirzb9b70kRGq1m1Z
         3vqhLss8Qly8l07+g56kNJ6Wn2cwgRG3DbqSvb1ZKg/IJHUXbUEd80rbbYTNLWS0a6qG
         3lHA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776202856; x=1776807656; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbQceU69YI8zlRogIjlJ0Jefj/2QvndFBDUyO3J/F8k=;
        b=eKFv2Rr9hCxM9mQyipchkuXT65z0P//BRatoBo+dvUoztqdjZnQ0wtJcB4BTtBzNrO
         gbC0TT/s+G/96elyhwx8WaTfjsETesc2aKTc6c0sxSbuRQHWhEclNVSeXqCHXglvgw7F
         be+mZB+F+eSiHVlphJEESR//ceW8ecDBz+x0IE1S6xesFnl+dDy1A+IPLkoOKMrzF2mH
         fPG+2CS+2F8Nhwj5vYT9Wk4f28F73AaNXO3Eol+8NhJgJ1iFwTGYswyyBFjKW9HUjwLF
         +zW/gVcb9mm/nL/qmeznoX+WZ+uP9X4grlEsu46jb6mbrqLc3TPd41OqeI2kGCj2zqd0
         J3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776202856; x=1776807656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kbQceU69YI8zlRogIjlJ0Jefj/2QvndFBDUyO3J/F8k=;
        b=bOvoFYsrj/+MNcftPUDSAIYhqDRS2Ubpw/TJttaePhe94kbUS2KUz2AkIS66QPCSpE
         UtYckeY/0djjHmqmRPupGOJpyFeE0buCo9cvBIrMw/tLG4chamRrV7J4EB4+TXCebeDO
         6bjHUkBdf/ar9iXkL5/qDPZLn1Qkw49ShJ34XmzyMMhizAs1SXBiLoUn+34wxjmjzMCa
         jFHcyFn/1iwumGyeUFNJfh9utOTCuOqGxJ5c6BbP8WAF4J0yaoS3zCL1swB6jIiKnirR
         OfU29zd6DX+FwE3wpXAvxZAN3/jezl+XMypzNTmCxsNykWBZQ/3+y7TmU+e+FnIFUAl0
         rnJw==
X-Forwarded-Encrypted: i=1; AFNElJ8mM7EFUdwNPmhetNQtl4DnPjdb7GYe76xm2SEcJYKDFeec3Yq7r0nhw4xmuU8kyo+TtwBMjbjh4VFT1T/bH0am@lists.infradead.org
X-Gm-Message-State: AOJu0YwC69bI3N5X5SB8A94Ki03tI9AmJc7H/nvLBDbUTyhY7bOt3Qg7
	YmYtM4klR9ItUOqx+yhiai33azaunncXDV+jceyBIabG8ceo9nKXq+r/E1aPzFgFcEWznG+eUuz
	A2ZmZ4IGiJTAyazFvhxFvR/myv7sLLcLwzwb/1o+X
X-Gm-Gg: AeBDies5M45AKWeS6WNWvzsn4BeSwJCszyEXHnSFk0Ci2gqQAF8NwI2o8ejsdldKAFq
	fcdcFSt7VX5dwub9M30fMYYboMtdczH8UHA3528Bn2yxk17TOoae5PI9oxXnesRNQmjInM0sZez
	kkJzBsf8ZL9iaAVF6H01OkMskAXgz06wZVLcS5hsRPW6HVaRTRPcKwdqAmdQ6jt3ZkLcb8Mv/lO
	XVIy4do+KquQEARbnUvXADQDw1o1oEEmYJUcdhUNmFWE8P2S1jh1wTeFKHYfgu+BDpkQxPJ9y09
	Zpjfk8p45Rrep8gs31SutpUsDmE=
X-Received: by 2002:a05:6214:c21:b0:8ac:7e8d:859b with SMTP id
 6a1803df08f44-8ac861b77f6mr303189226d6.16.1776202855012; Tue, 14 Apr 2026
 14:40:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260318155413.793430-1-steven.price@arm.com>
In-Reply-To: <20260318155413.793430-1-steven.price@arm.com>
From: Alper Gun <alpergun@google.com>
Date: Tue, 14 Apr 2026 14:40:43 -0700
X-Gm-Features: AQROBzAobYGs6qZALJkhuUvP32YWYfFdjJZKqlEWIdyyyT7N50O82BunKYW5J_Y
Message-ID: <CABpDEukEO4Y_fg8fv5Nr1_Pw_qOK=2UmioXk=WyPEzoEprPcGA@mail.gmail.com>
Subject: Re: [PATCH v13 00/48] arm64: Support for Arm CCA in KVM
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, 
	Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve <vannapurve@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_144058_258989_221A2040 
X-CRM114-Status: GOOD (  42.00  )
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

On Wed, Mar 18, 2026 at 8:54=E2=80=AFAM Steven Price <steven.price@arm.com>=
 wrote:
>
> This series adds support for running protected VMs using KVM under the
> Arm Confidential Compute Architecture (CCA).
>
> New major version number! This now targets RMM v2.0-bet0[1]. And unlike
> for Linux this represents a significant change.
>
> RMM v2.0 brings with it the ability to configure the RMM to have the
> same page size as the host (so no more RMM_PAGE_SIZE and dealing with
> granules being different from host pages). It also introduces range
> based APIs for many operations which should be more efficient and
> simplifies the code in places.
>
> The handling of the GIC has changed, so the system registers are used to
> pass the GIC state rather than memory. This means fewer changes to the
> KVM code as it looks much like a normal VM in this respect.
>
> And of course the new uAPI introduced in the previous v12 posting is
> retained so that also remains simplified compared to earlier postings.
>
> The RMM support for v2.0 is still early and so this series includes a
> few hacks to ease the integration. Of note are that there are some RMM
> v1.0 SMCs added to paper over areas where the RMM implementation isn't
> quite ready for v2.0, and "SROs" (see below) are deferred to the final
> patch in the series.
>
> The PMU in RMM v2.0 requires more handling on the RMM-side (and
> therefore simplifies the implementation on Linux), but this isn't quite
> ready yet. The Linux side is implemented (but untested).
>
> PSCI still requires the VMM to provide the "target" REC for operations
> that affect another vCPU. This is likely to change in a future version
> of the specification. There's also a desire to force PSCI to be handled
> in the VMM for realm guests - this isn't implemented yet as I'm waiting
> for the dust to settle on the RMM interface first.
>
> Stateful RMI Operations
> -----------------------
>
> The RMM v2.0 spec brings a new concept of Stateful RMI Operations (SROs)
> which allow the RMM to complete an operation over several SMC calls and
> requesting/returning memory to the host. This has the benefit of
> allowing interrupts to be handled in the middle of an operation (by
> returning to the host to handle the interrupt without completing the
> operation) and enables the RMM to dynamically allocate memory for
> internal tracking purposes. One example of this is RMI_REC_CREATE no
> longer needs "auxiliary granules" provided upfront but can request the
> memory needed during the RMI_REC_CREATE operation.
>
> There are a fairly large number of operations that are defined as SROs
> in the specification, but current both Linux and RMM only have support
> for RMI_REC_CREATE and RMI_REC_DESTROY. There a number of TODOs/FIXMEs
> in the code where support is missing.
>
> Given the early stage support for this, the SRO handling is all confined
> to the final patch. This patch can be dropped to return to a pre-SRO
> state (albeit a mixture of RMM v1.0 and v2.0 APIs) for testing purposes.
>
> A future posting will reorder the series to move the generic SRO support
> to an early patch and will implement the proper support for this in all
> RMI SMCs.
>
> One aspect of SROs which is not yet well captured is that in some
> circumstances the Linux kernel will need to call an SRO call in a
> context where memory allocation is restricted (e.g. because a spinlock
> is held). In this case the intention is that the SRO will be cancelled,
> the spinlock dropped so the memory allocation can be completed, and then
> the SRO restarted (obviously after rechecking the state that the
> spinlock was protecting). For this reason the code stores the memory
> allocations within a struct rmi_sro_state object - see the final patch
> for more details.
>
> This series is based on v7.0-rc1. It is also available as a git
> repository:
>
> https://gitlab.arm.com/linux-arm/linux-cca cca-host/v13
>
>

Hi Steven,

I have a question regarding host kexec and kdump scenarios, and
whether there is any plan to make them work in this initial series.

Intel TDX and AMD SEV-SNP both have a firmware shutdown command that
is invoked during the kexec or panic code paths to safely bypass
hardware memory protections and boot into the new kernel. As far as
I know, there is no similar global teardown command available for
the RMM.

What is the roadmap for supporting both general kexec and
more specifically kdump (panic) scenarios with CCA?

Thanks,
Alper

