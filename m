Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B7FCCF2DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 06:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=emrArgPAsqjY08ePzydEuGzwJRc8mfRvNdYNfd+oT14=; b=XM7JiQcmfVOyDp3diMiwRWSZAK
	a/mgVqB6e26/bYg9mhTK16l3qPdD/W1XcRY521X5nTw/vsD4LNiVRPVtNoGb7kiLQ9NHTRv0ho9NZ
	goiOWHsluQNaJLX+8JiuKGay6c1wRMaaSN8e/1aX4j28xL8tBZigJfUxE5k5qrIQPvub4UaXuPXxY
	FG4W4uX+lcabSdZEdDiUE53s6uSq7YCSz7prdokVj5Iq8O+aEfJ5mqikQZqIe1PWcjslelVsC3sZs
	rxQBuMEVczsacw7eVFzmnFEJrBuoAPprovVeKmGtSQ4Yb3hMNrEg9eF7sgLvVfNU9hvdpF1P3GsoK
	SAP4MuFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIhCQ-00000006j1f-0Pxw;
	Mon, 19 Oct 2026 06:50:22 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIhCN-00000006j0k-3pyK;
	Mon, 19 Oct 2026 06:50:21 +0000
Date: Mon, 19 Oct 2026 08:50:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792392615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=emrArgPAsqjY08ePzydEuGzwJRc8mfRvNdYNfd+oT14=;
	b=A+jIjzxXNlwnaYRh3MCvTCxo+i9IXaPhGLvG2oH466t1wTayWoBberbLAa2GuRB/wHQgTC
	da2tJmZEYQOBdTmUpl+dQDW/kbTi+6wuwI07icPzElp34f7sgapAxeSU028PxHEAfjbzsR
	0Hw81pH3Tf39waNxC2ODPVF0kgQpH29elyjev+0uCfBpDrmis2ZCz92in7o6+VkKiqkzSl
	GZkKEgGxy0VAVBDGX4vTtulhRD7wbW0gcCwP5kQG1fHjuUE9BVU9w2xmyfkJke6LrYsNX/
	pOBOu0P59WVHGR1DGkdep5xRghY6FyD/+HgUN7MK66WEGNBihMDovhjLGbLhxA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792392615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=emrArgPAsqjY08ePzydEuGzwJRc8mfRvNdYNfd+oT14=;
	b=N0nc2AwPluQ0WZBDwpFX2oxBUxd7FztoVVAORN9RA8l+QPlwEeWSIu1c/c+AuEx+nY1D5I
	CZgehYvF36e2EEAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, devicetree@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v9 05/18] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
Message-ID: <20261019065013.QUQYpnz-@linutronix.de>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
 <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-5-b624c09e3ee5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-5-b624c09e3ee5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_235020_102099_860AB445 
X-CRM114-Status: UNSURE (   8.33  )
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

On 2026-10-17 13:46:00 [-0600], James Hilliard wrote:
> 
> This keeps additional synchronization on the timeout path, without a
> driver lock in every interrupt and wait. The caller can sleep, this IRQ
> is not registered as shared, and the handler does not acquire the
> controller mutex held by the caller. The tradeoff is unbounded cleanup
> latency and no priority inheritance: a starved IRQ thread can prevent
> timeout cleanup from returning and block other operations on the
> controller. This is a handler-lifetime boundary, not an RT
> recovery-latency guarantee.
> 
> Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/r/20260909085434.C8F201F00A3A@smtp.kernel.org
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian

