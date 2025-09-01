Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10C7CA100A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 14:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XhLkweMGBF7jeOA/9kWxP3SYAMD0IeUQ6oQb+otAex8=; b=ij2DvTWY+N25jxK/ymbSz2XtN9
	pd6JmVwHoNO1lTJWphDjkklTdHUf1n8syJij159KQK8+fcelVV81Tr8ib9RuFUmJ2GZlnD5++Gw68
	Du1HxDW4a3qbkquIYbHAUFINDUQ59d1XpzIhbJAbhMvX2KfTgNGZ3W3g5FiGlpExQcscKscTjiuwj
	N5mBd8T5mrYIrSAHls8t8ZQ/pWFzaYySeHmiLdXGMQSvBOKEUOhtbHPmH0NDwp5KfLFWDWdJnlcA4
	UFG8Yts8ZhZ025RJIkuiNgFmH0+60Jc/aY9bENGgtlNRT9lDHSGZY6IcNEB2MLVEmzMiflaxmw7S/
	CO7KvhXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5wO-0000000CwLg-0jw8;
	Mon, 01 Sep 2025 14:55:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut32b-0000000C6kq-2E45
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 11:49:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3BEC744B33;
	Mon,  1 Sep 2025 11:49:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00915C4CEF4;
	Mon,  1 Sep 2025 11:49:37 +0000 (UTC)
Date: Mon, 1 Sep 2025 12:49:35 +0100
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
Subject: Re: [PATCH v4 0/5] barrier: Add smp_cond_load_*_timewait()
Message-ID: <aLWITwwDg06F1eXu@arm.com>
References: <20250829080735.3598416-1-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829080735.3598416-1-ankur.a.arora@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_044941_586615_A54DDF79 
X-CRM114-Status: GOOD (  10.08  )
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

On Fri, Aug 29, 2025 at 01:07:30AM -0700, Ankur Arora wrote:
> Ankur Arora (5):
>   asm-generic: barrier: Add smp_cond_load_relaxed_timewait()
>   arm64: barrier: Add smp_cond_load_relaxed_timewait()
>   arm64: rqspinlock: Remove private copy of
>     smp_cond_load_acquire_timewait
>   asm-generic: barrier: Add smp_cond_load_acquire_timewait()
>   rqspinlock: use smp_cond_load_acquire_timewait()

Can you have a go at poll_idle() to see how it would look like using
this API? It doesn't necessarily mean we have to merge them all at once
but it gives us a better idea of the suitability of the interface.

-- 
Catalin

