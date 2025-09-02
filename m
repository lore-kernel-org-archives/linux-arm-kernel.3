Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4745BCA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 21:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vafXsShjHcqkqqUbmMwx8jDPKmy/omG9aRFir+yZ4Po=; b=nVGcXaXRygEuI/1phOLOS56L1l
	Ex7l4KULeV6lqRwgG33/VX5rc1wZYDCAfUqQTLN4RKHrtwR3Qi1IoYv+mIte+uFRgHhI7qKfHkixr
	rrwoILQk6XM8zo5gRdIy0VwlD7kMOcGh7uBr7Y04XsChTUMQQnjmnv1Y0U0ahYw4N/UjfnEyAI/AW
	3L23zAed+WIsBG2/4oULdAN+1mehTf/xJjLOxnm0Lv2WO2H1bx7Wgw4vqdMtrqMGEpm8Cnw62b7qS
	CQ5ZIejl+8MGIJRvxAcAfVgtj/a1DWO20qoijEWnqzlj1NSDEH0RtdiClKVLL/UNw9jSODXL2Re/1
	2/CgarMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYm6-00000002AaJ-1qjh;
	Tue, 02 Sep 2025 21:42:46 +0000
Received: from smtprelay0013.hostedemail.com ([216.40.44.13] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utRml-00000000IJP-3vEC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 14:15:01 +0000
Received: from omf14.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id B0BE3118DE0;
	Tue,  2 Sep 2025 14:14:57 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf14.hostedemail.com (Postfix) with ESMTPA id D75B22F;
	Tue,  2 Sep 2025 14:14:55 +0000 (UTC)
Date: Tue, 2 Sep 2025 10:14:54 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Luo Gengkun <luogengkun@huaweicloud.com>
Cc: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 mathieu.desnoyers@efficios.com, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] tracing: Fix tracing_marker may trigger page fault
 during preempt_disable
Message-ID: <20250902101454.08ac4b51@batman.local.home>
In-Reply-To: <cc6eb973-d82b-4afc-83fb-a2c28cc79d36@huaweicloud.com>
References: <20250819105152.2766363-1-luogengkun@huaweicloud.com>
	<20250819135008.5f1ba00e@gandalf.local.home>
	<436e4fa7-f8c7-4c23-a28a-4e5eebe2f854@huaweicloud.com>
	<20250829082604.1e3fd06e@gandalf.local.home>
	<20250902005645.8c6436b535731a4917745c5d@kernel.org>
	<cc6eb973-d82b-4afc-83fb-a2c28cc79d36@huaweicloud.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: beakny4makx9cgn6wr3cpdqnepb7zwzk
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: D75B22F
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/Vny/0m1YTHEB86J0KxD22azBiTD+a6Bc=
X-HE-Tag: 1756822495-445596
X-HE-Meta: U2FsdGVkX184HKgOFkdHQFjK+vres2d7VudWt6HZdwYteDupaA5t8163Q1Cdzk5ffctsf+ji2tSeR5xXFP78YjW2zatrfZOwMQS2KXzu0/20/e5PEAyxQMHxTSY4wf58CvnSFV56gUR4RcAoGgEb7lyEro680Ri5G+pxONAwzgKFUOsfdU6EyC8jTEMSzTopv8FcBjcoOSWn5N/xHneyLIJ4gUrAyNA9C2KxeawuR5JgDJ9qcoy5jJisn1wz87OJ3F60Ef9bNyFGDjoS8aDfzta/VXK187CkvGH+uEbQPqMcpDc60Hi/LzR9u1XxahZwvUupmWNHDPJzAhT4eRnnmOz/bJDsUuBVg85WDSVDvNy9pa4VYNXIIw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_071500_030525_B0D0CFBA 
X-CRM114-Status: GOOD (  12.36  )
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

On Tue, 2 Sep 2025 11:47:32 +0800
Luo Gengkun <luogengkun@huaweicloud.com> wrote:

> > If this does not check the preempt flag, it is a problem.
> > Maybe arm64 needs to do fixup and abort instead of do_mem_abort()?  
> 
> My kernel was built without CONFIG_PREEMPT_COUNT, so the preempt_disable()
> does nothing more than act as a barrier. In this case, it can pass the
> check by schedule(). Perhaps this is another issue?

This is why I never triggered it. I always have PREEMPT_COUNT enabled.
I have tests that test without it, but I don't think those tests access
trace_marker, and if they do, they don't stress it.

-- Steve

