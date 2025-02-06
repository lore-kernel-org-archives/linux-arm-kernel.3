Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849BEC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 09:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n1wz6KRTg5DPLq/LpHJTBKLZg67NKVlvbqSY8YffbdQ=; b=RY8Y0MiWk/3YmaXUUPhjkYaRzS
	LJAgFPjcWdyn7outigVxy2+bG8U1p2t9070kDTtLScXZGF/bjgare5OPAy0p/Xzia4Moqw5RsMQ79
	2RkjM4qJCZKf3ShW9zRHE1hLc1dXfcQyXDXc0L+TCm+IvjX1ZeNFP5wytnFB2WoVCRbsU4AxpPNTS
	VA6GZTNixrGrH1RLEgSQ2b1T/VypyNwd9hVgwo0+2fWxVL0f/gDRoILMhAEP5lFQ7B0VAlQvV9rRc
	uOjB5AWT6P1CaioFqZQfE9C/+PTHw8+8sWxBb0op2uBzAJZ2+4QG1G/qMj7RM8scOlOf4yL84TFZe
	SznyG5iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfy9u-00000005pWd-2B0N;
	Thu, 06 Feb 2025 09:26:54 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfy5j-00000005ov0-0vtn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 09:22:36 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5169Ldqs2704578
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Feb 2025 03:21:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738833699;
	bh=n1wz6KRTg5DPLq/LpHJTBKLZg67NKVlvbqSY8YffbdQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=WcuqHpJjFMlGLY/+yNA5lxAKM8eRRrhsgdrlHx7vscwKbLqrpm8ku4iRJw4Ri58z3
	 NtGM4AAJgchtuGlVOxc7RQjYh0Jx7M4IU9+ligBM/tqLrMnu65G4dubDyi6FwfI1dT
	 0BPr+yhYMvufrxxVSw9JiRZ6I371TazgT4F+qHGk=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5169LdiM084371
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Feb 2025 03:21:39 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Feb 2025 03:21:39 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Feb 2025 03:21:39 -0600
Received: from pratham-Workstation-PC (pratham-workstation-pc.dhcp.ti.com [172.24.227.40])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5169Lb5Y129767;
	Thu, 6 Feb 2025 03:21:38 -0600
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
Subject: [PATCH RFC DONOTMERGE 3/3] arm64: defconfig: enable DTHE V2 module
Date: Thu, 6 Feb 2025 14:44:32 +0530
Message-ID: <20250206-dthe-v2-aes-v1-3-1e86cf683928@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250206-dthe-v2-aes-v1-0-1e86cf683928@ti.com>
References: <20250206-dthe-v2-aes-v1-0-1e86cf683928@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_012235_305117_4A3D8A07 
X-CRM114-Status: UNSURE (   9.07  )
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

Enabling the TI DTHE V2 module to be built for K3 devices.

Signed-off-by: T Pratham <t-pratham@ti.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c62831e6158633f07c1f3532fba62f09b31e7448..f10b926e1321943f02376f8ff8472e0a01628d27 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1711,6 +1711,7 @@ CONFIG_CRYPTO_DEV_HISI_ZIP=m
 CONFIG_CRYPTO_DEV_HISI_HPRE=m
 CONFIG_CRYPTO_DEV_HISI_TRNG=m
 CONFIG_CRYPTO_DEV_SA2UL=m
+CONFIG_CRYPTO_DEV_TI_DTHE_V2=m
 CONFIG_DMA_RESTRICTED_POOL=y
 CONFIG_CMA_SIZE_MBYTES=32
 CONFIG_PRINTK_TIME=y

-- 
2.34.1


