Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D93C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 18:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fRjmSWXkgABW1qpkTdJ7gnXQ6hI9dHeWH9NqwvBbzK8=; b=GeSGfoipKSo+fiZ5Hhd/XNfoIS
	r0eHoQ0OCWmITr6fZ8uAPTmPqSF9QkEzf80WNXNCN6BEFCOw/Th2orcDESFijFM3QmGBCBDEvnjpj
	WLV0yCpW6xRX4bfH0mvQ61gtTRCiULw+pwIykRbZaDAUPFSE3v73+DcE1Wx9DnM3MMgDkBpQfd4kT
	3sQ8yyvckKARR/8/npsLWX2d8QbxtYt/GXmOJ2tehRG4xnwQWHkJ2ZmmncZ5aiDDh9lDzpRmdGPkg
	g+YFNwlYhoRRcLdkXd8W9R71MgATydYRha6iKmxorvbOqoMDCf80Fi4XocssWCbBUA0VjvK/HnRb1
	/y81uXtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thYPG-00000000thM-1EDc;
	Mon, 10 Feb 2025 18:21:18 +0000
Received: from out-185.mta0.migadu.com ([2001:41d0:1004:224b::b9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYLE-00000000slx-2B0V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 18:17:10 +0000
Date: Mon, 10 Feb 2025 10:16:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739211423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fRjmSWXkgABW1qpkTdJ7gnXQ6hI9dHeWH9NqwvBbzK8=;
	b=QeYON7ldbVu3bB34nzRPNtGJme9Q+O9wy5BEvSFH8exR89BE0xNfv9libOoqRXSWSWElJ8
	zBLYH+2vNHb8QCHhZDGgOsz6WiBWZmc9ysxca47L/Eoyu7Mi1hWi3S4kzQG8sHYoWKMaRx
	QeGUNq5yoEEPhLj8QMTucEbNpnuresM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sebastian Ott <sebott@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] KVM: arm64: writable MIDR/REVIDR
Message-ID: <Z6pCmYo3AdjDG9Di@linux.dev>
References: <20250210154953.27002-1-sebott@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210154953.27002-1-sebott@redhat.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_101708_702557_55D5F8F1 
X-CRM114-Status: UNSURE (   9.69  )
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

On Mon, Feb 10, 2025 at 04:49:49PM +0100, Sebastian Ott wrote:
> Based on prior discussion [1] this series allows VMMs to change
> MIDR/REVIDR to enable migration between machines that differ in
> these registers. Since these are used for errata handling the
> errata management series [2] is a prerequisite for this one.
> 
> Note that guest access to MIDR_EL1 is not trapped.
> 
> [1] https://lore.kernel.org/kvmarm/20250124151732.6072-1-shameerali.kolothum.thodi@huawei.com/T/#mb855bc51714095a164a7b26bb8bead1606e4b753
> [2] https://lore.kernel.org/kvmarm/20250205132222.55816-1-shameerali.kolothum.thodi@huawei.com/T/
> 
> Sebastian Ott (4):
>   KVM: arm64: Allow userspace to change MIDR_EL1
>   KVM: arm64: Allow userspace to change REVIDR_EL1
>   KVM: arm64: Allow userspace to change AIDR_EL1
>   KVM: arm64: trap guest access for REVIDR_EL1 and AIDR_EL1

Please reorganize the series such that guest accesses to REVIDR/AIDR are
trapped as soon as we allow userspace to change them. Also, can you
extend the set_id_regs selftest to assert that the guest sees the
correct value for these registers?

-- 
Thanks,
Oliver

