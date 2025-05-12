Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6635FC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 16:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bQK9BG+j/hEhpu8hZi8th8YhOfeYv7OqsnL+EJuFLtI=; b=3fkuSTHkfaaxPuZd1WMUq6FHZ4
	oUINzAtve5wMKNhtjHZ1jO3YiamloFbURTgX1xJniEzUAudfEr/0lvblg1lQRsGNrJJTmGxjUend0
	/Z+g5N31SlDFXXQgON9pNZveO+6XdNFWv0v/LY9b9XaFm9f+6PRlSj4unUR2e4oHQBRxrBztC11vY
	ztKoxMd3Px1I3YEel+sIzmV8gfxnP/J46z7p+erKr849apwqoNRo6mNDsPvG/He1vvwD1pOoz29ZI
	iU3mNgN6Gazyi9paExWvHd/rVApTDsZQqjIZ9829FAq1d3V99+NYHV4SNriHcEAji95Y973XEcfr8
	Q7BREKfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVtX-0000000A0qj-0Cnz;
	Mon, 12 May 2025 16:20:47 +0000
Received: from out-178.mta0.migadu.com ([2001:41d0:1004:224b::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVRq-00000009waN-3G4e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 15:52:12 +0000
Message-ID: <6d43f466-5786-4957-86c8-8297aa739030@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747065128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bQK9BG+j/hEhpu8hZi8th8YhOfeYv7OqsnL+EJuFLtI=;
	b=pciWP+l0iQhMy02PYIChZa5nE48TTtrzBTyWxtlMx62kQYXCqczinCMiKQOby7j7FI4QCr
	oWhVwEMkwG/ZjThwcIQ9gsEB/nmd/15Ss1qfyaxQYbRE/L/gsvv75bMs6GLR/mLaEus5h5
	mVbDPY1qIuhagBGUqDpPeHZJViv9pcs=
Date: Mon, 12 May 2025 11:52:02 -0400
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: cacheinfo: Report cache sets, ways, and line size
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, Radu Rendec <rrendec@redhat.com>,
 Will Deacon <will@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
References: <20250509233735.641419-1-sean.anderson@linux.dev>
 <20250510-fresh-magenta-owl-c36fb7@sudeepholla>
 <f63c2be5-50e4-4c47-8a56-9a570977a6cf@linux.dev>
 <20250512-straight-dexterous-oxpecker-fabbc8@sudeepholla>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250512-straight-dexterous-oxpecker-fabbc8@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_085211_033984_CBCA3BCD 
X-CRM114-Status: GOOD (  24.20  )
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

On 5/12/25 11:34, Sudeep Holla wrote:
> On Mon, May 12, 2025 at 11:28:36AM -0400, Sean Anderson wrote:
>> On 5/10/25 03:04, Sudeep Holla wrote:
>> > On Fri, May 09, 2025 at 07:37:35PM -0400, Sean Anderson wrote:
>> >> Cache geometry is exposed through the Cache Size ID register. There is
>> >> one register for each cache, and they are selected through the Cache
>> >> Size Selection register. If FEAT_CCIDX is implemented, the layout of
>> >> CCSIDR changes to allow a larger number of sets and ways.
>> >> 
>> > 
>> > Please refer
>> > Commit a8d4636f96ad ("arm64: cacheinfo: Remove CCSIDR-based cache information probing")
>> > 
>> 
>> | The CCSIDR_EL1.{NumSets,Associativity,LineSize} fields are only for use
>> | in conjunction with set/way cache maintenance and are not guaranteed to
>> | represent the actual microarchitectural features of a design.
>> | 
>> | The architecture explicitly states:
>> | 
>> | | You cannot make any inference about the actual sizes of caches based
>> | | on these parameters.
>> 
>> However, on many cores (A53, A72, and surely others that I haven't
>> checked) these *do* expose the actual microarchitectural features of the
>> design. Maybe a whitelist would be suitable.
>> 
>> | Furthermore, CCSIDR_EL1.{WT,WB,RA,WA} have been removed retrospectively
>> | from ARMv8 and are now considered to be UNKNOWN.
>> | 
>> | Since the kernel doesn't make use of set/way cache maintenance and it is
>> | not possible for userspace to execute these instructions, we have no
>> | need for the CCSIDR information in the kernel.
>> 
>> Actually, these parameters are directly visible (and useful) to
>> userspace in the form of the cache size. Rather than make userspace
>> perform benchmarks, we can expose this information in a standard way.
> 
> Yes that is already present, which is DT or ACPI.
> 
>> There is of course [id]cache-size, but these properties are absent more
>> often than not:
>> 
>> $ git grep arm,cortex- 'arch/arm64/**.dtsi' | wc -l
>> 1248
>> $ git grep d-cache-size 'arch/arm64/**.dtsi' | wc -l
>> 320
>>
> 
> Just to be clear, I am fine with exposing to the userspace, but just
> not reading those registers as stated in the commit message I shared
> earlier.
> 
> Why can't it be done via DT/ACPI ?
> 

Well, do you want to go through 200 SoCs and look up cache info in the
documentation? I think it would be more expedient to look at the TRMs
for two dozen cores and determine if the above registers expose the cache
info correctly.

--Sean

