Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC637C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 10:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IM8NoM49A+ozaM0Om6T6zXkX9aE+Qkum0L985twKnxk=; b=KKaK5zQV/hWj4w1FQ9xvn0EcLe
	EWfLOgm6hVvNgpKUEHUH5jlSmqFp9N0J5E/Zuw4r3SgPT8CujYOII5pga3GNWmK3orp54GKTQ0qow
	3C4isOaMUlIoLQXcygc07gnOISvG8ekjoZ/VG6buW1L9OBDvCwLXBoyeZqWfQrBvr4HeM/iej1Mqi
	COHmRbUjJ+qPKJScvapj+IaDB/7vhmSjwbUPdUApAzHqEVR7234ssGOWxH22EYsBWVM7kTO5nrEB+
	qIUB17h5iwLS36mjk9S2ibfuTgM+e9J0hYuLbKl8s3zzsoFBUqtxw2ZIydHWdf5x8EXUrqZ6ESSor
	nRG9gh/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Rb1-00000001koT-0mRB;
	Fri, 04 Sep 2026 10:56:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Ray-00000001knv-2f2g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 10:56:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87EB5153B;
	Fri,  4 Sep 2026 03:56:25 -0700 (PDT)
Received: from [10.57.81.239] (unknown [10.57.81.239])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F2533F673;
	Fri,  4 Sep 2026 03:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788519389; bh=Jo0Cg8nB4834KwQthZNdLPhYT1OJ9nMS3OZvbrsYpgI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S2rNmhuTTmENs918kTR+Q1XiOPxk9ktuHnukft7JoZ92m+dYWAtk5PqOQ/TfRAMp8
	 bDALhVnplbiEnx2XLIpzsuIvyHVlcN/TSD7l+dGLfUtdERLg8jTfAMUglWLLiKleJo
	 7qGXyqfOJ0GL33LVnVUxEzrw4r7KufRGNKImHiTg=
Message-ID: <78638e8a-4919-4c2b-b6d8-dadc7a981709@arm.com>
Date: Fri, 4 Sep 2026 11:56:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: hugetlb: fix BBM for mprotect() on contiguous PTEs
To: Will Deacon <will@kernel.org>, Dev Jain <dev.jain@arm.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 David Hildenbrand <david@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20260901131823.15799-1-kmehltretter@gmail.com>
 <551663b9-d031-4755-af7f-dc6c22524b35@arm.com>
 <aplP1oUjx96O_I69@willie-the-truck>
From: Ryan Roberts <ryan.roberts@arm.com>
Content-Language: en-GB
In-Reply-To: <aplP1oUjx96O_I69@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_035632_784083_3A0C0FA0 
X-CRM114-Status: GOOD (  26.89  )
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

On 03/09/2026 11:45, Will Deacon wrote:
> On Wed, Sep 02, 2026 at 08:16:36PM +0530, Dev Jain wrote:
>>
>>
>> On 01/09/26 6:48 pm, Karl Mehltretter wrote:
>>> huge_ptep_modify_prot_start() clears a hugetlb entry before changing its
>>> permissions. For contiguous PTE mappings, break-before-make (BBM)
>>> requires a TLB invalidation after clearing the set and before making any
>>> entry valid again.
>>>
>>> Commit fb396bb459c1 ("arm64/hugetlb: Drop TLB flush from
>>> get_clear_flush()") removed this invalidation, relying on the deferred
>>> flush from the core code. Commit 410982303772 ("arm64: hugetlb: Restore
>>> TLB invalidation for BBM on contiguous ptes") restored it for
>>> huge_ptep_set_{access_flags,wrprotect}(), since a deferred flush is too
>>> late for the break step. The modify-prot path has the same problem.
>>>
>>> Use huge_ptep_clear_flush() for contiguous entries so that the TLB is
>>> invalidated during the break step. Leave huge_ptep_get_and_clear()
>>> unchanged because it is also used by teardown paths, where the deferred
>>> flush is sufficient.
>>>
>>> Fixes: fb396bb459c1 ("arm64/hugetlb: Drop TLB flush from get_clear_flush()")
>>> Assisted-by: LLM
>>> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
>>> ---
>>
>> The transition happening here is:
>>
>> old_prot+cont -> zero -> new_prot+cont ... (i)
>> and then TLB flush.
>>
>> Arm Arm rule R_JQQTC says:
>> "For a TLB lookup in a contiguous region mapped by translation table entries
>> that have consistent values for the Contiguous bit, but have the OA, attributes,
>> or permissions misprogrammed, that TLB lookup is permitted to produce an OA,
>> access permissions, and memory attributes that are consistent with any one
>> of the programmed translation table values."
>>
>> This implies that a live update like
>> old_prot+cont -> new_prot+cont then TLB flush ... (ii)
>>
>> is safe. Which should also imply that the transition (i) is safe,
>> since the configurations the PE can observe for (ii) is the same
>> for (i), except that in (ii) the PE can fault too, which is fine.
> 
> I'm not sure I agree. As written, the text above says that if the
> permissions are misprogrammed (which they are in this case) then the TLB
> can produce an OA consistent with any of the entries. Hopefully it just
> needs some further clarification.

I'm not sure I understand your concern here. Is your concern that the OA could
be pulled from one of the invalid entries? The intent is that any entry that
does not have the VALID bit set is not considered an "entry" within the
"contiguous range" for the purposes of this. (because it is invalid).

That's implied (if you squint) from:

IPGVGZ: The Contiguous bit is present only in valid Block and Page translation
table descriptors, and therefore neither of the following configurations are
considered as misprogramming of the Contiguous bit:
  - A contiguous range of descriptors that are each either invalid, or valid
    with Contiguous set to 1.
  - A contiguous range of descriptors that are each either invalid, or valid
    with Contiguous set to 0.

In general I am of the opinion that the rules around contiguous mappings are not
as clear as they could be and the VMSA architect has indicated that he hopes to
clean them up over time. Bit I don't quite see your concern in this case.


> 
> There are probably also cases where we're changing the attributes and the
> permissions at the same time, so it's not clear to me that it's safe to
> allow those to be inconsistent (e.g. tagged/guarded vs read/write). If
> I was going from untagged read/write -> tagged read-only then I presumably
> wouldn't expect to see a tag check fault on a write?

Again, I'm not sure I follow, but I'll take a stab. I think you're implying that
a write permission fault should take precedence over a tag check fault? (I have
no idea off the top of my head). And you're further implying that with this
transition the HW might see an intermediate "tagged read/write" entry, and if it
does then it will raise a tag check fault, not a write fault for an attempted
write. But I don't see how R_JQQTC permits that because it says "consistent with
any one of the programmed translation table values" so the HW can't pick
attributes from one entry and permissions from another. It will either see the
old "untagged read/write" or the new "tagged read-only".

Sorry if I've missed the point!!

Thanks,
Ryan


> 
> Will


