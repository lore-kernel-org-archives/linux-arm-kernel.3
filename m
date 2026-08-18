Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20CEFC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 15:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMF/k00A+M1XHfFhX1jiXE4OeuC5rRDr4p+usN3kA9s=; b=CCIJF+ndycWpyUa1Vk0RVKp6HP
	Iqmsux0sIZ+5zYHNsE4wzCZp9MgjNp5shtX9YlCqC2Uw8ydObyKd41wltHz3AHxnd+Wu5TISyyOjb
	/YS2L587JKyfV6HTFRuQ46GRXaDRasAJ0WkZ8jwfOU/fQ+ibWqlohJoqUT5HZKuZK2kVfrkhMQk5P
	xTDi16LuiqvvUwiKCXu3SYmhrPqy/NuUGLWQdkn4JX5Mn38zMG1rq9ZN4UhEs9K4wjCMXmwt+JF+Q
	3JOL74oHNoaBBaRX2AMQ4c2Ddlg76KiGDm3vtk87CA8+ZJidb+cPoSe0lfzwx6yPwpC3Uxv20Ps+0
	4WUB6xVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLN0-00000008Dpl-379D;
	Tue, 18 Aug 2026 15:04:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLMz-00000008Dpc-0OKj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 15:04:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 221BF601DE;
	Tue, 18 Aug 2026 15:04:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F961F000E9;
	Tue, 18 Aug 2026 15:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787065491;
	bh=QMF/k00A+M1XHfFhX1jiXE4OeuC5rRDr4p+usN3kA9s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Sg45YUpY84v7AXDKtFlfxy1T2WdMBO8FkrFLsQndraP3QcfVMoQdgkIh9s0PCSKGl
	 IB+zjlvbby2cq5ZrsMufkYSD291FftX/t92jtRhM/52nV7ArGelIpte+mGJtBl9ccD
	 SpzdutzUfPWvn547irtkpDhZNNBVtQ8oq+9AgBVbR7XfFczHAEwCIeV4CR2be5ycAQ
	 ZEx8n45zUgUGx7/hTwt2Gnt9FdXeOuGdeRuOpwNF+I222+Sl+Oj84i8nYgUcBIU2cq
	 pKM0DL8qXKUg+xsGwl8QyJEbW354dJ5Hl5DRDq8B4waETfX/JmB5ogn7eSopDbsCbU
	 DNhjC3xqDpxvg==
Date: Tue, 18 Aug 2026 08:04:50 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Zxyan Zhu <zxyan0222@gmail.com>
Cc: maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 richardcochran@gmail.com, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 muhammad.nazim.amirul.nazle.asmade@altera.com
Subject: Re: [PATCH net-next v3 0/2] net: stmmac: dwxgmac2: timestamp
 interrupt + Agilex5 fix
Message-ID: <20260818080450.7e010425@kernel.org>
In-Reply-To: <20260818132722.1852876-1-zxyan0222@gmail.com>
References: <20260818132722.1852876-1-zxyan0222@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 18 Aug 2026 21:27:20 +0800 Zxyan Zhu wrote:
> This series adds auxiliary snapshot (EXTTS) interrupt support to
> DWXGMAC2/DWXLGMAC2 and fixes a regression it would introduce on the
> Agilex5 cross-timestamp path.

## Form letter - net-next-closed

The merge window for v7.3 has started, and therefore net-next is closed
for new drivers, features, code refactoring and optimizations.
We will only consider applying net-next patches which were posted
before the announcement:

https://lore.kernel.org/20260816155953.072d73da@kernel.org

Fixes are obviously welcome at any time. net-next patches may be sent
for review and discussion only with an RFC tag.

Please repost when net-next reopens.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer
pv-bot: closed


