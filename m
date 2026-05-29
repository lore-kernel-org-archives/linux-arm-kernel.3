Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6793CD6E43
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 11:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sIeVd/WX/TWHB/VJyICGafCV81ZvEMJIfeKTRzi4YyU=; b=lCk1qXvDpYnoHaNx/2biet9B38
	56sWFzE7+rgapquysed1znVs9Ohq5oe6eBdnQZA32tz4ABtsYNv9FiL0HdxBYpeKRMfu5H+QKhic/
	pyDq9jYdaTVhCE/bjAMoakNY0G/UKuT0L3F39yvuGBE5NeeD2X7DD/y86Wuv8aoeOpYlD+7gsAaIa
	H+s/11yhHXBf3yab3VlqDYXES2Z+MevVYm+pCPImiDYFN8+TP7my3ENb8AsGF3t62G8FLLO+6fsQB
	Sb4NVPtfHOMMHfZSIsp3ljE7JYkPdlUbW3Nq2Ad8nKFA3dX41Z477aeQ50yBn/cfMN1BLh55sUH+H
	M9Mhrvww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSvhW-00000007JX0-2Sxb;
	Fri, 29 May 2026 11:48:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSvhT-00000007JWX-1cu3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 11:48:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C73C44408C;
	Fri, 29 May 2026 11:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B391F00893;
	Fri, 29 May 2026 11:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780055306;
	bh=sIeVd/WX/TWHB/VJyICGafCV81ZvEMJIfeKTRzi4YyU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=JRO772ouOdhT+jOQJ0OTbNHxgdzgvxi473owGgUo4TE57zUhwukVR0+C+fpHEsL92
	 fUVrUiHHHckcGymqGSKgE4CWyPhCY2v/Gt0NycMsYvqVnYk4x5muiJhKJVFCtDgKJP
	 qPhb2qvrQcWq0x8XmZeLnojxrZQZgrkS61hCbjqhs5GJq3CnheRLlZ7PGBXI9vBwxP
	 NN7nD+As59I/v/CjdM5jvCr8K65cs7ezJ5VLQ7Bx1MfdpM9sXLjmhDvAOo6Y7lhGT3
	 fzgx4us/z4Z+CnkRRgLRDpzwYHCeBByicEWc9iDnSb9ih93N8eYpiCPeaFNLE+JULK
	 boLKl1E8SsPGA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5C985F40068;
	Fri, 29 May 2026 07:48:25 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-01.internal (MEProxy); Fri, 29 May 2026 07:48:25 -0400
X-ME-Sender: <xms:CX0ZagN3aQtnP5COtTHB95DuxR1C1PNBgVxGl18aCXuND6jeeqckiw>
    <xme:CX0ZahwyJ8letx_9aBqmekV7icYDJoKqohBqLWMpvVtp53-keo9G82lVoEKGv84Jt
    eNVudLoKHRxrjpE44-4QHGCJ-S6Pu72-sY9DE1-y8ECJMmJYgW79qU>
X-ME-Proxy-Cause: dmFkZTEZo0PmK4mVB+fFM0IN1SyU0XoyCS4JtFVZ5bJycosU9Xxdllrud3l8Di6ocFbe5N
    HEklJ59M+C805Cm4eym0UqzqtnTUFRvNdnKZ8X1TMfo6I03dE5uih4Vqp1hkE80h74zsWF
    2ltZ/T3xvnpSusp3LJ0hMNAUQlyq1C1oIbvywWhQHwhCzEZui5yARzH7uSNzEqRwl3CkfL
    81udAFrbb1pHb25iUo9sopmerAdCubWvBJgnRkMS1JcOjioNciLlaIqOX/MIH7t9grkDqv
    VCqC6913tLnFO5KvwlaytX17z6eAcG7QjcGkp2vjNsx3WSh27qiy35mJdl+ogoOHiiNlAx
    RTD/Zl+pGjPdayDQvssU9/4Pn2g9XOvFTKlf9A7BBg2RlDplKNj91dg6kC06Sk4CaHnXue
    tdK3k5SQs4G1GyPAXF210G5E7yRaZeS3rkj6JQ5+fZln4NVAW9ii6cpmuibsM9izO10mSp
    TRB/s+D+ZTUllXeG4AIvlwB+S7HNLNNKI9mcLAr+Me0DQ0I/F1uHG47+V8nGVI4e9wwSfW
    TLbZPErXQ4GTogQTz51PhpGN3fNwBATIOK3i5dos6l0JxJXNG7JAuf9rdDwAnNezvRbJr/
    lxxwjSL+5t9OJkSnrY0pM2yq/TpsykeyFonsIGIwNyMsOqLLbuQLGhikVh0A
X-ME-Proxy: <xmx:CX0Zap16tX7A2oLaMjBjQAzRHEsI65FLz7uHu4CX9VagJUHaDTOx8g>
    <xmx:CX0ZanLZhe5zBc8zPzIUwmo0FHz66Gw4nyjgOOIQhcZxrhMm7lAbmw>
    <xmx:CX0ZahkjPCu6whROyp9OvLCnjBPsNyVZnm_q_TY9yheAvvfpMJu_pA>
    <xmx:CX0ZatMbPkNztnNyEwLga96pIQj92RQmP17RQF58EO8XjM79j38WDg>
    <xmx:CX0Zaox4r43qBEISSLnS04jJIkSlhY96ahChUyzXn09Ys7cTJ2_N2bfv>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3991F182007A; Fri, 29 May 2026 07:48:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 29 May 2026 13:48:04 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Kevin Brodsky" <kevin.brodsky@arm.com>,
 "Ard Biesheuvel" <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, "Will Deacon" <will@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Mark Rutland" <mark.rutland@arm.com>, "Ryan Roberts" <ryan.roberts@arm.com>,
 "Anshuman Khandual" <anshuman.khandual@arm.com>,
 "Liz Prucka" <lizprucka@google.com>, "Seth Jenkins" <sethjenkins@google.com>,
 "Kees Cook" <kees@kernel.org>, "Mike Rapoport" <rppt@kernel.org>,
 "David Hildenbrand" <david@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>, "Jann Horn" <jannh@google.com>,
 linux-mm@kvack.org, linux-hardening@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org
Message-Id: <c96591f0-fcf9-43c9-8e45-4a688b3aa116@app.fastmail.com>
In-Reply-To: <32458c49-0e3c-4d27-b1cf-0e2d7ee0273d@arm.com>
References: <20260526175846.2694125-17-ardb+git@google.com>
 <20260526175846.2694125-32-ardb+git@google.com>
 <22042b98-cfcc-428e-bb08-ebcfe785eb69@arm.com>
 <8082b77d-6522-472a-9030-317087ecd7e9@app.fastmail.com>
 <32458c49-0e3c-4d27-b1cf-0e2d7ee0273d@arm.com>
Subject: Re: [PATCH v6 15/15] arm64: mm: Unmap kernel data/bss entirely from the linear
 map
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_044827_468622_3EC3AF66 
X-CRM114-Status: GOOD (  17.38  )
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


On Fri, 29 May 2026, at 10:49, Kevin Brodsky wrote:
> On 29/05/2026 10:34, Ard Biesheuvel wrote:
>> On Fri, 29 May 2026, at 10:29, Kevin Brodsky wrote:
>>> On 26/05/2026 19:59, Ard Biesheuvel wrote:
>>>> From: Ard Biesheuvel <ardb@kernel.org>
>>>>
>>>> The linear aliases of the kernel text and rodata are mapped read-only in
>>>> the linear map as well. Given that the contents of these regions are
>>>> mostly identical to the version in the loadable image, mapping them
>>>> read-only and leaving their contents visible is a reasonable hardening
>>>> measure.
>>>>
>>>> Data and bss, however, are now also mapped read-only but the contents of
>>>> these regions are more likely to contain data that we'd rather not leak.
>>>> So let's unmap these entirely in the linear map when the kernel is
>>>> running normally.
>>>>
>>>> When going into hibernation or waking up from it, these regions need to
>>>> be mapped, so map the region initially, and toggle the valid bit so
>>>> map/unmap the region as needed. (While the hibernation snapshot logic
>>>> seems able to map inaccessible pages as needed, it currently disregards
>>>> non-present pages entirely.)
>>> I'm not sure I understand this, is there something wrong with the
>>> kernel_page_present() check in safe_copy_page()?
>>>
>> No. If the hibernate code decides to snapshot a page and it is not mapped,
>> safe_copy_page() will do the right thing and map it on demand.
>>
>> The problem is that pages belonging to the kernel image are marked as
>> PageReserved, and so the hibernation logic will not even consider the
>> pages for snapshotting if they are not mapped.
>
> Right I see the check in saveable_page() now. Maybe it would be worth
> spelling it out in the commit message (hibernation logic ignores
> non-present Reserved pages).
>

Yeah it's there but clearly not spelled out sufficiently :-)


