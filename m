Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9BED62073
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 17:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZY2bvI9jRohMLC1MiiilGj8lvWI0aPVX7q2WlrGEVY=; b=xMGtYaRPTSn9OtH9WQZLVhXPCK
	GzG/RHjoF4DzwJJEsKP+0NZb/JIZi60oU1khdWALaNK76eN/T6RgGW0DNxGsHvJeza9SiWGfsvl8k
	HNh7RKRrpQGHAJ4aquj4IdDSLmt+gt0ytm9qhIPILguFmd+MI7IYcY6qLMhIvQSeigASNsmb1qfgP
	AQO7gzr8jXb4zHe9uDLodiM/ZMZUXDM8THH8LX6G00aH2g41WAT6J3k7AcEz642vs9YdFWhfB/lIb
	l3NTV050H6+guF51AO75Q25r7n8DbBaygiCDJnWyA7KSwdQHpIv4C8N4xmjbm18uk2qdX6+WZrjuD
	vPUF/cCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDRgx-0000000DA3n-323d;
	Tue, 19 Nov 2024 17:07:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDRWJ-0000000D7YG-0r7Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 16:56:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732035366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eZY2bvI9jRohMLC1MiiilGj8lvWI0aPVX7q2WlrGEVY=;
	b=JAYzuLvLouICid0OEEq6ylo2kztkPKFph/DQTbEdvQ0h+kQIgaIkK57BpObjCJQ18OAkLG
	v4zNlV4K3KWF/bewidw0+2K7PFeegYea8fGTN1U8yhs1mTblkTnHAa22k3dH4fpjHIZm0l
	DF3oSXXSqKA/+JX01z026dgLVbTWf48=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-308-Von8AFHlPcutkbqohtcFAg-1; Tue,
 19 Nov 2024 11:56:00 -0500
X-MC-Unique: Von8AFHlPcutkbqohtcFAg-1
X-Mimecast-MFC-AGG-ID: Von8AFHlPcutkbqohtcFAg
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0E7A419560AD;
	Tue, 19 Nov 2024 16:55:58 +0000 (UTC)
Received: from localhost (unknown [10.22.89.254])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 933AB1956086;
	Tue, 19 Nov 2024 16:55:56 +0000 (UTC)
Date: Tue, 19 Nov 2024 13:55:55 -0300
From: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH] iommu/tegra241-cmdqv: do not call smp_processor_id in
 preemptible context
Message-ID: <ZzzDG6FFprnWPnCj@uudg.org>
References: <ZzvZkMKhwmJESpdM@uudg.org>
 <20241119071510.-6OKEw2q@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119071510.-6OKEw2q@linutronix.de>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_085607_318418_022092A0 
X-CRM114-Status: GOOD (  16.81  )
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

On Tue, Nov 19, 2024 at 08:15:10AM +0100, Sebastian Andrzej Siewior wrote:
> On 2024-11-18 21:19:28 [-0300], Luis Claudio R. Goncalves wrote:
> > With PREEMPT_RT enabled some of the calls to tegra241_cmdqv_get_cmdq()
> > during boot will happen in preemptible context. As this function calls
> > smp_processor_id(), these calls will trigger a "BUG: using smp_processor_id()
> > in preemptible" backtrace if DEBUG_PREEMPT is enabled.
> 
> If this is only on PREEMPT_RT, where is the disabled preemption coming
> from on !PREEMPT_RT?

You are correct. This is not exclusive to PREEMPT_RT, also happens with the
stock kernel. I ran more tests and this time I made sure DEBUG_PREEMPT was
enabled. That was enough to reproduce the problem.
 
> > As tegra241_cmdqv_get_cmdq() only calls smp_processor_id() to use the
> > CPU number as a factor to balance out traffic on cmdq usage, it is safe
> > to use raw_smp_processor_id() here.
> > 
> > Signed-off-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
> 
> Sebastian
> 
---end quoted text---


