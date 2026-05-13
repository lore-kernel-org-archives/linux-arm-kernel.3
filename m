Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF3EACD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 07:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gdJ3bclZnSTQKqwObYZBerxCAeCGszQZnoiFN16hqOM=; b=oA51JOC8dn87YQWDvQ88ChsK2/
	NHuYK66A4Vv0kAagxzdjIJaKyEO84C2S1grnlQZv56r/bZQdq8YitchsDyZ2O+O0mBYGX3vzGh4K0
	n/Ipw5PnOSPuFmqwF3BzO50hZ1BL5jB90HKihUGdFPCAjI3MqpG2SpQM2XxRcwhNataMxZ+bVjJWR
	en2/FOoXAEvbiGtwmM00OR8zQ8MCv91ZZWAhv8qg3wtwo6pD5niQd+maFvOSNMwCFtoEhiCJybbUu
	d2qLZzOXlPdW2XleGK83zUbTwxaUnrl5U872Dktq7EMeAE8mNhujJq1V03XxaN011HLs534XePwDw
	1qrLfAyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4IS-00000001cuh-3cqy;
	Wed, 13 May 2026 07:46:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4IR-00000001ctn-2mEK
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 May 2026 07:46:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gdJ3bclZnSTQKqwObYZBerxCAeCGszQZnoiFN16hqOM=; b=pYLknmhrYkO3h4mYcHqhgbr1Km
	EBg4kCULjXxvtlr8jFObjuXNBjZe3bqKLp/yJviVic1RUp+6EbzHRj/9EnCnCsg8uEYVK4tuZAzSa
	HHyKM+Gb0kKt6jiEM50zTk/pjY3WIP/Bh6smDq73X/7VNaNri8RGr+l+QJeLJLcY8ibN+4gltIbt+
	FzaYKDU0nEGOpG1+TI04BDrXw/ztY6U9mMbrQekhuPuCVNSmM116gM+AFRsZ2qK9d1U98XykJpcue
	K56NOgHMOzOg07CkU5WA85A9C5qQx510qX7BZugLsBvy5zKZZMNcFkKtfs2b7h1nDEEVOFdbLBYnU
	RqqbXR0w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4IQ-0000000BDhN-0Qsd;
	Wed, 13 May 2026 07:46:22 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 94A4A300B8A; Wed, 13 May 2026 09:36:17 +0200 (CEST)
Date: Wed, 13 May 2026 09:36:17 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org,
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH v3 10/21] objtool: Ignore jumps to the end of the
 function for checksum runs
Message-ID: <20260513073617.GH1889694@noisy.programming.kicks-ass.net>
References: <cover.1778642120.git.jpoimboe@kernel.org>
 <b3b58101e15e1bb5266e57134f0b65f7d8efdd4b.1778642120.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3b58101e15e1bb5266e57134f0b65f7d8efdd4b.1778642120.git.jpoimboe@kernel.org>
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

On Tue, May 12, 2026 at 08:33:44PM -0700, Josh Poimboeuf wrote:
> Sometimes Clang arm64 code jumps to the end of the function for UB.
> No need to make that an error for checksum runs.

I'm not sure I understand the rationale. If the compiler trips UB, we
want to be complaining about that no?

Same as when clang just stops code-gen, also something we commonly see
when it hits UB.

