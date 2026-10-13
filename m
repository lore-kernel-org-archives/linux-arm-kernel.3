Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4957CA9EDE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 03:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9zRtXHe/J1k/4/9wAeq1n+PwAt+ioXmV3zyjSNrjDw=; b=Yygg/U91+Y+WNpOkrgGeFeMdP1
	uu0uJBbRlRvnCH94aQ92C2/dZw4Rc+6J2KaUEbcRPvYfQ/roM9cP6TRckYqPpXoZtAcoO/XmuelOs
	Dr3RtzUMeHrq1UekvDpIueRmEhmhYaoof/I39Z3Rl0XLM39UMtqI8Y+r+ycS130yR98EeynrSqNyq
	FMOQxODrBE4xJMSplpEIFzKWb6DCZpmfFlIQin/5IonTfzipotfpFzhSNa4+9VjJaM8nn/ZqlacgZ
	+9djJs4zEJO+p3L3YNlSqgmtwAXa6xvr/80XkZnQMbMHczLivzxHoaAo/XeUrwWSlJkq5IH481M3z
	b0QUxEUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGTCj-0000000BsMr-0pnc;
	Tue, 13 Oct 2026 03:29:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGTCg-0000000BsMY-1sgA;
	Tue, 13 Oct 2026 03:29:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 83381601DE;
	Tue, 13 Oct 2026 03:29:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D561F000FF;
	Tue, 13 Oct 2026 03:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791862165;
	bh=Z9zRtXHe/J1k/4/9wAeq1n+PwAt+ioXmV3zyjSNrjDw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bYnFXpkMNtiJAML/w5KxQ7cWKsQmhDiXM0x2NnhfiuPdxn0wwg4B8979yGVrhm4q+
	 FLXRfZaHWovuTgweq1Hm75MNV5WL9DemVgdYkF3vmm22EAEV9XHoaf4dcVBW0Igf7G
	 odjTRBgGLAeXYRUaabEeqR+y914M8nKO/LQbvJ6j4LnHdzZ2RNmbGpumvAoRRk4i6t
	 3YpVp7K6dTrZFv9FataZdyCB0yhydd/JHGiYc2AtwjN1xsIBkOp0nMEOunrab6SWP5
	 og12dum1A+fZsX+D0GymRrCqwATX9Bz7LxeDhNyKnOB9szypR5Zk7P46KfvU719gzt
	 gVpF3L27+B7Uw==
From: netdev-bot+sinfo@kernel.org
To: Cunhao Lu <1579567540@qq.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
 Vincent Mailhol <mailhol@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 linux-can@vger.kernel.org, netdev@vger.kernel.org, kernel@pengutronix.de,
 Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH net] can: rockchip_canfd: stop bus-off restart before
 closing the device
Date: Tue, 13 Oct 2026 03:29:23 +0000
Message-ID: <179186216396.2527009.17545175870858054500@kernel.org>
In-Reply-To: <tencent_5802EE88434010229EDF7A53084D994C6106@qq.com>
References: <tencent_5802EE88434010229EDF7A53084D994C6106@qq.com>
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

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account. If the series needs another revision for
other reasons, please include the information in the commit messages
then.

The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.

