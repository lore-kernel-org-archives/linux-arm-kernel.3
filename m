Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6059C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 12:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6iQmFx3kUgte9Kb2AwgmkALnfbli8g8jvKzg5SWVmE=; b=hYuUd96KuuSUv8cWW0qheRllTF
	TzprJ0GznKap4kbfackTW8Edow7i5NPqMRG6K1hUnjkAIGRuuqQs6wVbr6OSDGQEBOj40OpC9GOEf
	i89E7wihtRN6UKuWFaHBBhxWeLF2dQsNPFmO+n2lg0ps99d30sjg2HEF7rc3ssLzD8OzQ1IPfXwkp
	pd1oLiBHuyjPJHQQpDmSPaYclAZoiDVJpVBeYOTyM9dEm1FuWQp7QRmiTw/QcmxrwKuHKnoqtUrTg
	3diE43IKtPwTGuOgk/n140WtuuIPHumseWmd+k5Gi4uzmx4DTTgAOKtoHXgKFfWqaQdyMdcTS4ayO
	bVCsGKdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp4gN-00000000hv6-1np4;
	Mon, 03 Mar 2025 12:14:03 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3un-00000000Xgg-2KVQ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Mar 2025 11:24:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=z6iQmFx3kUgte9Kb2AwgmkALnfbli8g8jvKzg5SWVmE=; b=A6svpFLx+pNLGKW0tQeTqsPM61
	1sm+BtaqdI70N/rG9pstcBbdXlHScuTkqQnDqfdrYnfnmHc9BvSWs6YCfM9mtpWuVljrgeOdkC0Mf
	b284F5lp92X7GTV3DQYSjf+23RGk+32PSJDejGnbDytInBeqTNlBuArnjtB1UYjD16srlrNS3TI5Z
	ElkOaUwZxJiCGlzU8HJuBDVHNM8Aze3yU9ran6C78MVRLOpvw8aO5ZgS02CujS7InNxCFfYJ0nErI
	5Ipj4oT8pK0hYd62nQyVqTc/QrCYNI2Wm7/8Mlz6f54WLv1e42wgVY6XMTmAKjaIYUKLdtnxSRnpL
	Si5MMx6Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3uj-0000000BXXv-1WAU;
	Mon, 03 Mar 2025 11:24:49 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B6C223002C7; Mon,  3 Mar 2025 12:24:48 +0100 (CET)
Date: Mon, 3 Mar 2025 12:24:48 +0100
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
Message-ID: <20250303112448.GZ11590@noisy.programming.kicks-ass.net>
References: <20250303065345.229298-1-dongml2@chinatelecom.cn>
 <20250303065345.229298-2-dongml2@chinatelecom.cn>
 <20250303091811.GH5880@noisy.programming.kicks-ass.net>
 <CADxym3as+KdeBMUigq4xq302g2U7UG-7Gm+vKiYGnSjHouq=bg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADxym3as+KdeBMUigq4xq302g2U7UG-7Gm+vKiYGnSjHouq=bg@mail.gmail.com>
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

On Mon, Mar 03, 2025 at 06:51:41PM +0800, Menglong Dong wrote:
> On Mon, Mar 3, 2025 at 5:18 PM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Mon, Mar 03, 2025 at 02:53:42PM +0800, Menglong Dong wrote:
> > > index c71b575bf229..ad050d09cb2b 100644
> > > --- a/arch/x86/kernel/alternative.c
> > > +++ b/arch/x86/kernel/alternative.c
> > > @@ -908,7 +908,7 @@ void __init_or_module noinline apply_seal_endbr(s32 *start, s32 *end, struct mod
> > >
> > >               poison_endbr(addr, wr_addr, true);
> > >               if (IS_ENABLED(CONFIG_FINEIBT))
> > > -                     poison_cfi(addr - 16, wr_addr - 16);
> > > +                     poison_cfi(addr, wr_addr);
> > >       }
> > >  }
> >
> > If you're touching this code, please use tip/x86/core or tip/master.
> 
> Thank you for reminding me that, I were using the linux-next, and

That must've been an very old -next, because that wr_addr crap has been
gone a while now.

Anyway, thanks for moving to a newer tree!

