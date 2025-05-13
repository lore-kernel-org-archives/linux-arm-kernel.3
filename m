Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8D7C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 18:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gtbYQudMtZIcSaxZO1sxF+hIJTgxobu2aDtJCIxaNQ0=; b=vKezBCF540fDYKel9Rk05rbn5T
	fYM8Z2mP5BXZFLUR81vBDvNSb5fG+zMTWWdQY0tM5ALoAJs4Vkmf0ouz8rP3LeaIlSNzTHle1lrAg
	G8WvDmI1oJ1FmTWzrPJCwGKun5xVHvRXMpsIf1L/4TGSwNPZeYEMPc6ukS8yCgZaQAYRWv1kOovdy
	AfvCx+kZAnfHQAW6xQDQYltCtoCe5bU9auBdl0ns00O6TYqbDk/6Nlin4DyPHzYT2pvsBgKUgUvXw
	IKh52bc0AzJlfl+bNE+MsUEkK6WUn263OAF5DWxst0MADndMQpK8j+fQo26UUIRq0cTcLNlSuYz7a
	mNAPkQIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEu5V-0000000DCtH-1HIw;
	Tue, 13 May 2025 18:10:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEtkU-0000000D98l-39wh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 17:49:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EA0315C53DF;
	Tue, 13 May 2025 17:46:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9640C4CEEF;
	Tue, 13 May 2025 17:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747158542;
	bh=kShmXCGVQITUGE+8zdRcDuz6+Q2ui/0JpZErTbdkxDc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GpZilxJFoCpz6/AkMfNWN1zGBJx38xukup99CqncHbcnHqBXNje533B/D5V0jwIs7
	 kdSM85OHOpaqPVM1rKvj7GSGtWS7LB0pojvFCJw0PBrZoQILIRMGYVImkEdHbr43DX
	 bhVBsmQIFPbe83IvXDMTgl+xJKSyGjOKdi9+4QuFrzP7ix8vaP9S+eWOzceg9sE8WG
	 KLP1N1mkeWNhSUwU3pNor2E5Lt0TE7JEZRrUz/PwnGjnXPtmPLfVqHEMZYcJSvXOEQ
	 y6+NsptJzUWJXhJxFXQ8P73VqVNkPWiFjk2f6AuRKIkp6uxSZBd6PQ9wEcLycJrFyV
	 2oD5HNZADg03g==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 13 May 2025 19:48:00 +0200
Subject: [PATCH v4 07/26] arm64/sysreg: Add ICC_PPI_{C/S}ACTIVER<n>_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-gicv5-host-v4-7-b36e9b15a6c3@kernel.org>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
In-Reply-To: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_104902_877888_18416278 
X-CRM114-Status: UNSURE (   8.38  )
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

Add ICC_PPI_{C/S}ACTIVER<n>_EL1 registers description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 83 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 02eb3fd876dcb1612dc5436d509a80f9e7f70903..88be22eb1d9feffba0ac28ad983f589ed80c905b 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2474,6 +2474,89 @@ Sysreg	ICC_PPI_ENABLER1_EL1	3	0	12	10	7
 Fields ICC_PPI_ENABLERx_EL1
 EndSysreg
 
+SysregFields	ICC_PPI_ACTIVERx_EL1
+Field	63	Active63
+Field	62	Active62
+Field	61	Active61
+Field	60	Active60
+Field	59	Active59
+Field	58	Active58
+Field	57	Active57
+Field	56	Active56
+Field	55	Active55
+Field	54	Active54
+Field	53	Active53
+Field	52	Active52
+Field	51	Active51
+Field	50	Active50
+Field	49	Active49
+Field	48	Active48
+Field	47	Active47
+Field	46	Active46
+Field	45	Active45
+Field	44	Active44
+Field	43	Active43
+Field	42	Active42
+Field	41	Active41
+Field	40	Active40
+Field	39	Active39
+Field	38	Active38
+Field	37	Active37
+Field	36	Active36
+Field	35	Active35
+Field	34	Active34
+Field	33	Active33
+Field	32	Active32
+Field	31	Active31
+Field	30	Active30
+Field	29	Active29
+Field	28	Active28
+Field	27	Active27
+Field	26	Active26
+Field	25	Active25
+Field	24	Active24
+Field	23	Active23
+Field	22	Active22
+Field	21	Active21
+Field	20	Active20
+Field	19	Active19
+Field	18	Active18
+Field	17	Active17
+Field	16	Active16
+Field	15	Active15
+Field	14	Active14
+Field	13	Active13
+Field	12	Active12
+Field	11	Active11
+Field	10	Active10
+Field	9	Active9
+Field	8	Active8
+Field	7	Active7
+Field	6	Active6
+Field	5	Active5
+Field	4	Active4
+Field	3	Active3
+Field	2	Active2
+Field	1	Active1
+Field	0	Active0
+EndSysregFields
+
+Sysreg	ICC_PPI_CACTIVER0_EL1	3	0	12	13	0
+Fields ICC_PPI_ACTIVERx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_CACTIVER1_EL1	3	0	12	13	1
+Fields ICC_PPI_ACTIVERx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_SACTIVER0_EL1	3	0	12	13	2
+Fields ICC_PPI_ACTIVERx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_SACTIVER1_EL1	3	0	12	13	3
+Fields ICC_PPI_ACTIVERx_EL1
+EndSysreg
+
 SysregFields	ICC_PPI_PRIORITYRx_EL1
 Res0	63:61
 Field	60:56	Priority7

-- 
2.48.0


