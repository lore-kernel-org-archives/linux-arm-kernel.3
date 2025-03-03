Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8C4C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 16:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L8SAWAB4djJMG4i89T65LcfsjufIZc7grl/P3ihfzow=; b=nlQOGgX9C0qpLgh56arOmQxjL8
	90H0J0RYkl6OJixRhfb3aL3XB5FfLrx+GJJ9r+KEO1ZqDGJfpUE6y5gaQThgAt/5bd0EbAXRRHi42
	/Y1MRd84ApmGDwIqIxMmF/hGFFc+IdsdtE9DhUOR85xPSs63kWUcVz5IByDQp4uckGbPkccqy1CoE
	GF3VP/oYiV4wBP+UEGqkZ8ES3p08VzBYgmPHh5SuS24/Nx2GRDcfCIUffz5aHf9fS7OByoWUvf1KL
	HRFeWlra1uz/uRxKdaV59Z4CEwUVptROx7J8cQ9tFO7wqgm1K7CtNX1xFnisF3fHaXPuW76v9ObO2
	UMJDVJeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp8Sc-00000001TOa-37bm;
	Mon, 03 Mar 2025 16:16:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp8I5-00000001Qht-2uHk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 16:05:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 70AD65C5A05;
	Mon,  3 Mar 2025 16:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA387C4CED6;
	Mon,  3 Mar 2025 16:05:07 +0000 (UTC)
Date: Mon, 3 Mar 2025 11:05:59 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Menglong Dong <menglong8.dong@gmail.com>
Cc: peterz@infradead.org, mark.rutland@arm.com,
 alexei.starovoitov@gmail.com, catalin.marinas@arm.com, will@kernel.org,
 mhiramat@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
 eddyz87@gmail.com, yonghong.song@linux.dev, john.fastabend@gmail.com,
 kpsingh@kernel.org, sdf@fomichev.me, jolsa@kernel.org, davem@davemloft.net,
 dsahern@kernel.org, mathieu.desnoyers@efficios.com, nathan@kernel.org,
 nick.desaulniers+lkml@gmail.com, morbo@google.com, samitolvanen@google.com,
 kees@kernel.org, dongml2@chinatelecom.cn, akpm@linux-foundation.org,
 riel@surriel.com, rppt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next v3 3/4] x86: implement per-function metadata
 storage for x86
Message-ID: <20250303110559.5a584602@gandalf.local.home>
In-Reply-To: <20250303065345.229298-4-dongml2@chinatelecom.cn>
References: <20250303065345.229298-1-dongml2@chinatelecom.cn>
	<20250303065345.229298-4-dongml2@chinatelecom.cn>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_080513_776977_3FDAA497 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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

On Mon,  3 Mar 2025 14:53:44 +0800
Menglong Dong <menglong8.dong@gmail.com> wrote:

> In the third case, we make the kernel function 32 bytes aligned, and there
> will be 32 bytes padding before the functions. According to my testing,
> the text size didn't increase on this case, which is weird.
> 
> With 16-bytes padding:
> 
> -rwxr-xr-x 1 401190688  x86-dev/vmlinux*
> -rw-r--r-- 1    251068  x86-dev/vmlinux.a
> -rw-r--r-- 1 851892992  x86-dev/vmlinux.o
> -rw-r--r-- 1  12395008  x86-dev/arch/x86/boot/bzImage
> 
> With 32-bytes padding:
> 
> -rwxr-xr-x 1 401318128 x86-dev/vmlinux*
> -rw-r--r-- 1    251154 x86-dev/vmlinux.a
> -rw-r--r-- 1 853636704 x86-dev/vmlinux.o
> -rw-r--r-- 1  12509696 x86-dev/arch/x86/boot/bzImage

Use the "size" command to see the differences in sizes and not the file size.

$ size vmlinux
   text    data     bss     dec     hex filename
36892658        9798658 16982016        63673332        3cb93f4 vmlinux

-- Steve

