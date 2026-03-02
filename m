Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AD8E9B363
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 10:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L0KCOyoLsIgluS1BqRcipX43WxCPDJ9M5ANAEO2kJJQ=; b=p3wmzPYyvXg9xJKsjodgx5swPq
	3N3J+/pB/ClFPda/22smfzp/FKOC90E2NAoQu7m+CA1sUFxJSmu4/HFTVQZFRi/cJUY1Tus8W+sDv
	oqX/aSNlHo7bx5jwiOIXBJJFVPo3JHiNGCt0e+R0glZ53zMEIChEShUcoA5cMNGFQ9gbhuRuROODy
	lKKiUhFdmHqDCJjbCC2rhsUQPXgzIsuKQR39lzyTFtNfg6GtyqwsnZl7oRGQpAKnnVOONsuTnKS8C
	xN7XzCoOhOUQh/tR8AoOqt1h/l+pFL9VE/nXEEMF9DNHUiadsQcydv25HR4PjXYYPwwMIdgl84Qaz
	cL36O7rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0sC-0000000Ckcg-2uhb;
	Mon, 02 Mar 2026 10:51:36 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0s9-0000000Ckba-1vzp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 10:51:34 +0000
Date: Mon, 2 Mar 2026 11:51:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772448691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L0KCOyoLsIgluS1BqRcipX43WxCPDJ9M5ANAEO2kJJQ=;
	b=Wc8u8Prl3V1HRW1Zg3I5vIkZuDQBxfUEbq1gx/0/4I+XZnctpr3wF79l36Gg3VnsHNdWM+
	nxFEa7MjHVYkIvs60GtH06Gsjw0HtMvzm5eJGTe8JZy/j2B6ccTqO8kj2puYZKx7RMP4sM
	DzLc+11eZWb/PAfjawTcJTXa5gS0kiAGobNAPKoRAQTXDy1KUwfREdXlRcib0/K70IBabW
	CUgZgmgsXGctxjsnWISXVIazy7LzLRNhB1gr3GipWenfIddFyHsNCYOyS+Wh4VE9BmmAwk
	Xz8l6iCAKXerxFVMRPCCC620s/v702sEm3We/Yd/0G1fBvBDBzy9Tq3vz5Tpcg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772448691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L0KCOyoLsIgluS1BqRcipX43WxCPDJ9M5ANAEO2kJJQ=;
	b=Vx4CdNhrM/2/EmSrNiFcTRzywLsJxOtg2qh/Zl7BlpSVXbrZR6mPP+hUCbwMEdCr7tdTRA
	W2XRoy9gJLB4G+Bw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	Clark Williams <clrkwllms@kernel.org>,
	linux-rt-devel@lists.linux.dev,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 5/6] ARM: move FSR fault status definitions before
 fsr_fs()
Message-ID: <20260302105130.HTs-UDqx@linutronix.de>
References: <aaG1wrNUaq_L0I5g@shell.armlinux.org.uk>
 <E1vvzcm-0000000AwoI-3o9W@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <E1vvzcm-0000000AwoI-3o9W@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_025133_637983_6BE3EAF9 
X-CRM114-Status: UNSURE (   6.27  )
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

On 2026-02-27 15:19:28 [+0000], Russell King (Oracle) wrote:
> The FSR's fault status bits depend on whether LPAE is enabled. Rather
> than always exposing both LPAE and non-LPAE to all code, move them
> inside the ifdef blocks dependent on LPAE to restrict their visibility.
> No code other than fsr_fs() makes use of these.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian

