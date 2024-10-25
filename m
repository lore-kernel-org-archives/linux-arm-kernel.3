Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D80D10399
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 01:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnRaFxFpFEv19fj1eX9QscgeHHUR4ARW9MlazyjczxY=; b=kFeU729JIlCwN6aX8X0hE4EVEO
	Di5XdXPL3uT7MHFubxF7AypggFisT0HivG5BdXTA5xDW7449+ZfTd3urocxnEBCuzMYbky+yTJ9le
	qVVbOG8yCcSW136wzRdfMJlsMBBxughD4HohN6VbQoVFcIUIPePuM1EwMqFu54KGLkOSrqw+Gh47+
	Wdxt1bZtY9ZLHHjWVkd9R4PYS05ovgAUpESNVWMhBtfo18+Oc8ozM9BU3VGTN8ShJ53JcReqxET+v
	1nhGw/LqfC6MO6WJ8WbHJxV1SzaChHMplqTzs262TjM26xF152obb7qWfDpxxIHJs1ZGtJdwNVYxK
	8vZ5Aecw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t49Hk-00000002CnW-0VCN;
	Fri, 25 Oct 2024 01:38:40 +0000
Received: from out-173.mta1.migadu.com ([95.215.58.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t49GA-00000002Cig-3uR8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 01:37:04 +0000
Date: Thu, 24 Oct 2024 18:36:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729820219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hnRaFxFpFEv19fj1eX9QscgeHHUR4ARW9MlazyjczxY=;
	b=JTrjtpcqlV3yU6F1T7SlXslRHeDK7FJG3ZJW+nuJIzSPOn7s2Z5K7EszB4bplxgstaYijk
	D7jlnmFKxDNPR4woVsGSzQuoKaAdUAikyWJn++pg7XSla0wKXj0O3p0Lw86tXYCeMWZQ73
	3HNucWiNwH6swpsivGXXcpv9J+Ls/eY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: kvmarm@lists.linux.dev, maz@kernel.org, catalin.marinas@arm.com,
	will@kernel.org, mark.rutland@arm.com, cohuck@redhat.com,
	eric.auger@redhat.com, yuzenghui@huawei.com,
	wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
	jonathan.cameron@huawei.com, anthony.jebson@huawei.com,
	linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com
Subject: Re: [RFC PATCH v2 3/3] KVM: arm64: Enable errata based on migration
 target CPUs
Message-ID: <Zxr2JMNzOWT3zPWH@linux.dev>
References: <20241024094012.29452-1-shameerali.kolothum.thodi@huawei.com>
 <20241024094012.29452-4-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024094012.29452-4-shameerali.kolothum.thodi@huawei.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_183703_391154_A2360B0C 
X-CRM114-Status: GOOD (  11.20  )
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

nitpick: shortlog shouldn't use a KVM prefix if the patch isn't touching
KVM.

On Thu, Oct 24, 2024 at 10:40:12AM +0100, Shameer Kolothum wrote:
> If the Guest has migration target CPUs set, enable all errata
> that are based on target MIDR/REVIDR.
> 
> Also make sure we call the paravirt helper to retrieve migration
> targets if any.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

I don't know if you saw my suggestion on v1 [*], but it'd be great if we
can hide the array of implementations from users of is_midr_in_range()
and friends.

There's other junk keyed off MIDR (e.g. Spectre) that also needs to be
aware of all the implementations where the VM might run. The easiest way
to do that is to stop using a caller-provided MIDR and have
is_midr_in_range() either walk the array of implementations or read
MIDR_EL1.

[*]: https://lore.kernel.org/kvmarm/ZwlbTCwoKQyh3vmF@linux.dev/

-- 
Thanks,
Oliver

