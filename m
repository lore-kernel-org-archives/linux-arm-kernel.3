Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B89D65C70
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 11:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tL0N5qNqzk9qCI8C/1LafnSstp1Wxthn0MeoWOBVEIE=; b=kGwS1E5JZj1aLi6ks62SX7QfcN
	z1D72UynO+q0WbRCQmB+i4MjGOHHuMrSEsuu0Ro6ptJbn6IAuVlwk57iDZubxICHVWIxrVXV2+GtE
	ce9zioz/Tp4LYeu0pPjTGxh/37t2SzOC+Ei35XCzYxSHkakUlv0Y9zzPbI7m32jKq7Zn3Gipb0gG6
	xfuC8cXeiAid/CXT4R+aClFV/ym9mvi1iZLqeHyj2OASSNbDGzaYnmkOPBiX7nYDWXWyofA/dw0Fo
	Ab7At7moBkHkJF6azEyXfGk/KcOtkXBZ/BV7Y2bImBkA2ZgrTQkcD3Nl7UDFzLX2grdYLLWcuxdhe
	elAb+VhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBXdi-00000009eSV-2Hep;
	Thu, 14 Nov 2024 11:03:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBWnr-00000009Tmm-0ab4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 10:10:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 09C185C5AE5;
	Thu, 14 Nov 2024 10:09:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFFC3C4CECD;
	Thu, 14 Nov 2024 10:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731579018;
	bh=zIXoVPuLxS46P+2i3Z4nmPDd0XPDfcNwgdZycvncv+w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CHRbrM4tcguZd7l9uc7J+VttnK1I2vUOgOSwFNF7UCmjXoTOe/7CyDW0H7jFHGHDG
	 saGQ7gTZU3zDTlbumMOmQ7Z6mMZdnFN6y763tekJ9zeSRt0dZOEFV79pKwAatLLO+F
	 /4lipHoacF3cjwrTDqcoH/yhC8WfEZcWbY3hFb85v+8a5kroRlJeCJVbu8tqpZNSKh
	 PUCPoaxztlV0h86DbTcvLneQuS44bF4hZMdyfVRHMqAUf/WvWZqi7wzvE3hE/xUDE2
	 ZXgG95CC2JDgX5TBSB6f29t8C9UkYjnHnuaLeUYJuVq0Xk/Z+pGBFSKuEEzxRUU0/g
	 VF/fsw00+lVCw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADDEC3809A80;
	Thu, 14 Nov 2024 10:10:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v5] net: ti: icssg-prueth: Fix 1 PPS sync
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173157902851.1866232.9016016024902028479.git-patchwork-notify@kernel.org>
Date: Thu, 14 Nov 2024 10:10:28 +0000
References: <20241111095842.478833-1-m-malladi@ti.com>
In-Reply-To: <20241111095842.478833-1-m-malladi@ti.com>
To: Meghana Malladi <m-malladi@ti.com>
Cc: vigneshr@ti.com, horms@kernel.org, jan.kiszka@siemens.com,
 diogo.ivo@siemens.com, pabeni@redhat.com, kuba@kernel.org,
 edumazet@google.com, davem@davemloft.net, andrew+netdev@lunn.ch,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com, rogerq@kernel.org,
 danishanwar@ti.com, vadim.fedorenko@linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_021019_413567_377CE2FD 
X-CRM114-Status: UNSURE (   9.30  )
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
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 11 Nov 2024 15:28:42 +0530 you wrote:
> The first PPS latch time needs to be calculated by the driver
> (in rounded off seconds) and configured as the start time
> offset for the cycle. After synchronizing two PTP clocks
> running as master/slave, missing this would cause master
> and slave to start immediately with some milliseconds
> drift which causes the PPS signal to never synchronize with
> the PTP master.
> 
> [...]

Here is the summary with links:
  - [net,v5] net: ti: icssg-prueth: Fix 1 PPS sync
    https://git.kernel.org/netdev/net/c/dc065076ee77

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



