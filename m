Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B943C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 11:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bi8kks1t9xNKvGVo/6jcNJzZIGuN6UX788iT+MOzMzA=; b=IMoLqAHDxMrrYvU6OzJm6j13Hn
	ScB/3cMuxkXj2L2PjUA4ZSjemlw4skGwdjjeRfhxQlhFS5s6YnNdR3djSuUR6HYm+1JMFne2sWCSz
	TDSCohR+zvbR9FxMGy31ENlx2U60LBAdH5Lxh4kCoG4CpGxHT1iXuIXfZxmSYPcP66PlUBzxnRFjV
	Q2LQjz4GEKX6jCJxtkKSSxe/3NAq/GYA2v1r3pMkOuSXjNa8AwBdfD+APu06TrL18eAqa+qPw8OT3
	4xeEtVKbJlDE6VWywQa0FBfozLXW69sPq2c8qm0NX3vT670/LOPWYnVp7UlOf6Rl4FocSmV3mihRq
	ucaX+YLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0iO-0000000BQFM-1VtV;
	Thu, 20 Aug 2026 11:13:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0iM-0000000BQD2-17SD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 11:13:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 640A160A6E;
	Thu, 20 Aug 2026 11:13:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0C551F000E9;
	Thu, 20 Aug 2026 11:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787224421;
	bh=bi8kks1t9xNKvGVo/6jcNJzZIGuN6UX788iT+MOzMzA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=gSYNUhgrqzk238wabITHC7PbgxskdNvBkQ8ykYb8gYbi3wBC4TZl4R6bUTv8izpKV
	 kqPIwwiZtspW6BlEqv9a1P6ZZARrkSzP2n3GzchQVb+zyzQj6Z7WEDwBOpZvQz6unT
	 Dzmz2+vGr8Pk1MWkENMwDieuYaxT+Ut/6cU3hKMJtUqnxBa0f/9OzdEL2xdJQ0dfw7
	 w2dOUqXtFFOaQ4ddtKCaFbMV4Ezvz4kSRNOxfeCwyW1bbN98aLSSf4n99HPepvs7nY
	 MvLV78GOznFSvpsIgXQhNbqzNIIwav8ngBFYVuC8aMBhbKESKLXTkbVjG1IFxqJukA
	 8DWpK7rnYR4eQ==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Kameron Carr <kameroncarr@linux.microsoft.com>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [RFC PATCH v4 07/11] coco: guest: arm64: Add guest APIs to read
 host-cached DA objects
In-Reply-To: <36877aa6-3f70-4da1-aecb-7209a33f8595@linux.microsoft.com>
References: <20260427082805.931832-1-aneesh.kumar@kernel.org>
 <20260427082805.931832-8-aneesh.kumar@kernel.org>
 <36877aa6-3f70-4da1-aecb-7209a33f8595@linux.microsoft.com>
Date: Thu, 20 Aug 2026 16:43:29 +0530
Message-ID: <yq5ao6exvycm.fsf@kernel.org>
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

Kameron Carr <kameroncarr@linux.microsoft.com> writes:

>> diff --git a/drivers/virt/coco/arm-cca-guest/rsi-da.h b/drivers/virt/coco/arm-cca-guest/rsi-da.h
>> index 297cb800edc0..88067d2230ab 100644
>> --- a/drivers/virt/coco/arm-cca-guest/rsi-da.h
>> +++ b/drivers/virt/coco/arm-cca-guest/rsi-da.h
>> @@ -10,6 +10,8 @@
>>  #include <linux/pci-tsm.h>
>>  #include <asm/rsi_smc.h>
>>  
>> +#define MAX_CACHE_OBJ_SIZE	SZ_16M
>
> Why is the limit 16 MiB? I don't see that limitation in the RHI spec.
> Does the limit come from PCI TSM?
>

I based that on the SPDM MeasurementRecordLength, which is 16 MB.

-aneesh

