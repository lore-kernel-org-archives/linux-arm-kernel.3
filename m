Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E7BC7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 12:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VcgCQmMw9V5JM7Hfml7TZ530MEOnVL7k8ClfjyG4O8Q=; b=FAJqH98XimMCcDVkFAd9tllXjv
	/zq0W8+5GpAchViTQxU91aXw315kcoiuLXihpyxxJB8WINKNnQOol7Dv5NFBlBSa2uB08P73ERnZ4
	BclvSuYRDy9b4sBjl7jysy87+Vr+mhkr/R123wQ9tooWi6bKgHSsS6mrBIchwzU17ZGn+gkBYxvA5
	8EvPUrh16TGyhoI3PvC1mmMFGqLVpqzgu516h9IZePbpC6P6M9UK8UlegZwNovvx+2Y9UKKe8gIrn
	5g+N3AGAlAgGl7kLs0yQrgW0lwwVr6g8Zszpn3vuvGr1IoW7jVAJTcVIZFPTt/EwmZi+cmq0EKfoV
	i2dP58WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUlaG-0000000BWkj-2pJ3;
	Thu, 26 Jun 2025 12:20:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjpV-0000000BHC8-0Tqn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 10:27:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CFBEE44516;
	Thu, 26 Jun 2025 10:27:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F12C7C4AF09;
	Thu, 26 Jun 2025 10:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750933660;
	bh=CsFjS4cyCjBMHSlrxIiOTX79lluDqAGnleJSeF5bDt4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZbZx5Aw869r6nntSZXBC15m2fbqUXtb5fd6UeXnN8eG+eqPZVLoc8Cm0cFoZB9nrl
	 o6PKC8sk1L07xv/soAVuAA/lNhnvq2eaBgL3tbXJDPa/6U0lOut96/RckwBdCG2bpv
	 wVmQZArZNWXxDsuUV1yHqUAvBG8npAGxeymF/WWUA+6m0/48bgLqZj92HK3jMqUiX6
	 rIttWrG+kvfAkWDodWnoq6aqos+s7N4t0D8bUtodSynth0xSGqIvvzSvYcN1NVGmGu
	 WIL8LCvuiy857G0q3RMzrGTutLvFvfi881VIdIzB7cfgqHhvio3UteZbSDdXaPMU1+
	 ZJd4sLihCobmg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 26 Jun 2025 12:26:05 +0200
Subject: [PATCH v6 14/31] arm64/sysreg: Add ICH_HFGITR_EL2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-gicv5-host-v6-14-48e046af4642@kernel.org>
References: <20250626-gicv5-host-v6-0-48e046af4642@kernel.org>
In-Reply-To: <20250626-gicv5-host-v6-0-48e046af4642@kernel.org>
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
X-CRM114-CacheID: sfid-20250626_032741_177106_4918BEA2 
X-CRM114-Status: UNSURE (   7.82  )
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

Add ICH_HFGITR_EL2 register description to sysreg.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 9def240582dc..aab58bf4ed9c 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -4467,6 +4467,21 @@ Res0	1
 Field	0	ICC_APR_EL1
 EndSysreg
 
+Sysreg	ICH_HFGITR_EL2	3	4	12	9	7
+Res0	63:11
+Field	10	GICRCDNMIA
+Field	9	GICRCDIA
+Field	8	GICCDDI
+Field	7	GICCDEOI
+Field	6	GICCDHM
+Field	5	GICCDRCFG
+Field	4	GICCDPEND
+Field	3	GICCDAFF
+Field	2	GICCDPRI
+Field	1	GICCDDIS
+Field	0	GICCDEN
+EndSysreg
+
 Sysreg	ICH_HCR_EL2	3	4	12	11	0
 Res0	63:32
 Field	31:27	EOIcount

-- 
2.48.0


