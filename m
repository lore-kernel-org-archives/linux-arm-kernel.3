Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A114DCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 21:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Msa9zF4IGWbNRdoN0XK6Mv5pB89boStL6ejdnQH2M24=; b=Im8osnlTGmp3dnzckVQgkCTjsj
	PUdvrRC5kO4gs5LCODt1CNJV1NMLF9d+Pcs6kyI3X/bCyvay6KDLxlw6F0trWpAdiLjZRkc3Jygn5
	FLqgtfD38ZGjklph6QUf7Q0Zb4K+NsXYpUOefmzPDxpCZ11kxzmzGLIiQE/PmXH+FrWkac0OC0kuY
	p50NXNr6RgJPdy2KszLOTU2v3+/Gzvb799Ibf5qQ/ldIITQZIsmY5e7HwvG8WAY2x1qn4ZXyDRYDp
	4CsxTFYcTwg7yvPP4AHrjNpgAwHCW7lq2a4wHeFS+4h/nw4lOapVuDQ+BFEPt8VdVkqbwnSvJXpLl
	dNBEvWoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDrH3-0000000Gh4Q-48q4;
	Tue, 28 Oct 2025 21:30:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDrH1-0000000Gh3x-1Z3G;
	Tue, 28 Oct 2025 21:30:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 38F3348A12;
	Tue, 28 Oct 2025 21:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19EFDC4CEE7;
	Tue, 28 Oct 2025 21:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761687034;
	bh=Ku/Su4ncA9CKxNrONFRarIqSdcTR8sJpCxyqJ2/2kss=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cSz+pAm0CZ9pQaiIBJdT1fB8FSnFHYhFrAk9cw8dwRz8pZYDND0b1HZ0OhM+8Drmi
	 T2TGxk+I/GX5lLmc6Pr4MCWXK3zmJC5OhAZPbVRSF9rKDiMwA8AhnnqEPMdOejRvJ0
	 vhIqwIACU6O4X+leBpVPDp8rfIXBYDJN+Qail1AEczIvQOxudGFCX5e5OyBEK5Ryln
	 5RCt1GiEP2jlMF1w9KunPfKwpHvP18YgC6lIXMNiI6u7vUYosWDx61qD9lBr0PVZcH
	 JyUSpfKaXPywu93kGCz37DI/W+svBWGH7OLMan2igKRnrUPm6F5VMcghvOa0UcXOp1
	 v4gg3Mji3TQ5Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE5B39EFBBB;
	Tue, 28 Oct 2025 21:30:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/1] Bluetooth: Remove redundant
 pm_runtime_mark_last_busy()
 calls
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <176168701149.2391991.18445661058856546176.git-patchwork-notify@kernel.org>
Date: Tue, 28 Oct 2025 21:30:11 +0000
References: <20251027133538.393138-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20251027133538.393138-1-sakari.ailus@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-bluetooth@vger.kernel.org, marcel@holtmann.org,
 luiz.dentz@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_143035_458358_6959EEDF 
X-CRM114-Status: UNSURE (   8.12  )
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

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Mon, 27 Oct 2025 15:35:38 +0200 you wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> [...]

Here is the summary with links:
  - [1/1] Bluetooth: Remove redundant pm_runtime_mark_last_busy() calls
    https://git.kernel.org/bluetooth/bluetooth-next/c/c5c38a0b814c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



