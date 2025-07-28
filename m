Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38683C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 15:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKNSJTIOjXhOfJ46ixoQVwptbOq/eeiDwCfKsKuboXU=; b=mAWBn8Wqc0Itnp/+Yju4jmSh1J
	lJKQxe00/h+NjCbTE8eHOaI+oPEBARihJY4NA+9y5F1NDq7UrdrsJuhVN7H9eKcO0vSvzBTWp2ITy
	hygH0lfCIAa9a5jvbFUsRTDmk3Xzo9gT6na40aCZu8N86MnnA3yGIgI0jnw1mk2lOpV/ug7lmjfH0
	Z1Ifqj+n9LrexbWPQ1895Qu8/mcm+5h+xWOTa73CFfyZn8Rqo/YwmHWcpBLIeDNemfusYv1klxsVF
	Zou/V0dxC/YB76WraD8317qDzbFCg6wOIsCYDJbjcKcisZRixBCunAO9uFKJTu3XE0qFrR9VLW/uV
	pqkhP7sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugPop-0000000Ep4G-2PJn;
	Mon, 28 Jul 2025 15:31:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugPmL-0000000EoXm-3qWC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 15:28:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2508245BB1;
	Mon, 28 Jul 2025 15:28:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 477F7C4CEE7;
	Mon, 28 Jul 2025 15:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753716521;
	bh=nCCab6w8oj750hCuDA8aX5D8FTeBEr0NdwDFh06N7Cs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=T3ITj4GQGjkd+wYCvSJ0HMtHWPi1m06RcLiuvbw7nXi/pQuAhQ28BT3Ec7gjoKnp8
	 dGJMxBtb4udF9q5Rb+uIGQ1bcb/GW1qh6BjRAk28QxnT7F/eelweZuaNfvQ1JI4ugu
	 pGzGcdtLTJXW9h2qBWBx4QcTRqg/sQvQ536eGS7J4RA8Ox4fqQADMloDk5UEBhraC3
	 xfBUAqVi4MiJzdLP0v/8/YVyv0p3BC6llc6VXGfHkkUI+x3JA3Y+oinG65E+dcPizm
	 GiPKAtAMlHmhIPXu0kWnkwko59pkw/Hwzb0nivYlhSNAG99BJ5p6sS/OnsB9Rkh/qv
	 o3yXNtCG9VQOA==
Date: Mon, 28 Jul 2025 08:28:39 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lukasz Majewski <lukma@denx.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Stefan Wahren
 <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>, Lukasz Majewski
 <lukasz.majewski@mailbox.org>
Subject: Re: [net-next v17 00/12] net: mtip: Add support for MTIP imx287 L2
 switch driver
Message-ID: <20250728082839.2ed8a067@kernel.org>
In-Reply-To: <20250727100128.1411514-1-lukma@denx.de>
References: <20250727100128.1411514-1-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_082841_978110_BE4CCABE 
X-CRM114-Status: GOOD (  10.01  )
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

On Sun, 27 Jul 2025 12:01:16 +0200 Lukasz Majewski wrote:
> This patch series adds support for More Than IP's L2 switch driver embedded
> in some NXP's SoCs. This one has been tested on imx287, but is also available
> in the vf610.

## Form letter - net-next-closed

We have already submitted our pull request with net-next material for v6.17,
and therefore net-next is closed for new drivers, features, code refactoring
and optimizations. We are currently accepting bug fixes only.

Please repost when net-next reopens after Aug 11th.

RFC patches sent for review only are obviously welcome at any time.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer
pv-bot: closed

