Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0143CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 23:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nJ0p6I+XWHcdzHTYTdQzvWsk4iQLdC8UOrlgSr+ISxk=; b=XPzG7jeQmsQpib2q/O+mfRmOko
	QEdZIqkwNHijJdyUI/2U495YHHV7J0veJVDmdW9VtCbACToBnZ3w6ZmHVI0rINGvOJLDvS+34RzG3
	jY7ozXLBmsFAL2ZpYfGDAvALoH8lGneypMuVN4ujAxsio1XFNVY8BXwq6+dK7TMdTR5HqpG90X9sB
	sNfLkp3T8cPWTpC786ExCERtW2NWc2eh+1FzZlXsRbn3AzbS0Sf5TAwleZzKLreJFjslJv9Clhsxd
	XJtVCjXOKko7uAoTxwI+Q7S4pFtPdo5l+XqMld79SW62s3UyVcv0niVuJ947yGrLU3AvQ403ae53F
	tRgcnL9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weiGX-00000000NYC-1Row;
	Tue, 30 Jun 2026 23:53:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weiGV-00000000NY3-2pim
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 23:53:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C7097600AB;
	Tue, 30 Jun 2026 23:53:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 020CA1F00A3A;
	Tue, 30 Jun 2026 23:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782863598;
	bh=nJ0p6I+XWHcdzHTYTdQzvWsk4iQLdC8UOrlgSr+ISxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dtvzx3QEU3ga8Y4lGN+M7dTdEmQb6G8/Q3lne1hP0DJGrfAU7xuLN+qJzipWdZAVj
	 hpMtH1jeyPl4weso8VHVj83ZoXZJhYNM/j7Xd+wuLV2gvl8kk196+KcswRvERDxgd8
	 iYE1VkU/Ztb41Fhr8g3ULbagZQB+xIxkGs+nGLWfhZw/4XMCtyurTHUPJlj609tJf2
	 pFp0YCf4+NGQbvEDGBwz6xCr6O2KYMLudXshInXtc7SG4eaKYHO1zJUOQ7L651L24L
	 0jyoUMdd+COm1eBzU2nIt+cR9y8oe2SAzABneusKrQTndTJaNdsKi/q4RvItGEwXVQ
	 oqYuSYVLkFTTw==
Date: Tue, 30 Jun 2026 16:53:16 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Al Grant <al.grant@arm.com>,
	Paschalis Mpeis <paschalis.mpeis@arm.com>,
	Amir Ayupov <aaupov@fb.com>, linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org, linux-perf-users@vger.kernel.org,
	Leo Yan <leo.yan@linux.dev>
Subject: Re: [PATCH v10 0/9] perf cs-etm: Support thread stack and callchain
Message-ID: <akRW7P-4UyfXz5GB@google.com>
References: <20260617-b4-arm_cs_callchain_support_v1-v10-0-e8b6e5d63db5@arm.com>
 <akMPoLNBbAEyNU64@google.com>
 <20260630082310.GE1812158@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630082310.GE1812158@e132581.arm.com>
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

On Tue, Jun 30, 2026 at 09:23:10AM +0100, Leo Yan wrote:
> Hi Namhyung,
> 
> On Mon, Jun 29, 2026 at 05:36:48PM -0700, Namhyung Kim wrote:
> 
> [...]
> 
> > Will you send a new version or want to merge this?  It seems there are
> > some remaining comments from Sashiko.
> 
> I prefer to merge this series.
> 
> Sashiko reported several critical issues in the common code, they are on
> my to-do list.

I see, I'll merge this and looking forward to seeing more fixes.

Thanks,
Namhyung


