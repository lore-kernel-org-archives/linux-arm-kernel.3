Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE5DD4336D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 14:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lgjTU7mFnOg/SBXD0HtS+zUHuNPPBH2haMWI1pZhhns=; b=R2tJTw+TlJcEdAsj/UACEIEpLw
	VNrNp8+Cnz6ZqbbBf/cBxxzi7VVSU+LFWtrkXmAOdqrjnotTnxskbbnAeC2/EDudSG6Dcs71mhs3y
	HeEMsgG31BJkmNbngHYQp/Z58m0GVwxkTpuKG7BNItor3FemlY89BtMIw8kKvLxvEXdVHs1YK4eQH
	uMw0y6UK30J3b4nJuRaGhirdBDcGWfFLkJxc7mv2kgpbUZwga2hqBzWdOfrxCYna7/ZtJcgHBkoRA
	PvjcVY9WHBZgrgVkQN8zl9xRKSIcYGqySyLN1IBdJ5n1R3bDLS1qUm6bcnjGGddCHr0lN0dRGr/Ot
	M3obSiPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t93uM-00000007LmK-0zWv;
	Thu, 07 Nov 2024 14:54:50 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t93pu-00000007Kot-10zq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 14:50:15 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7BUge3024535;
	Thu, 7 Nov 2024 15:50:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=lgjTU7mFnOg/SBXD0HtS+z
	UHuNPPBH2haMWI1pZhhns=; b=HgnlWPA96eHXz3S4FZAHm3+T+EFIJmDLiRoMcv
	NmgrgaaUPXqqzaz0hQrQAFAKaZEtSp9VDEaGS7T3X+UohfzQSk5fmMCg5yV+72zw
	524zAgOu6ukTT9FY/kBIuUu27QuvHUCILUlfC1x8dy/bNOWz8Bs3bxObxrkHPaNZ
	WzUAWpNB0blG4IwYsUQBpOQW1mAB/+4w/HD2UWalKiIo4pP80bMqutcYpLkeuk7e
	P/MSgVhQwup0QfFzJYc0RKlFRJCPh/TPuEbfZuQcswD9ihocbwOPfydG8LJNEiNn
	EloRXtEn7tFkkx18ZXbYQIqmJ/GSMxJdofbE/DD9t9hS+3BA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42nd05q0mn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 15:50:08 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5CFD84002D;
	Thu,  7 Nov 2024 15:48:29 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7D3482BA0A7;
	Thu,  7 Nov 2024 15:47:36 +0100 (CET)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 7 Nov
 2024 15:47:36 +0100
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
Subject: [PATCH v2 0/2] ASoC: stm32: i2s: add stm32mp25 support
Date: Thu, 7 Nov 2024 15:47:10 +0100
Message-ID: <20241107144712.1305638-1-olivier.moysan@foss.st.com>
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
X-CRM114-CacheID: sfid-20241107_065014_610722_FE29F36F 
X-CRM114-Status: UNSURE (   8.55  )
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

Update STM32 I2S driver and binding to support STM32MP25 SoCs.

Changes in v2:
- Rearrange clocks and clock-names ranges depending on compatible.

Olivier Moysan (2):
  ASoC: dt-bindings: add stm32mp25 support for i2s
  ASoC: stm32: i2s: add stm32mp25 support

 .../bindings/sound/st,stm32-i2s.yaml          |  36 ++-
 sound/soc/stm/stm32_i2s.c                     | 211 ++++++++++++++++--
 2 files changed, 222 insertions(+), 25 deletions(-)


base-commit: 2fd094b86c8ae266b618359e4154ab94e806a412
-- 
2.25.1


