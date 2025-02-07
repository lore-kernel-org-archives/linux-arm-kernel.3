Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50888C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 20:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vYSRH4jES0cuKpYx7kPs80Ku9bgyQ0A7OnKQUis7Fqg=; b=OSC7KiBkfDatkz1zc1GPsvvQAf
	gtu1uX59Dozasx6Fam/J4WPHfjHGIrlbPbalRBIxk8Po3oy3TY7JY8B/3zcJeVG1FT9LwWsNAb0rK
	uZ3nAQfKtwXKROnnHetEpsnGCbmc+92b969CzNc790Wl9Lg9v+Xq0aerLvHnsjF5LScBzOs9j/G7y
	HVvhsSeCBxT/KtSE8xofRxDV8M8Xckj3HOosW2IpyXtJo7w477sx3DTTYtv2SwLtN7oaU3CKPt2GN
	KksDq5ggJcUMDtlqIbcX+Kjqkbv7vNafWaYKBaSsodD8zFfHlotBckd4kdcpUGYVuGcTodvhNyxKh
	f8uIAUAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgUyl-0000000B41Q-3wRr;
	Fri, 07 Feb 2025 20:29:36 +0000
Received: from out-176.mta0.migadu.com ([91.218.175.176])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSdF-0000000Aayg-1jGf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 17:59:15 +0000
Date: Fri, 7 Feb 2025 09:58:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738951141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vYSRH4jES0cuKpYx7kPs80Ku9bgyQ0A7OnKQUis7Fqg=;
	b=Q07uWhaW/+M7sBMweEZugC689oW9CW0FZWeX3WQp2lIxURoz8o7sCaK7GD1JusohZA32Dl
	GbrXiPpNLn2hdB1+onXaXzZ3CwtWz0fpiCsPm9v5gjKvQTyoT0OSe9Bf4WYMjmUKE5xEAv
	BdlFObSAWrDbQkNu/vNhiTHnebdw/68=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Quentin Perret <qperret@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Fixes for pKVM NP-guest support
Message-ID: <Z6ZJ4LDSOG6Lr2Ba@linux.dev>
References: <20250207145438.1333475-1-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207145438.1333475-1-qperret@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_095913_878863_89DF7063 
X-CRM114-Status: GOOD (  11.48  )
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

On Fri, Feb 07, 2025 at 02:54:36PM +0000, Quentin Perret wrote:
> Hi all,
> 
> Here are two patches to deal with a race between the handling of
> permission faults and MMU notifiers with pKVM that I found by
> inspection. Specifically, pKVM gets thoroughly confused when it doesn't
> find a page mapped in its relax_perm path, while standard KVM deals
> with that trivially thanks to the -EAGAIN special case in
> user_mem_abort(). The second patch addresses the problem by simplifying
> the implementation of multiple pKVM hypercalls, which also has the nice
> side effect of improving locking by not taking the global host stage-2
> lock as much.
> 
> Patches based on 6.14-rc1, tested in qemu on on Google Pixel 6.

Looks reasonable to me, the locking improvements are certainly an added
bonus.

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

-- 
Thanks,
Oliver

