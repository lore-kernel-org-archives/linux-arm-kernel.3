Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167D3CDB466
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 00:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BDKUVID7qw6T4mp18P6/ELgU0/lKW+UBMNBhyLpyrEI=; b=42Q6VPDde9vS3UPMLi/zMqJkK3
	GmCtHfB3qKyN2pp2nfVYZnB8X0gSYOzFwcUOLggacde6BUQekxFBauwbIFzFnm+bzAR54JDyhDaA7
	lvqVD0nDhlBKaYgVy4SUaytZDJWjwmGuickYi5/ts98pu0L+cDkt3xNuEELoqsGMAGo5+XAGo5qvW
	+3MleKWeMVtRaXmICrNwthpUfBTu5pQ6GMIcn1o3j1xmwzTbs+2KVNnODL/QQWZhc4NOpDP8cr6Zy
	SP/uIt73LDAQ44IDurKAOkm6nHkSBLpmj/jrGoSweYa14BwYRbhYgt3vruvB+zOEdlogfg6VnPSmi
	qAWrOZtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbosA-00000005UbN-42PK;
	Tue, 23 Jun 2026 00:20:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbos9-00000005UbF-3c16
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 00:20:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D9662601F3;
	Tue, 23 Jun 2026 00:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B54E1F000E9;
	Tue, 23 Jun 2026 00:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782174012;
	bh=BDKUVID7qw6T4mp18P6/ELgU0/lKW+UBMNBhyLpyrEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ei9u1GkzJ84WMGMXM2wTDi3t2Wr8NPXEkmG+WJhM2LwZSiZesTnOlQUBNSvABzMOt
	 PL1bFvxpcEDkHqf7c9Yvv4jxf62tQshvmaB1xz42UA/TLGivZU5BvZmtR+gsdWjjUI
	 LzwQNlqkw89gXB5SBaSD8fJk40FmW5Mn53HH8CmDTLzRwdmo4l/NN8+1ZEbTW1VXRI
	 EEYfYTTZ2MNDzBLorlsfbXg+Q6P2wxwMUFbjXB5QWFGAnWhwigy5VmIArvdYu/J0dn
	 yETSrn9w9g1aM2SA3rJus8yjDi9TGGwBYBtVe7TxgiYeO3FWfLOjKsLGjqQkzseMqA
	 Ry/RSuqWXcOwA==
Date: Mon, 22 Jun 2026 17:20:11 -0700
From: Oliver Upton <oupton@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	Victor Kamensky <victor.kamensky@linaro.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] KVM: arm64: Fix and test MMIO sign-extending loads
Message-ID: <ajnRO9oMrVCXQT9t@kernel.org>
References: <20260622190701.2039766-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622190701.2039766-1-fuad.tabba@linux.dev>
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

On Mon, Jun 22, 2026 at 08:06:59PM +0100, Fuad Tabba wrote:
> Hi folks,
> 
> A sign-extending load (LDRSB/LDRSH/LDRSW) from emulated MMIO returns a
> zero-extended value rather than the sign-extended one the architecture
> requires; vcpu_data_host_to_guest() strips the sign bits when it masks
> the data to the access width.
> 
> If my git archeology is right, the masking dates to 2014 (b30070862edbd,
> big-endian support) and has been wrong ever since, but sign-extending
> loads from device memory are rare enough that nobody hit it. Patch 1
> fixes it; patch 2 adds a selftest so it doesn't regress.
> 
> Cheers,
> /fuad
> 
> Fuad Tabba (2):
>   KVM: arm64: Fix sign-extension of MMIO loads
>   KVM: arm64: selftests: Add MMIO sign-extending load test

For the oddball guest :)

Reviewed-by: Oliver Upton <oupton@kernel.org>

Thanks,
Oliver

