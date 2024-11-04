Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6C1D1BDD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 18:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kp8g4+kkkKNOB0PZT8SjKsOtYzUjoUGLbVq+/H5K204=; b=UErVU3pkkrt/4GGWmPNXhOuo18
	m9d8YExanH+pxiCctQIK7tY/vDaQMNueXTDRlbUqzvG2meDYQ5D+nqW0t1+s4ssBFVLCad7xh/LHV
	yQNtK64V67mnZTdMiLBFqzzQ31dTOZsQkDMQCMJxGbaPKA/JjtS6Owz9xVewupN4v5pzu5lKXO7Mq
	+Cv0bKmCnbK510ju3ZL4WyeDnQaBHtdp2XnEawfuBwnUgLJkozOx0VZdtvU6pO6L3YZvL8EWbVavV
	V7m71wiBhafL9gZONfaF8uQB4s0Q68hsjc1ZUaOIeNYHoANrao+wgkLLd0IY6RHMpiRWWYiOo8MnG
	h8mmZhuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t81NQ-0000000EdMx-0WBJ;
	Mon, 04 Nov 2024 18:00:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t80to-0000000EXB4-3Xwb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 17:29:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7CAED5C4D4C;
	Mon,  4 Nov 2024 17:29:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 871A6C4CED0;
	Mon,  4 Nov 2024 17:29:53 +0000 (UTC)
Date: Mon, 4 Nov 2024 17:29:51 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: will@kernel.org, maz@kernel.org, mark.rutland@arm.com,
	broonie@kernel.org, linux-arm-kernel@lists.infradead.org,
	oliver.upton@linux.dev, ryan.roberts@arm.com, linuxarm@huawei.com,
	jonathan.cameron@huawei.com, shameerali.kolothum.thodi@huawei.com,
	prime.zeng@hisilicon.com, xuwei5@huawei.com,
	wangkefeng.wang@huawei.com, yangyicong@hisilicon.com
Subject: Re: [PATCH v4 4/5] arm64: Enable ARCH_HAS_NONLEAF_PMD_YOUNG
Message-ID: <ZykEj46sHcXJnd2k@arm.com>
References: <20241102104235.62560-1-yangyicong@huawei.com>
 <20241102104235.62560-5-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241102104235.62560-5-yangyicong@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_092956_949719_ADB339D1 
X-CRM114-Status: GOOD (  12.20  )
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

On Sat, Nov 02, 2024 at 06:42:34PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> With the support of FEAT_HAFT, the NONLEAF_PMD_YOUNG can be enabled
> on arm64 since the hardware is capable of updating the AF flag for
> PMD table descriptor. Since the AF bit of the table descriptor
> shares the same bit position in block descriptors, we only need
> to implement arch_has_hw_nonleaf_pmd_young() and select related
> configs. The related pmd_young test/update operations keeps the
> same with and already implemented for transparent page support.
> 
> Currently ARCH_HAS_NONLEAF_PMD_YOUNG is used to improve the
> efficiency of lru-gen aging.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

