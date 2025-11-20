Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB4BCF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 16:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+u1m6Wg2g2uAMbGGA5vDYeLsc28lnLRYCkfutXyLU8=; b=BQFXjkY5+CbxhCM7eXCVjxgPUJ
	lOjfNT4hGDjksK4lEUryaJSa4RsWbLI0oLdZ47UwHtdmhzN0DzYZekZ40i14Y1nM3SnjDSI2p17Zq
	kTX9RXnWaRdGMEiACQDapr8ItQrDtYNs+ZCZTz0TRUVaHChRbQdsPnaTiERbzrmucHqwGwNfUJILu
	LSY4g0rhFv/+EDKnV12iSFi3mkUCQgw5NA8H0x3mZ0eytKIkS+Tjp7wflPRGqDyLMNWdWDxI3Jf6G
	K2XfNc1QVALaK9/KCi+KYdQ4wxcELckOmfnB7kpmA+mBQkLArCL5LWpSwda5LfeIlGYlgNKrt2vSQ
	0+UeQ9oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7L2-00000006zMi-2jdj;
	Thu, 20 Nov 2025 16:16:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7L0-00000006zMJ-2Q61
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 16:16:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40762339;
	Thu, 20 Nov 2025 08:16:40 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B71E83F73B;
	Thu, 20 Nov 2025 08:16:46 -0800 (PST)
Date: Thu, 20 Nov 2025 16:16:44 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Yang Shi <yang@os.amperecomputing.com>, will@kernel.org, cl@gentwo.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: mm: fix direct map use over accounting
Message-ID: <aR8-7N4_ICuJW3pM@arm.com>
References: <20251119235706.1944517-1-yang@os.amperecomputing.com>
 <dc8a1580-a3ca-45dc-a82f-ab697011345c@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc8a1580-a3ca-45dc-a82f-ab697011345c@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_081650_656585_30749D16 
X-CRM114-Status: GOOD (  14.20  )
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

On Thu, Nov 20, 2025 at 03:11:21PM +0000, Ryan Roberts wrote:
> On 19/11/2025 23:57, Yang Shi wrote:
> > The create_pgd_mapping() families may be used in other paths other than
> > creating the linear map. And spliting kernel page table may be used for
> > non-linear map either. So we need check whether the address is linear
> > map address or not before accounting to direct map use. Encapsulate the
> > linear map address check in the new add/sub helpers. The new helpers are
> > nop if CONFIG_PROC_FS is not enabled.
[...]
> Overall, my opinion is that this patch is not quite cooked yet. Personally I'd
> prefer to see the first half reverted then we can wait another cycle until this
> is ready and apply it all in one go.

Thanks for the feedback Ryan. I'll revert and queue it again later once
you acked it.

-- 
Catalin

