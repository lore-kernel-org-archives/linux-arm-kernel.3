Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4222CCDC18E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 12:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tUnXZJyayFJZ7IWEWNYqzn5/gaeS7c9yISHF8oHHoHU=; b=YtDsg0eP92hdDp9j/v59DPRRYA
	SRHwtPznxAxYiHBv0iNZBRniiuoGeGuVi69pjFn6jM17nGyJmEkUiFAPtXhNmrWpi/OIVSMQN/f8I
	Tk3i6+iBAygRP0hbk+xUkq4v7OZVcAS6PUNubGsblWuO94Ibxd7sZgF8FqmrO+T9LzH2dSkadP3py
	OOA9e35lOn7yjUMiAtLTVHv4P3t4E4YXG2ritvb70WMtpv9FvQd7SnFir3rn16rwYONbF1BDP1yjd
	1mY1SsuOjWfiIs4YNyRBpfzTTBsaTQcavpPKbTAUMd0tVcvAr6SzHRHS04godzYhdG0FIY1A526DL
	uI1ucVug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd64C-0000000Cz4O-3g9W;
	Tue, 06 Jan 2026 12:21:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd64C-0000000Cz44-1HKp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 12:21:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 675446013D;
	Tue,  6 Jan 2026 12:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B30C116C6;
	Tue,  6 Jan 2026 12:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767702099;
	bh=zKoDQhppgeJZ9g12tU8EVyMA0qPWRL9mN42OuCpgg2o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XxIX/Uc67pW2srZGfx7L0M+e9v4WJplWlh+0kQ17cQgE3TXo+brUPnDmZLyRtoSUt
	 NS+uIwMPQZ70cpM6y22JW6jE/dRqSDBuoaKh3TDd4eQ4IT4Jx15VdWTziP2iWd7hyT
	 8OX2eLY4it+aWALZe6uARyvIyLy21rDK0Ye78wOqq/EzQrYHKYcMeEdEu4Z4w+nezL
	 tzp4dBFmmOQZQbNRn7ffWbWe0RozvMjSW0zRQdrMreHOK30MtxQyiBnLFJ206BIfbe
	 8CnAyOGc9R4FmPtyuFsNwRGbSDB0oM4sgN4C+vBUFcob0xOC+hjUtYbCLlYNR7KL28
	 4JA9Jx+fmQb/A==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
 claudiu.beznea@tuxon.dev, herbert@gondor.apana.org.au, davem@davemloft.net, 
 vkoul@kernel.org, andi.shyti@kernel.org, lee@kernel.org, 
 andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org, 
 pabeni@redhat.com, linusw@kernel.org, Steen.Hegelund@microchip.com, 
 daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, 
 olivia@selenic.com, radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com, 
 gregkh@linuxfoundation.org, jirislaby@kernel.org, 
 lars.povlsen@microchip.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-i2c@vger.kernel.org, netdev@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
 Robert Marko <robert.marko@sartura.hr>
Cc: luka.perkov@sartura.hr
In-Reply-To: <20251229184004.571837-1-robert.marko@sartura.hr>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
Subject: Re: (subset) [PATCH v4 00/15] Add support for Microchip LAN969x
Message-Id: <176770209215.32810.211066871008391751.b4-ty@kernel.org>
Date: Tue, 06 Jan 2026 12:21:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
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

On Mon, 29 Dec 2025 19:37:41 +0100, Robert Marko wrote:
> This series adds support for the Microchip LAN969x switch SoC family.
> 
> Series is a bit long since after discussions in previous versions, it was
> recommended[1][2] to add SoC specific compatibles for device nodes so it
> includes the required bindings updates.
> 
> [1] https://lore.kernel.org/all/20251203-splendor-cubbyhole-eda2d6982b46@spud/
> [2] https://lore.kernel.org/all/173412c8-c2fb-4c38-8de7-5b1c2eebdbf9@microchip.com/
> [3] https://lore.kernel.org/all/20251203-duly-leotard-86b83bd840c6@spud/
> [4] https://lore.kernel.org/all/756ead5d-8c9b-480d-8ae5-71667575ab7c@kernel.org/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[04/15] dt-bindings: spi: at91: add microchip,lan9691-spi
        commit: 96d337436fe0921177a6090aeb5bb214753654fc

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


