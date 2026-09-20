Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E69C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 10:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y2p+CWD3SlvHFhm5upLG6ZgOd8bEtDZeUbNDOVEcky0=; b=rvdVS+qt+XO9xsZ2V8lvoe4qk2
	7XsfIHbeRAbup0EdLERTFC6NiWdloD3AG1iJ6wPXHnqXb59YyNhJXBEZ3ecEKpnW0bquhsm5QH1rZ
	mYswHWTvtx5JJU6HFE+rarqWdNX2JhxCw9FIBnZzyHdNB049KVJ+ltSbJPeKhsfkzDZ7E+5iFrRF0
	8OMuFYfjDCp1d9Y4HtZYqD2St1A5uMXpp/zFTPYwxF3xfO5sx9qQ7CwuZClWie/akZsutrewkF4eH
	C6CE7bi2edwXeGN8gers1OOO50iAxHL/VBlcOugq2HjoN0wcr2jgzB9DrCC2atMSI2TJNDfh78Qk7
	7jTXnc/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Ejg-0000000HFjh-3OmO;
	Sun, 20 Sep 2026 10:25:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8EjM-0000000HFPD-29IE;
	Sun, 20 Sep 2026 10:25:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A679A60AAE;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2BE55C2BCFF;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789899907;
	bh=DiPGG6/1y2xmrETzC91peDuTfVXoxRXsfQ56MzCZN9c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JlhulgHzo1Uq8xQaSeaE5yFJFwQW7NePZQkWKJkruilbtLTRcHXx/cp7o7VjfGipk
	 z7rqIcr2TNtgBkprIB+Rb3laIxnm7PWZb+ZrwxycbY3h71sE2/D69ERUKnHizuuotH
	 G+Y6SDbtkR8pjeOr3SMxeD6inzNYZNx9fCKiqvF3WdkmMMAAvPpk4ZpghQk1j/Tqrz
	 YPVuymCUqpCvVno+UjLJ7NtQk4S7/8HVAp3QVGEGaAFUc8ntxO2UZjc8vvAgpm9R6m
	 rWr32FbbkJCKtOP70xGRLig8U6POIyyQ+yfCPI71ZP0TYb4BaW4sZk/t3TqUKB7031
	 pzr9TZGMs1S9w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD46C982EA;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Sun, 20 Sep 2026 18:25:05 +0800
Subject: [PATCH v2 03/12] soc: amlogic: clk-measure: Support more
 measurement channels
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-more-socs-to-support-clk_measure-v2-3-224382a429e8@amlogic.com>
References: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
In-Reply-To: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789899904; l=1344;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=e2ydz5bLAgoXoKx1id6ARA1Qq/OeV3kWw0wR36wz9Ks=;
 b=0kYDHEMG2Lp7QnH8bZMG7IEpHfqcExl7IxtSh1NJ7/jFnZZd25yFr5rPr/Shj3vXkPwRQToqb
 ToqAllBeLgqDOBiXdUwNPvAWnYcmFcsm3DtvKuF6qferH0spzUEEvv/
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

On S4 and C3, as well as later SoCs, the clk-measure IP expands the
number of supported measurement channels from 128 to 256. Accordingly,
the MSR_CLK_SRC field in the register is extended from 7 bits to 8 bits.

To support both the old and new implementations, the driver now
uniformly defines the valid MSR_CLK_SRC field as bits[27:20].

For SoCs where MSR_CLK_SRC is only 7 bits wide, the driver never sets
bit27, and on those SoCs bit27 is read-only. Therefore, using
bits[27:20] as the unified field definition does not introduce any
behavioral change or compatibility issue for existing SoCs.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/soc/amlogic/meson-clk-measure.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
index 8a1a9fed0e74..0d4ba2555d17 100644
--- a/drivers/soc/amlogic/meson-clk-measure.c
+++ b/drivers/soc/amlogic/meson-clk-measure.c
@@ -20,7 +20,7 @@ static DEFINE_MUTEX(measure_lock);
 #define MSR_CONT		BIT(17) /* continuous measurement */
 #define MSR_INTR		BIT(18) /* interrupts */
 #define MSR_RUN			BIT(19)
-#define MSR_CLK_SRC		GENMASK(26, 20)
+#define MSR_CLK_SRC		GENMASK(27, 20)
 #define MSR_BUSY		BIT(31)
 
 #define MSR_VAL_MASK		GENMASK(15, 0)

-- 
2.42.0



