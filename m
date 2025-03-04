Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BBAC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 05:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=asZ89NjLYjHfpBcFWEra+PaQAUWjYIbeIoGtB844wqU=; b=08KYmZ+UOVzgEVIDrha8NPeSjU
	jNTdz8x6sE9yOPW9rtbHaN9doVkyFBjzmqWpHdvFSziqycScAUwTTbzGQyVb5AoKvf4Zvsl2Flsy2
	dwU612+XnM1ZiY8Oqf3nYBe8noE5Vow8FS9knkAgW748t4t2NO7B2YjsynAZvm4MznlqbV2oRutvG
	5Inf8l/E6WWn9kwNtNOmf/H10s/zu9FD5XetquJnfSMM0q8M1QxwE8k6lL1GrkO3SL5moDQMUq/qg
	5wbWdACFz5uvB+ZRoL3gyjnQqdnxGGBc81pHHmKrvxxcx9zMXKQVqXr0hzA/1s8oWNGdDnSIWUSLL
	v84vPo0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpL2b-000000039iE-2PMU;
	Tue, 04 Mar 2025 05:42:05 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpKzg-000000039Jv-0MuL
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 05:39:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=asZ89NjLYjHfpBcFWEra+PaQAUWjYIbeIoGtB844wqU=; b=KI4+xIvhaN+WFJ+4I3OIv62vvW
	vvKgZwD3kEbvhNNJATfeF6I4m7fCegtkQTp8i3I5SFGvEv22YX6iMKoMOWHX5z3Unsddyi1zYtIjs
	VqpSz/ZPd87FpUk6SIFQNqJ17zkZY/z6aRtPQD0GG1Fo97OC0zO6ggAu9bWDyvwuYlb/MswaYJMTF
	hdy+/BECalKSARmBXTkt402mzuu0FtAnoEx1A/bGYuEz3ASzKn+7niILzVlIGB7at291z8Vl2OGOA
	C+RP/g7y2QM60NNY2k5KwYcSh7hX3SKzJTGqbTPDUlVToDMf/ozWe2RfhMAe2wJAemg8eg3+xq7gh
	OLKQnWFA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tpKzZ-00000000FmI-2xOE;
	Tue, 04 Mar 2025 05:38:57 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8ED6630049D; Tue,  4 Mar 2025 06:38:53 +0100 (CET)
Date: Tue, 4 Mar 2025 06:38:53 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Menglong Dong <menglong8.dong@gmail.com>
Cc: rostedt@goodmis.org, mark.rutland@arm.com, alexei.starovoitov@gmail.com,
	catalin.marinas@arm.com, will@kernel.org, mhiramat@kernel.org,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	martin.lau@linux.dev, eddyz87@gmail.com, yonghong.song@linux.dev,
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
	jolsa@kernel.org, davem@davemloft.net, dsahern@kernel.org,
	mathieu.desnoyers@efficios.com, nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com, morbo@google.com,
	samitolvanen@google.com, kees@kernel.org, dongml2@chinatelecom.cn,
	akpm@linux-foundation.org, riel@surriel.com, rppt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org,
	netdev@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v4 1/4] x86/ibt: factor out cfi and fineibt offset
Message-ID: <20250304053853.GA7099@noisy.programming.kicks-ass.net>
References: <20250303132837.498938-1-dongml2@chinatelecom.cn>
 <20250303132837.498938-2-dongml2@chinatelecom.cn>
 <20250303165454.GB11590@noisy.programming.kicks-ass.net>
 <CADxym3aVtKx_mh7aZyZfk27gEiA_TX6VSAvtK+YDNBtuk_HigA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADxym3aVtKx_mh7aZyZfk27gEiA_TX6VSAvtK+YDNBtuk_HigA@mail.gmail.com>
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

On Tue, Mar 04, 2025 at 09:10:12AM +0800, Menglong Dong wrote:
> Hello, sorry that I forgot to add something to the changelog. In fact,
> I don't add extra 5-bytes anymore, which you can see in the 3rd patch.
> 
> The thing is that we can't add extra 5-bytes if CFI is enabled. Without
> CFI, we can make the padding space any value, such as 5-bytes, and
> the layout will be like this:
> 
> __align:
>   nop
>   nop
>   nop
>   nop
>   nop
> foo: -- __align +5
> 
> However, the CFI will always make the cfi insn 16-bytes aligned. When
> we set the FUNCTION_PADDING_BYTES to (11 + 5), the layout will be
> like this:
> 
> __cfi_foo:
>   nop (11)
>   mov $0x12345678, %reg
>   nop (16)
> foo:
> 
> and the padding space is 32-bytes actually. So, we can just select
> FUNCTION_ALIGNMENT_32B instead, which makes the padding
> space 32-bytes too, and have the following layout:
> 
> __cfi_foo:
>   mov $0x12345678, %reg
>   nop (27)
> foo:

*blink*, wtf is clang smoking.

I mean, you're right, this is what it is doing, but that is somewhat
unexpected. Let me go look at clang source, this is insane.


