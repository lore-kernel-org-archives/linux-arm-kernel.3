Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025DACA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 07:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sS9KBzVCPbJWJWQ0UZ0j5q0+Yoxsvx3SirUPYIS2U7w=; b=T/OIB9d1W46kRTujSDD3IOZuT+
	DzxyHxWo/pvTFsls/P+mMenVzMYLqr0YDTmJDzml9mznvjJiEftLoh6xW+wtSxU1Cf7ByIy19oiIg
	+p6RTc5wrBzHDatPodP2WuTqJiMk4NowFKYJWBQSjbanZeKmtka6eSyDFxwFLfKXUvPFtvFcaMXRf
	5ZCESvOCchffVxrDmQ2RibnG+5haa1qyty3TPFkqfiPHwxoobMeSJap3ej85Jnlj4cTitOUT/+ZtO
	jMdjZCPiOG+cp5uS3VPNlvNV6bz1WoSir22EHXmKnPgLFekP/hGWYI7Avtfk5Ji7EdXdGdO7WRKKS
	U1UHqOVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvt4V-00000005K6J-3TbS;
	Tue, 09 Sep 2025 07:47:23 +0000
Received: from out-173.mta1.migadu.com ([95.215.58.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsLX-000000050y8-2zjT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 07:00:57 +0000
Date: Tue, 9 Sep 2025 00:00:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757401253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sS9KBzVCPbJWJWQ0UZ0j5q0+Yoxsvx3SirUPYIS2U7w=;
	b=r3cdzDZcXKNh1ojPr0RNT8j7PkCqsztCRReeScRBIXigTRwrHQzCqgNV1zlusFoXRvpTUp
	bkd3wy/xGi0tFJNQXWn/bGYskpEVuq5v5jff5QslEy7u/c68ET842FIB7DAXkUmkVuxf3B
	U22VPhQz8M8BEg7jBu2ccv6ysABXPR8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Jinqian Yang <yangjinqian1@huawei.com>
Cc: yuzenghui@huawei.com, maz@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, liuyonglong@huawei.com,
	wangzhou1@hisilicon.com
Subject: Re: [PATCH v2 0/3] KVM: arm64: make EL2 feature fields writable in
 ID_AA64MMFR1_EL1
Message-ID: <aL_QjZbkvHsYIRt6@linux.dev>
References: <20250909034415.3822478-1-yangjinqian1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909034415.3822478-1-yangjinqian1@huawei.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_000055_904714_73D1DC39 
X-CRM114-Status: UNSURE (   9.01  )
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

On Tue, Sep 09, 2025 at 11:44:12AM +0800, Jinqian Yang wrote:
> Allow userspace to downgrade EL2 features (VH, TWED, HCX) to ensure VM live
> migration compatibility between hosts with varying feature support.
> 
> v1: https://lore.kernel.org/linux-arm-kernel/20250325121126.1380681-1-yangjinqian1@huawei.com/
> 
> Change Log:
> v1->v2:
>   -Added support for downgrading TWED and VH fields.
>   -Added corresponding test cases to the set_id_regs selftest.
> 
> Jinqian Yang (3):
>   KVM: arm64: Make ID_AA64MMFR1_EL1.HCX writable from userspace
>   KVM: arm64: Make ID_AA64MMFR1_EL1.TWED writable from userspace
>   KVM: arm64: Make ID_AA64MMFR1_EL1.VH writable from userspace
> 
>  arch/arm64/kvm/sys_regs.c                       | 3 ---
>  tools/testing/selftests/kvm/arm64/set_id_regs.c | 3 +++

General comment: please make do kernel and selftest changes in separate
patches.

Thanks,
Oliver

