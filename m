Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C8FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 12:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=POEz9ZZ76Ii4IeKHe2cEf93dOKBtUFvRFL8z41QfOc8=; b=OXNQ92VNP3PA1j/dU88+V7eutt
	BQl7L4eK6OiRQcTRiX3rF4XEwbljU7UqukdVKHb6z96ChhfxVCvHZCx4qYtU0+FPla+8tkedp1/3V
	yyCWEfmJH5P6KCcb1pvpMdTL1r6f58bgYBmpfnWWej1EwEV1XHXoBbqveLJDPjAVVJ0lGXcfKP0a0
	Uf1Tpkl682Lc6nNYvPwqUZFcotSWO/p+nCuw3pEEz9uHzsr8itLACm00CQpfBh6IFv03EbDBzSx08
	3qtfuA5tiTefR6CHfFOfX6esEacwXQp42hUGS5GZYpBadvV8myz+ggbbF0sMJZAiFnFWKlu3bR8/k
	WOPJC9ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWEGY-0000000FIeT-3kHi;
	Fri, 10 Jan 2025 12:37:30 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWEFL-0000000FISO-0JGH;
	Fri, 10 Jan 2025 12:36:16 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50ACNhIM025539;
	Fri, 10 Jan 2025 13:36:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=POEz9ZZ76Ii4IeKHe2cEf9
	3dOKBtUFvRFL8z41QfOc8=; b=lGRZvvZlEkIfVDCwo5HQigQ6+MtzMQHAmRHuY1
	OfttX4SbSvw9CAQVRSNdTGEyW+YZrd5fJR5A3NFbEKQ1sSjVeJojzNB5ouvN9+WU
	bJ3zqKebTHdcWTgdmhUnRx4IeUj20n70Q98GbkQliGb7xgoAS8gHSA7bLP3Y2Iuh
	YM4pYBEo2nyhqNb6wof5z33569+ZouIosHiKEPp9IMjNkDkUkQdgaiLTh+z7jt0c
	QXgxzWStwqgeEJ+bURhj8gSqq66KN/DhwubH2Zhol8aiF+RofHfV3Bt8ua5VsqUQ
	8Hv82bMeaxEhusTb2YUUGNt5DorgsMlC/sV1Z+uO9zLNw+gA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 442mw0k59m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 13:36:06 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 27ED440045;
	Fri, 10 Jan 2025 13:34:48 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 950342A5190;
	Fri, 10 Jan 2025 13:34:14 +0100 (CET)
Received: from localhost (10.129.178.212) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 10 Jan
 2025 13:34:14 +0100
From: Christian Bruel <christian.bruel@foss.st.com>
To: <vkoul@kernel.org>, <kishon@kernel.org>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <p.zabel@pengutronix.de>,
        <linux-phy@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <fabrice.gasnier@foss.st.com>
CC: Christian Bruel <christian.bruel@foss.st.com>
Subject: [PATCH v0 0/1] Optimize tuning values from DT.
Date: Fri, 10 Jan 2025 13:33:55 +0100
Message-ID: <20250110123356.974839-1-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.129.178.212]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_043615_555381_CC94EB7E 
X-CRM114-Status: UNSURE (   6.63  )
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

COMBOPHY thuning parameters was awkwardly refetched from the DT during tuning,
better to fetch them in probe for reuse later and simplify the tuning function.

Christian Bruel (1):
  phy: stm32: Optimize tuning values from DT.

 drivers/phy/st/phy-stm32-combophy.c | 87 +++++++++++++++--------------
 1 file changed, 44 insertions(+), 43 deletions(-)

-- 
2.34.1


