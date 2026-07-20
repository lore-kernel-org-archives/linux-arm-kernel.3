Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5420C44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 15:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KqnS+kinSSM1++7MEfwgiazgYykeqv6efBfhW6wae/I=; b=B4WJupLLx66mFhhxNlCMRefZQd
	LeXivG67T7xD1o60gGrSBZHjBUuOkOa/FPfCuKKplckTVnzgxsMPiCUcJwQBTqFmUKCaWFKBo+7qY
	xJbEIVLK6NWrdE4WKesVtKu8ks+ZtvYVbJLUyh6E7I7P10+PFQwt9TJRe31yjeEna4Vc6nP8H0DE8
	npd65Eqsu4H/n+FQlzMRldYkpG2wnq+wznMcwkksqrJA+MTX8uOKa6GxTfudnrVav1gX/2jlA+Tz4
	1tE8v3/gddKtCDW0Zvd+hg/nzR7U4pUz3/qUcQI45s45qEelYCJ1rMb1xMySmnKTwaAn8eZhoC+W9
	ZZrIQYqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq1A-00000007Cnp-1OZl;
	Mon, 20 Jul 2026 15:34:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq18-00000007CnT-4Bl1
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Jul 2026 15:34:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KqnS+kinSSM1++7MEfwgiazgYykeqv6efBfhW6wae/I=; b=hcwQ1WL/dhZb5Eo/z+xDnYhHa6
	nX6962QYKJn8bOKwRSZAX4G9ApArqxLkZsC24ND+7MDQSbsNZiXrX1Kpu28SJrZllxZ4c6LX7LFHQ
	9GL0Ue5oJLEcyCKJ9Oy8KVaBhqFhI+NcAD6W3a32EQhWTNSDaGPSh9zoc/R1pJp9jHF9BTccO7QaF
	rYArufmmw9xmwPX7eC4RSpLA2zQQIIuQd55vHY9lc4GzzElK7JzsS3eDXgIipibDTy6gfej4Klj7M
	4/CSePRSnezRbzpBwUdHjqIQmbMdan3A46MR7ZK0lvWWE98NSLG6GuKZTwXW2X7p5Ps/hsNoxUOck
	06rrHWjw==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wlq15-0000000Gjsw-3NTw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 15:34:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 613191A10FA;
	Mon, 20 Jul 2026 15:34:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 334AC60360;
	Mon, 20 Jul 2026 15:34:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A645B11BD139F;
	Mon, 20 Jul 2026 17:34:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784561682; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=KqnS+kinSSM1++7MEfwgiazgYykeqv6efBfhW6wae/I=;
	b=hcNTniRrw4osJTyHVdmw0MYzi9gaIS+gGWqpr+bhLisCVQZhevOsNbBBwY173dPNxcLuzy
	3wqOglTOmbz9NDNuIH5OMvYHgcn8XJhm+3pRMwve2ubvdJrwEEowHcoHFcP6RJnBasNsoy
	srnw3d3NV/LDZw8y2iCKnZxbpqBcwnNS4XW15vgBBYSOYNhLex5DYgxvGIXmX6PcWfti3j
	isZtrHfBJSpxaE4f3Bfs4wdq1gdpgouab9idM+MmcSHigaf4F2pjWZ4yN7XyZImLs1zm4i
	bIBuFJQWtZdhcnqcmSTQCFPEi5PEWl+89F0Q2EcCFFX6lKmVYKBCu+IV3POd7A==
Message-ID: <5bc01e62-95c6-458b-9789-1f34791f7b75@bootlin.com>
Date: Mon, 20 Jul 2026 17:34:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: Simplify ioctl handling
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>, Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Russell King <linux@armlinux.org.uk>, thomas.petazzoni@bootlin.com,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260718143848.677531-1-maxime.chevallier@bootlin.com>
 <ae82997f-537e-4a2d-abce-d163fcf9d868@lunn.ch>
 <6ac12388-60de-45aa-a8d0-62fcfaf7bea2@linux.dev>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <6ac12388-60de-45aa-a8d0-62fcfaf7bea2@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_163451_992880_866BDA98 
X-CRM114-Status: GOOD (  16.67  )
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

On 7/20/26 17:17, Vadim Fedorenko wrote:
> On 19.07.2026 17:13, Andrew Lunn wrote:
>>> Looking at this, I'm wondering if we can't just get rid of SIOCSHWTSTAMP
>>> handling in phy_mii_ioctl(). Looks like we can ?
>>
>> I'm not sure about that. We need Richards input.
>>
>> The code in phy_mii_ioctl() allows the MAC to be bypassed, it goes
>> straight to a PHY based stamper. It could be the MAC has no idea the
>> PHY has this capability, so it has not implemented the .ndo?

Indeed, but even then the SIOCxHWTSTAMP aren't reaching the ndo_ioctl.

Maybe the thing to change (unrelated to the icotl though) is in
dev_set_hwtstamp :

	if (!ops->ndo_hwtstamp_set)
		return -EOPNOTSUPP;

	if (!netif_device_present(dev))
		return -ENODEV;

	netdev_lock_ops(dev);
	err = dev_set_hwtstamp_phylib(dev, &kernel_cfg, &extack);
	netdev_unlock_ops(dev);

We don't try to configure the PHY timestamping if the MAC doesn't support the
.ndo, maybe we should allow that ?

>>
>> It might be we need to hoist the code from phy_mii_ioctl() into
>> dev_{sg}et_hwtstamp()?
> 
> Hi Andrew!
> 
> I think I've converted all phy drivers while removing support for
> SIOCSHWTSTAMP/SIOCGHWTSTAMP from netdev ioctl. I believe it's impossible right
> now to reach SIOCSHWTSTAMP path of phy_mii_ioctl via ioctl on net device.

That was also my understanding indeed.
> Is it possible to have ioctl on phy device directly without involving netdev?

Unless there's an obscure mechanism I don't know about, there shouldn't be a way.

SIOCSHWTSTAMP/SIOCGHWTSTAMP don't seem to reach netdev anymore with the (great !) work
you've done, so they won't reach the PHY either indeed.

The SIOC ioctls can't reach PHYs without a netdev, neither can the ethnl ones.
Even when we have multiple PHYs and we use netlink, we can only reach the ones
behind a netdevice.

There is still sysfs entries for standalone PHYs, but I don't think we can use
any of that for ioctl.

Maxime

