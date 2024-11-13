Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50096D597C8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 02:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NYvwWACc7sNcysfc8I4ay/Vx9lD4QswBDewYBN+NtnQ=; b=tozINay2CLGlcHWZA0XFqfzodq
	V8L3AJ5+H9WF6jk0UqXh6M8oahCgrguCQLcAQy0Cb3hlgF9ZQETLNuiCdtyiVqhtPdgi3Kk5sUJ4h
	RXWX+n4LgvBaBiMNx0CchW4icTN4O6HZOvgUH6n6NgdePVNH12mfQoEHZ3ureGuPznK3g8K8GRzWg
	/WT+/1HSY2bJNXbe8sfTY3nq+XMbO+jpokwc7oUBKmCqq/2Knm4LnIqDDKVxNHkS2KklZY2RNf4/E
	5n+jmfqMefxoZ4MQPOsGTjtQX9kMSY0hoE0EIMIQUXzmqJVgoS2K/Iiw2gKY1qY4d/b/0aDhdNUHf
	cXA2s/gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB3ab-00000005dL6-355Q;
	Wed, 13 Nov 2024 02:58:41 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB3Yo-00000005dDP-04H4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 02:56:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731466610; x=1763002610;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ceSuWOSaH+psoiQRK0fCAi9iXALt92xZBLKjvgklJjw=;
  b=dRUFIbR0ZE3whFc7iFp8DCHUbcHGtZsOrHEbqLd84LqKPKbrnYinXkKl
   XqyxoxsUzsIOT4vVxtE9Epzd+lcPN+b5q4EHw3GoHhwSK0OL1dfFas1va
   rsFujAdCAgwWVjFnVRWtvEAgHv0mCQA6i3M5mMyfr3No7ieJyDWZ63Y6u
   itNJlNZJuBr1OHvZEwJTrzQIHmBCSoKFt2CqtERGbJK/FDZDp3CE+p420
   Zv9sPgRb4N7KStPQUjkW5G94FL1X9MQPBuQlfiexEjTqqn/TlY6IWXIY7
   MyJjJXNmf74XWfyu7ghbIFwMx2Y/zffs7tf2thxS562LmY5Nj0OU2krTO
   A==;
X-CSE-ConnectionGUID: SqzuwTIyRlC09ui56wFLeA==
X-CSE-MsgGUID: +dJE7D1hSyanoFXJrcHxWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31442151"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="31442151"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:56:49 -0800
X-CSE-ConnectionGUID: g2GulBb6RSSg5ikrECfKxg==
X-CSE-MsgGUID: Oj2A52ANTnmNTqlZZd4sgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="87703179"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:56:43 -0800
Message-ID: <9df3dd17-375a-4327-b2a8-e9f7690d81b1@linux.intel.com>
Date: Wed, 13 Nov 2024 10:55:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/12] Initial support for SMMUv3 nested translation
To: Jason Gunthorpe <jgg@nvidia.com>, Zhangfei Gao <zhangfei.gao@linaro.org>
Cc: acpica-devel@lists.linux.dev, iommu@lists.linux.dev,
 Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
 kvm@vger.kernel.org, Len Brown <lenb@kernel.org>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Robert Moore <robert.moore@intel.com>, Robin Murphy <robin.murphy@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Donald Dutile <ddutile@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Hanjun Guo <guohanjun@huawei.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Jerry Snitselaar <jsnitsel@redhat.com>, Moritz Fischer <mdf@kernel.org>,
 Michael Shavit <mshavit@google.com>, Nicolin Chen <nicolinc@nvidia.com>,
 patches@lists.linux.dev, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Mostafa Saleh <smostafa@google.com>
References: <0-v4-9e99b76f3518+3a8-smmuv3_nesting_jgg@nvidia.com>
 <20241112182938.GA172989@nvidia.com>
 <CABQgh9HOHzeRF7JfrXrRAcGB53o29HkW9rnVTf4JefeVWDvzyQ@mail.gmail.com>
 <20241113012359.GB35230@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20241113012359.GB35230@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_185650_100634_BDC77CF6 
X-CRM114-Status: UNSURE (   8.30  )
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

On 11/13/24 09:23, Jason Gunthorpe wrote:
>> https://github.com/Linaro/linux-kernel-uadk/tree/6.12-wip
>> https://github.com/Linaro/qemu/tree/6.12-wip
>>
>> Still need this hack
>> https://github.com/Linaro/linux-kernel-uadk/commit/ 
>> eaa194d954112cad4da7852e29343e546baf8683
>>
>> One is adding iommu_dev_enable/disable_feature IOMMU_DEV_FEAT_SVA,
>> which you have patchset before.
> Yes, I have a more complete version of that here someplace. Need some
> help on vt-d but hope to get that done next cycle.

Can you please elaborate this a bit more? Are you talking about below
change

+	ret = iommu_dev_enable_feature(idev->dev, IOMMU_DEV_FEAT_SVA);
+	if (ret)
+		return ret;

in iommufd_fault_iopf_enable()?

I have no idea about why SVA is affected when enabling iopf.

--
baolu

