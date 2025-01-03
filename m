Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C91EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 01:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/h10ZSLIxempPcuw17CJeiysphVEiKKjLfNuclU3dOU=; b=TSeYHSmCmJAOg6V40PoAro7WCZ
	Q0CmPZ1TuyUCvfVcXgWS9eSNDKkFgEmGa45wQRjE8ShzcA70vgjFApqK1p74/ZpaCyrZXha/K0GIC
	N5Mjo9ss4uHmQruNwM4U7RPei9xKiK18LU6SKsvrxGDc9IW1H/j7VJn00EusU3UR8tq2Wj1e66tA0
	QgfKokVQ2H7tk7ZAwzzrdXUtYqLnjq7Krt1zu2JABy7i5Ez9RPKoQe0Sxijh/mcy4BpJVeFAYyTnJ
	X3DlT98QSGjFumxEUo6azX6jYRXxCnQ/n2HHbeHd9cPYM9uMFhrKd9YBBb+5eR23L+QZe8jat9d7s
	DA7kM3Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTWPt-0000000Bpma-0lAm;
	Fri, 03 Jan 2025 01:23:57 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTWNq-0000000BpSL-3vru
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 01:21:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735867310; x=1767403310;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=oERkHMNpZAO8boq4patQNzNmzLxeyP9280etk+NkYxI=;
  b=QfItnxyL0jcdK987f4WHJcp8sLEDuhLbc5yo/84ERtNWFdAsVEE4ALIm
   BmnIyY+v/QAwlLhB2RWgL9NOoGYhV4dHREe/P0m6H387bXZ4KNgKxZasj
   sqsP9vhgwPtYKUzBqYpn35UvkJcqeOoWFmqPSRb+LBAheFCklSjK4/xbh
   5TPvz/aX3p+ejNmHfenhFJDzUUjMkDDNvl1eohF3WB+/Ia+b2eVBxw6sS
   s3AMl9N79WHoCynrwECVIJvyR/4Zh72iozn/IkZA91Yq79087fs/sKjb/
   CBqV7glglbPzQKVnFfw3irl3ZWGGkzJj6THd4fW9wK1FFPlj7xtPtgJb0
   w==;
X-CSE-ConnectionGUID: 2dPcvyfOSiKTlw0dlqL+iA==
X-CSE-MsgGUID: Yqafc0J5TcWRJcA5Dh5HcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="36277858"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="36277858"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 17:21:46 -0800
X-CSE-ConnectionGUID: l7d9TjMyT3+vsV64Qnxyyw==
X-CSE-MsgGUID: haCY/+8GQc64Sj1azNOVCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="106695561"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 17:21:40 -0800
Message-ID: <33d397ce-c324-4594-9f83-8f7e513e86e7@linux.intel.com>
Date: Fri, 3 Jan 2025 09:19:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/14] iommufd/viommu: Add iommufd_viommu_get_vdev_id
 helper
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, kevin.tian@intel.com,
 will@kernel.org, corbet@lwn.net, joro@8bytes.org,
 suravee.suthikulpanit@amd.com, robin.murphy@arm.com, dwmw2@infradead.org,
 shuah@kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org,
 linux-doc@vger.kernel.org, eric.auger@redhat.com, jean-philippe@linaro.org,
 mdf@kernel.org, mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
 smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
 patches@lists.linux.dev
References: <cover.1734477608.git.nicolinc@nvidia.com>
 <21d7e63b97d81d0acf9127418a67efe386787261.1734477608.git.nicolinc@nvidia.com>
 <56c65e50-5890-42af-85b7-85f8a1bf5cf5@linux.intel.com>
 <Z2OpylDlhLXoo3dt@Asurada-Nvidia>
 <74bc9dbe-3420-4f0c-9e32-db49327a723d@linux.intel.com>
 <20250102202955.GE5556@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20250102202955.GE5556@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_172151_037854_EA739302 
X-CRM114-Status: UNSURE (   9.57  )
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

On 1/3/25 04:29, Jason Gunthorpe wrote:
> On Mon, Dec 23, 2024 at 10:28:32AM +0800, Baolu Lu wrote:
> 
>> However, considering page fault scenarios, which are self-contained but
>> linked to a hardware page table (hwpt), introduces ambiguity. Hwpt can
>> be created with or without a vIOMMU. This raises the question: should
>> the page fault message always report the iommufd device ID, or should
>> the reporting depend on whether the hwpt was created from a vIOMMU?
> I think every single event record read from the FD needs to clearly
> specify what its fields are.

That would work.

> Page fault need to clearly say it's field is a device ID.

Each field of fault message has been specified in uapi/linux/iommufd.h.

---
baolu

