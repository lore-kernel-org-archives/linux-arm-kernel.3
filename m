Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57165D1A632
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 14:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6u8p0VpxElNFzxSbwfI3hjZ2loH0/Cg/JK1Fz9n3Eio=; b=b9u3iQRpigy29cxawcEQ//fity
	psTcQ7I5dge+xCTV26lc6v/AzMFkGgPRChII9xR2L+kMCZ0Vuw9s0zU4bByjGbWkehVT7bqlS86+x
	O6V6uDmnuMcyDuWUntaBk5fhYfBRr37It0zlKsp8XcHSYl4IlkWLSjimSqlUHfhb6iDe5kuFj4Qic
	rsHnNwhMn4zcE5yFW4na2gyxse9SDslaGa5OJQDjWDzEXkorNuoPogCGXS6fWwM81dXl5CjICM/am
	14qFdTb9wOK3XA6cI5isp4xq6nrp6UrDD7zdBixW0XxNogOsVmSg/M2yMHCwixUJ5wXWe28/f3H7+
	H4EOpMOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veDWy-00000002PjY-2OcQ;
	Fri, 09 Jan 2026 14:32:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veDWv-00000002PjC-2mOa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 14:31:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4DAFE43FDC;
	Fri,  9 Jan 2026 14:31:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5B94C19422;
	Fri,  9 Jan 2026 14:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767969117;
	bh=0OMbNmKBSAMlscTFPF8U3b40AirkRJymWHIakbWKdGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Npv1PWvfKh73fHrLyHLRxaGOSwG4aeYUBagLOYcTsqMVVvsqN/eQO9e6gUFDjHyo4
	 Le0q+UQCNpbTW74gmYPLDxkzq++Ucm5XiSkIQXtdJpvEeyhgOO5eDVy2jG0X3vzN6j
	 mwC9JqfYUil61lR5544cNKDxLmYaaYrGLmW/E1JJb0fOqFF0rAGbFwPsIk8HwjnQTg
	 UObK6pyrDrCmA9HXo2bnSLnk9b3rH8Fnxr6v/U6zTzgY40r9YkqF0KohE6z7TmD2CE
	 10eYPRSP40aJYA7BjDdZ2Lqcy8aMI97bPuxiDj58yPpa9tWt3EOXG+AS9ggSCy6Gc6
	 APLJocfJ4THdw==
Date: Fri, 9 Jan 2026 14:31:51 +0000
From: Will Deacon <will@kernel.org>
To: Quentin Perret <qperret@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 02/30] KVM: arm64: Remove redundant 'pgt' pointer checks
 from MMU notifiers
Message-ID: <aWERVxw-57pzi6ko@willie-the-truck>
References: <20260105154939.11041-1-will@kernel.org>
 <20260105154939.11041-3-will@kernel.org>
 <7g66xbfmfqf67qcowjuu725h3l33ecxhkffmlzxsjtbusk5eor@khlpkp7jdfzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7g66xbfmfqf67qcowjuu725h3l33ecxhkffmlzxsjtbusk5eor@khlpkp7jdfzr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_063157_722085_640C1741 
X-CRM114-Status: GOOD (  13.25  )
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

On Tue, Jan 06, 2026 at 02:32:12PM +0000, Quentin Perret wrote:
> On Monday 05 Jan 2026 at 15:49:10 (+0000), Will Deacon wrote:
> > The MMU notifiers are registered by kvm_init_mmu_notifier() only after
> > kvm_arch_init_vm() has returned successfully. Since the latter function
> > initialises the 'kvm->arch.mmu.pgt' pointer (and allocates the VM handle
> > when pKVM is enabled), the initialisation checks in the MMU notifiers
> > are not required.
> 
> It took me a while to remember, but I think these checks are needed for
> the free path rather than init. In particular, the doc for
> mmu_notifier_ops::release() (from which we free the pgt) says that it
> "can run concurrently with other mmu notifier" (see mmu_notifier.h), which
> is fun.
> 
> Had you considered that path? If so, probably worth expanding in the
> commit description why this is safe?


Urgh....

Let me get back to you on that :)

Will

