Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136AEC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 17:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKuFQ4lNCDoVP5ypeEkZXbn2jkzDPQdEnUCvCSFf0/4=; b=tLyXITsFer2FH39yKJHu77tefo
	L6M7gDmRuqYjygcQy7s6RDFXDJ/JFOEH+5UElg9q51/0rZoBK5BpVxcPQRcBH89HZiZ2T3w3glkOn
	SUXKziddrLlZ8NO7bhDkzMUAmAPlAql+ohc/AebyPjt3o5/gC7Clsm1hBBxLrNGQjH1kBCraAU6uX
	/Si8w0Axhv5Cz0UYuSNkbyGyLc3f5zCr+8PAn4m82Q9iYAolV3a5wfF6eY4MtR7deuslh47AkzA5L
	EUsiRiBLKhyQF+9dqJ0TMoqtEGEM0o58sBpZ9r8jtBtfpDIlKd9SIctjFhGR4pReTD+uwANERGxWu
	baSxz7JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpW1c-00000005cGd-3bLQ;
	Tue, 04 Mar 2025 17:25:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUj3-00000005Kxl-1My6
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 16:02:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GKuFQ4lNCDoVP5ypeEkZXbn2jkzDPQdEnUCvCSFf0/4=; b=Z66KNWTCNUhdLiElWfOJ1B4qga
	Qa/2sdAQYQ+bZVzuRD0c8Pr8+R1rCV82fYqfQzUUqEEIq2xhDPBSpGO9tVznqr5SiCD9i0wngrvN5
	Dw4W0BNctt9C4jjUD5LiwrMZoFu6aFhD6uz0cmFYNkMcfkFKgRYJ0HMM219R29uYNVwuc6tmPRyAA
	gPdSHQFw0kUMAXjGR/kUYRAdKGE99GxVKdNf0v14zclT9f6DxpXLqq1XO3PYmduT3EXvodTMvxQQz
	muE+9e4r397wpERhyrein9vKm0MIjmhmo61CxTLzpshZEB0rvtG69yN405VJPGPaevgxRjGP3KPGX
	IResH5TQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUiz-0000000055a-2Kum
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 16:02:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 619542F;
	Tue,  4 Mar 2025 08:02:40 -0800 (PST)
Received: from [10.57.83.152] (unknown [10.57.83.152])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C0B73F5A1;
	Tue,  4 Mar 2025 08:02:22 -0800 (PST)
Message-ID: <67fbe3f4-4fb6-4753-b34c-320b7897fd16@arm.com>
Date: Tue, 4 Mar 2025 16:02:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] iommu/arm: Add BBM Level 2 smmu feature
Content-Language: en-GB
To: Jason Gunthorpe <jgg@ziepe.ca>,
 =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>
Cc: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
 "yang@os.amperecomputing.com" <yang@os.amperecomputing.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>, "joro@8bytes.org" <joro@8bytes.org>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "joey.gouly@arm.com" <joey.gouly@arm.com>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "maz@kernel.org"
 <maz@kernel.org>, "david@redhat.com" <david@redhat.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "mshavit@google.com" <mshavit@google.com>,
 "jsnitsel@redhat.com" <jsnitsel@redhat.com>,
 "smostafa@google.com" <smostafa@google.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>
References: <20250228182403.6269-2-miko.lenczewski@arm.com>
 <20250228182403.6269-6-miko.lenczewski@arm.com>
 <20250228193221.GM5011@ziepe.ca>
 <b23aa37f8e864dea82a6143bece912d6@huawei.com>
 <20250303103102.GC13345@e133081.arm.com> <20250303165255.GS5011@ziepe.ca>
 <20250303190330.GA426248@e133081.arm.com> <20250304142634.GC5011@ziepe.ca>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250304142634.GC5011@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_160230_005351_851555A7 
X-CRM114-Status: GOOD (  13.15  )
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

On 04/03/2025 14:26, Jason Gunthorpe wrote:
> On Mon, Mar 03, 2025 at 07:03:42PM +0000, Mikołaj Lenczewski wrote:
> 
>> For example, if we use BBML2 for kernel mappings, does that require us
>> to repaint all kernel mappings when disabling BBML2 on smmu attach? I
>> am not sure, but definitely something to be worked out.
> 
> No, it would be a per-mm_struct basis only if we did something like
> that
> 
> When the SMMU driver puts a SVA on top of the mm_struct it would
> disable BBML2 usage only for that mm_struct and it's contained VMAs.

I guess we would need to figure out some synchonization mechanism if disabling
BBML2 dynaically per-mm. If there was already a BBML2 operation in flight would
want to wait for it to end. But that's a problem to solve if/when it's shown to
be needed, I think.

> 
> Kernel mappings are never made into a SVA so are not effected.
> Userspace only.
> 
> Jason


