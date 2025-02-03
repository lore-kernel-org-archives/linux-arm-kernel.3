Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C12C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 16:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+KrUaLXxmKJEX5VU5idMzDp4PPK6gALHrlpnjV/hF34=; b=oVDWWt/DlTiFh18nG781Nm29i4
	Oq4yXqj9sIQWfmB8B/KXFymhoNc3+EXy0QAXQN7Y0DIVD6vLa+qao1TpLTYSU3Qdu/6iV/N9BQAXo
	tPQeRutZc4afKXsWVVETLAryguE/NoNWu8fFWx1TdrkcoF4cJYl4lV3kcdKyPqiVeJBf+8L5oXb38
	llB3zYs0ZBHW6eFfECncXM2wABlxG7RiWMzsuia/0Klp/lKszTY5rB6oszuLR90vHFuv4dZ7TpTQb
	g3C5W0vhZiey8qpgpn1aUwSl10pXYOe7znQkLcMjUU2qqTS5oCxOfmPS3z5betvY27V9qj98JgcVV
	VaA4ivNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tezU8-0000000G1ai-1uxQ;
	Mon, 03 Feb 2025 16:39:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tezOl-0000000G0eL-1X3A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 16:34:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDD3D11FB;
	Mon,  3 Feb 2025 08:34:33 -0800 (PST)
Received: from [10.1.34.25] (e122027.cambridge.arm.com [10.1.34.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71D883F63F;
	Mon,  3 Feb 2025 08:34:05 -0800 (PST)
Message-ID: <38e5705c-5a78-48cc-8af5-b7c5491283af@arm.com>
Date: Mon, 3 Feb 2025 16:34:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 17/43] arm64: RME: Handle realm enter/exit
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-18-steven.price@arm.com>
 <18faf27b-f430-4e68-9122-28f439d3bbbd@redhat.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <18faf27b-f430-4e68-9122-28f439d3bbbd@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_083411_444336_3A70FB39 
X-CRM114-Status: UNSURE (   5.38  )
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

On 29/01/2025 23:41, Gavin Shan wrote:
> On 12/13/24 1:55 AM, Steven Price wrote:
[...]
>> +
>> +    kvm_pr_unimpl("Unsupported exit reason: %u\n",
>> +              rec->run->exit.exit_reason);
> 
> s/kvm_pr_unimpl/vcpu_pr_unimpl

It's vcpu_unimpl(), but sadly that attempts to print 'RIP' which is x86
specific (and would be nonsense for a realm guest anyway).

The other s/kvm_err/vcpu_err/ changes all make sense.

Thanks,
Steve


