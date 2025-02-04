Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC09C02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 23:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aty+ANBki8vd8K5qrbGPn1eFRL7U1+Ke6iGWT0ec40Y=; b=N9mCW/ekCNXeSn1WOHXkrERJLJ
	l4H0M6dg3dYHiL1Zb9vcqOQj3RwTWR5U6TZe+NGpGzSDyQyl1qN4iKErPr2c6n6eB1UQFaJaA5nCZ
	uX/jGsOUNOqdAxoHkVE3LMo+tlqxFhVE419zjsiggm2IAPhzfgE74a7LkdMglARodlR4sBFNZDhZn
	XnM5U4mXaDWHTKq6C7oKsvdhsIiNmznFAPKJVgC9KUM3DNWF3+kub80e0w4NQkfb3YdQZvyPxj32p
	ZGQADKtoFnZF8f88gKX2kw42aBxZCMQS7N6lkmIxll66s8xklHhOXxDqV/lf7jt4fgZrMC9ndQJRM
	Qlc+HOsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfSl4-00000001rsd-0tF7;
	Tue, 04 Feb 2025 23:55:10 +0000
Received: from out-175.mta1.migadu.com ([2001:41d0:203:375::af])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfSj3-00000001rgY-19TV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 23:53:06 +0000
Date: Tue, 4 Feb 2025 23:52:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738713180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Aty+ANBki8vd8K5qrbGPn1eFRL7U1+Ke6iGWT0ec40Y=;
	b=IdJQbGFcwdrAQZYo4ldhrPJfK+K3DW647JeHvI+fV3JfOpvYSaEnHJr1OK4wRok06P06C3
	1L9uJTC1ZB+KHMaiRRasHRgL1xTPYFR0u9f59apZgiEnvIMooyFJLV6qKjNXVsC90aL4PL
	73vvrkrHMQ+vqzvwvwWgjiNeollFHwM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH 1/2] perf: arm_pmuv3: Remove cyclical dependency with
 kvm_host.h
Message-ID: <Z6KoUBdmjVRuqPnU@linux.dev>
References: <20250204195708.1703531-1-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204195708.1703531-1-coltonlewis@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_155305_696076_7F17090F 
X-CRM114-Status: GOOD (  11.16  )
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

Hi Colton,

On Tue, Feb 04, 2025 at 07:57:07PM +0000, Colton Lewis wrote:
> asm/kvm_host.h includes asm/arm_pmu.h which includes perf/arm_pmuv3.h
> which includes asm/arm_pmuv3.h which includes asm/kvm_host.h This
> causes confusing compilation problems when trying to use anything in
> the chain.
> 
> Break the cycle by taking asm/kvm_host.h out of asm/arm_pmuv3.h
> because asm/kvm_host.h is huge and we only need a few functions from
> it. Move the required declarations to asm/arm_pmuv3.h.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>

Please do not move KVM namespaced functions into non-KVM headers. Having
a separate header for KVM<->PMUv3 driver interfaces is probably the
right thing to do, especially since you're going to be adding more with
partitioned PMU support.

-- 
Thanks,
Oliver

