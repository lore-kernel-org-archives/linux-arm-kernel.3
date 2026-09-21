Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EC2C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 10:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C4wYZlc/qQMgTe04jHDjaGrlbvA6eb7ylxMAolUqBcg=; b=zjDaEcBQQ887TAl6jXHnw08cQx
	TSwW4N5RXs+HA7KXNXIjgV6Td71sDljqZYzasEx7M1sLLn+pYEk+03ERCTOHUGcW+DYFiTICWQ7fv
	vEXNcvIEXO7YKJ/lTQ7mUzhjNXBslT6krczF0NIfILZYywyPM8El5yi8uotUhCdcKDdwvTq/FF0mj
	4vVNhhaRhI0zkThSnk0siDdj6VnkIVn6VqfUvYaz61Egh6UXE8it2zm3nT2FiMtvFDjK2bwjC6wBT
	mxMpHtFVnuIU4iVbS7mAeVeRo4inE4FahK5KYgwrG0JHr8kBaBV63Vx8XIan+ZKlRW5bFyjqWN79l
	n8N4qJAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8aot-00000001bs2-16sB;
	Mon, 21 Sep 2026 10:00:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8aor-00000001bqp-0C8L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 10:00:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD5B6153B;
	Mon, 21 Sep 2026 03:00:11 -0700 (PDT)
Received: from [10.0.128.141] (unknown [10.0.128.141])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED95B3F86F;
	Mon, 21 Sep 2026 03:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789984815; bh=KAHxQyCLffudv7kQ3tADcUX1WeHMPGpfPiNr5Zb4Uh8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XIoXtAaMDOmRwnyu8sQf9DbMLWTCBU9V5oWmQUBvvcAE0iV7BleEDJn/HYfi8FPS4
	 WURSswpMLg10IEqSoRXoWQTAKT605tz3LQp9wSC1XsWgay3+UaMl75Zq22llLh57WA
	 qG+44nuymFX6VWTfsKEBT31BtsVckOC8JfB6jbVg=
Message-ID: <f927f542-cf96-4dd3-a4ec-94883ba10ce6@arm.com>
Date: Mon, 21 Sep 2026 11:00:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 4/7] arm64: realm: Move Realm memory encryption ops to
 RSI code
Content-Language: en-GB
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
 Greg KH <gregkh@linuxfoundation.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Suzuki K Poulose <suzuki.poulose@ram.com>
References: <20260921053807.354802-1-aneesh.kumar@kernel.org>
 <20260921053807.354802-5-aneesh.kumar@kernel.org> <arDwTjQiqF6VZOau@arm.com>
 <yq5a5wzz3rfo.fsf@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <yq5a5wzz3rfo.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_030017_139478_3B5BC975 
X-CRM114-Status: UNSURE (   8.41  )
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

On 21/09/2026 10:05, Aneesh Kumar K.V wrote:
> Catalin Marinas <catalin.marinas@arm.com> writes:
> 
>> On Mon, Sep 21, 2026 at 11:08:04AM +0530, Aneesh Kumar K.V (Arm) wrote:
>>> Realm memory encryption callbacks are CCA-specific. Keep the Realm callback
>>> registration with the RSI initialization code instead of pageattr.c, which
>>> only needs to provide the low-level page-attribute transition helper.
>>>
>>> Export __set_memory_enc_dec() within arm64 so the RSI code can wrap it with
>>> the Realm-specific encrypt/decrypt callbacks and warning policy.
>>>
>>> No functional changes in this patch.
>>>
>>> Reviewed-by: Suzuki K Poulose <suzuki.poulose@ram.com>
>>
>> Nit: Suzuki's still at arm ;)

;-)

>>
> 
> 
> Will fix. I copied it from:
> 
> https://lore.kernel.org/all/bb59b1e0-2550-4a9d-8738-a54e5f106f45@arm.com

Yikes, my bad.

for FWIW, I really meant :

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


