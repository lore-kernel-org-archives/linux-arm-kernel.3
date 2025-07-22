Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5CEC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 19:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TVZpFCnLD2eUjqq0fiw2uYHWOugJKfnRHyw5zy4/hgc=; b=vKDL7pNn3KC2H+nKJkQjdvpFQH
	YiBDbSmxIPVFEQWhBwxSQOHLwDVhSvoQjxP3HakZEH8EUUvWy+ngDNUR7WGhkbOl+N+IE3+vRout1
	2VjPcVtbLmDw4C8IVOX/P/M+iWyxhsu+P+kUGDH7LExi9v23x4rqvQzN5MeCqFWrk2bGYzUl0sJgy
	lUvtYzJiwEV0wLSLS4CyEQFTppSW/vpc9WjK7PelmhcojhrPAWQhwxolHOca/VOSOpdZg9wqGxZX/
	YnTdI66qJ8rSDgK0ajCEWmBv6anWM2EqqH8Ze+8tGWA7OPvicArCamKsDxN7xQT/z96J5yfAveRe0
	uY96Mzfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueIfm-00000003M27-3m5l;
	Tue, 22 Jul 2025 19:29:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueIdG-00000003LY6-3UWm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 19:26:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67D681424;
	Tue, 22 Jul 2025 12:26:26 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B0BE3F6A8;
	Tue, 22 Jul 2025 12:26:28 -0700 (PDT)
Date: Tue, 22 Jul 2025 20:26:25 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Nicolas Pitre <nico@fluxnic.net>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] tracing: arm: arm64: Hide trace events ipi_raise,
 ipi_entry and ipi_exit
Message-ID: <aH_l4cCzzGB5Cd1K@arm.com>
References: <20250722103714.64eba013@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722103714.64eba013@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_122634_905999_947795A7 
X-CRM114-Status: GOOD (  12.22  )
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

On Tue, Jul 22, 2025 at 10:37:14AM -0400, Steven Rostedt wrote:
> From: Steven Rostedt <rostedt@goodmis.org>
> 
> The ipi tracepoints are mostly generic, but the tracepoints ipi_raise,
> ipi_entry and ipi_exit are only used by arm and arm64. This means these
> trace events are wasting memory in all the other architectures that do not
> use them.
> 
> Add CONFIG_HAVE_EXTRA_IPI_TRACEPOINTS and have arm and arm64 select it to
> enable these trace events. The config makes it easy if other architectures
> decide to trace these as well.
> 
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

