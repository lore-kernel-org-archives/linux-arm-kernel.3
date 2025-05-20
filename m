Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF01C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 15:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M0VMEs7oAs6Xoo1tn26dPwrFcGNpbVoISfKP3beDXbY=; b=fnwoest4RMr0arkTJzxSJe6jou
	JMHDXe2eG6SyskdhYkFM3emfScC8iarrj54XFaFhbaoFgtGyNl0uREd+Mbzsn+HKRz7b/XzsVxqca
	9SVWzYC4aplotRxcInIuA1HbnZgo84NGnBfzxHQpp5GwfFWgc4utRziXgcusKSEcUYQvCUdsQgNNl
	QSDgchwf+Dp0wHp/GLh2N5wPlz1QRViAyFPXUBOkQ1lb4kO24TWxxFPr8As2dTjlUaRBsqblhj6PG
	eMEB2TWpEAw0QtExs+WhX3FRDmRwS4aZy7amzo7/lY1mErT6PC+P4Oq+XaPaXvTLtOfxXYiYF3pZO
	xBFOEXVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHOSj-0000000DFxF-3HEl;
	Tue, 20 May 2025 15:01:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHOQd-0000000DFas-0vqu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 14:58:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D9F31516;
	Tue, 20 May 2025 07:58:37 -0700 (PDT)
Received: from [10.57.50.40] (unknown [10.57.50.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 70A563F6A8;
	Tue, 20 May 2025 07:58:47 -0700 (PDT)
Message-ID: <22a6cdd0-4fa3-4548-9c9f-ce8605694261@arm.com>
Date: Tue, 20 May 2025 15:58:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 20/43] arm64: RME: Runtime faulting of memory
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-21-steven.price@arm.com>
 <3a04995a-524c-4d07-8c8b-82930f9bca72@arm.com>
In-Reply-To: <3a04995a-524c-4d07-8c8b-82930f9bca72@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_075851_306182_5C4ADE6D 
X-CRM114-Status: GOOD (  12.26  )
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

On 19/05/2025 18:35, Suzuki K Poulose wrote:
> Hi Steven
> 
> On 16/04/2025 14:41, Steven Price wrote:
>> At runtime if the realm guest accesses memory which hasn't yet been
>> mapped then KVM needs to either populate the region or fault the guest.
>>
>> For memory in the lower (protected) region of IPA a fresh page is
>> provided to the RMM which will zero the contents. For memory in the
>> upper (shared) region of IPA, the memory from the memslot is mapped
>> into the realm VM non secure.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>

>> +    } else {
>> +        map_level = 3;
>> +        map_size = RMM_PAGE_SIZE;
>> +    }
>> +
>> +    for (offset = 0; offset < size; offset += map_size) {
>> +        /*
>> +         * realm_map_ipa() enforces that the memory is writable,
> 
> The function names seems to be obsolete, please fix.

Doh, it is in arch/arm64/kvm/mmu.c, please ignore this comment.

Suzuki

