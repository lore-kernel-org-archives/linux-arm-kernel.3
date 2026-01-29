Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588FED6100C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 12:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kcs9CE9aIhIZ7Tc+WAZafu3mN0H9ikMUQFBt3Ov3La4=; b=fsHCRUVXM3MfC5C5OhHv5Jwm14
	ys98DWBQoY33Z/QB4juQIvP1mpQYJSZdRPY5kI4tZgmxMBxI1TtlDs8Hq64hz/9aIvwYvVjFnbERs
	K6RPF+24jvYQ976KsM7CwL9hkPSEB5/flR7IiGMIhSfb1BVJvIJvz0t+hpQpbVcUbdCOBwILgAx9X
	VoGsdCW/dzs9QA02W2BUjQaLrJQ8aw1U+Y+oHbUhvZdhnrDDdql6qmJZN4m/ndjZ1C+pojdonRAkz
	1wqLuWO2dTBaS4vwC3r4ow0IFxr6HNyaxI76Q99xQOg8t2kHda+sIZdpyb6UJ21Q8AO3+luJrBaWg
	KP+g7PZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlRFz-0000000073l-2Q7U;
	Thu, 29 Jan 2026 12:36:19 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlRFx-0000000073H-04Qv;
	Thu, 29 Jan 2026 12:36:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Kcs9CE9aIhIZ7Tc+WAZafu3mN0H9ikMUQFBt3Ov3La4=; b=Qg0oT4uR+AzUhHLOpoVDPUwiUF
	rCayhl2TB2274ELNl8kCGPWohMn5RRHXPUAezkvmluqO+7SPvez8201vG7qCdYeWbbn9vQm9UlxsN
	EardAUYn9naa+LrVm79NOHr1zfsaY0yJ6RQzVUrNSPelkdyIsfvUo45JWJs4lw6+GRoQC0MP72w66
	/1XHWUUXvFFe72vFHZ06QgkYPseC6KFDS7a1j4Q1wrxr2+3O9NCFGzJcOn106QvymNdjmkqV7+MF5
	Q5rDLtytOWHRUVI1x8PdT5PRojOiCiZN59vOVY2Xh/2g0UVTeEVqB9fIcIRAmqFLMcbDsGJNPV/FR
	ySqpNWKg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54900)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vlRFo-000000008VW-3xXM;
	Thu, 29 Jan 2026 12:36:09 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vlRFn-000000007y2-1Hr9;
	Thu, 29 Jan 2026 12:36:07 +0000
Date: Thu, 29 Jan 2026 12:36:07 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ciprianmarian.costea@oss.nxp.com, s32@nxp.com,
	p.zabel@pengutronix.de, ghennadi.procopciuc@nxp.com,
	Ionut.Vicovan@nxp.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	Frank.li@nxp.com
Subject: Re: [PATCH 0/4] Serdes: s32g: Add support for serdes subsystem
Message-ID: <aXtUNxEmxcvuNj6J@shell.armlinux.org.uk>
References: <20260126092159.815968-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126092159.815968-1-vincent.guittot@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_043617_058655_57139A48 
X-CRM114-Status: UNSURE (   6.56  )
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

Please drop these addresses from future patch series:

  alexandru-catalin.ionita@nxp.com
    host nxp-com.mail.protection.outlook.com [2a01:111:f403:ca09::7]
    SMTP error from remote mail server after RCPT TO:<alexandru-catalin.ionita@n
xp.com>:
    550 5.4.1 Recipient address rejected: Access denied. For more information se
e https://aka.ms/EXOSmtpErrors [AM4PEPF00027A62.eurprd04.prod.outlook.com 2026-0
1-29T12:31:01.197Z 08DE5971FB66165F]
  bogdan-gabriel.roman@nxp.com
    host nxp-com.mail.protection.outlook.com [2a01:111:f403:ca09::6]
    SMTP error from remote mail server after RCPT TO:<bogdan-gabriel.roman@nxp.c
om>:
    550 5.4.1 Recipient address rejected: Access denied. For more information se
e https://aka.ms/EXOSmtpErrors [AM3PEPF0000A798.eurprd04.prod.outlook.com 2026-0
1-29T12:31:00.781Z 08DE596525364766]

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

