Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6457E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 18:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5EOC3Eyi4riAHpPoH+OdnjbLtokL2fQDb21WOalopeQ=; b=mjqsnc4TCeBPDMIAlvUIKLlvi0
	ml9ScHQ5j3saqoFU2nrXWcYwYufUGAEwoBUNO7uec5kSPwMaNy9L7iSUNk/JeyOuYL3ktZ5JupNAg
	+J8WuB4uIIrYuAQESycVa44RsdejX9rCEs5qrAx765K/YZ/i9wcCc1IZO3AJrgztv2QF2aDSXAchO
	nM1J0HUjdN99Ps04qvqsGLIGsbpKFFs/5J2wYSQrwpjD+ipLqR/rPRg9Wpbf1At3Z3LcNfa7G5kNU
	rvX9EESg2TjNTdbzCEl9efQyokim7EYjZwP3Rf5YEY/zhqxcuLQjJyb3eaZD1TTTMks4HQUQ+irt4
	YY4jZcYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPn5n-0000000AXYu-09ck;
	Mon, 23 Dec 2024 18:23:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPn4Z-0000000AXKQ-3Ly2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 18:22:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2AF975C51A1;
	Mon, 23 Dec 2024 18:21:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AECEFC4CED3;
	Mon, 23 Dec 2024 18:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734978149;
	bh=FF7PzJvn7sDlwqSQQcQLyBEeHni4WaUfhYkI9VeAF3w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bkSMVUj0V2fgfEA0mKOALw2ZNypn1x/GAVZfDrdk8v3ARf9YIpNDECu4UuFr4GmyC
	 iL2zLHv1BATyAVjF1UThm5n/o01zacDf4YbwFSykchfyavvmn0Yx3CZKaS7SlRhSEH
	 OhZV1DhYNM2cW7Kv6blkkXZqNHYu0GAiHK1X6zORY81mSAnXtlH79DA7kYQA2vBN+/
	 XeFdM1aL14DzPXW5nu/EIePN175He0AjflJEFze/dzoc5OxsJJBIQ+SGbjrFtJFCuc
	 4js4/Pdglz6JPNRhOULqSkf8gDPU73H2ezt+BRttOSz5XqB4b+NK+r9w+3DGVTYP9T
	 yE1ExjJbNnpug==
Date: Mon, 23 Dec 2024 10:22:27 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: <wojciech.drewek@intel.com>, <n.zhandarovich@fintech.ru>,
 <aleksander.lobakin@intel.com>, <lukma@denx.de>, <m-malladi@ti.com>,
 <diogo.ivo@siemens.com>, <horms@kernel.org>, <pabeni@redhat.com>,
 <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>, Larysa Zaremba
 <larysa.zaremba@intel.com>, Michal Swiatkowski
 <michal.swiatkowski@linux.intel.com>
Subject: Re: [PATCH net-next v2 0/3] Add Multicast Filtering support for
 VLAN interface
Message-ID: <20241223102227.0c4e68be@kernel.org>
In-Reply-To: <20241223092557.2077526-1-danishanwar@ti.com>
References: <20241223092557.2077526-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_102231_895988_E4FE622E 
X-CRM114-Status: UNSURE (   8.08  )
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

On Mon, 23 Dec 2024 14:55:54 +0530 MD Danish Anwar wrote:
> This series adds Multicast filtering support for VLAN interfaces in dual
> EMAC and HSR offload mode for ICSSG driver.
> 
> Patch 1/3 - Adds support for VLAN in dual EMAC mode
> Patch 2/3 - Adds MC filtering support for VLAN in dual EMAC mode
> Patch 3/3 - Adds MC filtering support for VLAN in HSR mode

## Form letter - break

Networking development is suspended for winter holidays, until Jan 2nd.
We are currently accepting bug fixes only, see the announcements at:

https://lore.kernel.org/20241211164022.6a075d3a@kernel.org
https://lore.kernel.org/20241220182851.7acb6416@kernel.org

RFC patches sent for review only are welcome at any time.
-- 
pw-bot: defer
pv-bot: closed

