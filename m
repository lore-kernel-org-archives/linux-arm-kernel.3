Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91558D46C01
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 00:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TWSSR1Kp+R0G0slMfsVjPkCS8pP/CNtXw5UvMXwZMfc=; b=YkoEdQz6F0DVYkUyuOZjqBe0K1
	6Aq7TEsi/UL31U2KOMQYDpiR1ZQ0KdH3l86uLVByx5OlEZGm2dFNPuzBl3Lb2ASt9XninjWgSq1qJ
	Mfp2fsW5BpxKo5DfVLrh7/IAkB0LFuHKRWEhXW+Rw8aMDNXNDBTixML7bxrUj4KEdrAJ9C2BmsQoI
	vJ6Sj+lxJDCSZJ/Cde/OBIOrNAU9CAC+WSiHxQ2M0b+ly3PqMNcVZ6fI5s47YweIkAVRrKCtk0hMY
	ueKN74u3FllBckPkS04YzYGrirhiQUp9fTcIk8Hysvc2lcV1MNesT0QGGx2ZxTiz5OQKw1EZ/Nlfo
	DAyUUrJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlFrf-0000000GyF2-0vrY;
	Thu, 29 Jan 2026 00:26:27 +0000
Received: from smtprelay0012.hostedemail.com ([216.40.44.12] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlFrc-0000000GyDn-2rq4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 00:26:26 +0000
Received: from omf14.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 80678D458B;
	Thu, 29 Jan 2026 00:26:22 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf14.hostedemail.com (Postfix) with ESMTPA id EF0B63D;
	Thu, 29 Jan 2026 00:26:18 +0000 (UTC)
Date: Wed, 28 Jan 2026 19:26:28 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 03/30] ring-buffer: Introduce ring-buffer remotes
Message-ID: <20260128192628.79a34a6c@gandalf.local.home>
In-Reply-To: <20260126104419.1649811-4-vdonnefort@google.com>
References: <20260126104419.1649811-1-vdonnefort@google.com>
	<20260126104419.1649811-4-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: EF0B63D
X-Stat-Signature: uhmrud73kdr8woybqusxsioup13m367u
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+t7iG84us8MSiQ2nrNQ7ZWsO9Oq9yZUDQ=
X-HE-Tag: 1769646378-999802
X-HE-Meta: U2FsdGVkX1+bdwF6ot5uPAXO4UKg9m06342APJv10ilLiPixyUI0CFyy6j0Wj/mz6USzSld6iqIYjfII9chDfFeqOCTaZfvxnja7wGjtaTKXp1LbqX3ONComYLSnev9DGtru1uePYI+AhojequSwYIz7AV6hGNoriS7Gnu6FuRaH//dq+BmBRuYoOi47TGOozJNBG2yIPBGOGNCDwicj1dUXKBkyBSykqnKGmF8/x1NxAIhf9xTJmpEBVEH2qlCwGNiLwNqhyO4M8r5WGhLrJC4QuOvv/ueTJZLtWVJkEmyta9R547wZzPtH5+++tMlVfofAs0Tp4KOvhMxutVihpsrx6m5sAqmqs3DE9Ne+lw62cgRW2Pnq+js7nnOuKPdBuZsbiBft49LeZOJC01wZww==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_162624_813540_7E48F8BD 
X-CRM114-Status: GOOD (  10.00  )
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

On Mon, 26 Jan 2026 10:43:52 +0000
Vincent Donnefort <vdonnefort@google.com> wrote:

> A ring-buffer remote is an entity outside of the kernel (most likely a
> firmware or a hypervisor) capable of writing events in a ring-buffer
> following the same format as the tracefs ring-buffer.
> 
> To setup the ring-buffer on the kernel side, a description of the pages
> forming the ring-buffer (struct trace_buffer_desc) must be given.
> Callbacks (swap_reader_page and reset) must also be provided.
> 
> It is expected from the remote to keep the meta-page updated.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve

