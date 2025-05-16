Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F47EC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 01:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6cyC1to3S7/OTHBQdGlnhn9ioW+Rc7hDE8cDiItMeVM=; b=Bcf6guDRr6wKBAik8tm8qUm9ln
	A+DOxMeervhpTWfDgTX0hiwF9VRn1VtguAZ+yK8igYKB3XkDEryUlSuYKW/+KOdJ1L9acjzGTQ4J2
	e2FWDZfgbP1qxSiQU2WNtAaijFLF+ykZsHfSGtCtgwJKKvRxNQa+Xm3u7aHswo0nngm68/Hj7S5bk
	Gw9/BZJ/CGaD6a+gvy7GtrBg/HYzWFsNzqYxns4YpaYso0FuTREgn24wfRCg1XAZODkBFIaF/oy9R
	gFao+4DAcBmhatxX3xBcPvLv0FANdsr3vSYUU/XL/BsXBllXSDXheBCSqZ8KunIFfC6bSBwB+VSqc
	hbot1/hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFjXV-00000002B1h-2y38;
	Fri, 16 May 2025 01:07:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFjVL-00000002AoM-2qLE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 01:04:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D0B9B5C4445;
	Fri, 16 May 2025 01:02:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AC0EC4CEE7;
	Fri, 16 May 2025 01:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747357489;
	bh=3ggWfmad+Ahr7bFez/BW9d/QPrzgbhpVN0Lt6HYLdYw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fM5HpisdK9I89uPQxKjo44flBMfJQYJLWGvodP3rAmh4O/ZYNp19nXuMIEXEt9vl9
	 M6lcd8BIxyIyhg27f8WudzMRH+ojoT4sr8/f5BJK8YsVeIrKy4DQ6YTDCUMBqQ2fVQ
	 IimnR8/BHVSAg/ibZJLPhMGgE9mqyu6AEQ35FoQP46OCjtBMixlNrsXyCwh3DLULeW
	 EvTbvV34sUfjtRidMBti0A97mHFewVxi3760FPT0iiTU7aUq9lXjsJ7FKS2YrySQcV
	 VRajxmnCd8ublHWq0l2oeTPk/9NFvlTFJmMc2nRAIac5cSMRzcm1cUL7hg662V7Rl1
	 TCUdwm5vxv7Tg==
Date: Thu, 15 May 2025 18:04:48 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Russell King <linux@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Vadim Fedorenko
 <vadim.fedorenko@linux.dev>, Richard Cochran <richardcochran@gmail.com>,
 Furong Xu <0x1207@gmail.com>
Subject: Re: [PATCH v2 net-next] net: stmmac: convert to ndo_hwtstamp_get()
 and ndo_hwtstamp_set()
Message-ID: <20250515180448.2d00909a@kernel.org>
In-Reply-To: <20250514143249.1808377-1-vladimir.oltean@nxp.com>
References: <20250514143249.1808377-1-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_180451_762145_A311CFF8 
X-CRM114-Status: UNSURE (   7.36  )
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

On Wed, 14 May 2025 17:32:49 +0300 Vladimir Oltean wrote:
> +	if (!netif_running(dev)) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "Cannot change timestamping configuration while up");

changed up -> down when applying

