Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33E2C369A9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 10:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IFilB1CWtJRNPPBhabQDjIrMR//U86n9XWn9p+phq6s=; b=tdtNzIkAQ+1OyRPU809AdYnTQM
	6yUx6X32PgohzSzvNa6evctOnBnktx53YroE65qnbmnC5vVmzNC4ILM/0VcZxPaMcIjA7M1t4JDYw
	bF4jNbdVd84vjCxHlemlALl1JSkc+5NwbdD8jUtIZb6HhYC2Xv2hav2z/xW/DkOoqm5zvyf8wJzOz
	hzYUzmb31P+TeJteUM/ot24e9OiRvQhravB1vsjK2mxtzp9p6LrDk0DmyiKMmkOsaChOOWRhmAfGe
	kTGFT3LNLcQOgBD4Rv1/+9tDnt4e/sbAFXMcuh6o2fAVJ2USjmvR6N0ST2uURdi2zScdzELzeCZUA
	9ZIWnUvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3BUI-0000000DMW7-2mUY;
	Fri, 11 Apr 2025 10:19:54 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3B6c-0000000DGOt-1REN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 09:55:27 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744365322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IFilB1CWtJRNPPBhabQDjIrMR//U86n9XWn9p+phq6s=;
	b=lldZTB8aa3KylyrLGpWT3q3PIdaWlu4BkIKbhmi0Vwqtf5DpEsfRYbG0LTyUr8+UgMqsaH
	92IE8hVzpaQ7jIFVvXotuqddCs4ueHRNSSA6AyTt0QCzL+hZ/Jl7FpwyGA+0lqMHB8FnYk
	2ZgN331Fp2lWsN9GaB9sn4KSR857ErFolh8FNe/CPpOuIk2Kq27+9vbRagUYNHAISi/T01
	yrAl0oBah/SlbViI/yxNkYS8aAk92ZxuyTKzMPaQvoBmkzLGp6OkGZXXKLUcNVgRR2NyBD
	0xM+1NGeJGFLPwrVbbp1P73nRYoDlcdaYxT1hchYih7EoHKH316WSu9KeA1L4A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744365322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IFilB1CWtJRNPPBhabQDjIrMR//U86n9XWn9p+phq6s=;
	b=K/Gh8U4CXj+l1NLqONuUhEP+NCa3T+gi/I84He2UrtbFNxqfACmP8QJbhrqX8/KZ7DBdSC
	bhnQPg63Dk/LunCA==
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier
 <maz@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>, Timothy Hayes
 <timothy.hayes@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Liam.Howlett@oracle.com, ast@kernel.org
Subject: Re: [PATCH 20/24] irqchip/gic-v5: Add GICv5 LPI/IPI support
In-Reply-To: <Z/jgL52ZVdcxTEkP@lpieralisi>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-20-1f26db465f8d@kernel.org>
 <Z/jgL52ZVdcxTEkP@lpieralisi>
Date: Fri, 11 Apr 2025 11:55:22 +0200
Message-ID: <87plhjrpit.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_025526_528064_5DDF29F6 
X-CRM114-Status: GOOD (  16.80  )
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

On Fri, Apr 11 2025 at 11:26, Lorenzo Pieralisi wrote:
> On Tue, Apr 08, 2025 at 12:50:19PM +0200, Lorenzo Pieralisi wrote:
>> Maple tree entries are not used by the driver, only the range tracking
>> is required - therefore the driver first finds an empty area large
>> enough to contain the required number of LPIs then checks the
>> adjacent (and possibly occupied) LPI ranges and try to merge them
>> together, reducing maple tree slots usage.
>
> The maple tree usage for this purpose is an RFC at this stage.
>
> Added Alexei because I know BPF arena used the maple tree in
> a similar way in the past and moved to a range tree because
> the BPF arena requires a special purpose mem allocator.
>
> As Thomas already pointed out a plain bitmap could do even though
> it requires preallocating memory up to 2MB (or we can grow it
> dynamically).
>
> We could allocate IDs using an IDA as well, though that's 1 by 1,
> we allocate LPI INTIDs 1 by 1 - mostly, upon MSI allocation, so
> using an IDA could do (AFAIU it works for 0..INT_MAX we need
> 0..2^24 worst case).

The point is that you really only need a 1-bit storage per entry,
i.e. used/unused. You won't use any of the storage functions of maple
tree, idr or whatever.

So the obvious choice is a bitmap and as you said, it's trivial to start
with a reasonably sized one and reallocate during runtime if the need
arises.

The reallocation happens in domain::ops::alloc() which is fully
preemptible context, i.e. no restrictions vs. allocations.

For the top-most domain, the callers hold domain::mutex, which excludes
concurrency vs. ops::alloc/free(). If the bitmap is in a domain further
down the hierarchy then you need your own mutex there.

Thanks,

       tglx






