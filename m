Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C46D32D9F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 12:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yy4PybiVlNbq7dsGXxtyTPs9DF2nDGpUaK/GmkktZNs=; b=2/3bP9ma556toJi0UYLVsJVPtk
	8EjPwiXTgOebj6lk9zk19GY7ypt+cmkZgwWkV4z3MC6luezxaPTH5d57sT1FPW40cdpSttYXUtI4U
	+FhCznBrl6hn3/gzm9arvddD7lQmZ5hJMDumTAYY7gvrlP6m0P7umIjMegPeILP+D9M8gK7gDEhuk
	m0CPwmgJxvDaOcIR32gw3UvjkogZApCoZSZ/lvRvO0Nap8PdXRXAnye54q+AFkeWvu3U4GcMSNSgs
	ltqtIANnuThfK8JrN0DHd5+lV4R+G3d0VHs38RakI67pkNN6y9tw96+SFZLORe2huh99Tv/0Q2GIC
	q18/tvZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAq30-00000003Ovh-46PT;
	Tue, 12 Nov 2024 12:31:06 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tApW5-00000003JPB-30QL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 11:57:08 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4ACButEs086213;
	Tue, 12 Nov 2024 05:56:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731412615;
	bh=yy4PybiVlNbq7dsGXxtyTPs9DF2nDGpUaK/GmkktZNs=;
	h=From:To:CC:Subject:Date;
	b=nn8BqYV0bvXkCGlmWFENXgHMDHBTz6IK9EGjlU2TqKRCX9qa1FT4vSfOZ4NVENNQh
	 C0/vbUsKHI/CNBQAEbiF/C+Sfy0XRju3iPnX3QiTZoAxrn/AwYohedVoeF7zx2IN81
	 DVw5HO9nMMGX8/YwSss38pI7aGuIr6d2QkxD8fdk=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4ACBusPU016210
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 12 Nov 2024 05:56:54 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 12
 Nov 2024 05:56:54 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 12 Nov 2024 05:56:54 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4ACBuo5S116685;
	Tue, 12 Nov 2024 05:56:51 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 0/2] Add Deep Sleep pinmux macros for TI's K3 SoCs
Date: Tue, 12 Nov 2024 17:26:48 +0530
Message-ID: <20241112115650.988943-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_035707_400395_68DE2D37 
X-CRM114-Status: UNSURE (   8.98  )
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

Hello,

This series introduces deep sleep macros which are common to TI's K3
SoCs and can be used to configure the behavior of SoC pins during Deep
Sleep mode. Additionally, support for SoC wakeup with USB1 on AM62x
based SoCs is added with the help of the newly introduced deep sleep
macros.

Series is based on linux-next tagged next-20241112.

Regards,
Siddharth.

Siddharth Vadapalli (2):
  arm64: dts: ti: k3-pinctrl: Introduce deep sleep macros
  arm64: dts: ti: k3-am62x-sk-common: Support SoC wakeup using USB1
    wakeup

 .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi |  2 +-
 arch/arm64/boot/dts/ti/k3-pinctrl.h           | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)

-- 
2.40.1


