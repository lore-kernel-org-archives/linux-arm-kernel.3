Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FD0CAC589
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=100TeeKX0bEkdWOoovysiylW3wpHrYpCJTVbsOOCqqQ=; b=IvbGBFSTaD1Cl9X+/i20rGaL7t
	k3xYFhLRsHD4ZYYaXjE1jjblf2zZIItMFInApE+RBWaP2k+2vC/LpcJEAISzgjszfrNBrB4ceqiRM
	oVB5LmzDq2gSRjME/z1L36VAeKEsIKLyeQvQIXROWJyCN5V+N68lKyU+oXIdNy2ZofY3lYP8TXK10
	QszBy1m4C+cZLXAQoTuvbIdDNTSqbwGTUEyidak+DCVmC7Lz5OhoQZP+66HOvN7ntcdkxgONNDykn
	l+My8DW6OOVCwEZN3tuEpbuWio69eZNJfiYS9x0Vcjdu1SKWPZf3QIjGRYBuYaNkXenwwcV/OmEom
	221CiBqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsJQ-00000004ywM-1XEG;
	Tue, 09 Sep 2025 06:58:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvqzo-00000004Ryv-0MOo;
	Tue, 09 Sep 2025 05:34:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1CFB944465;
	Tue,  9 Sep 2025 05:34:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC1E7C4CEF4;
	Tue,  9 Sep 2025 05:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757396063;
	bh=7L3Kwcvnd7kUCdkPXU70YXj1QbDevHKc2/sNeOjfBiA=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=iq7wjSgHT19iuUUhClv6rXJU8O9nWpBt6pRiTw38JoT7CuSYjBRk3tTNeh/j7kQhm
	 s/hy82cdglOlaZ2eYRZCQTGxzyCM96Adx2cOQrTE1Nsx/Doo9f0/BbpAllh+hBfa0H
	 JbklCqFNgTag/HcJCj6Yb/o78MV3h2s+xUgL5LJWYuu0dtx+J4pe9kJW9P6JbaTDBF
	 zDcTJtTMci1CElTFLhzSorVf7RkTNGRQYc+rZ4EK3ZzjmfDFGvG3NS0OukvbJ37SFb
	 az6LZAo7BD7nsJ547/Zfy5TnoxUezKzN0o3iCnccr7070NUeW5MVkIeBeRLavdmFUk
	 TmPbvAtJ0+58A==
From: Srinivas Kandagatla <srini@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Vladimir Oltean <olteanv@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "Chester A. Unal" <chester.a.unal@arinc9.com>, 
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Simon Horman <horms@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20250909004343.18790-1-ansuelsmth@gmail.com>
References: <20250909004343.18790-1-ansuelsmth@gmail.com>
Subject: Re: (subset) [net-next PATCH v16 00/10] net: dsa: Add Airoha
 AN8855 support
Message-Id: <175739605846.61348.16310568813041047278.b4-ty@kernel.org>
Date: Tue, 09 Sep 2025 06:34:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_223424_151077_1D9A186F 
X-CRM114-Status: UNSURE (   9.00  )
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


On Tue, 09 Sep 2025 02:43:31 +0200, Christian Marangi wrote:
> This series add the initial support for the Airoha AN8855 Switch.
> 
> It's a 5 port Gigabit Switch with SGMII/HSGMII upstream port.
> 
> This is starting to get in the wild and there are already some router
> having this switch chip.
> 
> [...]

Applied, thanks!

[01/10] dt-bindings: nvmem: Document support for Airoha AN8855 Switch EFUSE
        commit: 04b74f665961599e807b24af28099a29d691b18c
[05/10] nvmem: an8855: Add support for Airoha AN8855 Switch EFUSE
        commit: 1c633b4b15aafbc8ffb2458b236d204c835cff39

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


