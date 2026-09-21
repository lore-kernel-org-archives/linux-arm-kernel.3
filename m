Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0454C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 09:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fMYIHQgx69GNBUVA3OYGBFtoC/ciMIk7Rmfg7wwuKas=; b=zmURB6sQwpg9KS7FtrFx92H9MX
	DH0243QvzJsQ4EHb2rggk5Cv8MqEpnCyck6k8ZhiHuH226WQxyEzGI7INsnChn3YGp1oH3re3C/Gc
	o6JnKhQoXm8jJV7sqFbKWM8wG3ID8qPAd7VkLhSGBMaQ5B/bamLLjJYdLxbZTgpAcnzItP5SWu7xQ
	IH1n7tQQuw8sw1r2GDtXyc7gkVfoQU/FZhEVHGBZ2vYeDFbIodsvVdu20Mbq9AH2VqmkkJmmnJjmP
	jpgZedHy5IfLf8G0VogwXcH7+aGMoToLBXo+GdoRTnMe5HVUqKSFMqVPbTSugVDpANh9wBA+oaUF5
	fbYivlfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Zsy-00000001QSC-2L8f;
	Mon, 21 Sep 2026 09:00:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Zsv-00000001QRV-2Zym
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 09:00:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39BAD1CE0;
	Mon, 21 Sep 2026 02:00:21 -0700 (PDT)
Received: from [10.0.128.141] (unknown [10.0.128.141])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ECAE23F86C;
	Mon, 21 Sep 2026 02:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789981224; bh=7FAGCstgztp6bQyjfL+K1zBPkIxsy8V7zCgPNPDJtbQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oSa5BooeCN2HgtM8aUls3mxHMY3MXyU2nS3pbxXQChhKBqdmgK734c/lj7eVm0YO9
	 ZSKEbPNyh17gcrccayHqVU+68ufFTY1lZApU7H+TSnRhywToCaqGZxCnn+xzsn72jW
	 7MGPpF9u5Wz+sBuB3BdBclgAlWKwK0iyJ/u15DDo=
Message-ID: <f0a4672d-c7f2-42d4-9fc7-b5a1d0ad3b83@arm.com>
Date: Mon, 21 Sep 2026 10:00:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 2/7] firmware: arm_rmm: Check for RMI support at init
Content-Language: en-GB
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
 <20260912083611.2513845-3-suzuki.poulose@arm.com>
 <178978126541.2352296.3637463397103730192.b4-review@b4>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <178978126541.2352296.3637463397103730192.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_020025_696691_A0AD95B2 
X-CRM114-Status: GOOD (  17.23  )
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

On 19/09/2026 02:27, Jonathan Cameron wrote:
>> Query the RMI version number and check if it is a compatible version.
>> The first two feature registers are read and exposed for future code to
>> use.
>>
>> We only support this for Little Endian kernels, the Big Endian kernel
>> support is anyway marked BROKEN and is being removed.
> 
> Can we have a small comment here on why the default is y
> 
> It's a big thing to opt into by default.  Feels like defconfig
> material maybe but not in the Kconfig defaults unless I'm missing
> something.

We need this for KVM arm64. I could drop the default here and
KVM selects this anyways. But, how far do we go on this ?
Do we need to be able to disable this completely even for KVM ?

As such it is a relatively smaller blob:

$ size drivers/firmware/arm_rmm/rmi.o
    text    data     bss     dec     hex filename
    7477     572       1    8050    1f72 drivers/firmware/arm_rmm/rmi.o

Cheers
Suzuki

> 
> 
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
>> diff --git a/drivers/firmware/arm_rmm/Kconfig b/drivers/firmware/arm_rmm/Kconfig
>> new file mode 100644
>> index 000000000000..82724ee23186
>> --- /dev/null
>> +++ b/drivers/firmware/arm_rmm/Kconfig
>> @@ -0,0 +1,26 @@
>> +
>> +config ARCH_SUPPORTS_RMM
>> +	bool
>> +
>> +config ARM_RMM_RMI
>> +	bool "Realm Management Interface (RMI) Support"
>> +	depends on ARCH_SUPPORTS_RMM
>> +	default y
> Really? Why?

> 


