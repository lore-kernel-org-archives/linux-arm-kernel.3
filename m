Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C59C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 11:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VcgCQmMw9V5JM7Hfml7TZ530MEOnVL7k8ClfjyG4O8Q=; b=lCzwn9mN7p/Tn6NXfmKMUGxfj1
	SsBrL1XnFdV5yrfVONHKPR2l2bXLmq27RvYEfiEolyAs7Wy4Hze3inNBFVdT1ZaLUdfLfl/EIKDBb
	69bedLjfGSPJprGKeUipsRwKt7bauNYjwdoAEY5tey87B1zwwhg/Su8WiZSVxYW2vdPEhEP3gVALF
	vGZom6Sw8TIOkj6M+j+0hR4zNyxYwrIM7Q1Pxyd0tInSblb7TrFMV0akgm0c7AGKJvp1jb8717GqC
	FC6+913QUEOI/S7gW4HPlGhRWg9RsHLPpkOOZz0QeLIADTAn2ZKa6Nj14AeM4xHS4QFIMtLa0y6QS
	56Jkri8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRqzO-00000009w8p-1DsO;
	Wed, 18 Jun 2025 11:29:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpsl-00000009kUP-3F0z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 10:19:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 16E09A52481;
	Wed, 18 Jun 2025 10:19:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDCC0C4CEE7;
	Wed, 18 Jun 2025 10:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750241942;
	bh=CsFjS4cyCjBMHSlrxIiOTX79lluDqAGnleJSeF5bDt4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oKM1Z7nm+5K9oUbXTaggGwmAl1ZxJyjdP+wBxZaU6jQHII7gLLdcHMeAq51fvlNU7
	 bnTgDhMkFyLU+lVZmxaXqMz2yS6uxvxyOUH5MrLTJ1eYQLFQ8+Arao8BpLzZUZd4Z6
	 MKQaekYZtYtgW9V1+v/AiYYphWSpk/duFlvtBcrBEGY0rHSsNiFAgmm5bx1Ub3K0IU
	 qIToDRqTKcDQz1A0QjIhteKH5CBit6rt2Kzx7l/DndlYE4Nr6tbELXoEjdneKoyKRi
	 Xcfc0N5LJisFAUTrEQIdm4B2VjBMBohKyxG6z0J9JutbC+pCna0urVgG78K2pu9O8b
	 +8xkCyc2mXQXg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Wed, 18 Jun 2025 12:17:29 +0200
Subject: [PATCH v5 14/27] arm64/sysreg: Add ICH_HFGITR_EL2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-gicv5-host-v5-14-d9e622ac5539@kernel.org>
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
X-CRM114-CacheID: sfid-20250618_031903_887255_6D704868 
X-CRM114-Status: UNSURE (   8.18  )
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


