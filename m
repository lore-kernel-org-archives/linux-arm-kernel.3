Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB71C9831D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 07:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aJhSp5FQgDQDLiRKd4qpwkqXiFacPMHlJzlZVfDeqvg=; b=p3RIUBDEadJEW5YXXAtGYyp13v
	hCw5LecYaGm0FYfTxG37gmCgFUoNDILwD0N2MXhiWoQim50JB3YKNg8LTfgK+3G19THZ6ZS+gM635
	ZKquIiFOBgODo4WOLdQXb0TKDN3Ie03tMw696rzrWrEjIiP0ulOsCCU7t8H2PKM8ve4tS2aavVgUH
	sanxjQcl+dImpt3m+3Mol0UIXZj9zp1gabn0FLYrgPc0wT+CmmlMeGXGT1sB48LRa8vBeqIWpfvM3
	OXfpWuzt3yskJzTCZHiKQAUihP4BFWa4Kr6wVpivc2Nuo+rc8eM2lO4pcaVIGXFoS6mOr/tLHCRfR
	XFt1XGcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9eIf-0000000AMAW-0Ydm;
	Thu, 24 Sep 2026 07:55:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9eId-0000000AM88-1aCm;
	Thu, 24 Sep 2026 07:55:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 25B2544000;
	Thu, 24 Sep 2026 07:55:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED4E5C2BCFA;
	Thu, 24 Sep 2026 07:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790236523;
	bh=WUzJAYQHchFad4GvLC0D7YFZzyv0eyNbhdVP3Of0Nvo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bm3F16PoDRNEYRV2YzJsdOhgCmNvWVNNgL+CPGZDJP90Dsb0EKWFMJokP3YJcIdqq
	 pHrCrfsfCU68duxrwatiZ+ydB6oBdB4jWJ3JDRE3b2EyBnud4RqX+Ln4zH9405NeGE
	 4cLo6uUppGc4Bn6t7z/nzeIgXx7Y8xDF7NYsJHx8LW4rsNYR4rNd4Q2AUPwEz7dp4D
	 G/PdH4fYAwjPxoGG6nJNy+Tn/SEaxsaaWlbifkgpByZxXTSKPrbnoGbMqIPqxta3h5
	 N3JczI49qY4j4csb1zTnzwo2AvwRZu2VwXf2Ey9/XOBZOXlTggFwPXBVkX7XA/vibz
	 zUe0PRsAPE1Jg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC4EDC98317;
	Thu, 24 Sep 2026 07:55:22 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Thu, 24 Sep 2026 15:55:09 +0800
Subject: [PATCH v10 2/6] firmware: meson: sm: Add video firmware loading
 SMC call
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-b4-s4-vdec-upstream-v10-2-1289303a58a4@amlogic.com>
References: <20260924-b4-s4-vdec-upstream-v10-0-1289303a58a4@amlogic.com>
In-Reply-To: <20260924-b4-s4-vdec-upstream-v10-0-1289303a58a4@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790236515; l=711;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=wZ/Fw+jH+tOBVIXbBc8zSjH7Kx36sATJ09qPRAeyKKk=;
 b=Tbz+uK0VYas3dUMYvy3qBCJhbR2BH18XolHwGco5EnlwVvMkzc9vIC5pdcYmCWSqMmMnOIaSn
 fUo/GQfWPMkAIExPvZR3bNvoztCjpFcs3UVHGvbqKenx2tJd9SbfHvN
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
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
Reply-To: zhentao.guo@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Zhentao Guo <zhentao.guo@amlogic.com>

Add SM_LOAD_VIDEO_FW at SMC ID 0xb200000f in the command
table to load video firmware.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 drivers/firmware/meson/meson_sm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index ab9751a59b55..887caa5c625d 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -48,6 +48,7 @@ static const struct meson_sm_chip gxbb_chip = {
 		CMD(SM_THERMAL_CALIB_READ,	0x82000047),
 		CMD(SM_A1_PWRC_SET,		0x82000093),
 		CMD(SM_A1_PWRC_GET,		0x82000095),
+		CMD(SM_LOAD_VIDEO_FW,		0xb200000f),
 		{ /* sentinel */ },
 	},
 };

-- 
2.42.0



