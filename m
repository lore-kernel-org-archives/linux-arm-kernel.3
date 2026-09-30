Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1E1CA5FC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 15:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C7AATbdyF9Mta7vL2PbqQLEFeR37scIRVXVFd/v8oHk=; b=0DYfIOBswTFt68plTwKpK4eChy
	h64P2u26bybcJkETsaQVBULHiw3c7GirQAJGD768ov4wDZ1byz0r+mWzedGxeDUHlSYZ7c9Fmu9GZ
	cijyJzVy6EIMHqLm6H2nsyhpjC+OBEEWtXOcCGFWhyOm3Rkyoc7k5SWKmbJBh6oobEYYKtg56Meg+
	Rwmsv1UUWSQPk9qVV1t770hP0H86Vwrejx1U8wVy/qlmvDe2QQ/jemHO01qs/Ale6Vj93rRmPzlwF
	5TERtfUy7I+TTSm3RnPt6ICzIufjl1/rctMaeVnme0nKDP8V0M4/GGlEF5OJ5YJTAYKv8epNPRxAJ
	0B7oYYJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwbM-00000006aeY-3cr0;
	Wed, 30 Sep 2026 15:52:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwbL-00000006ae7-0zwd
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 15:52:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=C7AATbdyF9Mta7vL2PbqQLEFeR37scIRVXVFd/v8oHk=; b=aJrcP2ZSfDuniYl97mFZsG5ki+
	OJfq9oq6E+8eL7JQX12IgxBgWjeDpy9s/jFtfxVUy8f5eQy5b+G1JjsOrrfQ0WubCLfQqLW2A820O
	NSgXBYMVziABDuFRBqzoCeYNwhwe7+nQjWs9S0UjB5O1XDePc/WZHR6N9U6oenxwcugLYzAkz+2t0
	hXUtLs1MNZOMXMOP362PXlVgqwa0bDRilQ/hCXqS7YZdCMfMp+DjYWi4I2CiqwTivJxLjFXosQRwY
	rTLPk34Od9vh9FJBEQoUiGPYq0JwTqa5M51sXANv2gk0ALNLfqnRbTepM9KTtnK9kvBT0DRq002QK
	6NraXBAg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBwbI-000000041qt-0wpp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 15:52:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96D6F497;
	Wed, 30 Sep 2026 08:52:02 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 381783F86F;
	Wed, 30 Sep 2026 08:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790783526; bh=extdkEulctGCgO2FHv6ak30k/drcOE/SZVDLQoZy8hI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IEvD+ATKXF9d0sdMTwmIQ3m3lKlBJW7Iol3YRJYx4IFZW298KVvqcvV/+g9cEv7zm
	 yk3KvnDWzo7Sw8uYR7yfKzY51SINwDJW1hlhnOV5dscxRtw8KJ7Hm3dS4UYth7rGyf
	 wYB8VggKOOJZazD+/Qh8R9gYXUSG6q91BUHifJVI=
Date: Wed, 30 Sep 2026 16:51:57 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
	will@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
	sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
Subject: Re: [PATCH v20 8/9] firmware: arm_rmm: Add wrappers for Realm
 related RMI commands
Message-ID: <ar0v1lOT7OW1KkGo@arm.com>
References: <20260929221623.1342076-1-suzuki.poulose@arm.com>
 <20260929221623.1342076-9-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929221623.1342076-9-suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_165208_517738_013228C0 
X-CRM114-Status: UNSURE (   9.94  )
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

On Tue, Sep 29, 2026 at 11:16:22PM +0100, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> Introduce wrappers for the RMI functions needed for creating and
> managing realm guests. This will be used by the KVM to manage the
> Realms
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

