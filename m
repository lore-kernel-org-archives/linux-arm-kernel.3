Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11232FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 12:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYVh3rRNApPh1xCCN3OpCIIeR/JDDKtNd9mRTZdEGN8=; b=g7KJuUhg5+cRYjvrhuBbD0cR6r
	Lzpo4WZI5MWuHJmwaLKGZC0JWV8yImF13jrhx/Stm/L+QgmLeFVAh1pwmkY2KIX42f4eSc+k6IEc3
	j0S9CEzx7i0Th5+QYlwpi6iV3ljM3pJ1dJoyavzuNXpIhkFoEGGuK4w+zkflMgArWXGnk50+m32XZ
	8FWmIiVDCYgFQbGg9F85IRC8D/nt8EV6hfqWAR7CQThAmk8ihZnOm52JtrUTxZEARXhjazUhXv/F6
	tiOLoazdkzDKDUz67PLJwV+Zq58YKEtLyhIKVr6ewBGF9xg5R1pFYuFJgKTMyZdLGbWkxpt2O1t/A
	0kqYTIvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHhe3-00000001RYS-1APc;
	Tue, 28 Apr 2026 12:34:31 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHhe0-00000001RIz-1SI1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 12:34:30 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=WYVh3rRNApPh1xCCN3OpCIIeR/JDDKtNd9mRTZdEGN8=;
	b=LFp0QVZWjsJ0M4aWYjOUIOQg+8m7/Uxy/nFSGQn3YvN1wf9blJa19UbcK2KFxPGA6iq+To5ef
	EhcDSfDevbu0qDIij7sis/Q+3ur0xwmHxUT5+HHppwRXaMgg1L3sYz7ofXCdxOot5ydgVNAwgzO
	ZSzpAHHo9w38T9efqE5QnCc=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4g4fm32f6mzpSvH;
	Tue, 28 Apr 2026 20:25:39 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id BBFC240576;
	Tue, 28 Apr 2026 20:32:14 +0800 (CST)
Received: from [10.174.179.24] (10.174.179.24) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 28 Apr 2026 20:32:13 +0800
Subject: Re: [PATCH V1 1/3] ACPICA: IORT: Add Root Complex PASID Flags field
To: Jason Gunthorpe <jgg@ziepe.ca>, Vidya Sagar <vidyas@nvidia.com>
CC: <rafael@kernel.org>, <lenb@kernel.org>, <saket.dumbre@intel.com>,
	<lpieralisi@kernel.org>, <sudeep.holla@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <joro@8bytes.org>, <robin.murphy@arm.com>,
	<nicolinc@nvidia.com>, <praan@google.com>, <vsethi@nvidia.com>,
	<sdonthineni@nvidia.com>, <kthota@nvidia.com>, <sagar.tv@gmail.com>,
	<linux-acpi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<acpica-devel@lists.linux.dev>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
References: <20260423191417.2031652-1-vidyas@nvidia.com>
 <20260423191417.2031652-2-vidyas@nvidia.com>
 <20260423224318.GT3611611@ziepe.ca>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <e092b85e-9ac2-22ef-b213-1b2a32fbf784@huawei.com>
Date: Tue, 28 Apr 2026 20:32:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20260423224318.GT3611611@ziepe.ca>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.24]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_053428_743179_119FA99E 
X-CRM114-Status: GOOD (  16.70  )
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

On 2026/4/24 6:43, Jason Gunthorpe wrote:
> On Fri, Apr 24, 2026 at 12:44:15AM +0530, Vidya Sagar wrote:
>> The IORT spec, Issue E.c (ARM DEN 0049E.c, January 2022), bumps the
>> Root Complex Node to revision 4 and adds two PASID descriptors:
>>
>>    - PASID Capabilities at byte offset 33 (2 bytes), bits[4:0] of which
>>      report the Max PASID Width supported by the Root Complex.
>>    - Flags at byte offset 36 (4 bytes), bit 0 of which reports whether
>>      the Root Complex itself supports PASID. This is distinct from the
>>      existing ATS Attribute bit 2 (at offset 24) that only reports
>>      whether the RC forwards PASID information on translated
>>      transactions.
>>
>> The ACPICA struct in include/acpi/actbl2.h was updated for the E.c
>> PASID Capabilities descriptor (offset 33) but stops short with a
>> trailing 'u8 reserved[]' flexible array, so the new Flags field at
>> offset 36 is unreachable and the existing ACPI_IORT_PASID_*
>> definitions have no consumer.
>>
>> Replace the trailing flexible array with a fixed 'u8 reserved[1]'
>> followed by 'u32 flags' so the struct fully covers RC node revision 4,
>> and add the ACPI_IORT_RC_PASID_SUPPORTED mask for bit 0 of the new
>> field. With #pragma pack(1) in effect for actbl2.h, this lands the new
>> field at the spec-mandated absolute offset 36.
>>
>> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
>> ---
>>   include/acpi/actbl2.h | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> There is a whole process to change this file, I went through it once
> for canwbs..
> 
> https://lore.kernel.org/acpica-devel/2-v3-e2e16cd7467f+2a6a1-smmuv3_nesting_jgg@nvidia.com/
> 
> You have to make a pull request here:
> 
> https://github.com/acpica/acpica/pulls

Yes, please get this patch merged in ACPICA first.

Thanks
Hanjun

