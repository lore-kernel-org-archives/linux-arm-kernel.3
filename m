Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46845C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 14:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hx75GfJBE17gahFtByj409jMkcTDImb3a5kJ8Lf/J/o=; b=VlyAm0mir2T/ZZW1k53BdDVXtf
	vVHevROKQt0N0JpCKWI4MxktWK65jsWpANccwpJioevwVTjsr4MRDiHIV3c5KR4lOcmWHpa5yTb3Q
	zuCvyJ/Qyn8EYhh2+tW5YROqGe4id0arPuxo5UI2wYhoGIMFx9sWKyhmo5JsSxJps1X6uB8AHP6QI
	tBn+2gSfrIZmAkKvw8Zu0+TkJMXHxU50+uHHE4i+q8vnEqp+ckZSxdy8xR4uYFHtkrzBhMreuD2Vo
	ozXEhZ3qy73F5n2g6pgtne0GRcSO8Z+r+0oOCvu2dEVAvtxiKBVfGbZS1BDkOP8t20FE3MMQW9XEc
	olVn5zsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujeiF-0000000FNCn-1sVm;
	Wed, 06 Aug 2025 14:01:51 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujeYH-0000000FL67-399a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 13:51:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Hx75GfJBE17gahFtByj409jMkcTDImb3a5kJ8Lf/J/o=; b=HIj33Esb5PfQk7IBwUmIlHkHUA
	LRuy+nHOQx2DwWZCk/jisqrsCt8fo5S8Jx/N+tYAAJKTWiLXwROaNNmqInc9CviRg+tof3dzGs5df
	tcaakCTGvzKPOHUt37VX4VWBIJ7ljBcud31mWEagk93ylSie7vhn0KKS+ZuX3MU+jiJfUZ+h0hbQi
	AEJYzuP68hqbqsRS/o0ARTZSSW3K5taUDByDOaKPBHdQeZ6idA4TwSfkeTO143/Mf5Qk/ScIqS6y4
	FfNbZ3L41f3L5G9icNbagOYuj/QeTQ5IG/KYt5CUa+DuFW1MwxPXdRYRBTXj5piPS85kyD3WjjYWZ
	L8TU60yQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54790)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1ujeVb-0004cA-2P;
	Wed, 06 Aug 2025 14:48:47 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1ujeVV-00079n-1X;
	Wed, 06 Aug 2025 14:48:41 +0100
Date: Wed, 6 Aug 2025 14:48:41 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Joy Zou <joy.zou@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, peng.fan@nxp.com, richardcochran@gmail.com,
	catalin.marinas@arm.com, will@kernel.org, ulf.hansson@linaro.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, frieder.schrempf@kontron.de,
	primoz.fiser@norik.com, othacehe@gnu.org,
	Markus.Niebel@ew.tq-group.com, alexander.stein@ew.tq-group.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com, netdev@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	Frank.Li@nxp.com
Subject: Re: [PATCH v8 11/11] net: stmmac: imx: add i.MX91 support
Message-ID: <aJNdOTZHfyG7fMgE@shell.armlinux.org.uk>
References: <20250806114119.1948624-1-joy.zou@nxp.com>
 <20250806114119.1948624-12-joy.zou@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806114119.1948624-12-joy.zou@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_065133_793445_EE5B8CBF 
X-CRM114-Status: UNSURE (   6.51  )
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

On Wed, Aug 06, 2025 at 07:41:19PM +0800, Joy Zou wrote:
> Add i.MX91 specific settings for EQoS.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

