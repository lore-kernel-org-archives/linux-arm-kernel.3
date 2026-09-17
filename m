Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7477DC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 19:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VUqmoZ9tkjprNUAzv5MpNYkWxkSqU7Rla2JQs5OrKPE=; b=1zkTbZt8Db+pHveAUrDGLgeCaD
	1RDSGHJvJ/HKwIawxRGt+OLCbu3nx/F9fw0ZXNQHcQeSpA8LJcVjX5+KI7IhtY7arZN1D1pVjqoxj
	Km3Bv0wRcAX4BkBpEeergsZ5pP8d7IqtShy4kta2mLCAt3HAc+U/oMIC9l6yLzIpDwzqTkQHfFEiQ
	Uo3XQHiYieJRKt96OhmmO78lis25S8+lVm0w4Y+rMamlIw9eCAIzc8vsuuTdeCFii4vKz2wCyOMsn
	/C+pj846l/XHtMyx/tUAT1j7UHqMgG3ITu2kdCgMDhJwLawEP7lpMb15719VWCpGFpcOUeOKo399u
	aZHkTDLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7H77-0000000CGw8-2Lep;
	Thu, 17 Sep 2026 18:45:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7H76-0000000CGw2-1vTZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 18:45:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2340643DF2;
	Thu, 17 Sep 2026 18:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C4C1F00893;
	Thu, 17 Sep 2026 18:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789670740;
	bh=VUqmoZ9tkjprNUAzv5MpNYkWxkSqU7Rla2JQs5OrKPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h33H9GduZ2Nbb//sSFkLLwqVDqBIdeknn/eumej5e7rnzoQFxi4MlgOnM2Gt6j7GB
	 iE3tvUHRv+ixjLq+DWgWPyT7DoF/CYAC3R4euNtsJ2N4LHOUWTuAenMrDCqNT8k0zG
	 U59UbDrs8tfw88NjPBWxAmzoXD7fWC5AStfO6GkpqIyMxP60IaZf1VURFo7L1a2N31
	 CZ97fG48sVdVZAt67BzNGDjQ2uyRlnAdjFzsJJASWRSNkAFHDnymfoO1wKmIi3sYQ/
	 uiC5mOc8yyM/Z/8oOa/Nnm/1UaEfhLKvQNS2zEGERuhrZ7oxaz7OX2ScghU6oH5ZC+
	 c1PYnG1LmvA9g==
Date: Thu, 17 Sep 2026 20:45:36 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Josef Bacik <josef@toxicpanda.com>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Boqun Feng <boqun@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>, x86@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Andy Lutomirski <luto@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>, Juergen Gross <jgross@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH RFC v3 03/13] rcu-tasks: Add a Tasks RCU implementation
 for reader-marked trampolines
Message-ID: <aqw1UNGO3cQxvCco@pavilion.home>
References: <edc7cca2-a5c5-455c-8969-ea05dbdb08f7@paulmck-laptop>
 <aqqONH8flTIpOUqT@localhost.localdomain>
 <91687748-0781-4133-baed-43cf82f35ff5@paulmck-laptop>
 <aqqpRoTfywUuTgoC@localhost.localdomain>
 <aqqsAUVV8a1yrQzX@localhost.localdomain>
 <6afb0afe-e7b8-46b4-9fea-2c7cf4791044@paulmck-laptop>
 <aqq0cwvRDsorGwgc@localhost.localdomain>
 <8b73e1b3-0580-4ba9-b2e0-6363e429808d@paulmck-laptop>
 <aqvZwfUVsiEI7q7y@localhost.localdomain>
 <8fea176a-0ca0-4a70-8cf9-8240a22359e4@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8fea176a-0ca0-4a70-8cf9-8240a22359e4@paulmck-laptop>
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

Le Thu, Sep 17, 2026 at 08:40:10AM -0700, Paul E. McKenney a écrit :
> > > Trampolines that transfer control to tracing code could supply the needed
> > > cleanup call.  But last I checked, there were trampolines that transferred
> > > directly back to the original code, with no opportunity for cleaning up.
> > > 
> > > Or am I still missing a trick here?
> > 
> > You're right. So we'll indeed need to reuse the deferred qs points here.
> 
> Except this is getting a bit involved.
> 
> Don't get me wrong, if Josef is happy to take this on, far be it from me
> to stand in his way.  But if not, we should be willing to treat this
> optimization as a follow-on effort, whether by Josef or someone else.

Sure, I guess I can try the follow-on, especially if it leads to removing
all this RCU tasks black magic.

Thanks.

-- 
Frederic Weisbecker
SUSE Labs

