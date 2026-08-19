Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4D6C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 16:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6O/ENWAeI0ggqLJnnrqub6Mo13IAWCe6rYEcWK4qdzE=; b=WUthLuLELpIynsil+KZ0hdvGml
	rA7Pa0UkI1zjn4IxX3ixNXE5jEFXzKTWN6qH+dtmVvII/mTVfAcD+xrxE/uI2DEit0f9QX2p7n+fG
	qL31a6L4l54vE8Fcx/IU+ZhYQYofLuJNM1SbQpOQaw4llT2rp4khEidEnzKg7sGo0Sn2ZoPEFsTUe
	JtN+RHX5asFSgeEWGFzmXF0yYRieL7dGY9vMXZDwoH9pYkS4BiIVpZwMs9MfL4Kh3rCunfQbnPjYs
	KgZd714HovAMoSFK14nmRbfG01ugFVQLgoqXeeSqooIW+20GB/zgvUDp76pmCzGc/Gbdm1TAv41wd
	uy0NRMwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjCE-0000000ABf0-0uKi;
	Wed, 19 Aug 2026 16:31:22 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjCB-0000000ABde-1Ruc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 16:31:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D735C1A173C;
	Wed, 19 Aug 2026 16:31:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A990A5FF42;
	Wed, 19 Aug 2026 16:31:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9E34011C7590F;
	Wed, 19 Aug 2026 18:31:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787157073; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=6O/ENWAeI0ggqLJnnrqub6Mo13IAWCe6rYEcWK4qdzE=;
	b=LUJx+C47nbcPFdIyMNFVJ0AHbhn4SbhMjx2UIJSnCVts5yzzKTtEku3sZODhLmhKHgcslk
	Gmi1t+V6xP8DveYElL8lbbFrREuOa+U938bNVL4hLWgOJJcfDAfBqUX4uVsmEZecIsVX7v
	L1wfH43AV2QNsgmn5USe5XB3JP/rEb0vzqr69pHRJr1VV+DauqSn7IWYUOxss64U/Xng5F
	v0LwCZ5HJFR+HZc30i80PCZOcA1P3ZsoJV3M71KDJEO9NiewLX03j5JTKV3kiaOFI1MQPx
	jgNuR9RMtIedbuDB6QuUr0Lvnm/Pd4qxbv2HpnDUVsGW8EJv2cJX+gjBEccNFA==
Date: Wed, 19 Aug 2026 18:31:11 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Subject: Re: [PATCH] rtc: st-lpc: get IRQ via platform_get_irq()
Message-ID: <178715693847.130787.13227961965648988698.b4-ty@b4>
References: <20260714002259.1392655-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714002259.1392655-1-rosenp@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_093119_529796_610476B2 
X-CRM114-Status: UNSURE (   9.48  )
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

On Mon, 13 Jul 2026 17:22:59 -0700, Rosen Penev wrote:
> Replace irq_of_parse_and_map() with platform_get_irq(), which resolves
> the interrupt from pdev->dev.of_node directly and returns a positive IRQ
> or a negative errno (it never returns 0). Propagate the error on failure
> instead of the previous open-coded "IRQ missing or invalid" / -EINVAL
> message, so -EPROBE_DEFER is handled correctly. The rtc->irq field is a
> signed short, so the negative error code is preserved.
> 
> [...]

Applied, thanks!

[1/1] rtc: st-lpc: get IRQ via platform_get_irq()
      https://git.kernel.org/abelloni/c/da5e8713aee5

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

