Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76985D68BFD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 17:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WMQErNRmFF5mIAJwlJe+WSeCIPLm32LKnZbvzaZg8k=; b=B86CIk7ZOUr7IoP9CegSpfodwj
	GirVce3u6BTEsvWhcz4l50L+hfvpFYfmfrTUhdilW3A4E4wKI1Oz3gstdFYWDSO00mS7nF+tFacyI
	JufkoCr2NqflfwrAhAfrg0pXOoUut/jhE2YfmeqyAbKcjMoewXJsrzrFg4vydNMiVZKUfYIPE+OQZ
	6Z7HPOnXYW5yBeDe4YSNiz5nLivv9XCGDdE0zg/ib76IUA/wO3xb0aMoMxOE3zFr8KzCr/23wNmkg
	ahCAYoCdg/fJMXzALqglsmR/fDLEBf/1cV1Zi9Y+ryyVrX595r+qOry5d/TECDvgbY/PMhJGekHct
	OVhZ8fVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFGr4-00000006SP1-2RB9;
	Sun, 24 Nov 2024 17:57:06 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.208])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFGo1-00000006Rt0-46Fj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 17:53:59 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 182F3C0003EC;
	Sun, 24 Nov 2024 09:53:57 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 182F3C0003EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1732470837;
	bh=p9mxCjbAVe3XApz3wqbBuJgqQBonMYP05v02ivRaoKE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=okpv1EOQksSe0NGRF7v3GxlYHcTMd+zxYlC/qU3qe2ZzvmAaal96fbwVFr9kGU9Ym
	 brd37mlELjQ9ia/VLo6C0DLLhdp2dUwXnocL2/3RQEoUw9XBLTh+eJME/FyvmXpYcd
	 cIUaj/UVjb9RRfzYeN+krvYyLqekKFMFww8ypScI=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id A3A2918041CAC6;
	Sun, 24 Nov 2024 09:53:56 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 4/9] ARM: dts: bcm6846: Add MDIO control block
Date: Sun, 24 Nov 2024 09:53:56 -0800
Message-ID: <20241124175356.717653-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241019-genexis-xg6846b-base-v3-4-8375a0e1f89f@linaro.org>
References: <20241019-genexis-xg6846b-base-v3-0-8375a0e1f89f@linaro.org> <20241019-genexis-xg6846b-base-v3-4-8375a0e1f89f@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_095358_088895_D866F8BC 
X-CRM114-Status: GOOD (  11.62  )
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

On Sat, 19 Oct 2024 22:39:33 +0200, Linus Walleij <linus.walleij@linaro.org> wrote:
> This adds the MDIO block found in the BCM6846. Use the new
> "brcm,bcm6846-mdio" compatible (merged to the networking tree)
> for this block.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

