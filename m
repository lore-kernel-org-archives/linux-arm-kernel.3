Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FAA1061B21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 10:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fqGzjZ06jh4iwDvkOKTHH1GMiwsJ80exEUcCzzKcD7k=; b=zuGHWxzG3UWuxXPKzzBGWHCa+T
	CMkpDMubibdnaQiYZLKu2zDXORdPrUkgVnfn5WwSTbCJOSyXU1y3kVo5KLmJdArMrA3gIUz2mHUNk
	ZIzkogQfNdgTxR7Me0FM/Wg9l1JEY7I5LqdEFQUgXYl6hZrIiDuDKwN3qpGen2LA+0MK4DhfMO/EB
	J27s6K4HtoOrqx3TW054b4nQ+XgBhc2RG9mo2NlrthsGVwppnCNAgkBPQm31UBr7Bk55NldDtf7SM
	NWfLfJvIMRBT3e5xylVYgibTS0AfCGf23vwECKoL1s8x6gjz9lwb6tG5WwyeZDM1q3INg2XPdF7bM
	DDM+XUIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7WCw-0000000CltM-34Nn;
	Tue, 31 Mar 2026 10:20:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7WCv-0000000CltG-0rGk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 10:20:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A169960121;
	Tue, 31 Mar 2026 10:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51694C19423;
	Tue, 31 Mar 2026 10:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774952424;
	bh=GL+c/lSOQxZG1kVN2DXUiFsjniVUu9ycy0pQ3qX7sEI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mGAL+k2zgnJsHTenMRQL8f+dBUDC4XKO11aDvCacu3izChojkn7G/mMKrzpATZnM9
	 qPi4GnAFXVgVM2QKXOjGvqcgU8jj5v6Qlok7ptwmnQKI1vrtuGmKMm1DkbL5ZFRwtp
	 3VFJFe+kzZdtjQ2msFF/k6porUHDUJqooGAiSLZjEJv7ULw60YQKrttqdulLPvTm7b
	 qiN+7V/6LHv2tiJ39MQQhGDSu+bbOoLov2ZeVG01Y0DLichoSiownkSKsMv16P18qR
	 WEbEtE9CnLXaQjOFbzqs7xY+4ocS4boOOYOjiX2iWyigwDbD2X7orCVcVBEzLUJzpS
	 RwCZkKncbCCDg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FF3A392FF5A;
	Tue, 31 Mar 2026 10:20:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net V2 0/2] Correct BD length masks and BQL accounting for
 multi-BD TX packets
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177495240804.2222159.14302586518463810554.git-patchwork-notify@kernel.org>
Date: Tue, 31 Mar 2026 10:20:08 +0000
References: <20260327073238.134948-1-suraj.gupta2@amd.com>
In-Reply-To: <20260327073238.134948-1-suraj.gupta2@amd.com>
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: radhey.shyam.pandey@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 michal.simek@amd.com, sean.anderson@linux.dev, daniel@iogearbox.net,
 ariane.keller@tik.ee.ethz.ch, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 27 Mar 2026 13:02:36 +0530 you wrote:
> This patch series fixes two issues in the Xilinx AXI Ethernet driver:
>  1. Corrects the BD length masks to match the AXIDMA IP spec.
>  2. Fixes BQL accounting for multi-BD TX packets.
> 
> ---
> Changes in V2:
> - Define BD length masks with GENMASK(25, 0) per PG021.
> - Credit BQL using skb->len on packet completion instead of summing
>   per-BD actual lengths from descriptor status.
> 
> [...]

Here is the summary with links:
  - [net,V2,1/2] net: xilinx: axienet: Correct BD length masks to match AXIDMA IP spec
    https://git.kernel.org/netdev/net/c/393e0b4f178e
  - [net,V2,2/2] net: xilinx: axienet: Fix BQL accounting for multi-BD TX packets
    https://git.kernel.org/netdev/net/c/d1978d03e867

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



