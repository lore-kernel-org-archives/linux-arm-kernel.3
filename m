Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEC7CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 17:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+dt9iedthdovGlhpVgl9l5hXny7Coq54nppBllrx4k4=; b=qHdDVXP4dGdpNlwMA8X+VxtWSs
	sqTskO0/h0HaZ4tZ7zlupCVPq84fzICk6wAvdil5t8PmEDMTbliT48tL2qvkyIkt/lsUhvFATl+C3
	pfCyf9Z/A0dMjQ2QAQqYEnxrBBa1DZCVrIspS1qP6p1ZrlLiBLN2xAX8icTYvBQI/LNAH4sPv4gGx
	CpYKOeF9YMrXqasWf0isSqHKRJqRNj5n0qaYUA0cCKBwv9mEBdSta1iYGRLaegg5ag9BDRqwoSruM
	SbNrBn/Sbl2+PJzLiOC1Pjf7W7MY7sHDYnfMGE/y5iSk+MPet47XfvNR/PHFHRhUNCCP+wXBvBreS
	RlmQTgRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCM2e-0000000AAIS-0vD1;
	Fri, 24 Oct 2025 17:57:32 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCM2b-0000000AAI4-3PXg;
	Fri, 24 Oct 2025 17:57:31 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 9FB67C001505;
	Fri, 24 Oct 2025 10:57:25 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 9FB67C001505
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1761328645;
	bh=9a0TgFQiFD71k1iDK0L9UBL2o1z9+uplLaO+xSIPDhs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m3Mk6yOh3qi21ChVnsKe2WApmt3xxy1+JYapDnA0501QkxBBkJiS+AujG0RVOkEJZ
	 ukd9iJlyepNxhsOzy7M9i4+U6Vsd2sP4ZQgera/uIUGntT7BgrJ9JLpQCWPTlJxxOP
	 z37W5ebdEZpz9SD1lShMK3+PaRP0abu2KPBLfjuw=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 2B53118000530;
	Fri, 24 Oct 2025 10:57:25 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Andrea della Porta <andrea.porta@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stanimir Varbanov <svarbanov@suse.de>,
	Andrew Lunn <andrew@lunn.ch>,
	iivanov@suse.de,
	mbrugger@suse.com,
	Phil Elwell <phil@raspberrypi.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] arm64: dts: broadcom: Assign clock rates in eth node for RPi5
Date: Fri, 24 Oct 2025 10:57:24 -0700
Message-ID: <20251024175724.3223588-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251021135533.5517-1-andrea.porta@suse.com>
References: <20251021135533.5517-1-andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_105729_944544_F2263468 
X-CRM114-Status: GOOD (  10.00  )
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

On Tue, 21 Oct 2025 15:55:33 +0200, Andrea della Porta <andrea.porta@suse.com> wrote:
> In Raspberry Pi 5 DTS, the Ethernet clock rates must be assigned
> as the default clock register values are not valid for the
> Ethernet interface to function.
> This can be done either in rp1_clocks node or in rp1_eth node.
> 
> Define the rates in rp1_eth node, as those clocks are 'leaf' clocks
> used specifically by the Ethernet device only.
> 
> Fixes: 43456fdfc014 ("arm64: dts: broadcom: Enable RP1 ethernet for Raspberry Pi 5")
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

