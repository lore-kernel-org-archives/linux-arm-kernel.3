Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFE8C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 15:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1YhJvpJbWGqD5e7zDPMRnMkaA+A/Mj+tescBN5wjWJo=; b=TdXluIi/0ModNO3fgl6qaHsRo3
	8M+3abHZD8E9iGK3dpTtMoxNFEupNdB/+CFxc/0wh16n53cJW+dEwUxQG8eq0dM6N1N/YLxTI9kgY
	0aN2wq+uN9zZTItwYQ5+fLhL6PcIq9ARj0h88sOxY5YV7liI9Yr/xZiNOaZdF4rr6HGJspa9XHEKQ
	iDO2umcQfOHU4OHj1g+q/Ba2CrNk6coIiCuFZK2SqF8g1OGuFKMlGH7Gati+rx8FXR+jYo/jfoJGg
	wK2U4MKmx2N8LTBkOB+yCQtb2XFyiq9AjOyzbQHcsy6YygErVUCTukLI9vb0TioHKRR5LZ6BxvlIo
	WQR/KlAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk30Q-000000051vR-3E1z;
	Mon, 17 Feb 2025 15:25:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2vI-000000051Ah-0vXf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 15:20:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0C31CA41592;
	Mon, 17 Feb 2025 15:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2C8C4CED1;
	Mon, 17 Feb 2025 15:20:36 +0000 (UTC)
Date: Mon, 17 Feb 2025 10:20:55 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Jiri Olsa <olsajiri@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, bpf <bpf@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org, Masami
 Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton
 <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Linus
 Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas
 Schier <nicolas@fjasle.eu>, Zheng Yejian <zhengyejian1@huawei.com>, Martin
 Kelly <martin.kelly@crowdstrike.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Josh Poimboeuf <jpoimboe@redhat.com>, Heiko
 Carstens <hca@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>
Subject: Re: [PATCH v3 4/6] scripts/sorttable: Zero out weak functions in
 mcount_loc table
Message-ID: <20250217102055.53318267@gandalf.local.home>
In-Reply-To: <Z6_AQmaUWAekeB5B@krava>
References: <20250213162047.306074881@goodmis.org>
	<20250213162145.986887092@goodmis.org>
	<Z6_AQmaUWAekeB5B@krava>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_072040_333961_B3C0C4DF 
X-CRM114-Status: GOOD (  11.39  )
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

On Fri, 14 Feb 2025 23:14:26 +0100
Jiri Olsa <olsajiri@gmail.com> wrote:

> > +	while (fscanf(fp, "%16s %16s %c %*s\n", addr_str, size_str, &type) == 3) {
> > +		uint64_t addr;
> > +		uint64_t size;
> > +
> > +		/* Only care about functions */
> > +		if (type != 't' && type != 'T')
> > +			continue;  
> 
> hi,
> I think we need the 'W' check in here [1]

Good catch!

> 
> jirka
> 
> 
> [1] https://lore.kernel.org/bpf/20250103071409.47db1479@batman.local.home/

Bah, I just pulled from patchwork and forgot about that fix.

Will send a v4.

-- Steve

