Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197D010F6FDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 22:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pyBHn7qzUybysXlTbk+G57rp3vkHSkEUZN+ptF9UgBk=; b=1uyuyIv8RKG0kd9ZkeP9oW+r/0
	TQi0quOHFRtq99KlOjLenXYcCyy7nPZKNfJLDxHuix0QOYNu4H772mG7DDzh4BqMv9XDYADyNgpHm
	mEficAOp/lOldjM+MwZIqznPUKnjdMtDLMxKFFSlWcstQr50jhDRTeqUrC+b9mfN3cQ///Uo+NuaM
	9lDFZNyRVF3yWq7Z0y40EO//B6Zwia5syh6wzYKaVqnmJQsukTyo1K+isLW1yu4YUa1pr6Rddj9MN
	LDMSHoFnPRBhAPZyBV4QZtR5G5qJnhQFh96BVcuqsCGyEOwJ4GQBYgrh2Cfjb4AVuDF9OA6EoU1v0
	JAfbRTuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84Mx-0000000GKqK-2ROQ;
	Wed, 01 Apr 2026 22:49:03 +0000
Received: from smtprelay0010.hostedemail.com ([216.40.44.10] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84Mv-0000000GKpY-1tP3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 22:49:02 +0000
Received: from omf07.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id E9B8E1B70D0;
	Wed,  1 Apr 2026 22:48:57 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf07.hostedemail.com (Postfix) with ESMTPA id E013220033;
	Wed,  1 Apr 2026 22:48:55 +0000 (UTC)
Date: Wed, 1 Apr 2026 18:49:56 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Ian
 Rogers <irogers@google.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v15 5/5] ring-buffer: Show commit numbers in buffer_meta
 file
Message-ID: <20260401184956.05779460@gandalf.local.home>
In-Reply-To: <177494619878.71933.15471023049227398684.stgit@mhiramat.tok.corp.google.com>
References: <177494615421.71933.3679132057004156013.stgit@mhiramat.tok.corp.google.com>
	<177494619878.71933.15471023049227398684.stgit@mhiramat.tok.corp.google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: E013220033
X-Stat-Signature: 7ydm64zs6q36ih5bj874tya8q5qabn4d
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18xLFCJtgW/6rywKwhgmPKhOSFSTeWl0O4=
X-HE-Tag: 1775083735-804413
X-HE-Meta: U2FsdGVkX1+j77FDIruY/liap/2/xGIhwkL3Xxjf2K2oz+mQkua4FjGbaV6N59lcO4fkGZu4yb2B+rW0QG3TniRRWNscjngWlKXzNwGu7AZQasRaMeJwuatEZQUf9VufPAP6B5shQvs9SOnOHKP0RkvMJaGQnqBpwt5qxfERNQ2bSgS7kW132DMucNe98hx4ZUjCbWiS2uIUwpZ8CF0GbxuEPOYBynsQsHsN15cQLww32+s0Qi4k6RL/v8vTz542sR8FL01us0QiPk98+Y4tugWRhMPffTcR4oxdHwwODL3slPH2dzpgjkuy8bBwiHT4rs+4nUDRzRODd5cQBHfPYIuglP3kzbFO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_154901_583387_4D548011 
X-CRM114-Status: GOOD (  10.76  )
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

On Tue, 31 Mar 2026 17:36:38 +0900
"Masami Hiramatsu (Google)" <mhiramat@kernel.org> wrote:

> From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> 
> In addition to the index number, show the commit numbers of
> each data page in per_cpu buffer_meta file.

                 in the per_cpu buffer_meta file.

-- Steve

> This is useful for understanding the current status of the
> persistent ring buffer. (Note that this file is shown
> only for persistent ring buffer and its backup instance)
> 

