Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D0FEEB57C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 17:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UpdgCwVInAcAFjvAvfmox7CvBKrZON66qnH3X5mEAnM=; b=fcT+5LnIV4uSfSaApI6hayzZHX
	uM1N7/vxF6dYohnRCZw9GBq0ZtETzC9HMo2iwxsPdFr7M/Agfm7Gr3gG/wS8mri8cnHRgr1wOH28u
	JxWjps3EiOJd1J3r29sXWRmIxcMZGpgER5B92zOpAPDAO86dMzjprCVpW6gdVne5BFqz6rGhbSZhx
	/QLFITzsiOojswiPBN7eM7E4xpuH79eyL/6nUR/DcUH0ODOgkELAhdFgtDwVUFU00DSlbaLNoCQL1
	OOGeCTcEyI8Uplf1AhLMKX3oKIEZd/MBrY16Cu4Y1OoMEUnF1qjBq015weVgGISSvlyx7c/ibqITp
	o7kbiwTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbMgQ-00000007Ofq-3F4a;
	Thu, 01 Jan 2026 17:41:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbMgO-00000007OfB-20zi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 17:41:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B62EA44275;
	Thu,  1 Jan 2026 17:41:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455F6C4CEF7;
	Thu,  1 Jan 2026 17:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767289315;
	bh=Zv64SapDen5kzKJuMbMGdMPYfIhGVyuPqNwGNzVunrE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ER9t7cAlj7MqNGXcP5YMCKuLDsKR9w84FCNrArooQFtHOjmbI/DfZrwYQE1VvulF8
	 DZFaUNowxcdH965RH9OZgKQAcXSyG2w5/MG46R88qAOCABM+8kP/0TVLa6bD4kqL4E
	 GriArNDwSzEGl3tltbYRZxoiNQGRjqyqUKNmhJI/GVdl1unkW+vYqi+lKLebLH9/PR
	 Dtcrikk7oRT/GK4vdCGlBPTHnucq204vQ6dfb87P8u4v7kGhQl1vvcSbNh3KTThJRG
	 FNP98/I/YiWCMXFsPA0TvmzkGoFOTDL9lb8djzInRuDqu1+qcPkf+hK4tlCEL93Sf5
	 VUXlu59t8g4hA==
From: Vinod Koul <vkoul@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
 claudiu.beznea@tuxon.dev, herbert@gondor.apana.org.au, davem@davemloft.net, 
 andi.shyti@kernel.org, lee@kernel.org, andrew+netdev@lunn.ch, 
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, linusw@kernel.org, 
 Steen.Hegelund@microchip.com, daniel.machon@microchip.com, 
 UNGLinuxDriver@microchip.com, olivia@selenic.com, radu_nicolae.pirea@upb.ro, 
 richard.genoud@bootlin.com, gregkh@linuxfoundation.org, 
 jirislaby@kernel.org, broonie@kernel.org, lars.povlsen@microchip.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org, 
 netdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-usb@vger.kernel.org, Robert Marko <robert.marko@sartura.hr>
Cc: luka.perkov@sartura.hr
In-Reply-To: <20251229184004.571837-1-robert.marko@sartura.hr>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
Subject: Re: (subset) [PATCH v4 00/15] Add support for Microchip LAN969x
Message-Id: <176728930591.239406.10977505367349763113.b4-ty@kernel.org>
Date: Thu, 01 Jan 2026 23:11:45 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_094156_548380_1EE91CE1 
X-CRM114-Status: UNSURE (   9.19  )
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

Applied, thanks!

[09/15] dt-bindings: dma: atmel: add microchip,lan9691-dma
        commit: c47422f4d0a26b25ff59709921eaaf8f916eec7d

Best regards,
-- 
~Vinod



