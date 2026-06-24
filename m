Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D9ACDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 21:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vBH6xv7ZkxkHBWgfUR9uRW7RIajxlyL6Gwv9+5lzgWI=; b=PNZOo5ILPmjeITcnbOKCtmTfC9
	4TdU3vD94INCRleqzfEyGvqRhKjLrnqhcgELiTuQrvxKsggZg9fKsqO571edMKsYNVpPs8N3pFH2P
	f9Ne7v1PqywTj1QKl1/wlR16hBxudamNXDzwPbIME8f3yJLM+h2pmb5dnvs0gHUQu4Hs7fBGnmPYv
	tinQecV2pcSMZYpHagu0MM22lmLlhPPQ2QA6ZBIdh+njTh5mrKBz4gRj2b2wLOSm5wm9woGqOvUbA
	1gGlFKf+5mWlWr1ji5lcm93JlMP83K9XcG5P+ks9NqpnuyzGIAhNHIc/AA8nZK9nfPzvP0NklI4j5
	oj8sAnuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcUxW-00000008MHi-1bA9;
	Wed, 24 Jun 2026 21:16:34 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcUxR-00000008MGr-3Xlg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 21:16:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 702B31A094C;
	Wed, 24 Jun 2026 21:16:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 43E18601C5;
	Wed, 24 Jun 2026 21:16:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 94B0F106C84E1;
	Wed, 24 Jun 2026 23:16:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782335785; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=vBH6xv7ZkxkHBWgfUR9uRW7RIajxlyL6Gwv9+5lzgWI=;
	b=ihyhfUrDPedUI5FP4ZV7tXSy0iuXl9nIPQP3HRjPaPi1uGIbPPtPYJSJ99R8KUDg4iTSjC
	9JXIOT+SGTF00BT7Hd7I65PkacTLr26gb7mqsMltGB/GkwlliTXYveFpfN+cd/FuJykCv5
	kVgs5c9YTAgbiErgWFIUJXF1lNDBzVe6Qs9sE5guaRkpxhnRFuo+fREx7g1IOXwuYI3pfg
	aeCkZWm6tm89HXjbhuz39OzH2ibsYDQPUnt61ok7rQzZsj20gZiAfg/gd1Kzcjz+vJ3K1L
	2DP40okNevtwFaM3biXSW2o4Q1cNRdK0UHZ3uQg2gLXtlWStXAFlZb7gMV+OBg==
Date: Wed, 24 Jun 2026 23:16:24 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Stepan Ionichev <sozdayvek@gmail.com>
Cc: daniel@thingy.jp, romain.perier@gmail.com,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: msc313: fix NULL deref in shared IRQ handler at
 probe
Message-ID: <178233558818.1517260.12796768179217211710.b4-ty@b4>
References: <20260511032703.48262-1-sozdayvek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511032703.48262-1-sozdayvek@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_141630_017695_5AEED46B 
X-CRM114-Status: UNSURE (   8.11  )
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

On Mon, 11 May 2026 08:27:03 +0500, Stepan Ionichev wrote:
> msc313_rtc_probe() calls devm_request_irq() with IRQF_SHARED and
> &pdev->dev as the cookie, but platform_set_drvdata() is only called
> later after the clock setup. With a shared IRQ line, another device
> on the same line can trigger the handler in that window. The
> handler does dev_get_drvdata() on the cookie, gets NULL, and
> dereferences priv->rtc_base in interrupt context.
> 
> [...]

Applied, thanks!

[1/1] rtc: msc313: fix NULL deref in shared IRQ handler at probe
      https://git.kernel.org/abelloni/c/a369f48be8de

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

