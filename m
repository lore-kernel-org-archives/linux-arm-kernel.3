Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC19CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 14:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dNxBVnDvlHOiCaG5lCZVKP+duquWMQ9IrLn4+ig4DI4=; b=mIXKRYygD9F5M5CH0YR0e5psjO
	Qgj6scrupZ12xZigs2tS1N8YDQ/pProfaHY/Zk9htyb2nNJIX9OG8AfUEW40ajgV9zcz8JvuWZhgB
	toT+J2z5babtLM9HIrdzXCz/0SyFmm2w+VJOtg9UWh0OWEoW38Il3gRbjuhDca6Y9jnnOUcJODMiY
	nf3pYTYl5Bewr/PDeSHFMqt31J9i7F9KZFHqxYC1wp+/fu/WlznEEiIGSMDTj/zoWihQOW1AmanLX
	/+hR+6kZG79dT56NnyvGZh/3L5nPFlLUUO76iykJVNu32sjzDzpPJ2BtswCanbwwY0ohd05HZd0Zs
	btn1y+ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRswu-00000002BiV-46LD;
	Tue, 26 May 2026 14:40:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRsws-00000002Bhk-11em
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 14:40:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70FEF169C;
	Tue, 26 May 2026 07:39:55 -0700 (PDT)
Received: from [10.1.28.159] (e121487-lin.cambridge.arm.com [10.1.28.159])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 42B243F7B4;
	Tue, 26 May 2026 07:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779806400; bh=p7gk+48RJ/Z79SLhtzHY7ExJpNDDW/usV23U+2Aa+dQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nqCL7IsxGs6FfsKo0qlSawSTMgP5kkErUj55gqxE2mkt/7tGLdfGMRr7BqdFAQFPg
	 T0drloG4tAv0/CdJmboRwwAeGIBmVI7jbAHq/NZ26ejCAONsuXv6XCKhVUOveESasm
	 LMcKbe34Mux6uirICmZSI0E5cleJq12LaRqrcJ78=
Message-ID: <08e5ce52-be74-4fc5-a0b2-8f405a5eff99@arm.com>
Date: Tue, 26 May 2026 15:39:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/18] arm64: fpsimd: Move SME save/restore inline
To: Mark Rutland <mark.rutland@arm.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Cc: broonie@kernel.org, catalin.marinas@arm.com, james.morse@arm.com,
 maz@kernel.org, oupton@kernel.org, tabba@google.com, will@kernel.org
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-18-mark.rutland@arm.com> <ahWpST4K3rbMbjWK@J2N7QTR9R3>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <ahWpST4K3rbMbjWK@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_074002_352859_30079138 
X-CRM114-Status: GOOD (  10.52  )
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

Hi Mark,

On 5/26/26 15:08, Mark Rutland wrote:
> On Thu, May 21, 2026 at 02:25:55PM +0100, Mark Rutland wrote:
>> +static inline void __sme_save_za(struct sme_state *state, unsigned long svl)
>> +{
>> +	/* The <Wv> argument to STR (array vector) can only encode W12-W15 */
>> +	register unsigned long v asm ("12");
> Sorry, I had meant to put "x12" here, but evidently GCC and LLVM accept
> "12" on its own.
> 
> For clarity (e.g. to match the comment) I'll change that to "w12" and
> make the type unsigned int. Likewise in __sme_load_za().
> 

I suspect you are intentionally not using "Ucj" constrain to limit register allocator,
if so I'm wondering why?

Cheers
Vladimir


> Mark.
> 


