Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1EDC87FDB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 12:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uWl/3zDBRXCdqh5+iawVIJMESjqwmHAtoumjUHvK/58=; b=UedIAzxJaaWDlRcF5UYDB2vEgx
	XVFXEkVI2wB+8B9YcRKFJWCTMqpIrDLi8+Im5GzJJpZXNzxB2+axrwUPOaHabuxjkoy3N9fzCwax8
	rDN2rIWkxfBIfQcPEb4yjfw8qv4pRJmFfM4pI0VfuYH1JSquHhUsTNzWdUBPcuHmcBBPGBG0ecmxi
	tACDpru6iFk0uKn0YTGD/uwgCeW+dFvtM7bcZZ8Kz5xzkVABl7QjoiasPJsdUrOeQqUpLCH25s7yp
	YlueFNZ54xpjCvpEkZ1Bw9KvFwEpLeA4ZmKcggLKkYslXEZdCyyXv+DEQ84oTvEf7Ypfjk0gFXUs2
	c2wUWbLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulRJi-00000007arN-2eV5;
	Mon, 11 Aug 2025 12:07:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulRH6-00000007aUv-2BLI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 12:05:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 80A2D5C6326;
	Mon, 11 Aug 2025 12:05:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C21D1C4CEED;
	Mon, 11 Aug 2025 12:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754913911;
	bh=99hH0t8BmmfPSDcs9stJyBQ4nZ4aeI4XZXCgdCqeWrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AIMANRA9nU5eZ1bzDo+BC5F8pExgAUWt7KrajDRY/AfArlsWTYAm3kVSYB4fO+oq3
	 5EC7KOvhf7V2jrHa5Unb2c8DbmteD1FvX+9wgjvfFkWz3syM88CebGsT5AHd4jpeaH
	 j5kVs1/QDAIveeZOXLhJgPelFF/srTkxtKX1YmdTqjxmqMlNoMBSB5861aLmR4c4ra
	 QTYSdOKaNjrbh2xN1r0dcnyafPtKFhVvws+qT0i/1TWwPRpfyOxwSEe4/RU3oJ3l02
	 xbGnJ+JchYMsq1s4tV/q7cpUgtOperSN/quzRdsYKVhC43ax8+KCQN5bnmyw9Le3Z+
	 EIYfAKKyWIPVw==
Date: Mon, 11 Aug 2025 13:05:06 +0100
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: fanqincui <fanqincui@163.com>, catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Fanqin Cui <cuifq1@chinatelecom.cn>, hanht2@chinatelecom.cn
Subject: Re: [PATCH] arm64/module: Support for patching modules during runtime
Message-ID: <aJnccgC5E-ui2Oqo@willie-the-truck>
References: <20250807072700.348514-1-fanqincui@163.com>
 <aJXlegQfZTdimS3k@willie-the-truck>
 <3d4011c0.6aaa.198981027d7.Coremail.fanqincui@163.com>
 <86zfc68exk.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86zfc68exk.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_050512_604436_B3D719D2 
X-CRM114-Status: GOOD (  16.98  )
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

On Mon, Aug 11, 2025 at 09:01:43AM +0100, Marc Zyngier wrote:
> On Mon, 11 Aug 2025 08:37:32 +0100,
> fanqincui <fanqincui@163.com> wrote:
> > 
> > Hi will,
> > Yes, you are right. The alternative callback function lives inside the module.
> > This callback function is actually similar to kvm_update_va_mask in KVM;
> > 
> > The module's callback function calculates some values based on
> > the current CPU features and then performs the replacement.
> > 
> > The .text.alternative_cb section is actually marked as SHF_EXECINSTR | SHF_ALLOC
> > during compilation, so intersections() includes this section and sets it as executable later.
> 
> I'm worried there is a chicken-and-egg problem here. What if the
> callback itself requires patching via some other alternative? Is there
> a guarantee that this always performed in the correct order?

Maybe we should just reject loading modules that have alternative
callbacks that don't reside in the kernel text? I _think_ that should
cover all the in-tree users, although I didn't get a reply to my
question asking which module triggered this bug report.

Will

