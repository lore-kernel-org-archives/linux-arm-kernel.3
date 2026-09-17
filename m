Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA25BC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d2rqoANqapE2XLn2dSVmJasoPdWmDd7pHjTlHIBVe84=; b=WOxbC6GuAd3YzyVgdguUSbevxR
	2JE47lSijSlGbJqies8ShH1AIcGaapbZGIfwphfnZkK63w8PAsCXulc3EqSQSOvd96H8mRCzJ9ku9
	bvY1ijS9EbKYXAB1JYHkf5VpvSGrkqZq39O/kyoWs6Qo6Fubry6NXGK6kfE8HJBljy5eu8V6Q8smP
	SGywGMjpIlV6Ee4YZTTHQ0h/Sl5922i3lgnASl+G1Jxubyxj8fVAZYrN4ManZ4rBF8+G065FntM4H
	Gr+BGgZ07k4GWxp57ondGHjP+M0ADXo7w6cfzsYSojflZuz4fTfdn31JmQ1SyWwM4BXiu08AorC3n
	3nB8e0Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EFo-0000000BjT7-0gyQ;
	Thu, 17 Sep 2026 15:42:28 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EFl-0000000BjRQ-1qiI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 15:42:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 77C981A0936;
	Thu, 17 Sep 2026 15:42:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3D55B5FAA3;
	Thu, 17 Sep 2026 15:42:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9F31B11C7B08E;
	Thu, 17 Sep 2026 17:42:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789659741; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=d2rqoANqapE2XLn2dSVmJasoPdWmDd7pHjTlHIBVe84=;
	b=qPyeDytc6bpI47/fo2F8590mMjNdIVvnDgNp/VK4Fun4Y3og5etZTf9HZSnkI4+3OzQ6ui
	jXA5j99C2SpiNChuy0wB6OnT4BxlkK7QQIR7s2ruzKCH8PJoqknJd4iMxSTzqSJdLk6v6O
	VNIiUKQCUgol/O0uD8gShdUWovfZ2e968YGZAHdfv8cjpfrpucZ5pq3iftlkGv/UAoXt5r
	bHLNUdt1TX1ITell1ijyNgZf3H9KcXb4cVsRgppayH3PaCSjnCyjx3seeudIuAfQfS5cRX
	H6jB//8zMVCx8Hd4eEVW2lHB+VCKeakjp3nWhkRaOb88otGc7XjhwS5c6i813A==
Message-ID: <067b8ae8-7de4-47cb-bf49-ec6fde1f34d6@bootlin.com>
Date: Thu, 17 Sep 2026 17:42:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v7 1/2] net: stmmac: selftests: Prevent RXC from being
 disabled in LPI
To: netdev-bot+sashiko@kernel.org, peilinhe2020@163.com
Cc: netdev@vger.kernel.org, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 he.peilin@zte.com.cn, jiang.kun2@zte.com.cn, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 pabeni@redhat.com, vbridgers2013@gmail.com, xu.xin16@zte.com.cn
References: <20260914150612.9798-2-peilinhe2020@163.com>
 <178965769776.22033.13374439300724313005@kernel.org>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <178965769776.22033.13374439300724313005@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_084225_615113_52C2A80A 
X-CRM114-Status: GOOD (  14.36  )
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

Hi

On 9/17/26 17:08, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> - [Medium] The last paragraph of the commit message describes the
>   `eee_rx_clk_stop_enable` precondition backwards.
> 
> --
> 
> net: stmmac: selftests: Prevent RXC from being disabled in LPI
> 
> The patch wraps the selftest loop in stmmac_selftest_run() with
> phylink_rx_clk_stop_block() / phylink_rx_clk_stop_unblock() so the PHY
> does not stop the receive clock while the MAC is in loopback. The code
> change itself looks balanced and is a no-op when the phylink config does
> not allow RX clock stop.
> 
> The question below is only about the changelog, so the diff hunk is not
> quoted.
> 
>>     As the NETIF_F_VLAN_FEATURES may be empty on some platforms once the
>>     software vlan stripping is removed, the phylink config attribute
>>     'eee_rx_clk_stop_enable' may no longer be inconditionnally set to
>>     true, hence allowing RXC to be disabled during LPI on platforms
>>     that don't have any VLAN features.
> 
> [Severity: Medium]
> Is the true/false direction here inverted?

Yeah should say "eee_rx_clk_stop_enable' may no longer be unconditionnally
set to false", my bad...

Code is correct though.
> 
> Related to that, should the changelog also mention that
> CONFIG_VLAN_8021Q=n builds are already affected today? 
I'm fine with it.

Peilin He, are you ok with changing the commit log if you send another
iteration ?

Thanks for you work and for including this patch :)

Maxime

