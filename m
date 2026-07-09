Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4DAC4450E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 10:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7nsBHNVIQVZbYkzx7KdDVKz/MtmlkTEepzSpfYyIVrI=; b=R/8ZuDXs0+r+MWt+KxBktWcdjP
	q6ypnQn7fHFvF4zF6v/FOmrHLVc/QAhpWuUusOLzGXBL4IWEF3lTTEiavZPv/MXBem0hnRrDMjYIM
	5Ok/O9sbJpAFhHRD/9UrUSR1xEURv98cbERpRp7g34hMqfY8XOWsYvd9nZoztkgeiORL3T7u7MD45
	dOF/PXMClHTWmkHmlq8UXFtGPqyMDpQ+v097txbLyBG1+bK/9vAmbSOakq1UWzDJ0r3M351w1QQjx
	gql7aT1gaa+B18PuT9oQUvaUgszuzh8ylPV/pGiQWUMwLFnTdGljgBj56+tbCRyHH+SU7G2pHHSzf
	MnFnTcSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkkX-00000001icE-45HZ;
	Thu, 09 Jul 2026 09:08:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkkW-00000001ibW-0UVh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 09:08:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B4B81576;
	Thu,  9 Jul 2026 02:08:47 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 106623F66F;
	Thu,  9 Jul 2026 02:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783588131; bh=SV1/XuJVttcdURgfYqN6D9cGLM3k9+St8zA3RzUWM/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lo3K+U9KBDTKhfsXwCJl2A75y5i5oxTrK03ZJl4oirFkv+koqFEwc0cEPV7TOaFiN
	 uY2gpy/C/kxATW59cvY8nyXZzj94wMf3rIQ/PoSL6Ritom80ikAVCMbJpQ6oRU8wcF
	 DZ624beIlqYifjewXtCmQlrv/JkwyEA+XqXL/oHU=
Date: Thu, 9 Jul 2026 10:08:47 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, will@kernel.org, rppt@kernel.org,
	maz@kernel.org, aneesh.kumar@kernel.org
Subject: Re: [PATCH 2/3] drivers/virt: pkvm: Fix end calculation in
 mmio_guard_ioremap_hook()
Message-ID: <ak9lH3TJst_SBx9I@arm.com>
References: <20260603110522.3331819-1-smostafa@google.com>
 <20260603110522.3331819-3-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603110522.3331819-3-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_020852_192643_2E6E68D2 
X-CRM114-Status: UNSURE (   8.69  )
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

On Wed, Jun 03, 2026 at 11:05:21AM +0000, Mostafa Saleh wrote:
> Sashiko (locally) reports a logical issues in mmio_guard_ioremap_hook()
> 
> mmio_guard_ioremap_hook() attempts to handle unaligned addresses and
> sizes. However, aligning the start address before adding the size, might
> shift the end to the page before.
> 
> Fixes: 0f1269495800 ("drivers/virt: pkvm: Intercept ioremap using pKVM MMIO_GUARD hypercall")
> Signed-off-by: Mostafa Saleh <smostafa@google.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

