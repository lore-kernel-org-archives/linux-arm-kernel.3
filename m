Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A365CD6E4C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 06:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ilE3N4BOTdn9nDgsIqVIX55BotssAoPQjZsa6oIPMLY=; b=DzXLHjT9hZErp4B9QXMsTVgYpp
	V3X2WLc9o/TDOxEjO4+AHvmt4PSDK7U5XjbRn8UsiNoORwGRuTjdwRFJpAI34Bg1H0GLbmzqEDoyr
	kl6uLasNK1sTa5t/YfAHbB52qqrOU2ocN5BtmfjhJs0WgIUyAy2O55Z49Nzw/7T8CXfk6jBAgJ6KC
	m2KD2D57+jsDwdOzelkMlsQbigJyzro+euIfGgvUOYVNlnOEM3ZgEECie/30bdYdbmOisIPp4rQcZ
	nY2Mc79eVCuHfNcuvzhJf8xMXs0wHAXxsjmnR7cS/w9RaJ6FhpaYo4M5YipXk/VsBBE58dPUR8ttw
	WWA4yglw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTw6U-0000000ACjF-0ZGR;
	Mon, 01 Jun 2026 06:26:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTw6R-0000000ACim-1NIc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 06:26:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88BA0267F;
	Sun, 31 May 2026 23:26:16 -0700 (PDT)
Received: from [10.164.18.45] (unknown [10.164.18.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E34D03F905;
	Sun, 31 May 2026 23:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780295181; bh=3+mbuSOPINRIL9Kin6A2TyWfF8smoqgqWi2QxpvIA04=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UDWGUBrqwtsm4H1kD96qnayD0Gt/6wSVCIxG5vO5Csj9ooOqWdtqv2TeXpxpgnnkD
	 JaX1+6lMgNLdmd3e7hD13QzppuwXLD7Jmq9oTWar6RVvfw6ik0y113eW97KQYI2P0g
	 dygsfiUREkcoUVD64lZgCrEQV8KPI7LXd7k6GL/w=
Message-ID: <1e50b8f4-22ae-4ff7-aac9-fa3242bb23ca@arm.com>
Date: Mon, 1 Jun 2026 11:56:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V2 01/14] mm: Abstract printing of pxd_val()
To: David Laight <david.laight.linux@gmail.com>,
 Dave Hansen <dave.hansen@intel.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Linu Cherian <linu.cherian@arm.com>, Usama Arif <usama.arif@linux.dev>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20260513044547.4128549-1-anshuman.khandual@arm.com>
 <20260513044547.4128549-2-anshuman.khandual@arm.com>
 <74f66e30-ab3d-4352-89ef-1bccc7e9daeb@intel.com>
 <20260521104206.1c7d3fe0@pumpkin>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260521104206.1c7d3fe0@pumpkin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_232623_456771_CE23CCAF 
X-CRM114-Status: GOOD (  12.41  )
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



On 21/05/26 3:12 PM, David Laight wrote:
> On Tue, 19 May 2026 07:28:17 -0700
> Dave Hansen <dave.hansen@intel.com> wrote:
> 
>> On 5/12/26 21:45, Anshuman Khandual wrote:
>>>  	if (!p4d_present(p4d) || p4d_leaf(p4d)) {
>>> -		pr_alert("pgd:%08llx p4d:%08llx\n", pgdv, p4dv);
>>> +		pr_alert("pgd:%" __PRIpxx " p4d:%" __PRIpxx "\n",
>>> +			 __PRIpxx_args(pgdv), __PRIpxx_args(p4dv));
>>>  		return;
>>>  	}  
>>
>> That's not the most readable result. Could a printk() format specifier
>> make this nicer? Maybe use "%pT"?
>>
>> 	pr_alert("pgd:%pT p4d:%pT\n", &pgd, &p4d);
>>
>> I _think_ it could even get rid of the p??v variables.
>>
> 
> Adding another %p variant that is only used in a few places just makes
> it all harder to read.
> Perhaps a local helper that lets you do:
> 	char pdgv_buf[??]:
> 	pr_alert("... %s ...", ... fmt_pdgv(pdgv_buf, pdgv) ...)
> might be a reasonable compromise.

But will not that also create a similar code churn as adding %p variant ?
As mentioned earlier a draft implementation could be found here.

https://lore.kernel.org/all/1d694f9d-4f40-428b-aa28-9d6e0febd54c@arm.com/

