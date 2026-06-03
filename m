Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4417BCD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 02:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M0icSYUpwjidM91a9CSaBCLnufhdPEAGwxRPFHGLfiU=; b=XJe9tmezFnGuUnyRNyp5hNMPHv
	cLOlJtNHKYu6GvdDUwCccSlKPU5eQBHsRDRcuN6rOKHnm8QBtlGXw96ILOJpDWbJPPhINHtXCfvyT
	ZG7a4RH17z4bGuOGtzMZLKPgPPepzYpLxPyuEhLA80BOVwi/QSb/Kq4YweJxvccKQXnlEbNuiYvHO
	FnXTw8vlRAC2HhuR1xi5Zq1h+RnpsJbu1TMVpDOvXrGiCkBzlU4YRq2tBoAtJs+CbjXQjG1tFX0f0
	NdDqhvDcGk6Dow1ovdnZPsqFXrvynnGjCSW17I1NLhRRos37V6k+m+okWhmF0ucgq3M8Id/fuTfJk
	944qoK5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUbDl-0000000E5wq-0QWn;
	Wed, 03 Jun 2026 02:20:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUbDi-0000000E5wO-3mBj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 02:20:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BCAEB42A83;
	Wed,  3 Jun 2026 02:20:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D2381F00893;
	Wed,  3 Jun 2026 02:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780453237;
	bh=M0icSYUpwjidM91a9CSaBCLnufhdPEAGwxRPFHGLfiU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Dtp/jnQjLfISW5AeF6ugLMKcDnl1cN6dIeAAR493UwY7/EkiyxqVRN9CK6vqFd0ck
	 QxNxZ9EMEyJlyUiwzuTDy+GqVundBap7i3o6N6dxVb1Hl1tBAJawSOuEtnOkLOrLbw
	 qaUHp+bYH48EMzYuNvhUbRJ5uxPavglTOsPbyF67nhhBhBPa8KiGNfJseAuo/NUkZG
	 klVmPnVvgvNND4Vm5mdAPKs0D1xICKktO781r2sfBjDMBlMErQB/K1dfunY65317R3
	 QqNizdA408DBoUnryzpa6mUkutnxX0uITxFWGY2Kdd7314Q6IWXMPIClivSYUhk2dw
	 t76gxwoljQmdw==
Date: Tue, 2 Jun 2026 19:20:36 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
 maxime.chevallier@bootlin.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] net: stmmac: Improve Tx timer arm logic further
Message-ID: <20260602192036.7cc25ae8@kernel.org>
In-Reply-To: <20260529064659.32287-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260529064659.32287-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_192038_962112_72385585 
X-CRM114-Status: UNSURE (   8.93  )
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

On Thu, 28 May 2026 23:46:59 -0700
muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> There is no race concern: hrtimer_start() is internally serialized and
> safe to call on an active timer. In the event of a race between
> hrtimer_active() and hrtimer_start(), the worst case is calling
> hrtimer_start() on an already-active timer, which is identical to the
> pre-patch behaviour.

I mean.. I wouldn't say that this is not racy. But I think you're not
making it much worse than it already was :S

Could you experiment with deleting all this local driver logic and just
relying on NAPI's built-in defer IRQ mechanism?

