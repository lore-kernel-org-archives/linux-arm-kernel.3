Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45293C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 13:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DihpUshOA1iMkB0dRfTLl/pMzsh8ujAkX6htwmhsPgc=; b=47huyyPmQRYyhMECzAqr6UCFrh
	hseScrT7C53nzw+RUs3KIGunV6tLM2ejDSzdXa4rYpme3uinqLeFrTU9QQ79XFhoYAPEe/O982Kr1
	Z8rDgn4m8gmRQ76GY2HoFFbTiDMbdxCRLxZNHeLPcir5EvLaiD6rgwHh2gWV0HPBhLIin3aW7uF2x
	dJoo2UeJGl+kKBTN70onF4BJnLuJ/QkFE3oSlxZ3aJ2AisJpZ7yOXwur9f1wxviu18l6YqdGV/JDd
	87mim3awrIdvTgDevSnULIYEFGdkjcK3m50wLZcpThzPepqqR124X9E+Ho6av73DPenJBvSKY7HyL
	ws1cIGxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrF3M-00000001uA2-3yeT;
	Tue, 04 Aug 2026 13:19:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrF3K-00000001u9V-0PuV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 13:19:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7AC3E1476;
	Tue,  4 Aug 2026 06:19:24 -0700 (PDT)
Received: from [10.57.44.180] (unknown [10.57.44.180])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B7143F66F;
	Tue,  4 Aug 2026 06:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785849568; bh=NvRjT9Esb9qj9dSa9tEJ9J5zZySATr33Mf+UnG5bR7A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OMrE8whLpJFQBhveqqIbqAKKQcVRCbg591te1k+SA8QgvhFbMxmJHLashxhYfOgAi
	 juCGKJHjJl2XgtyAskltDE52iESHO+ckTd+1nhO8VxHE6lR4xaULOG3bJ9Zw+6LBpw
	 oUHfurqWDSK1GhkwDpTz/6+EFboAsUiSLESB6vGA=
Message-ID: <3b8d49be-f031-4134-bd20-a8c51632f4ad@arm.com>
Date: Tue, 4 Aug 2026 14:19:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 15/37] KVM: arm64: CCA: Handle RMI_EXIT_RIPAS_CHANGE
Content-Language: en-GB
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Steven Price <steven.price@arm.com>,
 kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Quentin Perret <qperret@google.com>
References: <20260715142841.80544-1-steven.price@arm.com>
 <20260715142841.80544-16-steven.price@arm.com> <865x1rcvfw.wl-maz@kernel.org>
 <f971d029-84d9-4c66-9875-36fa8f1a2a1b@arm.com> <86zez3b6ps.wl-maz@kernel.org>
 <7beafe29-0c5e-418b-8797-190f1850b18a@arm.com>
 <CA+EHjTx751071VhZPf6ABaZngTqOdPG+_aVLCTct_G_ksfYviA@mail.gmail.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CA+EHjTx751071VhZPf6ABaZngTqOdPG+_aVLCTct_G_ksfYviA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_061930_200033_A504403F 
X-CRM114-Status: GOOD (  15.88  )
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

Hi Fuad

Thanks for your feedback.

On 04/08/2026 13:20, Fuad Tabba wrote:
> Hi Suzuki,
> 
> + Quentin (who's on leave, but for when he gets back)
> 
> On Mon, 3 Aug 2026 at 16:30, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
> ...
>>> I.e don't hack into the API. Use the information you already have to
>>> decide whether you need to use the existing API at all.
>>>
>>> If that cannot be done for whatever reason, then you need to indirect
>>> the call with a set of operations that leave the existing code
>>> untouched.
>>
>> Please let us know if you think we need to explore this ^ ?
> 
> FWIW, pKVM already has this kind of indirection: in protected mode,
> the kvm_pgtable_stage2_* calls in mmu.c dispatch to the
> pkvm_pgtable_stage2_* wrappers through KVM_PGT_FN(), and the callers
> don't branch. It is global today because pKVM owns the whole host, but
> a per-VM version would let the CCA backend handle the filter and the
> IPA aliasing internally, keeping __unmap_stage2_range()'s signature
> intact. That should work for pKVM as well.

Sure, will explore this option. For the record, the patch here only 
passes down the "filter" parameter to __unmap_stage2_range() [ though
in a different name, only_shared ] and we still handle the aliasing 
inside the CCA code. Let me explore on this front.

Suzuki



> 
> Cheers,
> /fuad


