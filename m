Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3AACD4F2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 05:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ckPzHuhEPNnmeCgVk39hKH+apPSTppueJckvSDJkwY0=; b=x/PZFULEjWn+uGU1lqGqiUOhcN
	tsqvf7Ondf4cv46Mn0YxA7Uewop5Xnx/1ixlD79Hes5WeJIoWgOb5QkK0MU/ifjK3/vs2p7+o+5HR
	xzAkAroUivPPwuhOtVsyHaYsmUESHtl8/ulgc9/BiWR9Xgp75Pzq6sc7YkfcoqszzFtm9JltmB4AA
	Hsx5ksaLkidaEZKauo5r4eyqZYR8O6rHqCPghqSKVI50ou5fvCevknOQ5LDG13v5EIndLLRASkewt
	/uTAT8yjAmxNAn9LlFAu8sVUFLyX16UGjr2K/HlWKVWalZHt/lb83zHBE1++K7jFjpn6IJdbazVML
	CF34BWMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMfZ4-0000000FZ8z-2704;
	Tue, 12 May 2026 05:21:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMfYs-0000000FYp5-2WOY;
	Tue, 12 May 2026 05:21:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D8094457C;
	Tue, 12 May 2026 05:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59145C2BD05;
	Tue, 12 May 2026 05:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778563300;
	bh=7+NIL8s8rac2kVXUMdZhh8CbH3qQ8E2j0Y+7NfsYQ9Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aGu34qDq5MRF0rfEXNQpIzWG9yNMJQI6PJzMZ9cSb1Su4KtXKOJBWXukxKhQWzmeR
	 8eoY7+gZyV4yA4l+v7htuafCZIE4KNkzwLj4YfJfG3ksczmh4HGjy1hVISr3L1bkvK
	 VJXmMVwivRCJ/AAZCs47Ee2R/g5IStzAlgONeBBMgTE5bXewBocUzASeJbXxOFEeXN
	 ctcjR6utcLDalcfzwl5QcG5+UUft9yVVU+6U6pVYdX8IqaZVmoWQsLUerhbKowgZAa
	 2/o825hcvxwNn5tdksX7CiTtgH3lAXmKneOFplcL9c/0T9UXwEsEK62NEJwoGwSGO6
	 bY4QN2QKv6B7w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC7BCD4851;
	Tue, 12 May 2026 05:21:40 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 12 May 2026 08:18:24 +0300
Subject: [PATCH v2 10/16] mfd: mt6397-core: add mt6323 thermal support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-mt6323-v2-10-3efcba579e88@protonmail.com>
References: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com>
In-Reply-To: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Roman Vivchar <rva333@protonmail.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 Ben Grisdale <bengris32@protonmail.ch>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778563297; l=903;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=f25MLIxZo0sPtnvFl6vrSY704ngfNfhTeXij+CteVzw=;
 b=gyPil4oXfmTpgD/7W0i+3qHrxuUh6dVoPL7OX6gtnwVi4yQJxCuZdxkC+ZFZx3i2k8xcdKil4
 zhRoRic8tRhBYWeYzWDOqy8bAWNm86j5fGNDpkxfACex+zoC3Qug76Z
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_222142_776025_F878848F 
X-CRM114-Status: GOOD (  11.52  )
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
2.54.0



