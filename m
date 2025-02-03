Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B00BC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 16:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xOGq4rLxmBunifvlyEpZfqEMRVLG6BiwQh7XHxw+50=; b=S3Q5nc2WkJNFmK0K7VyKJ15QA5
	iUkCe8kSsk0us8W3xGpfL2wyQHdWB4q00YX1Vo42S65Xcc+LzP0+zL0Yr6cgHZi25k5PwqgmtUNm3
	4fUfGxHiHxs57pVAg7+ThA9kx+ol6lKBLS1XI0y7bwLal8frDA+oDpvaLXLE3PVAlR+c6CcavHrex
	z9BuFesoJiFWVAYiz243BWhyizIeq2Dsg9TMMxgx1TxrTFdotWOizTUTN4dg65CAiMeIx8EtI+LkU
	zdY1FPJ2o41PnJVzaoQ0f79jTgkYvCtg9soONU4SgvQpsuy6+W9Tt6GSkyoAc3WcChreB4wvJq6bd
	2NLVgrbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tezVR-0000000G1uv-0QO8;
	Mon, 03 Feb 2025 16:41:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tezOo-0000000G0ee-0tVF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 16:34:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C22371595;
	Mon,  3 Feb 2025 08:34:37 -0800 (PST)
Received: from [10.1.34.25] (e122027.cambridge.arm.com [10.1.34.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD43B3F63F;
	Mon,  3 Feb 2025 08:34:09 -0800 (PST)
Message-ID: <9d9bfaca-1cba-4e33-9aa6-b840f5c1da2c@arm.com>
Date: Mon, 3 Feb 2025 16:34:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/43] arm64: RME: Allocate/free RECs to match vCPUs
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Gavin Shan <gshan@redhat.com>,
 kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-13-steven.price@arm.com>
 <9a543b6f-5487-4159-89fb-73d9b6749a01@redhat.com>
 <9174bc24-6217-4663-a370-291d4790a212@arm.com>
 <d499c3e7-cc0f-467a-8401-bc53b70259f7@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <d499c3e7-cc0f-467a-8401-bc53b70259f7@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_083414_301362_558DD424 
X-CRM114-Status: UNSURE (   5.75  )
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

On 03/02/2025 11:18, Suzuki K Poulose wrote:
> On 30/01/2025 16:40, Steven Price wrote:
>> On 29/01/2025 04:50, Gavin Shan wrote:
[...]
>>> One corner case seems missed in kvm_vcpu_init_check_features(). It's
>>> allowed to
>>> initialize a vCPU with REC feature even kvm_is_realm(kvm) is false.
>>> Hopefully,
>>> I didn't miss something.
>>
>> Ah, yes good point. I'll pass a kvm pointer to
>> kvm_vcpu_init_check_features() and use kvm_is_realm() in there.
> 
> nit: kvm is available from the VCPU via vcpu->kvm

Absolutely correct, and what I wrote was nonsense ;)

What I meant was to pass a kvm pointer *from*
kvm_vcpu_init_check_features() *to* system_supported_vcpu_features() and
use kvm_is_realm() in there!

Thanks,
Steve


