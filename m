Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9608C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 16:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=5v0FL+WcvutgX4NMNDv3ATrpdrLjutSE8QPgIyFSyEg=; b=i64T81hUljRwD/H1Bjwnnqdv6H
	Xj7PmyWTRH0KKqA2/Sm8/rX+ieQeOj3zOY674U8Guc/RYxm1y5O1MQsWTx5geCTjXYscAskckTijL
	EM/ExWx5w4lY46QY0PyyK4Sgzwv/0DuuSlJUqt1AzZdtEpM398dufajwFNIvH9qKLM7Ugnq3IjSxd
	s0vpU7cev8GvqPXrs0RnYzI1cVy+IDbhe0qYeNScaw7No5oSPzZnhMUyv1AsmOWICygE3UdQhCj5u
	ukEpeqKiXu9UUxzCao52rGXR7cLM631uX9ji4nXc1OucbTPYv7WMlgGRk/FLmFXXtxr+X56BuCbyc
	A8Iea5RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teysc-0000000FwJB-3z6R;
	Mon, 03 Feb 2025 16:00:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teyrI-0000000Fw1Q-0ytb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 15:59:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6E56A5C651B;
	Mon,  3 Feb 2025 15:58:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C28D4C4CEE2;
	Mon,  3 Feb 2025 15:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738598375;
	bh=pB/avWjDA66o8qKuT2L9+9mKgLG7V6fnqRlYSS+zEjA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=tjfWlBNE0ro2NFADlOh5t7iM+e5SYlVBcjAvJI1pvU3sAOYkBkuaLtsgzyY890KLD
	 W+/AHwBP880dWVzZhETmMYAuqqaaMUUabAL0zq7aSNZEKqR3l+8MyZV5SIjEv6C/Jc
	 fPx71AYeqD/Rw1A2U2eqWXkpBBbfLFCnpkvZOLH1BdJFC3wxGqLaN4lvbS+UQ4oml+
	 GxxemtxZ1Hf/WLwm/yrg1ESx5brqCoM+ma7EJk0/DxPP1tWMIkof3gujXlLpI26i11
	 12YJ/ZSPwL/2eQYq24WhG+khBlM9XYYqv5aLSjnOh8dFaRck8tGo66yZQNO9aHia2H
	 Ihmkm0uGc+d3w==
Date: Mon, 3 Feb 2025 09:59:33 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Inki Dae <daeinki@gmail.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: wait_event_timeout() usage in decon_wait_for_vblank()
Message-ID: <20250203155933.GA786168@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAQKjZNqFt=SYxCzpQ5JwOADRUwsWsq5KzLRoPG++27SXGubnQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_075936_319735_BC75F5B5 
X-CRM114-Status: GOOD (  22.26  )
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

On Sun, Feb 02, 2025 at 01:02:47PM +0900, Inki Dae wrote:
> 2025년 2월 1일 (토) 오전 1:56, Bjorn Helgaas <helgaas@kernel.org>님이 작성:
> >
> > I don't know this code at all, so this is likely just noise, but the
> > wait_event_timeout() usage in decon_wait_for_vblank() looks funny to
> > me.
> >
> > decon_wait_for_vblank() waits on wait_vsync_queue for wait_vsync_event
> > to be cleared.
> >
> > But decon_irq_handler() only clears wait_vsync_event and wakes up
> > wait_vsync_queue when !ctx->i80_if.
> >
> > I don't see any i80_if connection in decon_wait_for_vblank().  Does
> > the wait always time out if i80_if is set?  Is there some reason we
> > don't use decon_wait_for_vblank() at all if i80_if is set?
> 
> For the decon series, the implementation for the i80 interface has not
> yet been completed. If you would like to see how the i80 interface is
> handled in Exynos, please refer to the code for the legacy display
> controller module, exynos_drm_fimd.c, available at the following link:
> https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git/tree/drivers/gpu/drm/exynos/exynos_drm_fimd.c?h=exynos-drm-fixes#n1053
> 
> Furthermore, please note that within the decon driver, prior to
> creating the CRTC, it is necessary to implement the TE handler for the
> i80 interface in the te_handler of exynos_drm_crtc_ops and register it
> as a callback.

I'll take your word for it that this all works as intended.  For many
wait_event_timeout() callers, the connection between kicking off some
operation, waiting for completion, and doing the wakeup is a little
bit obscure and hard to analyze without deep knowledge of the driver.
This was just one instance of those.

Bjorn

