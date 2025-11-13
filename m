Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B735CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 21:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oKdcUxBbgoEuFmbObo7PNGGWqqEYEVRcGhIxFU91GJA=; b=oBjzhQiFln6KrB8L5QOQgLAmFW
	oEtShjkgS6yRbQWlLuNePrLE4PWkupZJa/7EDAVP3sYvAMbDb46dRENxVyXVVFAgEl1lnK5iE9IZB
	ul3PhzeZDSUvO3ymbrWSEohLP62lv0UOqvKfl47yLsMEmZNRbhCIMqRmeXVxO1TVBK059Z2HeSKkI
	wJzNGOv3QYKjEc6U5cS1pAHgzLOPznbv4WFY7DXTWHARGqI9+lAupNBkbgZV1oNSqYJjipdWekerf
	KHg3S50irSN3bV3gfTzwUhF3ALhBsJkNlxjTPlCw7UDWhS6R13I5ixWaSJNlNsHYhK6/Hf4WxlKft
	k6hDSGVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJeWm-0000000B6tR-2Grv;
	Thu, 13 Nov 2025 21:06:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJeWl-0000000B6t8-2SyU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 21:06:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9511060126;
	Thu, 13 Nov 2025 21:06:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3D99C16AAE;
	Thu, 13 Nov 2025 21:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763068006;
	bh=IC4VpM6ZN4n39UtKfc2C/9ZDlOpdPQkYd/6hCrS82gc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OjYnTKJ/stoU+JDIoC3n2v+tPgNx/vKxfRWf/HLoAlV5nbyLzTu3Ft8Fvny0t11N6
	 QMA8MUkfHE+tj4p6jJ7b633oqS+hKmhvAFLG3eeT++DIUO73t7L8dCzgIitVFGXwPx
	 vKgeQKWtb+KRhIFIRnPtm2OSNHPsq6HhaSnbDz9d921vntsZAJo/H+LncPIkgF2weV
	 uy73KnJRVrKK02jSnG8GQYTr7ugY8LNqcFVOCrzY0BCSN3QTF9vi2wTgxEYMl/Fx8z
	 jMbYJcK3VZ/574J8jMi1QZrcEHBIeMWLfcLIVztc/DQqN83+i6/LjyEV2cR5bm6/E0
	 e9Xsi8eezp0qw==
From: Oliver Upton <oupton@kernel.org>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	Jiaqi Yan <jiaqiyan@google.com>
Cc: Oliver Upton <oupton@kernel.org>,
	duenwen@google.com,
	rananta@google.com,
	jthoughton@google.com,
	vsethi@nvidia.com,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	pbonzini@redhat.com,
	corbet@lwn.net,
	shuah@kernel.org,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v4 0/3] VMM can handle guest SEA via KVM_EXIT_ARM_SEA
Date: Thu, 13 Nov 2025 13:06:42 -0800
Message-ID: <176305834766.2137300.8747261213603076982.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251013185903.1372553-1-jiaqiyan@google.com>
References: <20251013185903.1372553-1-jiaqiyan@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 13 Oct 2025 18:59:00 +0000, Jiaqi Yan wrote:
> Problem
> =======
> 
> When host APEI is unable to claim a synchronous external abort (SEA)
> during guest abort, today KVM directly injects an asynchronous SError
> into the VCPU then resumes it. The injected SError usually results in
> unpleasant guest kernel panic.
> 
> [...]

I've gone ahead and done some cleanups, especially around documentation.

Applied to next, thanks!

[1/3] KVM: arm64: VM exit to userspace to handle SEA
      https://git.kernel.org/kvmarm/kvmarm/c/ad9c62bd8946
[2/3] KVM: selftests: Test for KVM_EXIT_ARM_SEA
      https://git.kernel.org/kvmarm/kvmarm/c/feee9ef7ac16
[3/3] Documentation: kvm: new UAPI for handling SEA
      https://git.kernel.org/kvmarm/kvmarm/c/4debb5e8952e

--
Best,
Oliver

