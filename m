Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FB5C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 09:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q/hPjfrmBqGxLdAhschBZsF6fpecnKff2pCdRQJEkKM=; b=enbZKUhNoY/nXEncx2fXnGZw8W
	GIjMUo8TDvTsLQ9m5S+TUPbDTnBQ/4eAXH3tBkJKscW01Tfi6MmRc5ul6OZnNfYIcEXog1vjflI0L
	oDChd/G7cOyNm3JCkvDvVZbJ5QV2M5M/F+E3NFm8855d3emQy4a58nQzguxDb5+CuKQ7izPH3uEfv
	QWnwHW5ynmbujOaJWOn8aMhdljQuHEK4hcFRTZcKUqRO+f/Ee7eSmCCqW8H8GxTwc3z0Dksfuecqp
	rlwukzR3Ausbjy2LXv5VHczWmH0kH14iMWxKl2jHcaA6u7KX2FI9BdpcB4gMz1iuLe9ER/rH+wCoy
	y5Nr9pqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfy5t-00000005oxF-2Nn3;
	Thu, 06 Feb 2025 09:22:45 +0000
Received: from [198.47.19.245] (helo=fllvem-ot03.ext.ti.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfy4V-00000005oks-2yMl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 09:21:21 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5169L0aC3525872
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Feb 2025 03:21:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738833660;
	bh=q/hPjfrmBqGxLdAhschBZsF6fpecnKff2pCdRQJEkKM=;
	h=From:To:CC:Subject:Date;
	b=Y6TbVl68Ibizx7RIPtSmeC2N5R5Ca8bfs0aZA6vbn+xXBwzktXlVw6FOsDTT8Qyad
	 4pHlKzcpa0THLDN/zhVELahIhrlyvPmP7MjgWFeXArRROceIO+mfuobxH7JSYe4Dz9
	 u/lRyJ3izAzRLzxh33gElIbE+ADzMkpa6N3hAE2Q=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5169L0Ul007091
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Feb 2025 03:21:00 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Feb 2025 03:20:59 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Feb 2025 03:20:59 -0600
Received: from pratham-Workstation-PC (pratham-workstation-pc.dhcp.ti.com [172.24.227.40])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5169Kwr3009086;
	Thu, 6 Feb 2025 03:20:59 -0600
From: T Pratham <t-pratham@ti.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller"
	<davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: T Pratham <t-pratham@ti.com>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Kamlesh Gurudasani
	<kamlesh@ti.com>,
        Manorit Chawdhry <m-chawdhry@ti.com>
Subject: [PATCH RFC 0/3] Add support for Texas Instruments DTHE V2 crypto accelerator
Date: Thu, 6 Feb 2025 14:44:29 +0530
Message-ID: <20250206-dthe-v2-aes-v1-0-1e86cf683928@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250205-dthe-v2-aes-80ea2dd58185
X-Mailer: b4 0.14.2
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_012120_036795_338BD916 
X-CRM114-Status: GOOD (  10.07  )
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

This adds support for TI DTHE V2 crypto accelerator. DTHE V2 is a new
crypto accelerator which contains multiple crypto IPs.
This series implements support for ECB and CBC modes of the AES Engine
of DTHE, using skcipher APIs of the kernel.

Tested with:
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
CONFIG_CRYPTO_MANAGER_EXTAR_TESTS=y

and tcrypt,
sudo modprobe tcrypt mode=500 sec=1

Signed-off-by: T Pratham <t-pratham@ti.com>
---
T Pratham (3):
      dt-bindings: crypto: Add binding for TI DTHE V2 driver
      crypto: ti: Add driver for DTHE V2 AES Engine (ECB, CBC)
      arm64: defconfig: enable DTHE V2 module

 .../devicetree/bindings/crypto/ti,dthev2.yaml      |  50 ++
 MAINTAINERS                                        |   7 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/crypto/Kconfig                             |   1 +
 drivers/crypto/Makefile                            |   1 +
 drivers/crypto/ti/Kconfig                          |  11 +
 drivers/crypto/ti/Makefile                         |   1 +
 drivers/crypto/ti/dthev2.c                         | 749 +++++++++++++++++++++
 8 files changed, 821 insertions(+)
---
base-commit: 9d4f8e54cef2c42e23ef258833dbd06a1eaff89b
change-id: 20250205-dthe-v2-aes-80ea2dd58185

Best regards,
-- 
T Pratham <t-pratham@ti.com>


