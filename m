Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36018C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 16:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zYUajYEgIu0kpaRr9fhK6rfntAAkCeN1QZWeY8TpPJ8=; b=3pw6gj8S6jJ1jTCF2RJdCL3F9b
	iGoFUkherp8MxXZnkR32z5HTUgbOPyGe0iOH4arwsXrEbrOXeJFZZ7ss7zszLetpYSww4NwYgOw/L
	1YeddeLN0apNPcNhpiBd4n7a2R/2ey6NysWkYSaIlKtnu8Lbg2/ZQhkLdq0UOhwYuwcHC9wxCU4sL
	KNJ+VEcJ9pvQ8If7gXZbLbvk7JeJw5dGqGvOBkNy/curRuQBHGlsLDJCrJcFGHSOazpkLx5RCBzdQ
	/ACUFEW+Do15f2/5c64VXCB01avVIOz+KUQZw9HfWPEwQFc/S8vhPjjLS/T2XMmg/c0UNZUplfcBI
	yQQO0f1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzeh7-00000003ulq-2oqP;
	Tue, 01 Apr 2025 16:42:33 +0000
Received: from out-179.mta1.migadu.com ([2001:41d0:203:375::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzefJ-00000003uYS-1B3R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 16:40:42 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743525637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zYUajYEgIu0kpaRr9fhK6rfntAAkCeN1QZWeY8TpPJ8=;
	b=HEewnL3aSqSTJodBjO9Q/F6cT66uYFLhtAAB8L7njw3uHxAFspi49V5xwXrZuMqGnW4z+I
	lgnp74R5M5Pri28awW+Ajqb5Gxa9ENbB6S9YoDL/zLtrSlDpr6y6sw0RCU048kgYAUzI/+
	iT0iZJCaWTOjeoz6u7FWFPq6FNnL+A4=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev,
	Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH] smccc: kvm_guest: Align with DISCOVER_IMPL_CPUS ABI
Date: Tue,  1 Apr 2025 09:40:26 -0700
Message-Id: <174352555798.2753071.8481161802308155159.b4-ty@linux.dev>
In-Reply-To: <20250327163613.2516073-1-oliver.upton@linux.dev>
References: <20250327163613.2516073-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_094041_524627_3CF83F1E 
X-CRM114-Status: UNSURE (   5.98  )
X-CRM114-Notice: Please train this message.
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

On Thu, 27 Mar 2025 09:36:15 -0700, Oliver Upton wrote:
> The ABI of the hypercall requires that R2 and R3 are 0. Explicitly pass
> 0 for these parameters.
> 
> 

Applied to fixes, thanks!

[1/1] smccc: kvm_guest: Align with DISCOVER_IMPL_CPUS ABI
      https://git.kernel.org/kvmarm/kvmarm/c/acfcaf90db1f

--
Best,
Oliver

