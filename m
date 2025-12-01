Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E26FD111A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 11:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bu8c9JUvNnhpB2G2T0Zk2Y/HWJ0pH+/dZRrRGp2JIr8=; b=zA/iaYVXWBUUlpIa0XKYnHbcxo
	aI/XnJgY1UV/kS8wDWTkRG1T32s1p8XrphzbgaQEQmDPl+TXaDlMTOvlqqNB1/mVSv5UBdOefvb7A
	FA1eVMezQ/dTzXK4PZswqT/E5SiECw5GlveLJUlJZY36YstKucvZx27uuxGaTbwEk0b5xOEkbm+jE
	s2a3PrSSunltF7DI/cE3xBdjxhUlOLzBBSVLQdDw8uQpoYBIjkfYLKs+8eO1DAaV/DUhLKr0oyl5x
	yGo2I6Ny0/XIxo9UwV6Gs8ORNUmn9JSTh1pC2A0eCMUBEL8C76pvMEZ6VN1D6zMUCn1/r0QWB2N28
	86hxfpAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1q9-00000003PxC-1cPy;
	Mon, 01 Dec 2025 11:13:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1q8-00000003Pvw-0Aho
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 11:13:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2234260121;
	Mon,  1 Dec 2025 11:13:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FD66C113D0;
	Mon,  1 Dec 2025 11:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764587586;
	bh=fYMUbue3Ka37fHtYbiOTRTL0VUjzqr8ncwExp4fw1FE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pn4Nvlb4RGM/2J1Djw/JQddi/rPHy2L2SrgU5wUXUnhXZ3erHzGf44qJlxd7ZqHwA
	 yJN7Vle/JIEZF0TQeGO1vFt8693jeI7pr/V94TDEHSF8mfHH0xSgIjXAmPAXXim7Bm
	 Yjz5RGABeUJ3Ze/bYIsjU/vtpQ8W1S6Mz2gS/YxxxbhDhf6Twvo6DG2FSyOTT4fGUh
	 jMZEpDLyHunt9uxqS8oFWE7G72LSqK3a0jK/eKFABDtWYJxZynlB45SneYduYroF+G
	 S9LGtt+fxGQLHTHgGi/TrM9Lp6yVGuNTtYDNuve6IUXFkmmMgMoW1dq6xMTQaIHEE6
	 /89T5rQuMh1KQ==
Date: Mon, 1 Dec 2025 11:13:02 +0000
From: Simon Horman <horms@kernel.org>
To: 2694439648@qq.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, hailong.fan@siengine.com,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, inux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: Modify the judgment condition of "tx_avail"
 from 1 to 2
Message-ID: <aS14PnwjbFcD_J70@horms.kernel.org>
References: <tencent_22959DC8315158E23D77C14B9B33C97EA60A@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_22959DC8315158E23D77C14B9B33C97EA60A@qq.com>
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

On Mon, Dec 01, 2025 at 10:57:01AM +0800, 2694439648@qq.com wrote:
> From: "hailong.fan" <hailong.fan@siengine.com>
> 
>     Under certain conditions, a WARN_ON will be triggered
>     if avail equals 1.
> 
>     For example, when a VLAN packet is to send,
>     stmmac_vlan_insert consumes one unit of space,
>     and the data itself consumes another.
>     actually requiring 2 units of space in total.

Hi,

I am wondering if there are other cases where an extra
descriptor is needed. And if so, can multiple such conditions
occur at the same time?

I am also wondering if the VLAN condition can be detected,
so a descriptor is only reserved for VLAN use if it will
actually be used for a VLAN.

And I think it would be worth noting how this problem was discovered
e.g. by inspection, using tooling (static analysis, AI, ...).
And how it has been tested e.g. On real HW, compile tested only.


As this is a fix for Networking code present in the net tree
it should be based on that tree. And targeted at that tree like this:

Subject: [PATCH net] ...

Also, as a fix for net, it should have a fixes tag.
Generally, this should denote the first patch where the problem would
manifest. In this case this seems to be a likely candidate:

Fixes: 30d932279dc2 ("net: stmmac: Add support for VLAN Insertion Offload")

The tag should go immediately above other tags, in this case your
Signed-off-by line, without any blank lines in between. And, like other
tags, it should not be line-wrapped.

For more information on the workflow for Networking changes please see:
https://docs.kernel.org/process/maintainer-netdev.html

> 
> Signed-off-by: hailong.fan <hailong.fan@siengine.com>

