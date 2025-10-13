Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD82CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 06:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C+lWtQFv2S+aF9dYafZDwwatkx8KiFcCSvwTyPK3+vM=; b=1q8egIS4zLULoQ9r/hVEdH5zNJ
	vRTMAVMk2tn/gqD/2Xpe0gPSVzT7h8glB/Yx/wOSKW3j8ev+RhNBCmiYkVlRbKYeHU/2igIphKql6
	JVS69gmlyakWwMS8/y5M0GKxtEtidsslCDtfy82Hv1pIcQWmZeRYkinBLXnHlboMoLkBd87kx1f6a
	LWNnw67SZfdyKntKxaBz0DnDszEpwwu0qfpZ3FGgQuALAwoqIoYAOson62pj228FwNNzJA0DMLta0
	nLGEVCD9TdptKYGWP1HIMxcLdmlwp52ue3QWjjcIBDbtU08NN5jmLcJtgGm9Y9cQM49ZnHlFkrolQ
	nxYQ8MEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8C2N-0000000CO8f-1jft;
	Mon, 13 Oct 2025 06:28:03 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8C2K-0000000CO6O-20Gf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 06:28:01 +0000
Date: Mon, 13 Oct 2025 08:27:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760336876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C+lWtQFv2S+aF9dYafZDwwatkx8KiFcCSvwTyPK3+vM=;
	b=czIlbdGLytDRKDs6vAw1zqCbwJNmJ7KQpCPt8XVR8wulBg4k96MFqm8Lt+Jaya3k6EMsK1
	uEPXyCP4ME0Ov3QUlD93hqxyRTK39SYQd5ag3rOHnRQ5e76fipBK+wfeYWIYq8UoSYb64j
	JXlieO4zvxkNab2qcrli8wYGIDeeSLQHdlnUAsi9gsWww2sL8mUCaChrI4eqM7qhyk2BUy
	2cFVq48vtzBiTZrc/pOzXjGAN8n4a1Zz9e4anSGgb292FTCXoz8psDLaTQJgdKLV9mYg19
	BHg1zPs14f3ApM7RI/60S8BetJ+1u740fQt2Zodz1KmxGFukrgx2mnCgKrQx8g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760336876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C+lWtQFv2S+aF9dYafZDwwatkx8KiFcCSvwTyPK3+vM=;
	b=J7VZgV76qYt6owRDosLVULkFKlKlRzfR8GYsIaVHlsPn5foBNC0b7Cgk0M1btbaoK4gQLz
	QY3RW4+Mlc29vZBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Ryo Takakura <ryotkkr98@gmail.com>
Cc: catalin.marinas@arm.com, will@kernel.org, clrkwllms@kernel.org,
	rostedt@goodmis.org, leitao@debian.org, mark.rutland@arm.com,
	ardb@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH] arm64: use SOFTIRQ_ON_OWN_STACK for enabling softirq
 stack
Message-ID: <20251013062754.6GDxEVID@linutronix.de>
References: <20251013013508.74677-1-ryotkkr98@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251013013508.74677-1-ryotkkr98@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_232800_687648_D3619BDE 
X-CRM114-Status: UNSURE (   6.39  )
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

On 2025-10-13 01:35:08 [+0000], Ryo Takakura wrote:
> For those architectures with HAVE_SOFTIRQ_ON_OWN_STACK use
> their dedicated softirq stack when !PREEMPT_RT. This condition
> is ensured by SOFTIRQ_ON_OWN_STACK.
> 
> Let arm64 use SOFTIRQ_ON_OWN_STACK as well to select its
> usage of the stack.
> 
> Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian

