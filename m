Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA59CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T9GoGI26d/8xI4fhOgG0yAGTHjfZWzDmzVf3fiTgClk=; b=2bFzkVPU5IeiJcSp1KGe/zai0F
	4Y5RtmjO4u3pb+UW5oszueHDcyY6j0ZQ2iqMfmSvLEuNaqMmB3rVu8NNXVQBiSFUn9XRstoAnowCW
	p25sJ1c/31sW3Cl8XEiKMDxcjEE2Mo1z+RhbBHe6CWSYzQ/XggctqTrwaXiwzGJnO4f4PqPudB0aA
	g1Hy5GWtQ3bcbYd7+duCN+tiClAr/4gppgXKCoy3rQeaFCDxJXOZiujQ7tT03f7l8OmM8+23zajwz
	XeYZ8jwi2O9HSusA43a2UZeREVZObY8p7ELYRZYiXu+e/ePn7yW0lcVTqP3hgR9UQ3cBA5GI1lGKb
	eRy/++Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnpl-0000000FSbq-0rMN;
	Wed, 03 Jun 2026 15:48:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnpi-0000000FSao-2vrs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:48:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F44E3431;
	Wed,  3 Jun 2026 08:48:37 -0700 (PDT)
Received: from [10.57.26.22] (unknown [10.57.26.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B08E3F86F;
	Wed,  3 Jun 2026 08:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780501722; bh=gqLBwuKK3OfG+2a0A3qyNuqqqbc1gbuZmlk165lnpZE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c5DgxOOGAWdq2gXOK1CYNaWj3q4PadaF75H23goD8ixRkIMBbCsBhc0KJafpfQ9cn
	 hopzMfQm07oFUh6GpVXOV+lqiTE9x8k82v4kO7pw7KgQoOIHnzl8N9YyTyF4GkwcYP
	 HoKCswJlnkRICQ8rbMEBj/DT69d2cDnsIRQCMU4k=
Message-ID: <346a2ab7-6399-4ed3-bd4b-a1f2bd127e0e@arm.com>
Date: Wed, 3 Jun 2026 16:48:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 08/44] arm64: RMI: Ensure that the RMM has GPT entries
 for memory
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
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
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-9-steven.price@arm.com> <yq5aa4twt03b.fsf@kernel.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <yq5aa4twt03b.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_084842_787764_A7DBB487 
X-CRM114-Status: UNSURE (   6.62  )
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

On 19/05/2026 06:55, Aneesh Kumar K.V wrote:
>> +
>> +bool rmi_is_available(void)
>> +{
>> +	return arm64_rmi_is_available;
>> +}
>> +
> 
> Can we rename to is_rmi_available(void) ?

Sure, will do.

Thanks,
Steve

