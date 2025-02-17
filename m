Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58507C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 18:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bcPdxFcb33s5H/lSz7aod/XVRrgxob83VusfbdiS5+k=; b=3BgwmYbOu0+3o0fjiOCB/Y62kz
	Bx+6h/E1Oy5OoLrLHgXZxlG5ebQfbAClH7Xex7vGu5MkyOHKj9tg+8o07LZlj7fBufiYwZzfq3qFS
	pqhp1Ewd3wnp0CX2sRhUr+UGZJHzv+WRO6lOQcex81EoPFfiwli1zPggP2n45VjdnToeTkN7/zM8q
	VwhJx7tBDtKRh8zvMEA+vuX4eWW8zz3gAPn8sOcpNfmxgjsA83PZV+kqPRax71WVHN32TyCuOEmCj
	PSUnv0AZ8fQ8a/VD4M8JdkBi7fTKkobCGwqpepI+5N+qfmlC8SGMM2ArDzTszfPgmJzEhFgy+d9cz
	1fy5UIgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk5xx-00000005d6E-0Aa0;
	Mon, 17 Feb 2025 18:35:37 +0000
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk5wS-00000005cv3-12Lk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 18:34:07 +0000
Date: Mon, 17 Feb 2025 10:33:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739817239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bcPdxFcb33s5H/lSz7aod/XVRrgxob83VusfbdiS5+k=;
	b=DgelPW79Bi/qWwXp7/3P5Vj+fQJ/IZumavtumu1L/V518EDxoQCZcwNRBo8LyAEPQS1mPX
	fpLGAH6kR5EF4sA2y4UDBST4dGORS2iVnxk0e28M/P+ISRXDoOpKZtu/Rnl3+1K5wX/UaI
	wj8Kkw0ZXLaFpMqpcgVmxPweidZE540=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 2/2] KVM: arm64: Contextualise the handling of PMCR_EL0.P
 writes
Message-ID: <Z7OBBUKeynOeHlS7@linux.dev>
References: <20250217112412.3963324-1-maz@kernel.org>
 <20250217112412.3963324-3-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217112412.3963324-3-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_103406_576155_15487987 
X-CRM114-Status: GOOD (  13.12  )
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

On Mon, Feb 17, 2025 at 11:24:12AM +0000, Marc Zyngier wrote:
> Contrary to what the comment says in kvm_pmu_handle_pmcr(),
> writing PMCR_EL0.P==1 has the following effects:
> 
> <quote>
> The event counters affected by this field are:
>   * All event counters in the first range.
>   * If any of the following are true, all event counters in the second
>     range:
>     - EL2 is disabled or not implemented in the current Security state.
>     - The PE is executing at EL2 or EL3.
> </quote>
> 
> where the "first range" represent the counters in the [0..HPMN-1]
> range, and the "second range" the counters in the [HPMN..MAX] range.
> 
> It so appears that writing P from EL2 should nuke all counters,
> and not just the "guest" view. Just do that, and nuke the misleading
> comment.
> 
> Reported-by: Joey Gouly <joey.gouly@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

Thanks,
Oliver

