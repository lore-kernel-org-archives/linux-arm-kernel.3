Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D599CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 16:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VEWfwup8HkaFVKYNuzYL4Zw5tlWfBk4oey4f4O/y5yw=; b=z3k6VPEppmm4j/TWy4tUvThxrb
	zpuy4SWgOzJtUCe0Pfp2r3HiWG5v/Xcko2J/Zr6+avEIGzpEt6dVYRQv8b09Ud3HO2INAxroTVvGy
	nowdAlbdkKXlTZwVYYWjtw4iaIUqciJuFqVJhVqSOa/Y0bXqBr+JMYistmaoXLnA8QgT2zUm0QTeH
	D87EvJBuVwF8pmSVk1h9CcymlU92qYDOPEnqdpN2It+O8MpoA1fuMgnASEMqIjw7w5CQ4SapFKu4Y
	INWmXvE75PDgpAGLxCv4Ixd2qp+tq6LdNUpYeMbbKPtW5EiiNeNmp/KZL2VKYs4yhTAlM8OpfreEv
	ti2/3L1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyuwY-0000000D7mv-18Q0;
	Wed, 17 Sep 2025 16:23:42 +0000
Received: from out-170.mta1.migadu.com ([2001:41d0:203:375::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyuwW-0000000D7ke-0MgH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 16:23:41 +0000
Date: Wed, 17 Sep 2025 09:23:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758126217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VEWfwup8HkaFVKYNuzYL4Zw5tlWfBk4oey4f4O/y5yw=;
	b=coS8lQSdLxDOzsi5y+YOpKTBPky/cJt2tuWoMiaNAWZnBCictOlfwr6AfiL/2Fj6Pjys0h
	uWD4+wRSlAxbv5zGYGbqt00sceWNzJN35T67JXUeSfyn9kIA3UvmaIB5PPPvSM9u+F4hOF
	tM5aAlI01f1Pxb2gIhgAdTySJxg3Ypo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, ankita@nvidia.com, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org
Subject: Re: [PATCH v1] KVM: arm64: Fix page leak in user_mem_abort()
Message-ID: <aMrgeuZur2Zd6ybX@linux.dev>
References: <20250917130737.2139403-1-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917130737.2139403-1-tabba@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_092340_395862_A0184152 
X-CRM114-Status: UNSURE (   9.88  )
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

On Wed, Sep 17, 2025 at 02:07:37PM +0100, Fuad Tabba wrote:
> The user_mem_abort() function acquires a page reference via
> __kvm_faultin_pfn() early in its execution. However, the subsequent
> checks for mismatched attributes between stage 1 and stage 2 mappings
> would return an error code directly, bypassing the corresponding page
> release.
> 
> Fix this by storing the error and releasing the unused page before
> returning the error.
> 
> Fixes: 6d674e28f642 ("KVM: arm/arm64: Properly handle faulting of device mappings")
> Fixes: 2a8dfab26677 ("KVM: arm64: Block cacheable PFNMAP mapping")
> Signed-off-by: Fuad Tabba <tabba@google.com>

Yikes, nice catch.

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

Thanks,
Oliver

