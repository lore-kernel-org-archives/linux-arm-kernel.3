Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB48C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 19:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8pIRJhwQIOS2hAFRSWMvFNWdHqw2YLg5WshIZYV9gBQ=; b=x/E5di9X3wVb/401ZBqgTnu0HI
	nRP8lluvDvgg2XShVkLNCXvBPRfJ0F4c4BBeVJybN1hnf8vKkbdOoAzZ4FiQgsM6Lp7x5uRPjBC8Y
	VymkDwvPhT/YpJw9sfv+XrAm5xCuH9Mzra+uVhu1Ifra3KF6RbCTLaXQgKX+lyh3Y5wHLNnvra07e
	dHbILp6qNGU0+Hk45jFyU/V+tPUZWAwkEYJ8KwzeNR4DC3qzTTdkmCM64ZtscFM6mp0AOxRqk4Xte
	f0qrVjbUJZjgelIoTeCOireLpk83fLppZvFRrRh8aNfxBGOLStb4bjtEgSf3/296wX0eFIG1n87a2
	3FDQcOUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0ej-000000019Tw-3BVb;
	Tue, 25 Feb 2025 19:31:49 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0Rj-000000016hy-1kWP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 19:18:24 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id B596FC0005A7;
	Tue, 25 Feb 2025 11:18:21 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com B596FC0005A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1740511101;
	bh=LsAUNofXorXLRj5AB/bpcrLwxeeZplB7eZs0ofV2z2c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LUb93Xjt/oc0FTDI+UQYI7HDL0zfXgn0lUrJ/0ZZlTx8aXivB0uAqS+tadcxe3ezJ
	 CEcTSkV4LqWcvYRc+YrCGMkHzXM9VyrtOmZDHd/OeggP9vL1nyY2mu1F2GRad2vlpd
	 +C00nK5YQeTqMkAO0q/U22cDM9z9GUYpXK3VStQY=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 8733B18041CCB8;
	Tue, 25 Feb 2025 11:18:21 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Stefan Wahren <wahrenst@gmx.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Phil Elwell <phil@raspberrypi.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>
Subject: Re: [PATCH 1/2] ARM: dts: bcm2711: PL011 UARTs are actually r1p5
Date: Tue, 25 Feb 2025 11:18:21 -0800
Message-ID: <20250225191821.1059923-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250223125614.3592-2-wahrenst@gmx.net>
References: <20250223125614.3592-1-wahrenst@gmx.net> <20250223125614.3592-2-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_111823_504304_A7E1CEBE 
X-CRM114-Status: GOOD (  10.91  )
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

On Sun, 23 Feb 2025 13:56:13 +0100, Stefan Wahren <wahrenst@gmx.net> wrote:
> From: Phil Elwell <phil@raspberrypi.com>
> 
> The ARM PL011 UART instances in BCM2711 are r1p5 spec, which means they
> have 32-entry FIFOs. The correct periphid value for this is 0x00341011.
> Thanks to N Buchwitz for pointing this out.
> 
> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/fixes, thanks!
--
Florian

