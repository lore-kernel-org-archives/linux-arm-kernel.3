Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EDDCD4F49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 15:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WEPgSjAw2UWshasgo4FZJUO0A5JBKstmTd0nUituX9A=; b=GE57ptuGuAo/HotkZsiAfDP+ZB
	R2IHHGoOz39Rv1cFM5iyYlzAyhchFHkqhR0H8iQWf/dJmlnk+nIQCRbQA5geh+lsAwo1LqIkf5RfV
	fSYsyHpwa8OYaugw/i2vM6TdG/Go0NB9/TyimJR/PgUYNFJ9KsqJfQjQPEl2AQIMt/66RJjL+xtad
	Z+z5WvKVHjwdDemQfVUEaix1Dt3SAns8S8kV+ll1vS2qUignTBIHnPahumb7XnbyLaT9wbGyMi3oV
	mgKEIoUdymU0exWdtqXBnxxhNIMyigcV147dmDRdQ4sKbWvFuGlVc+2MPg0Pwup4lNleXgbg87x/3
	xZVkm+nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP0HZ-0000000GE5v-35RO;
	Mon, 18 May 2026 15:53:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP0HY-0000000GE5V-2xP2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 15:53:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B5CF8601E2;
	Mon, 18 May 2026 15:53:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53E22C2BCB7;
	Mon, 18 May 2026 15:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779119607;
	bh=p0DF+qEvuD5y1yPwFRfJEGsH1ocDFXtPcWXGL8v+pd0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ulj5R3E8Rv8y6EmWoyV1jR6yWCoMpkqpHQszi1rcK2/qlwRJHt0u6MroEEnHNLBUR
	 pN/m0AaSkXN7mkCgr+5Et2WQkND/EzH5MAoCBk4uXKkHU+B2NS6pR/80OeAdaxb0MJ
	 /GlaoOyND3f1Uc6tscxCBhqnQherydXZsWnMwZSFDdfGCHf/hIivhAmarwP5i6MPVV
	 CKRQr6WiXlw0fJx4hOuZSuaYTRLRLbB8Fbqbj29OGBebTY6cWF+Gt/+pbcirTnGvqn
	 sd66jOcafF6fg8ww6lpeZcZN9yelMf7sgSqGTZL3UE7/J87+tERAy9oooSyzODdQuN
	 APe2kmfaYLDVQ==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [RFC PATCH v4 00/14] coco/TSM: Host-side Arm CCA IDE setup via
 connect/disconnect callbacks
In-Reply-To: <agsNO9cc7H-b0H8L@willie-the-truck>
References: <20260427065121.916615-1-aneesh.kumar@kernel.org>
 <agsNO9cc7H-b0H8L@willie-the-truck>
Date: Mon, 18 May 2026 21:23:18 +0530
Message-ID: <yq5aecj8yas1.fsf@kernel.org>
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

Will Deacon <will@kernel.org> writes:

> On Mon, Apr 27, 2026 at 12:21:07PM +0530, Aneesh Kumar K.V (Arm) wrote:
>>  arch/arm64/include/asm/rmi_cmds.h         |  85 +++
>>  arch/arm64/include/asm/rmi_smc.h          | 168 +++++
>
> Curious, but why does this stuff have to live in the arch code? Wouldn't
> it be better off somewhere like drivers/firmware/ or
> include/linux/arm-rmi.h?
>

Those headers are used to collect all RMI-related helpers and #defines.
They were introduced by the Realm KVM/host support patch series, and I
am continuing to use the same headers to add more helpers.

We can consider moving the RMI helpers used by virt/coco/arm-caa-guest/,
virt/coco/arm-cca-host/, and
drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-realm.c into a more generic
header such as include/linux/arm-rmi.h. However, that would either
require moving all the helpers currently used by KVM there as well,
otherwise we would end up with two separate headers carrying RMI
helpers.

Additionally, there are also arch/arm64/include/asm/rsi_cmds.h and
arch/arm64/include/asm/rsi_smc.h to consider.

-aneesh

