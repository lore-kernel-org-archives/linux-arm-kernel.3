Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7803C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 09:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LwSn+5WqfcB7fmW8wN1VmJYcXiMguNvPTqVov6P1lz8=; b=Mg3i+GC4YC5DrAQEZ2HHc8UFbW
	qY/0OyuGWSRqj7myEMCXr30o4xtHqNseyy5RWekmFGEKu4Y2iOAmEyg09MCjLhrdWhOaniTsfp2n6
	Nyqwbbk/7PhOvAB+gYRTElCuq+/0pzxCfdeQ4JuaG2zMUY5sY3lRSmr7qVGn6kXvZEdMbrZwtFE6C
	h/SvAvrwciQ1iuwIMCKGWBENfUItTg3UIN8TrJ62LLc/UU+e+N6uvpYr+x05Y8ngRIFUN2XtbWsL/
	ILfwnptTcVbLVCmVmFCixEfo0Jf9R8mq3D/kjC0AFfJcd8N7pW9P1suYOe4A0PlDjMuBmP9a2tv/Y
	tJdxrUVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8DnM-0000000HBGY-31M4;
	Sun, 20 Sep 2026 09:25:12 +0000
Received: from out-173.mta1.migadu.com ([95.215.58.173] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8DnJ-0000000HBFv-3F7D
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 09:25:11 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=lz0EA6hiUS0KAC3VMk3a5ISVPj1hxirPpP5jDVlLUfc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789896307; v=1; x=1790501107;
 b=Sw7M0/6MkSKUbYnLIgji/kGC3H/+/99YpDkhjSv9EGtkXNjTCwCfphbbVuwfESM9hbWDjkp0
 IMticiHt+r0AB4PqF6hVOzVD8exjoj0y9cdwWLjQupLPsUqNAGvwsiQgvQVt5nn2msdqj2Wz2cb
 EC9lcXtF8K2Kyqc6kYspy3fw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b3f5433f35c01e28;
	Sun, 20 Sep 2026 09:25:05 +0000
X-Mizu-Trace-ID: b3f5433f35c01e28
X-Migadu-Flow: FLOW_OUT
Message-ID: <9895e60c-6a3c-40c8-b188-51891ee6b216@linux.dev>
Date: Sun, 20 Sep 2026 17:24:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: use generic MMIO accessors
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux-Arch <linux-arch@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Vikram Sethi <vsethi@nvidia.com>, Mike Rapoport <rppt@kernel.org>,
 Shanker Donthineni <sdonthineni@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260920014357.7069-1-qingfang.deng@linux.dev>
 <20260920014357.7069-3-qingfang.deng@linux.dev>
 <5847c824-8d69-4d02-af2f-896bf47f0732@app.fastmail.com>
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <5847c824-8d69-4d02-af2f-896bf47f0732@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_022510_066176_B28AB5B4 
X-CRM114-Status: GOOD (  10.69  )
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

Hi,

On 2026/9/20 16:08, Arnd Bergmann wrote:
> On Sun, Sep 20, 2026, at 03:43, Qingfang Deng wrote:
>> Use the generic raw write accessors in place of the inline assembly
>> stores. Include asm-generic/mmio.h after the arm64 ordering hooks so
>> these accessors are also available to the write-combining helpers
>> before asm-generic/io.h is included.
>>
>> Retain the raw read overrides when either the Cortex-A57 erratum 832075
>> or NVIDIA Olympus erratum 1027 workaround is configured. This preserves
>> the alternative-patched load-acquire instructions and pre-load barriers.
>> Use generic raw reads when neither workaround is enabled.
>>
>> Assisted-by: Codex:gpt-6-astra
>> Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
> Sorry, this is no good, we need the compiler to issue the exact
> instructions from the inline asm here, both in order to guarantee
> these can be virtualized, and to prevent it from splitting up
> larger register accesses into byte load/store on unaligned pointers.

You're right about virtualization: an AArch64 compiler can generate 
writeback addressing loads/stores, which KVM's MMIO handler does not 
support.

Regarding unaligned accesses, the splitting can only happen when the 
address is known to be unaligned at compile-time. Do these accessors 
need to support unaligned MMIO? If so, I could add 
OPTIMIZER_HIDE_VAR(addr) to the generic accessors.

Best regards,
Qingfang


