Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A5FE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 21:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A/2TdX/pJ5Tnhay1CknlqlFO2T3FDSPjhcjBairvzfI=; b=TZ1bkRCFBvE3ixXIB7wTL7ppM9
	NIsI9hObtskXu+60br+EUvhu+/AJX6dRXKhq2+Ly2vcZXIZ67TdDf6wuhXsxB+IhS4IbyLiRW7Xvx
	A33ey4sxY8oWl16ohh+7DD0PS/gq0uWDiL4Z2lVrbMF8RHk65fb+o4ugitDLJ56YlgPmbR2ytRK9K
	/48vCrUYsyHill4dw4dQHUEc1cUG32fhaDje8CFHDVVaKKlngZW8t0Rxx6jUxM+A0foo6AIttTXuE
	071aQT23IV/OLQRkEV1fNqZLfuhDHMFdUu8bEK0dMUdtrNCRvMSU7BvANFJMju5vCKo2UAqDG1Wu3
	RVP+R/Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO1du-000000008jN-3xIp;
	Wed, 18 Dec 2024 21:31:43 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO1cn-000000008XN-3Nzq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 21:30:35 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734557429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A/2TdX/pJ5Tnhay1CknlqlFO2T3FDSPjhcjBairvzfI=;
	b=feW9Bw55jjom3zz35m58gW0P+mJt2O2OhcupsO7788pLdJTlTnO4LY+JCLgqQ9IqZopmpQ
	wSf75FAs/8VH+zNUvDOjTD9dmLO6ayJnlOR6/A6TONx/anvSZdGGWfboqf5susGCJ1f+qC
	GAny5CXGpuUJ6lldtzGSQOqhK/mbBfE=
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Always check the state from hyp_ack_unshare()
Date: Wed, 18 Dec 2024 13:30:15 -0800
Message-Id: <173455738564.3742443.9773591453026966218.b4-ty@linux.dev>
In-Reply-To: <20241128154406.602875-1-qperret@google.com>
References: <20241128154406.602875-1-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_133034_184386_6447C45E 
X-CRM114-Status: GOOD (  12.03  )
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

On Thu, 28 Nov 2024 15:44:06 +0000, Quentin Perret wrote:
> There are multiple pKVM memory transitions where the state of a page is
> not cross-checked from the completer's PoV for performance reasons.
> For example, if a page is PKVM_PAGE_OWNED from the initiator's PoV,
> we should be guaranteed by construction that it is PKVM_NOPAGE for
> everybody else, hence allowing us to save a page-table lookup.
> 
> When it was introduced, hyp_ack_unshare() followed that logic and bailed
> out without checking the PKVM_PAGE_SHARED_BORROWED state in the
> hypervisor's stage-1. This was correct as we could safely assume that
> all host-initiated shares were directed at the hypervisor at the time.
> But with the introduction of other types of shares (e.g. for FF-A or
> non-protected guests), it is now very much required to cross check this
> state to prevent the host from running __pkvm_host_unshare_hyp() on a
> page shared with TZ or a non-protected guest.
> 
> [...]

Sorry for letting this one slip.

Applied to fixes, thanks!

[1/1] KVM: arm64: Always check the state from hyp_ack_unshare()
      https://git.kernel.org/kvmarm/kvmarm/c/985bb51f17ab

--
Best,
Oliver

