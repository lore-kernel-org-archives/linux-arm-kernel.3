Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF88FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 18:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2qsN8wdW0Zho15qs48pheYqjkONPaUEerRAaR4V5SSo=; b=yWI61otE/6SZnQYUsm/Gw05ZM0
	V/613yhPiUfQGB8BjBjRvG2k15VrLqv0qurRL6h3uPeXwyPjzAQsXAglrGotYFwAu9w918U1+ZdR5
	qpg+2H36ypCjQQn/KKJHMRHlppR22GmDHifidaap/oQ+/BWC8iSk/boQA3Dz1ixpEvi331GHNWP+e
	2KuUUU++7XS2iJ4f8jtPRfmR9Z2RI1k9GOzuZvsn3yopjd/h1hQd9sKBwK3KtF1pV/9BuB51M6SIM
	WXBcnGf7Mt/eJYtBE22/yGScaEA3ZL2vs5WlN5yQQNMNf6nMlCxt46YbQOM0YX9RhLMokMkLL2bGx
	tFbNJVmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJxyp-0000000DykH-2DY2;
	Mon, 04 May 2026 18:25:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJxyY-0000000DyGx-48NP;
	Mon, 04 May 2026 18:25:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3043D4459C;
	Mon,  4 May 2026 18:24:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10564C2BCF5;
	Mon,  4 May 2026 18:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777919099;
	bh=WDFhxjJb9z+ifSIY6a5Dfa4xTAgGcmZYrk7QDVq6rdw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iQ1yVBTXJiCZTxeXqFTfDys3JxsA1Pw59lZyiDiS5yQ71zemGW+Nk3GyMsfc8EOwu
	 gfz9rZnZvJRb2BjwkkE9VQ9ebmxLkYgD/FLxqqpMYXChOQUqgcyZ9EnO5JvK2t+f8E
	 dBtHg4/IbOEC8zWgvHXwfFf6mcnKbJhEFSoWkkYLTSqRePYSI8PTsui9PowoLX4JXk
	 rbKEhmDTlUpZ58itFdV8uW8Td5pbXCiSCDu1DOmyH9Kyp7jhgxQJpOh/smehWmw2Hw
	 TiKnXjfnbqgUHK3X75NTVpYbADsQZAwMrAFfK9oG6Yc1A3+Ug0v3v1xrsSFvSdq/31
	 llLaiNjmTPSZQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D67CD3430;
	Mon,  4 May 2026 18:24:59 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Mon, 04 May 2026 21:25:00 +0300
Subject: [PATCH 08/13] mfd: mt6397-core: add support for mt6323 efuse
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-mt6323-v1-8-799b58b355ff@protonmail.com>
References: <20260504-mt6323-v1-0-799b58b355ff@protonmail.com>
In-Reply-To: <20260504-mt6323-v1-0-799b58b355ff@protonmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 Ben Grisdale <bengris32@protonmail.ch>, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777919095; l=882;
 i=rva333@protonmail.com; s=20260325; h=from:subject:message-id;
 bh=KHZcH06TkyVO2TQwIZCbwT+DwvWV7qLrxAW86+Uky0E=;
 b=aHVrflr5+/NWv4HshdZg/E1DtkavRTPohIu568wUne7D2WRSQLE/Wpo2rHBief8PxE2fLxMSf
 3r0EjqDGRw4AmxaZ/tU/z4ItF2gRc7OdTVaeoeyRS5blCnvcu5unomK
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=euuVBZGtA2Cqb8Dju84qpQPhvwxyUirJlXpqEPQWKBM=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260325 with
 auth_id=695
X-Original-From: Roman Vivchar <rva333@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_112503_242117_BEEC798C 
X-CRM114-Status: GOOD (  11.66  )
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

The mt6323 PMIC includes an EFUSE. Register the EFUSE in the mt6323
devices array to allow the corresponding driver to probe using compatible
string.

Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/mfd/mt6397-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 013b0857fb54..2d9419b80a5c 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -127,6 +127,9 @@ static const struct mfd_cell mt6323_devs[] = {
 	{
 		.name = "mt6323-auxadc",
 		.of_compatible = "mediatek,mt6323-auxadc",
+	}, {
+		.name = "mt6323-efuse",
+		.of_compatible = "mediatek,mt6323-efuse",
 	}, {
 		.name = "mt6323-rtc",
 		.num_resources = ARRAY_SIZE(mt6323_rtc_resources),

-- 
2.53.0



