Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC89C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 11:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DaNIX2j025yeaU7NnAHMui96w1iJpIV8wDqQ3CtWBQY=; b=MBtrQxn2iMqj3aKXdYH4mjvzSL
	1a6SKzd71YV+T2iT2PxgvdVICxn9AJVjIPj5R+VKL1CEK0hA3Mevmym56fnyOE3ZOUlfRVFW5UzHp
	O7NlFmsRnrenkEbu304zN2xpjQJJNxTcVoyrRyijsiK82syN2HkoS/YwhnwHR2ZMXfoKU95lTVXoe
	7UA4sldeNZ5CAoOb8qKKXlFqdUxPC3j735rz4z4f1dgcUd24w5TTfZzA7hFGdOOjlsS57rIdfeWN6
	V6JbzXG6sD1Xhxty5Ll927iB/CBxeHV2urYKb1jcOSasOZIScQeRf5ArmVGNwwqBxutFMC51DN5hB
	NQSAx9iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4GWD-0000000BZzn-1p3C;
	Wed, 09 Sep 2026 11:31:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4GW7-0000000BZyU-25Eq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 11:31:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B04761691;
	Wed,  9 Sep 2026 04:30:58 -0700 (PDT)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D8803F528;
	Wed,  9 Sep 2026 04:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788953462; bh=aaks7dx+zR/tpBzvxXxBPfKtmQBuOjd3Zh0Fj5FHgHg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lQJvoC0QzOh/jq7UI0GAjAsF1Q/iWY3o10jdXWoT7zw21KCbNnxAz5gfKurHMvfLu
	 mEI20XdJxFeoWkJ7JAon3rjfwkkBR1egM788NX6lI83FPrPP5JdxUh4It1jMLCQBak
	 p/xexTVknjsE6TV39WJPBmmPD5I0y63Rx5p+nJzI=
Message-ID: <3d75ad7b-cce9-4658-8af3-2269db91c76c@arm.com>
Date: Wed, 9 Sep 2026 12:30:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 03/20] KVM: arm64: Track the type of VM in kvm_arch
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev,
 gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com,
 alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com,
 lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260908162223.1683432-1-suzuki.poulose@arm.com>
 <20260908162223.1683432-4-suzuki.poulose@arm.com>
 <CA+EHjTybMZ1TORs25En0eb7_41FBcB=BK1ygYPy5cOHUnQO84A@mail.gmail.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CA+EHjTybMZ1TORs25En0eb7_41FBcB=BK1ygYPy5cOHUnQO84A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_043104_745389_5919230B 
X-CRM114-Status: GOOD (  11.01  )
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

On 09/09/2026 12:28, Fuad Tabba wrote:
> Hi Suzuki,
> 
> On Tue, 8 Sept 2026 at 17:23, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>>
>> KVM arm64 has different types of VMs with all the different modes in which the
>> hypervisor code can be run. e.g., VHE, nVHE, PKVM etc. Then there is protected
>> VM and normal VMs with PKVM. We might soon add other types, e.g., Arm CCA Realm.
>> So in an effort to make the handling of these different types of VMs a bit more
>> friendlier to the eyes, add a VM flavor to the kvm_arch and we could then add
> 
> nit: "friendlier"
> 
>> handlers for different operations based on the VM type.
>>
>> Keep the flavor initialisation at the beginning to allow for the detection
>> early enough and fail out on any unsupported requests. (e.g., protected on !PKVM)
> 
> In the commit msg and later in the code (not in the enum though), can
> you please spell pKVM with a lower-case p?

Ack.

> 
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers
Suzuki



