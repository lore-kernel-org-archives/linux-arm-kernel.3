Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F2CC3601A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 12:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Von8b2NXYZkvBjVDvYrnhAS11Wz/rmPhDLEso1JFGD8=; b=JqxMrvRrzvq2NNwjl0IGSJpGpe
	RNG5um+yZLPbRZBWQGP99qnjYdthYIlg3rmsYSGWIUIFj52zsp+f3O8tJOuWFRwNR/WRTrZ1+FC18
	PG/JUkdTa4EkgfkYq+oRiq4gfuf2lxXGn6pmfOtC5O6isB0VPxd7T5KHWFD+4PyHTV0icI9pfWgCR
	vjURvvi6rqmWKMYwpDNVJPXKonjouZ3Wkdl4Ykzqai93e8O7zOt6phSMNbbVXL8i2AjQf9gM2ug30
	EA/SFxIQZ8XKvdBoM69IqbGLETtSn3QWS7iDT0ycMTnNrWta1FRxSmaYU8sEjXMCs1MEDV3fh+FLH
	S9jeOSww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0JpL-00000008pyT-2q5v;
	Thu, 03 Apr 2025 12:37:47 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0JiG-00000008p2z-1Je2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 12:30:30 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533BPk0D024168;
	Thu, 3 Apr 2025 14:30:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=Von8b2NXYZkvBjVDvYrnhA
	S11Wz/rmPhDLEso1JFGD8=; b=7MZU4EmFiq0v96ExZQ1gVFyPx9cBkUF/xFf3SD
	CMpkWWEXlqYGH6hy5XOBlvYtUmxXNYBz9fRiKON4qj4TrsoCVa/f59cf40HA00xP
	gYbOIx+EhPHxk73lZ80AfWQE8Q4IgjaehUnaMTaVZMIjVWTt2bdV000oXiSDz4Og
	e+FoxM00NzCSMlAJWZBRZvS/MIRlCBkCC3x77kM5nM9wNFpF7uWemvgmsKR/cqjv
	Mhe6olkO439rjpENRsCQ1HSHH9ZncnLEUAipEpHjMVj7yD/1y1PFNJ/F8NKv1ZcX
	Mmw2e2TnJpgYxsYfpjizVWAsec81hpm4w0xaXYdZiMYMveEA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45s2c7eeya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 14:30:11 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 52ED740048;
	Thu,  3 Apr 2025 14:29:05 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 303088EEC9C;
	Thu,  3 Apr 2025 14:28:26 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 14:28:25 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <maz@kernel.org>, <tglx@linutronix.de>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Christian Bruel <christian.bruel@foss.st.com>
Subject: [PATCH 0/3] Add ST STM32MP2 GICv2 quirk for EOI split mode
Date: Thu, 3 Apr 2025 14:28:02 +0200
Message-ID: <20250403122805.1574086-1-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_05,2025-04-02_03,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_053028_664203_D7E5A230 
X-CRM114-Status: UNSURE (   9.06  )
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

When using GIC EOI split mode, GICC_DIR fails to deactivate the interrupt,
leading to a WFI freeze. On ST MP2, GIC cpu interface is limitted to 4K,
thus GICC_DIR register is reachable with a 0x10000 remapping

When using GIC EOI split mode, the GICC_DIR fails to deactivate the
interrupt, causing core freeze on WFI. On the ST MP2, the GIC CPU interface
is limited to 4K, so the GICC_DIR register can be accessed remapping the
register to a 0x10000 offset.

Christian Bruel (3):
  dt-bindings: interrupt-controller: arm,gic: Add
    st,stm32mp2-cortex-a7-gic
  irqchip/gic: Use 0x10000 offset to access GICC_DIR
  arm64: dts: st: add st,stm32mp2-cortex-a7-gic in intc node in
    stm32mp251.dtsi

 .../interrupt-controller/arm,gic.yaml         |  1 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |  2 +-
 drivers/irqchip/irq-gic.c                     | 47 ++++++++++++++++++-
 3 files changed, 48 insertions(+), 2 deletions(-)

-- 
2.34.1


