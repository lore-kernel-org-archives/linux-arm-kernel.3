Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99FFC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 19:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5wFO0srlv/idNi43/AiuJlFR1zWvELvDDs0nOZj/3w=; b=DzcsZYYikSo8BX1tnqn2blLush
	nEH2MsMz9Fq57MFUxGQ0itzbWy8cI0t/4sifji+jvQwqGSjCB/Enm/M6mg3yTvVJduAzPENem49dJ
	NWQHcReeGJgHzQ2eXATEzk5JHD0vfo+FerW3ZaE6LVaWJQ6nGOtiQ4WKjrE7MaOyjfVMef8pFB8HX
	my+8/kECCGGq4Tizr7zFekEaePqS9ei3TiApH1R9mrhm2mWWb9IEV9eHWh4rGTWgtw/iN6YoOyCsW
	9Tflzeecj6YmtYjRCi/OPbrppaUPO3m/hqAJUEOrcOnWAoRyxuLhSt+Rwegp0/L722FyWshiZtq1r
	HnolIlMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5ce-00000006psV-0pjs;
	Tue, 11 Mar 2025 19:50:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4F4-00000006btC-19JY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 18:22:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7BA7EA46149;
	Tue, 11 Mar 2025 18:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24A4AC4CEE9;
	Tue, 11 Mar 2025 18:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741717333;
	bh=twBnHx5MxmQiJsuf5M4X8oH5jsM0d98je1kAJCezQRc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aiSdc+/unKajtealI06ykugefgVZcMCiFo47wIxDcaoT17jRxCFqaSQxZpmcVtR7U
	 9hXlu6BKOnmmFAqgNaD0dzPhdyNZa3pZk3XMHk8Rw6iyjN7Ru0XKoa2Ic2MV8I2aOK
	 q31II4o92W4aBpvDg4xVZ3w7M+cm/F8q2tSAbJnAFbA3q5H2TFbYeDP1LbNbkvqNsc
	 TwQQbEfpemoj2ec04SeAvuKvNlAOPZjTsUqqgzjBLruVHMdchJMvcx/4/JPmSxbWgu
	 21uWULjuZJ2LgEM6qlL4xQzkYb7mnjt2Qvh0kZx7c2433MH0hjhLDX+c/vF17VA/mH
	 78wY9P7AXwDEA==
Received: from disco-boy.misterjones.org ([217.182.43.188] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1ts4F0-00CeC6-Ni;
	Tue, 11 Mar 2025 18:22:10 +0000
MIME-Version: 1.0
Date: Tue, 11 Mar 2025 18:22:10 +0000
From: Marc Zyngier <maz@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, Anshuman Khandual
 <anshuman.khandual@arm.com>, arm-kernel@lists.infradead.org, James Morse
 <james.morse@arm.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel
 <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland
 <mark.rutland@arm.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/8] KVM: arm64: ptdump: Test PMD_TYPE_MASK for block
 mapping
In-Reply-To: <Z9B8lyYEtL62ZzVb@arm.com>
References: <20250221044227.1145393-1-anshuman.khandual@arm.com>
 <20250221044227.1145393-2-anshuman.khandual@arm.com>
 <Z9B8lyYEtL62ZzVb@arm.com>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <43e4dd905ebc6424511bd230ceb47ac1@kernel.org>
X-Sender: maz@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 217.182.43.188
X-SA-Exim-Rcpt-To: catalin.marinas@arm.com, oliver.upton@linux.dev, anshuman.khandual@arm.com, arm-kernel@lists.infradead.org, james.morse@arm.com, will@kernel.org, ardb@kernel.org, ryan.roberts@arm.com, mark.rutland@arm.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_112214_451020_51E54394 
X-CRM114-Status: GOOD (  14.85  )
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

On 2025-03-11 18:10, Catalin Marinas wrote:
> On Fri, Feb 21, 2025 at 10:12:20AM +0530, Anshuman Khandual wrote:
>> Test given page table entries against PMD_TYPE_SECT on PMD_TYPE_MASK 
>> mask
>> bits for identifying block mappings in stage 2 page tables.
>> 
>> Cc: Marc Zyngier <maz@kernel.org>
>> Cc: Oliver Upton <oliver.upton@linux.dev>
>> Cc: James Morse <james.morse@arm.com>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: kvmarm@lists.linux.dev
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>  arch/arm64/kvm/ptdump.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
>> index e4a342e903e2..098416d7e5c2 100644
>> --- a/arch/arm64/kvm/ptdump.c
>> +++ b/arch/arm64/kvm/ptdump.c
>> @@ -52,8 +52,8 @@ static const struct ptdump_prot_bits 
>> stage2_pte_bits[] = {
>>  		.set	= "AF",
>>  		.clear	= "  ",
>>  	}, {
>> -		.mask	= PTE_TABLE_BIT | PTE_VALID,
>> -		.val	= PTE_VALID,
>> +		.mask	= PMD_TYPE_MASK,
>> +		.val	= PMD_TYPE_SECT,
>>  		.set	= "BLK",
>>  		.clear	= "   ",
>>  	},
> 
> Marc, Oliver - are you ok with this patch going in through the arm64
> tree?

Yup, looks OK to me.

Acked-by: Marc Zyngier <maz@kernel.org>

         M.
-- 
Jazz is not dead. It just smells funny...

