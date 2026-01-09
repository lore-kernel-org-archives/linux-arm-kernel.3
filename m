Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041ABD26D71
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 16:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=la9dS307TupTSfSOorfB/EvD/poUOL0lBV8mBrqsIVs=; b=vWiuaxzQPYVZsEjouscZVoEqg3
	hEjkc7n/bnMy9jwDn2GESDadmkzdf+QdkjsRWnz79pqXhmi4t+fDK7CWc9HRekibJa4qN5OaeCKcy
	kX71QFr8tb/Pc+KnnGe7U8h4wQ5qkir5MNz/Jkor1tHNk7mKh8wka5DTyZSo4aQQeTklw+RKOh307
	EH9ceTLiye436frQeA4JJYz0k4K9aKDpDM4HnaPHy2SvPDjzrsKmq88haJc8RciZI/T1LUjgLKHNJ
	LfKZUxSe5T1K57Wmg747AZM83wJoeFN5Z/xERbb2Nb4gBPqCuVcJB7LQLoTu7NK8PROUqEyFlLf0c
	y29OyflA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFCb-00000002bpF-2gct;
	Fri, 09 Jan 2026 16:19:05 +0000
Received: from smtprelay0011.hostedemail.com ([216.40.44.11] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFCZ-00000002bo8-248l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 16:19:04 +0000
Received: from omf15.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id E3C22B858D;
	Fri,  9 Jan 2026 16:19:00 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf15.hostedemail.com (Postfix) with ESMTPA id 4363717;
	Fri,  9 Jan 2026 16:18:58 +0000 (UTC)
Date: Fri, 9 Jan 2026 11:19:29 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Will Deacon <will@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mahe Tardy <mahe.tardy@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 bpf@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org, Yonghong Song
 <yhs@fb.com>, Song Liu <songliubraving@fb.com>, Andrii Nakryiko
 <andrii@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCHv2 bpf-next 1/2] arm64/ftrace,bpf: Fix partial regs after
 bpf_prog_run
Message-ID: <20260109111929.2010949e@gandalf.local.home>
In-Reply-To: <aWEG685zlaV0o7M7@willie-the-truck>
References: <20260109093454.389295-1-jolsa@kernel.org>
	<aWEG685zlaV0o7M7@willie-the-truck>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: g5kx9yn89q6xixp9gq3pya3dtjj3dsu6
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: 4363717
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19qsi8Pk5Vu+kdeg20pJJbgBKfhV4KVte8=
X-HE-Tag: 1767975538-271428
X-HE-Meta: U2FsdGVkX1+k08Bp3QsylDW1XUY030Ou3SOuOiBJuzqQrn9A94M/dpqz8X3nfwDKqnnVbEEliCPc3ELXIKAVy4dCjTds/KiSK0YAVaUyxBrQdyjWycqLMuDnawcIgbF5ETu5EXR4pVf10mB7SpXMONADy4nyxfBYihZI1sP1xcJXscf3rdJx4jiEyTCNUL5VrfBPhzbWl1RjOaSVWAXVmY0uwdLDC3mSjo/xkSR22uPeuFezKISdyb5ElbYL0lL5N79hZNCEdkjxdBE86ViDcMy8GIZ/pUFQ+1AMzCZP8Atv9c/qKrwpnv2Z/yOsnKm/qqmPNTnCwbrQD744cNBXW0hIpGolLxeV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_081903_588001_AC499B36 
X-CRM114-Status: UNSURE (   8.76  )
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

On Fri, 9 Jan 2026 13:47:23 +0000
Will Deacon <will@kernel.org> wrote:

> I think the AI thingy is right about dropping the const qualifier here
> but overall I prefer this to the previous revisions. Thanks for sticking
> with it!

Yep, I missed that too :-p

I do think AI is better at reviewing than writing code ;-)

-- Steve

