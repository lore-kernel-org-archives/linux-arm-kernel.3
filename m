Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41611D711B4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 15:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cd6TfnmOE6LRZo3IDk/gFLGhVF3QEUhrot1e84JPawk=; b=H3m/jQDE8Ci5vItFzJVnfR6tQy
	qwq8luiuERNUBlMEeWuf4hJP4IsyGJaebMdJsf2ZHTWnsb7Lb5nJDGhdm0gnmlYNAdCPhW7KhyScX
	ZLRO5HDRzGftZbFuv7U1MbCIVm4g5XKW0mcS5szf+Bb5UbG+rM48YeT/Xk6n0SbN85cThCpmnXOr4
	UvVPPddMNzwDwrH1NXPt8istRdVxGSTZm6HkxH+xmW3dWzJZPGSF95NGdLEsEQ6IS6EdxYh0sEoRa
	32u6U6lNotShn3SQpwU7iDjiSPbSR5Y7pF+qHupxZJOqGx33V/9geDa8t/LfNea4EU+r0I4GR99BS
	Mtb3+d6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDmsX-0000000FiUS-1kNf;
	Wed, 20 Nov 2024 15:44:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDmrb-0000000FiNS-3u34
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 Nov 2024 15:43:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Cd6TfnmOE6LRZo3IDk/gFLGhVF3QEUhrot1e84JPawk=; b=ftFqNAsyvqvs6A8M8OupuxyTTD
	ez/RcpJE1zFTSKALnTuX8h2Btu8ZvvctWShBLQd5OzZFMUOcXdRW7LGJ6hh2L8OA+trxk3+BIHt2x
	GBJtPEpoxwgaVuR4T8R1s/i6JFW4CsG3jc4MCq+yHW7/C+Krede1FpVyQ91f9gvIVqZERCVGw+ewB
	8telGia2Fz22piCOk+362lQxtANUrWEstBnlfOiQHyoV86zsqZaedeODrG/gQGVY77frlGrIXdACz
	oROxr+84Cl0lIOgDZJPYE8+r3eMp4mJgxlY3307wcTL7uyf1OR9nB1JGBMEeNYwMPua02OB9advtw
	qw2osoHg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tDmrS-00000005PRf-2fU4;
	Wed, 20 Nov 2024 15:43:23 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7C3C4300446; Wed, 20 Nov 2024 16:43:23 +0100 (CET)
Date: Wed, 20 Nov 2024 16:43:23 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Ingo Molnar <mingo@kernel.org>, linux-trace-kernel@vger.kernel.org,
	linux-mm@kvack.org, akpm@linux-foundation.org, oleg@redhat.com,
	rostedt@goodmis.org, mhiramat@kernel.org, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, jolsa@kernel.org, paulmck@kernel.org,
	willy@infradead.org, surenb@google.com, mjguzik@gmail.com,
	brauner@kernel.org, jannh@google.com, mhocko@kernel.org,
	Andrii Nakryiko <andrii@kernel.org>, vbabka@suse.cz,
	shakeel.butt@linux.dev, hannes@cmpxchg.org, Liam.Howlett@oracle.com,
	lorenzo.stoakes@oracle.com, david@redhat.com, arnd@arndb.de,
	richard.weiyang@gmail.com, zhangpeng.00@bytedance.com,
	linmiaohe@huawei.com, viro@zeniv.linux.org.uk, hca@linux.ibm.com,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kernel Team <kernel-team@meta.com>
Subject: Re: [PATCH v4 tip/perf/core 0/4] uprobes,mm: speculative lockless
 VMA-to-uprobe lookup
Message-ID: <20241120154323.GA24774@noisy.programming.kicks-ass.net>
References: <20241028010818.2487581-1-andrii@kernel.org>
 <CAEf4BzYPajbgyvcvm7z1EiPgkee1D1r=a8gaqxzd7k13gh9Uzw@mail.gmail.com>
 <CAEf4Bza=pwrZvd+3dz-a7eiAQMk9rwBDO1Kk_iwXSCM70CAARw@mail.gmail.com>
 <CAEf4BzbiZT5mZrQp3EDY688PzAnLV5DrqGQdx6Pzo6oGZ2KCXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEf4BzbiZT5mZrQp3EDY688PzAnLV5DrqGQdx6Pzo6oGZ2KCXQ@mail.gmail.com>
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

On Wed, Nov 20, 2024 at 07:40:15AM -0800, Andrii Nakryiko wrote:
> Linus,
> 
> I'm not sure what's going on here, this patch set seems to be in some
> sort of "ignore list" on Peter's side with no indication on its
> destiny.

*sigh* it is not, but my inbox is like drinking from a firehose :/

