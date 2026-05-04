Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF44ACD342F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 18:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aV6JI2NCXR9LGakBzEOkzipF9sttMt23RZp8k5tIWEc=; b=voSHGAti+6Er/pReGUDBg0MOl8
	ECW4EXyL4LO25FZBp13LrIniVOyy9KUjiM13ez6U8/xK4GutCMCSv5Kp4zRyvUeHAzDEklYHcBb43
	vB3jm6Mr2Bu4q2Zzy5w4LSiY9EjYVsCdl31ZH7Zpo18cfo1FuEJpwNOjBSXi5NTLijGLOmCl0ohlG
	7oaM+zAx2gUs+jnQGfZMrrfxNmi40igU7AWTsYEaax//y0g296RKn93pE1pQI2J46lW2TqvLl9/4L
	5Mgr7Xu+aaDOthblRNgGsOnzivvW/vikv1v8ENZw1QNMYm9wtovmEczFfJSQilLuCiA/SDmUTjAwi
	OYMYdEyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJxyp-0000000DylQ-479t;
	Mon, 04 May 2026 18:25:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJxyY-0000000DyGz-49TJ;
	Mon, 04 May 2026 18:25:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 734B0445AC;
	Mon,  4 May 2026 18:24:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 204ACC2BCC4;
	Mon,  4 May 2026 18:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777919099;
	bh=wMsaPJTluTOvZFL0m5jH60KdVathnpyRBOWpiXT7BKk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QCnLNbmmWof8Rok38vimSq3yfhpYRhsZAPXK4G23WrDHwrY68/ebOnrMabSFzDzp3
	 TwwljkP+gXxfWiqepRdkBst5Bz4qom16o58qb+152eoRQtwGOsyWfo3WqALmO8mSvs
	 G9kqgErY5FJmte1VBF3M+ObKj+NyulqOghKx8oSoSDyjpAOigJnQeiz70wPL+OxXVp
	 0hAwZeq7vzl7lXjGyh9haqdAjgG68dMJW0JDgOjirY/fnbnnmOegEXWiwvMprUb7RM
	 5ipOMAIPb0pfYdzJ+GsnVp94xH4NP7Z5/Tnde1wwA2XZ1yHCRb9MBQQGcOlmQWpePC
	 /Q8llwSLUxRQw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 176F9CD3427;
	Mon,  4 May 2026 18:24:59 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Mon, 04 May 2026 21:25:01 +0300
Subject: [PATCH 09/13] mfd: mt6397-core: add support for mt6323 thermal
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-mt6323-v1-9-799b58b355ff@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777919095; l=903;
 i=rva333@protonmail.com; s=20260325; h=from:subject:message-id;
 bh=1GBl1TpFBcVXYGizGdKi1F7hlRKLPxUy3Qzy4DpQjMM=;
 b=8nyO1z82QxMlj6H0WEVe86aCBbZcH4auRH3dTb7ryxt+R5BbJ1NJpZ0rlhv416KiWWfCYbyhM
 VaAhTEw+tP3ChoTAZAIFSwzFtWpJxazwDOCBgmDQ680MNhJw61JUEO0
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=euuVBZGtA2Cqb8Dju84qpQPhvwxyUirJlXpqEPQWKBM=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260325 with
 auth_id=695
X-Original-From: Roman Vivchar <rva333@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_112503_195014_94FCD7C5 
X-CRM114-Status: GOOD (  11.49  )
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

The mt6323 PMIC temperature can be measured using AUXADC channel.
Register the thermal in the mt6323 devices array to allow the
corresponding driver to probe using compatible string.

Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/mfd/mt6397-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 2d9419b80a5c..061ac242f1f8 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -151,6 +151,9 @@ static const struct mfd_cell mt6323_devs[] = {
 		.num_resources = ARRAY_SIZE(mt6323_pwrc_resources),
 		.resources = mt6323_pwrc_resources,
 		.of_compatible = "mediatek,mt6323-pwrc"
+	}, {
+		.name = "mt6323-thermal",
+		.of_compatible = "mediatek,mt6323-thermal",
 	},
 };
 

-- 
2.53.0



