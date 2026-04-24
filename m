Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E93F589DF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 02:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ouo86Hd/U4yTmyOjpX8vlfvIQHV6b1lx0tV72daLCys=; b=ymHHTz7IcrOGGowsoGeLn0v14g
	6RzsHr1N3PTZdwCDnS/NttlRWXDJdUG0CYTxFNZ4UZMYzVE/ZCcQRQWTqqZClbOyE9HjsS3wEYFJI
	7kN/GT3rx2jjmCtm9sgnf/DU8UpwSBPEW+/E42o76y8pFSGrsEfdjzLJ+oBWRUslg7J4NPD4NT40N
	Su0epjDqxmwuApq9r/XdjsbagZVcC9WmVCwwiS75j8oi2kUxGhBhpwhv6RoMLzmuroDSBDRqYldc7
	THc9EspnTvLCvncLkxAjAKLLPGALKU8Ji05CUnFOH+ZpsMmjqbJCjF6bUuuQ/DGTC73U24nkc8+wg
	0T4QEkew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG6kc-0000000CYSs-4AwG;
	Fri, 24 Apr 2026 02:58:43 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG6ka-0000000CYSU-3Lh5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 02:58:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776999520; x=1808535520;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LY7ylunqk041+wYs1GYZnUQlrTZKJSzxWmD03SswSJU=;
  b=dkXClRdHbQ5tG33jBY9yxopDoX+wxkQiIoaO/3suKmoXzgYo06YVfZ7l
   1VdHmDCPCKlKTuinoI0TgopWdrd3Pb383e60taZdSNxAweD2QOtBaz2rV
   ix172yYC3XwTm4LLZf99nyjwoEuWE9vj2cpRrebSUAxRPf71ZMaGo/TK+
   PH+LfwSAukhws07itFpT1abqIlXAfGhSaT3twctE0dM0CFR8SC9+ub7qb
   xalU2Sial9xsGrjraj0AtpHC7DbEpF+MinwyDFVDOq37+UDIjv0guOBZ0
   bxw7N3YGvV3VTRfWHkB8YGhz2bRDQUIujygnl+ugHwATcFCzRw+UGpaOQ
   w==;
X-CSE-ConnectionGUID: Sxl5xP7zTjaISZm12ik2NQ==
X-CSE-MsgGUID: gYvtWbctRMOThVQwhuljQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="80560118"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="80560118"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 19:58:40 -0700
X-CSE-ConnectionGUID: dMsNdGbxQ7+V/twVt5iNEA==
X-CSE-MsgGUID: wQSmWBAmRnCEOkwzNUW2pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="256345644"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 19:58:36 -0700
Message-ID: <fa3d734c-4447-4b7b-9a8d-bb95ffd0e851@linux.intel.com>
Date: Fri, 24 Apr 2026 10:56:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/11] iommu: Pass in reset result to
 pci_dev_reset_iommu_done()
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Jason Gunthorpe <jgg@nvidia.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Pranjal Shrivastava <praan@google.com>,
 Mostafa Saleh <smostafa@google.com>, Kevin Tian <kevin.tian@intel.com>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, vsethi@nvidia.com,
 Shuai Xue <xueshuai@linux.alibaba.com>
References: <cover.1776381841.git.nicolinc@nvidia.com>
 <bf99f11ac9a42b5552ec3367d02840366459ae7b.1776381841.git.nicolinc@nvidia.com>
 <c8c8b482-3781-4d33-9aea-866467d15b69@linux.intel.com>
 <aerZa3aQBMCwzzT8@Asurada-Nvidia>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <aerZa3aQBMCwzzT8@Asurada-Nvidia>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_195840_860287_90B5C127 
X-CRM114-Status: GOOD (  12.39  )
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

On 4/24/26 10:46, Nicolin Chen wrote:
> On Fri, Apr 24, 2026 at 10:38:09AM +0800, Baolu Lu wrote:
>> On 4/17/26 07:28, Nicolin Chen wrote:
>>> @@ -4083,6 +4093,18 @@ void pci_dev_reset_iommu_done(struct pci_dev *pdev)
>>>    	if (WARN_ON(!group->blocking_domain))
>>>    		return;
>>> +	/*
>>> +	 * A reset failure implies that the device might be unreliable. E.g. its
>>> +	 * device cache might retain stale entries, which potentially results in
>>> +	 * memory corruption. Thus, do not unblock the device until a successful
>>> +	 * reset.
>>> +	 */
>>> +	if (!reset_succeeds) {
>>> +		pci_err(pdev,
>>> +			"Reset failed. Keep it blocked to protect memory\n");
>>> +		return;
>>> +	}
>>
>> Nit: pci_dev_reset_iommu_done() does nothing if reset_succeeds is false.
>> Would it be better to handle this in the caller instead? Something like:
>>
>> 	if (reset_succeeds)
>> 		pci_dev_reset_iommu_done(dev);
>>
>> ?
> 
> It would also need a print and some duplicated comments. Actually,
> that would be my v2, which Kevin suggested this against:
> https://lore.kernel.org/all/BN9PR11MB5276706AE4E0BBE86F0F6E158C4EA@BN9PR11MB5276.namprd11.prod.outlook.com/

Oh, I forgot that comment.

> Though I don't have a strong personal reference here, I do see this
> version slightly cleaner than doing in the callers.

Okay, you own the decision.

> Thanks
> Nicolin

Thanks,
baolu

