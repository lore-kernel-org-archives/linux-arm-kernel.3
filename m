Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771BDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 06:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1opG8KVKCkJTM4GDzfVHg07XwVYvSaDsnS3cERZdy7E=; b=vqsVpJpBIrz8imR9SdgczcUZY/
	A3OkwfK8RWTUHu+pBZLtbLxdOWKU408x9e1q5iP/3/pIIDuXy5NCdVBLNkTHQ2XSvxzOjVEvejE7o
	ZO8V6bZJVVlxEZHPtqe/UGog6rDqWl1tj+uCSS5v0QYZzr0xVZ5X9P4Su716S1kJpkMuxjcf7PLYl
	MP45clcTntV8IrmNTOLDNxaHZRr+Sn5czWFR84E5i0XGPQPPtCg4RwoVhQPSWcLA8X5RsahT+sECK
	AYma3Ghuze31i6/64lzYntJKGk3x1Wqpcjyo1jNCg7uZ33bWab6kjBakljSwWn6DXOU9PTLRBIwYh
	ufJhg0YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfAji-00000003dVU-3Snp;
	Thu, 02 Jul 2026 06:17:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfAji-00000003dVK-1N0M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 06:17:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9EB3360172;
	Thu,  2 Jul 2026 06:17:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2E021F000E9;
	Thu,  2 Jul 2026 06:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782973041;
	bh=1opG8KVKCkJTM4GDzfVHg07XwVYvSaDsnS3cERZdy7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JGq1OIOPdp5JvKbv9Ct4JH5C2W5v3DSnOAMEt8X8r/QJlSz9G05k39jJkjDG3BiF/
	 llHrDHXFGXRax0Er6yiKTZWCgyI3p6KZONQHurhZ4P8urH07VCMjlueXpFsOw9oOWi
	 hF7B2B6f+S488eyrgg0G9xd0djStAZePEGLEL8bI=
Date: Thu, 2 Jul 2026 08:16:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Colton Lewis <coltonlewis@google.com>
Cc: stable@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mingwei Zhang <mizhang@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] Backport ARM64 VHE boot fixes to 6.6.y
Message-ID: <2026070224-small-apprehend-b71b@gregkh>
References: <20260701204342.2654385-1-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701204342.2654385-1-coltonlewis@google.com>
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

On Wed, Jul 01, 2026 at 08:43:37PM +0000, Colton Lewis wrote:
> This series backports VHE CPU boot fixes to the 6.6.y stable branch.
> 
> These fixes are already present in the 6.12.y stable branch (and
> newer), but are missing in 6.6.y. They are required to enable booting
> L1 guests with nested virtualization enabled (kvm-arm.mode=nested).
> 
> Without these patches, a 6.6.y guest boots with HCR_EL2.E2H
> incorrectly configured (because it misses VHE-only detection or early
> initialization), causing early boot hangs/trap loops.

Why is this needed for 6.6.y?  Why not just use 6.12.y and newer for
systems that require this new feature?  What is preventing that from
happening?

thanks,

greg k-h

