Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FD2CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 10:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qwEPGVF6k0KKEQRORUm5Fi3OIcHq+EvZJbU46l1D5/Y=; b=mKv2ZMmVYNzC+xyqhRINBjC1IA
	WbGyPDce3xqbLP0QFMI4bPbj+N2NzwjB1gIzRRfY3riznvCaT9+/1N6YFGmqDsMhniY+xwJeqiV3X
	iyR5xF2Q5QWeGd3FbSY4BFj1F/C6cT7c1gh5YiDOUujo+tz3n89ZPIrXt1XusH1YWIm79ZZPcmB58
	eW+nf1xcUUOn2PYNiTge8+0hDnYss+NGyaGpHiVeLbcJo/IRgKQWV4wEZ7JXp+eTRk6JrgewYYSmB
	YYQmUZz0HQl6zbUlZlFK39FKyuE2Ut48sD0roCPCvxAmf9G3JXJQIj2+1HWS6hI6g5u0vsbnrIoCM
	QLW88Brg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbFa4-00000003uUm-06tK;
	Sun, 21 Jun 2026 10:39:12 +0000
Received: from smtprelay0010.hostedemail.com ([216.40.44.10] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbFa1-00000003uUR-0QKc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 10:39:10 +0000
Received: from omf15.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id A4F80403B5;
	Sun, 21 Jun 2026 10:39:03 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf15.hostedemail.com (Postfix) with ESMTPA id A063517;
	Sun, 21 Jun 2026 10:38:58 +0000 (UTC)
Date: Sun, 21 Jun 2026 11:38:55 +0100
From: Steven Rostedt <rostedt@goodmis.org>
To: Thomas Gleixner <tglx@kernel.org>, Steven Rostedt <rostedt@kernel.org>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
CC: Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 John Ogness <john.ogness@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>, Julia Lawall <julia.lawall@inria.fr>,
 Yury Norov <yury.norov@gmail.com>, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-rdma@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-nfs@vger.kernel.org, kvm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_2/2=5D_tracing=3A_Add_CONFIG=5FTRA?=
 =?US-ASCII?Q?CE=5FPRINTK=5FDEBUGGING_to_clean_up_kernel=2Eh?=
User-Agent: K-9 Mail for Android
In-Reply-To: <87ik7cmcb7.ffs@fw13>
References: <20260621093430.264983361@kernel.org> <20260621093811.168514984@kernel.org> <87ik7cmcb7.ffs@fw13>
Message-ID: <65FD4729-3DEB-44BF-B085-1F72A0B7BF3A@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Stat-Signature: 1rpq566iuu696tbe6de19udoqya4ijdw
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: A063517
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+altd1Yz9Y3NVTA4Q+RMlDrpJ2CoeKO4s=
X-HE-Tag: 1782038338-801961
X-HE-Meta: U2FsdGVkX1+UIJ7kmLtbV5k3wlv8csQwDalYtg7WqKufnOv7be+VuRDa3ft8H3X3zzwfr+uJaQZNz0sDC4oyI98+t0mZe8z4QM7YVjOJ7k9IvaQO5X/gwLzm/T/snIDf9B1tqJjVQMbg/Fnqr36PDksXLybxk5Wk4szMxT0dI7RGk8YrmbCkpbiPzakXtErPJu/4LvGLwyxtHWX9zek973SlOgxvLlgqkXDRAT2+DqJr5WMtzWdQf68LXDneXrIH36GLwhtQHs9JqXlxGiQxIii+hAq+RQvxokuLaf3ukb8Kl6fOR60wgmpjUFzbMjevVHTotC5pRIjw762yNXa4cwdML3kSKjmj+IzsGxPuo8Puez99eB9siQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_033909_219687_9A8D7315 
X-CRM114-Status: GOOD (  14.95  )
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



On June 21, 2026 11:13:00 AM GMT+01:00, Thomas Gleixner <tglx@kernel=2Eorg=
> wrote:
>On Sun, Jun 21 2026 at 05:34, Steven Rostedt wrote:
>> Instead of having trace_printk=2Eh included in kernel=2Eh, create a con=
fig
>> TRACE_PRINTK_DEBUGGING that when set will update the CFLAGS in the
>> Makefile to allow developers to add trace_printk() without the need to =
add
>> the include for it=2E Having it included in the Makefile keeps it from =
being
>> in the dependency chain and it will not waste extra CPU cycles for thos=
e
>> building the kernel without using trace_printk=2E
>
>IOW, you make it worse just because=2E
>
>With the header being separate I add the three trace_printk()s and the
>include to the source file I'm investigating=2E The recompile will build
>exactly this source file=2E
>
>Having to enable the config knob will result in a full kernel rebuild
>for no value=2E
>
>Seriously?

Like having lockdep enabled, this would always be set in the development e=
nvironment=2E It's not something to only enable when you need to add a trac=
e_printk=2E If you don't want to rebuild everything, by all means add the i=
nclude file by file=2E There's nothing preventing you to do that with this =
solution=2E

-- Steve=20

P=2ES=2E I'm replying on my phone as I'm in the London Tube=2E Thus why I'=
m not trimming my email=2E


>
>Thanks,
>
>        tglx
>

