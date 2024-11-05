Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3B4D3E778
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 22:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6UFzjbbeEdMdGk/8zVuKGqEE3W0fzh4S53TXeFLNMes=; b=WbxLZ/dbXzqcaWG8fEIjBNZbdL
	D4eHBYyrUHhAq12Z6t3K3dkMTd08humvKzA+46uVgMCqnsdGSU4mCHRlI0NNXXcuNKNAK3JmfaI0F
	9HJnSYlS1fQzMWiBvohkPIA2JtuLQ8krHQZBVWvkrkLZgfo88P3QX+MmoAof8ewmTHyNkcLJOnP8F
	c1hOg1N79K7KKcx7yUj8qAMyE9GGvKXVjceSz5G3OZm9a2iKI0d5/h86ESbi3KWPj0SJ5IW4JHJrm
	b5fyOWMW4Kkbp1ST1oFOTTxpcF0P7KDCF3c1wB/GNCUeyCtF1cxGIFGv/SPUG/o+HyqNezOphl68D
	HIa3ZYIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Rap-00000000wDc-23UV;
	Tue, 05 Nov 2024 22:00:07 +0000
Received: from out-183.mta0.migadu.com ([2001:41d0:1004:224b::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8RZ3-00000000vgO-2fAr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 21:58:19 +0000
Date: Tue, 5 Nov 2024 13:58:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730843892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6UFzjbbeEdMdGk/8zVuKGqEE3W0fzh4S53TXeFLNMes=;
	b=ofUrlJl3MqEQTDpDzSvG2BfYpHL5QiKe1pqicdzJ4Vs4qAwutZF8JdxwTSaa2Kbi/p8Uum
	vj92nC7diqkZ1hFMgVHhQ2qwLyJF14ivcp+XdahigfYyvlb+yFaZFFZFGLxCG7Ku1KeMTg
	AHM2bugexVMwqGBe8qCiRKlJC//v4/Y=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Jing Zhang <jingzhangos@google.com>
Cc: KVM <kvm@vger.kernel.org>, KVMARM <kvmarm@lists.linux.dev>,
	ARMLinux <linux-arm-kernel@lists.infradead.org>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@google.com>,
	Joey Gouly <joey.gouly@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Colton Lewis <coltonlewis@google.com>
Subject: Re: [PATCH v1 0/4] Fix a bug in VGIC ITS tables' save/restore
Message-ID: <ZyqU6-uz55xJbm1d@linux.dev>
References: <20241105193422.1094875-1-jingzhangos@google.com>
 <ZyqPMdH4anLEIq8G@linux.dev>
 <CAAdAUthd+c71BTSEvQvCZoYE2vQPHabofK=947MspU1hUbZd+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAdAUthd+c71BTSEvQvCZoYE2vQPHabofK=947MspU1hUbZd+w@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_135817_929404_EFD025AF 
X-CRM114-Status: GOOD (  17.83  )
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

On Tue, Nov 05, 2024 at 01:56:14PM -0800, Jing Zhang wrote:
> On Tue, Nov 5, 2024 at 1:33 PM Oliver Upton <oliver.upton@linux.dev> wrote:
> >
> > Hi Jing,
> >
> > On Tue, Nov 05, 2024 at 11:34:18AM -0800, Jing Zhang wrote:
> > > The core issue stems from the static linked list implementation of DTEs/ITEs,
> > > requiring a full table scan to locate the list head during restoration. This
> > > scan increases the likelihood of encountering orphaned entries.  To rectify
> > > this, the patch series introduces a dummy head to the list, enabling immediate
> > > access to the list head and bypassing the scan. This optimization not only
> > > resolves the bug but also significantly enhances restore performance,
> > > particularly in edge cases where valid entries reside at the end of the table.
> >
> > I think we need a more targeted fix (i.e. Kunkun's patch) to stop the
> > bleeding + backport it to stable.
> >
> > Then we can have a separate discussion about improving the save/restore
> > performance with your approach.
> 
> Yes, I'll respin Kunkun's patch soon. This patch series has the
> selftest which we can use for verification.

Right -- go ahead and include your selftest as part of that respin, I'd
definitely like to have some test coverage for this whole save/restore mess.

-- 
Thanks,
Oliver

