Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4FFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 17:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nqmuPPmfP9VFcLThHSDeBnpXUiiV8nG4V34GV0c7hOk=; b=w8RwXVF1ElWM7bffh3gpOgpdjc
	bm5SRC3tLbPSM+V9FkDX9gwC4+VRIcxI58gmthuvs0YWAhMBTxiqrs4CQXxidjXK/7WSZfCKP0/i0
	NWINglxHb+z2kl8O20/GKKr1UZoRB+f8Oj7Yc5MdVKuHgI1dPNFrp0eiV/N2po+SlvqiJXmckd3bd
	/gM2OB6F+7hc4ARWABn/WIwHsPLxRMPJEMz+RJr8cReQ3R8/ad8VeQsY0af5AGBSJEXv/LuZ3wMrG
	r5UnGdR/mgO0GJSGf5hE4G49wzjazRL19zMXNqPN/O5SH1jVstnuOIJXJv8mh30nWVkJayFOK33Kd
	FCbxb2ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfLFY-000000058mo-2EB0;
	Thu, 02 Jul 2026 17:30:56 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfLFV-000000058m5-39vu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 17:30:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 322654E40C3F;
	Thu,  2 Jul 2026 17:30:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F2B02602EE;
	Thu,  2 Jul 2026 17:30:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 90FCB104C958B;
	Thu,  2 Jul 2026 19:30:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783013447; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=nqmuPPmfP9VFcLThHSDeBnpXUiiV8nG4V34GV0c7hOk=;
	b=Kc/AXq//tuSUAOD406+lAEEvx3VeHJAeHfcb4ALztzre2D+frAtf/I9C8kI5ykr6SF4pX3
	t7zLeeL/l4zixdSRttiAuF9YAtkQ5hiy22Uf5zn9epnwzhpVxJMKg0uxtsgwtsEEtwsMav
	O4JKcL2oVvBd9siz6dqEeUE3qf6bnnUaiIhDU2x0uHEvmFfwgcVVn3V4kAqosy1fnYUVck
	SA9jk5Z8+R6OWunRDah0pF4wi98UWDkdhvt0dSdjB52eeZOE8jDqVd+E7JcO2GYU5lqdrh
	qfnTzmPblF7shcNYUFTE+7DtEUERRUPfMZ8BVIady+0xAyOsNBOZDPySMExAWA==
Message-ID: <7576597d-6910-4d58-95b3-28ca64f42b57@bootlin.com>
Date: Thu, 2 Jul 2026 19:30:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 net-next 07/14] net: enetc: differentiate phylink
 capabilities for pseudo-MAC and standalone MAC
To: wei.fang@oss.nxp.com, claudiu.manoil@nxp.com, vladimir.oltean@nxp.com,
 xiaoning.wang@nxp.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux@armlinux.org.uk, wei.fang@nxp.com, chleroy@kernel.org
Cc: imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
References: <20260702025714.456233-1-wei.fang@oss.nxp.com>
 <20260702025714.456233-8-wei.fang@oss.nxp.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260702025714.456233-8-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_103054_024279_CC803043 
X-CRM114-Status: UNSURE (   9.16  )
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

Hi,

On 7/2/26 04:57, wei.fang@oss.nxp.com wrote:
> From: Claudiu Manoil <claudiu.manoil@nxp.com>
> 
> The ENETC pseudo-MACs are proprietary internal links that do not
> implement any standard MII interface, so restrict their supported PHY
> interface modes to PHY_INTERFACE_MODE_INTERNAL only.
> 
> Since pseudo-MACs can operate at any speed between 10Mbps and 25Gbps
> in multiples of 10Mbps, set their MAC capabilities to cover the full
> range of standard full-duplex speeds: 10/100/1000/2500/5000/10000/
> 20000/25000 Mbps.
> 
> For standalone ENETC, expand the supported interface modes to include
> 10GBASER and XGMII in addition to the existing RGMII, SGMII, 1000BASEX,
> 2500BASEX and USXGMII modes, with MAC capabilities up to 10G. MAC_1000
> is replaced with MAC_1000FD to explicitly exclude 1000M half-duplex,
> which is not supported.
> 
> Signed-off-by: Claudiu Manoil <claudiu.manoil@nxp.com>
> Signed-off-by: Wei Fang <wei.fang@nxp.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


