Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78779C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 16:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sWjq6pXFkdawmIxjak8O9xDSYwwcHPn9N+6mxkbF2eA=; b=YIW3vlDgaZPwhpipsQ7RSk2XAA
	NeD/vO2s1u8roQCqKmn4CsHa20V/+WbgkrfTID8Rtc5FoviIU20p+Wu4lIfGIcUjqvrpI8kTzP5kf
	zHvv2d09hQxZV2/mQAqMrVIyK8re2XzM17Ktj4sRuU5K+3nVpGqb9fwaYMeNuCyQaGcBGdN9zOodN
	1nWXGxFSGCyIjIYE2OpKKh6MHIPAljo7yuf7XaTvDiwe2zGh3cNvymoUIaa26y8mlxZLLEuZ/BteE
	PpSUA8RhGFs9ABdqPtd1DxLAeCvIZ0tp4ikYTHUkhAKUp6AbMW2+NGmzQZWHsJscol9o7BqVb9+A8
	vN+tkPgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtay-00000000Bob-1JTZ;
	Mon, 21 Jul 2025 16:42:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqwv-0000000HRAL-02r6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 13:53:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A639C153B;
	Mon, 21 Jul 2025 06:52:52 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43CA93F66E;
	Mon, 21 Jul 2025 06:52:55 -0700 (PDT)
Date: Mon, 21 Jul 2025 14:52:52 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH 1/7] arm64: Add capability denoting FEAT_RASv1p1
Message-ID: <aH5GNCKboWSYq8nS@arm.com>
References: <20250721101955.535159-1-maz@kernel.org>
 <20250721101955.535159-2-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721101955.535159-2-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_065301_086028_0DCAC8DC 
X-CRM114-Status: GOOD (  10.07  )
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

On Mon, Jul 21, 2025 at 11:19:49AM +0100, Marc Zyngier wrote:
> Detecting FEAT_RASv1p1 is rather complicated, as there are two
> ways for the architecture to advertise the same thing (always a
> delight...).
> 
> Add a capability that will advertise this in a synthetic way to
> the rest of the kernel.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

