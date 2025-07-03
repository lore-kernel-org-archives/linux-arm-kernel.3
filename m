Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06503C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 10:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ljmy+ZNGy4fcZIGrN/jEBi+eBYQ4nSxzzRwPwriLtI8=; b=sfOfU1me4r08Z/oXz+d3gOTRGb
	TnTuXjePVxGmyNtRM9GWmwx2xgtKI6vafouYZnKVKFo5OZVihmyGu60nfIUjkz/MtWw0QeJ3L47ue
	i+xYVGfib1bqYaIMJ/GKbES777MHWaM6V2723WTdLFbT7ZH5GFzmgd1Rk+pCU1ThW2C1g7f1j80Ol
	b8WZLeaCAG0XjhiZqjJwLpsjleEoreICzvRRtmUkF+gvRm95ssmLUL80sL6Y+8G39G2GgAeuTzFdt
	YURJT/JAaF1rCARmoNQX4AqRmwdYxRq/hj6qBgOujkLiiAJWUOde0ZgwgkmEmLoRZ1izXUllrn2l6
	lspuKTEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXHGt-0000000B0sj-1UXK;
	Thu, 03 Jul 2025 10:34:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXH88-0000000Aycd-2wNc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 10:25:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D27945CCD;
	Thu,  3 Jul 2025 10:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30097C4CEE3;
	Thu,  3 Jul 2025 10:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751538324;
	bh=DVrlQl7knEfTTRJf6B4kPW+doH90DFZNcs/PwxMLaDU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gTC92IJd8oeqpHpKuv9FODRFNo+kmATOj63So9/UbUd50BFsXN5UXWpnr4lt1h9K6
	 +IZgSRlOs+zcdPK7JapvprVqv8xBykup/74g1CX/YmYrPyDaJYXo0GQS5rumNBqq89
	 jgUs+9SbBAAXuBJkA82GfOYEspn6DUgPXmUZvg+lt9tkMz2oejNSCxpQ2WwtP3NycP
	 57n6LgYAUrmAoVGMPeWVKzXZ+39/dYvqNc5QRv721JR1PN7ODqMdqYv/QvEIeNF8p/
	 P3Tw1FUV5e4fXVMk82boBq6VgOuLG/IuHu3rvpzFu1in66s5FE/FFZ23YhnSX6aAwz
	 Is8Ne/3ZhYLDQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 03 Jul 2025 12:24:52 +0200
Subject: [PATCH v7 02/31] arm64/sysreg: Add GCIE field to ID_AA64PFR2_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-gicv5-host-v7-2-12e71f1b3528@kernel.org>
References: <20250703-gicv5-host-v7-0-12e71f1b3528@kernel.org>
In-Reply-To: <20250703-gicv5-host-v7-0-12e71f1b3528@kernel.org>
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
X-CRM114-CacheID: sfid-20250703_032524_765161_4A985D31 
X-CRM114-Status: GOOD (  10.39  )
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

Add field reporting the GCIE feature to ID_AA64PFR2_EL1 sysreg.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 8a8cf6874298..fb5bddc700b3 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1314,7 +1314,10 @@ UnsignedEnum	19:16	UINJ
 	0b0000	NI
 	0b0001	IMP
 EndEnum
-Res0	15:12
+UnsignedEnum	15:12	GCIE
+	0b0000	NI
+	0b0001	IMP
+EndEnum
 UnsignedEnum	11:8	MTEFAR
 	0b0000	NI
 	0b0001	IMP

-- 
2.48.0


