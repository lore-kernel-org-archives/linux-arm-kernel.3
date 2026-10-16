Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D3BCCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 11:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=; b=S4AYBkMUnSEQ30hsAQX9pgeYqY
	BQnIty3LNLOmWl/lrr/WbzdHO1iFOGaYNJHbgCqc3GY9dF5VxqNcBdWI8XpVVr7gAoUlJMLVzZLsf
	E5AjgMp5rih5hPDc3GQ640NCqH0mYPqSjaE2c1THpISKwK7509RAswY75UuW3cmmZbVJZyBIJgVG0
	hW3/2+6jP8quTfeVYnk1tApJC/74pejJW5ekMXBUqC9REj5t2hPyob0bXL/Ng4H+mAHl53xSf6nwz
	kxcftAmHlEeGsD2uk9mICNuxCPMiTFwuPh7h4ioqbQJP0vZE4P0P6bSBD4noSSk+ooGJxiund4t3A
	E/mxcJDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHg1u-00000002l9G-3coB;
	Fri, 16 Oct 2026 11:23:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHg1t-00000002l95-1LKA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 11:23:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 753C260018;
	Fri, 16 Oct 2026 11:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7E111F000C4;
	Fri, 16 Oct 2026 11:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792149796;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lMbGhJbYO2+QP0XChqqc4f6LxF7mzlqW9Y/EoQnU//Qh5ZFxPzhAucIzDbEzxG6vY
	 +W+ROUZGp7VhK2Tg++YoIUtjJ+Du8rRl8lw5kXYwIR/s/1wJwIgbnn/bDGJmV6Z1zU
	 EY0/omqJ/jXywUxwRxQUH1uK8heCrJGCrpPxyFKl56UJR81F/XhwuX+Fe+5xRmqguJ
	 5LuTdtE63RPhYWGa+USrDY4yBcLOeGvYLmPXE5tpzyPpA8jbQCm/Mt6hYpW/NTrd8C
	 WZLbzvpzfzetOw8sE0GqWPOiTc7CdOQFHlY7cxQhsQx6+ok8RWAKABgQYWMDHtDAnl
	 EKEUCdGn+Wu0w==
From: netdev-bot+sinfo@kernel.org
To: Sai Varun Mudepally <saivarun@couthit.com>
Cc: danishanwar@ti.com, parvathi@couthit.com, rogerq@kernel.org,
 pmohan@couthit.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, afd@ti.com,
 basharath@couthit.com, horms@kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, pratheesh@ti.com,
 vigneshr@ti.com, praneeth@ti.com, srk@ti.com, j-rameshbabu@ti.com,
 m-malladi@ti.com, rogerq@ti.com, krishna@couthit.com, mohan@couthit.com
Subject: Re: [PATCH net-next] net: ti: icssm-prueth: use
 dev_close()/dev_open() in icssm_prueth_change_mode()
Date: Fri, 16 Oct 2026 11:23:14 +0000
Message-ID: <179214979438.408196.11375100740673315884@kernel.org>
In-Reply-To: <20261016105206.167094-1-saivarun@couthit.com>
References: <20261016105206.167094-1-saivarun@couthit.com>
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

