Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B2AC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 18:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=acVeajVPpbOKx+F6TxzxTIvRHMMxgH4r37Y4NTRmcnA=; b=XfQBcZlGT3w/5vAywcsmNIZM/b
	IEc3wBSST+i0VB6Qm7KPxqjO7hND9UxlYFAfef/Fe5qIotzdnz79e9xWJTgr1NXe3e7veYpZ6NEfu
	XyL0eGhMdm0suh64CSEZSazr7dMluhiqjvqtiQx0ACTGiiFkeaTJOou9Rv1wow72MrmlDJwSPzrjT
	SMxnXDWI58vLxFdwjsim63rzVT7ei8185uFK1N4TnojhfIDWLTtwGJu/EqWe2OAhyijWGlaBy733w
	kmfkx1s4aej0Ku1zDd5NZWF3qj6QEevDMaNHILpQwDNkoT/YcRmd6/K8RQC9ok2vhsGiWQeR/Nrsz
	kbZD3PmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2wCJ-0000000BTFZ-0V5y;
	Thu, 10 Apr 2025 18:00:19 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2vPZ-0000000BKKX-3uML;
	Thu, 10 Apr 2025 17:09:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2CE96A45979;
	Thu, 10 Apr 2025 17:04:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 684B2C4CEDD;
	Thu, 10 Apr 2025 17:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744304996;
	bh=9+nMyQCYKZANlH9EIcmhK3mecsDX2e4WtxOXzOv8sLs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GZk5/AmHhSZx4qZ4cR5oBlNTY9g4v0b8aTUWBIA0AZzQ1+oaM+tdnR8eovR8HdQuI
	 b1zaAMTxbRj4czDqNxDqBsV2o5IjltxQH1nNwXO+OkfJvXsbJJg9XwqoTECGj/xU37
	 jAYgC2KP6a7hMMaK5uv0Z6ktUysHCDMS67kDU+ubSxcKd0XuN+nIhsbrtEdz3ErvUF
	 5z0h2IsKZDUpNQGaj1O8urc+Ke6wBkvgSfiNJkopdi7eQPsj8b6dRU9hC/uHgI6n1P
	 5FA+J7yOCErQzdUeCmZmakf816lygwX/fXWKPY5KElbNYWfIiIExAAYjCmC0ak79Sb
	 uOfY3WhZ433kQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34595380CEF4;
	Thu, 10 Apr 2025 17:10:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] Bluetooth: btmrvl_sdio: Fix wakeup source leaks on device
 unbind
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <174430503404.3757803.3784966096528810575.git-patchwork-notify@kernel.org>
Date: Thu, 10 Apr 2025 17:10:34 +0000
References: <20250406201017.47727-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250406201017.47727-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_100958_038189_FA67A06D 
X-CRM114-Status: UNSURE (   9.95  )
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

This series was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Sun,  6 Apr 2025 22:10:16 +0200 you wrote:
> Device can be unbound or probe can fail, so driver must also release
> memory for the wakeup source.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/bluetooth/btmrvl_sdio.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Here is the summary with links:
  - [1/2] Bluetooth: btmrvl_sdio: Fix wakeup source leaks on device unbind
    https://git.kernel.org/bluetooth/bluetooth-next/c/e760c4024eae
  - [2/2] Bluetooth: btmtksdio: Fix wakeup source leaks on device unbind
    https://git.kernel.org/bluetooth/bluetooth-next/c/0be454533788

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



