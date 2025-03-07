Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2253FC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 17:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vufpTC9BBbPqGLYl+d7UsGyfcWto745Yy6lEXcSU3ok=; b=IS3jtcK/p1DCrr8luvw53OcsXc
	LkPtjPoI42wfSpXBdT9qwwPJ3KtdHb21IBCR5rBPNl0NM+nc1tM2wagTBVUrpyS4RzUA4cv4dP/SE
	LnZ/jOphQopViA3shbKOKWS9ZVUT0D56VDI9gpv3SnGbGtBmzYUHOLyew4R5lcMiMmtVkOPPNOehp
	reMKqrDAx991kI5hCcuZfoqUWY06LrsDhi6Ra1uIMibsliR3ilK66EDR89X1lQrjVy5BWU3+opFUV
	IF+sLg4wwM1cY9wgiussBPo+q7BwrlySPrsRvWDNdS9ayXRxCiIPztiAjCokYzlrw9q1lTZgs7Lab
	e+R34Nuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqb4r-0000000EzQl-2aVh;
	Fri, 07 Mar 2025 17:01:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqb0v-0000000Eykv-2hh9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 16:57:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B6D3D5C5C93;
	Fri,  7 Mar 2025 16:55:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF1C8C4CED1;
	Fri,  7 Mar 2025 16:57:30 +0000 (UTC)
Date: Fri, 7 Mar 2025 16:57:28 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Kristina =?utf-8?Q?Mart=C5=A1enko?= <kristina.martsenko@arm.com>,
	linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Tong Tiangen <tongtiangen@huawei.com>,
	James Morse <james.morse@arm.com>
Subject: Re: [PATCH v2 2/3] arm64: mm: Handle PAN faults on uaccess CPY*
 instructions
Message-ID: <Z8sleC_1d1ozYdOO@arm.com>
References: <20250228170006.390100-1-kristina.martsenko@arm.com>
 <20250228170006.390100-3-kristina.martsenko@arm.com>
 <03dc25a3-c8a6-443b-ade7-2d3f69f2d0f4@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03dc25a3-c8a6-443b-ade7-2d3f69f2d0f4@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_085733_722297_FF4EEFEB 
X-CRM114-Status: GOOD (  11.48  )
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

On Thu, Mar 06, 2025 at 03:28:26PM +0000, Robin Murphy wrote:
> On 28/02/2025 5:00 pm, Kristina Martšenko wrote:
> > A subsequent patch will use CPY* instructions to copy between user and
> > kernel memory. Add handling for PAN faults caused by an intended kernel
> > memory access erroneously accessing user memory, in order to make it
> > easier to debug kernel bugs and to keep the same behavior as with
> > regular loads/stores.
> 
> I'd be tempted to fold the search_exception_tables() call into
> insn_may_access_user() itself, but either way,

Yeah, I think it looks better folded in. I did it locally.

> Reviewed-by: Robin Murphy <robin.murphy@arm.com>

Thanks.

-- 
Catalin

