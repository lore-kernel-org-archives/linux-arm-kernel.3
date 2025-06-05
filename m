Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04704C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 14:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O2fbdfzgdU3xpzxZE/A02Xz69i4NpwoVPz41CxqPEMI=; b=w7MhUGCqICo1EAx4Z4WHQ4yhIF
	+YhRwl9nRlTcpY7DWdxCQjs+DGDwKe0bBITBMUAkG05J4xbgKwsOIpta8X3fG5qViTPinc/myvhdB
	0w7h70j3s3k0XfEFswy41GAwT2G1dIRYPPy1+tKc1aQBL2mqVBqF6B7xVJnZZk5jvFGhOPaNtsUq/
	Bja0aDLlQO0Uo74Ada+1dsnlo8PcYLChJeRkrZcAStkuzyVS6GZxx0W9ijKm7NSU4jKHgKjt2jUKi
	rkup2qAg/4uSk8CofbOOyVoFZHvRUQWJqITS6uykCCXCcpgv4gdDHjJKFmeDMY6BXXlZJXwTUEgJ+
	9wKbOrsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNBPu-0000000FkcW-3Ued;
	Thu, 05 Jun 2025 14:18:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNBKl-0000000Fjyb-100f;
	Thu, 05 Jun 2025 14:12:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2E6D16112E;
	Thu,  5 Jun 2025 14:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D653BC4CEE7;
	Thu,  5 Jun 2025 14:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749132761;
	bh=H84nLkI3ISIc0XZxOb82bQ47deaFwc09tK9XpfuXpoE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mQP5nU+k5wknXL42DeCVSwgqclJwF6QQTDEopazgpCVt+hNmNOatPq2mNu5ws0ao8
	 fygyVWFQw8KoAwpPAoafke3rJbZHbqWcqubQlfN0LYbCrvYl6hbYZTP3OPEJJTFfMR
	 aHSTqBhhGlRJWYhZAq2ZchIH/ozI8zlYmDW2AFg8aN+p/ksp+4n4ttHpv3aw/xUKzR
	 k2kpQHdYwZbrB2AakLVZYJH3mylXJkhk1fFGQCYdagZ2a0B9YepamAOt+hW1W8+4xT
	 u+h6NC9dPyvb7ZTxBa1XCNUk70Ic9CY70hcOZAf4s2apqwiz1Jwd6WEi5frkXV7yZw
	 L3fr1IPXpptTA==
Date: Thu, 5 Jun 2025 07:12:40 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jinjian Song <jinjian.song@fibocom.com>
Cc: andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com,
 chandrashekar.devegowda@intel.com, chiranjeevi.rapolu@linux.intel.com,
 corbet@lwn.net, danielwinkler@google.com, davem@davemloft.net,
 edumazet@google.com, haijun.liu@mediatek.com, helgaas@kernel.org,
 horms@kernel.org, johannes@sipsolutions.net, korneld@google.com,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 loic.poulain@linaro.org, m.chetan.kumar@linux.intel.com,
 matthias.bgg@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com,
 rafael.wang@fibocom.com, ricardo.martinez@linux.intel.com,
 ryazanov.s.a@gmail.com
Subject: Re: [net-next v1] net: wwan: t7xx: Parameterize data plane RX BAT
 and FAG count
Message-ID: <20250605071240.7133d1a5@kernel.org>
In-Reply-To: <20250520122141.025616c9@kernel.org>
References: <20250514104728.10869-1-jinjian.song@fibocom.com>
	<20250515180858.2568d930@kernel.org>
	<20250516084320.66998caf@kernel.org>
	<20250520122141.025616c9@kernel.org>
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

On Wed,  4 Jun 2025 17:17:22 +0800 Jinjian Song wrote:
> The parameters are used by data plane to request RX DMA buffers for the entrire lifetime of
> the driver, so it's best to determine them at the driver load time. Adjusting them after the
> driver has been probed could introduce complex issues (e.g., the DMA buffers may already be
> in use for communication when the parameters are changed. While devlink appears to support
> parameter configuration via driver reload and runtime adjustment, both of these occur after
> the driver has been probed, which doesn't seem very friendly to the overall logic.

no.

