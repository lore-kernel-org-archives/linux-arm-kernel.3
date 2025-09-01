Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3244ECA1009
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 14:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i8yeCraj2JLvXgxtx8HXa3YZKI+c1+bMVi9Z0JLxg4s=; b=CBYaI8d6tLjiAZCT8/GS7NHihQ
	83HtbMLOlyMSrS1BlbZdIWqrIHr69L2rIebKO4tQHFXG02af9IoJ3nT0NG7kkC2BZx9bXdhPuu0fU
	Xhcln4Fzn+Tk7YIIKTj3+wbL/Fj/dD4Ax34a6yN5DU7OfVl07FKZn+9azidRBDOSfjJyfu3rZt5Xa
	kZ3PNs3qi43ifb1jNF1mNYCW7ZMIhz3x1Ct1alUSVlwjk4Wz5wI5IlkP/HCGIhgsD3rp83Kx9R9We
	FP5OHLi21zs9/6Z11pUNHmHalx+jXu5TQ5XzKvViNeO66xhl/tCRS0SyhkUfoDDOMZ23AgBJMr3IP
	9/jHy7fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5wM-0000000CwK9-3jWP;
	Mon, 01 Sep 2025 14:55:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut30i-0000000C6Rq-29OF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 11:47:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 386844058F;
	Mon,  1 Sep 2025 11:47:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6A2C4CEF9;
	Mon,  1 Sep 2025 11:47:40 +0000 (UTC)
Date: Mon, 1 Sep 2025 12:47:38 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
	arnd@arndb.de, will@kernel.org, peterz@infradead.org,
	akpm@linux-foundation.org, mark.rutland@arm.com,
	harisokn@amazon.com, cl@gentwo.org, ast@kernel.org,
	memxor@gmail.com, zhenglifeng1@huawei.com,
	xueshuai@linux.alibaba.com, joao.m.martins@oracle.com,
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: Re: [PATCH v4 3/5] arm64: rqspinlock: Remove private copy of
 smp_cond_load_acquire_timewait
Message-ID: <aLWH2g_AvROarMFV@arm.com>
References: <20250829080735.3598416-1-ankur.a.arora@oracle.com>
 <20250829080735.3598416-4-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829080735.3598416-4-ankur.a.arora@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_044744_569517_E47AB700 
X-CRM114-Status: UNSURE (   7.82  )
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

On Fri, Aug 29, 2025 at 01:07:33AM -0700, Ankur Arora wrote:
> In preparation for defining smp_cond_load_acquire_timewait(), remove
> the private copy. Lacking this, the rqspinlock code falls back to using
> smp_cond_load_acquire().
> 
> Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> Cc: Alexei Starovoitov <ast@kernel.org>
> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

