Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 278D7C88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 21:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZT6RlOhkt+EWSh2HQUd1bKDLTnT3xlJTc9dltgodwI=; b=D0gzHdDq3lsbVsOUgOt79/MKYX
	C3viCLnRHnVHd2bXtAXqbZMwNvR5Ge+7fj3G2RfpmjIqzyZ7R/R/Zi3yoiIY55y3bc1/ofm+DchJI
	YyeGdMiqVJjU//S61vCJLy6bWXyKhW+RwU2IqIcmjo2QAYmIfZ3j6W0CMaq8OIsezEaX1J8Mt+n1C
	fEfi8iAb8RoylxkTPXTp8Gld+ttxkji859mY8ocu2aLHz3E179Aie2CmBFLFpBmE3ZAXm0L6tTO10
	gIGwWRX8J0A1sxurCSemH9Rg1/tZsDhZlStSMEq/yMar4T//CoatAG//64J2Zz0qQWNAbUmfq6T4o
	hAf18BNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5VRL-00000001Ea0-06W7;
	Sat, 12 Sep 2026 21:39:15 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5VRI-00000001EZh-4B5Z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 21:39:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6B9281A030B;
	Sat, 12 Sep 2026 21:39:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2B74260580;
	Sat, 12 Sep 2026 21:39:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 00B2E11C7AFA9;
	Sat, 12 Sep 2026 23:39:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789249146; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=lZT6RlOhkt+EWSh2HQUd1bKDLTnT3xlJTc9dltgodwI=;
	b=XgQoqzIdO4NMDQi9D3AxENE7d5xKIKvCWynl195QwX3AsYG0ZcYmaeiD6mg4PLN7wH5TKR
	PlXYlME3nHoJqmjTFb/jDlhaK1hP8MIHd3W1bgfqB5ELkSVz71yTdAYYEcppz5tHBcFz4M
	83WXYZx8NPdlt76spPGt8u9TRWB44MQdaKt4ppTB/LUwK04tB3E56V7uisHFxwZXgqbz2M
	8KgGQEIbGtpm3HCfn/J6RwGHpZwOpoV8Mhy8gCnHNb6+9cA3TdURDNBEV4bv+jt/ds3+IU
	zg1yXfgWyNGHAkJgmS6FO7P5dRXP7uudkqvLg+S6I0vWE0THaKxjygddeONK7g==
Message-ID: <6ef48513-6302-44a1-833d-613f2b8a9e21@bootlin.com>
Date: Sat, 12 Sep 2026 23:39:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: report phc_index as -1 when no PTP clock
 is registered
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Gal Pressman <gal@nvidia.com>, Rahul Rameshbabu <rrameshbabu@nvidia.com>,
 Carolina Jubran <cjubran@nvidia.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260912-stmmac-fix-phc_index-v1-1-26e1ead25324@oss.qualcomm.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260912-stmmac-fix-phc_index-v1-1-26e1ead25324@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_143913_196617_496AA2B3 
X-CRM114-Status: UNSURE (   7.48  )
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

Hi Lorenzo,

On 9/12/26 23:16, Lorenzo Bianconi wrote:
> When hardware timestamping is supported but no PTP clock has been
> registered yet (e.g. while the interface is down), stmmac_get_ts_info()
> currently reports phc_index as 0. Zero is a valid PHC index and would
> make userspace resolve the wrong clock; the absence of a clock should
> be reported as -1, matching ethtool_init_tsinfo() and
> ethtool_op_get_ts_info().
> 
> Report -1 when no PTP clock is available.
> 
> Fixes: 9364fa7fcf12 ("net: stmmac: Remove setting of RX software timestamp")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Ah nice, I've briefly saw that just yesterday but haven't started digging,
thanks for fixing this :)

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


