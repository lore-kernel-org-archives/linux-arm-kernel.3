Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3EF5CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 15:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HgeyInjIXQU1SYB8HKuRVQIkoYziaBkBkoorR2P7vZA=; b=akMNWPAHYFx5p7DZOPrRZ9ZsXt
	hel+qfl8P16vspRGSJQbEboGd2/lo8Efm2/RdmIYxUmrFYlRAcIKUGU1i2mAH35W4vX8WxWDAqB4/
	zbfT16hT3TZA6sTJW/L6UwURmyTtoHLgSoH2Yff/RkBnpN4sDS53hqzrKtjMIcWWDbssipjuhrQsu
	cPY5ilZqF78+sjXrxO3S4xDy/8CKYvsmGqFOzk9EAiMc3J4MSh/Jaqsg5mO5DFwJygF/ktN4kjMLB
	Ns5jPJP8sWbHeh6Kw/qVQunVR55ZgUzkzNRgbEZ8EDroVHqoIlq4NDUTeo6/r87e5x7KfB+KqBKm0
	jvv+Km1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI7BV-00000003seM-2Es1;
	Wed, 29 Apr 2026 15:50:45 +0000
Received: from smtprelay0016.hostedemail.com ([216.40.44.16] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI7BT-00000003se3-3FvY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 15:50:45 +0000
Received: from omf05.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 84BD8160247;
	Wed, 29 Apr 2026 15:50:40 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf05.hostedemail.com (Postfix) with ESMTPA id 8698A20010;
	Wed, 29 Apr 2026 15:50:38 +0000 (UTC)
Date: Wed, 29 Apr 2026 11:50:55 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Ian
 Rogers <irogers@google.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v18 7/8] ring-buffer: Cleanup persistent ring buffer
 validation
Message-ID: <20260429115055.5382d7c2@gandalf.local.home>
In-Reply-To: <20260430002139.c3b0e4c92ae52aeeaf86e1bf@kernel.org>
References: <177701351903.2223789.17087009302463188638.stgit@mhiramat.tok.corp.google.com>
	<177701357903.2223789.1327164275262010250.stgit@mhiramat.tok.corp.google.com>
	<20260428162457.1ca8c4b6@gandalf.local.home>
	<20260430002139.c3b0e4c92ae52aeeaf86e1bf@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 8698A20010
X-Stat-Signature: sqrnemtznnzr7j56kukz5uhwuwn85jcm
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19JJhd9jU6CcP4uqZdlABo4JmBtPjiC1l8=
X-HE-Tag: 1777477838-188142
X-HE-Meta: U2FsdGVkX18zimWYBuHxHvIEw6uRwdwrcz7J0yENChFgJ4XFT4TmvocOC2OcnSBx/1vztgK3qewSHr5b7ivIGfFzOqRaucCO4YxXKB0oXTsKN6CCISljeYYxD73IVV2F9gbzOfWn71hFJwsjwkZS590gVtiSd4u6eMVT13CKMd380U/UyAg1KDdfzeFw9SvsUwktu1UVce9BSXwzLcGeIbEmJtfiOZwbLD+gvkS50IKtGILnfAeBZbWFsaMEjfgwX1I79JfJDR8Z5SMVRGuOliqTqz5Cc1jHRCeFx6vMtWjdkjiZwCCW4eSoktzSJa5p8LHXz4jIhulS0KOV8ckqpqmPR1AkqxiB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_085043_876489_2FCBD47B 
X-CRM114-Status: UNSURE (   7.78  )
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

On Thu, 30 Apr 2026 00:21:39 +0900
Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:

> > Also, could you rebase on top of v7.1-rc1?  
> 
> Is it v7.1-rc1, not ring-buffer/for-next?

The ring-buffer/for-next has been merged with conflicts. I rather not add
more conflicts ;-)  v7.1-rc1 includes ring-buffer/for-next.

-- Steve

