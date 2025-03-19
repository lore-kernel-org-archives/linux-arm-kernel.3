Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D25C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 13:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2E0klNMIZMWV5rpdbMWqkP/3DacRlL2STP6h1cyfQQ=; b=O0L7pW6UvXIIN4P+FnJOeI3rgJ
	q3INM7kAFZFHYyOB57UrJ4xzfNihJuFUuUIBINs7nKTbWCMw0m/kZbNZlaPVXsyWhNyXeJSWKyCG/
	TYwqwuYv7nmcDD4YTXPpQPP5RqLRBT4lGmhvQcxIciUayPEDuZgsdpYkaoj8xouIGmrAs3saLca2F
	StRAEF+b4Umddm3u+q4uYOwh548a9xLA9wRkiqqXYv0vLwuqmIdCYhyBWRx+PoOCN265t2kjpu1ZO
	mpx75Ix2PwbebLveEYvx9kYCmYzBifcy8p2ULwCmPIfg+mj+FTWYNL7plWDzO/rP5FAmSWPJFiv/x
	3DfHuANQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tutwh-000000098oi-0Fk8;
	Wed, 19 Mar 2025 13:58:59 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tutv0-000000098ft-3l2A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 13:57:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 346FEA488F1;
	Wed, 19 Mar 2025 13:51:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F1DEC4CEE4;
	Wed, 19 Mar 2025 13:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1742392633;
	bh=jQ1cEr/6AbNtz49EtndMJS/a0gCN5LVsu6g9KKQFAjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=psc+4RN60eKgIkfk01Oa1tQs/VmjegMBVZjtFSq6b9IDRKqtw4ZIqGWlPZxAhNtKf
	 Z3y8ChxfZjafO6QobtaPFvXcfn2CMjZMi3wGeT8Efr6UpPHeoC3ZizHPZm3kuV13q7
	 Vo4rJOeaqm3nYPa8M4rmbFQnI2BUJw0ic37STMQY=
Date: Wed, 19 Mar 2025 06:55:54 -0700
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Gavin Shan <gshan@redhat.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 6.12 8/8] KVM: arm64: Eagerly switch ZCR_EL{1,2}
Message-ID: <2025031946-myself-underling-0f4d@gregkh>
References: <20250314-stable-sve-6-12-v1-0-ddc16609d9ba@kernel.org>
 <20250314-stable-sve-6-12-v1-8-ddc16609d9ba@kernel.org>
 <019afc2d-b047-4e33-971c-7debbbaec84d@redhat.com>
 <86r02tmldh.wl-maz@kernel.org>
 <Z9qaW_H9UFqdc1bI@J2N7QTR9R3>
 <83ba4e5b-7700-4527-8376-2c60507bd0d7@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83ba4e5b-7700-4527-8376-2c60507bd0d7@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_065714_997154_26AC036E 
X-CRM114-Status: GOOD (  16.70  )
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

On Wed, Mar 19, 2025 at 01:02:30PM +0000, Mark Brown wrote:
> On Wed, Mar 19, 2025 at 10:20:11AM +0000, Mark Rutland wrote:
> > On Wed, Mar 19, 2025 at 09:15:54AM +0000, Marc Zyngier wrote:
> 
> > > The result is that this change is turning a perfectly valid HYP VA
> > > into... something. Odds are that the masking/patching will not mess up
> > > the address, but this is completely buggy anyway. In general,
> > > kern_hyp_va() is not an idempotent operation.
> 
> > IIUC today it *happens* to be idempotent, but as you say that is not
> > guaranteed to remain the case, and this is definitely a logical bug.
> 
> I think so, yes.  I suspect the idempotency confused me.
> 
> > > Greg, it may be more prudent to unstage this series from 6.12-stable
> > > until we know for sure this is the only problem.
> 
> > As above, likewise with the v6.13 version.
> 
> Yes, please unstage these.  I'll send out new versions.

All now dropped from both queues, thanks.

greg k-h

