Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5295A606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 12:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dfKIPm26;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=jbF7EyAV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CH7v1QYtuAIpGEme7SIV7J6uwrhadxjJXEqMvW5h55w=; b=dfKIPm26iRj6dQ
	cZgHtEg05VRiNyOf1XodNvpweg15dP+ZN93uNtxNzD4isbX3mRMKbzOQk9AIEzQoJIalh4QTiLj5+
	v3Dh95mzZbM57ZGUzUUtp+NR1PlerVTMZ2Y5Ys2qWQSqkE5ge/nEv2p6UjGXpBfnSnCi9W0qkae/E
	4hoNwxMa4JKhHQ50+A3gMKWY6dOdUOVz8hRizEkDiuA9irKx1XdCnAORv2pIHjnEkwPgtVuLh1YBv
	0fFDJPzrx7r9uKEEZ41S9UeFCsOCQvoSEZsCOulYfzQz5WZcoxxRPGTNhAnLGPFS3M7HvDTI3Lnwv
	UkFXl9g9+Sx6MREqstsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODXt-00000002MTN-1YfR;
	Tue, 03 Nov 2026 12:23:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODXp-00000002MRk-0fTa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 12:23:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B14C11691;
	Tue,  3 Nov 2026 04:23:12 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.89.242])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9908A3F628;
	Tue,  3 Nov 2026 04:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793708595; bh=S9BO58FYCbI1LYWmEmCYU6CXvki/lX9LlFi6yxqpDiQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jbF7EyAVJr6fqxqz3iev/lFhjI3sfdc7S6aXSUt7cdtglJ+kZYzv6Q5RRAstaWy6Y
	 PzukBrOhCYmQ0pZ7NlUgtLLrf94rKEQ5vJbIynQu5WOg9ECOoVO0CqbipqSwnGtQW6
	 QHs/dicXZGDzUYwV4lfuPBNTKekGnyifxq2zjguM=
Message-ID: <6fd6dee4-7bf9-4fd1-9ad5-43e262dc6f32@arm.com>
Date: Tue, 3 Nov 2026 12:23:12 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: arm_mpam: plans for the SMMU integration series?
To: Ping Li <leeonion.muyu@gmail.com>, james.morse@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 andre.przywara@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com
References: <20261103121534.532108-1-leeonion.muyu@gmail.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261103121534.532108-1-leeonion.muyu@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_042317_246018_40358930 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ping,

On 03/11/2026 12:15, Ping Li wrote:
> Hi James, Ben,
> 
> I have recently been debugging SMMU MPAM support, and noticed the
> series James has on the mpam/snapshot+extras/v6.18-rc1 branch. Is
> there a plan to merge it upstream?

There is interest in getting SMMU for MPAM and more generally IOMMU and
device requestor in resctrl but I don't know if anyone is actively
working on that at the moment. The latest thread on this topic can be
found at:

https://lore.kernel.org/lkml/arKx__kOPe4B5gDW@agluck-desk3/

Thanks,

Ben

> 
> Thanks,
> Ping


