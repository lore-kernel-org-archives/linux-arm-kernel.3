Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9992C02181
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jan 2025 15:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e1YAOupS3DDwbJHXuL4JJqA2JN8rpbMDdS4e8GUpfcQ=; b=K023JCR8w8qevSt6/ZCWKiX36r
	9oxVoB0vzR0wCiHfrKq1DzCu5YAkGx+o/8dtkf68Wivj7D+MrLPlf7FF0yzlbEJVsaOvKc84W4lPw
	q6k9MetgiCWVzRoG3XmcUWNNGI0WlXOASHYU6PuDkp3wZqg04kBrsg7LtuH9I3gzXZN88NTiIjgeq
	u4kJrTNF+i5W77gNxtNZgE1A9WkWscIy/Sn8+yqhkwYYkmJeqpNPfBb0NRC2MMoHvJQP0On+3NtKe
	X5klhmaQJd1gOUyRIexHelo/evwxiMt58cJhqASk6yfE4np4xsFE8PyV2vExqbyovDMtIfZ6A+2lw
	usrHedMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tc4Ak-0000000HXe9-3zU5;
	Sun, 26 Jan 2025 15:03:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tc49T-0000000HXPn-3qsj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jan 2025 15:02:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 319065C6075;
	Sun, 26 Jan 2025 15:01:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A86C4CEE2;
	Sun, 26 Jan 2025 15:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737903739;
	bh=WUU5DtfN0aE3KW7oIl1FfUVR1fU5tIs7Hrz0gwxCS5g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ce1MNI1PLYVyNKJ0go8W451GqVE9rAdc3z2sWS4h85qoOLaPiU0xrcdU5VMPAg1/N
	 6ju4IzmuUvc4yjE/ziEgO1Cqw4Icfzb74cEImxWA8Q7YbdY+LEG0hv7t5Qa1CDsSOC
	 YsOSl4NABTTHLR3lucjnm7TzCrOUiBu9mLjWanqAk47/YKEHPl+DN6MaCLs4XboZZ9
	 OKKw4zSwNm3Cj/wGA9YM46VRzmv4fYqHzsBCzIWY0Sl9ocNfjDPzuX23nPujAeLQ07
	 VdD4B6JJSfZsd8ztedQYFkC94fhQt+lsAak7bsig3O1vq2W+6dD8yrL5oreYG0PWmv
	 bjWX2Iw1Hg09w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	shawnguo@kernel.org,
	imx@lists.linux.dev,
	linux-mmc@vger.kernel.org,
	s32@nxp.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 04/29] mmc: sdhci-esdhc-imx: enable 'SDHCI_QUIRK_NO_LED' quirk for S32G
Date: Sun, 26 Jan 2025 10:01:45 -0500
Message-Id: <20250126150210.955385-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126150210.955385-1-sashal@kernel.org>
References: <20250126150210.955385-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.11
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_070219_995381_0DF2A208 
X-CRM114-Status: UNSURE (   9.43  )
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

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

[ Upstream commit 0202dfbdc5dea70e213205aa42ab49a1a08aad3a ]

Enable SDHCI_QUIRK_NO_LED quirk for S32G2/S32G3 variants as the controller
does not have a LED signal line.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Haibo Chen <haibo.chen@nxp.com>
Message-ID: <20241125083357.1041949-1-ciprianmarian.costea@oss.nxp.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/mmc/host/sdhci-esdhc-imx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index ef3a44f2dff16..d84aa20f03589 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -303,6 +303,7 @@ static struct esdhc_soc_data usdhc_s32g2_data = {
 			| ESDHC_FLAG_HAVE_CAP1 | ESDHC_FLAG_HS200
 			| ESDHC_FLAG_HS400 | ESDHC_FLAG_HS400_ES
 			| ESDHC_FLAG_SKIP_ERR004536 | ESDHC_FLAG_SKIP_CD_WAKE,
+	.quirks = SDHCI_QUIRK_NO_LED,
 };
 
 static struct esdhc_soc_data usdhc_imx7ulp_data = {
-- 
2.39.5


