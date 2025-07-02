Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5329C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 02:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=meP0nWxBYtOmbYuZoRiD0xIcdeono4twB9y3cgBno1k=; b=KcEWrsT3aNtONQkWDGPMdXgzuV
	Ku/F1VGuJAV43Rd/jYN9W6U70YkrYte7/oqDveaeo1cYD9vJt6xL05DdZzFQuRRNtxW63z2XqQQ0L
	RCUAPXpXC+pPycJp1EmcA90Z5yVXV8vgMogLWiIcaQh9oPfAxyrmLFy8NdjXMt1MI8uYMrZ5SEZBx
	c/cYZL0C2zHqLBvcJ9lIkFgzOtDak/Yojln/3NwJ3sXcpZAgseeS6hefAQtPDJ4jJ5OI75TxROfsR
	ZlWidE3disFe5fET4JS2jeDWmQVYWiA5Qulg/NME77+QMCzJqMJbLmDXnHeoIJHNRXntnE3hu3HRM
	cLl8j/WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWnMv-0000000741s-2B4E;
	Wed, 02 Jul 2025 02:38:41 +0000
Received: from out-187.mta1.migadu.com ([2001:41d0:203:375::bb])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWnKZ-000000073lL-1g2x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 02:36:17 +0000
Date: Tue, 1 Jul 2025 19:35:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751423767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=meP0nWxBYtOmbYuZoRiD0xIcdeono4twB9y3cgBno1k=;
	b=q1ImAjnqrDXSFacojUICjv60DaxyxDUF83izasHJJbCfmo5IKh8KIPyPBFQ7+QSCe6s6Ip
	lzeHRTpz8sJyr2JRxJGZT8slerFqn1ndyddS+bN4hBZfPbRhNw7V0T/EMk2rrMEje1wLIp
	WWZ8GTWiSBhcC2NGUrzT36hIiXsaJ2k=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: Fix handling of FEAT_GTG for unimplemented
 granule sizes
Message-ID: <aGSbABNGiAaOqSo1@linux.dev>
References: <20250701142225.753984-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701142225.753984-1-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_193615_859144_02B24EE1 
X-CRM114-Status: GOOD (  13.62  )
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

On Tue, Jul 01, 2025 at 03:22:25PM +0100, Marc Zyngier wrote:
> Booting an EL2 guest on a system only supporting a subset of the
> possible page sizes leads to interesting situations.
> 
> For example, on a system that only supports 4kB and 64kB, and is
> booted with a 4kB kernel, we end-up advertising 16kB support at
> stage-2, which is pretty weird.
> 
> That's because we consider that any S2 bigger than our base granule
> is fair game, irrespective of what the HW actually supports.

While this is ugly as hell, it is _technically_ OK though right? Since
we always shadow the stage-2 MMU we can emulate the otherwise
unsupported page size.

Now, mismatched granularity at S1 and S2 is a massive can of worms we
should not entertain :)

> Add new checks that will verify that this granule size is actually
> supported before publishing it to the guest.
> 
> Fixes: e7ef6ed4583ea ("KVM: arm64: Enforce NV limits on a per-idregs basis")
> Signed-off-by: Marc Zyngier <maz@kernel.org>

It'd be good to clarify the rationale a bit further in the changelog,
but full agreement on disallowing this sort of stupidity.

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

Thanks,
Oliver

