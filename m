Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D61DCC6B3A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 11:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=; b=kuMvQOsQHAm7nkcTJrMpi5qI5M
	/wTZacPvLhqhKpfZklkAQf4JoJPcSqBThtV+S0D8F8gQyChJEApRYAFZ8eD/imBqJICPefBI/W8Il
	gSduO/0eEcaOh7fN6QvvpvRnBHACcgSmDSrPBH+O9GTMjJpF/0woNRMWLr64EY5U/9FUgqlcvQvAx
	CM10I22Ow5UPMnytUqgBG/V4Jjd1dvRjReG1f43ZQd2U5UFF5a3XrYDMX7kCem5EKXW1NqofYlEQa
	mluswI5e6gvk6+Zqn57HQWo71hVIO4KwlUkVcQvOMTUoeA9yEpcUtKvytoWGKh+RZI/4F8GCmdKp+
	1XH45FCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJel-0000000HZen-2MCM;
	Thu, 15 Oct 2026 11:29:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJek-0000000HZeA-01le
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 11:29:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 17C2760052;
	Thu, 15 Oct 2026 11:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 347681F000C5;
	Thu, 15 Oct 2026 11:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792063792;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=i2zudOXd7Ihuir264YgXFWuXIplAgdpf6MkQb4pPaNMMkAne0C3RmNsBpm7bSIk3a
	 /EFiG0z3Xb1UOvHnFACYMz4pfm/ijiHKW6Ld89wmSybEpRCN8ulXn/XL21+mEI27Vi
	 SF3YBQknBlRD+GQGULXZYQp8ePw61SINnVtxBKg+qkOEsoDCnFJlqwa1CkWafEQX4H
	 25W1wsha/ZCy1OEeieqo11+r2DQ/jU65TQv/shOpxrFR2frSvbIDsafYXeExTE/roE
	 Af8NestTnZbNBlPM6J/V8OsWWavqE0LrelrDDcJR31UBJepPcBFo9kqOeKSNML/UNc
	 vozuj53w/bDVQ==
From: netdev-bot+sinfo@kernel.org
To: Xiaochuan Li <chuanx2070@163.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] net: stmmac: remove STMMAC_DOWN check to avoid irq storm
Date: Thu, 15 Oct 2026 11:29:51 +0000
Message-ID: <179206379174.408196.18162425580678440243@kernel.org>
In-Reply-To: <20261015112415.437900-1-chuanx2070@163.com>
References: <20261015112415.437900-1-chuanx2070@163.com>
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

