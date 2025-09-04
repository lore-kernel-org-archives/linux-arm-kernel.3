Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11A4CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+IiVoU4HM8WpUeFojdiPPI3cdp0vWm2u+h7j35Kedtk=; b=H2TUf4h87cOlFLJND/fR6Mw1Sd
	kEC4T6Ge6ByN6EIPfdT3eSOpzxDJvQNwCxiHQ20PNszPHOe4VOzyCus+Y//QUingoBSvdJjm+EamL
	rXxo9+wL+pHLe91P2FUEX2zEgLByW0O7cq779AJXCfCP+FY5Gxirvm96GxXx6bwqx8b0czJzet3+j
	k5E8qMYnnD5cQdshfDmpDgRqdp5zBVBivx+rw6OLoRLP5lspbu1d1WgOB43Op5GcocJLLZSpJGIG0
	2m/CiGni0KF/ZR0v5JAdZSYUlup4dwXJjO5GlgxE9FT1Cu3w3WlMgHdXTOeogm5k3G4jnIstdKZ+Z
	08LdB/kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM3i-0000000G2cf-3Dqa;
	Fri, 05 Sep 2025 02:20:14 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuHAu-0000000ETA3-1dLp;
	Thu, 04 Sep 2025 21:07:21 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 778ACC000567;
	Thu,  4 Sep 2025 14:06:49 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 778ACC000567
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1757020009;
	bh=KWs842YIwx84jxEQtrZjfQRc721UeJjZ01BLLEITP/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o5vf+xlPXoi6sNt+jwuxhRc99f9NSialibLrj/a7dNJ7EkDNJ2p2LXPqjVbITgGtP
	 2BX84SCduB6y8ih9Z+cL+C8gE8wcTpETO2dx3t+5rks/wBPli9bC5MwqgDF2zFHF9E
	 jEO/+n94kmhLTzPLIm48QqR32Qmz7udaQRK1U5m0=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 322AD18000530;
	Thu,  4 Sep 2025 14:06:49 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Stanimir Varbanov <svarbanov@suse.de>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Phil Elwell <phil@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 5/5] arm64: dts: broadcom: Enable RP1 ethernet for Raspberry Pi 5
Date: Thu,  4 Sep 2025 14:06:48 -0700
Message-ID: <20250904210648.222946-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250822093440.53941-6-svarbanov@suse.de>
References: <20250822093440.53941-1-svarbanov@suse.de> <20250822093440.53941-6-svarbanov@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_140720_447610_4D97173B 
X-CRM114-Status: UNSURE (   7.72  )
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Fri, 22 Aug 2025 12:34:40 +0300, Stanimir Varbanov <svarbanov@suse.de> wrote:
> Enable RP1 ethernet DT node for Raspberry Pi 5.
> 
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

