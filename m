Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5E2D29C2A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 13:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C88mVe4i3Z4l63ZcsasxWSNQLM5vvDv1/QRFfBQNgwM=; b=FDwfbJ2X7lriIoWyO2CHkvgjYl
	5pMM/pWy0iT2XCQRv99m6jZpij0CzBH87+LbVgw4aXthdSL+eM/pxAUjhRd3RPxZJhc4UL7/OhlVq
	cWlrL4YA6VgSimvfxSSnfYNxXDCD92cpnt213rS7h++EEkmOAL8yLVlfztYNbpnyF0570nZCKQtvR
	Wtnu+As2iYurSIKDtPF5AziQv5SauJ+S5dVuUzo4Ry3o3B7Uial1DVQvXTiBtwF17BDzevaKia+SW
	rrGLu0g5VOva5AYzXB8CDItaSabd0I4Tu+YEnFSJ/jnksbrwT7nK+Ong9vYi57NfL7Jkm7eYxgyPE
	Ts3IOWyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpBZ-000000029Pp-3WUQ;
	Mon, 19 Jan 2026 13:20:51 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpBU-000000029Nm-0Krm;
	Mon, 19 Jan 2026 13:20:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A5533C214CA;
	Mon, 19 Jan 2026 13:20:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AA6D560731;
	Mon, 19 Jan 2026 13:20:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 80CE510B6AFE7;
	Mon, 19 Jan 2026 14:20:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768828837; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=C88mVe4i3Z4l63ZcsasxWSNQLM5vvDv1/QRFfBQNgwM=;
	b=WL75Q6JmD/2Sm5piBoIA+v8gzFbjTwJz0lP7rJVdDU/Ayn+q92uePzNzCiiQNAK2CP8PRv
	ip3puZqFUHQg/9mIUqwTeSVahXjqKCGNhc/JiVR8jMg+ajzSzfDatEi0wQmTIp4Mq1xZ9z
	WvtLjHEhcnLeN2PVZCCdFgPXIqr20jYnFAVWKJJL8nPDPHvCz2VdqlrpDEyq0F3TWU2iA5
	YpKxcvARPFMLIs5De1S9LNSH57XWzurdG/MYqhgDwYsBj4xV4eyi4/nhu6/D2fufTQELal
	PeUDVjASw+xlDH/vuc62zUY42q5wgihzdX/qC9tWoWwh5m+oJRVc5Z/dSkALKQ==
Message-ID: <c6d88377-2b0f-4535-96b1-3eb01efef709@bootlin.com>
Date: Mon, 19 Jan 2026 14:20:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 10/14] net: stmmac: use integrated PCS for BASE-X
 modes
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
References: <aW4kakF3Ly7VaxN6@shell.armlinux.org.uk>
 <E1vhoSh-00000005H29-1LYk@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vhoSh-00000005H29-1LYk@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_052044_265595_7BB4C4E0 
X-CRM114-Status: UNSURE (   8.68  )
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



On 19/01/2026 13:34, Russell King (Oracle) wrote:
> dwmac-qcom-ethqos supports SGMII and 2500BASE-X using the integrated
> PCS, so we need to expand the PCS support to include support for
> BASE-X modes.
> 
> Add support to the prereset configuration to detect 2500BASE-X, and
> arrange for stmmac_mac_select_pcs() to return the integrated PCS if
> its supported_interfaces bitmap reports support for the interface mode.
> 
> This results in priv->hw->pcs now being write-only, so remove it.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime



