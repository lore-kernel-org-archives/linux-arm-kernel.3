Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BF3C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 11:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8JFavAtgsloXzh/GLkUVm+0T2OM9EjBVwK5Uur8DR5U=; b=C7AZNLL/L0lcNxZpZXpTgBOMLj
	AKqtpQRZL7rHxYkazY29Wd7R4JyvG4WKIU8w9imLatdhClP1I+w7w+ZQA6Oh1XMznDw+wyDMy4txt
	3pFVzo9jIZSKI6vzp7+HJTMjoovvTi14fPJriyNOFVLBznl0UhSjjxosPfGKWqvfuklEz/1lW9oe6
	EGRnBEIIXsYyjcOtIqmUr5uIRHsyH4Rc7m2iHyhQie/DzpYsiYJ3wFmi8m4QuWqd3+i2eL7VYDL39
	By3nU6Td9ygQwnu5VsTzHn1rAetNPxHrLtfoEZllUi4GSxXk1F6GuGuFTEzXuvvmTeHrOSZltESjE
	QWroWS1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u27Bp-00000003r5y-1Yt4;
	Tue, 08 Apr 2025 11:32:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26Y7-00000003kEb-32hN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 10:51:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5ED16A4391D;
	Tue,  8 Apr 2025 10:45:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABACAC4CEEC;
	Tue,  8 Apr 2025 10:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744109482;
	bh=aABGEIrWEsGcFFHRxubhJftIId76X0k2qcZSdwnplek=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RvsNNxRYx8hl2H8vVr6dYtg/DVIBjG4wppMV7ADcrrQU2V0F5PAW2DVEUBP0WZYFW
	 fvauJoAxLLj94F6myogejoqESUqFI/qHbRUfVxwkk3SvppKejErXGmVS/LvUILm1PK
	 73MC0pTsyLYaAlc4ED23L7JW8McYqv8TnM0wpDPo3hOmYMOKPWbFl5nzalFc7wzxGj
	 d2WN92oTkpFzGjzKhTgtuXZhQv2X2/Z0halB0D1amvs3bqho9nAV90YEFefEkf4FfA
	 HlKZkydDIEfHnSPXgYb1BWecy2nFA0viHXopm6M6SmwYZ0dXxmY7rDlo81wCA6X4Xd
	 bgaIDOelYJcwA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 08 Apr 2025 12:50:08 +0200
Subject: [PATCH 09/24] arm64/sysreg: Add ICC_CR0_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gicv5-host-v1-9-1f26db465f8d@kernel.org>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
In-Reply-To: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_035123_830750_FDCE5505 
X-CRM114-Status: UNSURE (   8.04  )
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

Add ICC_CR0_EL1 register description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 7acad93718c56729ce2a333ed007243ec554dbc9..c96243505031ea680c04a693fee2c96ad19e30ea 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2798,6 +2798,14 @@ Res0	14:12
 Field	11:0	AFFINITY
 EndSysreg
 
+Sysreg	ICC_CR0_EL1	3	1	12	0	1
+Res0	63:39
+Field	38	PID
+Field	37:32	IPPT
+Res0	31:1
+Field	0	EN
+EndSysreg
+
 Sysreg	CSSELR_EL1	3	2	0	0	0
 Res0	63:5
 Field	4	TnD

-- 
2.48.0


