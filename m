Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0663D6ACDD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 16:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ri3oyhn3cmUHWZnx0G/RnmwJTn4zca2+sgITwmyQuus=; b=FpAq3FYFKwUwWk0WEym80uVbSZ
	a60C7TBlMidmIh3jh8c6hQAOwuI2/2h6RMNuWVVUqoeW0R4k+7s+5/xGnTDnUQOr3uft1X2WhZe7N
	sTXhJGthjdXqHxF4Bq53mT/NI1d1lvTC5Lkx9ZAhOea/KZOF5K53CRrfFCVNw2GPrQ3Wieq3Db2kr
	lZewBfxFWCi+JC9/rvcJ1FiVyTf4Nw2mmKnkEpCq7GWWgljngkogQKqX+ALovR3HeApfMCQowPDdf
	OfCHjpy7k/Vad+yWzEyf5fHRsj3e8mJ2ATHAiQApmYqs7IIlqRjrj8VXdqol/DObAqX8lqaG2a/uL
	Gc2lqbsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWGUT-00000008mTF-0UGa;
	Thu, 18 Dec 2025 16:04:33 +0000
Received: from smtprelay0017.hostedemail.com ([216.40.44.17] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWGUQ-00000008mRw-2T96
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 16:04:31 +0000
Received: from omf06.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 70388B7BE6;
	Thu, 18 Dec 2025 16:04:26 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf06.hostedemail.com (Postfix) with ESMTPA id 94F2B20012;
	Thu, 18 Dec 2025 16:04:23 +0000 (UTC)
Date: Thu, 18 Dec 2025 11:06:02 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Jiri Olsa <jolsa@kernel.org>
Cc: Steven Rostedt <rostedt@kernel.org>, Florent Revest <revest@google.com>,
 Mark Rutland <mark.rutland@arm.com>, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Menglong Dong <menglong8.dong@gmail.com>, Song Liu
 <song@kernel.org>
Subject: Re: [PATCHv5 bpf-next 8/9] ftrace: Factor ftrace_ops ops_func
 interface
Message-ID: <20251218110602.2e8d4663@gandalf.local.home>
In-Reply-To: <20251215211402.353056-9-jolsa@kernel.org>
References: <20251215211402.353056-1-jolsa@kernel.org>
	<20251215211402.353056-9-jolsa@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 94F2B20012
X-Stat-Signature: 1phd97uu84bs96m3sy5rbg85rg413raq
X-Rspamd-Server: rspamout05
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+aGNRDENTMUib0iCViJwboi4wcneSr5cU=
X-HE-Tag: 1766073863-938075
X-HE-Meta: U2FsdGVkX18wqY2inedRQwkLOcwAi6uSIlagwQEwRSozsWrmWC9XiMsbQkUViMmkKWgshcNt0feN+UGrRbD4sIwt0PpR5W4flywVA8swgabpJQrSQD1q3kZw+F+mzn06gWTFRQPiLRXKcCqjEov7W6o4v2NSdFFltZFHG5l7C534LaeD/OEOS/7T6rp9yitzxPtC9ZGxoZRCXNvBrRLR+nubARaxoAX2FB3mIdKPg8d7BCqwzuybYApSXYFQjwmpN9Qm4kYN/wtp/dc2mM82DVyKbIVNiJ9A6qF1WAzXlvvoAeQ7EmOP+bavKmFqNEGDPt5s+KALJ+N5+zweVE02LFsSbkM1UIcT/hb5kNOOHD/UXNF9af7wC1REpmPclS9xLs30cRSXIxq/Buu70dSHiw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_080430_705453_D43C91D5 
X-CRM114-Status: UNSURE (   7.88  )
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

On Mon, 15 Dec 2025 22:14:01 +0100
Jiri Olsa <jolsa@kernel.org> wrote:

> We are going to remove "ftrace_ops->private == bpf_trampoline" setup
> in following changes.
> 
> Adding ip argument to ftrace_ops_func_t callback function, so we can
> use it to look up the trampoline.
> 
> Signed-off-by: Jiri Olsa <jolsa@kernel.org>

This mostly touches bpf code so:

Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve

