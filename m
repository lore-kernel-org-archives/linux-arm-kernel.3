Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1DEC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 07:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ii2yeYoec4BEXWKxpSShNgXY0vqLTBLd/5YdjwaR15w=; b=VUf5xhl+2GoYpnzIxtvREvKQBR
	Z3/rW2U2SvjREafgpI0u/Vl7q0PRpUPKtOkhRHa902q9VEuQjJAJelPR1Bl0KKtrRdbBSK8i1iylO
	AfcQeok5Cy4Rc9OVmN2O78+JgXLhtInLwkWQtCvys1t/e+5kslNzhOzAoDJrPOT4FctjcHpTmuCqH
	oBWFUDkK76AcD87Pstmz8wBn4+VnTbh5lQDL22HMuU6qFECzVo2sM2qq0cjAPeUieGn+CfH+o8EFh
	sv8os2Cv9ObbbkOb/RPJrLWMZn/oxJ9xNsvw+zhP9UYaZBZMHIMAsgyFfBWV3UfHTEWZzYy4IISqw
	rOUNWpew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tljmJ-00000007ZGY-3ksb;
	Sat, 22 Feb 2025 07:18:23 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tljko-00000007ZAx-1Jbr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 07:16:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740208610; x=1771744610;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ZM7H4zpo4oPld8ul0n31itvGzUfHuxoBESuSPa+QMS4=;
  b=UDDnTFigGdD/fkIOwMRQgfOXCMVB8lFOMl6NyLrljn0mHWtHKIAb7UFp
   XP3/hOqbPxZhymFUnEQbEx7AySiloZoVAXMzIcqucdtkglBn8t+mv6g94
   L+be0ikqkB3M4ukc4Bhk8Q26MJvhVdyka7vG0yAfZLPTvoYYF/kOlyRnl
   Y9Du/WrKePF9zldPmnonfJxJH8okMbtWYlE/GCh2IQNI0OG2nVocCGRUJ
   KzXTNBh1lxqRQKJGHoel35oVK19QktkZAZf2mY1yixhEJ6MT7yMd9c2S/
   CF60fX6IYIt1I9R9WzwPKdRr+ygqTYKAmFHQ+zl/KhxIt8XCZ3ZNgEJ4O
   A==;
X-CSE-ConnectionGUID: ZwBZUBOvQ7OUNvlfhPRnuw==
X-CSE-MsgGUID: Ua8TECs2RAW4STVD+a98Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="44941348"
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="44941348"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 23:16:44 -0800
X-CSE-ConnectionGUID: /ptGdvWFQeWGeHLVxpGlKg==
X-CSE-MsgGUID: iQrwTD+nRputVAuyNG/vJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="146417233"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 23:16:37 -0800
Message-ID: <ff5ecf47-75ce-4c8b-a8f5-94ea8ec7ad87@linux.intel.com>
Date: Sat, 22 Feb 2025 15:13:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/12] Initial support for SMMUv3 nested translation
To: Jason Gunthorpe <jgg@nvidia.com>, "Tian, Kevin" <kevin.tian@intel.com>
Cc: Zhangfei Gao <zhangfei.gao@linaro.org>,
 "acpica-devel@lists.linux.dev" <acpica-devel@lists.linux.dev>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 Joerg Roedel <joro@8bytes.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Len Brown <lenb@kernel.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "Moore, Robert" <robert.moore@intel.com>, Robin Murphy
 <robin.murphy@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Will Deacon <will@kernel.org>, Alex Williamson <alex.williamson@redhat.com>,
 Donald Dutile <ddutile@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Hanjun Guo <guohanjun@huawei.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Jerry Snitselaar <jsnitsel@redhat.com>, Moritz Fischer <mdf@kernel.org>,
 Michael Shavit <mshavit@google.com>, Nicolin Chen <nicolinc@nvidia.com>,
 "patches@lists.linux.dev" <patches@lists.linux.dev>,
 "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Mostafa Saleh <smostafa@google.com>
References: <bc9f4477-7976-4955-85dc-3e05ebe95ead@linux.intel.com>
 <20250214124150.GF3886819@nvidia.com>
 <58e7fbee-6688-4a49-8b7a-f0e81e6562db@linux.intel.com>
 <20250218130333.GA4099685@nvidia.com>
 <f7e30bd8-ae1f-42fe-a8a6-2b448a474044@linux.intel.com>
 <BN9PR11MB5276EAD07C3B32517D339DF28CC52@BN9PR11MB5276.namprd11.prod.outlook.com>
 <7027fb3a-dfb4-40ae-ac9c-5ea1dcd57746@linux.intel.com>
 <BN9PR11MB52764E131435DF44370653CD8CC42@BN9PR11MB5276.namprd11.prod.outlook.com>
 <c57977e2-d109-4a38-903e-8af6a7567a60@linux.intel.com>
 <BN9PR11MB527644D4478318D4DE0E027A8CC72@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20250221130457.GI50639@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20250221130457.GI50639@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_231652_508649_C2F072EC 
X-CRM114-Status: GOOD (  13.22  )
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

On 2/21/25 21:04, Jason Gunthorpe wrote:
> On Fri, Feb 21, 2025 at 04:28:50AM +0000, Tian, Kevin wrote:
>>> With PASID support, multiple domains can be attached to the device, and
>>> each domain may have different ATS requirements.  Therefore, we cannot
>>> simply determine the ATS status in the RID domain attach/detach paths. A
>>> better solution is to use the reference count, as mentioned above.
>>>
>> Okay, that helps connect the dots and makes sense to me. Thanks!
> I also have this general feeling that using ATS or not should be some
> user policy (ie with sysfs or something) not just always automatic..

Agreed. ATS is inherently insecure because it allows a device to
directly access system memory using translated requests. A malicious
device could exploit this to compromise the system. Currently, Linux
prevents ATS from being enabled on devices with pci_dev->untrusted set.
But this seems insufficient, as only devices connected to external-
facing ports are currently marked as untrusted. It would be preferable
to allow the user to determine which devices are trusted and, therefore,
permitted to use ATS.

Some IOMMU architectures have introduced new features to enhance the
security of ATS, such as the host permission table in VT-d v5.0. This
could be an interesting topic when considering its implementation in the
Linux kernel.

> Right now on our devices there is a firmware config that hides the ATS
> support from PCI config space and the general guidance is to only turn
> it on in very specific situations.

Thanks,
baolu

