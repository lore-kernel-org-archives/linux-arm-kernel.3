Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E50C88E6A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 08:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=004wTdbNvNRaV5ZU3lX+qt/FMVPheGrFiOVdbDVsFm0=; b=On+l3p8Bu5gayoWe22VyimuktE
	eQf7j3aKwGihl/DQ1QJXVzk2bW+Qp+ywnt8vSsLfWNzKyPoiIEtZvIpvq9i4jQSaJmmPoggUEczyM
	Ml+ocWJQr8NwokLnTjl7bYbFvuFNTUwyu7UxWygOt2BJkC91WREH2SL8NFLYqb2EttR+Apg/aBrq5
	sQhV+WG2dRumDOLrF9Gd/9v+L//AoheBBO5VrhnAFoDhWS7dlkIe36Uw8WckmI7CPgCjyw1B6/8x+
	UnZqPaaURK6xxN30d4BjhS2gbaWHMR2I+pKddS9KwgByRDA1NihpVhNIk8mh2qm9ZQ06VD+Ff0a5u
	uVpF+jPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62U4-00000002qBd-3Y7H;
	Mon, 14 Sep 2026 08:56:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62U1-00000002qAz-3u7T;
	Mon, 14 Sep 2026 08:56:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9348B43949;
	Mon, 14 Sep 2026 08:56:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 680CFC2BCFA;
	Mon, 14 Sep 2026 08:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789376171;
	bh=g8oyk3TCILBAAOWteUVeFqKgN/1URJtIvaVbACJ+PS8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=k7E/xtZ8b2NHxh4+EAg6leFeRbPz3dVBRKi5cumiPMzyt95oQByeg6KOd5EZua1QL
	 4QR85isOq9GRtw5cNy57i/sPsM8UmmRJx+up0qQSKAOi/6E9JqppBXcMfFA+VnVDku
	 mhlefujzwsXEdr5JPOOzxDsfWaGpMWor9kQyzKapcX89m8B2MQvhjCI8ANEEyCkCtR
	 s4s7Xcho/vCYVBThN2u93EUBWQ5LPMJmEJhP3L5qzhE4u37+fVZYlmFDkFrqXP9NrL
	 8HK/n9rghCMMXmw1JJro0ZvTejaIjXE7iq/DziG0cwzzv811H9B1B1oZ1sGNE7MZ4C
	 /c3zYrOmSkEJw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D22C88E6A;
	Mon, 14 Sep 2026 08:56:11 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 14 Sep 2026 08:56:08 +0000
Subject: [PATCH] pmdomain: amlogic: Keep Amlogic A9 ETH domain always on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-a9-pwr-eth-v1-1-752005131135@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAKe2p2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0MT3URL3YLyIt3UkgxdM0MD0zQL8zTLNNNUJaCGgqLUtMwKsGHRsbW
 1AJXB/KxcAAAA
X-Change-ID: 20260914-a9-pwr-eth-6105f87f9f5e
To: Ulf Hansson <ulfh@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Qingpeng Yang <qingpeng.yang@amlogic.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789376170; l=1200;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=9qMUad9FU6+wYS82AvwnPOBXh42Rv4up5LorY693ESs=;
 b=tko0/R7PKuB0XsbGu+238gRyuJkZ2G0grG4LU/4gsM3oPW9tHndYA+300KtG/VVqHOmAvMpir
 Ar8z80zCKuDA/0AtjPVCXmk62hTUOYWVdPHEIVkPGRlzYqNptAjkhl8
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Qingpeng Yang <qingpeng.yang@amlogic.com>

Mark the A9 ethernet power domain as always-on since it is required
for ethernet online wakeup and must not be powered down.

Signed-off-by: Qingpeng Yang <qingpeng.yang@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Keep Amlogic A9 ETH domain always on.
---
 drivers/pmdomain/amlogic/meson-secure-pwrc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/amlogic/meson-secure-pwrc.c b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
index 133549956efa..daf09cf86335 100644
--- a/drivers/pmdomain/amlogic/meson-secure-pwrc.c
+++ b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
@@ -196,7 +196,8 @@ static const struct meson_secure_pwrc_domain_desc a9_pwrc_domains[] = {
 	SEC_PD(A9_VICP,		0),
 	SEC_PD(A9_SD_EMMC_A,	0),
 	SEC_PD(A9_SD_EMMC_B,	0),
-	SEC_PD(A9_ETH,		0),
+	/* ETH is for ethernet online wakeup, and should be always on */
+	SEC_PD(A9_ETH,		GENPD_FLAG_ALWAYS_ON),
 	SEC_PD(A9_PCIE_A,	0),
 	SEC_PD(A9_PCIE_B,	0),
 	SEC_PD(A9_NNA_4T,	0),

---
base-commit: 26b9ea4f00732908c4f87501483c20ecaaf4eca5
change-id: 20260914-a9-pwr-eth-6105f87f9f5e

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



