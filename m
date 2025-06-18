Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236EDC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 17:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DE6MTfLXyc5NU0johvRwmDTo6kAlSf9wj5hTl1JGxPA=; b=iIFvfoQ2uEW2Mg7bhvpBiCB+it
	7ERRZDwbscu+Xu9F7LVsWMzhezLb+JAeHcBA6HPlDlAhk/UKzZZdlRyKiJGCs6YdIWMCLqTsJ+pqR
	OmZQMr06gK+Nx8Cdg4u3yJZC/9h9mRAJUwkjyYH2HmRqgxOb9FMhHAXeG4E42ujAXVkvtDOSLLFg+
	+6OYJQp9G3vVleaYwKwf7EDGoxCUjYk/RepRWsqeKOympMNRiE2QX2XzOu7y8StbuKX1sd2MB6jXu
	a1+G5s6cuDUmyWIrw38YBwjCi15LswqpDWRiVX5dnwMIczYuPTAUKDhepwUorvWwK6pHb3jsV5ijq
	ciDdM7lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRwde-0000000AreT-004H;
	Wed, 18 Jun 2025 17:31:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRtmg-0000000AQvL-1A34
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Jun 2025 14:29:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DE6MTfLXyc5NU0johvRwmDTo6kAlSf9wj5hTl1JGxPA=; b=CG3yMgFwc6t/KIFf9W7PJ105RR
	fwUp9zVq8WCuWRVAsT443oLlQfRARMynOoa1sLAkiJCaSIMUydvrAqGvE1CnWsoIHKaLjWOlhf3Ji
	Wn4dTwd5K11seF/4Nl6AvkmfEgAO34W1ZpcPNlsru5qsmY2IeGj2h/oI27a8AgLVwElSAbgflUVpX
	/vhZw36gfqBzI22H7I6kQLmBZoijPVBY6fO6VgCnXxKayhYIIBV5Hmp0HyFMcdJ65ALvEAjoDRl5G
	UwhSZZBI3JoefyFN9RgiYUZIxVjUf+R6d49xfFAbd19xDmsdr4aQUpGLQwJmnNebCBl3p+eYHB+AM
	QTewKN3g==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRtme-000000046FU-0PZD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 14:29:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7CC43434B5;
	Wed, 18 Jun 2025 14:28:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92066C4CEE7;
	Wed, 18 Jun 2025 14:28:48 +0000 (UTC)
Date: Wed, 18 Jun 2025 15:28:46 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: ankita@nvidia.com
Cc: jgg@nvidia.com, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	will@kernel.org, ryan.roberts@arm.com, shahuang@redhat.com,
	lpieralisi@kernel.org, david@redhat.com, ddutile@redhat.com,
	seanjc@google.com, aniketa@nvidia.com, cjia@nvidia.com,
	kwankhede@nvidia.com, kjaju@nvidia.com, targupta@nvidia.com,
	vsethi@nvidia.com, acurrid@nvidia.com, apopple@nvidia.com,
	jhubbard@nvidia.com, danw@nvidia.com, zhiw@nvidia.com,
	mochs@nvidia.com, udhoke@nvidia.com, dnigam@nvidia.com,
	alex.williamson@redhat.com, sebastianene@google.com,
	coltonlewis@google.com, kevin.tian@intel.com, yi.l.liu@intel.com,
	ardb@kernel.org, akpm@linux-foundation.org, gshan@redhat.com,
	linux-mm@kvack.org, tabba@google.com, qperret@google.com,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, maobibo@loongson.cn
Subject: Re: [PATCH v7 1/5] KVM: arm64: Rename symbols to reflect whether CMO
 may be used
Message-ID: <aFLNHvCdz3v6XrCr@arm.com>
References: <20250618065541.50049-1-ankita@nvidia.com>
 <20250618065541.50049-2-ankita@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618065541.50049-2-ankita@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_152900_390393_2676D70A 
X-CRM114-Status: GOOD (  10.66  )
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

On Wed, Jun 18, 2025 at 06:55:37AM +0000, ankita@nvidia.com wrote:
> From: Ankit Agrawal <ankita@nvidia.com>
> 
> Currently, the kvm_is_device_pfn() detects if the memory is kernel
> mapped. It thus implies whether KVM can use Cache Maintenance
> Operations (CMOs) on that PFN. Rename the function to reflect this.
> 
> Additionally, the "device" variable is effectively trying to setup the S2
> to prevent CMOs. Calling it 'disable_cmo' would make this code clearer.

I'm not sure CMOs is the only reason. Another is to prevent the guest
from mapping device memory as something other than Device with
possible implications for external aborts.

-- 
Catalin

