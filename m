Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97EBDC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 15:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmKh3ipd0vUSmnVYWXwIb2mfVvhu187W8+89kC9DAXw=; b=0vWUfItPPbMGDdW9cjvKtWy3fD
	ZQIqzDusbgAY+00esolKajSOI+SRGVT9yYaRYybY+yz2mSsRqPamE37pX7P7NNp9Q1mFv6u0COOte
	SzWXKZ3Cyo3/9sis2zQ0cqqFVbkfIF13yZyXVicN8hR/n5QFsG8d2/Fg8GEzxK57FtqLz8vYN3W49
	mDcf7q2g36tR3F2KThsAy0R3Nl0/Ir3RNSibmIkSbMRsDylZdvcyqUuZWiArtjGkrmJZsa6mTzsvM
	n9GKC1479wC7Lqy2gzcUXSUR/JxFI29U6pod4qBgaI+8Ty9O9FL42d84PyI13Gkx+ABgUM+0zuTMQ
	c2UrU9kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVQE-00000009wPj-1Ige;
	Mon, 12 May 2025 15:50:30 +0000
Received: from out-183.mta0.migadu.com ([91.218.175.183])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEV5c-00000009sG1-1GTg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 15:29:13 +0000
Message-ID: <f63c2be5-50e4-4c47-8a56-9a570977a6cf@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747063736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fmKh3ipd0vUSmnVYWXwIb2mfVvhu187W8+89kC9DAXw=;
	b=h5ChcKGPvwZT+b1kpFunRGFcD1RxyD2hEYG9wCT3bDahCL3/Hcnw9yv51tW1oSMN1/OGnJ
	EGF6My98TvTWYO8ImAJevYTIYrMKrLrPiCMj9raFdhlxZXlFk56nBF130ck1n2IL0okONY
	6SShFmTnaG18mFAHPHgYTZ6yjWkUUuY=
Date: Mon, 12 May 2025 11:28:36 -0400
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
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250510-fresh-magenta-owl-c36fb7@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_082912_486404_288E66A1 
X-CRM114-Status: GOOD (  14.16  )
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

On 5/10/25 03:04, Sudeep Holla wrote:
> On Fri, May 09, 2025 at 07:37:35PM -0400, Sean Anderson wrote:
>> Cache geometry is exposed through the Cache Size ID register. There is
>> one register for each cache, and they are selected through the Cache
>> Size Selection register. If FEAT_CCIDX is implemented, the layout of
>> CCSIDR changes to allow a larger number of sets and ways.
>> 
> 
> Please refer
> Commit a8d4636f96ad ("arm64: cacheinfo: Remove CCSIDR-based cache information probing")
> 

| The CCSIDR_EL1.{NumSets,Associativity,LineSize} fields are only for use
| in conjunction with set/way cache maintenance and are not guaranteed to
| represent the actual microarchitectural features of a design.
| 
| The architecture explicitly states:
| 
| | You cannot make any inference about the actual sizes of caches based
| | on these parameters.

However, on many cores (A53, A72, and surely others that I haven't
checked) these *do* expose the actual microarchitectural features of the
design. Maybe a whitelist would be suitable.

| Furthermore, CCSIDR_EL1.{WT,WB,RA,WA} have been removed retrospectively
| from ARMv8 and are now considered to be UNKNOWN.
| 
| Since the kernel doesn't make use of set/way cache maintenance and it is
| not possible for userspace to execute these instructions, we have no
| need for the CCSIDR information in the kernel.

Actually, these parameters are directly visible (and useful) to
userspace in the form of the cache size. Rather than make userspace
perform benchmarks, we can expose this information in a standard way.
There is of course [id]cache-size, but these properties are absent more
often than not:

$ git grep arm,cortex- 'arch/arm64/**.dtsi' | wc -l
1248
$ git grep d-cache-size 'arch/arm64/**.dtsi' | wc -l
320

--Sean

