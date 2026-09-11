Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E51C88E41
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 02:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbkVDCUl5OCCB3SlrpUgSYoL0UOn8ywwc5G7UkJ0gzg=; b=XHkwOyn1KjpclyTwRLMJ/q1+B9
	hNK9xWRw6QgofA5m8H/L3YQUALFHRWvCJCVTwRiEMiaZ7JXaZAfu55dPMkT6mPzpRWptzAD78Zh4h
	J2qHoS/5iT9+M2xsyd9IK1ynIPzhWU8xl+Ow/EvIoxJHzkGM2kDvXZQlBxpLHw89ZvC4UyPMGyMMt
	R1LTc3/SDuvbScFvGN9TDP3Yx/kQV4hvWqarUWmW5oolUGWA5OaWdcp7eVlUS23YM4i+K8tHonzAW
	ckqdNKVu/oCPSaTRa65klYY22PQ82F/q2YuZx1P1CkGx5xYEZPpLEQVbl2PI0pDWLcjqmeFzS9rDc
	yB+RkwCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4rOS-0000000Fjha-3vSa;
	Fri, 11 Sep 2026 02:53:36 +0000
Received: from smtp.jvdsn.com ([2603:c020:1:bd00::1:3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4rOP-0000000FjhE-0fTB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 02:53:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=jvdsn.com; s=mail;
	t=1789095211; bh=1RhRGsA/+i354nq29SKiIHFX5cjaUHf/p/lQTaN2tk8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=4/pB/uEYmTrLXPTvO0NmuWhXOUuRYJE0IWF9Re4C1MJhW80WoYEXPuSxueOCTWbFx
	 Sb3ghS3L4wanuWcb987JOWi5s/AEzDSn2NIo+zsqsNJUzqZYvetdpCfyzi0m7e8bp1
	 plSkHrBIcgArcQKVXl2j4m+6FEZJbuD+66NWdVA5cga/LmxaqhSrsV2kxE2bLzlZ10
	 Bcs2k/m9xNYxBLO2/F+caD7bZcr3HekTYiuzqg7k56rdeEuSTOFJEKcTljDp3PiqFM
	 dbr4ECVl4qm2PwplC9QnTulbMoOHFGYDrxxqgcOqVTOxg4yl1LGvFs/A/oV0JDKLXq
	 f4/8+iQv5TG9g==
Message-ID: <e1d45f87-de65-4ff2-903a-80fd2c0b3861@jvdsn.com>
Date: Thu, 10 Sep 2026 21:53:30 -0500
MIME-Version: 1.0
Subject: Re: [PATCH] crypto: testmgr - block Crypto API xxhash64 in FIPS mode
To: Eric Biggers <ebiggers@kernel.org>, Thomas Huth <thuth@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>
References: <20260303060509.246038-1-git@jvdsn.com>
 <abTuFto8Tc3mhRRe@gondor.apana.org.au>
 <64592fee-1956-4a70-a751-9ac3335cfc27@jvdsn.com>
 <9926908a-5f08-43ba-99dd-b83c7067d52b@redhat.com>
 <83d09aa1-729a-47a2-a8e9-381c74e92f42@jvdsn.com>
 <48f12b65-428d-4809-9735-18876b09e759@redhat.com>
 <20260910141456.GA1936@quark>
From: Joachim Vandersmissen <joachim@jvdsn.com>
Content-Language: en-US
In-Reply-To: <20260910141456.GA1936@quark>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_195333_281262_18210BC8 
X-CRM114-Status: GOOD (  23.74  )
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

Hi Eric,

On 9/10/26 9:14 AM, Eric Biggers wrote:
> On Thu, Sep 10, 2026 at 10:57:32AM +0200, Thomas Huth wrote:
>> On 10/09/2026 05.24, Joachim Vandersmissen wrote:
>>> Hi Thomas,
>>>
>>> On 9/9/26 9:36 AM, Thomas Huth wrote:
>>>> On 15/03/2026 01.43, Joachim Vandersmissen wrote:
>>>>> Hi Herbert,
>>>>>
>>>>> I don't think this one can be applied yet since dm-integrity
>>>>> still uses xxhash64 through the crypto API. This would break
>>>>> fips=1 systems that use it.
>>>> Out of curiosity: Wouldn't such a system be FIPS-incompliant anyway?
>>>> If xxhash64 isn't FIPS-compliant, nobody should use it for
>>>> dm-integrity there, right? So I doubt that there are any systems out
>>>> there that use fips=1 and use xxhash64 at the same time?
>>> There is a risk that users may not know that xxhash64 is not FIPS
>>> compliant and would still use it. Especially considering it was marked
>>> as "fips_allowed = 1" for a while.
>> So isn't that a very bad situation? They think they are FIPS compliant, but
>> actually they are not since they use an unapproved algorithm by accident.
>> Maybe it would be better to include this patch so that they are aware of the
>> mistake? If there is really somebody running into this issue, they could
>> boot once with fips=0, fix their system, reboot again with fips=1 and
>> finally be really compliant. Sounds like the better solution to me. WDYT?
> As described in the dm-integrity documentation, dm-integrity supports
> non-cryptographic checksums for protection from accidental corruption.
> That use case is no different from any other use case of a checksum.
>
> It's also no different from using crc32 or crc32c, which similarly have
> fips_allowed=1 and this patch completely ignores.
>
> The solution is not banning checksums or making any other code change,
> but rather just doing what it seems everyone has already been doing:
> documenting in their FIPS security policy that checksums are only for
> use cases that are not "security functions".

Unfortunately, this is not an option anymore due to the opinion of the 
CMVP that was issued back in March. If you have an account (you can sign 
up for free), you can read it in full here: 
https://cmuf-workspace.org/Products/Projects/Messages.aspx?prjID=3&id=559. 
I can also send a copy of the PDF file privately, if necessary.

The relevant text is:

     1.a. Can xxhash64 be used in approved mode as non-security function 
without any further action (in this case FIPS IG 2.4.A will not be 
applicable)?

     Answer: No, xxhash64 cannot be understood as a non-security 
function because:
     1) It is offered as an equivalent hash alternative to approved hash 
algorithms (i.e., SHA) using the same interface/API and therefore 
appears to an operator that it can provide cryptographic protection 
(i.e., security).
     2) Its return value (i.e., mode indicator) is the same as for 
approved cryptographic functions that provide security.
     3) It is accessed by an interface/API that has “crypto” in the name 
and thus implies security.
     4) It is an available hash function (i.e. PRF) of HMAC, which is a 
keyed algorithm that implies security.

crc32 and crc32c were not explicitly called out in the resolution, which 
is why this patch didn't target them. Though following the same 
rationale, they should also be disabled.

>
> - Eric

