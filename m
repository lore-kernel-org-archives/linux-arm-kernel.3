Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D51C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 20:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rhw9TvczlbAheyT06wRwF+HH2SWlYEwVk/yXlXJVQrg=; b=qgCjRL2A72YvqZ1fM1fGHz2WdE
	xdNgEo1nflxuqF8vVGYXNpV3B5sL+j3hUqVg00kz1xJcmWycrXy7zPCMfyB43f30XiwFx7Tq9JgvB
	Vj1Xx1D22gEkkjXfBVIkc3ihDkbN3eKMUIt2EPRhIjNbeCJh0m/ikc+GUFdIozioMiNlPOAp93iOB
	Tk0HwF+V4Gdq3xmCZDvJRaEzh5hTnxb/8mnSyZUTgmT7AEfxwQ32ysHeZCPK98jV/nIAiMY7gy+gB
	uHwAB4HVKD5R4t7dobo9QDCxd9OToJRhDKOQ4aQhTb8VoHLkegnQZwDHrEhF/pQjmhfxxNSZK43nq
	A4nYh+2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2c8F-00000008SIg-44zR;
	Wed, 09 Apr 2025 20:34:47 +0000
Received: from out-174.mta1.migadu.com ([95.215.58.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2c5K-00000008RbI-1PtU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 20:31:47 +0000
Date: Wed, 9 Apr 2025 13:31:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744230704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rhw9TvczlbAheyT06wRwF+HH2SWlYEwVk/yXlXJVQrg=;
	b=uEUF9c5zkX+7RdtwK/w0O4sdsZGGNmkkqqFNHLWnNPdBGMKRyxkobxWJN3Ov84aamXiiub
	f/UoLB780UMgm5YhkKcdHuhhstUPowErJDYoRvEiQeBwccAhfmDdLE7HowIbB5ltmspM5g
	U34Igxld3DjndeF0Q7H5Yo93j+CjBcA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v2 0/6] KVM: arm64: EL2 PMU handling fixes
Message-ID: <Z_bZI5GQh91Vm-6G@linux.dev>
References: <20250409160106.6445-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409160106.6445-1-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_133146_527169_655E2DFE 
X-CRM114-Status: GOOD (  16.75  )
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

On Wed, Apr 09, 2025 at 05:01:00PM +0100, Marc Zyngier wrote:
> Joey reports that some of his PMU tests do not behave quite as
> expected:
> 
> - MDCR_EL2.HPMN is set to 0 out of reset
> 
> - PMCR_EL0.P should reset all the counters when written from EL2
> 
> Oliver points out that setting PMCR_EL0.N from userspace by writing to
> the register is silly with NV, and that we need a new PMU attribute
> instead.
> 
> On top of that, I figured out that we had a number of little gotchas:
> 
> - It is possible for a guest to write an HPMN value that is out of
>   bound, and it seems valuable to limit it
> 
> - PMCR_EL0.N should be the maximum number of counters when read from
>   EL2, and MDCR_EL2.HPMN when read from EL0/EL1
> 
> - Prevent userspace from updating PMCR_EL0.N when EL2 is available
> 
> I haven't added any Cc stable, as NV is not functional upstream yet.

Similarly, I don't see a compelling reason for this to go in as a fix
for 6.15, especially since you're adding new UAPI. Do you mind grabbing
it for the next merge window?

With the comments addressed:

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

Thanks,
Oliver

