Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5515BCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 07:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=; b=lk/e7KhRbUrQKLMrqQA2q3HiSd
	JKkME2BVWsuDuKVDxdEJ4Igr8GkpCKk7FoAoYnvBcKneCiVEgcpx19BB8KcHPucnAAdTKTr4de3mF
	oklUCk+gPRjwkmxuNR1YnF3rflztXThyeL61W0jlAqYjuJJtgWkIPiYUo2+PChVTuFGZm2kc5KHoM
	zYN5QUJpxs4iYukvNgLqcCWFX3DJWAJIVy3QKJ/csDMide9gYvQKkeQgpOJn/S5Oz/u8k8ZGjrEco
	3T60p7LfRw9lHyHisc5KFnHY1hwMUUCDjA0kE/VqwODo9DeegBaFz8wcxs0w68uDQjHn8FXCs35tu
	WjY8fvww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDzIn-00000000B3K-2lSl;
	Tue, 06 Oct 2026 07:09:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDzIm-00000000B3E-2HyM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 07:09:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A08360142;
	Tue,  6 Oct 2026 07:09:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A040D1F000FF;
	Tue,  6 Oct 2026 07:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791270567;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WGr4IuO105RHyzOQoi/Hy/+bWw7lGjf2oNSGVXmvXObVHxgtF2YZwvIoVomIjc5Rh
	 lMgdfCYKmudVkBfTzDFZo4eujZn+VLI2Ex55ymJLmzWX11gVfdwgpFxOTb/fvrGMBv
	 ZNawM12F/ULXJoFk1cDlTw8zoyDFNBv+RK1C32Ull+gZ9jpELUWEnjkHFCe/JYNsDC
	 /kqVcW95d5e/X2NVUKsGZDC397VHrLANwT+fO7Yv1TEYSdBx9O4Cd7nRO7zpBuKXff
	 U8KtobRkdFuCztJmCBPhK2VKdCAlWDUNkdgaDlFm1jgg6y33cvthOSkmeYK0dack9L
	 tYx4qVk5WBVkg==
From: netdev-bot+sinfo@kernel.org
To: James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Nicolai Buchwitz <nb@tipi-net.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: stmmac: unwind the WoL IRQ after a safety IRQ
 request failure
Date: Tue, 06 Oct 2026 07:09:26 +0000
Message-ID: <179127056620.2231598.8882282421523696709@kernel.org>
In-Reply-To: <20261006-stmmac-irq-unwind-v2-1-194591c87460@gmail.com>
References: <20261006-stmmac-irq-unwind-v2-1-194591c87460@gmail.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
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

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by code inspection). If it was triggered please include
   the symptoms, like the stack trace or error messages.

 - What hardware the change was tested on. For driver fixes please
   mention the device (and if relevant firmware version) used for
   testing, or say that the change was not tested on real hardware.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account. If the series needs another revision for
other reasons, please include the information in the commit messages
then.

The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.

