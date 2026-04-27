Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E34DFF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 07:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7/7InQ3YxlIclzI7DLSo4lq3zCq3+EvHj491D6ofKI=; b=N45ITnEbkX4toGLm69LoIhXMFw
	8NSjwAHZ4K8ZqJDGcNj2xYXgN17u20Euy4gk4CESJ+j4Jh8dXUBOPjLmXpO3UVwmbEhowrb4We8yu
	HSY+p4I7MRF52PDxj5Fcj1DmWTaTbp256vjztJjhT9m6VR4gAmmASmIiS2LHX6CbBckmxTyUdneNi
	LyOiubHjbpgEZ72GFYEqwrZlNMO4Os0gL5qdtyNEE9rD4vHElKRZpY56JSneM5V5OMTf6HNVC5aJ2
	kSU38LQVkaMZVI4R93b4tDgnEGlYFvHZmIJ7TLSBZdIb0nz5KlyG1EZln2tOU+0skzxl+NZxloCkX
	5H6IuKjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHG3Q-0000000GL2l-3Tmc;
	Mon, 27 Apr 2026 07:06:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHG3P-0000000GL2M-3J5e
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Apr 2026 07:06:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=y7/7InQ3YxlIclzI7DLSo4lq3zCq3+EvHj491D6ofKI=; b=Rk2lzBR+7uAzB+WRvpSiD8fwAs
	UrPnKPv7eQCAL1aF8J6LYp42ehLfKKDAgdFQgnXbu/4oqv/x885oVFXD9UCrOdZiIAibih0vVfKfF
	RZocPv1lyHesEo5v2I4QaWmc6wrvlO6qkt3Py7+AT3CQkrHHDtdb7VFV0yolK+xEKnXSAsM3P/BnP
	gZE4t5iLOJrPZd6KVOn900c5ugIge6gkdGLJOKLxdTlPV+r4Qd9EkKjupmrkux3sW7XhgOPnHte5X
	xCKKNzQPoO6T9sGlCPsFwhXinMdYOM14VnRdq+OuoWHqfdA9sBWcoUI7UvnGP6nKD1ZPw0jtdy59l
	dDLH5ZdA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHG3D-0000000HXeI-0fm4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 07:06:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777273590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y7/7InQ3YxlIclzI7DLSo4lq3zCq3+EvHj491D6ofKI=;
	b=AhNgSUb7SYqVIPfne92ZQJZqWzAjK2iP6K20RM3iMGoBF4LnATXHVhYhHTfYrTlj1Snq0u
	p2LpIq0OzJpBrC23gG2V4fBxGheu58jvwtSm3csi9gSNnRtr6D8E7MMB5ZoY1lZcrXpEL+
	i6SJl85F2ZD30pSWRqDzNVz5zL0xRfA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777273597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y7/7InQ3YxlIclzI7DLSo4lq3zCq3+EvHj491D6ofKI=;
	b=HOWlCzMbn+hJdDviRTZX2pRFZJYdXskwX1gwGA3fl8HWVaFMyWqx+RbqxeTuWhLWIqRRLU
	Bf8EJpLex2UjZnxY5CTkc7wvXif2XO1oJwRpSuNJ+FG3eNPPL9smV0hDwBpxVEOIl1beA2
	TZV1rb2/g2PHniotGf/otmczL+/tYcU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-330-COmrkNHAP0e5g2ifgSTz9g-1; Mon,
 27 Apr 2026 03:06:26 -0400
X-MC-Unique: COmrkNHAP0e5g2ifgSTz9g-1
X-Mimecast-MFC-AGG-ID: COmrkNHAP0e5g2ifgSTz9g_1777273583
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0014F18004A9;
	Mon, 27 Apr 2026 07:06:22 +0000 (UTC)
Received: from fweimer-oldenburg.csb.redhat.com (unknown [10.44.48.4])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A35AC19560AB;
	Mon, 27 Apr 2026 07:06:15 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Thomas Gleixner <tglx@kernel.org>,  Mathias Stearn
 <mathias@mongodb.com>,  Peter Zijlstra <peterz@infradead.org>,  Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>,  Catalin Marinas
 <catalin.marinas@arm.com>,  Will Deacon <will@kernel.org>,  Boqun Feng
 <boqun.feng@gmail.com>,  "Paul E. McKenney" <paulmck@kernel.org>,  Chris
 Kennelly <ckennelly@google.com>,  Dmitry Vyukov <dvyukov@google.com>,
  regressions@lists.linux.dev,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  Ingo Molnar <mingo@kernel.org>,
  Mark Rutland <mark.rutland@arm.com>,  Jinjie Ruan
 <ruanjinjie@huawei.com>,  Blake Oler <blake.oler@mongodb.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
In-Reply-To: <CAHk-=wh=B3fqU9AaBsyViZR=eVTG5qa2CGyN=qxPROVxu9Gctg@mail.gmail.com>
	(Linus Torvalds's message of "Thu, 23 Apr 2026 14:28:35 -0700")
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
	<20260422125647.GP3126523@noisy.programming.kicks-ass.net>
	<20260422131338.GI3102924@noisy.programming.kicks-ass.net>
	<CAHnCjA2fa+dP1+yCYNQrTXQaW-JdtfMj7wMikwMeeCRg-3NhiA@mail.gmail.com>
	<87fr4l28zn.ffs@tglx>
	<CAHnCjA07ER=9xBqXq4jf5yn052W-E9ZXD86HxnRGtai6bpXbbQ@mail.gmail.com>
	<87cxzp1tn6.ffs@tglx>
	<CAHk-=wjsEqWJxXArS-P5+ksSY2Apaox8u6FtUrtyWSBEOL4Q2Q@mail.gmail.com>
	<874il11jac.ffs@tglx>
	<CAHk-=wh=B3fqU9AaBsyViZR=eVTG5qa2CGyN=qxPROVxu9Gctg@mail.gmail.com>
Date: Mon, 27 Apr 2026 09:06:13 +0200
Message-ID: <lhuqzo051cq.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: 00VoddaEIAn7PHlSwVuzaXb_VEtj07Pks9OmbclbFk8_1777273583
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_080644_234426_E68F525F 
X-CRM114-Status: GOOD (  12.47  )
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

* Linus Torvalds:

>>     // Note: this makes __rseq_abi.cpu_id_start unusable for its original purpose.
>>
>>     Do you seriously want to proliferate that?
>
> Absolutely.
>
> That's how clever hacks work - they take advantage of things past
> their design parameters. "If it works, it's not stupid".
>
> We don't then turn around and say "you were clever, and we did
> something stupid, so now we'll hurt you".
>
> This is all 100% on the RSEQ kernel code, not on users who took
> advantage of it.

RSEQ was intended to be modular, with more than one library using it
within a process, without coordination (beyond sticking to the RSEQ
protocol).  The tcmalloc approach is incompatible with that.  Once
tcmalloc starts using RSEQ in its peculiar way, nothing else in the
process can, and vice versa.  This is far from ideal because the
particular descheduling notification that tcmalloc uses could be
implemented in a much simpler way than full RSEQ, given its non-modular
nature.

Thanks,
Florian


