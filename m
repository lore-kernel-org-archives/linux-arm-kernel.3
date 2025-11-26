Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D933ED1118A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 17:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SEHyNpxhuTM6UTblssdrMq5WeQqf5U5sTe2un/ZyP9I=; b=LkzisgVmQ39yrKa1ydKaxQs03y
	AbD068XiVUMg24s/765yDbiQL9DGYsJyGdHaWJ+OuHoJ/ZkT9mjmtiLiCe0Ow4eMEIptFWq2L7/7q
	VFg/jPRJ3cVE5y3cnfrNA5mhRd1tmr1bAyOAHXG+ZDg3umET4Hl7PwZWdKha9T1FyI3c6qrqnmhJJ
	aK6Lh92rCQ520Rqie6S246oM9DjUOu0oXykRJqeQiY2NiUgfF1i5hp+9IgQ4rnh6KfFQq0857SvKP
	V5MEC19OQJj9J96SABCrFPCTokxZw6XavUBsQYqRhNAPRpaMBvRykWU7v00TLysf4nA2S0Aap9Buk
	rZt+Bmkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJ6d-0000000FNOb-2bM2;
	Wed, 26 Nov 2025 17:15:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJ6c-0000000FNOP-0f4l
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 26 Nov 2025 17:15:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SEHyNpxhuTM6UTblssdrMq5WeQqf5U5sTe2un/ZyP9I=; b=FW7V4w/fboOB8fql9koyc6hV+p
	6ijbsD6bNyABZquMjoVcZJ1XAUKQBrQAR4S/vWO7KbDdEsAXKBMyA748J8lDAWciFK9ck1tbHD9xv
	UCQ9hXPCBtghJeYi2jhgcMdyk+uDYBLcxzNp0iizOIvCN7WGGnYDU5HQw3nTT6/LJrf3WbxZz9Ln6
	j34U6W79YoQUyueZpRGW/fOSupDnajhbvD5oN/3hT7YxD+xE8d32IeG/gjjKGnx1YhJdrJpmv4zdg
	AzoaJmnP52JZKx50NJQ1Q3QVdEHcc942+mfsnG52F9hvKVOGxxjWpzus88REGMvFudvgBBvrEQY5s
	qRMF6+nQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIEy-00000008Twy-2I8n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 16:19:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BACE01692;
	Wed, 26 Nov 2025 09:14:49 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 19CB03F66E;
	Wed, 26 Nov 2025 09:14:55 -0800 (PST)
Message-ID: <60736c21-f4c7-4f76-87dd-acbad8c300fa@arm.com>
Date: Wed, 26 Nov 2025 17:14:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] KVM: arm64: Report optional ID register traps with
 a 0x18 syndrome
From: Ben Horgan <ben.horgan@arm.com>
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>,
 Zenghui Yu <yuzenghui@huawei.com>
References: <20251126155951.1146317-1-maz@kernel.org>
 <20251126155951.1146317-5-maz@kernel.org>
 <26d62f83-c5e2-4706-84ad-b3dbe313dfd1@arm.com>
Content-Language: en-US
In-Reply-To: <26d62f83-c5e2-4706-84ad-b3dbe313dfd1@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_161936_794732_975F2670 
X-CRM114-Status: GOOD (  13.45  )
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



On 11/26/25 17:10, Ben Horgan wrote:
> Hi Marc,
> 
> On 11/26/25 15:59, Marc Zyngier wrote:
>> With FEAT_IDST, unimplemented system registers in the feature ID space
>> must be reported using EC=0x18 at the closest handling EL, rather than
>> with an UNDEF.
>>
>> Most of these system registers are always implemented thanks to their
>> dependency on FEAT_AA64, except for a set of (currently) three registers:
>> GMID_EL1 (depending on MTE2), CCSIDR2_EL1 (depending on FEAT_CCIDX),
>> and SMIDR_EL1 (depending on SME).
>>
>> For these three registers, report their trap as EC=0x18 if they
>> end-up trapping into KVM and that FEAT_IDST is not implemented in the
>> guest. Otherwise, just make them UNDEF.
> 
> Missed it before but there is a stray 'not' in there. You get the
> EC=0x18 trap if FEAT_IDST is implemented.
> 
>>
>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>> ---
>>  arch/arm64/kvm/sys_regs.c | 16 +++++++++++++---
>>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> The code looks good.
> 
> Reviewed-by: Ben Horgan

Just to complete that tag.

Reviewed-by: Ben Horgan <ben.horgan@arm.com>

> 
> Thanks,
> 
> Ben
> 
> 

-- 
Thanks,

Ben


