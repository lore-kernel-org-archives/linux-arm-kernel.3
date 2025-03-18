Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E3FC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 11:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IDhWgcdzgBWxafvqLjeV/zQG+l6/L8759hzkKpQS9YM=; b=sdAtSpeExsIKrfAPM4s3K7gCuq
	grGgB0sUT/1mWweeBWrXDKIz5Mi3O2/406JDKWfwfb7EEFHcaIs+XKjgHQOvIhnzL8J+1k0qrCPZZ
	gmVhTYaZhz84y+9r25LftxCg+cBrmP55HtVSjPrnk3QFKT9tCVOC2fKUjxXtHAvIRpZHlSk+ipV75
	EfwC401OBHkOmdq9bSo3/Zfp9LV+VoO4gWzI2sfjAL0VtFJHpVZwGdJu/3AQloX8Mu0FXQeuXPhJO
	gDLPTiH+Y2X+3lHKmb2pOW0pwHHkSFUqctKCrEDj79vemwWG8EOrfJJEIaEbGJ7m5a5rtBwQtKe6f
	/Kk2pFTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuV56-00000005ikl-47Rz;
	Tue, 18 Mar 2025 11:26:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuV3P-00000005iVe-1pf6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 11:24:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B0C855C571F;
	Tue, 18 Mar 2025 11:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5BF6C4CEDD;
	Tue, 18 Mar 2025 11:24:12 +0000 (UTC)
Date: Tue, 18 Mar 2025 11:24:10 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>, joey.gouly@arm.com,
	kvmarm@lists.linux.dev, maz@kernel.org, suzuki.poulose@arm.com,
	yuzenghui@huawei.com
Subject: Re: [PATCH 0/4] arm64: mitigate CVE-2024-7881 in the absence of
 firmware mitigation
Message-ID: <Z9lX2juZYCq_cnZs@arm.com>
References: <20250128155428.210645-1-mark.rutland@arm.com>
 <174197730164.734861.6726211221092480832.b4-ty@arm.com>
 <20250317212611.GA12724@willie-the-truck>
 <Z9ikak5AOtDJNVgE@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9ikak5AOtDJNVgE@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_042415_528429_F311E057 
X-CRM114-Status: GOOD (  21.72  )
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

On Mon, Mar 17, 2025 at 03:38:34PM -0700, Oliver Upton wrote:
> On Mon, Mar 17, 2025 at 09:26:12PM +0000, Will Deacon wrote:
> > On Fri, Mar 14, 2025 at 06:37:25PM +0000, Catalin Marinas wrote:
> > > On Tue, 28 Jan 2025 15:54:24 +0000, Mark Rutland wrote:
> > > > On some CPUs from Arm Ltd, it is possible for unprivileged code to cause
> > > > a hardware prefetcher to form an address using the contents of a memory
> > > > location which is accessible by privileged accesses in the active
> > > > translation regime, potentially leaking the contents of this memory
> > > > location via a side channel. This has been assigned CVE-2024-7881:
> > > > 
> > > >   https://developer.arm.com/Arm%20Security%20Center/Arm%20CPU%20Vulnerability%20CVE-2024-7881
> > > > 
> > > > [...]
> > > 
> > > Applied to arm64 (for-next/leaky-prefetcher), thanks!
> > > 
> > > There hasn't been much review (thanks Oliver for looking at the KVM
> > > bits) and there's some implied work that can go on top of this series.
> > > But the patches looked fine to me, so I queued them. Mark or others,
> > > please shout if you'd like them dropped, they are on a branch.
> > 
> > I'm really not comfortable with this series and would prefer to see it
> > dropped while we continue the discussion, especially as it's causing
> > minor conflicts with the KVM/arm64 tree in -next.
> 
> Catalin, unless you say otherwise, I'm going to assume this will be
> dropped in the interim.

Yes, I just dropped it.

-- 
Catalin

