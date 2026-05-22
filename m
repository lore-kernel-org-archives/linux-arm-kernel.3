Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9006CCD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 18:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rfqssdTExwNi19k/q2C4lKcmVNXXxclF0xnpgbu1sI8=; b=Z2cSy3xMSh89q+2w/E4ZT1lmlI
	niwMVgZRmqmIHYrnadOov4E7/oiV/mh+bpTzuAOzaU0FXJ1VIfcQnPqBpHkMa0azHXmbQ8eJ5sB1c
	Hl55QhHKgt3SgxDbijLHY5ZjxkqsnISpM4B0LPIRuY5EH2jdZIOK7XZTNtLkeDfEEwopbYm4qDtVy
	4/gClQPlXjfA44me8u3vdyOlueCqEtl934V46XjETq1YKL2RMLtYxJsXvDGvaT2wloiINXH/mJEG/
	GwXq7EREgvBpWUa7EyD+lXcvShfRWJsO5g3X8zN1wo8jVW7JhOceis+bGw4Mnp1qbI562bJ9TNLRq
	RIvNwf8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQUHS-0000000Bdsx-1vaf;
	Fri, 22 May 2026 18:07:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQUHR-0000000Bdsm-2NwB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 18:07:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8973860138;
	Fri, 22 May 2026 18:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6FA11F000E9;
	Fri, 22 May 2026 18:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1779473248;
	bh=rfqssdTExwNi19k/q2C4lKcmVNXXxclF0xnpgbu1sI8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=g7KuppTlUAXBkJgzjaAIrd2lMe7/5uZWzecyhb+as7t4kuS5A7WF49qwpIhU9/BXs
	 MuFMVA0RBo9GTyZn9jP4UMDhZkm1+ABU0Xxwq+kFsCGiWtDkeZRx/nG5e9+xMcFSfq
	 VvNoEogbZ0o3LrWIvsNNsT14oCPuH1o0mNVziD9c=
Date: Fri, 22 May 2026 11:07:27 -0700
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
Message-Id: <20260522110727.fc7dccf90bc8513abd1fdbf1@linux-foundation.org>
In-Reply-To: <20260522053146.83209-1-jiangwenxiaomi@gmail.com>
References: <20260522053146.83209-1-jiangwenxiaomi@gmail.com>
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

On Fri, 22 May 2026 13:31:40 +0800 Wen Jiang <jiangwenxiaomi@gmail.com> wrote:

> This patchset accelerates ioremap, vmalloc, and vmap when the memory
> is physically fully or partially contiguous.

Thanks.  AI review asked a few things and might have found an existing
32-bit bug in vmap():

	https://sashiko.dev/#/patchset/20260522053146.83209-1-jiangwenxiaomi@gmail.com

