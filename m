Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B432ACA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 15:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0FbsqGz50RTBZJ+X3m8aEuHOl1lV5AL5kMONHKTMz8=; b=jgvasVaDvQ7cET+7sdMo7Zzp2w
	cion+Ye805jupBrgfaJnbCnV2CkLgo7PFQjFwLsdzoOEYeF19pncoSunoREbUGMkLRhekKZNiq3HY
	sxdljv7VpS/gPdWEFCvVhz6QGJR4qzkS0PdjcccMhhrD70sdBDrHDL4TQJwncicfP+HMItNGrxBZQ
	Vm9A3hjEAeolV8YIHF1TWdZQ0oAI0HU22OuLkYTYIwbyNW16UWb8nCmuP73pXQOisMoPmNOWFd8Fe
	L2zw9YSbtmMBDOtlyWw41czL47fJV4YKjm+yel8cOamTG4AoCfPw7KtKpj3R/vQMCZTDf5ltU3jKO
	dT2id8yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE6sK-00000001181-0L2d;
	Tue, 06 Oct 2026 15:14:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE6sF-0000000117X-1FuQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 15:14:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DED31516;
	Tue,  6 Oct 2026 08:14:30 -0700 (PDT)
Received: from [10.57.10.233] (unknown [10.57.10.233])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99A543F763;
	Tue,  6 Oct 2026 08:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791299673; bh=ZmhMumn52cBVQaHkyzR0XIkkVAJp/l8twjtlqe6zjx8=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=DGsSEVOWURmhvfqK1LRZ1Ng27xl1EsFRu6r6JfQaBf0tEQl3nESaa2L2g0Llyzd8i
	 SJHUOrivH5wKaf0b6Z+TIOIKEcDyXCBFmvnPLuiLB8i6+sxMt29rrMz4izp8Gvdwrm
	 vXNAxztKKB8E24738HK+TeNx2hx036YGrb5GeYyU=
Message-ID: <1ab7e5c2-a492-4980-a50b-57c431b9d4e7@arm.com>
Date: Tue, 6 Oct 2026 17:14:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 11/23] KVM: arm64: Add VM specific callback for S2 MMU
 operations
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, will@kernel.org,
 catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-12-suzuki.poulose@arm.com>
 <87a4or2nd5.wl-maz@kernel.org> <089e57c8-93ee-4384-a6d6-978bde917650@arm.com>
In-Reply-To: <089e57c8-93ee-4384-a6d6-978bde917650@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_081437_525760_6FAA30C1 
X-CRM114-Status: GOOD (  14.82  )
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

On 06/10/2026 11:36, Suzuki K Poulose wrote:
> On 06/10/2026 10:24, Marc Zyngier wrote:
>> On Mon, 05 Oct 2026 10:07:42 +0100,
>> Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>>>
>>> Add VM type specific S2 MMU operation backends which can be 
>>> initialized per
>>> VM flavor, to keep the handling cleaner.
>>>
>>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>> ---
>>> Change since v21:
>>>   - Define all vm_s2_ops call back. All calls are mandatory.
>>>   - Define callback for each flavor, disjointing the non-protetcted 
>>> pKVM and
>>>     normal KVM (VHE & nVHE) and remove the KVM_PGT_FN() hacks.
>>
>> It is a bit annoying that we still have part of the operations being
>> indirected by kvm_vm_s2_ops, and others by KVM_PGT_FN(), which is
>> still there. I was hoping that we'd have only one indirection. after
>> this patch.
> 
> I agree and I did think about it. The issue is, some of these calls are
> deep burried from the higher leve dispatcher callbacks (e.g.,
> user_mem_abort->kvm_pgtable_stage2_map). We could go all in and remove
> all of them if you are happy with that change. Also, some of the call
> paths aren't valid for certain VM types, that adds quite a lot of dummy
> callbacks (now that they all are mandatory. e.g., pVM or Realms).
> 

For the record, as discussed, there are callbacks that don't have a kvm
instance available, e.g. kvm_pgtable_stage2_free_unlinked() where we
only have a page and level. Further abstractions will be explored in a
future series.

Suzuki

> 
> Cheers
> Suzuki
> 
>>
>>     M.
>>
> 


