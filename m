Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E5ACA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 07:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=80POjU5WP6ctS0DqN7hA/63JAQ8Agh1hTny2C1kJcvk=; b=yUuv28zivpzGYhC7onVIgpY8Qr
	1uWybu81vFphUlQVymQgl6YamvyVG59Z4OX1N/pBdDnnBLjI3zgQQcu8Esre2cFqbZWT5fztS1BRe
	1oGTuX7dYfD4bG89y1PHI7oMrpsyToU97Yjri2QUW8CWgk0jnN01uxcgbYCXGYv3e1Jw71ykBFxyx
	lRpSjJ+6DB6TPHK/ZfJsdzmIw51VFbJX94kAeCsC1u0iUwKR8oXgNjwj2DWocYRTbzP85QeS5FDO7
	Qsdab6eDr9jJGtvBErruRV8LHwer+4i/tmk8BeVUHCc+T3+fDSyr8Ib4z8pQCba3YqYfkDlIUKiZ6
	SyxvOZKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDGGm-0000000ES4D-2bPr;
	Sun, 04 Oct 2026 07:04:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDGGk-0000000ES47-2R7u
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 07:04:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AF33460052;
	Sun,  4 Oct 2026 07:04:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A55A01F000FF;
	Sun,  4 Oct 2026 07:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791097461;
	bh=80POjU5WP6ctS0DqN7hA/63JAQ8Agh1hTny2C1kJcvk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=is6j0xilXhR4ypqsKJsBM9X5lO6Qm7OUlcfEeJmeAXo0J/ruHrmYoexYJ1Z9w2nu/
	 zx7rj/yqLYTth3bUYmx8tXowSYP4aFFokyhdyMbgMI9mXNRUkrq65/0QQtSLBLJiVS
	 kByIRa6Z3baBMCYMvIlx7lRkIrVU7W8pKaf48a63aHAMnJgTHiV/Ya+86c8H1NH3vd
	 L2n9Eame+UJcugO5y/H0JhTS2asC9wlHbHxGP2Mnz4LUpBkF/O1MRdWwHCOExUZIRy
	 +YOg8aG+A8wmQ36PoqmboPnoIwMnTMSrci4sAWPZ6VuIi/mjHG1vGq3PdY52e9kNBL
	 UwatJhLYGqoaQ==
From: netdev-bot+sinfo@kernel.org
To: Sagi Maimon <maimon.sagi@gmail.com>
Cc: netdev@vger.kernel.org, kuba@kernel.org, pabeni@redhat.com,
 suraj.gupta2@amd.com, radhey.shyam.pandey@amd.com, michal.simek@amd.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 robert.hancock@calian.com, sean.anderson@linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v5] net: axienet: do not report TX completions as NAPI work
Date: Sun, 04 Oct 2026 07:04:20 +0000
Message-ID: <179109746015.1402591.14131579685594488279@kernel.org>
In-Reply-To: <20261004065930.1004953-1-maimon.sagi@gmail.com>
References: <20261004065930.1004953-1-maimon.sagi@gmail.com>
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

