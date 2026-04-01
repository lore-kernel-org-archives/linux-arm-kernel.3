Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BEF81076387
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 17:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ntr+ynnEvLdIqGGCS4gx/Lf9yJVRSYQ3K5pO0ixAGrc=; b=STw1HeavSeyP1wKnoXjWZim5SV
	YqX2OLcw1wzJnAvJ5fCyacfhDd4oBJUqeaFi6VqGURpQlfZLwQD5j+QhqZ4DGda7qtSSlrcsRV5Bw
	PL5sWOxDbYBQcuDnyWiKVKEBa3vAP0nXACNWF23VAQJv8BlS+MTrGrlR5jErPdF0+BOgzFnNK9D3K
	kiy5hc5AaRdJBF8xxnJ+b8uaD6tDYrMXNcfJ8gZxwc7+ORqKXJxUtWqi5HVhs3chRI/TQMhEn989S
	xMXOGesbEzr/yYbsDfsLXsKv13kgPKaJ9eolnRn+DBeMt+NHITC9ZOz08CvajCJ48Jg6tHG0rQ0Hh
	Mq3K5eQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7z4Y-0000000Fodb-0bpI;
	Wed, 01 Apr 2026 17:09:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7z4V-0000000Fod3-3u0t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 17:09:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E7362E99;
	Wed,  1 Apr 2026 10:09:32 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7992C3F641;
	Wed,  1 Apr 2026 10:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775063377; bh=vz3fsrkwyh2DquzkFwvcrwde1yO/DbLGn4XjzLbGysU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jcImUHujDcSUwk1p2Zaj1jON0llNZ0+Bu1JJeMQ8Qdf+wtdm9VIIbIJc2RaDnwco1
	 oA5TJFWGpsmoIdROpGftSnHk9RSClEw1Gqrc0dr5kJEGIeDpmXZeY+2q228aKVg00z
	 TycqRdqvtcukRw8VnkihHzSXLnkwHhlfihQnFq/E=
Date: Wed, 1 Apr 2026 18:09:33 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] KVM: arm64: Advertise ID_AA64PFR2_EL1.GCIE
Message-ID: <ac1RTexR1zbRBLXA@arm.com>
References: <20260401170017.369529-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401170017.369529-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_100940_011230_E3E1111D 
X-CRM114-Status: UNSURE (   8.68  )
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

On Wed, Apr 01, 2026 at 06:00:17PM +0100, Marc Zyngier wrote:
> As we are missing ID_AA64PFR2_EL1.GCIE from the kernel feature set,
> userspace cannot write ID_AA64PFR2_EL1 with GCIE set, even if we are
> on a GICv5 host.
> 
> Add the required field description.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

