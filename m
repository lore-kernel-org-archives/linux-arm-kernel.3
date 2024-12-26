Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D91F1E7718D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 05:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V6NLCR17ypGViL9bUhW6xSOEVx68tYcdJbQF8eDMwQY=; b=C9nmuBqWj0l5pLXzS7+Zr088iB
	IUU/pcuUwiFwyNQIXwp975kMRnmmlnX09hVJVVRPdzIRpW31ZGEX34sWplXaae2PI8A4ejD+LUYAN
	vtUVfPwU3zhuLlze1mpmprIdgncCZTwjZDJKBd8XQS1a6D7UFtvxFZp2+waUXFAEEAwpUef9wiUg5
	2j235rZgBuRNf1zsBXcwtsjQJ+9lAEUH/eMwInJAVb3N2RW5QtV6c9StJQF/2Rir0gYzZRUXpyU2L
	b3X6W390FHIXjJsPHGbA00NhdkZ88618nhl7LdedTwj6eEYv+XDbWqF0ZeKwe6uQhiIgPUl6Z2/j1
	i2CKdbrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQgHq-0000000FBKR-48sX;
	Thu, 26 Dec 2024 05:19:54 +0000
Received: from out-189.mta0.migadu.com ([2001:41d0:1004:224b::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQgAT-0000000F8ie-2SMT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 05:12:23 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1735189934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V6NLCR17ypGViL9bUhW6xSOEVx68tYcdJbQF8eDMwQY=;
	b=OT78zrncr4RxpM6kx5sjFnU7Q45/uRXsN8Nk0KSi0HzOuZNcEnHOzsiZumi4FPEJB4DSVv
	C5A6Mq30CtDBpauWXhVabQWbEK0XxqPGO2F2aCUvyy/b09mxgErtd1lPGZT4pLly3Qlseb
	a2mQHuB85khQBOlwyAW1H8xjo312/uPi00zMbTu2zXc4szznBZ/d3YFeXv5bwMfgd0jnxk
	NNzflsT8sAhofPI8H4mpmfv8TZlmwuz3QWjVZtGedKO+aqW5bljn+qYVprC5xa5j4iTBzF
	GSKJrYaZ0/3XNgbvdH7Sfrv1y+on2pMDVHAaBpvtlF6liRGkK7/9dDDi3fv8MQ==
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Fabien Parent <parent.f@gmail.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH 8/9] rtc: mt6397: add compatible for MT6392 PMIC
Date: Thu, 26 Dec 2024 01:58:08 -0300
Message-ID: <20241226050205.30241-9-val@packett.cool>
In-Reply-To: <20241226050205.30241-1-val@packett.cool>
References: <20241226050205.30241-1-val@packett.cool>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_211217_767076_C3601B07 
X-CRM114-Status: UNSURE (   9.97  )
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

Add a compatible, using the same data as the MT6397.

Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/rtc/rtc-mt6397.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 152699219a2b9..6fe5bff6cf442 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -333,6 +333,7 @@ static const struct mtk_rtc_data mt6397_rtc_data = {
 static const struct of_device_id mt6397_rtc_of_match[] = {
 	{ .compatible = "mediatek,mt6323-rtc", .data = &mt6397_rtc_data },
 	{ .compatible = "mediatek,mt6358-rtc", .data = &mt6358_rtc_data },
+	{ .compatible = "mediatek,mt6392-rtc", .data = &mt6397_rtc_data },
 	{ .compatible = "mediatek,mt6397-rtc", .data = &mt6397_rtc_data },
 	{ }
 };
-- 
2.47.1


