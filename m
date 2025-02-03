Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76862C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 20:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LWJhT5hz7QDG7vo/z0X898ab83vgTOFspO3dSYB6j2w=; b=r+fI0nV6zG42Le
	EeuWEIdXz2bby67WIHJomT94ibgfvX2dwZivQAo6kyh49HCiPD299mb7VOVXiNERhT9Zcph0pToJE
	OxzMsggNnDYrp7dNuIutd5/kdTs/IMZbjAlFQ9UL40i7vQ1hp6QFNGpmYUHyRF+teIpFTIdQSvVYt
	UEKDBS4f61nFMVVUTBor85TNKVNtvGB96I3/NfLTZTFnG5ncnfvvK9RR6q7G959q3gBvZ0W2ZIFCO
	aKfn1ZebdwxhxapP3cZZ2T2x6195vUwdc4VXpOvoin+97YPdXcy3HVzdehVHSpJUxQuolmJg4PR5O
	ylCihqX7OBI7XB4Mx2gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3Cm-0000000GYK6-014I;
	Mon, 03 Feb 2025 20:38:04 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf38p-0000000GXUj-1tv7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 20:34:00 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 07BB225C4E;
	Mon,  3 Feb 2025 21:33:56 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xW169ZtFBn4j; Mon,  3 Feb 2025 21:33:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738614826; bh=FWJKGmTO1BhT1MiHL5e0kCiPS+hW5MQaZ8zl6hlJV+0=;
	h=From:Subject:Date:To:Cc;
	b=eVtMLqzGGzcnF7sS2heeAvCLDWDK/27lYIUlgyY//oHpZr/7yqE65MZmfxmkqMFTI
	 Gp0KNGO2cv1OLR2kap4pmH2JJPHpokPj+DhaOyrTdR+p0ZMXcE9yKw6wfzfi0MwsUB
	 2FOUuvOth/mui72Tdy/qVlg5/7qs1hSp/dRwxopp8L/jls+SOgNi0zlYcdUtQDMHFX
	 Ix4CbhV3365oq8e2hvHvNzHBRGl8AQ4bhsDcfOvTt0sG0n+aqui+n2xuD9LEGBsR6Q
	 ZqPz4qSjnylrCI4IJ84wSA913RkrAECpvPKQI0ZgLDHOZ8ck9Uo2i7VXjbhv4+QGPk
	 TYrILAIi8k7Vw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 0/2] Introduce support for Exynos7870 I2C and HSI2C
Date: Tue, 04 Feb 2025 02:03:31 +0530
Message-Id: <20250204-exynos7870-i2c-v1-0-63d67871ab7e@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABsooWcC/x3MTQqAIBBA4avIrBMmM/u5SrSonGo2GgphSHdPW
 n6L9zJECkwRRpEh0M2RvSuoKwHbubiDJNtiUKhaVNhISo/zses7lKw22WhLA2pDZjVQoivQzuk
 fTvP7fo2EaV1gAAAA
X-Change-ID: 20250203-exynos7870-i2c-34de9046e6b6
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738614819; l=721;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=FWJKGmTO1BhT1MiHL5e0kCiPS+hW5MQaZ8zl6hlJV+0=;
 b=YlZV3Esi4H2FeSHI01RMYDD+85RlpmvRYjnV4eWfYMgPMHfGfwJqV0ywsVEiQP7/sK2GfNVXW
 W4cBPPPQxzZDBKobE9JAg+8BNrOpNZSe3uGYytO8yTtwct7fckpYPE6
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_123359_622474_0B8542A8 
X-CRM114-Status: UNSURE (   7.71  )
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

Document devicetree bindings for I2C and HSI2C drivers for Exynos7870.

This patch series is a part of Exynos7870 upstreaming.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Kaustabh Chakraborty (2):
      dt-bindings: i2c: samsung,s3c2410: add exynos7870-i2c compatible
      dt-bindings: i2c: exynos5: add exynos7870-hsi2c compatible

 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml         | 1 +
 Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: df4b2bbff898227db0c14264ac7edd634e79f755
change-id: 20250203-exynos7870-i2c-34de9046e6b6

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


