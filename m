Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125E5C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 16:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=meSp1W4kNHGyd+88qlhZAmQUNLTT11sQ5+3aYaCOj4Q=; b=1Fbn2hIfGiUN2Cqe2b4dss05dU
	QMntEO+EBKpnTLswLzP4724RMkc9S5Qe177eSgjQgxIKL5iGkfo24Qrp5VFv+O+SD6qyj1ZHtcEx5
	DAecJB28WxByK/3hG5FEh/2oV6IThYjNNaQ8vBaiCUncMew2+ine2VhPCocWGkXFoC5F5iDU2OdtO
	YDRn1vQvlcNjcH2z7Eg5IInQmI6PmuQ7Lqye1c/2ivsEez9Fxlh9BMSoYku5B1LFf3vlInmwVMmuz
	nEgZYi45rEcrN7o+hWzAeo7lDffXu+vYHWe/2F7qcmfOu+gX0m7d0NPtoG109oj0c3lEE4y0KKCY1
	tYuAAEXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp96y-00000001e5H-3EsJ;
	Mon, 03 Mar 2025 16:57:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp94K-00000001dPz-1dX0
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Mar 2025 16:55:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=meSp1W4kNHGyd+88qlhZAmQUNLTT11sQ5+3aYaCOj4Q=; b=dpP3ry4wKDt94DgihnFO+YYQXP
	D4M9HLwKMcZ1dh8OJ465lh8hjlZIC4hPnM0yu+Bo48hJ25+geFXfhb2yh1JjsYv2G86e6y8Q9aA08
	EjLGlZwFQIXS8MWxtg4rTznMRQuyEvPa+WNLe2pvD+BteV4xvApnMYQJAC79Lfq83FC8K1mS128bN
	k9Syjw9M9tEsm1AZBCOn/Wwb3KXYOS3EzdY6uhs54+r5jAjfBJfy5gMkcPRofiRiBUAg2x+X/xWLJ
	kVME0QXIFcySMe3OdN/xZXFu4nYKpWhju6aKjV+25lMMlQM+XB+vJn3aeblxRU6/Kea/FDiBN5mio
	eEfj0fJA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tp94B-00000004aZY-0HlI;
	Mon, 03 Mar 2025 16:54:55 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 38C6E3006C0; Mon,  3 Mar 2025 17:54:54 +0100 (CET)
Date: Mon, 3 Mar 2025 17:54:54 +0100
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
Message-ID: <20250303165454.GB11590@noisy.programming.kicks-ass.net>
References: <20250303132837.498938-1-dongml2@chinatelecom.cn>
 <20250303132837.498938-2-dongml2@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303132837.498938-2-dongml2@chinatelecom.cn>
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

On Mon, Mar 03, 2025 at 09:28:34PM +0800, Menglong Dong wrote:
> For now, the layout of cfi and fineibt is hard coded, and the padding is
> fixed on 16 bytes.
> 
> Factor out FINEIBT_INSN_OFFSET and CFI_INSN_OFFSET. CFI_INSN_OFFSET is
> the offset of cfi, which is the same as FUNCTION_ALIGNMENT when
> CALL_PADDING is enabled. And FINEIBT_INSN_OFFSET is the offset where we
> put the fineibt preamble on, which is 16 for now.
> 
> When the FUNCTION_ALIGNMENT is bigger than 16, we place the fineibt
> preamble on the last 16 bytes of the padding for better performance, which
> means the fineibt preamble don't use the space that cfi uses.
> 
> The FINEIBT_INSN_OFFSET is not used in fineibt_caller_start and
> fineibt_paranoid_start, as it is always "0x10". Note that we need to
> update the offset in fineibt_caller_start and fineibt_paranoid_start if
> FINEIBT_INSN_OFFSET changes.
> 
> Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>

I'm confused as to what exactly you mean.

Preamble will have __cfi symbol and some number of NOPs right before
actual symbol like:

__cfi_foo:
  mov $0x12345678, %reg
  nop
  nop
  nop
  ...
foo:

FineIBT must be at foo-16, has nothing to do with performance. This 16
can also be spelled: fineibt_preamble_size.

The total size of the preamble is FUNCTION_PADDING_BYTES + CFI_CLANG*5.

If you increase FUNCTION_PADDING_BYTES by another 5, which is what you
want I think, then we'll have total preamble of 21 bytes; 5 bytes kCFI,
16 bytes nop.

Then kCFI expects hash to be at -20, while FineIBT must be at -16.

This then means there is no unambiguous hole for you to stick your
meta-data thing (whatever that is).

There are two options: make meta data location depend on cfi_mode, or
have __apply_fineibt() rewrite kCFI to also be at -16, so that you can
have -21 for your 5 bytes.

I think I prefer latter.

In any case, I don't think we need *_INSN_OFFSET. At most we need
PREAMBLE_SIZE.

Hmm?

