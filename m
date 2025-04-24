Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F12DC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 12:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPgGiBFAX70unZaYouOMrE/S/CJ8oTuGZe8qicAjMCE=; b=LNpMOMRdr1URxqOuCg/EQap3fS
	VA2IW2hOaiQkdcwlbWhk+P+mKfq0/VUiXG+O4Dm6Ofqw4+FOGs7fmvdsmWKcHuMRtqtLSnsd0ksgu
	GQgNRc7Hxti4O5lGNCtzWIX8q+NkaOY3GnIjM7jU/78n3RAoHwA72aIwDuIJ2Nh4ICtdfQyeHx7H/
	uyeCAkP9gUC645EekMT4vTJAvieOIBU3StaYBGjdiNsJPX8xn01IR2rLbiBFTe38EwKobBJrMviDi
	PdW8sgNN9pM10NuOR0J0/UxTbEbBbFn4QN0ZYcumINGcqxAiXCplHDlanmT8jpUNare6Fa4876/tX
	mNbSUugA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vx1-0000000E4bu-0Kkk;
	Thu, 24 Apr 2025 12:45:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tn2-0000000Dfp7-2fE3
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 10:26:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=CPgGiBFAX70unZaYouOMrE/S/CJ8oTuGZe8qicAjMCE=; b=TFrq8l95wvdvsDEm200iUc69oS
	RpvAa1qQENjTO2QTJMzMaLBPWGkzP9Y4VzSDXsbOnWEGjQCNGGExds2YRLsgPkd6140iJQhVFIoC7
	tfX+cBk790DfdHs7aKERJw4B48KEkMeMoUZS50t+5DsxAGt4iyKpPVDaw41htLYozwd4wp5Lhhya/
	JN9KBcc0Si0XzPI2h6tXw1WyS2vHjpxqiU8oR/ARQdEOU5bf+kuoa5V+wfKEJqS0/yghPziYiHDZo
	x47+Cs3vveZ6/xOD/4MiBp/EQ6f4RXO+m5if9xfz97BCvkXmCwkLVJvxw8qKkXByIzgZVBIX3IgA8
	rWmm/y2Q==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7tmz-0000000BjYp-2tUC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:26:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B5E8D4A225;
	Thu, 24 Apr 2025 10:26:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD58C4CEE3;
	Thu, 24 Apr 2025 10:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745490398;
	bh=IR60XZsATfdTuIxQzwSdrYf53KWRtcmnuEgRG5+wtmQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CKdSUuDu0deDC5a3Tw/7ckqarMXiN7nyUVjfKIUy/0S90tPll39k9AScbNKaoUzSr
	 MwQowBh+FN55aSoCHWF+ZB1MRW6PBjWEkivaX+vg2qkx3XnzAvNeC+/Dq8hKcONo5x
	 a2XyO0WpAIFSxpn7hqPRshTWT2tF14ibjJi+LoSYHyXt0/SJLSf6+8qYdBh37uTRsO
	 /+Xfid4X36zuTZXw3L8K02ZqTRmOunYbytpYfYvR//OwoX3+/eOVQza6I80uI5N628
	 /Zin9cfTC9JhNJzqctgCD11eI01qsWjreYa23bY3Hd5y9zVTFNMUYaaJyTDk46OkxY
	 OM5Iy+gPz1/kQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 24 Apr 2025 12:25:21 +0200
Subject: [PATCH v2 10/22] arm64/sysreg: Add ICC_PCR_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gicv5-host-v2-10-545edcaf012b@kernel.org>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_112641_995658_89EAD862 
X-CRM114-Status: UNSURE (   8.25  )
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

Add ICC_PCR_EL1 register description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index c96243505031ea680c04a693fee2c96ad19e30ea..9a2ddab8661c85586b0e91f7eaabd5a6b3409c67 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2806,6 +2806,11 @@ Res0	31:1
 Field	0	EN
 EndSysreg
 
+Sysreg	ICC_PCR_EL1	3	1	12	0	2
+Res0	63:5
+Field	4:0	PRIORITY
+EndSysreg
+
 Sysreg	CSSELR_EL1	3	2	0	0	0
 Res0	63:5
 Field	4	TnD

-- 
2.48.0


