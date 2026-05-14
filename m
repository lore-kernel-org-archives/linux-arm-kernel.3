Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58096CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 16:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7IRRu3kRGVY8+0ORwhxb0Nyayz34TeBk0Kigs2B7oiw=; b=UzUpDtSAmFxPxepjliUv7Gs2/p
	7IS0z2db+cJRR81geLeda5uZkpJwCgbGNJcM0IISQ78953e0FwLUbZfbBFj0F+pRTb0B5vewd8oQU
	HZScrYsu52KJcR9I285X96gGxFKPlsjMLXK9LDxL99b4mOB7EiZvtdGCO4EUxo7aMxZCGPiQ+EnrC
	kBNWhPs1Ra20xSvc6MkNGR0E3L//QuN2jyl4Q9bFMlcoyYYQR8vPTreB2O94uqVkQ8rd5R8R9wZmB
	488M8d1QnCLlRzuYW8sW75IEu9+m9e7Ro5h7h3aN/zLhb1ps4kjXtkqZjKr83xfR0jegf/YDDRFb8
	MuebsR1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYbq-0000000600p-1bBx;
	Thu, 14 May 2026 16:08:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYbo-0000000600N-0D38;
	Thu, 14 May 2026 16:08:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A6214066D;
	Thu, 14 May 2026 16:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26BD6C2BCB3;
	Thu, 14 May 2026 16:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778774903;
	bh=JgMf4wRpFiwD3alNMNl5XaWiw8QaBk00SyYTww0vZHg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QX849FNdq4n1pmDeYiczWfPi/yO0SBj6+z6Hg34KhSCUe8UfPKXfpb8S0/gUq29Rw
	 ntpr2ddLBmVU18R2dqsRINe99c1TKju9sCH4QXRCdj4ipVNkOUhTmISarVEy22t1A2
	 xG/jtJQe+j8jbDWhtttJr72lMk2Vx227JPBhzPIlHWgIi3HrcFwl7ZuT6gCacmvAR/
	 g7xfAevIhvbGXRgGXQWifiehUTDcd8DU4s09uznuhJUSbcfrrfWQEsRFs2m0j8Mfd9
	 LqcmF+oT4TACdpt1zxcpaoIOSvttx/snQU9nuc0cSX6nkQkcFTXphvvuImPdJx9q0O
	 ryA+uquraHqXw==
From: Vinod Koul <vkoul@kernel.org>
To: sven@kernel.org, j@jannau.net, neal@gompa.dev, 
 neil.armstrong@linaro.org, marcan@marcan.st, p.zabel@pengutronix.de, 
 David Carlier <devnexen@gmail.com>
Cc: olteanv@gmail.com, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260508201958.30060-1-devnexen@gmail.com>
References: <20260507163746.108086-1-devnexen@gmail.com>
 <20260508201958.30060-1-devnexen@gmail.com>
Subject: Re: [PATCH v3] phy: apple: atc: Fix typec switch/mux leak on
 unbind
Message-Id: <177877489977.1079578.13272721889190867698.b4-ty@kernel.org>
Date: Thu, 14 May 2026 21:38:19 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_090824_110893_A47D4315 
X-CRM114-Status: UNSURE (   7.29  )
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


On Fri, 08 May 2026 21:19:58 +0100, David Carlier wrote:
> atcphy_probe_switch() and atcphy_probe_mux() discard the pointers
> returned by typec_switch_register() and typec_mux_register(). The
> platform driver has no .remove callback, so when the driver unbinds
> (e.g. via sysfs unbind) neither typec_switch_unregister() nor
> typec_mux_unregister() is called. The framework reference taken in
> typec_switch_register() (device_initialize() + device_add() in
> drivers/usb/typec/mux.c) is therefore never dropped and the
> typec_switch_dev / typec_mux_dev objects stay live forever, with
> their sysfs entries under the typec_mux class also left behind. A
> subsequent rebind cannot recreate them with the same fwnode-derived
> name.
> 
> [...]

Applied, thanks!

[1/1] phy: apple: atc: Fix typec switch/mux leak on unbind
      commit: 1854082fe0ddb81bc93d1f8e8a00554217fd09d1

Best regards,
-- 
~Vinod



