Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1338EC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 14:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4QiPzegzwWMimeKLYXw7eRUkiMa9v65hnQUzfy1wEmg=; b=k22RQIbIO86d54vJpz4kusoCp2
	eU+ZmL+myslCB7r/sYaWRVF/MtH9IwZrk03XY260CdL7GP5jimvTpI2rteo0O2ac/rtHu2wo8nv13
	RHX2AzUG5q16a8s8Vtiy5StZARs6IQt7JE4kPBd8xiqJILMfXu9T3BaYsaYRvwb2FMm3MuexfAAby
	S2aBhH9gwYdLcm07g01Bz7u5GFPjk7WhmYQ0c39J9bly8H4FkrQL0/o3c+LsyTJT79/Y64FfizOIq
	T0ZlJShvzEZrhcxlQZc0nSE5ykmFBL2KjvVfOGjFPgmrBS/hzeYpdh/Q30RAMuCFLcnyFtFVeNwFs
	DzUAQHaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHOGA-0000000DDn2-32kf;
	Tue, 20 May 2025 14:48:02 +0000
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHODI-0000000DDEP-2kvP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 14:45:07 +0000
Date: Tue, 20 May 2025 07:44:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747752299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4QiPzegzwWMimeKLYXw7eRUkiMa9v65hnQUzfy1wEmg=;
	b=UyGvEBG5/UE2BLq8svc7VF0cWdc8owLvSYOMEKwtxckD+IlNgvzc/UdCmRikClyfNSsr8u
	yQPtiDc2eTYnh3NDzw1PcyHoju/RZIb0K0L5SxqCVw4aJa+D6ykge+kly34aJyHQ15AFj7
	QO2/16e1e5CEBFiWcXsSEVjY6hyMBw4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: nv: Hold mmu_lock when invalidating VNCR
 SW-TLB before translating
Message-ID: <aCyVYfg3Fy3Nzluh@linux.dev>
References: <20250520144116.3667978-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520144116.3667978-1-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_074504_837608_E38B7941 
X-CRM114-Status: GOOD (  11.83  )
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

On Tue, May 20, 2025 at 03:41:16PM +0100, Marc Zyngier wrote:
> When translating a VNCR translation fault, we start by marking the
> current SW-managed TLB as invalid, so that we can populate it
> in place. This is, however, done without the mmu_lock held.
> 
> A consequence of this is that another CPU dealing with TLBI
> emulation can observe a translation still flagged as valid, but
> with invalid walk results (such as pgshift being 0). Bad things
> can result from this, such as a BUG() in pgshift_level_to_ttl().
> 
> Fix it by taking the mmu_lock for write to perform this local
> invalidation, and use invalidate_vncr() instead of open-coding
> the write to the 'valid' flag.
> 
> Fixes: 069a05e535496 ("KVM: arm64: nv: Handle VNCR_EL2-triggered faults")
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

Thanks,
Oliver

