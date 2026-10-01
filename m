Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273B7CA5FD6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 16:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hkI4B0+a9WH2Ce9DKIS5MASTZ5XWugplj40QV3OBLOM=; b=wUUm8arupon2NB++Q0TTe78jSe
	+PtayHod/ibGn5TVA60c8pgeq0PdT5F5Ut99FCwvD7y16jC10d0FlhCDKuJjCblbkOWywnzt1l9vO
	Aki0Z5ZAEv+HhiTzPrwueUGbIwXqeUKwBddeotKAtWvd9ihJbRjN5yFYCpY/Sh4YdFRRqmQszf++Z
	E+AO5MxM1zyitRlqGt8yBOPWABgWZMure1Xq6uaviMNaSFF9NCRMcw893Yl7xBHHLBIdin0SytaFA
	yIwy+XGjlA3VbgKLHcgFAGXEJfP2WwsoE1rjR/9xzTdJhnGpniTPpxlzI4LFYEjPP4w8GUiNuWL0C
	CZRydkSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJn4-00000009jhd-2bDZ;
	Thu, 01 Oct 2026 16:37:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJmz-00000009jg7-3rhs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 16:37:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A8D7497;
	Thu,  1 Oct 2026 09:37:41 -0700 (PDT)
Received: from [10.57.9.178] (unknown [10.57.9.178])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D8C683F85F;
	Thu,  1 Oct 2026 09:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790872664; bh=K9BrYtciJGkSxMEbrXtvHk2FbFP0IJ/JnLlba9Tczjs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BsV62LOqI5ja68sCQcFyb5ijD1CAgATdMGzmBFi4PPZQ2Nl1po/USPeOyjARfB1hR
	 4IW2nKeALWQxil1hxMsJbWCTmjfJWwrfaJRQWTlMxqg8rSgve5w/QmYdvcMHIJ7CR0
	 apDR+U8DfZ9vBePkOCIe3Wvt8ZYFIpX+pUeF5fiY=
Message-ID: <c8ea1847-0a92-46b2-a038-37a9d581e8b2@arm.com>
Date: Thu, 1 Oct 2026 17:37:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 22/22] KVM: arm64: CCA: Control user register access
 for Realms
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20260924160504.853911-1-suzuki.poulose@arm.com>
 <20260924160504.853911-23-suzuki.poulose@arm.com> <ar6CEXfo-AIYtq1J@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <ar6CEXfo-AIYtq1J@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_093746_147842_8891306B 
X-CRM114-Status: UNSURE (   9.66  )
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

On 01/10/2026 16:53, Catalin Marinas wrote:
> On Thu, Sep 24, 2026 at 05:05:04PM +0100, Suzuki K Poulose wrote:
>> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>
>> The RMM restricts the access to the register states that the host can
>> read/modify for a given Realm.
>>
>> e.g., At VCPU creation, can modify GPRS (x0-x30) and PC.
>>        While servicing SMCCC calls via RSI_HOST_CALL or servicing PSCI
>>        requests.
>>        MMIO emulation in the unprotected space.
>>
>> Additionally we use the sysreg configuration to advertise/configure the
>> following Realm parameters, which are required before the Realm Descriptor
>> :w
> 
> Should use Emacs ;)
> 

Dang it ;-) I have fixed it in v21. Thanks

Cheers
Suzuki


