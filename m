Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F92D26D6F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 16:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QDtFysfA6XuuTZ/zLbqaNetDzuY1NOgmW5npBz/xxvE=; b=xlELFo/vo92WO1+Hl8v5Ti6I/Q
	8JONBZadeeXYmOqtTTzRiHpoVQvCsYca7mWKxHs1ofxbLGPv6xDUtQztG9mxDFt4FDreC2Og/dZzE
	FrsZpU+m7hw0hPWxHFMqp2lVV0QJt8YGraGHHn5w4skK+19yf4vWR9/t2jNzLGs6rIzrbj07z6K7K
	eSmDwq1WMAdfZVRvRN3KIV9zclbUdH2es5mbnxOo5NdiJDLoiyVMU+oe5MmVIEX/JxIxgFSCndAZQ
	p/MK9ea6cxudsSLLXrQ5PejzLtWyiq5mVZTJgeiPauIM9r33HS1mDJd1ww0MKYwLiKaYacXoFqGoi
	qNB+wCwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFBN-00000002bOC-0c0x;
	Fri, 09 Jan 2026 16:17:49 +0000
Received: from smtprelay0014.hostedemail.com ([216.40.44.14] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFBE-00000002bJS-2DUd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 16:17:47 +0000
Received: from omf07.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 40B7F160333;
	Fri,  9 Jan 2026 16:17:36 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf07.hostedemail.com (Postfix) with ESMTPA id 7C3552002C;
	Fri,  9 Jan 2026 16:17:33 +0000 (UTC)
Date: Fri, 9 Jan 2026 11:18:04 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Jiri Olsa <jolsa@kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Will Deacon <will@kernel.org>,
 Mahe Tardy <mahe.tardy@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 bpf@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org, Yonghong Song
 <yhs@fb.com>, Song Liu <songliubraving@fb.com>, Andrii Nakryiko
 <andrii@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCHv2 bpf-next 1/2] arm64/ftrace,bpf: Fix partial regs after
 bpf_prog_run
Message-ID: <20260109111804.481a6f20@gandalf.local.home>
In-Reply-To: <20260109093454.389295-1-jolsa@kernel.org>
References: <20260109093454.389295-1-jolsa@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout06
X-Rspamd-Queue-Id: 7C3552002C
X-Stat-Signature: f8aus8gwt9gwwghji8dnqrqaet4ioy6e
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+dsryzGlYq/IBaVcXmTxW02qO+AtSzCCE=
X-HE-Tag: 1767975453-939575
X-HE-Meta: U2FsdGVkX195HTS3PXdoSrXMaKW9jSAqMC2F/Zr2Crpg0MiCloYO/UukNadfj8DBKa27oZ27laPKm/4He9R+NuUHpk6ZGtccKIKcGfY1T9mIju3yta15pVGhCsAjwPOP6oPCBuH/XmjyjXw8274URJ7oA7jwvw5b9EtIk662f2w5s+yFnw8OyJioll9LUPMhshmXpiMGzRVnTS+iMFJgImpS30y4O+Wj1gMyXdQMGCq5Fx+WF0QEa+qLcbzoI456A5q7Jgyv5eEIOt5SDZHm9yUWIjNt/aDsZdfMPQ5ZpY90q7BzwAsiwGprE//EDWLHCDd3z+Ajbnnh14kJleRYrTL+ooQCFoK6kixAZ3n8EeCIvhGQdH0Z/SLDZxU8yTijGfgy/xE9hzqWJAJEcCDEySYDlazdn704J1SZt0Bu7jc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_081740_678303_F162E75D 
X-CRM114-Status: GOOD (  12.82  )
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

On Fri,  9 Jan 2026 10:34:53 +0100
Jiri Olsa <jolsa@kernel.org> wrote:

> Mahe reported issue with bpf_override_return helper not working when
> executed from kprobe.multi bpf program on arm.
> 
> The problem is that on arm we use alternate storage for pt_regs object
> that is passed to bpf_prog_run and if any register is changed (which
> is the case of bpf_override_return) it's not propagated back to actual
> pt_regs object.
> 
> Fixing this by introducing and calling ftrace_partial_regs_update function
> to propagate the values of changed registers (ip and stack).
> 
> Reported-by: Mahe Tardy <mahe.tardy@gmail.com>
> Signed-off-by: Jiri Olsa <jolsa@kernel.org>
> ---

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve

