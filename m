Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8C6D68BD5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 09:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wdDZF3/HSZmlH2rDLNptQ5LWR2buABlOXa4bjb4WrgE=; b=xx8swZTZlgF1zkjzvxVB8KuM4K
	YzToYfV9fikzyIH0dtTjo9wIA1sX59R0gV0HD5HnWtYEtKepRCej12uMk8uKo6iDPAifL9toJ/m7u
	Lr+CjTOMNmXrhbe5CpbDpdQQyKo5dsh4ZqLX/OGsJPz5fqSVOUaO0AsRluAsTJ0oY4V4Pl0PwtXE7
	WP15sCNQZOtPIbP2PKA8g6qosvxodtKn4SpVkiegN6RifXQyLA/cREjesN0u/SmotdcXbZgZ0ptF8
	cWTeKuem54NhuLsUYYD6/tdWZTc02BPNRyAntH5vgWiuhG5KtyBLuJS15246RBzdCCDtJcPQc7KMN
	PwV88O0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXFll-0000000CHZl-20gH;
	Sun, 21 Dec 2025 09:30:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXFli-0000000CHZL-2OOI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 09:30:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 44D78436EB;
	Sun, 21 Dec 2025 09:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84754C4CEFB;
	Sun, 21 Dec 2025 09:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766309425;
	bh=dynri6cO7Epp0o2N9qQ3cdoFscVQqJSuLqeok3MBBiM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aZt8jayi0KTKlYfeM8PXcjFeXS/nexnOlW7wp5qpXy8jeA90IS+dY96x2qy1rT5xO
	 FHl5hVlhatmZm8PdARiR984pcX5Xnvb/DN3H8anneFIS8urkPCN+tf5dstcWVRW0gb
	 MtpipYZ4/nTh4uvDJud/EwfAeYoY6eMvezzyrEHIwa4jQVN+kGDWFX9QlrkXMmlhHg
	 +/MzLZJiX1cgSGhR6cIHSoivnfh4RJpQU3BWUmReDCQIKKfO8emvBUqYksawYAEan6
	 IemtDz7JnMnQaHpRMNWXo27R+S6bUs2yHEAc+/muXldZEic5H52t16UN2Lx8FHINn3
	 pxRdGiibDmVHQ==
Message-ID: <4aecb94f-e283-4720-96e5-1837352c3329@kernel.org>
Date: Sun, 21 Dec 2025 10:30:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arch/*: increase lowmem size to avoid highmem use
To: Dave Hansen <dave.hansen@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Arnd Bergmann <arnd@kernel.org>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Andreas Larsson <andreas@gaisler.com>, Christophe Leroy
 <chleroy@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>,
 Matthew Wilcox <willy@infradead.org>, Richard Weinberger <richard@nod.at>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Michal Simek <monstr@monstr.eu>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Nishanth Menon <nm@ti.com>, Lucas Stach <l.stach@pengutronix.de>
References: <20251219161559.556737-1-arnd@kernel.org>
 <20251219161559.556737-2-arnd@kernel.org>
 <a3f22579-13ee-4479-a5fd-81c29145c3f3@intel.com>
 <bad18ad8-93e8-4150-a85e-a2852e243363@app.fastmail.com>
 <a2ce2849-e572-404c-9713-9283a43c09fe@intel.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <a2ce2849-e572-404c-9713-9283a43c09fe@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_013026_656963_FE53BDDB 
X-CRM114-Status: GOOD (  17.65  )
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

On 12/19/25 21:52, Dave Hansen wrote:
> On 12/19/25 12:20, Arnd Bergmann wrote:
>>> For simplicity, I think this can just be:
>>>
>>> -	default VMSPLIT_3G
>>> +	default VMSPLIT_2G
>>>
>>> I doubt the 2G vs. 2G_OPT matters in very many cases. If it does, folks
>>> can just set it in their config manually.
>>>
>>> But, in the end, I don't this this matters all that much. If you think
>>> having x86 be consistent with ARM, for example, is more important and
>>> ARM really wants this complexity, I can live with it.
>> Yes, I think we do want the default of VMSPLIT_3G_OPT for
>> configs that have neither highmem nor lpae, otherwise the most
>> common embedded configs go from 3072 MiB to 1792 MiB of virtual
>> addressing, and that is much more likely to cause regressions
>> than the 2816 MiB default.
>>
>> It would be nice to not need the VMSPLIT_2G default for PAE/LPAE,
>> but that seems like a larger change.
> 
> The only thing we'd "regress" would be someone who is repeatedly
> starting from scratch with a defconfig and expecting defconfig to be the
> same all the time. I honestly think that's highly unlikely.
> 
> If folks are upgrading and _actually_ exposed to regressions, they've
> got an existing config and won't be hit by these defaults at *all*. They
> won't actually regress.
> 
> In other words, I think we can be a lot more aggressive about defaults
> than with the feature set we support. I'd much rather add complexity in
> here for solving a real problem, like if we have armies of 32-bit x86
> users constantly starting new projects from scratch and using defconfigs.
> 
> I'd _really_ like to keep the defaults as simple as possible.

I agree with that. In particular in areas where there is the chance that 
we could count the number of people that actually care about that with 
one hand (in binary ;) ).

-- 
Cheers

David

