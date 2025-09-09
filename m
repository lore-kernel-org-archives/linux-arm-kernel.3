Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C36CCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kPBURoTNkJXW7EpVzkbTwxUkR97vshlQdiL+7mT2kdM=; b=06RLWZGiKrglAr7b5Nw7e3e8B4
	CKA0/HxzdjC/TxyXBSDgwVQ7XoXRNTZ+L167H7+XcZscGBEagiQJgg3Md1HhX2wi7XityYCKrRUSj
	dyh/TiddfSWvl186EJvMElgy1NhcFB3O6dssoYwzlv5b29evXl7qHaQrWyKsgDrwTvFT14l86glt4
	+GCxAPRzPhviHGkCqi8QYsf8clVaUj+3435YVmH0BTqShmlulh/6SXD2NfmAwY+4go1/4ZsmehDK8
	ctQK6Trk26xC1LB1tnFi6dAje1sRwQKB8uq910NkpYqhix9HmvLKqoSN5IrJWGfv35AHFOomZwoS+
	xGl2thIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1zj-00000008tuN-32X6;
	Tue, 09 Sep 2025 17:19:03 +0000
Received: from smtprelay0012.hostedemail.com ([216.40.44.12] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvyXw-00000007RZB-1GOX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 13:38:09 +0000
Received: from omf10.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 3E1F0C0522;
	Tue,  9 Sep 2025 13:38:04 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf10.hostedemail.com (Postfix) with ESMTPA id D27A430;
	Tue,  9 Sep 2025 13:38:00 +0000 (UTC)
Date: Tue, 9 Sep 2025 09:38:48 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 03/24] tracing: Introduce trace remotes
Message-ID: <20250909093848.402674b7@gandalf.local.home>
In-Reply-To: <aMAYvA9LSvfxvt_C@google.com>
References: <20250821081412.1008261-1-vdonnefort@google.com>
	<20250821081412.1008261-4-vdonnefort@google.com>
	<20250908193606.47143d09@gandalf.local.home>
	<aMAYvA9LSvfxvt_C@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: D27A430
X-Stat-Signature: 1s7jby4e1f59eijakdh5dmnw6a8s4s5n
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+b/T21/hKOjzR7gNCBVyeet5D9OLclCrM=
X-HE-Tag: 1757425080-965095
X-HE-Meta: U2FsdGVkX19VwrFDIvaXh2/25xJubPmnV4q+Sr9wRzIe2LHd9NOD0fypN81SxorUfRNk3louWVAXupbKvR6AOCmY8xCfj+sDUCOjQ8oGOwFNHSJ6YRbmIsjYM8XqtOZsZdSQ4hCfEuM3e9AiUGJsD9nrIdcLRQM9zLWzAWVK9hwbZGIlN7Tdv/KV/Bk5NuYjXXwkQVGMeDrVUrA5os9pgJsBCYk0kJKo33fzgzqt1s7NA2vswDqZN9ZJUAoexPIgv1bq2izsTWIPEl0KhVLd1eR3j6H4waYdR2NxW2whBncEsO54iFRPoRneqfcuqrHpMSD3xgydcOOS5876As3l4P7rFStwpDgM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_063808_414076_312C25CE 
X-CRM114-Status: GOOD (  16.36  )
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

On Tue, 9 Sep 2025 13:08:28 +0100
Vincent Donnefort <vdonnefort@google.com> wrote:

> > > +		rb_desc = __next_ring_buffer_desc(rb_desc);  
> > 
> > Is there no check to make sure that the cpu mask matches what the rb_desc
> > will have?  
> 
> The function is filling rb_desc[], based on the cpumask input, so both will
> match when returning from this function.
> It is then easy to handle the case where some CPUs are not part of the cpumask.
> See remote_test_load() where for_each_ring_buffer_desc() iterates over all the
> CPUs from the trace_desc but uses rb_desc->cpu.
> 
> Is it what you meant?

I'm more worried about the allocation not being big enough for the rb_desc
being filled. I just noticed that the trace_remote_register() function is
missing a kerneldoc header. Please add one and specify what the parameters
are for as well as their requirements.

It's fine to state that the allocation of desc must match what the cpumask
is. But the lack of comments about what the function does and what is
expected of the parameters makes it hard to know if it is performing
properly.

-- Steve

