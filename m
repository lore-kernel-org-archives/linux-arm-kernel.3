Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EC2E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 12:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DDo7tt/pxBqHHyEsh09BeDwITeNU5w74w0Ek0yCqvec=; b=F7QlzLR/Tj1q5bvOZNJS3tiQMQ
	mXpuZTAz8UMScQSQv2k8Zi3VkdKHtbdUf/XTedGhhLh8xXNvTO6xTnTrObv8o9XvAuVFpsYFIPeAI
	SkDtWysuh2wD4SIke9yFvQY7DI5MWapbIX8+XUsV52XQrP1ngRizdlwoHktAJ1hT0G+LH1l5WZ0xw
	PShPggGgQ+r2EeiDIMgUaTcwS5xGZsSSjp618L3A8uVsmbImlwgl8Wzd1LpJxhhISeuKR+kj7tTe+
	AWKoapyBegMj6rw1kF4kzvA0eeWY3m9GYmQuU4RAckHGe6iP5c2WEju8OWDVQP/wA15pWEOeZu2dI
	hx9emkug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKz8Y-0000000BP3l-3CZy;
	Tue, 10 Dec 2024 12:14:46 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKz7W-0000000BOyp-1Ynp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 12:13:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3656AA41374;
	Tue, 10 Dec 2024 12:11:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69271C4CED6;
	Tue, 10 Dec 2024 12:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733832821;
	bh=7cv4cgSj2LINmoadvDIPepo0a1M0FarsbVRgQxREo18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QQX9gg5A/cfEinEC7qVx1Wv4KAIGgjk2nFwPUsZJXpyvH5Gv/LRW6lR+EQwFzoNwF
	 FnzLW/CkSp3R0ofgs88/bo6Z9uLruoX75LkXkzMdptgm4kDYSJZoMKZlAFhK85kNCv
	 e1O00GUdWPu/JOY7ctO+pxPHhC0QwvNyaexZVsX4PwXJAR5kuWrxPNANp1MMC0be4P
	 uNhVJVG9kQgk8+/U0B+r0iIhjnk65BHouhvWuIwE5iLH/QWLb3GvcwdDmhbYtVtzwK
	 /i1ZtOUtUYd8ix64wolX8fxfJ0V4r/SHu/80il42zq5latAJDTAOFWFe+vVuqVIHi/
	 S4RYed+AjFasw==
Date: Tue, 10 Dec 2024 12:13:37 +0000
From: Will Deacon <will@kernel.org>
To: Ruffalo Lavoisier <ruffalolavoisier@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: remove duplicate word
Message-ID: <20241210121336.GA15428@willie-the-truck>
References: <20241120045406.21537-1-RuffaloLavoisier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120045406.21537-1-RuffaloLavoisier@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_041342_473198_376EA519 
X-CRM114-Status: UNSURE (   9.71  )
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

On Wed, Nov 20, 2024 at 01:54:04PM +0900, Ruffalo Lavoisier wrote:
> - Remove duplicate word, 'to'.
> ---
>  arch/arm64/include/asm/pgtable-prot.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Please include a Signed-off-by line so that this can be applied.
More details are available in:

	Documentation/process/submitting-patches.rst

Will

