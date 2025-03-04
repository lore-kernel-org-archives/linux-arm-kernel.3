Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D77C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 09:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JV3pZtApgs6TqusViUPy5JRin7FrjXxYFUIaUJ+B9XQ=; b=SAxefWSRP1vNIklhn8fkSiTIBZ
	DFG1I7EtsUhZH2W2TF70U//ao+vUFbLcOw9K/36otCqh01vv7FOkKveNeGNs+P76W1R45qKYUV0Pq
	3d39Rte6g5nSitlEEb17zTTP/+fztgs+cbBspeg/pska1+tVFJH5J8SLRik1wFHGqUbXrwsKSPBSh
	g0OitXNFgE980Vt0IsqOe0VDYb0BxQ7+Pe490ZGuII7tjG8lfWkaq4aEQ5XqCUsWEfub+QZeQrX+r
	EiZK9rO93LbqyRp+EJ+pNFck1urdDvRnLEVLcEPPCgaO69lAv/iZhMAz1lwQYksFT0vRr9+MqHmrH
	TmBgzXpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOrU-00000003yNh-1kz5;
	Tue, 04 Mar 2025 09:46:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOnF-00000003wlw-2Wdk
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 09:42:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JV3pZtApgs6TqusViUPy5JRin7FrjXxYFUIaUJ+B9XQ=; b=sAD73dR4uuNhAcshhcuRcesBx+
	eJ/C3bmv3pIIe/mG1mLKwsxL767vF9XoYK+XuLoxcB4ZcWd01zg+ESguKuTlE8fSe3DBCudwCK4QH
	tUYunxwMMarMT59PtDZe7o+MBlfFzUHHgWTAWR/HFTAFBcE2XGKUZOY9ifY73IjijaOidM6spsxSE
	TFf3w0Ou4GRQUfvuK5g12RRqcEKAkz1yfN6u5AVhvvF8TmSgpmxj7ZOfmMqoCfnW2dmEM2XmvjPlQ
	vWR3ZzKEgCa2Xwz1NeUER743p8ylHJVVYcWFyw0T6x121cHcZEOlLl6WIzyfEXcfnVEJRzfC1fAmf
	rCLuWuRQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOn8-00000000YOw-0yQv;
	Tue, 04 Mar 2025 09:42:22 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5C1F230049D; Tue,  4 Mar 2025 10:42:20 +0100 (CET)
Date: Tue, 4 Mar 2025 10:42:20 +0100
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
Message-ID: <20250304094220.GC11590@noisy.programming.kicks-ass.net>
References: <20250303132837.498938-1-dongml2@chinatelecom.cn>
 <20250303132837.498938-2-dongml2@chinatelecom.cn>
 <20250303165454.GB11590@noisy.programming.kicks-ass.net>
 <CADxym3aVtKx_mh7aZyZfk27gEiA_TX6VSAvtK+YDNBtuk_HigA@mail.gmail.com>
 <20250304053853.GA7099@noisy.programming.kicks-ass.net>
 <20250304061635.GA29480@noisy.programming.kicks-ass.net>
 <CADxym3bS_6jpGC3vLAAyD20GsR+QZofQw0_GgKT8nN3c-HqG-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADxym3bS_6jpGC3vLAAyD20GsR+QZofQw0_GgKT8nN3c-HqG-g@mail.gmail.com>
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

On Tue, Mar 04, 2025 at 03:47:45PM +0800, Menglong Dong wrote:
> We don't have to select FUNCTION_ALIGNMENT_32B, so the
> worst case is to increase ~2.2%.
> 
> What do you think?

Well, since I don't understand what you need this for at all, I'm firmly
on the side of not doing this.

What actual problem is being solved with this meta data nonsense? Why is
it worth blowing up our I$ footprint over.

Also note, that if you're going to be explaining this, start from
scratch, as I have absolutely 0 clues about BPF and such.

