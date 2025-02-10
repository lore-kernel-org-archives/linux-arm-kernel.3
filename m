Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B1EC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 10:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ZCJTrlnqZRstCYuWmdLHJ1sJ7rg+hreFOoAqi6oKWw=; b=cNpnRW1Ss43oCtAbr4LybSeHHy
	IbgR+6QQaRFkFRnrYhTCBsJHAPzXhzVHMGbtL151JSFkQtYteySB3WKrMNr+3kQVBBjmvPAQKzDUY
	OVutaoB6jxzZW87iCsk3GxK0Pi/oY8v7C4zf3gRYREYqcP+A6rvi9iWe9IbMT8GxrSCFwlxY/mbdy
	klSKCkyBa6btMfUC1pl9fSavHjK6iDIM44AziYjhuhRzfQERgKjfqKnA83aiRYAzMjLyf+/QCEECd
	7s0qE9wkAXl26MJPsYJyGmVJLKxix0KZtVe+bJIDEBqjYsimo09VZI7zZpfS520O6XNYQsMkVvWw3
	jdP2BMHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thQyR-0000000H0Hz-2wfQ;
	Mon, 10 Feb 2025 10:25:07 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thQv8-0000000GzKM-2AFs
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Feb 2025 10:21:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3ZCJTrlnqZRstCYuWmdLHJ1sJ7rg+hreFOoAqi6oKWw=; b=R9a2Zk49wDwCrF7oXbqmjwi84Y
	74PVnMGbyIq00P2+lrS7iHzwvqcpF4kkSmy1DiPoC76wmesBdUNsSfHztSEHsUn9ipP8b/settCAS
	R+NmSZK7265WMXyO9sp6lBVbegpkGDvnQP/zuh8n90aPl4FWOzptxp80+OGiD6N+0vK3sSeO2Adq7
	YqGJwnTjC2sDmW+7d7oSZQjjucmFiMtxZLVgUb8F0827FVYypBAeNi3Jot5fZexItcCePkSaIRSOm
	vrWE2NF+N+oyoPpdgcMC7gtkm21Fr78+E8alpL5NZC+RDs4peCsTu+mgchzTrrWhyKbQ851RgN/Rr
	cVaLAl1g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1thQv6-0000000Fbw1-2xNm;
	Mon, 10 Feb 2025 10:21:40 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A3E4C300318; Mon, 10 Feb 2025 11:21:39 +0100 (CET)
Date: Mon, 10 Feb 2025 11:21:39 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Will Deacon <will@kernel.org>, Waiman Long <llong@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>, Tejun Heo <tj@kernel.org>,
	Barret Rhoden <brho@google.com>, Josh Don <joshdon@google.com>,
	Dohyun Kim <dohyunkim@google.com>,
	linux-arm-kernel@lists.infradead.org, kernel-team@meta.com
Subject: Re: [PATCH bpf-next v2 11/26] rqspinlock: Add deadlock detection and
 recovery
Message-ID: <20250210102139.GJ10324@noisy.programming.kicks-ass.net>
References: <20250206105435.2159977-1-memxor@gmail.com>
 <20250206105435.2159977-12-memxor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206105435.2159977-12-memxor@gmail.com>
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

On Thu, Feb 06, 2025 at 02:54:19AM -0800, Kumar Kartikeya Dwivedi wrote:
> +#define RES_NR_HELD 32
> +
> +struct rqspinlock_held {
> +	int cnt;
> +	void *locks[RES_NR_HELD];
> +};

That cnt field makes the whole thing overflow a cacheline boundary.
Making it 31 makes it fit again.

