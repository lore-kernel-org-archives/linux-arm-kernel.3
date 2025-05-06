Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B24C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 15:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Naj+/c+DmeWzjH0iSWv3H6bTHR9+JTgYDr3R1wUOTo=; b=C4sBlwgC9O/fJ5lp4hlBfsd7nC
	rgsS9x6BoSZjyf/xahDq66Q3n4sZdEN+EfJeYAJyWkN0HyOEpDYlGH1polpn7kK+NjpUtKVzdMVq8
	SoxYq15xmxC8+Kfr0WSRCx7LZAp/tq4Sj+Yqp3Rxkjm8SwrzyeEA8oyMMjoM5Fp2/5jexdohbmCV6
	gWLGXl/HsOMpOeu/fZnbwOL0eAS5/2nf+x8pQWiqAHa8IaWM9scijwuua40xeE+mXfjdL76SBQ/nT
	9ET5+Zrafwsj2uCgTe50yUk13mK9uMr6qALEUZiFAN4Hukcdp3mEFJTTj5AgV+o4oOejHmKfkKdkW
	gqpkzIDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCK66-0000000CTLk-05WU;
	Tue, 06 May 2025 15:20:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHLF-0000000BtFz-1lo2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 12:24:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C3FC44413;
	Tue,  6 May 2025 12:24:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2053DC4CEE4;
	Tue,  6 May 2025 12:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746534249;
	bh=gXuthZuxBZQLsvBkFkEhlBn3G2hxd3VqLQiwIZeC8vM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LIuiJrfZlpwYGShMeEz3c4uNe4TJvSX1MHc5TzTDqc4bIiSrdQwxwmPPkroUDklxi
	 8YTD/WpcL1LiD5yj993yR38P7Ngyj1lgpe1olPykvMs3wsnlr4i7F760V/fbUe3P7q
	 YFdF89AHYk+CHDk1cQivQk5AgOncOvfHZzp69TxkeRDayDp/YtbUtMygGvEPFzXeYV
	 irUhF++We6A9fVn2v+B8q5N/EPn5bvGTBfV/v+TpU6SXLocTfoO2xLjvn6mqgvo3AV
	 rDu8y9oO76bJ5m3PRwO1ppEUZSr7pdGxCVz/R5nvZ9pBf3TH9Sqw3sby+mK1ivvAPm
	 6wnqlrQWpkKfQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 06 May 2025 14:23:31 +0200
Subject: [PATCH v3 02/25] arm64/sysreg: Add GCIE field to ID_AA64PFR2_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gicv5-host-v3-2-6edd5a92fd09@kernel.org>
References: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
In-Reply-To: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
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
X-CRM114-CacheID: sfid-20250506_052409_480901_DE0BDE82 
X-CRM114-Status: GOOD (  10.77  )
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
index f9476848a2edfad53bb4af7f68bc05cb2a4af9ce..06e1fb5e126b41b7e41fffa0a00553d73197ac3c 100644
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


