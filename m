Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441D3C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 16:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IymwDOlEVdjv/zqf60ZWR6ir3N32H3qPjnlH7yHMLyU=; b=F6Jy4lRBzTP3MHzezyS7jSBkgm
	d/57Ef5kxqxMthAZlLtTFIlMlDrdUKkjWODCxRqJiNv+7NYsUAmzf0NWr06cRD2Z+lC4Sh2Sc7Zhy
	7YZf1qrLwuc3leW+V7JTohjomjjnSAfOsL/k6E+MG4PhJxBS3c1ytHanRkhU1xbnbc7pAkzLw5Hrn
	xOFuSuKwHeI7s0S81rlnKy9h9W7OHEquR4g/g/9Ig+GfJ91wT70LmbxKWq48Zd/xlJSTl1e9D9BbA
	JQz9enwd96IgIbe1vZcPL1aIFblYmBaa++d66pYaY0UK5WzmPBpJRgKTr9CQwD8CzY09kSzaMzpw1
	ekUuifDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucRbT-0000000AfUL-3goO;
	Thu, 17 Jul 2025 16:37:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucPBY-0000000AJoY-02WT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 14:02:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C3EF1A5792E;
	Thu, 17 Jul 2025 14:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADFEEC4CEE3;
	Thu, 17 Jul 2025 14:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752760926;
	bh=KVyD7lFOvqRuleMrpnlzsXkDQLyNjWkA4eJ+WSGLfM4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZmtHm77uIqjEh59AdgGwDJEJaViM6/f/YJFwK9E6S0h9Jb+XTbD2nn+cBLESgGHZQ
	 omlIP7Xe9cSwaYxSoQsMHKbiAd6hkGVfcndXC/En/OWCAyWb/A0Wagx4KFMj2SQ2Ik
	 p1yl8sXB2Rj4ZRagval+STgnQDrvGomb4jyw9d2PS+ym0A7UcrNFLX4h2QbMRxSqoG
	 VoXEI8xMv532qlMB4fDRCL2mVA4L0na3En5rKaxLfunh9WginRpyv4gIUZExr51dXn
	 O6WcCGjQHPvqrRgcTum2IPACtAg8SYiQm41myJMz4XvBHXr6X1eCDcn3U2Tm+rMv6W
	 f/ItZzHvIOzog==
Date: Thu, 17 Jul 2025 07:02:04 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, Clark
 Wang <xiaoning.wang@nxp.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, imx@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, upstream@lists.phytec.de
Subject: Re: [PATCH 0/2] Populate of_node for i.MX netdevs
Message-ID: <20250717070204.66e34588@kernel.org>
In-Reply-To: <20250717090037.4097520-1-primoz.fiser@norik.com>
References: <20250717090037.4097520-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_070208_114524_2C11FE77 
X-CRM114-Status: UNSURE (   9.43  )
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

On Thu, 17 Jul 2025 11:00:35 +0200 Primoz Fiser wrote:
> Recently when working on predictable network names for i.MX SoCs, it
> was discovered that of_node sysfs properties are missing for FEC and
> EQOS interfaces.
> 
> Without this, udev is unable to expose the OF_* properties (OF_NAME,
> OF_FULLNAME, OF_COMPATIBLE, OF_ALIAS, etc.) and thus we cannot identify
> interface based on those properties.
> 
> Fix this by populating netdev of_node in respective drivers.

Seems legit, but would be good to CC Open Firmware maintainers.

If we want to make propagating the OF linkage a think I think we should
add a flavor of SET_NETDEV_DEV() which does that for the caller.
SET_NETDEV_DEV_OF() ?
-- 
pw-bot: cr

