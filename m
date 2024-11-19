Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43770D60CEF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 04:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CTCR6OujVcn8D6O+erxHy9XL6uZejS5mDZXoi52pa1g=; b=RzxzJ4wg2hJXVpRZJe5F1PflPA
	iBkMOOdgwqwMXV4aVMTn/8mftfF2b5Je3AUW5fbQajwyK15MdtQu1l1BAEFTD6F4tvk2n2rRGWeQ5
	kfTYrGSoStsW2qyRWrejjbaVIntieBoriFVEt2Znr+GI6bSDf8b0ulLKCkrN1FpIeavyMug7acSGq
	qJoebqVZegfsF1sEIUKovRwX3+XEBKsqQukhjJmXFdVj3UOkQ3RjFHxH7p3kZe2TVT+gB5mNhcnPb
	gfkjWSLDYnUf2tYpUoDbwteWRMa1MBzYvDTc3tIZc88QcupDjUGZTpgxL5rIaqjUTQ/Nu+m+y7YcO
	ZpOk/BNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDFRY-0000000BKIA-36fo;
	Tue, 19 Nov 2024 04:02:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDFQd-0000000BK5k-1sR9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 04:01:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 88A5F5C51B6;
	Tue, 19 Nov 2024 04:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7FA4C4AF10;
	Tue, 19 Nov 2024 04:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731988830;
	bh=JrpMfsKiDZUzM7MMCPOjRLPifcbKsuTDdbLhPJ/UQv4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CilEPpN08lK6k+DFDXsB/MI1uxKH0CVI2IPgWbB/mvx+lBXHxuzrocohGPlPTsLGl
	 OvRWB1vlcvTq5cF+6kB/NGA2PAXS2TEUf1sVwDeN6Vy92L+n9Ii3K/z5W0vwReRWip
	 upXlXRl9SvzdJIJEVO5n5TwFDpjZ059BGeYEjQ83TBuhO8HiEBfevse91Bb0xAL/4i
	 G8CTQs2+uTPkm05oOshvU1i7wq3wHEW3yFDGqKtx9GToUWnmW4OT29TlNIdu+JKkhm
	 +Y7lUe2AIj+xpc40DLRa7Fw7gqGc+JzD1q4XHVeFhHi8hhLF+sabk7F5QXFw2enIW3
	 dSo5Ap89rDG7A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7167C3809A80;
	Tue, 19 Nov 2024 04:00:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3] stmmac: dwmac-intel-plat: remove redundant
 dwmac->data check in probe
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173198884200.97799.10181079932395577855.git-patchwork-notify@kernel.org>
Date: Tue, 19 Nov 2024 04:00:42 +0000
References: <20241115132632.599188-1-mordan@ispras.ru>
In-Reply-To: <20241115132632.599188-1-mordan@ispras.ru>
To: Vitalii Mordan <mordan@ispras.ru>
Cc: alexandre.torgue@foss.st.com, joabreu@synopsys.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, pchelkin@ispras.ru, khoroshilov@ispras.ru,
 mutilin@ispras.ru, andrew@lunn.ch
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_200127_521721_F8D1C526 
X-CRM114-Status: GOOD (  10.39  )
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

On Fri, 15 Nov 2024 16:26:32 +0300 you wrote:
> The driver’s compatibility with devices is confirmed earlier in
> platform_match(). Since reaching probe means the device is valid,
> the extra check can be removed to simplify the code.
> 
> Signed-off-by: Vitalii Mordan <mordan@ispras.ru>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> 
> [...]

Here is the summary with links:
  - [net-next,v3] stmmac: dwmac-intel-plat: remove redundant dwmac->data check in probe
    https://git.kernel.org/netdev/net-next/c/cc84d89ad8d4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



