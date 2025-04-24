Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D550CC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 10:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fyz2hLp0kO8PERuGySQiIDCnQJ1k8h3nTLge22HZa/M=; b=s/uT57RWjlbpRlgvccM7yUHhcP
	5q/AbSwoRNbwP5+MInFypsZ6Lb1fIrHiVhf8maIsbXDgLy9uovZkhzAhMVfOmyRBaVnIRw+bOwLwT
	1HSSc0/sLdvFFl9YPh0RxnXfTr3mWA62ZQ7wrYhpWPo7Z1R6Yu/b/el2n1aOSVCcD4wP9tU8CR1TO
	AOiQAiShLKL3gjYvF+xm+NnpU2j/uZbLQ0akFMDUyhjAQALdpkLBJ66yGhZWRdjxCkKZTDlHTpUHp
	ItYzwVq3Gm0lztUqA5RJfEbhSOH7bT/HKcerpE6k55NneGV62XX4vvqA8J1hXk2FFoqCsX+saSRw1
	ICilr5KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tim-0000000Deq9-20lP;
	Thu, 24 Apr 2025 10:22:20 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sBx-0000000DOBf-0J8u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 08:44:22 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53O8iHxt1804359
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 03:44:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745484257;
	bh=Fyz2hLp0kO8PERuGySQiIDCnQJ1k8h3nTLge22HZa/M=;
	h=From:To:CC:Subject:Date;
	b=cFWJteYkuWICbpORuoaPplMtS9sQaDXZE6qvCNnKlIapT3O9DJJtUwN6E7B/ta8co
	 GOlm1ROx5FIDfwzHTQsxZzLCEVC/pkiukbpLSAOHt7JXGKjlcmmTOvw16eHTaAVOym
	 9C8/ObxKbAUgxLzt7uUL9aU6yfjVbBrJAw3ZQ+g0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53O8iHXr019801
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Apr 2025 03:44:17 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 24
 Apr 2025 03:44:16 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 24 Apr 2025 03:44:16 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.182])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53O8iFBu058367;
	Thu, 24 Apr 2025 03:44:16 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <u-kumar1@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devarsht@ti.com>,
        <j-choudhary@ti.com>
Subject: [PATCH 0/4] Add global CMA areas for few TI SoCs
Date: Thu, 24 Apr 2025 14:14:11 +0530
Message-ID: <20250424084415.66457-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_014421_156985_7A6D675B 
X-CRM114-Status: UNSURE (   7.37  )
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

Hello All,

Following AM62* platforms[0], this patches add global CMA reserve area for:
- J721S2-EVM (1056 MiB)
- J784S4-EVM (1920 MiB)
- AM68-SK (1008 MiB)
- AM69-SK (1904 MiB)

These SoCs does not have MMU and hence they require contiguous memory
pool to support various multimedia usecase.

The calculation was done considering H264 codec requirements, dual-display
supported in each platforms and multicamera use-cases.
Additional buffer was kept for other peripheral s and to account for
fragmentation.
The breakdown is mentioned in each commit message.

[0]: https://lore.kernel.org/all/20240613150902.2173582-1-devarsht@ti.com/

Jayesh Choudhary (4):
  arm64: dts: ti: k3-j721s2-som-p0: Reserve 1056MiB of global CMA
  arm64: dts: ti: k3-j784s4-j742s2-evm-common: Reserve 1920MiB of global
    CMA
  arm64: dts: ti: k3-am68-sk-som: Reserve 1008MiB of global CMA
  arm64: dts: ti: k3-am69-sk: Reserve 1904MiB of global CMA

 arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi              | 8 ++++++++
 arch/arm64/boot/dts/ti/k3-am69-sk.dts                   | 8 ++++++++
 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi            | 8 ++++++++
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi | 8 ++++++++
 4 files changed, 32 insertions(+)

-- 
2.34.1


