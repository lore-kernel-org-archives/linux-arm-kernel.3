Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE07CFA446
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 15:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kP/4QjaSwOHzPcbogUVrOtqHP6WVu5eruQT3V4D8OdY=; b=CVACrCBSvSayzvRjb4xHPKO0Yb
	7kqQ9ga3px89esSWCoFSs84dJyTe1lfrNYYL8Z8C9LI1AZLf+q8Jj/pctZnEOfV7cxE4Wlt6b6ROA
	oqI67TjEcJpOUCkCpe5g5ukmBSCTnLRs86Rb8Q2TYu9F13z5BKfzrpWxNoPDSNUyxEsS+A6dLjddF
	JC6qWoHMKU9bn0msLlQJgEPKeWlvAkRnI7YisKtlnj7w2MamtZZFMf+rNJo6ckLAcGT97l92OM7dC
	/eTeEu6qUBzJZhl53ukuYZHTz9GMRsmXr/7Wrkduc+sX2a5rX3ANh5Uip+5YOETlc0+41DAQ8mEJF
	x9iZfCqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3day-0000000F1jU-3gZd;
	Wed, 23 Oct 2024 15:48:24 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckM-0000000EpKm-0IHY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:54:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C4220A45047;
	Wed, 23 Oct 2024 14:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD14C4CEE4;
	Wed, 23 Oct 2024 14:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729695236;
	bh=x3OVdblfjzLAzOMuHusK8FnNF3oPWJdEbQW/T6p0YP0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JIcCfvRZ16kidnKEtlzLvLsL/AK0Ak7nHXBzVBp6R+KWjksn6DmF+ztQ2j6v/hAER
	 uDoU44UbqYf3aY8lhNr6ThGFwXR8qVcwTGTb7l8kvQEjzZjGVerVWmaEZKzh0IXWqZ
	 8KN/e8PnmW33tfcX5F8SCzSyuOeix44wYP2qwhy4nHxcKjBepfzZ89iHNKj7m//bAv
	 K6McNt4J/L5W3WJpF2NHDg1oGWpk8um1KZtTZRPkt3DLr9grK3PWYtACdPBw81k1nY
	 QOj/maPrkKiRo61/YBPnc68fB0Y63PHQEOXusICVV31OJferpe2MopFXwJ4hqoVydV
	 FkZGCC6i74k4w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t3ckF-0068vz-3V;
	Wed, 23 Oct 2024 15:53:55 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v5 27/37] arm64: Add encoding for POR_EL2
Date: Wed, 23 Oct 2024 15:53:35 +0100
Message-Id: <20241023145345.1613824-28-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241023145345.1613824-1-maz@kernel.org>
References: <20241023145345.1613824-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, alexandru.elisei@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_075402_295661_D41700E8 
X-CRM114-Status: GOOD (  10.38  )
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

POR_EL2 is the equivalent of POR_EL1 for the EL2&0 translation
regime, and it is sorely missing from the sysreg file.

Add the sucker.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 8db4431093b26..a33136243bdf2 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2907,6 +2907,10 @@ Sysreg	POR_EL1		3	0	10	2	4
 Fields	PIRx_ELx
 EndSysreg
 
+Sysreg	POR_EL2		3	4	10	2	4
+Fields	PIRx_ELx
+EndSysreg
+
 Sysreg	POR_EL12	3	5	10	2	4
 Fields	PIRx_ELx
 EndSysreg
-- 
2.39.2


