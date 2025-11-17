Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F62ACEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 10:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ryt+pNFqTdAwFyNWtATHOPqaC4PRbW0X+yrpciNZiGE=; b=gOnls+BjKXqqf9o1l47RoOm7Fn
	lMWybXsicB4817r7SPR1/RWqwbnkmoHneM1dTCeJr2TF3lbYj/ejrwf2f4ZgbHnn/Wmv2vfQYRXGq
	VP6TTQVI+fEu2rsYKxMVbsLuGjKNR3D5+WJgNrJxR82hUDLD/qBleRMRnwl3HMWY6+789MP69yGmj
	C3tlWNVUwT0XlFgGkZKXJlAh7EILeVJ3VuhDu/AsHbhlzOVsAZHT0ltk5+d78CQDnTNHLkLU3Ci/d
	OKDcCXqm3yrejsuZRZFdw6R1sPEk1cEf1TZzmnPUs5rtdVworU6irpBo276SZu3aNXXvE1jsycRA+
	6qgfFN7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwZ7-0000000Ft8G-0E31;
	Mon, 17 Nov 2025 10:34:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwZ4-0000000Ft76-0T2V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 10:34:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF2F9FEC;
	Mon, 17 Nov 2025 02:34:21 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9E773F740;
	Mon, 17 Nov 2025 02:34:27 -0800 (PST)
Date: Mon, 17 Nov 2025 10:34:22 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Ben Niu <BenNiu@meta.com>
Cc: catalin.marinas@arm.com, will@kernel.org, tytso@mit.edu,
	Jason@zx2c4.com, linux-arm-kernel@lists.infradead.org,
	niuben003@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tracing: Enable kprobe tracing for Arm64 asm functions
Message-ID: <aRr6Ll7h29dpt7zz@J2N7QTR9R3>
References: <20251027181749.240466-1-benniu@meta.com>
 <aQIltqoIVDwh4A6p@J2N7QTR9R3>
 <aQKpDIYwO9VTP7qM@meta.com>
 <aQNbjap69C6inZwb@J2N7QTR9R3>
 <aQOpd14RXnyQLOWR@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQOpd14RXnyQLOWR@meta.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_023430_189009_A7DD7512 
X-CRM114-Status: GOOD (  11.95  )
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

On Thu, Oct 30, 2025 at 11:07:51AM -0700, Ben Niu wrote:
> On Thu, Oct 30, 2025 at 12:35:25PM +0000, Mark Rutland wrote:
> > Is there something specific you want to trace, but cannot currently
> > trace (on arm64)?
> 
> For some reason, we only saw Arm64 Linux asm functions __arch_copy_to_user and
> __arch_copy_from_user being hot in our workloads, not those counterpart asm
> functions on x86, so we are trying to understand and improve performance of
> those Arm64 asm functions.

Are you sure that's not an artifact of those being out-of-line on arm64,
but inline on x86? On x86, the out-of-line forms are only used when the
CPU doesn't have FSRM, and when the CPU *does* have FSRM, the logic gets
inlined. See raw_copy_from_user(), raw_copy_to_user(), and
copy_user_generic() in arch/x86/include/asm/uaccess_64.h.

Have you checked that inlining is not skewing your results, and
artificially making those look hotter on am64 by virtue of centralizing
samples to the same IP/PC range?

Can you share any information on those workloads? e.g. which callchains
were hot?

Mark.

