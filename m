Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1EDCC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 10:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9xhjrF0HVspR4yJm+kT2S/laGc9YhEfVwqfbGD1ON+o=; b=rNJ01Y7nIWzifAMig91KmTMH/p
	shrMRLIQUuBAb/c9+lrX54aELA5TGyh4lzViIwmE1Atqxng7nVsRzCShTUQ+hLRD9fhiTOnk8c0Yo
	YbGcsm4ds4mSoy9JVYJWj5Kw57KJYzH4g8qjMGva6Tvm/V5XlGXdc5PbYszoYoWXVqpkS75UDTbaZ
	9ahMqz9HqNM7DNVKQIhUBL/ivOzwwGvx0wWyXwGtYKxyAkwrCnK1pb0RH595viFPcop24RMboZah7
	Ujdo6Wsu0FeeC6n4aWPKmT7iLOO+5+ZsiPc+Sw33XNueRYA6P54BgXZibYBznKaJgSt9AzklRoUTZ
	/dsajaEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJ4g-00000008522-2xIX;
	Wed, 12 Mar 2025 10:12:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJ2S-000000084j3-0aIv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 10:10:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18CE0152B;
	Wed, 12 Mar 2025 03:10:22 -0700 (PDT)
Received: from [10.57.38.75] (unknown [10.57.38.75])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 734303F5A1;
	Wed, 12 Mar 2025 03:10:06 -0700 (PDT)
Message-ID: <d55240a4-fe4a-48ea-b3a8-9a997bb7267c@arm.com>
Date: Wed, 12 Mar 2025 10:10:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] iommu: Get DT/ACPI parsing into the proper probe
 path
To: Joerg Roedel <joro@8bytes.org>, Baolu Lu <baolu.lu@linux.intel.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Stuart Yoder <stuyoder@gmail.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Nipun Gupta
 <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 Charan Teja Kalla <quic_charante@quicinc.com>
References: <cover.1740753261.git.robin.murphy@arm.com>
 <e3b191e6fd6ca9a1e84c5e5e40044faf97abb874.1740753261.git.robin.murphy@arm.com>
 <Z9CEIlXoQJ-A0t-d@8bytes.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <Z9CEIlXoQJ-A0t-d@8bytes.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_031012_229225_E79C44F6 
X-CRM114-Status: GOOD (  15.13  )
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

On 2025-03-11 6:42 pm, Joerg Roedel wrote:
> Hi Robin,
> 
> On Fri, Feb 28, 2025 at 03:46:33PM +0000, Robin Murphy wrote:
>> +	/*
>> +	 * And if we do now see any replay calls, they would indicate someone
>> +	 * misusing the dma_configure path outside bus code.
>> +	 */
>> +	if (dev->driver)
>> +		dev_WARN(dev, "late IOMMU probe at driver bind, something fishy here!\n");
> 
> This warning triggers on my workstation (with an AMD IOMMU), any ideas?

Argh! When I moved the dma_configure call into iommu_init_device() for
v2 I moved the warning with it, but of course that needs to stay where
it was, *after* the point that ops->probe_device has had a chance to
filter out irrelevant devices. Does this make it behave?

Thanks,
Robin.

----->8-----
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 09798ddbce9d..1da6c55a0d02 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -437,12 +437,6 @@ static int iommu_init_device(struct device *dev)
  		ret = -ENODEV;
  		goto err_free;
  	}
-	/*
-	 * And if we do now see any replay calls, they would indicate someone
-	 * misusing the dma_configure path outside bus code.
-	 */
-	if (dev->driver)
-		dev_WARN(dev, "late IOMMU probe at driver bind, something fishy here!\n");
  
  	if (!try_module_get(ops->owner)) {
  		ret = -EINVAL;
@@ -565,6 +559,12 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
  	ret = iommu_init_device(dev);
  	if (ret)
  		return ret;
+	/*
+	 * And if we do now see any replay calls, they would indicate someone
+	 * misusing the dma_configure path outside bus code.
+	 */
+	if (dev->driver)
+		dev_WARN(dev, "late IOMMU probe at driver bind, something fishy here!\n");
  
  	group = dev->iommu_group;
  	gdev = iommu_group_alloc_device(group, dev);


