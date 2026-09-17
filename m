Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C23BC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 07:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fUUsIlz9LXriv8XP21/YgTMJ0y++FxHtjxdNBxY79U0=; b=3wTw7rhLStTn0T3ev2NXKqhW9U
	9dWg0Eg4kXeyJFk2yAZIP5BJTaaWH7LGTL/TvAwFr1yweNLB+5e7jr02LOUrdhksbx8F/B0vpWTSW
	a5fF3/AP8j0y2LBxRbNXL1oHVzPVwMvm25PMQl3rn3VR9biQQBA8ZBoy36lUwOL6q87WyfqsX031X
	qWU3oR0BSOJUKEzFnAjmtEpVcmY8XXT5QlANxaXd5f3XWqVcjo0E1jaiUc1MekgsG1UXtmiVstQ18
	kz3wjE+rB4SnIxZXlflMWjMEzJ9jrWU+tiHOhN3ZDCAVWLGzBJjC4qHAoxFn4wP51TTwqcbqXYk9n
	M/TvnCPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x770s-0000000Ap2q-1OLl;
	Thu, 17 Sep 2026 07:58:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x770q-0000000Ap2C-0OQk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 07:58:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4F851476;
	Thu, 17 Sep 2026 00:58:26 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B1D4B3F7B4;
	Thu, 17 Sep 2026 00:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789631910; bh=RRfDq16oxGgKtBw9UeQmNtYm4ST9qaYOgq1HK0Ny8A8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f4wC/TvnWaNgPI27Dfy+Nrnm0xEIKICSS0D4shLai0nf6X//HHrkuIFoWvfQ+w1mP
	 XBlhRCgFI09l+Ayz0I9KRZNU4Uol8xNufG0CUKYMPjKpPh7zh4QZ1X3bc38dYeR9RW
	 Z7cso9/xLARHAJCe+Be3ye8vh/HNKsc1XvD/la1s=
Date: Thu, 17 Sep 2026 08:58:25 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
	will@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v18] arm64: mm: Handle Granule Protection Faults (GPFs)
Message-ID: <aqudod8kM5AjkCFY@arm.com>
References: <20260913070459.2547407-1-suzuki.poulose@arm.com>
 <aqrGPK0lFBFXL2qY@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqrGPK0lFBFXL2qY@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_005832_177719_9BB9CCCF 
X-CRM114-Status: GOOD (  10.60  )
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

On Wed, Sep 16, 2026 at 05:39:24PM +0100, Catalin Marinas wrote:
> However, can we end up delegating a non-guest_memfd memslot page as
> protected?
> 
> I played a bit with codex and it reckons it's possible if a guest_memfd
> memslot is deleted after its IPA range has been initialised with
> RIPAS=RAM. Removing the memslot unmaps and undelegates any data pages
> but leaves the RMM state as RAM. The VMM can then install an ordinary
> memslot over the same GPA range.

After some more digging, I think RIPAS becomes DESTROYED after
undelegation but it doesn't change much. A subsequent guest access to
the private IPA still exits to the host which will attempt to delegate
it again even if it's no longer guest_memfd. RIPAS remains DESTROYED but
GPT is now REALM (and potentially a valid user mapping).

-- 
Catalin

