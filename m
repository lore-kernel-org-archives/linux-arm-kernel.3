Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60DDC79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 16:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FynJtHXnHr/s/9tnayXAtyCjmExWB3RfiHJOkbSqKLw=; b=i5V68+TLmWSEbR4O99C7IwdOTi
	gK8Bykn95ahCZmtrVs2XNdz8Hz9YgUDyTQD4Z6tjmgbmu4hwKwbIonGQrLqzAJyi/atWE5DGbd8eQ
	htuC3FekRPqR4xcMvi/1nZEw0Zy6dJyJCbY08FbayJwsm97E6tzzVBYK9VZu6XIxRQUZXSIPhuHVh
	fUh+D8M+j6/VjbqglKM0BcPcWeOTWopacQccEJZ5IjchCkuRcO8YYULrtqAvOQ0TwP++cVZwvJP76
	xB04ej6WKmw4QL/vgv1viHTuJjt2fGS+uZzhjaTmAUxPXUeLv/N6QwKLqKDE1/nQDanSmSqu+us1E
	2q0pKoGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XDz-00000002oOk-11Px;
	Fri, 04 Sep 2026 16:57:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XDx-00000002oNw-0s7a;
	Fri, 04 Sep 2026 16:57:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3901841746;
	Fri,  4 Sep 2026 16:57:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C5C61F00A3D;
	Fri,  4 Sep 2026 16:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788541028;
	bh=FynJtHXnHr/s/9tnayXAtyCjmExWB3RfiHJOkbSqKLw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=NJvz1p64YnzVTzHnT4SA6FwHEt1fsdBX5VZF+FT6kLvtXX8oSyOit5cM1U3NJ14Qp
	 70Lkwl1+bJ9KnxEIX2HCActvPMYRzQRf/1YOs9w6gODpz6xnocu2YnfDqJcx74u6CS
	 8JqnZZgZXrTa0EmLSNpQ6XBhLVxjycwKtXSXeFGJ4ETTQVGHcxDnbW1cabbwaLAQMC
	 ueEv3hp0zBtL2puzxpbegtvVhAS7ejmV2ceRWu0xXadx7oho09xiBtKnyXPcrvk2Ks
	 SJ0wZqOaKwukWJTNGLqUxz4STksMNaJ7AZaYVnQz8d02AA2/GWlfMid/ftB7ZSNnuW
	 14FVGcHAMP6Sg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19BD43924A50;
	Fri,  4 Sep 2026 16:56:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 1/2] Bluetooth: btusb: mediatek: Fix leaked runtime PM
 reference in reset
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <178854096871.344939.9581829532701269317.git-patchwork-notify@kernel.org>
Date: Fri, 04 Sep 2026 16:56:08 +0000
References: <dac8ddf07cb1bb79c70d5a516f0ff7baf41eb462.1788507854.git.liujiajia@kylinos.cn>
In-Reply-To: <dac8ddf07cb1bb79c70d5a516f0ff7baf41eb462.1788507854.git.liujiajia@kylinos.cn>
To: Jiajia Liu <liujiajia@kylinos.cn>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, yinghsu@chromium.org,
 apusaka@chromium.org, abhishekpandit@google.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, jing.cai@mediatek.com,
 sean.wang@mediatek.com, chris.lu@mediatek.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
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

This series was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Fri,  4 Sep 2026 16:03:50 +0800 you wrote:
> MT7925 on HP Pro Mini 260 sometimes timed out during reloading driver
> and reset usb device. btusb_suspend is not called again after closing
> bluetooth interface.
> 
>  usbcore: registered new interface driver btusb
>  Bluetooth: hci0: HW/SW Version: 0x00000000, Build Time: 20260605184935
>  Bluetooth: hci0: Execution of wmt command timed out
>  Bluetooth: hci0: Failed to send wmt patch dwnld (-110)
>  Bluetooth: hci0: Failed to set up firmware (-110)
>  usb 3-10: reset high-speed USB device number 4 using xhci_hcd
>  Bluetooth: hci0: HW/SW Version: 0x00000000, Build Time: 20260605184935
>  Bluetooth: hci0: Device setup in 1856545 usecs
>  Bluetooth: hci0: AOSP extensions version v1.00
>  Bluetooth: hci0: AOSP quality report is supported
>  Bluetooth: MGMT ver 1.23
> 
> [...]

Here is the summary with links:
  - [v5,1/2] Bluetooth: btusb: mediatek: Fix leaked runtime PM reference in reset
    https://git.kernel.org/bluetooth/bluetooth-next/c/a78f54e23804
  - [v5,2/2] Bluetooth: btusb: Fix leaked runtime PM reference in btusb_reset
    https://git.kernel.org/bluetooth/bluetooth-next/c/71729d60938f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



