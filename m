Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E24CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 07:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LcRidvPYK4SO7i56E+hQhDbVPy+f03hM5L256hH5oME=; b=I321MZeawmOsaOxalKx3edSjsG
	r8lWPfRfkgro/mTv+JcRxVPuyb0EHY+nd2BeemwmP0rCRvJLWCqqwKBCEIZFqD7ppyXhxaOGewUDk
	Ccic0Z1vJ8QGG/6JfJE1doDskj+AqZkuvTPwCz6mjJ+nJhO8MbOdSsjThaNHDt5qtX8oOK2kwvndZ
	oaWqejONJg1JTjgRnZfRAvYa+W6+pLcvHRiF0IDLoUAdL1cbuyEy12q/cr/1wAaD3GQtgjqoWzas7
	kBEBjWDmj4yVujOf3dXvzui643Xljp8NdnUG2uoln8++hMkG6H63Avm9p3HjLd4IuD7WYX2WjTSEi
	0GMkbgbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4JJ-00000001dA8-0jL9;
	Wed, 13 May 2026 07:47:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4JH-00000001d9P-0r5q
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 May 2026 07:47:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LcRidvPYK4SO7i56E+hQhDbVPy+f03hM5L256hH5oME=; b=qbR0S3kAm6llWeUeMKwomhF0XS
	I22RSCSnSYpbg1AqWvFYjst3OLm2eT0pKt043WxfiC0EpSY0ufZRZYYqc3FLxS1poQCG2EWWhD+Qd
	PGh3k9S0UkSVnBR0VUqw3+Jd796MAUfsBwPbCXvARk9KjbUmpS75xsFhUBeSmVsAam9kc/6nBqTma
	MTUFIbgTG3teZ1a5xrb7to8gf33EX8ZVmt+TSj2M+B2BEmdjHaEhKSgk5sCCeaFLu6V5DpKeDpNRM
	DQ71RiEgd93DY15XZD5jB4hmcuiGIOvN/hxqeoCfHlne4TXZdkm0ETThnfJbdRX5tJ8rm4zsRcvzg
	8MrHMqdA==;
Received: from 2001-1c00-8d85-4b00-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:4b00:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4JF-0000000BDsk-0592;
	Wed, 13 May 2026 07:47:14 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id CC0A0300BDE; Wed, 13 May 2026 09:37:11 +0200 (CEST)
Date: Wed, 13 May 2026 09:37:11 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org,
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH v3 11/21] objtool: Allow empty alternatives
Message-ID: <20260513073711.GI1889694@noisy.programming.kicks-ass.net>
References: <cover.1778642120.git.jpoimboe@kernel.org>
 <3c474673ec5ddc9f27fbf5ddb1fd0f66ef6a779f.1778642120.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c474673ec5ddc9f27fbf5ddb1fd0f66ef6a779f.1778642120.git.jpoimboe@kernel.org>
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

On Tue, May 12, 2026 at 08:33:45PM -0700, Josh Poimboeuf wrote:
> arm64 can have empty alternatives, which are effectively no-ops.  Ignore
> them.  While at it, fix a memory leak.

How does this happen?

