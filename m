Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB06CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 08:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=epg/CJTop2yMwEwTNQzhdUDQRTPIOstndBbKQiZycUs=; b=lsCdpplCMdP3sZLgZM4/LlnH6G
	uiMEM95hQOEl6W20ZbhbMIXEMAemkqpD2krOzONIOu6lTh3N+HwlUD3xyb88Psnu8FrHDuk1/fQN3
	w5vxCCyXCaKbeYmCS2wHx7bKraWWzBa/Ko2ycVPzTdsJdxckDIcYvQvmKng7Beoeso0Idqbe1AYNy
	Ts9Bitryzim5VyVXNMwehgSCTDBxSUOzCmrTEbIMMLCWTFCcKpXareMX8QFL9Yi9iBpPhEr2qoyt8
	8TM4G8crCPBBlIvXrRSbb5MdH7k3wqjNiElz/NZTFgUufX1rqoa70rZmjowZnBgrNAPT9PPpCNacS
	eRD5OtXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9IwC-00000003qOq-0w7a;
	Thu, 16 Oct 2025 08:02:16 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Iw8-00000003qM2-2AKo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 08:02:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 75C80C03B71;
	Thu, 16 Oct 2025 08:01:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 94D946062C;
	Thu, 16 Oct 2025 08:02:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ADF8C102F22F8;
	Thu, 16 Oct 2025 10:01:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760601724; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=epg/CJTop2yMwEwTNQzhdUDQRTPIOstndBbKQiZycUs=;
	b=R86uQbSwPtfWBGs3P9qIkZwbYZIxEbHPKPfBOUcKnU4E91PDHpMmVcCdfUM39MUUox04kQ
	G1R/ikQ+nU9LU6nWtmUTpv4+0kCjgzQSITC3ZJteHpc3136OMXJz8TxYWYczhU5h3UoXzW
	BJEud93vn7k6MKpWQYYfI+XBV9MNEioT9ansLB4lAk8o/g8NOBN5JMBmK1eoSfBQJDtfFE
	FMqRKBsa/avl4sAJxydw/fS9LGMQUqKMHF/RHU52F2e7G6wcOmVUfpvFOigddgk3DCjz+A
	HZVtwoZl1uyNj06dWK+wvEu1SCwYeGfgKYXxzcjzxABs+bbtI8WcH7GuXguVvA==
Message-ID: <731e8fa7-465b-4470-9036-c59fea602c07@bootlin.com>
Date: Thu, 16 Oct 2025 10:01:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/3] net: ethtool: tsconfig: Re-configure
 hwtstamp upon provider change
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
 <20251015102725.1297985-4-maxime.chevallier@bootlin.com>
 <20251015144526.23e55ee0@kmaincent-XPS-13-7390>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251015144526.23e55ee0@kmaincent-XPS-13-7390>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_010212_743093_14006740 
X-CRM114-Status: GOOD (  16.47  )
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

Hi Köry,

On 15/10/2025 14:45, Kory Maincent wrote:
> On Wed, 15 Oct 2025 12:27:23 +0200
> Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:
> 
>> When a hwprov timestamping source is changed, but without updating the
>> timestamping parameters, we may want to reconfigure the timestamping
>> source to enable the new provider.
>>
>> This is especially important if the same HW unit implements 2 providers,
>> a precise and an approx one. In this case, we need to make sure we call
>> the hwtstamp_set operation for the newly selected provider.
> 
> This is a design choice.
> Do we want to preserve the hwtstamp config if only the hwtstamp source is
> changed from ethtool?
> If we want to configure the new source to the old source config we will also
> need to remove this condition:
> https://elixir.bootlin.com/linux/v6.17.1/source/net/ethtool/tsconfig.c#L339

What I get from the ethtool output is that the ts config is per-source.
Re-applying the old config to the new source may not work if the new one
doesn't have the same capabilities.

> 
> I do not really have a strong opinion on this, let's discuss which behavior we
> prefer.

Well if we want to support different timestamp providers provided by the same
HW block (same MAC or even same PHY), then we need a way to notify the provider
when the timestamp provider gets selected and unselected.

Otherwise there's no way for the provider to know it has been re-enabled, unless
we perform a config change at the same time.

Maxime

