Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E799C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 16:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=17odisrwVfR0WePoUlbvwrcF9+//6rg8N9uv1K3pM+M=; b=Myh4FC65gnOrQEeZSExo9NqMYk
	giPCEBf9RcaIysIhNxgaql0EtOtkKCrsbjssjBdw1n8a13kIvcwvPFu4xfHJFULgKs3UbDrnYICOb
	DVx3KjUaGcDp95xmhJJytl6sn894XkDIlOcKBr6OVdH8Ow8aQx0KeQF73iFsnhMMEiPcEIGBSzOHz
	GoygdlzXh8FGG8dS7d+SyU/3PcKfXhocFazj5bdsvas2qW7s49ZMpnaC61JxUPY637iv/jxSdUl0x
	3yUBmcUeMMltsPxAhZh8odjBgPNQFaAhjLLVNTLD/CohjvEeIrGX931EFl4+Yeu+jQpINYL3bJTUD
	UM6W4/0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVzq-0000000A2Qt-494o;
	Mon, 12 May 2025 16:27:18 +0000
Received: from out-186.mta1.migadu.com ([2001:41d0:203:375::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVWq-00000009xRE-18fn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 15:57:21 +0000
Message-ID: <d67d893e-9c7e-487e-a14b-419a7cdc6158@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747065437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=17odisrwVfR0WePoUlbvwrcF9+//6rg8N9uv1K3pM+M=;
	b=wyYPULalvB5fw0HIs6OkuKNaoOUo7Kslcz0usqpRkEFIbRxwxoAs/d174CaJG7RJjq2OaB
	WF71loshhbaA0InlldeiJFIhQiL41liHQ6zZeX3zEB7nHQtVpMSek3fZV5dvixIEG6Mup3
	FWhuddWmJsCFS0tUSCovNruAb3qV7FY=
Date: Mon, 12 May 2025 11:56:28 -0400
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: cacheinfo: Report cache sets, ways, and line size
To: Mark Rutland <mark.rutland@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, Radu Rendec <rrendec@redhat.com>,
 Will Deacon <will@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
References: <20250509233735.641419-1-sean.anderson@linux.dev>
 <20250510-fresh-magenta-owl-c36fb7@sudeepholla>
 <f63c2be5-50e4-4c47-8a56-9a570977a6cf@linux.dev>
 <aCIVec7zl3tIh73h@J2N7QTR9R3>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <aCIVec7zl3tIh73h@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_085720_453352_CFB58E1F 
X-CRM114-Status: GOOD (  22.28  )
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

On 5/12/25 11:36, Mark Rutland wrote:
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
> 
> Then we have to maintain a whitelist forever,

There's no maintenance involved. The silicon is already fabbed, so it's
not like it's going to change any time soon.

> and running an old/distro
> kernel on new HW won't give you useful values unless you provide
> equivalent values in DT, in which case the kernel doesn't need to read
> the registers anyway.

Conversely (and far more likely IMO), running an old/distro devicetree
on a new kernel won't give you usefult values. Bootloaders tend not be
be updated very often (if ever), whereas kernels can (ideally) be
updated without changing userspace.

> The architecture explcitly tells us not to use the values in this way,
> and it's possible to place the values into DT when you know they're
> meaningful.

Well, maybe we can just use these registers for the hundreds of existing
devicetrees that lack values.

--Sean

