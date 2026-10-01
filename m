Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29872CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 12:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ZyZ7g3c8QNW8v4IgX6ZlE3a0TN55N3ZA3FiDz+oVX8=; b=gRDguLFqr9U2ZjB7rus07Z2LdL
	r6qRuIJw+1japGERDNLqAB+BbdOiR3MLga3MIN2UpZ2HENLilF6vCG/852P5JeRoudT0BvHGKRld6
	+jh73PeQb2od0aeVMALmVfYt5CDouvg3wjIVeMgqpybZKO1YORIfvQi7TLE7MTgBKdBuPj27aI9uI
	FVgIybVo49iHActZKUAGYpwEjDzjQdpSKLL8y6vLYduCPzd75n5BKwZDqwEvusA9aL2c9ZI83d3b3
	M8E7ZBtcaKWEW3lDmICLrM1UPsxdXCOid/BGoXlz6vk1+phhOq1+fASNCe4e8vv8rqIIqatCewZD+
	fEFcQpqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCG9j-000000097cF-2rvQ;
	Thu, 01 Oct 2026 12:44:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCG9i-000000097a8-0TzR
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 01 Oct 2026 12:44:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/ZyZ7g3c8QNW8v4IgX6ZlE3a0TN55N3ZA3FiDz+oVX8=; b=WPUwfuvGHwJMC2XfSp7LWETEUn
	VcHzfHQLuSGRKs1Ynv4tTSs5YRDfVRALKK99Rvu2iKBemfN1z1V+72QS5ZOUCmj2mFbUrW69QKfOZ
	kKsjefwmRpHA80ITezmJtj4tbXZhXSiXCni25p35mbtqLkt/JNpntdmezYAnJW3/Tra4t08JbeAcG
	7IB54QrYPAEcF5QaqbmwXAWfbB5pVWfbpJIK5hjYq3yQKGdLz9UfbYYPYAe4KM897gbQVOGwG/svD
	9T7c9N+ngTPqlt5r+qcSmJCXIckbJee0F567cjFCrQmSP/g7fJ3nmgO2tOsD7gM6fHDZDutWVzric
	66UlP3cg==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCG9f-00000004yqN-1Dgn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 12:44:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 426904E41E84;
	Thu,  1 Oct 2026 12:44:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 143B660341;
	Thu,  1 Oct 2026 12:44:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 441271032809F;
	Thu,  1 Oct 2026 14:44:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790858692; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=/ZyZ7g3c8QNW8v4IgX6ZlE3a0TN55N3ZA3FiDz+oVX8=;
	b=DtXsaFJLIvsmIiTNRUH9bnHqDM798SviRlTLvWsyCuv943cFNforimCQqx2zNSEhLYAdyQ
	iD89MEjsjn6XTe622JLW/36e4AZ0W2zJmd0/EwfMX7D/IQEe44DcuDL8hMxD85FAorWPYJ
	jny4VsfoIwVtdwT6whUoHdOl5954gW4XdlWlwI2oGLeTsL9+iy1q+4DzpirM6yIBB3fBIj
	ruNYoJou+/Ww1D11XvGDiB1jV0bBld/z82o8ZPc6ZAHqwKVwK7ajW3kHLa/uq1W8L2Vfu7
	FenR8iZFZjapkj/uzDvfEnm8A7p0ooUphOwvgqrXV9Yh0VRwkDK1JevegWMrYg==
Message-ID: <9c867ce8-ff4a-4d0f-a09e-a94b59d602bd@bootlin.com>
Date: Thu, 1 Oct 2026 14:44:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 0/2] net: stmmac: Introduce hw queue priority
 offload
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vladimir Oltean <olteanv@gmail.com>, Furong Xu <0x1207@gmail.com>
Cc: Daniel Thompson <daniel@riscstar.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Davide Caratti <dcaratti@redhat.com>
References: <20260928-stmmac-mqprio-prio-offload-v3-0-abbe181f5024@oss.qualcomm.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260928-stmmac-mqprio-prio-offload-v3-0-abbe181f5024@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_134455_540481_9CCC7FD6 
X-CRM114-Status: UNSURE (   8.66  )
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

On 9/28/26 18:48, Lorenzo Bianconi wrote:
> Implement the offload of the tc mqprio hw queue priority in the stmmac
> driver. This feature requires the mqprio to be configured in channel
> mode.
> Do not overwrite real_num_tx_queues configured by the qdisc in
> stmmac_hw_setup().

I've tested that on AgileX5 with:

tc qdisc replace dev eth0 root handle 1: mqprio num_tc 2 \
map 0 0 0 0 1 1 1 1 queues 1@0 1@1 hw 1 mode channel

I do see the right prio -> queue mapping being used :)

Also checked that doing a down->up keeps the config. This is
great, thanks !

Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


