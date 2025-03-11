Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014DAC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 10:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GEtJKl9VyqMPNvlpOeZ2Ay7yfQWSRY1oMqlXmzANYkw=; b=ZcTBBGPh1Lq+HKBagpYYBnBzsK
	/ZaUKkyg+c6DH8Y3Z3Ujoyv1CZQvtUrFDF8HwSikAEHDj2Sbs+64N+LjX5bAjeAKoGB+6QMXfClDg
	j0lrClX/eXiZWpjryeLuO/hUcDDwsIBz1CMiQxWnJbg5oDlfxwVLqSmojRMBtknl2aCNlKofxzRSk
	q8Lezw6vsv9/+Id9doTaWXN4Y7OKdQ6BI3CJ9mPByqMqqPQa0oNxOFvLjQo2ZB17wokSAG3Rw0DSb
	xj0ppEpTu44jc288uZw1HrAniwSKTzTl+Arq7KXf8hxQbH1eyi0tMuzQ7lbbXAbG23d5a+RvQnidK
	uFWoYBDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trwqQ-00000005Ks2-43sr;
	Tue, 11 Mar 2025 10:28:18 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trwiN-00000005JMe-1MqW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 10:20:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 25F9AA45F1D;
	Tue, 11 Mar 2025 10:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D545BC4CEE9;
	Tue, 11 Mar 2025 10:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741688397;
	bh=EvjQeYuInX+TO7B6vyrVptF7MFFu939ztQrKf5QJrgI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Vi1bseSQ8G2EGOlZ95y5kbaHq8dDidxBzU6HSdIw6TIGfuGjgjdj5Ft/CAG/RNjrZ
	 Yi/MqGhoLViq5yUZsOgGeS6rr7rYi+CN/wir9S0YN4w8O+E1Ro5EWJnKQ5s04Uh3XL
	 OL1zr3ck5axg8Te1gtgznCM0jelyecZxHt3G/ts05CQ0xN1xX3wf43nFZKIkQHHO0w
	 CTZiINgRJcETuGWa3odxwJu7X51iKkGlmdlDtlqyaFcigzNcH/0Xv5JkGTnsqvIoXC
	 fawHrgCaCMpD8QdHbjA/A9XwMQ/13ecySsyEsWh3RHGXcvk3fZCvGWwe3uOrIcC4vf
	 qOwXjt7R3aigQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3423E380AC1C;
	Tue, 11 Mar 2025 10:20:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v4 0/3] net: ti: icssg-prueth: Add native mode XDP
 support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174168843201.3885087.2899206416205542663.git-patchwork-notify@kernel.org>
Date: Tue, 11 Mar 2025 10:20:32 +0000
References: <20250305101422.1908370-1-m-malladi@ti.com>
In-Reply-To: <20250305101422.1908370-1-m-malladi@ti.com>
To: Meghana Malladi <m-malladi@ti.com>
Cc: rogerq@kernel.org, danishanwar@ti.com, pabeni@redhat.com, kuba@kernel.org,
 edumazet@google.com, davem@davemloft.net, andrew+netdev@lunn.ch,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 matthias.schiffer@ew.tq-group.com, krzysztof.kozlowski@linaro.org,
 dan.carpenter@linaro.org, diogo.ivo@siemens.com, s.hauer@pengutronix.de,
 glaroque@baylibre.com, schnelle@linux.ibm.com, arnd@kernel.org,
 john.fastabend@gmail.com, hawk@kernel.org, daniel@iogearbox.net,
 ast@kernel.org, srk@ti.com, vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_031959_446239_8F1F5DD4 
X-CRM114-Status: UNSURE (   9.15  )
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

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 5 Mar 2025 15:44:19 +0530 you wrote:
> This series adds native XDP support using page_pool.
> XDP zero copy support is not included in this patch series.
> 
> Patch 1/3: Replaces skb with page pool for Rx buffer allocation
> Patch 2/3: Adds prueth_swdata struct for SWDATA for all swdata cases
> Patch 3/3: Introduces native mode XDP support
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/3] net: ti: icssg-prueth: Use page_pool API for RX buffer allocation
    https://git.kernel.org/netdev/net-next/c/46eeb90f03e0
  - [net-next,v4,2/3] net: ti: icssg-prueth: introduce and use prueth_swdata struct for SWDATA
    https://git.kernel.org/netdev/net-next/c/73f7f1311866
  - [net-next,v4,3/3] net: ti: icssg-prueth: Add XDP support
    https://git.kernel.org/netdev/net-next/c/62aa3246f462

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



