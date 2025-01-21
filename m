Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354F8C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 16:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z4obhy05T3Ag3JlWrJ+ed+uiE0KTWe6SS0n5vaejRXY=; b=Jfrqyi8KB1XqqNU2Dym/TvucAb
	5GVoEX2RsY1DfFoZ51bHWQUzS/Jz6KMa3nXf2lL7htC9s3ScKONfXOM4jtFg4K0HxolJQRi++R/o/
	rYraVv8xIVSKmlf/yu+nnmaRzUgEwuvYMVvwG/Fh51SLgFV7PCLN098Ex8q+VVLFeA/oXQqZYL7zG
	3XNAGpNpq1ZZOUrOPCgLbZrl1qm4HMH6Rp8wh3VShWkfN9/j0RAPeN5KeJiTIuDPBGx/hKibxCgFH
	yPBPnQj9s4Woxup6nIPPjw9bzc5wM45wgqE1zhxag5n8D4dB/6oyRVjGGDQwgZDRhPza0owoKQ6S3
	i214ZQ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taHJj-00000008Nj9-3zb9;
	Tue, 21 Jan 2025 16:41:31 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taHIR-00000008NZM-1r67;
	Tue, 21 Jan 2025 16:40:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D901DA41D15;
	Tue, 21 Jan 2025 16:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ADF6C4CEDF;
	Tue, 21 Jan 2025 16:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737477610;
	bh=n6OwF0LtgoRb+4gCwo/Yxj34ecr+BW/s6uOoxV5vMmk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lkRQIKUcsP/6LY0rJsBfga/cvSR/cWw2GTYHCjdGg0zq/BalM1ysCPu075pG3n6x5
	 TgAkE48TCOsHMA7Y2/qb17dvIQt6Nzyt6HZ5YVNXMjCuan19GD834jqe6MaSKJ1L8u
	 1QWbhtFbZs6QXqXFIP0KtlN02T58zf8miQAh2qB09CRskS2u6Axm4Ps9S8c/y34gCo
	 L8QphVXUj3NdyZIKJNmfIkrjbqIXCTPYJD6fKiOrhO/SjiEo/aoYCGU7X10E30qPOz
	 /Tq15OBEqSU4dHnsa5R9Xc7aX14SzyFL3717IlVkR8u8eQCqSWpnOhW3wxTDjPLXfJ
	 On9WG2dgHLLmQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71064380AA75;
	Tue, 21 Jan 2025 16:40:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] Bluetooth: btusb: mediatek: Add locks for
 usb_driver_claim_interface()
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <173747763400.49514.16130463515349826883.git-patchwork-notify@kernel.org>
Date: Tue, 21 Jan 2025 16:40:34 +0000
References: <20250115193636.1.If8b655b5c6877bd9a1136ba0f1cd61cc6a4b6e9c@changeid>
In-Reply-To: <20250115193636.1.If8b655b5c6877bd9a1136ba0f1cd61cc6a4b6e9c@changeid>
To: Doug Anderson <dianders@chromium.org>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com,
 angelogioacchino.delregno@collabora.com, chris.lu@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_084011_551176_8F1571D3 
X-CRM114-Status: GOOD (  10.14  )
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

On Wed, 15 Jan 2025 19:36:36 -0800 you wrote:
> The documentation for usb_driver_claim_interface() says that "the
> device lock" is needed when the function is called from places other
> than probe(). This appears to be the lock for the USB interface
> device. The Mediatek btusb code gets called via this path:
> 
>   Workqueue: hci0 hci_power_on [bluetooth]
>   Call trace:
>    usb_driver_claim_interface
>    btusb_mtk_claim_iso_intf
>    btusb_mtk_setup
>    hci_dev_open_sync
>    hci_power_on
>    process_scheduled_works
>    worker_thread
>    kthread
> 
> [...]

Here is the summary with links:
  - [1/2] Bluetooth: btusb: mediatek: Add locks for usb_driver_claim_interface()
    https://git.kernel.org/bluetooth/bluetooth-next/c/ec5570088c6a
  - [2/2] Bluetooth: btusb: mediatek: Add err code to btusb claim iso printout
    https://git.kernel.org/bluetooth/bluetooth-next/c/6ca1c15fcb92

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



