Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35AA1CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 12:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sSCWIiX+MqLPwcbYBwmpimdl3z9FmDkAbweXSQKqMIE=; b=3Hyn6QWYvAZFeZJ4B8hSy4vt2M
	vPMO8PXffSzWz25YERPSEsIN5moku6lUi4YerIq2njAQKZc6Uc+ARsDrrJFqAO6ediSIk2V7rC2TC
	MEk28Llj0DiA4plRRfMtjx2TC4rrOxoCFtSGvuyyqvqviyLKyrDzEeFVM+i5gpOl9wV7O5hjn/ONU
	51nagU1Y4W9SahW7er5PEtYBlhlaEfj0tmikI9/Obdb7N1YuM+8TP0BNIU4jxq8+sCefOkUCjYdh0
	hc5Q2uMB3UKEYzws9dTlJjbhklnlBIG3FSeoKptEpuV2ARLOPUtb3+AcibIO6ZTN2PyvVe0FAilPM
	BUJrOTgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCH8d-00000009OXZ-19pM;
	Fri, 24 Oct 2025 12:43:23 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCH8a-00000009OXA-3Qhr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 12:43:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sSCWIiX+MqLPwcbYBwmpimdl3z9FmDkAbweXSQKqMIE=; b=tgGTe94KoPkOGF3Tt42ZqRR99L
	UuqCXl9LZWM7vDJkFh11BngEwHQi0OsImNfGBPOipf9aeAj/Skdt0x4EYnBMNMKwxcCAuAhvSkDHk
	czxc02Jd4jaAYtFTLdqSVA0xdYx+McwFRizYvipP5G2CFfFTHhahyekC7smCcqvrPF2YVYKWJodGH
	xUmsqiNn2HnSJP51JJJREj8Hj6WFIA7gURVyTprHmORJ5PATTmyi3NIiw5H4B/Tf/grk/m8cATtpd
	ORWh+0ha/z9vAI8jDv2AQY1oBxBr5pzH3Wbe7ga+E74xBarO8g8ZQRy4dL32/gz819EYSZ7plNTeu
	Q5hUzVjw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51278)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vCH8N-000000007YG-27cE;
	Fri, 24 Oct 2025 13:43:08 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vCH8J-000000002i4-1Ltu;
	Fri, 24 Oct 2025 13:43:03 +0100
Date: Fri, 24 Oct 2025 13:43:03 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/2] net: stmmac: Move subsecond increment
 configuration in dedicated helper
Message-ID: <aPt0V43zYg5idFU6@shell.armlinux.org.uk>
References: <20251024070720.71174-1-maxime.chevallier@bootlin.com>
 <20251024070720.71174-2-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024070720.71174-2-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_054320_853751_4CB5BFF8 
X-CRM114-Status: UNSURE (   7.86  )
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

On Fri, Oct 24, 2025 at 09:07:17AM +0200, Maxime Chevallier wrote:
> In preparation for fine/coarse support, let's move the subsecond increment
> and addend configuration in a dedicated helper.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

