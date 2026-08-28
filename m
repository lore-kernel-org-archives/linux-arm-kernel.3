Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8EE1C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 14:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=txgaP3eXPwGHZiNk+kzD9nMiqpi6Z8kpuswwMKDKk10=; b=MOeEd4sQV+iF6NVk5e7QV9YrXF
	r+W0fftzVRRyaTLmwpUgea14MO7bXGGlXUf4BwoEPcbqOAPm6KlWMIWHo08PKXFWgfnHBqTIC33Ov
	cO+l5Q02Q0+zr/bf3UOhUEkdm0fgaO1XfMAD8S3pAfBRltRDXke0r2s+6Tk4kH3DFlgmvvAyCiJML
	9n1uR+yYxRTk9LPnl6ltpJSsUBN+xvtVoTvYiDDecOp+MMD9zsIgHQCXg+0fmEKpdXIfk/7yrM4aJ
	qlSFzKg2NVbJH/IUMrMy16vtbIt4banNgGIBwR4FqG6pEMVZSoNKPScV1iWMD0gIfp65XKebTbv+5
	uf/HKdeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzxdZ-00000005zoe-0F02;
	Fri, 28 Aug 2026 14:32:57 +0000
Received: from smtprelay0016.hostedemail.com ([216.40.44.16] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzxdW-00000005zo2-3Tq5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 14:32:56 +0000
Received: from omf08.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 56281A03CB;
	Fri, 28 Aug 2026 14:32:47 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf08.hostedemail.com (Postfix) with ESMTPA id 68DD520027;
	Fri, 28 Aug 2026 14:32:38 +0000 (UTC)
Date: Fri, 28 Aug 2026 10:33:28 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: David Stevens <stevensd@google.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Andrew Morton
 <akpm@linux-foundation.org>, Dave Chinner <david@fromorbit.com>, Qi Zheng
 <qi.zheng@linux.dev>, Roman Gushchin <roman.gushchin@linux.dev>, Muchun
 Song <muchun.song@linux.dev>, Juri Lelli <juri.lelli@redhat.com>, Vincent
 Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, Mel Gorman
 <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek
 Nayak <kprateek.nayak@amd.com>, Uladzislau Rezki <urezki@gmail.com>, David
 Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R .
 Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike
 Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal
 Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, Sebastian Andrzej
 Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>,
 suleiman@google.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-rt-devel@lists.linux.dev, jstultz@google.com
Subject: Re: [RFC 00/10] Reclaimable kernel stacks
Message-ID: <20260828103328.633bbfbc@gandalf.local.home>
In-Reply-To: <20260828124758.GP687043@noisy.programming.kicks-ass.net>
References: <20260827232948.2520558-1-stevensd@google.com>
	<20260828124758.GP687043@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 68DD520027
X-Stat-Signature: ztkfmnrpgu49shqhx5dux69fx5guyh4n
X-Rspamd-Server: rspamout07
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/SjYl3uwJx4/ioiGGgwrjcuLujqecRKpg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=txgaP3eXPwGHZiNk+kzD9nMiqpi6Z8kpuswwMKDKk10=; b=PTsDfFpy3Vn67qp+64dLKVjQMOectY5i18n4Kp3f0JbzDuDbg7QuhtcfWz3fQ0TXyhJjaIW8ExLbYtONSHMQyC1lyZxg1V6i+rr5HmbeaXTfnqg0mSKpLe1M7Xz4Ctw9aeW54P5Vi/KVRNyogahr68RbAAuK75JA7ttYZ7ZvTJg=
X-HE-Tag: 1787927558-448627
X-HE-Meta: U2FsdGVkX1/ynCiK2eODLPrYZ9tK1G7fze2omD18GRMu+p//Za8+4H8RGGJDHLXLBjpOVe3LkBV8eMOFg5z3gwtX0OJ59kPUZ1lXGuPE1Jngey2WvrHtD2Ios5dJmmCOW6/JzjEJjZR90rWu8s+8+rGI/f3PjKGR+amq7feErZbTZBZRK1a0gZQoVjeHxPsRe1WHdO9gAWNFsSVvOHPGAZ3BLjjMhQSGqs6mMT5JrzNV9F/rZcZ43kHOPupCbE6Oeze20thPJ6wIJ05cvfQ3P1S19nukkkme0//ZjrjG06nJBIEqqfBqKclCyd8maOH2IMWUNDJmDCxPXN7KuEq4eel3RCvHJX/rMXNPrmNloIAPLi5whsjRBjeIKs43ysEB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_073255_082586_2DCCAEB8 
X-CRM114-Status: GOOD (  10.74  )
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

On Fri, 28 Aug 2026 14:47:58 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> > On Android, system processes typically have 2000-3000 threads. App
> > processes add 1000s more threads on top of this.  
> 
> WTF ?!? Why does that all spawn *that* many threads? Perhaps work on
> reducing that some?

I guess you never ran Java ;-)

-- Steve

