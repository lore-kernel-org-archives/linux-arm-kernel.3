Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9632FD59F41
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 15:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QbyN14rz0QK0IY3T2SnPN8Jeg7AV51TUAEGYh14mf/E=; b=UvmFUt1dWpVDv/Wy0DteHk0EpN
	IUNQSOGrjqtXzhXXDivUl027FaZhlLp9fLoD1BbvK4cP70+nMZ9JuRA3Zsqp/aWlYLKnxd/7ZYUlP
	jT6Sx5RVJOFuqI4opVNgUZmsZa6bt/yYxlMXezOUX14UDcL6xd05spjZb8K6KAPGZse8eHeYJoVhC
	6KnUCZ5IHhKdow4glMU7b0cW8iv0xRwE3+unntn6wsNTEPtWNKsvr4uTWdjNtB5ba1sNCkXnFhEOD
	fwWWl80s7ozxNf6PvrnDll0qB0ETOGfrfktu6MYR5PNQkNB5UQYj8YjUwp7L8flXTaCHhbrYVx5hz
	WW0HU4Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8i35-00000003pwn-1qA1;
	Wed, 06 Nov 2024 15:34:23 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8hxw-00000003oar-0jiz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 15:29:05 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6Chj0j006298;
	Wed, 6 Nov 2024 16:28:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=QbyN14rz0QK0IY3T2SnPN8
	Jeg7AV51TUAEGYh14mf/E=; b=4EP93/3Pn93384e/6EBLV188xYzgwlPOylMd51
	SKet9fLKECn12GwR0ubfuEAqApVRN8PJ4LXYlBSF6GHR0mnY/gAp0muOo24s9Qo7
	Q3i84Vc+OQc71fHORn43ymO7DNezBAkKzeBgxFPuT0svC5yuNhyuulT+XQNkVgfX
	mCmdua+peCWD9MIezMiQ6iyzaMVo+niQSdwTijBb/DKaBoQ4GJqIf6swDByczTqx
	A5TFU9WJDL00linAa651RnijRjqkfHRfo8ynwfv+tlqTOXGwAR5izyqHw5BQmCjj
	ALTCzveNjW5cH5B1peimIEmHFvxOq/SbzffZzlZp7nSZwEJA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42r8qfgrtr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 16:28:55 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 66FD740046;
	Wed,  6 Nov 2024 16:27:41 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6CF2E26553F;
	Wed,  6 Nov 2024 16:25:34 +0100 (CET)
Received: from localhost (10.252.15.15) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 6 Nov
 2024 16:25:34 +0100
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
Subject: [PATCH 0/2] ASoC: stm32: i2s: add stm32mp25 support
Date: Wed, 6 Nov 2024 16:25:26 +0100
Message-ID: <20241106152528.939232-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.15.15]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_072904_532544_0E8B3D43 
X-CRM114-Status: UNSURE (   8.33  )
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

Olivier Moysan (2):
  ASoC: dt-bindings: add stm32mp25 support for i2s
  ASoC: stm32: i2s: add stm32mp25 support

 .../bindings/sound/st,stm32-i2s.yaml          |  60 +++--
 sound/soc/stm/stm32_i2s.c                     | 211 ++++++++++++++++--
 2 files changed, 236 insertions(+), 35 deletions(-)


base-commit: a18dadd1209acb6d2fc22eb13873ec987ebcb77a
-- 
2.25.1


