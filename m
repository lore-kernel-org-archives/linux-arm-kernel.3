Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E678C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 18:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3gIaiD52WoPRAdsu0SBUKzegFB+NgIiUFPO8Uzg33gI=; b=gx/m6b/at4T/RxFTJhNcNib+C+
	bfkQaBy2/YigEdbEJsfJnWEeeIBtVvDapbg4sPJSP6VBV4oUDxou0Yb0ingUqX0HDqzkvKNcZfjKG
	80EzugfO3Lb38R91Hq9E0o/C/wGW2YZDQ5xoe2Jb7GTCvC8+5XcAEg9n/BQCPf1Nj3YW2MNMylqD1
	WbgOpiQrwnDgzMC7Ctb3SZT1XXGh++D2hE//2YT8baO/+XtPoz+9dyHBxvSD3JLWYB0mz9XiLEtNh
	MCRYdz/vH4lGxQv6Dq5itOqwdI+XF2cgoW4TZCh5ah9nurPdYgyehxdWpOc1pWnlfLv4pYUyhpTz1
	bh925Haw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEtv4-0000000DBRO-2Kdo;
	Tue, 13 May 2025 17:59:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEtk4-0000000D90W-1KPP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 17:48:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D0FE62A13;
	Tue, 13 May 2025 17:48:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927C4C4CEE4;
	Tue, 13 May 2025 17:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747158515;
	bh=3IEW2nofTzt0kiCtUrFN1XMdmJDoRXO5ZF48Jiu810g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=b5crflDYfwj58ztU9sYCcUfoQL0Mu071jl7dsqOeermpV+Ela7yGFZdY56b+PMyJT
	 fHCLuIOqAMyoDs6m12BIUye3id9D/Tls1x+KvtMvyeANfllFQdzstNopH77gWvrsJw
	 gTORC2ZNQXdPcCYomT5S+LD0Ewaw6FQ3Zuft+34cE3JBpII/hgVtPAGhnNaqs/cLTG
	 ulI+z3bnk9FnQNe5Ej95ocnatRSoeXW1YNuhmB7FSscgQr2BYS6hKezfOG7OkWexnw
	 Pn01e5Os3w0aTTcbp65msU0N1R6OmStJ1aw+aQUYs3KgiZJehsT1tWBejbL6XjGWN9
	 CwpwkYU6FhSJQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 13 May 2025 19:47:55 +0200
Subject: [PATCH v4 02/26] arm64/sysreg: Add GCIE field to ID_AA64PFR2_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-gicv5-host-v4-2-b36e9b15a6c3@kernel.org>
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
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index bdf044c5d11b6dd68d21fa06410221c58fc42f97..17002b1b00caad81a4dd387097f2b71ef21d70dc 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1023,7 +1023,10 @@ UnsignedEnum	19:16	UINJ
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


