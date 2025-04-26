Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B9BC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 12:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ckpF9xzISP1UlCRsWHFjPqlWR4vSDlau3t7AGxZrqSI=; b=zp5tAmd9I0lBf8vPyMI9UDL0y6
	jIVxhtZxJ277ElAYMrBbGO6o3sU2A4dFDw9vEDIFnAP3kziGE7CSuFxNub0J/w42fcEepAvYnVfey
	15XnijDh/fjzXkyJbCz3UQE8CLz4HdLk6vd+JT7mA9wlsHfqOS/cNY/l53PautWA2Prll1j/Q4gZH
	0XZZyf4mYuwpIkTvho5cFx4qnQauUZO7eCmlS2YsHHlnBlz0ZpQUG9XOmQhcXhm4EJVEKIS+naNK2
	c/UZV1ws8ObiLCEDMQN1rnXGqxZBULIwqcTiNGpnc5ZXkq2VfHqiq5i/ZgoSCGA5btMBbrKLd4KrM
	I+qSeWTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8elj-000000020Tb-1wGY;
	Sat, 26 Apr 2025 12:36:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8eeL-00000001yyq-0PdQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 12:28:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 395DE68447;
	Sat, 26 Apr 2025 12:28:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADDE8C4CEED;
	Sat, 26 Apr 2025 12:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745670531;
	bh=EKkCWRGnSA74kksAFbA/CeMyR+M2fij+QTBGezXyg3s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pbRoryHKVJlX4wLKFrBiBpeVSOdH5nDKj4OT4yG76HDhoKF4kZc+pl6aiR02CrfuQ
	 WHL87rE5kklsK1qmcLucJ4vorwMtS5UdVLN3PWQ96QslALUKBYcO6BVjswxSvsmoxW
	 nSo+hMSVfo63lCeXz+LNrfeOtHm9mPFWfyS50I9e27pTOU+5FxIStgz9IBlmK1+CX0
	 R1KS8my+3san2loCUe1pR9MyO4zxCPYA0JBk+xeNBoJoZ1XZmd/oURHsMFVZP+bSZV
	 aygdqnG19PC/rxyi4D9sSsY8sRWSCn609kg/Euio1kac7UPUBrO6uL+4u8fxFAL5YI
	 Gr/tRxF0fzcog==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u8eeH-0092VH-FP;
	Sat, 26 Apr 2025 13:28:49 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v3 05/42] arm64: sysreg: Update ID_AA64PFR0_EL1 description
Date: Sat, 26 Apr 2025 13:27:59 +0100
Message-Id: <20250426122836.3341523-6-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250426122836.3341523-1-maz@kernel.org>
References: <20250426122836.3341523-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Add the missing RASv2 description.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index e21e881314a33..bdfc02bd1eb10 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -907,6 +907,7 @@ UnsignedEnum	31:28	RAS
 	0b0000	NI
 	0b0001	IMP
 	0b0010	V1P1
+	0b0011	V2
 EndEnum
 UnsignedEnum	27:24	GIC
 	0b0000	NI
-- 
2.39.2


