Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAFCC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 12:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YTtwLlBe37BdCgnBuy1MLWGgT5Jb4n0isj9w5Ot2fmw=; b=qtGgWMW4i96InICbLLiU7wlQW7
	I++zieV0icC0Q7+owecD9FXeKyFj+RuUo8og6kgllBwGggE95VDKzWYGeogjqSl7bY5+oex1EU4qP
	7s6La+9cSccpfu5RqXYsdAQG7V/n9CvZ3mGCmxqo1n+xiZG+yGNLQcmKiW+/XytcvCVDQu9KgFHZZ
	ijjjID1w71wNtmeg10FGoOGuGvI0Z3gQ7DSXE+E/YBYe9BQVlrReoyrkZPbJxMlWWECwJHmMRTJfu
	mP0DBRJon7AjdthfyPVuH4KfilV3yVbPrEDGsdqqWybAOLCwTz3H0dYH0xzPVXl8wkWodvWHjP+2e
	G8wrLvKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taa7V-0000000ABn8-170m;
	Wed, 22 Jan 2025 12:46:09 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taa3V-0000000AAnx-1BmV;
	Wed, 22 Jan 2025 12:42:04 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id C866810000F;
	Wed, 22 Jan 2025 15:41:45 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru C866810000F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1737549705;
	bh=YTtwLlBe37BdCgnBuy1MLWGgT5Jb4n0isj9w5Ot2fmw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=avQeXlvD0X76BKyLAQbtpU0G3qYpQ3zlmE3dI99AX943Xfct8cW7NJvm9cGfOjrdc
	 s/HQN1xG/Jb5rcHHGMz4UkoXcyVbj85l5FNQbJsB58oJO5ecLOmARNbj+Pd7+EEuAT
	 BHivPC0jbb25+xuKVki+2UaTOsinFp2B61IyZ/9Ps0RnzoHHl57QMEYDBdt91KRr1h
	 JCfW7rMzEghqyABkc5rrb1LZyVUVTzh23wYkqvfvDgwpuI2pFmkef+WZ2OsfBYLFDB
	 2q31eADmH1Jm1F2H/EzfcHW2Dp7Tt89tmuzSiglcufKcm5P8HfbRWXDcI45npON9xz
	 SxjmCWLErLEJQ==
Received: from smtp.sberdevices.ru (p-exch-cas-a-m1.sberdevices.ru [172.24.201.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 22 Jan 2025 15:41:45 +0300 (MSK)
From: Alexey Romanov <avromanov@salutedevices.com>
To: <herbert@gondor.apana.org.au>
CC: <avromanov@salutedevices.com>, <clabbe@baylibre.com>,
	<conor+dt@kernel.org>, <davem@davemloft.net>, <devicetree@vger.kernel.org>,
	<jbrunet@baylibre.com>, <kernel@salutedevices.com>, <khilman@baylibre.com>,
	<krzk+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-crypto@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<martin.blumenstingl@googlemail.com>, <neil.armstrong@linaro.org>,
	<robh+dt@kernel.org>, <vadim.fedorenko@linux.dev>
Subject: Re: [PATCH v11 11/22] crypto: amlogic - Introduce hasher
Date: Wed, 22 Jan 2025 15:41:29 +0300
Message-ID: <Z2aokzSrAHpJE_PG@gondor.apana.org.au> (raw)
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241213140755.1298323-12-avromanov@salutedevices.com>
References: <Z2aokzSrAHpJE_PG@gondor.apana.org.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.28.160.235]
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-exch-cas-a-m1.sberdevices.ru (172.24.201.216)
X-KSMG-Rule-ID: 1
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 190505 [Jan 22 2025]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 50 0.3.50 df4aeb250ed63fd3baa80a493fa6caee5dd9e10f, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;elixir.bootlin.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2025/01/22 11:41:00
X-KSMG-LinksScanning: Clean, bases: 2025/01/22 11:41:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2025/01/22 10:19:00 #27099507
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_044202_618163_56BA0BC7 
X-CRM114-Status: UNSURE (   5.49  )
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
Message-ID: <20250122124129.veSIqf71IiP-ugcj8Hpsh27omoIg4PgagbIR2qECS3c@z>

> You cannot sleep in the digest function.

Why? I couldn't find this explanation anywhere.
In addition, I found an example of one of the digest functions that is sleeping [1].

Links:

  - [1] https://elixir.bootlin.com/linux/v6.12.6/source/drivers/crypto/mxs-dcp.c#L804

