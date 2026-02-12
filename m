Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED222EE3698
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 16:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pygeso/hMqg/e8j/lPRGQdP2Dp2JrXGGOdwPzlOloJU=; b=cIpwu/CQFu36/tfoyVUpthkMsZ
	Uzm4u/Hc7kv02Va6VF1lyao1tUQCb/l0CPNhu4fRgsZF1pQN93/ybF2Uhs4iG7OlEMD+mSQUG553D
	ha0VnnDBymt0piuiwwHcO9Ohe49X/arCjBdWJPmSESj16FKXWchKOsTB8tQCFriFHgnS0IrQWhKdY
	P/jMPddo3CrHzPj5GkgkmS/4e5MAlyV60AszN3R1LzRXR8/pxyQ0ODmIKydQqOtuNAhbIQUNKJ78Q
	bRcgiAD9apaGsJhvrAz7wZnNOlgLyAh7EAWorN+GwwHhaKyaP07gC2tDLARb+hg+9IDt3BLR1ecMB
	vO6yQJpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqZWj-00000002Mnw-272y;
	Thu, 12 Feb 2026 16:26:50 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqZWg-00000002MnY-2S2P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 16:26:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4194C4E40CE9;
	Thu, 12 Feb 2026 16:26:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1308A606B8;
	Thu, 12 Feb 2026 16:26:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 19B7E11971BE5;
	Thu, 12 Feb 2026 17:26:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770913600; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Pygeso/hMqg/e8j/lPRGQdP2Dp2JrXGGOdwPzlOloJU=;
	b=x+pWO8Sci3e/vAkcG0CjCHE7+PpRiLbF8Bn2OgYjOb2QWHixHk8m224SX2FmhaxMN2YTki
	ZXXvaZOSAVIiC057uD5EHXXkQ5ksgMFhtPjxaS/0JERCW4C1wiSyLm/eKLOgyq4qJm2gi4
	X/nZ4tpbdoohYr8ooiX0EK3Wb368cbNzOLVVLocGqC+ChUF+KA3mdgruoknTprigpn1jVJ
	iKBHHX5N4njDB8/haIRWvmkXSoP31fcB9vG45UYgMj5wZY7Bit4NWzRtzEofo54S824nJA
	4My5gcpu5bSNfZPMER8wBsO2kJ9J4m5AGGeJVbPHcFVZoiusoq/YEnAPSK6I/g==
Message-ID: <3699fa56-6eb2-489f-bcb6-0ec7f020999b@bootlin.com>
Date: Thu, 12 Feb 2026 17:26:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next 6/9] net: stmmac: pass interface mode into
 fix_mac_speed() method
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Frank Li <Frank.Li@nxp.com>, imx@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vinod Koul <vkoul@kernel.org>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <E1vqKPL-000000093mf-2fkd@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vqKPL-000000093mf-2fkd@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_082646_995660_FEC1AD62 
X-CRM114-Status: UNSURE (   6.34  )
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

Hi Russell,

On 12/02/2026 01:18, Russell King (Oracle) wrote:
> Pass the current interface mode reported by phylink into the
> fix_mac_speed() method. This will be used by qcom-ethqos for its
> "SGMII" configuration.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


