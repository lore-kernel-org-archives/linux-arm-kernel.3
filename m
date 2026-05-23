Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D91D3CD5BB8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 21:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0fe76tELS7vRrYWmPqyIJMXzdjXWM0RGNTPYok5ZNUY=; b=29sQNnMsOVm8vPfsAngJVyP/VG
	2iaL1YPflAiSquApPXegSwArJNyFPkm7AGIiuHdvHsTnBb9qQ/3yMZ1bn5txLHdoTFXiF8dLrzg6j
	xGpwBKuEgWY+Hs1OAEZXj+3Pb+jbmg5/+855tNY/JOw8yjrT3MUpFnShM+WJRn6rqDKAMpQpXW61C
	On5nK6eC9J2Xj0oWj5ZCppm5b2+zowklURrnhM9FQuorqXLPgObmBeAknRgBv+L+uxpVCRPwwCMKU
	atFmbtFvP39XhAF34NDai5RfFMSi/sbOQpagOGWjtsYPSpmPBW3941Yw9Hy6W2WKdLr1GECz+2FuF
	XvVy+jWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQu4o-0000000E1RC-2Wfh;
	Sat, 23 May 2026 21:40:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQu4m-0000000E1R2-3pn7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 21:40:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B84986001A;
	Sat, 23 May 2026 21:40:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A5B1F000E9;
	Sat, 23 May 2026 21:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1779572407;
	bh=0fe76tELS7vRrYWmPqyIJMXzdjXWM0RGNTPYok5ZNUY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=w7N28E0NuabMjOCzH4dQkIVKSjxHrz+TRnWsceBQIie/DMGKyl6ZII16A4StSyKH6
	 eCZEBtt2cPMQQUv6k8DWBZ4cZC2qK9Hjm8PCE9FOb8x0luMoOoZ9vuUKox+0K7e1jJ
	 F9aMm0jdUBo7AWxk8sWslwLpV8TKl7Zd7ZhD8YM8=
Date: Sat, 23 May 2026 14:40:06 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, will@kernel.org, urezki@gmail.com,
 baohua@kernel.org, Xueyuan.chen21@gmail.com, dev.jain@arm.com,
 rppt@kernel.org, david@kernel.org, ryan.roberts@arm.com,
 anshuman.khandual@arm.com, ajd@linux.ibm.com, linux-kernel@vger.kernel.org,
 jiangwen6@xiaomi.com
Subject: Re: [PATCH v3 0/6] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
Message-Id: <20260523144006.a05c06c91177c98fd9fbea63@linux-foundation.org>
In-Reply-To: <CAHKocdErBXQLs0izMaEJg8fLgjPahY0fGR3jfCQ2onS49TWiog@mail.gmail.com>
References: <20260522053146.83209-1-jiangwenxiaomi@gmail.com>
	<20260522110727.fc7dccf90bc8513abd1fdbf1@linux-foundation.org>
	<CAHKocdErBXQLs0izMaEJg8fLgjPahY0fGR3jfCQ2onS49TWiog@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sat, 23 May 2026 16:26:36 +0800 Wen Jiang <jiangwenxiaomi@gmail.com> wrote:

> On Sat, 23 May 2026 at 02:07, Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > On Fri, 22 May 2026 13:31:40 +0800 Wen Jiang <jiangwenxiaomi@gmail.com> wrote:
> >
> > > This patchset accelerates ioremap, vmalloc, and vmap when the memory
> > > is physically fully or partially contiguous.
> >
> > Thanks.  AI review asked a few things and might have found an existing
> > 32-bit bug in vmap():
> >
> >         https://sashiko.dev/#/patchset/20260522053146.83209-1-jiangwenxiaomi@gmail.com
> 
> Hi Andrew,
> 
> I've gone through the Sashiko findings:

Great, thanks.  I won't take any action at this time - let's see what
reviewers have to say.


