Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB62FDEE5E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 02:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lMOV52nl5uyqQoKXA+J3NUZlliMEicl06xl3C2OlTWw=; b=Cl++eta0FnwqCeSdsdwySqcqjJ
	OKE11ElDFqz8UmAydBZ+JyN190ADNv1qXEHwW9bOr+jV7Oza9wLrfnE2CwSjvhWGp4Eh1kWqxGXDG
	31rTOpLDyLWZN++G8PZfzfZ9ExfzfCLeW4vUK0oHlervaEnjz+ITbqHgR1OIXUgojs5tGRI6K1zCY
	xbJ6a66x8kj1VSHUY07XGA5MPAwkeQS1LQdpzieUmWroN53IEgSqBqsA7Fg7N7U7rnean1dNf9eVj
	C7qUzBZyC/JloXv7ugKMYgW9mh7FUSbvf0ewxI6mnt/ikdgcrXUHnivIhhz4+QPTD3FQEv6RZNcaR
	Sb51/zGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG6Up-0000000CVtt-36AP;
	Fri, 24 Apr 2026 02:42:23 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG6Un-0000000CVtZ-1UrX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 02:42:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776998541; x=1808534541;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+9A1KI036l8QOASwONExbQWXRXNXu7SxFYZQUHMm8XY=;
  b=RBQSj1VmaMyoqPQu00Zn+ZFRQjwM1DhWDyaYTZiQjiVpeXDtK9RZzMjj
   QZvJW3021Hy9QLpr1q61n0Gm/eaHqUrGcOCaB38bwiQ1rGR6JD7OpSqI0
   CrRLtgiiYZHiWRW5odxjY17dJ1/xFvN/r2dIEJ8pajMx1PEAEnONgFUH8
   y5skxtr8y64sCDDpKVxiJ5ClGvm0adbp8ESCnqdNXCbGrH8Zt1Z6GbrHJ
   QBH0RR77VhEz7uWIpM+uzSKadILBR5KVmhSwqc1bP/F7R7AW1EN889H06
   Ja9AtgO+ooW+WzyJQA4sB6FhjD5LNnKuBEdWrBj22pSihdo7zngCOPkla
   g==;
X-CSE-ConnectionGUID: 1UVgYy9kS12yHUNOpBpqEA==
X-CSE-MsgGUID: mCwfDpV3SEmxW9CwSygY9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="77008146"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="77008146"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 19:42:20 -0700
X-CSE-ConnectionGUID: VdMpaQVoRzaH9GBKu8Y3EA==
X-CSE-MsgGUID: YwEWNUCRSDyF6AeeWJTrBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="226289829"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 19:42:16 -0700
Message-ID: <6460abc4-94d0-48a7-8cfe-978dad076cfd@linux.intel.com>
Date: Fri, 24 Apr 2026 10:40:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] iommu: Add reset_device_done callback for
 hardware fault recovery
To: Nicolin Chen <nicolinc@nvidia.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Jason Gunthorpe <jgg@nvidia.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Pranjal Shrivastava <praan@google.com>, Mostafa Saleh <smostafa@google.com>,
 Kevin Tian <kevin.tian@intel.com>, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org, vsethi@nvidia.com,
 Shuai Xue <xueshuai@linux.alibaba.com>
References: <cover.1776381841.git.nicolinc@nvidia.com>
 <c90693e75c0610da38103a683b558d5596bd843b.1776381841.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <c90693e75c0610da38103a683b558d5596bd843b.1776381841.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_194221_431243_626997EA 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

On 4/17/26 07:28, Nicolin Chen wrote:
> When an IOMMU hardware detects an error due to a faulty device (e.g. an ATS
> invalidation timeout), IOMMU drivers may quarantine the device by disabling
> specific hardware features or dropping translation capabilities.
> 
> To recover from these states, the IOMMU driver needs a reliable signal that
> the underlying physical hardware has been cleanly reset (e.g., via PCIe AER
> or a sysfs Function Level Reset) so as to lift the quarantine.
> 
> Introduce a reset_device_done callback in struct iommu_ops. Trigger it from
> the existing pci_dev_reset_iommu_done() path to notify the underlying IOMMU
> driver that the device's internal state has been sanitized.
> 
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
> ---
>   include/linux/iommu.h |  4 ++++
>   drivers/iommu/iommu.c | 12 ++++++++++++
>   2 files changed, 16 insertions(+)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

