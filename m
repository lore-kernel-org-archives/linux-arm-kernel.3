Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE619D74961
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 04:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EtDw6vWJIIC3gJtRYGxss7dFOHsmI80k8IdsIMFE7QA=; b=CvXSE7+AwuiCO2p0XhSq5XpwsL
	j7biyJEFq5fpOj/Qqo0yRaNJ/UswIlc9KZLZz/TSGEtthQ/IF1Q057TEgp0p84hgglbTCVDiw2loY
	ilKtLmX5xia2ynErg2Y44JrGFBD3WYXrbUlhUeqOn2Xdat4nrPh8g/RNQOS8RKD02cgKsq1lC0Arx
	PKOkqIJ/jmxSrH2iwucr8YudDiKouCwhKsUHZIjGf2wgjA6nYgH9U5YZHFoUnJkimj6onu6BEwp7M
	6qjHFju9U13H3cowWd7a0ahx2NXfy3pZ6CfIBHeijgvpNLFA20oxyrkuBACv+mhMadkBhdxwOPgn2
	BceGyI6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t60Rt-0000000GgSV-26tu;
	Wed, 30 Oct 2024 04:36:49 +0000
Received: from out-176.mta0.migadu.com ([2001:41d0:1004:224b::b0])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t60Oq-0000000Gg2V-12g4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 04:33:42 +0000
Date: Tue, 29 Oct 2024 21:33:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730262814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EtDw6vWJIIC3gJtRYGxss7dFOHsmI80k8IdsIMFE7QA=;
	b=I0Kvuc9+ckIDmK+mwbhgcipc+bnKkkO7Hjh0aDrfZHMDtSzAg1EJwnzXJ740zoLli84GEo
	hGJgagWNyszpE1TZS+XUSQuq33DAMIurCnnxbniJx8d/0tOBiJkhI+wNHSpVkqx4559v69
	n8Qr42y/l61lHHbUECsQqtKXRzdQxyE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Cc: "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"maz@kernel.org" <maz@kernel.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	yuzenghui <yuzenghui@huawei.com>,
	"Wangzhou (B)" <wangzhou1@hisilicon.com>,
	jiangkunkun <jiangkunkun@huawei.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Anthony Jebson <anthony.jebson@huawei.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Linuxarm <linuxarm@huawei.com>
Subject: Re: [RFC PATCH v2 3/3] KVM: arm64: Enable errata based on migration
 target CPUs
Message-ID: <ZyG3FiUiyOi4t3rQ@linux.dev>
References: <20241024094012.29452-1-shameerali.kolothum.thodi@huawei.com>
 <20241024094012.29452-4-shameerali.kolothum.thodi@huawei.com>
 <Zxr2JMNzOWT3zPWH@linux.dev>
 <0a23971725644a9bbfe7ec60b5e05033@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a23971725644a9bbfe7ec60b5e05033@huawei.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_213340_964663_0D91A843 
X-CRM114-Status: GOOD (  22.54  )
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

Hey Shameer,

On Mon, Oct 28, 2024 at 05:29:14PM +0000, Shameerali Kolothum Thodi wrote:
> > I don't know if you saw my suggestion on v1 [*], but it'd be great if we
> > can hide the array of implementations from users of is_midr_in_range()
> > and friends.
> 
> I did see your suggestion but my bad,  misunderstood it and thought that you are
> referring to _midr_range() functions in cpu_errata.c only.

Ah, no worries. And yeah, for this to be a general solution we're going
to need to cover all our bases where MIDR checks are used.

> > There's other junk keyed off MIDR (e.g. Spectre) that also needs to be
> > aware of all the implementations where the VM might run. The easiest way
> > to do that is to stop using a caller-provided MIDR and have
> > is_midr_in_range() either walk the array of implementations or read
> > MIDR_EL1.
> 
> So the suggestion is to use something like this?
> 
> bool is_midr_in_range(struct midr_range const *range)
> {
>         int i;
> 
>         for (i = 0; i < errata_migrn_target_num; i++) {
>                 if (midr_is_cpu_model_range(errata_migrn_target_cpus[i].midr,
>                                             range->model,
>                                             range->rv_min, range->rv_max))
>                         return true;
>         }
> 
>         return midr_is_cpu_model_range(read_cpuid_id(), range->model,
>                                        range->rv_min, range->rv_max);
> }

Yep, pretty much like that. Except that the guest should either use the
values from the hypercall *or* the value of MIDR_EL1, not both.

> Or do we need some kind of hint to these functions to specify which 
> MIDR to use? I think there are at least couple of places where it looks like
> it make sense to do the checking against MIDR_EL1 only.
> (eg: has_neoverse_n1_erratum_1542419().

I don't think we need a hint or anything. The fact that the hypervisor
is exposing this hypercall interface indicates the MIDR of the
implementation the vCPU currently runs on is subject to change.

So the concept of a per-CPU erratum is completely out of the window, and
every CPU is subject to the errata of every implementation advertised by
the hypervisor.

-- 
Thanks,
Oliver

