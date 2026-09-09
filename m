Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48940C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 17:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evxkjkjKKox5DEjMvr/MUguEcpXOS0izuaXRXX60QIc=; b=4k3qqiHrmaIgMuVyfm8QUaWrC0
	rY1wOtWnt5tpuHHKMCh2gCYkc/DtKmk7eZpYScW+K3huzhnxgqWOWqRvSClA+fuRCD7zi0HXDDtNc
	cvAO8EEHgb1aj/+eq+m/J1IsmY4Hp5dTUptuBro2gYrkrXimw7beqI/o5LwLBNk7aimw6Lk4uZm9W
	4dTC5RXW9iwph2OAE7YmpomRxywIG4tnQ+C3r/iCh+Jh2IJWtKTXN9V8Yffk8Loe+T50bkJDyr6x9
	U67A9wtVbBwSCY3Y+6kQTFx7AQQflnsyVF9egtARxboSOIkt8uHnSLAiGV8WZxW0cIZx8t/FXcOKd
	+BNzUbBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MRu-0000000CXYy-1hBU;
	Wed, 09 Sep 2026 17:51:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MRr-0000000CXY9-1OsC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 17:51:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CF9F1576;
	Wed,  9 Sep 2026 10:50:57 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6382C3F528;
	Wed,  9 Sep 2026 10:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788976260; bh=7Vhuf1iZFkwe6WdcpSNqvT1waKG31SWv7t0DuAd1j/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lCkvkSUjVmgC63A8DcgNLu8rYIyPcrokQcrsyLqXVqan9fYv+ENwYTis7kB0+VFpP
	 K5e2UMBtgg3NkTJMAUjPp06SQ3F9foXYseWr+p6ou2e8ah+dq+xO5SbENz1WLdv2Zc
	 4VQet3EFP0My6FkdBUlclD/4xU/7JzYladQ+KI9Y=
Date: Wed, 9 Sep 2026 18:50:58 +0100
From: Leo Yan <leo.yan@arm.com>
To: "Bouron, Justinien" <jbouron@amazon.com>
Subject: Re: [PATCH] arm64: Add user and kernel page-fault tracepoints
Message-ID: <20260909175058.GE200420@e132581.arm.com>
References: <20260520045524.75670-1-jbouron@amazon.com>
 <20260520073606.GA101133@e132581.arm.com>
 <FFEB5A47-7651-4607-A127-8CC07D241F4C@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <FFEB5A47-7651-4607-A127-8CC07D241F4C@amazon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_105103_422274_190DF47B 
X-CRM114-Status: GOOD (  13.17  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, "Kudrjavets, Gunnar" <gunnarku@amazon.com>, Ryan Roberts <ryan.roberts@arm.com>, Quentin Perret <qperret@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Will Deacon <will@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Justinien,

On Wed, Sep 09, 2026 at 01:13:42PM +0000, Bouron, Justinien wrote:
> Leo,
> 
> Thank you for the feedback. I've posted a second revision at
> https://lore.kernel.org/lkml/20260902115216.49158-1-jbouron@amazon.com/, though
> it doesn't seem to be getting much traction.

This should be in the arm64 maintainers' scope (v1 caught my attention
due to it mentioned perf related things).

I think the main question is these tracepoints overlap with perf sw
events. Could you elaborate on why ftrace tracepoints are necessary?
('perf record' and 'perf script' can provide similar info and we can
avoid extra latency).

If the maintainers think this patch is reasonable, I'd be happy to help
test it.

Thanks,
Leo

