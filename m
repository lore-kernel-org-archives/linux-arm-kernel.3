Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E167C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 10:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PtSKaw/PwSorq17if9IotJC3sHM1ACH+4BbtNrhm3mk=; b=wUnKTJfYhmQ1fb8aZfzEsjIu50
	mY1qXoR7RiZfh8T8qQQV+WZ1D+Rl1YnlPUHlegqHmB5+OscTe/Pp6CEs0cKGOPg0QABgYW4qHouo6
	zaW2TA7AKLm9ufAPe26roJ6kH7GWvQ0ADswnGzG5sUd3kzJD3/f2ZB73H6SwmPKXow6iYlynyp7yK
	Pq0/T03x5AYJNZFx4Fz4gXBePnr9eicu5GdGiISLdE6lv3Pm2MnnC3sngXFHnK7YrqPAV9nSpo384
	Ln/BzvqFRlSR7Lm9dZMGF0NwaRPva/aee4EQaby3EKCC/gGphTFp5egKChwgjfViUv5G6vzP4MOEL
	KHCa8oxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYizH-000000028Bb-2vMC;
	Mon, 07 Jul 2025 10:22:15 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiQN-000000021iV-45sU;
	Mon, 07 Jul 2025 09:46:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751881570;
	bh=53Gq0bPO8TQdrskZuLSfMBb8Flq3ZNsUzD9zOfGkHMk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YraI6P4805tpiyc2sfEVxGMVhcPWRB2cnHx2GxtIlonVmtxrqWPUgNt5MSSkfaHdp
	 Kf/3J9gHVtYsUAErEA7J4flZfJ8x7kzgALduReSP7EETzUJOTofQ19Q22I1yvoGGMO
	 vh1BFGM8oMEpz6VwmGRAFcqNxZznINPDj38KPbfZ7ORmZ0tkXCpkMALzgvHKxXVKA6
	 9yuSuUOq4++DIHLtyxzOx6Dh+WJ1XP+lXTbwjNEeHnZyohUArNiaO82mSQ93/GUb5K
	 Jr515AdH/dQ4vMjgLcfUdSQVhvdg4EfxYyoW+NzRud2px2/nyP6K+OavGBL2wVpyKl
	 CTjQZM2rDV+BQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7967317E07C9;
	Mon,  7 Jul 2025 11:46:09 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Sean Wang <sean.wang@mediatek.com>, 
 Russell King <linux@armlinux.org.uk>, Max Shevchenko <wctrl@proton.me>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250702-mt6572-v4-0-bde75b7ed445@proton.me>
References: <20250702-mt6572-v4-0-bde75b7ed445@proton.me>
Subject: Re: (subset) [PATCH v4 00/11] ARM: Add support for MediaTek MT6572
 SoC
Message-Id: <175188156942.75673.6578470598593432446.b4-ty@collabora.com>
Date: Mon, 07 Jul 2025 11:46:09 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_024612_185202_6E40C6A9 
X-CRM114-Status: UNSURE (   9.61  )
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

On Wed, 02 Jul 2025 13:50:37 +0300, Max Shevchenko wrote:
> This series of patches adds support for the MT6572 SoC and
> the JTY D101 tablet and Lenovo A369i smartphone based on it.
> 
> 

Applied to v6.16-next/dts32, thanks!

[02/11] dt-bindings: interrupt-controller: mediatek,mt6577-sysirq: add MT6572
        commit: b5ae84ea536e6814f0f25bfd647e66a319b8a7fe
[03/11] dt-bindings: timer: mediatek: add MT6572
        commit: 7827b0ff3bb3cdd79e2a44a9e62b4437c9b13f0a
[04/11] dt-bindings: watchdog: mediatek,mtk-wdt: add MT6572
        commit: a79e5369cfd78d450e47eec1bc20672ea3494982
[05/11] dt-bindings: vendor-prefixes: add JTY
        commit: 1b301b7e2843f8ae8761fa57eac94439f4748e6f
[06/11] dt-bindings: arm: mediatek: add boards based on the MT6572 SoC
        commit: 5215cdb013954c0f166795cf77fe80cb08b8a32e
[09/11] ARM: dts: mediatek: add basic support for MT6572 SoC
        commit: 2a64fc95eb43640482dd4a011ec2170d4ac38fb4
[10/11] ARM: dts: mediatek: add basic support for JTY D101 board
        commit: 3b192aa9c28234f93ac926d4f885d8c02df2f35e
[11/11] ARM: dts: mediatek: add basic support for Lenovo A369i board
        commit: 2dab43dbceab83faf967202c67fbabc4685d482c

Cheers,
Angelo



