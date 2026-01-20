Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74258CCF2DD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 15:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rkUPmWsVxfpp4BgdLCetzTaNtduuqPdVb9LbPRYWpAo=; b=tGTWkXYR2ZU0viRldbHfUYcQSM
	XUtNizVJU+ifLkXn8hEoh2NipBpG4ChyNTkpwgp+vfU/SEEYE3N6ishFMmE6SA1DdR+3REV3lZIRi
	NcwSZTSXlp8cUg3upHIG3PJT83awG59acBYDAfap7PLspkbII7RylcIy9gHM/FSdH8DGjgS1tISLy
	Iu2Lb4DDtmruekW7pv7Gpa1M8C4mZdGGfXQmhtvuU64f1OggTVmqSRSpImwU8rXOD69PW0UD2OfO6
	RM4KUsdOQHkcbNi3RKq8Bzyo1abOdQ46MZgGVG+wX5whuJEypiUZyHcJ3Fr4RQWNQ+kXjGphQi32f
	Z+G0GVIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viE3Q-00000004718-1xNa;
	Tue, 20 Jan 2026 15:54:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viE3D-000000046zi-0n8l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 15:53:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8D00A6011E;
	Tue, 20 Jan 2026 15:53:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DF38C2BCB6;
	Tue, 20 Jan 2026 15:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768924430;
	bh=2lyQ956y/cjzj/E2Ndhkr/nFnx1nEeiq4PAxUbapuuU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tda9PqQf6mdU5ZN2ASc03cnbHIaazXkfER9jbCeHOVDKmaYXcnps15COS5KzH9sk9
	 q8b4Aa0lwNs26Nrq6ObHD2+UYOeAUb+PmoWGV4v5Rf0qj/hRiRV4irKDn7SxXLsI+X
	 A4C8phW1WNMqXH4vQKTyAJm2LWz5zZCMnVB4HfGGA+q2YSbruVNNX+9c3/nu6Xi8ZW
	 7biB1Ph8RRFoUdg7mXSUjARCaQhrJ3IcDgm92qSiY8USKG5kSK4pQSSiSljFezBN7H
	 tatat8ZmbUyGWWnHJ2hZCQ3YnD6MOGK2P+BYCAfmLdIcWadbT8fFTEyV7Dv9shvaDl
	 ZSEpuqTQeljdA==
From: Lee Jones <lee@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
 claudiu.beznea@tuxon.dev, herbert@gondor.apana.org.au, davem@davemloft.net, 
 vkoul@kernel.org, andi.shyti@kernel.org, lee@kernel.org, 
 andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org, 
 pabeni@redhat.com, linusw@kernel.org, Steen.Hegelund@microchip.com, 
 daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, 
 olivia@selenic.com, radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com, 
 gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.org, 
 lars.povlsen@microchip.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-i2c@vger.kernel.org, netdev@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
 Robert Marko <robert.marko@sartura.hr>
Cc: luka.perkov@sartura.hr, Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20251229184004.571837-3-robert.marko@sartura.hr>
References: <20251229184004.571837-3-robert.marko@sartura.hr>
Subject: Re: (subset) [PATCH v4 02/15] dt-bindings: mfd:
 atmel,sama5d2-flexcom: add microchip,lan9691-flexcom
Message-Id: <176892442293.2297977.2838802915163703902.b4-ty@kernel.org>
Date: Tue, 20 Jan 2026 15:53:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
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

On Mon, 29 Dec 2025 19:37:43 +0100, Robert Marko wrote:
> Add binding documentation for Microchip LAN969x.
> 
> 

Applied, thanks!

[02/15] dt-bindings: mfd: atmel,sama5d2-flexcom: add microchip,lan9691-flexcom
        commit: 41d1f3cf1f52c75f72ce1a3e2f2ee82e7c6eb59a

--
Lee Jones [李琼斯]


