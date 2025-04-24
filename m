Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB9BC369D8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5VpPTyMpob64bmtSPLdeOS323Vzlu6TUyDVXKvCV4Ks=; b=SG9eFnMqduBsLqX+s7u4tQr0wd
	e2Gc/vPb9+yvayU78dFP95CKPL3l/2Nni8b29ljXFyrcgha4a+FCU/MLff/YET2TekXhllJmKtUMI
	dlRhj9R/EInTkCLxzhu1+Se4hFBEOvKinBWjy3HE7cZBLaL5z/hZ13W4+rp+HngIn6VhXz8JhaR9T
	4L5VgAYqyK7/uqeaLFNT6HuXL9/6sb7AtWYgur7aZMCS4J/jQCZMRIy2wghy1jKUH+Hbcju0kHB4/
	cVkXNZnS2Po7LW1Zy0aegPx+rQoyVjF8PEFNIEZJWlxobK6QveXKp9Bsi2/ZtALDb+wZqRMxLOLGh
	C4ea6TOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z2x-0000000EZd5-0gTZ;
	Thu, 24 Apr 2025 16:03:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tmV-0000000Dfhr-2S2M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:26:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 309C568455;
	Thu, 24 Apr 2025 10:25:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6D14C4CEEE;
	Thu, 24 Apr 2025 10:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745490370;
	bh=OznnXe4nZQZT5vM8HP2AP0cBLVxiMADjBCE9cYkRzRc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GxQLDVSHU+hhNkPEXwBopGzxIQSpDaseVr3VyiUsCENfZAr3MJMr4IFBZwSTWfg+3
	 IX0QSgb35PlnU1zKNLYIAhqshCcAYOD5Q3wVGTwRiimTo23zDdxpwuOkf0x5urJZAM
	 HCQpj/D3J4j2CQuSxrSarhQShBHWGeKSaEGHALce+/ThEl1ysNvWxOoB+sIZ5SuXgR
	 JpZDaAR0wjAZJOOQUrjDtdlfdSt1znnnoLZ1YLLnEPRQqT0epIXtzu1LPCOluKwmON
	 Zr/4Id3qXJVrE7pWHOVE9Gtpd4isDBeJK4MKIkeDtIhhbW8TIXMqRaDdW9MIQG9r24
	 JCP6MeA5j/hBg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 24 Apr 2025 12:25:16 +0200
Subject: [PATCH v2 05/22] arm64/sysreg: Add ICC_PPI_HMR<n>_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gicv5-host-v2-5-545edcaf012b@kernel.org>
References: <20250424-gicv5-host-v2-0-545edcaf012b@kernel.org>
In-Reply-To: <20250424-gicv5-host-v2-0-545edcaf012b@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.2
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

Add ICC_PPI_HMR<n>_EL1 registers sysreg description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 75 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 985f2cdb67cfec6df335a3951ecb63f128f6da55..d046d719d4f69801aeef51b5b9437a0eaa04134e 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2324,6 +2324,81 @@ Field	1	Enabled
 Field	0	F
 EndSysreg
 
+SysregFields	ICC_PPI_HMRx_EL1
+Field	63	HM63
+Field	62	HM62
+Field	61	HM61
+Field	60	HM60
+Field	59	HM59
+Field	58	HM58
+Field	57	HM57
+Field	56	HM56
+Field	55	HM55
+Field	54	HM54
+Field	53	HM53
+Field	52	HM52
+Field	51	HM51
+Field	50	HM50
+Field	49	HM49
+Field	48	HM48
+Field	47	HM47
+Field	46	HM46
+Field	45	HM45
+Field	44	HM44
+Field	43	HM43
+Field	42	HM42
+Field	41	HM41
+Field	40	HM40
+Field	39	HM39
+Field	38	HM38
+Field	37	HM37
+Field	36	HM36
+Field	35	HM35
+Field	34	HM34
+Field	33	HM33
+Field	32	HM32
+Field	31	HM31
+Field	30	HM30
+Field	29	HM29
+Field	28	HM28
+Field	27	HM27
+Field	26	HM26
+Field	25	HM25
+Field	24	HM24
+Field	23	HM23
+Field	22	HM22
+Field	21	HM21
+Field	20	HM20
+Field	19	HM19
+Field	18	HM18
+Field	17	HM17
+Field	16	HM16
+Field	15	HM15
+Field	14	HM14
+Field	13	HM13
+Field	12	HM12
+Field	11	HM11
+Field	10	HM10
+Field	9	HM9
+Field	8	HM8
+Field	7	HM7
+Field	6	HM6
+Field	5	HM5
+Field	4	HM4
+Field	3	HM3
+Field	2	HM2
+Field	1	HM1
+Field	0	HM0
+EndSysregFields
+
+Sysreg	ICC_PPI_HMR0_EL1	3	0	12	10	0
+Fields ICC_PPI_HMRx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_HMR1_EL1	3	0	12	10	1
+Fields ICC_PPI_HMRx_EL1
+EndSysreg
+
 SysregFields	ICC_PPI_PRIORITYRx_EL1
 Res0	63:61
 Field	60:56	Priority7

-- 
2.48.0


