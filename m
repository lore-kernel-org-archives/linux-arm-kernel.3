Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FCDE92734
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 16:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HmUgq1yr7Ldrp6As2Z2B3JdatI+KSxe5tvhmxvD24NQ=; b=viL/IdI0FtgawDQg8nec/+aoVP
	+9bsbjykiv8AtZd7X0H9GtcgWqve+sfKxHYhgP8qCboUwHaSbpPK/pn5qifp7YGiZR87e6DE/eCRl
	xXOBjRSJpsrUuFvrmRYrT0FAYGDsHgArpPm/uR8BICMIumhQRk8sI7Ibtlp34fYk0Gr/I1DuyBXLN
	AfQiLXXStbS3RMF38Jknujt9xnpcrRlUt/Mr20To+eu7so5+4YTw4Re0kIGxt3LvUHDkBCOX74FoZ
	Xz43Ru+ODYKDbqS38yZwwU3w55K4mAxPDblDtV2WRW6/Isp20bDRTy8lVo1jP4bP/RVzXw64xfeLG
	amOFcB6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaFig-00000003rWi-1wt3;
	Mon, 29 Dec 2025 16:03:42 +0000
Received: from smtprelay0017.hostedemail.com ([216.40.44.17] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaFie-00000003rWI-0zgZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 16:03:41 +0000
Received: from omf06.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 1FCD31401C3;
	Mon, 29 Dec 2025 16:03:35 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf06.hostedemail.com (Postfix) with ESMTPA id 5275D2000F;
	Mon, 29 Dec 2025 16:03:32 +0000 (UTC)
Date: Mon, 29 Dec 2025 11:03:37 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Steven Rostedt <rostedt@kernel.org>, Florent Revest <revest@google.com>,
 Mark Rutland <mark.rutland@arm.com>, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Menglong Dong <menglong8.dong@gmail.com>, Song Liu
 <song@kernel.org>
Subject: Re: [PATCHv5 bpf-next 9/9] bpf,x86: Use single ftrace_ops for
 direct calls
Message-ID: <20251229110337.030232e0@gandalf.local.home>
In-Reply-To: <aVFLKgZ56wt5aLci@krava>
References: <20251215211402.353056-1-jolsa@kernel.org>
	<20251215211402.353056-10-jolsa@kernel.org>
	<20251218112608.11a14a4a@gandalf.local.home>
	<aUUanPijlWsDlS0X@krava>
	<aVFLKgZ56wt5aLci@krava>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: wk4rtw6rr6g4p4h5uhrzm8w5hsw49mbm
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 5275D2000F
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+B2wF6tKeYH5GnSEs+kzFmQoFDKLjrxgk=
X-HE-Tag: 1767024212-326374
X-HE-Meta: U2FsdGVkX1/bW0jhkTC4A5lBxmoz7injUkXEiRwc49PHTrEtedO+o2+EF7kEIX13OfCkWR8cfC/wf6yKI/Q0NQDlTnSJsNmpf4yT0wpVV+N4nepWY5mkqko6TEbEej1Hr/XBJOTUmUhLNAw+F8Po9cqWSf80LUhYgReNteLIHYoT3xCo0TXT+IvZW0BFzVvJMpeRVZg0aujEtfTujLBdfwJ6gs/3VmkTqwGCQMfW0cPRs+W71KOxMC0xTVONhn/fO58DXW07r0HY13AiCiGRLvic7zoMOT1W6fEzioF/e36A4d8P1U4RXDcCu+d2MOGF7nIBtPhn3X26ymHlZZaJMYNK8sq9I5FMZaPIESRM/MU5RtaPB+ULqw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_080340_350224_4650896F 
X-CRM114-Status: UNSURE (   6.61  )
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

On Sun, 28 Dec 2025 16:22:18 +0100
Jiri Olsa <olsajiri@gmail.com> wrote:

> actualy, it seems that having it the original way with adding the rest
> of the wrappers for !CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS case is
> easier AFAICS

I'm fine either way.

-- Steve

