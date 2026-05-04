Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFC3FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 08:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KkdObDVCfz+ZkgPAIiIOJMgQmp+rMUpIDlL/diCEWbA=; b=vcHgO8pwfAqv3hgyS3KcwX/Fpn
	6m6iD4Rxrj0WNvHJoE5xbenJw11sKLNK0HJbIbegTd3kQpGFwS3pMCppUxd4r8HAbiYy4M5SJPdtr
	g233KLKph5sguMGDIfI3XLyyKBgQ6pMlFneF3iMTELiw5uk1k8jw4PZQPzgRw+572Cw0zKS1a3MnF
	zZwLPCVUlTl/yy3DwI9PHmYc3rbqfkwsv7kXzjL+CACa4krTCk7D6XM/EYfiB6qpZGLFHHaWtPC/y
	/L+9AilduLj/sKO8vWHBvQSzQskAs+1WrdZ5jI5juoHwpp3EjB6vNs6x/KtIe9gNN36gIOE8gKT+1
	rwgsCokA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJowF-0000000CkZp-1zYD;
	Mon, 04 May 2026 08:46:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJowD-0000000CkZb-18HB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 08:46:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D412600C3;
	Mon,  4 May 2026 08:46:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41A7EC2BCB8;
	Mon,  4 May 2026 08:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777884359;
	bh=UDq1RDYaWCjStk8E4hk5OHqI0mQrjqqEAbHXWsZuKBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tplZwMxJ3opnzMO9/nHta4kU5dkZai++s1rem/crD3tBDHmVs9zdWJoovq9YvylSn
	 PvjcGT5N+0qPKjRppLZ0L2Xzd5eRyalOgTQaFngbLicRWt8fOcH+iJVb4de8tgGv7h
	 eJUdViKOpt2eX6QvP3Gi1ZWLilL8Yvm1bbK9O9Pw0aJCurmx0sw0a3HpQwQdEYF9GX
	 acBm48uI9x2HLO84oyLsnxXWQZQl0XqJFMYftEfaVDeIT8NKZK5cFpT6unIbX0NXks
	 LMvHpWDvzDkJ+dZV14vppPFKTMrjoD7F3iEI7LAiMcrMx0ZgdsEznbk6I2mROiiyek
	 kFTCRQvWzsmCg==
Date: Mon, 4 May 2026 10:45:55 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	nd <nd@arm.com>
Subject: Re: [PATCH 0/3] irqchip/gic-v5: Tidy up LPI allocation
Message-ID: <afhcw4u4413uZeUM@lpieralisi>
References: <20260430153352.3654325-1-sascha.bischoff@arm.com>
 <87cxzeayd1.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cxzeayd1.wl-maz@kernel.org>
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

On Sat, May 02, 2026 at 11:40:10AM +0100, Marc Zyngier wrote:
> Hi Sascha,
> 
> On Thu, 30 Apr 2026 16:33:58 +0100,
> Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:
> > 
> > LPIs are owned by the LPI domain, so allocating and freeing them from
> > the ITS MSI and IPI domains was always a bit backwards. Those domains
> > should only ask their parent for interrupts, and never need to
> > know how the parent picks or releases the underlying LPIs (or do it on
> > behalf of said parent, as was the case).
> > 
> > This series moves LPI allocation into the LPI domain itself and
> > removes the exported wrappers that allowed LPI allocation from elsewhere.
> > 
> > With that done, the LPI domain can also be slightly reworked to
> > support allocating and freeing more than one LPI at a time. This
> > rework is extended to the IPI allocation, too. The last patch makes
> > the ITS MSI domain request its parent interrupts as a single range,
> > matching the IPI cleanup from the previous patch.
> > 
> > As a side effect of these changes, the IPI path now unwinds earlier
> > parent allocations correctly if a later allocation fails.
> 
> Thanks for cleaning up this mess. It aligns the GICv5 host code with
> the expectations we have for hierarchical domains (don't mess with
> your parent's allocations), and will make the KVM management of
> doorbell LPIs less awkward. It also removes global helpers that always
> irked me, so:

Bah, sorry, it not only breaks the IRQ domains expectations but
the current allocation is really braindead - I was too fixated on
the IDA 1 by 1 allocation (that should really disappear asap) that
I could not see the wood for the trees.

Thank you Sascha for cleaning it up.

Reviewed-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

> Reviewed-by: Marc Zyngier <maz@kernel.org>
> 
> Thomas, could you please take th in at the earliest opportunity?
> 
> Thanks,
> 
> 	M.
> 
> -- 
> Jazz isn't dead. It just smells funny.

