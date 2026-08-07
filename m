Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8866BC2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 16:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kaVrTc+sa8/nAU81KZuP8UMHYiMz2IaW9U7Z7a/uKLs=; b=V4WWYmFvvr+kA/L+cbkSZCvP5p
	OIJlmQJJvj2B+K/9uuIrM0UuyZ/eKghoe1wZMByOAhWJRquPGNdlK1XzKvKk/o85oJ16MdgFDpazL
	l5Q3rlh/rJlI8XUWJMAxzIE1twb3pj/PNWutsox6VCAtVmRvDxwU439QgDzW8EfmLXwU+WzY+vPb+
	9NjLon+TRkKJ0IcXiC8+VK4oHYc5VZzviqiMb84eOHZad2FSmVw7USl1STBL7XaRfaKgCxhJW0Mwo
	KGwd7jvC63XDncBbvuWVOf4GlRl4BOmNVoBfKHrO81tnw2BCJksxiY04Anqd1BgeLcdMT3n/aGaws
	clJvR95w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNTF-00000008QUP-0CnX;
	Fri, 07 Aug 2026 16:30:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNTD-00000008QUD-3zdS;
	Fri, 07 Aug 2026 16:30:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F368360A69;
	Fri,  7 Aug 2026 16:30:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACEEC1F000E9;
	Fri,  7 Aug 2026 16:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786120254;
	bh=kaVrTc+sa8/nAU81KZuP8UMHYiMz2IaW9U7Z7a/uKLs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=PK3eXO1ZNO2cgeG5W6vmFtFO+JxU3N2sakvAjPydvI4UCeUbdIwq1j9ZHL6mxBio3
	 ByNVChoj7VBRxhC3n6Ha2kKwChGuQIZOc3XyV+eauBrzcHLW56z2CQhCv/KiyioeHj
	 qQfC0DaGthxVZaarROW59I0gx0HODZTV5+KVZzu4V6IXW0APjAsQ2OiDswVbhcWYD5
	 /OdlBEQ5+9cyIEldp9cKKau6HcnbzJE/wNPp5OZrJvEGQr1gJ3/VZhftWJ9yzCbYAI
	 Lfdk15Zghoxm3NfCsRSXSTco+7AuXZGM4wXU4MbzzTQoNGubZZrBRHfWqZrTzm9V0H
	 VrUOgKidPVBtg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93A9F380CEE3;
	Fri,  7 Aug 2026 16:30:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: btmtksdio: fix usage_count leak when
 autosuspend_delay is negative
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <178612021313.1887768.17053811482206662967.git-patchwork-notify@kernel.org>
Date: Fri, 07 Aug 2026 16:30:13 +0000
References: <20260807151447.2530075-1-lgs201920130244@gmail.com>
In-Reply-To: <20260807151447.2530075-1-lgs201920130244@gmail.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, sean.wang@mediatek.com,
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

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Fri,  7 Aug 2026 23:14:47 +0800 you wrote:
> btmtksdio_setup() calls pm_runtime_use_autosuspend() when runtime PM
> is supported, but btmtksdio_remove() does not call the matching
> pm_runtime_dont_use_autosuspend() when removing the device.
> 
> If the autosuspend delay is set to a negative value while autosuspend
> is enabled, the runtime PM core increments usage_count to prevent
> runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> during driver teardown, this reference is not dropped and usage_count
> remains unbalanced.
> 
> [...]

Here is the summary with links:
  - Bluetooth: btmtksdio: fix usage_count leak when autosuspend_delay is negative
    https://git.kernel.org/bluetooth/bluetooth-next/c/1e4acc44552b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



