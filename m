Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44256C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 08:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cel7TuSXnmZMXXeOunNZbvfVDjXa53o/wHhluaUwwAM=; b=VZiyVguSOtpTtaKX+/LxXy+kTG
	44hXI9btvV1F8wRNAhTbLVO04bhvteE9A0Zbrq1A7cdaev4SDgzbSXB8+nTLk66OdMVD4pjfOIUVH
	DJPwqX4RuWQJgJOjBnIjZdVG0X83lCKtvOdNL0SSesRUPfTR185rNjAEismZ3/ohK9YhjqqRjt/Ck
	jPn+urd22g/CTSDK6OwPmllQC2OucwCG6a8C7j/a9gg9/Di+sglsQVII/nrtcRmUYAtTO2j/aJbU3
	im43sBKUGlYayfkvYigTWPi1bfSpWasPK36OY3jCevd4ptWbDyKo0oCAVsJyYHRbhz4qgcnt7FOyL
	CITaIexw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1eD-0000000Cw7c-3iVr;
	Fri, 25 Sep 2026 08:51:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1eB-0000000Cw6e-0cFy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 08:51:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4820497;
	Fri, 25 Sep 2026 01:51:06 -0700 (PDT)
Received: from [10.57.10.88] (unknown [10.57.10.88])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E76743F86C;
	Fri, 25 Sep 2026 01:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790326270; bh=fZFt/ovr62lmtilpmcNcwd33GhGHy+KYsVKhY1PdPm4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rkoUn5FUz90XxWVaSzAEimdJbnnlRVmexbZxgfGtO1OW2VUJt/zq8SuVLin5teVD1
	 6pdYmN0XB4eKgrioqlZ7ePRIPiSoLnP5lKbipYQaQXotu4kYXb16rXynoJ/uD/2Byy
	 JLfGeL2sGWip+veR3zBdTlLGiNv99DaX5pCe0Oaw=
Message-ID: <c48703b3-3cd7-473d-8ae1-d6389e57b757@arm.com>
Date: Fri, 25 Sep 2026 09:51:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 2/7] firmware: arm_rmm: Check for RMI support at init
Content-Language: en-GB
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-3-suzuki.poulose@arm.com>
 <1ffe72ff-f20b-4621-a586-10e0358fee67@redhat.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <1ffe72ff-f20b-4621-a586-10e0358fee67@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_015111_387103_E67962A9 
X-CRM114-Status: GOOD (  17.39  )
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

On 25/09/2026 01:00, Gavin Shan wrote:
> On 9/24/26 11:51 PM, Suzuki K Poulose wrote:
>> From: Steven Price <steven.price@arm.com>
>>
>> Query the RMI version number and check if it is a compatible version.
>> The first two feature registers are read and exposed for future code to
>> use.
>>
>> We only support this for Little Endian kernels, the Big Endian kernel
>> support is anyway marked BROKEN and is being removed.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>> v19:
>>   * Read all implemented RmiFeatureRegisters - 5
>>   * Use ARRAY_SIZE(rmi_feat_reg_cache) for the loop in 
>> rmi_read_features()
>>   * Fold rmi_features() into rmi_read_features
>>   * Fix comment for rmi_smccc_invoke()
>>   * Drop default y
>>   * Add retry for RMI_BLOCKED and return to caller
>> v18:
>>   * Always use arm_smccc_1_2_invoke() for all RMIs making sure the 
>> unsused
>>     parameters are 0 - Sashiko
>>   * Move rmi_features() calls away from the arm-rmi-cmds.h to rmi.c - 
>> Gavin
>> v17:
>>   * Rename ARM_RMM to ARM_RMM_RMI to make it easier to add Guest 
>> facing RSI
>>     support, which is also in progress
>> v16:
>>   * Update Kconfig text to include PCIe TDISP.
>>   * Export rmi_feat_reg() here rather than in a later commit.
>> v15:
>>   * The code is moved again, this time into the 'firmware' directory.
>> v14:
>>   * This moves the basic RMI setup into the 'kernel' directory. This is
>>     because RMI will be used for some features outside of KVM so should
>>     be available even if KVM isn't compiled in.
>> ---
>>   arch/arm64/Kconfig                |   1 +
>>   arch/arm64/kernel/cpufeature.c    |   1 +
>>   drivers/firmware/Kconfig          |   1 +
>>   drivers/firmware/Makefile         |   1 +
>>   drivers/firmware/arm_rmm/Kconfig  |  25 +++++++
>>   drivers/firmware/arm_rmm/Makefile |   2 +
>>   drivers/firmware/arm_rmm/rmi.c    | 109 ++++++++++++++++++++++++++++++
>>   include/linux/arm-rmi-cmds.h      |  48 +++++++++++++
>>   8 files changed, 188 insertions(+)
>>   create mode 100644 drivers/firmware/arm_rmm/Kconfig
>>   create mode 100644 drivers/firmware/arm_rmm/Makefile
>>   create mode 100644 drivers/firmware/arm_rmm/rmi.c
>>   create mode 100644 include/linux/arm-rmi-cmds.h
>>
> 
> Some nitpicks below, with them addressed:
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> 

Thank you Gavin, much appreciated ! I have addressed the comments below
and the Makefile one.

Cheers
Suzuki

