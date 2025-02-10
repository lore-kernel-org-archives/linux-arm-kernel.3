Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2847FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 09:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSLcEZITRPL62T9rigCQskjKO0Hvwus0+e1uc/TnvEg=; b=zzmI+91UZALFk2ApD9ssgbyTmd
	sPMm2TZGwPHTZNmph3KiP7tU8lOl52qcKhmDbm/8EsJzgTLhfYctNlCVdFAqeG6x81/93qi22o1NJ
	uIJHgPRG61IcuUZXc43SZyaMxrkfB2nENFqeZYkny109Y7aOnP97UpfpCCbjTLCNGY5rhbJM8PJJt
	a0kOzDWQ1E2gIw/cKmFQPcZb+TuVpQmGJBhpxXsSHmBxNgU0hbJ1lmy4m6blT4EQ0gqx+EGX8fjK9
	Owjd5xIAhzRd9q6Q1yF7UVitD06TSliK4HQnHLsTGatWGmVSTtseFXt3ey5im61YLQ1gUsF9i7pWz
	Cpk05Kjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thQ05-0000000GnsX-0l7y;
	Mon, 10 Feb 2025 09:22:45 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thPsg-0000000Gmqk-0Q8i;
	Mon, 10 Feb 2025 09:15:08 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id CB08B10000C;
	Mon, 10 Feb 2025 12:14:56 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru CB08B10000C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1739178896;
	bh=DSLcEZITRPL62T9rigCQskjKO0Hvwus0+e1uc/TnvEg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=ut+ANQFZiByN3Lz+Olhyd4425H90AilO40Ck3WYciKkESk6DoMbCeTRjrFnKQ1QJD
	 f1yzw6qb65rP44IF+ltAiS460YWv8r6jgfwgKZ0ODUq/xPwOemUpWZHOdIrjPYvqQx
	 Qii4zaTC/12leKEAsVVe/vhqeDJeaitjQRu+prfxkDCvnLc6lx8rJteTPKKnqqr45z
	 bfAlJzla9QmZI5za1mR5a5IrmhX+a+UErDgJSMbS30mb25aqv0Y2Y7DIDzCHgQysub
	 0jf343yxfh71zA2SZJdb0AoLa8at7ImyGnfW54q0ir8AzWfMNDzrCn8+Df9cg3Mu5Q
	 31Zxvjrm5cCXg==
Received: from smtp.sberdevices.ru (p-exch-cas-a-m1.sberdevices.ru [172.24.201.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 10 Feb 2025 12:14:56 +0300 (MSK)
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
Subject: [PATCH v11 00/22] Support more Amlogic SoC families in crypto driver
Date: Mon, 10 Feb 2025 12:13:13 +0300
Message-ID: <20250210091313.15190-1-avromanov@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <Z2aokzSrAHpJE_PG@gondor.apana.org.au>
References: <Z2aokzSrAHpJE_PG@gondor.apana.org.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.28.160.235]
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-exch-cas-a-m1.sberdevices.ru (172.24.201.216)
X-KSMG-Rule-ID: 1
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 190896 [Feb 10 2025]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 50 0.3.50 df4aeb250ed63fd3baa80a493fa6caee5dd9e10f, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2025/02/10 05:33:00 #27152708
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_011506_647631_486586A3 
X-CRM114-Status: UNSURE (   5.37  )
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

Hello guys!
Gently reminder.

