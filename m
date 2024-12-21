Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B76E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 22:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=99plZstsQ2y7N4k+BZHSEU8wjYN1TzFeqMdUoCS0IB0=; b=BPvfmvttFSkJQdPAyCmONuLX/Z
	qok4oAcIYA3K6MDd2KaMMK0dNap04K0A7F/TEdiKn+KvGCun2bVJMOiPrMKWPjEtU1td/tvdN8hcR
	1hMZJflpRaFs2DGfYgsUS/FftQLK5LPJA7qO2Yb50VtHTYQ1LTGn8PxFo1UUxDQdW+554mgq0QxHJ
	8ufT/9PyJIxP+xx78YqAj3t1cvv/DbfVk7A9piBUT8pKI738bfDUCjt/+bjwnedsj16Q8QnmvPdE1
	15M5ilSP0hLOc/zFbI8ssoF6IfV46tN845pEy/wkj1IYPCX0Q5EapvRlL6hph4AkD6Za0VkjfBMiG
	ztXYS0VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP7XF-00000007Tx2-3Zt3;
	Sat, 21 Dec 2024 22:01:21 +0000
Received: from out-184.mta1.migadu.com ([95.215.58.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tP7Vm-00000007Tp2-4433
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Dec 2024 21:59:52 +0000
Date: Sat, 21 Dec 2024 13:59:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734818388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=99plZstsQ2y7N4k+BZHSEU8wjYN1TzFeqMdUoCS0IB0=;
	b=kooNmr1Hhi2lrqZmoEA/krEiUgcdJjTIFZc56jKefODAgMj+PZiEwcvtdO7V4HXqy0pFc7
	9O3HEQdbK2VtoDyI9c7zIS77Ipl/9IEdpWHWZaq0+OWG0vL4wS381d/ke9WsDWGM0i46Nk
	g7WSi1aj+A3d57DWNeIe1LzB99yei0U=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: nv: Advertise the lack of AArch32 EL0 support
Message-ID: <Z2c6TzM2i3DjtCTY@linux.dev>
References: <20241221101137.1405271-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241221101137.1405271-1-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_135951_155659_21D849E1 
X-CRM114-Status: UNSURE (   7.73  )
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

On Sat, Dec 21, 2024 at 10:11:37AM +0000, Marc Zyngier wrote:
> Although we never supported 32bit anywhere in NV, we fail to
> advertise so for EL0, probably owing to the relative lack of
> hardware supporting both NV2 and 32bit EL0.
> 
> Add some sanitising to ID_AA64PFR0_EL1.EL0, and reaffirm that
> "in 64bit-only we trust".
> 
> Reported-by: Oliver Upton <oliver.upton@linux.dev>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Thanks!

Acked-by: Oliver Upton <oliver.upton@linux.dev>

-- 
Thanks,
Oliver

