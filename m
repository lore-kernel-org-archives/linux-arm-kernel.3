Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1790C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 09:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1eCtu+hvRhYstMo2vG0z14zLR3g9gohNHmA5ExvpV9Y=; b=S5EoaSMuVeo7CMpPd9LK7aqX/C
	v8pQovgoBMRrWzx94ZNXlkTRrSbLwk9fzZ+ei4lWBSURD7EJtWErrInN1WBxNCgudFD3s/l674czC
	2Sw0mgTWA3Jm73ezSljL5u2nYNbj2vYdlbZJ53VwWlB3OGUAWRBtK9aqg7s3N2+85sOcxzPz7zAXv
	NYUKzlQNK0nNMkO3AB8qLIbQnHcToFqlmFuI7pBO9GReLe8gYPXHoLZM+ZwW/zx0qRhwZDEgHp9ec
	WiuXvRW4ymJxzFYEqxR0YuSugp7npz9Vgd7eT5vHU/WQtY61bJXL9aEoXacNNtXpMZQfu2UXsq6ST
	ZmpO2JYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp2E6-00000000AKW-2rGg;
	Mon, 03 Mar 2025 09:36:42 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1wJ-000000006eR-31ci
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Mar 2025 09:18:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1eCtu+hvRhYstMo2vG0z14zLR3g9gohNHmA5ExvpV9Y=; b=snAJ488rsQoq3hN1Z4FaRaQlQH
	9so+l3wlu5qJyjQKPK8rZIvWFrAiMCWsMVPirTbkAjAwy8KrNZ+PwvGMWz1dS6hh+eqcfMrNpEgYf
	yynraGfpogGIpEsCt74e2Zy1LrJYqjIRw74qWxaCNR4BikDoF52TN5wAe+PgIeHRpZCjkdquHdAm0
	mFMYGA1uwetI3N7IK/WIdZyNOmKr/fSFLOpHijzNTU+/3Z+CQKEh6ksGC9KIGKoHLh1JeC6QxOgHZ
	YL4PwFqb7dsxlsoSUc1CwOwL0YwuDz+NV41FSuuZwjc9FynHG9JVe1DWed11QXALcV2Nh3pHslyBl
	ifQrqumA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1wB-0000000BOR4-35ew;
	Mon, 03 Mar 2025 09:18:11 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5935F30049D; Mon,  3 Mar 2025 10:18:11 +0100 (CET)
Date: Mon, 3 Mar 2025 10:18:11 +0100
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
Subject: Re: [PATCH bpf-next v3 1/4] x86/ibt: factor out cfi and fineibt
 offset
Message-ID: <20250303091811.GH5880@noisy.programming.kicks-ass.net>
References: <20250303065345.229298-1-dongml2@chinatelecom.cn>
 <20250303065345.229298-2-dongml2@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303065345.229298-2-dongml2@chinatelecom.cn>
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

On Mon, Mar 03, 2025 at 02:53:42PM +0800, Menglong Dong wrote:
> index c71b575bf229..ad050d09cb2b 100644
> --- a/arch/x86/kernel/alternative.c
> +++ b/arch/x86/kernel/alternative.c
> @@ -908,7 +908,7 @@ void __init_or_module noinline apply_seal_endbr(s32 *start, s32 *end, struct mod
>  
>  		poison_endbr(addr, wr_addr, true);
>  		if (IS_ENABLED(CONFIG_FINEIBT))
> -			poison_cfi(addr - 16, wr_addr - 16);
> +			poison_cfi(addr, wr_addr);
>  	}
>  }

If you're touching this code, please use tip/x86/core or tip/master.

