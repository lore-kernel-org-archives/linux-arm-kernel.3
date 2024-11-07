Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0DC2D43370
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 16:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e2VlH/uuBQt3wReNKxARkD7iZtlOIa3l9BKSWUf02Sg=; b=nlsB0OHHMdO0qXziSm20yDfABN
	i3BXb6fmofJqNSbXxzz+093nKojG87zI32izc3a5lxAx/yxaqBDlALPB5HsPDMVIijYpr2Egq9E83
	AyUZ3zwP2J0DGx3R2kwMuFom3oH1gDhgpgttynX2A7G/dJvhfO/UIj9vll3mnznbjwCZiAkZCQNOv
	FhgMdMITmt+irA4ZKactTDCADepraKxh3TgxcXU72OctHAzLb/KRfRCSyfp8mEtZd2qwhYlTPc9gL
	2fME4V2HC3Lj3edeqXLTgD6/SXcweooEPpteHLymjg08onc5VsGDU2mK7EYtDxNMkxg3XKdOYqVrP
	/6FijzQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t94xn-00000007X6L-1es2;
	Thu, 07 Nov 2024 16:02:27 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t94qv-00000007VgF-0mvH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 15:55:22 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7BCI8G020688;
	Thu, 7 Nov 2024 16:55:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=e2VlH/uuBQt3wReNKxARkD
	7iZtlOIa3l9BKSWUf02Sg=; b=aZvDmzmmkAWb2LsThYyhr48PEZCZHYnedSHamC
	3hRGMDbxDFXH7eFajG34rl7pbriqJv8iu3Ee3V+G9FGRrghKAL7Mfjfhz98caEcy
	oXhEk4zq+/qno9QXP58O94nMmK/RXRoVkwb3QrQXx5ZGYGndVBKnDLpww5gLtcUp
	2k9lwAA1XbEqCpI0Yq70zZ3QqjVjfVf/9Rusq/pGurHA+TelsGCu1sxtq3qz9UjA
	g+svF0ysEU0x0g/PasWbPvBqOFz79EdU5f/YUd8IQuqv/i/WG/ha1IPh1VlyN/eO
	b5Zi6UpvUuHZBHY/2qaJo7SoAFMs88vHhDmooQ1SPTTdGVZQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42rra1jm01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 16:55:08 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B01C040049;
	Thu,  7 Nov 2024 16:53:53 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 98C802B6E40;
	Thu,  7 Nov 2024 16:52:00 +0100 (CET)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 7 Nov
 2024 16:52:00 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Olivier Moysan <olivier.moysan@foss.st.com>,
        Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] ASoC: stm32: sai: add stm32mp25 support
Date: Thu, 7 Nov 2024 16:51:40 +0100
Message-ID: <20241107155143.1340523-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.132]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_075521_562466_9DDB7056 
X-CRM114-Status: UNSURE (   7.97  )
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

Update STM32 SAI driver and binding to support STM32MP25 SoCs.

Olivier Moysan (2):
  ASoC: dt-bindings: add stm32mp25 support for sai
  ASoC: stm32: sai: add stm32mp25 support

 .../bindings/sound/st,stm32-sai.yaml          |  26 +++-
 sound/soc/stm/stm32_sai.c                     |  58 +++++--
 sound/soc/stm/stm32_sai.h                     |   6 +
 sound/soc/stm/stm32_sai_sub.c                 | 144 +++++++++++++++++-
 4 files changed, 216 insertions(+), 18 deletions(-)


base-commit: 2fd094b86c8ae266b618359e4154ab94e806a412
-- 
2.25.1


