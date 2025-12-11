Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E02D41C20
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 11:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s6DLzEYBrf1CuE2AoYiu5rXtg5UNMlmAQWLmj+GeWoA=; b=pCttvzNnubeSl1upIH1rdiTGHN
	XZuIx/vRcJpmBEWGk5iZ0DHZ8mPunfq+3uyAd4aYE7sog2IFbAGST5vM1tTmqPPzmTlIwBXJ+h01P
	QKHTUxWe6giROezjhswbXssHAeuYfCCadSH71HkXyGWb8S2z4Jvo+e4EfCLE4AKqcf/QiOh1I4hQ6
	m5Wu5jHLVw4PitAPgKz8ermUnYAioVfBc7fU7j5WIFwaYi2q2uM+c0U16qQmlxp9/IRGYvAbPDONd
	bLfYty3qdZTkejdY3G69lMpG6Aj/7nbBTDZgb6+ItR08edmfv/guhgiUKs59Ex89SpCdLb/ed1DI5
	cgo1PQbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTeTt-0000000GWIS-3leQ;
	Thu, 11 Dec 2025 11:05:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTeTr-0000000GWI0-1tbB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 11:05:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E32C175D;
	Thu, 11 Dec 2025 03:04:58 -0800 (PST)
Received: from [10.57.46.197] (unknown [10.57.46.197])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7028F3F740;
	Thu, 11 Dec 2025 03:05:04 -0800 (PST)
Message-ID: <47689561-ed13-4525-825d-60eb8c36ae4c@arm.com>
Date: Thu, 11 Dec 2025 11:04:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/io-pgtable-arm: Add misisng concatenated PGD cases
To: Will Deacon <will@kernel.org>
Cc: Mostafa Saleh <smostafa@google.com>, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 joro@8bytes.org, Tomasz Nowicki <tnowicki@google.com>
References: <20251130194506.593700-1-smostafa@google.com>
 <18a39079-2285-47fb-b306-040f2bc1bbaa@arm.com> <aTgX9qhaLyrQ5iye@google.com>
 <498bbad4-ea64-4a24-a63f-e131d271990a@arm.com> <aTjCDvtANr2WIv3L@google.com>
 <8e058f60-60da-47c2-9947-2ea26cca1639@arm.com> <aTonvd9_4hY4-CpS@google.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <aTonvd9_4hY4-CpS@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_030507_612489_71093AD5 
X-CRM114-Status: GOOD (  17.71  )
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

On 2025-12-11 2:09 am, Will Deacon wrote:
> On Wed, Dec 10, 2025 at 12:06:10PM +0000, Robin Murphy wrote:
>> On 2025-12-10 12:42 am, Will Deacon wrote:
>>> On Tue, Dec 09, 2025 at 01:33:36PM +0000, Robin Murphy wrote:
>>>> On 2025-12-09 12:37 pm, Mostafa Saleh wrote:
>>>>> On Tue, Dec 09, 2025 at 11:34:34AM +0000, Robin Murphy wrote:
>>>>>> On 2025-11-30 7:45 pm, Mostafa Saleh wrote:
>>>>>>> arm_lpae_concat_mandatory() assumes that OAS >= IAS which is not
>>>>>>> correct for SMMUs supporting AArch32, and have OAS = 32/36 bits,
>>>>>>> as IAS would be 40 bits.
>>>>>>
>>>>>> But that is only when *using* AArch32 format. The bit in chapter 3.4 of the
>>>>>> SMMU architecture is talking about the maximum IAS that an SMMU
>>>>>> implementation needs to be able to accommodate based on its configuration,
>>>>>> but it does then attempt to clarify that the actual IPA size in use by any
>>>>>> given context should depend on the VMSA format in use:
>>>>>>
>>>>>> "VMSAv8-32 LPAE always supports an IPA size of 40 bits, whereas VMSAv8-64
>>>>>> and VMSAv9-128 limits the maximum IPA size to the maximum PA size."
>>>>>>
>>>>>> Rule R_SRKBC in the Arm ARM lays out the exact T0SZ constraints with this
>>>>>> AArch32/AArch64 detail.
>>>>>
>>>>> I see, thanks a lot for the explanation, I got confused by the this
>>>>> statement:
>>>>> Note: If AArch32 is implemented, IAS == MAX(40, OAS), otherwise IAS == OAS.
>>>>
>>>> Indeed, that appears confusingly contradictory; I've filed a bug.
>>>
>>> I think the spec has always been worded like this. My reading is that, in
>>> isolation:
>>>
>>>     - VMSAv8-32 LPAE always uses a 40-bit IAS
>>>     - VMSAv8-64 has IAS == OAS and this can be smaller than 40 bits
>>>
>>> so if AArch32 is implemented, we know that the hardware supports at
>>> least a 40-bit IAS and in that case the VMSAv8-64 IAS can be bigger
>>> than the OAS.
>>
>> No, the VMSAv8-64 IAS can never be bigger than OAS, as that would violate
>> VMSA (see rules R_DTLMN and R_SRKBC). The SMMU spec seems mostly fixated on
>> the notional maximum IAS that an SMMU must accommodate in general across all
>> supported formats; the limitations of using any particular format must still
>> apply though (similarly, the fact that AArch32 has a fixed 40-bit output
>> doesn't mean that OAS and S2PS don't still matter for AArch64 format.)
> 
> A VMSAv8-32 stage-1 could still input a 40-bit IAS into a VMSAv8-64
> stage-2 when the OAS < 40-bit though, right? If that's the only case
> where this happens, then I agree we should ditch the complexity from the
> driver on the grounds that we don't ever use the 32-bit formats.

Yes, it is perfectly possible with either format to configure the S1 
*output* size (CD.IPS, or 40 when CD.AA64==0) to be larger than the S2 
input size (STE.S2T0SZ), and if S1 tries to use an IPA beyond the actual 
S2 range then it gets a S2 translation fault, per VMSA rule R_BZHGM.

Cheers,
Robin.

