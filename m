Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3D6CA9EDE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 02:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=80POjU5WP6ctS0DqN7hA/63JAQ8Agh1hTny2C1kJcvk=; b=EvWIHEsnsgfwnn7nELNYqJxlV9
	10aDnrf9je/jOSn5HHpE0GeKGWeWmWSXFU/9saP6AzbFCMrAMlhFvEJltCllTOOL7BsNEB57HMT7s
	4fhrmx9MahEuziMVhkF4NhbcGgZAXKdGyJUYYks4ro4GaWsM+xPzHblbzr58dUyj812xPJBlWvWJy
	WE4KLbGeH4uwnXXSX5alnDcbmEDafO11kY6i9Byki5IckxigLnWvjiB0xOuY0bL6yBN9LwTfwDv2h
	A4AjNMHw/BKTnl85IX1AJvUmV3u/+/f0UBB0dWiXZASv1onlVsApepD9YvTS09H+UhXV+1RWEV/n2
	VaD/xkIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGSZy-0000000Bq0j-45DK;
	Tue, 13 Oct 2026 02:49:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGSZx-0000000Bq0Q-1RVJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 02:49:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3801060207;
	Tue, 13 Oct 2026 02:49:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 154AB1F000FF;
	Tue, 13 Oct 2026 02:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791859763;
	bh=80POjU5WP6ctS0DqN7hA/63JAQ8Agh1hTny2C1kJcvk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nXw+TUHwG739qIo/HNw5/zeI5VPnReQZ4zkJew9KLyKnnb13CBnixf2XrC/WPSJda
	 N31dPAEpX4EYnkoen4dLZP2ctuZc6TVCwAb+teQxXPkrNR8SYA6afdBppg9eQPTm7s
	 YFH84K2n/vafR8sUPQhuOdSle3Sxc27oPkZgxOeqzJDbY82r2ibzs5pihnf1+nHn5x
	 q8XRhxQqalu+VPejVdkf6flRxaVvP1sP762ONLch1wTDi0DPXDlFRBsTdE93bfUpIE
	 bFQKKI/JRvlKwsTuaL/LgiXXrFKl75vXKZoYqn7wHcEkAtSnxMuOT3I1M4bIbpYQar
	 +cI5L3UCVBLTg==
From: netdev-bot+sinfo@kernel.org
To: Pengfei Zhang <zhangfeionline@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, EricChan <chenchuangyu@xiaomi.com>,
 Simon Horman <horms@kernel.org>, zhangpengfei16@xiaomi.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: xgmac: do not treat TBU as a TX event
Date: Tue, 13 Oct 2026 02:49:22 +0000
Message-ID: <179185976266.2527009.17600570633406382637@kernel.org>
In-Reply-To: <20261013024747.2688984-1-zhangfeionline@gmail.com>
References: <20261013024747.2688984-1-zhangfeionline@gmail.com>
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

