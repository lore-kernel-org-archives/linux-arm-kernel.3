Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2738DC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 20:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jJSsAqNBcxyOlNcZ4emtygxRWd3+DT3fYL+n/wjGjcM=; b=Gg1x9JH3MuhYSJHG2VnoZX3X9c
	xCJ8RnYH+XDVxEUjx4r9tsTkvKuboASni7VFjq0mzFFrK/beVEmQ9gEb3drYbjjG+n0N6nnCc+tuM
	hedaZkXCVywlpzxMVxcv9y2fU5cqnA3RTRrNaDK3KG+gyT1pKU2iQR6vXz7ZJw2haVoRIhk5lBcJe
	PB7rdAgTfoMVyAEGfCDERSCk/fkmuUSyGyV01Qo6qNtiP73EISJlQcjwxF71Q6aoKEvnRXYejDjk2
	s7SehEQEBMaMcVVkaw9RMhUa8udrIKfwFWUrtyEdmdxKIzpbiiG6aNXVC7c3TwPF6wwuCZv8NoA1G
	vZFCFtlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtsoO-0000000Etgr-1S5t;
	Tue, 11 Aug 2026 20:11:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtsoM-0000000Etgd-3c2A;
	Tue, 11 Aug 2026 20:10:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EB35F600DA;
	Tue, 11 Aug 2026 20:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A284A1F00A3A;
	Tue, 11 Aug 2026 20:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786479057;
	bh=jJSsAqNBcxyOlNcZ4emtygxRWd3+DT3fYL+n/wjGjcM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=LLOb3V1r1rXCxnOGoRV986HL3/my77x/HnGkMy0wS/Q0n/ZFybyOWKWzg16GuVM4c
	 sGw128lMkVekVVGxl+uWVNBb6qtxAjGj4Xb9elVm+JamyGLnPWpgSQ7FeMN8WzsNgZ
	 mUeAIVkL+jI7e8L0Bwj15nT4yFQaSfZCGgKTJfCepy9hgyPSdoUOeZvtq8YzLHfWAw
	 g7auAugGnMiVsdQxOmUaV2buGbbIbMb2ahWaZfrOS4hRcz4WCB4nLmKtTV9YJj8MMz
	 im4b6CdLAe7OzSq8lHvlu0Km6jGbgMWZrJK602pUvdE6EwVElavcImeEN0hWu5e7ix
	 +Y3l9nUNnvKSA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A9B3809A0A;
	Tue, 11 Aug 2026 20:10:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] Bluetooth: btmtksdio: fix deadlock in close and reset
 paths
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <178647901335.1134064.2663051483826196708.git-patchwork-notify@kernel.org>
Date: Tue, 11 Aug 2026 20:10:13 +0000
References: <81B94E6D2ACC0BFD+20260810-btmtksdio-deadlock-fix-v2-1-0eb31f9066d6@uniontech.com>
In-Reply-To: <81B94E6D2ACC0BFD+20260810-btmtksdio-deadlock-fix-v2-1-0eb31f9066d6@uniontech.com>
To: ZhaoJinming <zhaojinming@uniontech.com>
Cc: luiz.dentz@gmail.com, linux-bluetooth@vger.kernel.org,
 marcel@holtmann.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
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

On Mon, 10 Aug 2026 18:22:38 +0800 you wrote:
> btmtksdio_close() and btmtksdio_reset() call cancel_work_sync() on
> bdev->txrx_work while holding the sdio host lock, which is also acquired
> by btmtksdio_txrx_work().  If txrx_work is queued when close/reset runs,
> a worker thread may start it after the host lock is taken and block in
> sdio_claim_host(), while cancel_work_sync() waits for the work to
> finish.  The host lock is only released after cancel_work_sync()
> returns, so both sides wait forever, deadlocking close/reset.
> 
> [...]

Here is the summary with links:
  - [v2] Bluetooth: btmtksdio: fix deadlock in close and reset paths
    https://git.kernel.org/bluetooth/bluetooth-next/c/fca8fe614904

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



