Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC2AC79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 09:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qpvEwZQZxhTh2+qj5/551diFHgIHsY+uTFIFCnSzP9U=; b=t0VnEa+n2k/b7MflA66zHleRob
	efzHG3GagGJ/YeM26VIhluxswMMXlziFfqlxY2dxnJOWK1GnUcadRXHcEFzf3ksVcxtL55q7M/JsT
	/NPABbGzqo9sMV4zWnFFlh43JQDbBI6SvRf7WAIr9pZpjlYvXrtZ9VErXdYlQPNMNWUD0swDP5ZEJ
	9hiZ12Q56rurlCCX2wCJIZRJ2Vs+Oj4qHaS2pIqce3ut+42WSvVCoAaPlJ5moPlmQDanUQYqnF/QG
	G+c05E28EMG8EAgew3lj0kq6/gV17pIgjAz2S6V9t6McjRvo0aNPukU0scZpLddaiDTGWWsZo7IIH
	zJiTQMFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4EUE-0000000BGzZ-1dLW;
	Wed, 09 Sep 2026 09:20:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4EUC-0000000BGzR-2ecz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 09:20:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F6CF43B21;
	Wed,  9 Sep 2026 09:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26A221F00A3D;
	Wed,  9 Sep 2026 09:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788945655;
	bh=qpvEwZQZxhTh2+qj5/551diFHgIHsY+uTFIFCnSzP9U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ZbZbV8qxzD5Lru67QXlKy5R7bfi5m/YE53ES93yAAK93zSesNfvdndAA2+zWe59rq
	 FgMJFB1XlNMASSyV+yad89jsRvb5gW/fUTilSAwbSHwMgraNaLSfb0I9+C6kIlxjXU
	 Yh5BYW+CbLWXit5j/pwmMiJf8096X+ImS8sQk/OVmuPRMDJ+j6dCzOpJ+aB2PxxvY0
	 +r6m9KjaAhmcxVhzniI/hGGAAOET/9zHyZDjRknZKRvlb8+knmu87v3bsLT//j1VJN
	 bADEfJQtZLnRweow1MY36LJt2CAZoelZFdGdIUufsFkot7P3/7oLRuDvGdgUJX+44W
	 igmDAtMKphXFQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Pranjal Shrivastava <praan@google.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>, Joerg Roedel
 <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe
 <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, Nicolin Chen
 <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, Ashish
 Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, Danilo
 Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, Jason Gunthorpe
 <jgg@nvidia.com>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v10 07/15] platform-msi: Introduce
 platform_device_msi_rewrite()
In-Reply-To: <aqBs1Rzz_i1N7756@google.com>
References: <20260908171712.356645-1-praan@google.com>
 <20260908171712.356645-8-praan@google.com> <87se3j1qgu.ffs@fw13>
 <aqBs1Rzz_i1N7756@google.com>
Date: Wed, 09 Sep 2026 11:20:52 +0200
Message-ID: <87bja6232j.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, Sep 08 2026 at 20:15, Pranjal Shrivastava wrote:
> On Tue, Sep 08, 2026 at 09:40:49PM +0200, Thomas Gleixner wrote:
>> So this all can be solved at the device domain level without sprinkling
>> per interrupt invocations including conditionals all over the place.
>> 
> Ack. I was wondering if the irq core should also cache the message for
> platform MSIs like it's done for PCI ? Would that be a bad idea? Or is
> it this way by design? (I'm having to cache the msg in the iommu driver
> atm).

Sure. This can be done in irq_chip_write_msi_msg() before invoking the
chip callback. That makes the PCI caching redundant, but it can't be
removed because of other historical layering violations in that
context. So adding it to the core requires to add a comment why this has
to stay in the PCI write function.


