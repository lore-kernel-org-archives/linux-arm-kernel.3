Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA7EC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 02:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BYRufKjNFNWb4Gi95jC3kNsQIwacKvb60hA6ES6Plag=; b=UGbfNdV/JLkmdO6scst9d5a1uN
	ithENdaRmKE9AAhZr65UEKqqJ4Kih1WsFVLSIyGD7QR7o3J+cpfJhAWuqxYQic6lEz7FbSL/FNX+e
	8nwc153nGVeFamJmvRtOk2VcJomki5Gqq6eJKcX1dv/T7QMXXRX89WV4qyRB6DaO41UOESz/fADa6
	Wg5ymIhKWvRf0CCC5tGZQOuaSV+Gx0artlwEPST6W9riEkb0RrRCBKkEYhzT9+KyjandbRlR8QRJ5
	0vqTNI/fimI6mYOBIxsk9fcUfLzJgrx44srOGXPpgSz2eZkp+QU/7wQlsvTZz0OG8oKboxfSabq4N
	WJk5d0yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucadW-0000000BWqk-2u1v;
	Fri, 18 Jul 2025 02:15:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucaOK-0000000BUv3-1oP0;
	Fri, 18 Jul 2025 02:00:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A6BA2A57AC7;
	Fri, 18 Jul 2025 02:00:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5518CC4CEF4;
	Fri, 18 Jul 2025 02:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752804003;
	bh=+7wiZuzj0yMoHnu/9si51sXowCgUOaXc6z20kcCoavo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=othhL9zlqDZKNANGMD5wqYAxXWHOnO+EJXicl0LkPogteFiw3lnKHL1nM0dtw2Ag/
	 lzlvhFccU29AmSF7UpKMkW0x5BT1VofXb6kluoKea7xsZgBiVQc1oHyIDtNt3X+Kfd
	 P5eiIMaGjRg53w2x38Z3B5SuIgQSV4ZEJYTKlryPnkIj3UnDn/4Sio0PMnLfcyNKFL
	 joMRXq283+Ry97zN3CXiYK+7glguO2LVZ4GMf+mM0a694PGBGe/FGadtE2XYQmtQIz
	 f3mDyoWidkWAi4oEgr/qB+BDxOYpmVW8eJfoeUEvFpxgPUn4tgfDFAyLAgI+jwbHt/
	 t9Vo2GXXSZsnw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70BA2383BA3C;
	Fri, 18 Jul 2025 02:00:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: airoha: Fix a NULL vs IS_ERR() bug in
 airoha_npu_run_firmware()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175280402326.2141855.15347450324403463630.git-patchwork-notify@kernel.org>
Date: Fri, 18 Jul 2025 02:00:23 +0000
References: <fc6d194e-6bf5-49ca-bc77-3fdfda62c434@sabinyo.mountain>
In-Reply-To: <fc6d194e-6bf5-49ca-bc77-3fdfda62c434@sabinyo.mountain>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: robh@kernel.org, lorenzo@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_190004_536119_B9EB6500 
X-CRM114-Status: GOOD (  10.56  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 15 Jul 2025 18:01:10 -0500 you wrote:
> The devm_ioremap_resource() function returns error pointers.  It never
> returns NULL.  Update the check to match.
> 
> Fixes: e27dba1951ce ("net: Use of_reserved_mem_region_to_resource{_byname}() for "memory-region"")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/net/ethernet/airoha/airoha_npu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Here is the summary with links:
  - [net-next] net: airoha: Fix a NULL vs IS_ERR() bug in airoha_npu_run_firmware()
    https://git.kernel.org/netdev/net-next/c/1e5e40f2558c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



