Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96089F5A8BC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 22:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MPUsGn+A9wV29RNrDVAH9UBPDZ31Nb+taOeAawd6efQ=; b=Czqs5fUZLqCvE8El+nkhcxYfYw
	QPSHCpklZZthWaro07aoaLp7dCzlI95gbwJEOqrc959hZOxib5AmgQtmahNjfz3b4dNtZLj+AnI2Y
	iVO2lRw3Ga4CK89P4YrlPFyw98pIxqX1KgSY8e/UWYTMxpf7ILrCsvFSxeXz0nvbnEDljxm6l7Vdz
	1zcezMSLTAkuSMbDA7q4xVvnTBnSHPwEoa5KZbBFQeuuZsblfo9C1EO8SBxvxo6XcVLH/oA3HreSy
	D7t4Ga4sZTp/S/mun3F9wmj3O/PiyVs1EjC8at4OHUAs+BAuKje3yBhz4Zrd3gXrzh2gVyOz61bhR
	TSi+Xe9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEwfI-00000007lZH-3u6t;
	Mon, 20 Apr 2026 22:00:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEwfG-00000007lYl-3nuc;
	Mon, 20 Apr 2026 22:00:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 56F79445B1;
	Mon, 20 Apr 2026 22:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32AE3C2BCB4;
	Mon, 20 Apr 2026 22:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776722420;
	bh=2OTjQoOKAo/XYCCFu/T9EswGB1BwfWLV14g6stBgW4s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KHRWocUGI7WEASlXrPO/GeJvaQWQYxIhEUdTdoxcJTIcaDqUa412+UeBhPDFunuy4
	 LdIzd9s+IiVf8Rm9yHAWH+OniTYNjNYxtEXaRLSTDOFfdv1FZ2An7uaGt4Ih9ZsH0C
	 46eHeaboPrmwImHGjgpA6xtxOsxZvs/oM7A81AY+ZUz6NOha4E6wUGT+hWkjeDhscD
	 ImVjH+NT3IrjHb5rTXrrzPulqwnamMJSGwS+Y26ckwZjC5xhPAkL4d9/q9+pqabaXG
	 YFpQGc09gqh0nlXBmUx+ww9Fsjoq7X6bASLyhLv52u2XE5Iq44TPNUHmDqQz9hsVbj
	 NZysCvwaskADw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BB62E3930022;
	Mon, 20 Apr 2026 21:59:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: airoha: Fix possible TX queue stall in
 airoha_qdma_tx_napi_poll()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177672238429.1802062.15152793515416215321.git-patchwork-notify@kernel.org>
Date: Mon, 20 Apr 2026 21:59:44 +0000
References: <20260416-airoha-txq-potential-stall-v2-1-42c732074540@kernel.org>
In-Reply-To: <20260416-airoha-txq-potential-stall-v2-1-42c732074540@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_150022_966826_C41F0014 
X-CRM114-Status: UNSURE (   8.39  )
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 16 Apr 2026 12:30:12 +0200 you wrote:
> Since multiple net_device TX queues can share the same hw QDMA TX queue,
> there is no guarantee we have inflight packets queued in hw belonging to a
> net_device TX queue stopped in the xmit path because hw QDMA TX queue
> can be full. In this corner case the net_device TX queue will never be
> re-activated. In order to avoid any potential net_device TX queue stall,
> we need to wake all the net_device TX queues feeding the same hw QDMA TX
> queue in airoha_qdma_tx_napi_poll routine.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: airoha: Fix possible TX queue stall in airoha_qdma_tx_napi_poll()
    https://git.kernel.org/netdev/net/c/b94769eb2f30

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



