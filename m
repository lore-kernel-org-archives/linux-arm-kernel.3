Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57098C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 17:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aG0pL2OVGY0Hzli2z3vyxFT0bTfI27PE+mrGr61jjqQ=; b=MFnSelTm/cL1llYAKnjV4nHZR1
	2uhfTN0xNnQCyLkWFgdBXiGCm5Zur2WSnpaISe/AlDEvAtIze5mt/BOwBajLL1V8spVsV3Ri7AfLI
	A38EvM4y8Oi00sTtqP9Re3WvJ8JJxx/1GAyxEIm4ta8d9jKLFDbKWP6hQXr+ZFUJDQicqzmaE1vB9
	tgnywTjaGcqwUSrMpUrbS5wcJ1TI8W2c53OgB/LhfgNEhpT8LSZcnifRS4KgqcTL2iSYThhwWLJEE
	P76nEs3WwAAWVdpdzoxjtG7sm5eIq1Krn9mL1bREtEuriyurH1YZSRu87bRkLWl7CA6SEP6F1d0vx
	SFyQN4LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP2kT-00000007cnb-1Zgs;
	Tue, 10 Jun 2025 17:26:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP025-000000078SS-2bsm
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 14:32:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=aG0pL2OVGY0Hzli2z3vyxFT0bTfI27PE+mrGr61jjqQ=; b=LuXIiILIzcR2dPmRi8iYrpOYQr
	C3k2fINN6gGjc6Tn4ZDP3q3ugtM8Adf0PGeYwox56pJ/IxR0baaSyZJkF1eQTIrLeBuLYYaRrNI61
	aARnqsfXTZd3NKrxkW7y9ZdFNgIwvONuN4HOun4TFcr3CxJIQ3oVMyGJerc4jY58GjF4Wy7hb0IJD
	gGsuUTLxLdK17rnZ/SsqIgw3NndA2TLH0FIh6JlZYgu6S83KN/wycVVCT3gNfrd+HPrA1wZWnX0OX
	xRrM9RS2bN+YVBg7VX+ZIgGsyj2vseKJCCXGtnMiOd2agojjkRYAVjOC6Gef12tODudpHhNyXdxow
	Tk0kYzow==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP023-00000001sUj-0BUd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 14:32:57 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLOPl020944;
	Tue, 10 Jun 2025 16:32:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	aG0pL2OVGY0Hzli2z3vyxFT0bTfI27PE+mrGr61jjqQ=; b=QB6LI3p2qxGS5ZVi
	r+J2dp0cx+LqbLrjG/rCcyK76DCtiuzTfBORFbW4sCc6qXzT98EnMmHVVI7Dc5bW
	6Hp42pZDO67AUlolp70XVg3wBJADijRYS9vG3D8/CgkKiMSiT+y3GArUW1um4p/L
	smfl5a6TNBuTrDvxE30OyNspTNXs5FezOo8kCahrahlD+MccYqmZR97vgAfF/vqY
	VtaLPRKd1408YbjHGGhHZuOhaoOHLfeDOKpUMtTGpcmIaeJUs+7FeqJ+hFyPuGRO
	K6kq3Wtgdx7/1ps2iprO+4KMg3SLbaJ78teUab5lBpu42vO+FzCNjHg9JTyPpzdC
	sGVJvg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474aja4vu0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 16:32:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 649F3400CC;
	Tue, 10 Jun 2025 16:31:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0E3C0B4FF52;
	Tue, 10 Jun 2025 16:30:49 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 16:30:48 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?=
	<clement.legoffic@foss.st.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v2 5/5] MAINTAINERS: Add entry for STM32 pinctrl drivers and documentation
Date: Tue, 10 Jun 2025 16:30:42 +0200
Message-ID: <20250610143042.295376-6-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610143042.295376-1-antonio.borneo@foss.st.com>
References: <20250610143042.295376-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.132]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_153255_478833_14C92BE8 
X-CRM114-Status: GOOD (  10.77  )
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

Add an entry to make myself a maintainer of STM32 pinctrl drivers
and documentation.
Exclude the HDP driver, already covered by another maintainer.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a92290fffa163..13b1226cc4b9e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23471,6 +23471,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/memory-controllers/st,stm32mp25-omm.yaml
 F:	drivers/memory/stm32_omm.c
 
+ST STM32 PINCTRL DRIVER
+M:	Antonio Borneo <antonio.borneo@foss.st.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+F:	drivers/pinctrl/stm32/
+F:	include/dt-bindings/pinctrl/stm32-pinfunc.h
+X:	drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
+
 ST STM32 SPI DRIVER
 M:	Alain Volmat <alain.volmat@foss.st.com>
 L:	linux-spi@vger.kernel.org
-- 
2.34.1


