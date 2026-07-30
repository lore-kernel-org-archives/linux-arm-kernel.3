Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B79C54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 03:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B3m6klE7M6GPyf33UUyOsEdcuYBciPrJm1ED2GD56QU=; b=LlgCd7uqON+fWLlAd45WeFtDjG
	RyzImmOuyOH5xAIVF9v5FY4hftR1E2gjEkybHs3iXTfhbM+rkGHN6jjjxdHQsLxnWRQbUeZTLujKF
	TuWwrM08R/mkHhNohF0s8wYjJqGOQJAx5A7mc/72D/q406Ks0HtBGDXbtWYmHS0hikWUrNP4p6Lco
	v8sxKIXYNK+OOq/J8dDQPwIyHseQYN66iomvDRCtBaqS28fRke+pwXdKJ1V4RqQO/WdT7u0hA7Jb3
	/TrVX60NTkZOLPA9v9H0Ds6vopu8ohIbGgZOPvarS6BRMLBW90tcRz8ZoKBMsEjP7DiWa0FriPulD
	QLE2nGIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpHM7-00000009PNk-0gJj;
	Thu, 30 Jul 2026 03:22:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpHM4-00000009PMq-0EBe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 03:22:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7E891684;
	Wed, 29 Jul 2026 20:22:36 -0700 (PDT)
Received: from localhost (a079125.arm.com [10.164.21.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 451723F763;
	Wed, 29 Jul 2026 20:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785381761; bh=/1yTzYFGg3pV1usAbAUtPbtP+HA7uKNwPQmps+iLHVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WC5qUcaNXp7YRQUQva+KqAzlEwiNFkhj7vRPDnylSaQJ9cC9iMAcGpdkb6rq9cNiF
	 /OjqhnNkYflxnuK1FVgGTmKpcdsMQAvdg00NrAI4KnmgAfYsOjtXjolU8Rma8WQzmS
	 BYW4vmCoGUyIU7evJ61g8aN7ThcGiL3Myb5xUHL4=
Date: Thu, 30 Jul 2026 08:52:37 +0530
From: Linu Cherian <linu.cherian@arm.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	oupton@kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, vdonnefort@google.com,
	tabba@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [RFC PATCH v2 0/2] KVM: arm64: Add support for BBM level 3
Message-ID: <amrDfR-6q3xAAkTq@a079125.arm.com>
References: <20260723182140.4025575-1-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723182140.4025575-1-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_202244_201867_8EB5F63E 
X-CRM114-Status: GOOD (  15.38  )
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

Hi,

On Thu, Jul 23, 2026 at 06:21:38PM +0000, Mostafa Saleh wrote:
> This patch series adds support for BBM level 3 to KVM pgtable, it
> depends on [1]
> 
> Changes from v1:
> https://lore.kernel.org/all/20260717130901.2239134-1-smostafa@google.com/
> - Limit BBML3 to systems with FWB and DIC and remove race check.
> 
> Motivation
> ==========
> I have been looking into this for the context of:
> - Page table sharing between the host CPU stage-2 and the SMMUv3 for
>   protected KVM.
> - Use the pagtable code to populate SMMUv3 stage-2 shadowed
>   page table [2]
> 
> However, BBM level 3 is still useful for CPU only operations as it
> avoids intermediately breaking translation.
> 
> Design
> ======
> Some of the conditions that BBM level 3 will be useful in (RWHZWS):
> 1) A change to a PTE memory type, shareability, cacheability or OA

Could you please clarify how BBM level 3 is helping this particular scenario ?
This is supposed to be a case where break before make is required.

Thanks,
Linu Cherian.
 

