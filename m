Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0362C624D7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 22:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G8GIJmRVcQRu3gXC8ANh/f6tIzU9fEZM1Etf82O4wT4=; b=Dedm5oxIUlBmAUDZaPW7HLtWu1
	pv8PGEyQkfqGHDhyUOLNzDqmfR/nJXWohFeDiP5b41zfW0FktG4HL59OwBpZ3nHZ35kn4e54JudVE
	2horulBHRYaPWUUm/8q3QMp4Taf0P0qTIbKXEkw1hxXxhJPl81mFli6fvorzEJEFL+vl8TGrxnLN7
	j/iMZS7N057xh6Ux9ha+rg5sHuS7vkoo6JQr0G+vrvCejkAc5rhMAB8KDzKFfypG+pypvmXYs13T2
	7KldOFT8yaEkXnq6GDO+V+ONu79LCLptVwTWFNwdkFQk4m9RC5SyN7IAY6a8Iqgbr5pdUVA74b3ha
	1EQcZhVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1tGS-0000000FzOm-1kou;
	Wed, 02 Sep 2026 22:17:04 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1tGP-0000000FzOS-1Pd8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 22:17:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8633D4E41497;
	Wed,  2 Sep 2026 22:16:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 313B95FF79;
	Wed,  2 Sep 2026 22:16:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7C0AC11C79331;
	Thu,  3 Sep 2026 00:16:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788387411; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=G8GIJmRVcQRu3gXC8ANh/f6tIzU9fEZM1Etf82O4wT4=;
	b=fTRFOtF9+Ij664TLlH2OaK1q9NFCBpYw+pqZ2Q1o6ziiWIhfqb/GeUYIJEI1KVP8W6xr6i
	nu/dQff/nCwUbXXyMi4KNdHHhWWU550J6fd18roIahAyl4awZFOCVjS1920bibBmdlLJAo
	lSVXYVkrwIpjdjasjpZiCOex1E3fOerBqn3PSfjfThCZPJfWXhiEisstIOfvjALpkvfpjE
	nlAcV5FJAD30OtBJguSyZaqSwNM6Frt4Vy7rFo0ib066VvfVo9V8RC+DUwb7IJKSmkHPTV
	+mJKFU8pZs/UjSJgN6W1nOE0opx+1moGPqdAM8PCyRFktSEP/QsVD18Pil/L6Q==
Message-ID: <ebe7d40e-4f2c-4c39-8d9d-ef588074154b@bootlin.com>
Date: Thu, 3 Sep 2026 00:16:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 1/4] net: stmmac: propagate PTP init failures in
 stmmac_setup_ptp()
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Rayagond Kokatanur <rayagond@vayavyalabs.com>,
 Thierry Reding <treding@nvidia.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
References: <20260902-stmmac-est-reapply-after-open-v3-0-e72a6df5a7ef@oss.qualcomm.com>
 <20260902-stmmac-est-reapply-after-open-v3-1-e72a6df5a7ef@oss.qualcomm.com>
 <1010cb80-d9c9-4891-a719-8d7ca31c732a@bootlin.com>
 <apiT0ZrlBMF2k8qz@lore-desk>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <apiT0ZrlBMF2k8qz@lore-desk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_151701_520322_B68CE7CC 
X-CRM114-Status: GOOD (  11.69  )
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

>>> -static void stmmac_setup_ptp(struct stmmac_priv *priv)
>>> +static int stmmac_setup_ptp(struct stmmac_priv *priv)
>>>  {
>>>  	int ret;
>>>  
>>>  	ret = clk_prepare_enable(priv->plat->clk_ptp_ref);
>>> -	if (ret < 0)
>>> +	if (ret < 0) {
>>>  		netdev_warn(priv->dev,
>>>  			    "failed to enable PTP reference clock: %pe\n",
>>>  			    ERR_PTR(ret));
>>> +		return ret;
>>> +	}
>>> +
>>> +	ret = stmmac_init_timestamping(priv);
>>> +	if (ret) {
>>> +		clk_disable_unprepare(priv->plat->clk_ptp_ref);
>>> +		return ret;
>>> +	}
>>
>> This can legitimately fail with -EOPNOTSUPP, we musn't failt the whole open
>> sequence in this case.
> 
> ops, right. I guess we should just skip -EOPNOTSUPP in this case, or do you
> prefer to always not report the error from stmmac_init_timestamping()?

The clean solution IMO is to gracefully handle -EOPNOTSUPP, here I think you
pass it on to the caller exactly like you do (I don't think it makes sense to
still enable clk_ptp_ref if you don't have timestamping available), and in the
__stmmac_open() path you don't fail on -EOPNOTSUPP.

Thanks :)

Maxime


