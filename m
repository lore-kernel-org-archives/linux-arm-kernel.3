Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D323CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 06:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22VuW4WkXbUR2+NPqXiKM+TUUBda6jUgd75Y43Zeb7Q=; b=iPYE+d7NRdFZXR8HEnc/JMlJMT
	QRn2803pXgjcplSZgMLayF87qycllCz/QNmKkkQdpsDRYQW1+M3dL1JhYVDs7f/5HtysmLacZWk15
	UpaSgF/zUBFwNrXsvD3uwfT+d6vBbgiWdpJtg7oYpUQy2BjgWR64byenuPD6FHCoFVEPER0i4dKKR
	mFu5B+tGmemwxLAocJP6P03mgXZFpdnRurmztmSH/XDwuBq3TTqYPXtbWDb6OB5Dr/BgulM20d8Mk
	yZDYG3sOUHMDkRni/S6W27kzySGLgU+TgofteFMJgcBVshwr+lM9PyN3dEqtCum57ZMsTCzLjS4Cm
	rYLtlXWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWX4-0000000AgyM-2Olr;
	Fri, 02 Oct 2026 06:14:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWX0-0000000AgxC-1kSs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 06:14:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F89E497;
	Thu,  1 Oct 2026 23:14:00 -0700 (PDT)
Received: from [10.57.8.170] (unknown [10.57.8.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C13A63F763;
	Thu,  1 Oct 2026 23:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790921643; bh=SsgMdMqkZr1vaFYa2pWzMon3Yxx21LaFdOWhNvtsxHI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kHY8wHRuh7AfhqfmWnl3om0ajgb5AMaYtPbLSREf67cyr9fQzKgGuW6QuNVVep6i+
	 mx+3mjbUcT9wAfk4c9eN+/NWjYGxVeLoLGD6tiQ0x02zHQvt3k+vGIAywx+gSpoOAN
	 /cTlusOHXXGyFfN625JjWdDyiYJmPux67oisSA+I=
Message-ID: <63211ffe-fbf7-490e-940a-f9028f9412f6@arm.com>
Date: Fri, 2 Oct 2026 07:13:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 00/23] KVM: arm64: CCA: Add basic plumbing for Realms
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
References: <20261001210703.1597150-1-suzuki.poulose@arm.com>
 <1ed590aa-a4bf-4980-82e1-185aee205909@redhat.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <1ed590aa-a4bf-4980-82e1-185aee205909@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_231406_718824_547B32E6 
X-CRM114-Status: GOOD (  10.87  )
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

On 01/10/2026 22:41, Gavin Shan wrote:
> Hi Suzuki,
> 
> On 10/2/26 7:06 AM, Suzuki K Poulose wrote:
> 
> [...]
> 
>>
>> NOTE: There is a conflict with Fuad's patch to drop the WARN for 
>> unknown vm
>> ioctls, that is queued in fixes.
>>
>>    https://lore.kernel.org/all/20260914093838.1082637-1- 
>> fuad.tabba@linux.dev
>>
>> This series is comprised of (3) and (4) above.
>>
>> The integration branch has been tested with the following components:
>>
>>    tf-RMM:   main branch (commit 5e6e2acd) compliant to RMM-v2.0-beta3 
>> [4]
>>    kvmtool: git@git.gitlab.arm.com:linux-arm/kvmtool-cca.git tag:cca- 
>> kvm-v20
>>
>> [0] Arm CCA KVM Support v16 : https://lore.kernel.org/ 
>> all/20260803134403.80630-1-steven.price@arm.com
>> [1] Linux firmware RMI v22 https://git.gitlab.arm.com/linux-arm/linux- 
>> cca/ cca/cca-host/fw_rmm/v22
>> [2] Linux GPF Host  https://git.gitlab.arm.com/linux-arm/linux-cca/ 
>> cca/cca-host/host-gpf/v19
>> [3] https://git.gitlab.arm.com/linux-arm/linux-cca/ cca/cca-host/kvm- 
>> v21/integration-v3
> 
> This branch doesn't exist. I guess it's "cca/cca-host/kvm-v21/ 
> integration-v2" instead?

Thanks for flaggging. My bad, I have pushed integration-v3 branch.
Both integration-v2 and v3 have the same kvm parts, but based on
different fw-rmm (v21 and v22 respectively, will be posted today).
So, please use the v3.

Kind regards
Suzuki



> 
>> [4] https://support.arm.com/documentation/den0137/2-0bet3/
>>
> 
> Thanks,
> Gavin
> 


