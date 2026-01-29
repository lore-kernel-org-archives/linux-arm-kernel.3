Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47298D46C0F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 00:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FgmIQWMsZJ3hYa9UQ4OM7F4uyDlIQDUaImH2TWy8vl0=; b=zFDcsKbAOwS6BNxveySFLE51sv
	7L8+MxtonRIZseOHHSmCJdRgTar2jbZEjOvdmEogH+fNBDV1nEql4rudPWnD3LVF2xsQ49wFNvDG5
	1p09f/HI2ZQUJvXax2h5J1IJUsMMLvvJMGLR5oOQuThyCyKgzsotvzrTtJ0ECZgTDzIOLzzIQlSv9
	qj8RGilpEerg6lbwFbdLSkK9zZ/4D7HX96es4X4N/lmVn8P2AJbCyYIpNFxwHblSJmAozaTuMq58X
	Po8OpVlu+g4FFS0XXfdIS07zJIs+uho/ZoiyVwKwBAHKoEdNTV/VUvtCE7AXHIB24wQ3VjyyZlIE5
	o3Mv1nww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlFrW-0000000GyCY-3uwC;
	Thu, 29 Jan 2026 00:26:18 +0000
Received: from smtprelay0012.hostedemail.com ([216.40.44.12] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlFrL-0000000GyBn-0X3t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 00:26:08 +0000
Received: from omf16.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id D8785C2A1D;
	Thu, 29 Jan 2026 00:26:03 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf16.hostedemail.com (Postfix) with ESMTPA id 6D7752000E;
	Thu, 29 Jan 2026 00:26:00 +0000 (UTC)
Date: Wed, 28 Jan 2026 19:26:10 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 02/30] ring-buffer: Store bpage pointers into
 subbuf_ids
Message-ID: <20260128192610.705081e1@gandalf.local.home>
In-Reply-To: <20260126104419.1649811-3-vdonnefort@google.com>
References: <20260126104419.1649811-1-vdonnefort@google.com>
	<20260126104419.1649811-3-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: ujnetgib94ug6t6hojmscg4dka4y3p7r
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 6D7752000E
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19nwewCE2+i7VvsE8GxDLLQ6QU+hiCvMYo=
X-HE-Tag: 1769646360-135765
X-HE-Meta: U2FsdGVkX18dkm+4R6cqC70HRYkyAX2cnzh/6q2Jp/mV2p6gRJ7o5dSkCRv+cj0VZuBSl3b3nNq0Cus06vsEMWTZY+3b8Pl0ZillKzIAJuxM7kwtyk0tePDhGUoaQi4TZRxDLFm85DDb+kimh2xoKY3a813j5tTT34eLICmeZsQxALHwm2cxBTsQD8mpr8A38LTvdVoilFaPVXbINdws5OkBwQpy5+glzkEooaSSK9KfFplTmJ3nkN8DG/mk+lIkT27A+ZJ3cyLm+MeDpmLDhCHFAX8daUMXwCZC+oKKHW79CGKEW4EQ+Zgi1xB9Sq7fHAUWTk7b5ZK44T4mH4LRqTglAi5KlF066bG+HkU0/XraWwP4LRPKvPmd8nokAttWgclJ2MrhDvMMi8fz7c3cng==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_162607_227553_F3CF9CA5 
X-CRM114-Status: UNSURE (   8.62  )
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

On Mon, 26 Jan 2026 10:43:51 +0000
Vincent Donnefort <vdonnefort@google.com> wrote:

> The subbuf_ids field allows to point to a specific page from the
> ring-buffer based on its ID. As a preparation or the upcoming
> ring-buffer remote support, point this array to the buffer_page instead
> of the buffer_data_page.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve

