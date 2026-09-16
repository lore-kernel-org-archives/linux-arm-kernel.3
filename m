Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412FEC982C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 15:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GWSnfUETFJ8IS5MyDxX07yaboTmHXjE+3Z4OhmUc6+s=; b=2e8ktwOmmSIYypTZc1CZycnxHH
	segRaZdWQaroBR8AaBlW6IeRiyefkLvw5dk0yQS0FZhA4DKSI42upwRzGZO3l3/3O6AyHG3obnzQV
	5nQ0DLN35EO/WtXqycrLVOwMMSC+UHUGjJTASG2C9KBeHiEGtW12mK7V0i+NJLOccOt6GX4cmMqMr
	s6wlvyYiZDWdZnDEhk1chKWBPgCA1OFaIjcJ75fB/E4wRKc10EaPSCp8d9jTtPR+fWGF8/YVHrh5K
	3yFY+fi6kbHFnsE+g/mzjuHOHkDRlOw/HCQ3VIvGoeUmcKUnIzfrHqgJ6qhhf3HeKMj+tb80eFB4v
	PPfmxz/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rSX-00000009Z6I-3IYe;
	Wed, 16 Sep 2026 15:22:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rSW-00000009Z5g-2Mho
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 15:22:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GWSnfUETFJ8IS5MyDxX07yaboTmHXjE+3Z4OhmUc6+s=; b=SagfuKLt8Bt3aL2DHWqV90C9M5
	VUrse2iot0hHBPD8IPL2AfS7WQw7tSkRIfmGDKQlEeO6Ic23chGhVzb+VvN0DeO0kx+0qYbhy4kG2
	SrzcPIUsmtMK5NHhl9XZuNBb2TV+jNMysjQ3jdlirnCtbAYsW6nQXIC123oFy1mimEVf5j9+XYiuC
	gaQd9KEadgxFuY0+S97t8qRLrfkQBK1lMsV2tVQug+5KYNdwl7Icxa1HaqFuTfaIg3HV5QWcexDnl
	A4XWq51ukfdjif1FEMn7/wOEnUYhPe5nG1RQ8cfJu9qVUYXkRdTOF+bMQfxsz+kb95mSjfehvvtDA
	9ZeVboBQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6rSS-000000082Cl-36kp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 15:22:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF8FE1516;
	Wed, 16 Sep 2026 08:21:54 -0700 (PDT)
Received: from [192.168.4.158] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EAB3A3F86F;
	Wed, 16 Sep 2026 08:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789572118; bh=yLzqZqOmebTBUGiFGKZgcketuLUgJ8qsgeE7eEWH3WE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GvLhrGBrgZKQ6UXMR1KePllYx/JYkHFtc+ee1sTloowa55iV/kp0tYM9EhtuLmniH
	 I+zaQNzi/XSmbxH+mUYEgbR4/Gh6h8QSKEXJkA4bbi39s6Rm8oLQKJWj4baA1kl7ei
	 HRfBS4WSl9qLmbfTIAm9o8Ey3xM6GSWbycm80Q28=
Message-ID: <bb59b1e0-2550-4a9d-8738-a54e5f106f45@arm.com>
Date: Wed, 16 Sep 2026 16:21:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/7] arm64: realm: Move Realm memory encryption ops to
 RSI code
Content-Language: en-GB
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Jason Gunthorpe <jgg@nvidia.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Greg KH <gregkh@linuxfoundation.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
 Andre Przywara <andre.przywara@arm.com>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
 <20260914060511.277948-5-aneesh.kumar@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260914060511.277948-5-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_162201_802635_F430773C 
X-CRM114-Status: UNSURE (   7.65  )
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

On 14/09/2026 07:05, Aneesh Kumar K.V (Arm) wrote:
> Realm memory encryption callbacks are CCA-specific. Keep the Realm callback
> registration with the RSI initialization code instead of pageattr.c, which
> only needs to provide the low-level page-attribute transition helper.
> 
> Export __set_memory_enc_dec() within arm64 so the RSI code can wrap it with
> the Realm-specific encrypt/decrypt callbacks and warning policy.
> 
> No functional changes in this patch.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@ram.com>


