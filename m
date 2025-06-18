Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4985DC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 11:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mrSFo0Drzdl49KjTIgIw5R1dWNGodrXd2qO+mvD02z0=; b=27OWFye4rmZ6bPQVuxRfYlqqIO
	lBaOltfJ7aGhXD3Op3MPwdoPA9Mtt7jYo2Q1OxVwxi8AG0OlBdYxJDw1p5T+xz6ZkEQnkxFeDLMXt
	y6h8xLDhu0013jC6UybRE0dIrqq0QXqLV7sj4auosz1Y3wsMzanJq37XZoeyC61iTWUk1wbMmbW/n
	WSl1YrKEDHm6AQ25wwbMdbFA6QaD3C0CEzl+H6XzO2xTeWWzuZm9sAIE4F3kYNWhnC+lGgyQ8TffT
	a326qGRokL3zaReI5+QdbGh4pe1fxIbAgIGl8pBd4JhGl6ZhQXlpRVF4X04U62MNolUPk1haL1gEa
	aCo2giTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRqdZ-00000009sty-0HCK;
	Wed, 18 Jun 2025 11:07:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRprt-00000009kGQ-0mVj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 10:18:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2BDCB5C65FC;
	Wed, 18 Jun 2025 10:15:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91B0DC4CEED;
	Wed, 18 Jun 2025 10:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750241888;
	bh=tRKFfC9HrDSF598h4BQsZtNeEtZI1IT9Ixq8S352lh0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dzrZnktf82Vas8Sck74Z+Fv4p+R+qtg1xG1JVro8ZsiU+WvvLlhm24frmQir60WTD
	 /bQ45VbvRievzxevlW/SQGayhR5qKxah1OEL31gW+vRVYNA/QNMkHTIO9DWp2R2PLz
	 Va6sA9iTUgGTOYK0+uvGLEeUyaJJ/qqe4hOf7l68xcNEZ0V5+gviA6i0l6AUrWUKfv
	 hI2ijFHGlCsCRMSj4BgOxILbdirfw/NEim290YTDAEVhC4f6ygzdVRAEbb2LVV/FCw
	 UoGNtN+s5X0B8OJAbRi7aeJTuVr40b5e93R76KTbtnHJQLz1qga7QiGY8kH7CTxC8i
	 DIRFPMnK7h6mA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Wed, 18 Jun 2025 12:17:19 +0200
Subject: [PATCH v5 04/27] arm64/sysreg: Add ICC_ICSR_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-gicv5-host-v5-4-d9e622ac5539@kernel.org>
References: <20250618-gicv5-host-v5-0-d9e622ac5539@kernel.org>
In-Reply-To: <20250618-gicv5-host-v5-0-d9e622ac5539@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.15-dev-6f78e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_031809_268026_61E2BB02 
X-CRM114-Status: UNSURE (   7.99  )
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

Add ICC_ICSR_EL1 register sysreg description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index fc17e19a738d..81b32f567ce3 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3024,6 +3024,20 @@ Sysreg	PMIAR_EL1	3	0	9	14	7
 Field	63:0	ADDRESS
 EndSysreg
 
+Sysreg	ICC_ICSR_EL1	3	0	12	10	4
+Res0	63:48
+Field	47:32	IAFFID
+Res0	31:16
+Field	15:11	Priority
+Res0	10:6
+Field	5	HM
+Field	4	Active
+Field	3	IRM
+Field	2	Pending
+Field	1	Enabled
+Field	0	F
+EndSysreg
+
 SysregFields	ICC_PPI_PRIORITYRx_EL1
 Res0	63:61
 Field	60:56	Priority7

-- 
2.48.0


