Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DB9C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 18:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85V5gV+Yeyp5XvvC88W14CoXDeiGNUBnZwu4HYHIV+8=; b=GQF1jnRtO6aaMSNEi3WjdcWQ+a
	ok+LmmnlyWQXFzBCx8k8wHcupnI10tZyP+ge5WE3E9XlxGbeDfkgFvbyA9a47SKu0o7zH9oQ3skeB
	xP9MZESxfEbs/60TFb7jfojkWRVnwDooTDXE3lQjvir6iCPJBYmiepbDE8s9ij/vagJXQQ4j4MfMd
	9dwtRYxQi8ACdA6tXTPgghkuAAEJU76Xf12ehGNJAvtdST2iZm14A4YlE59w8Xg9eRZEDFzzJBshP
	QYvMb0BSuH2Pv9lk4vns/eAFU/2cUrJuwj95EyYDeB5frgCpfk7hekWNpVUKPbSRmRKBlp+uomoxh
	wu7HyF3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEuDo-0000000DDrQ-1lBL;
	Tue, 13 May 2025 18:19:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEtkk-0000000D9F8-1t2Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 17:49:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 370B74A5B5;
	Tue, 13 May 2025 17:49:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96C86C4AF09;
	Tue, 13 May 2025 17:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747158558;
	bh=491q3sKfB+wf5tIEnM/LnvWYhJJpm4qRjaOllN5VUfc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eHH6AxKNnQznSJvXS+JZzLL7gQww9avRciR2BIMVBW4RZfn5EuxKWtF0ZXeyf9eHQ
	 hXiCWl7DFQEjo69OY5NqgFJZWeexn/j/taFoAWUgHlg7Lh/erZ0LMSlXOaqbfkjtIz
	 HGcLdTPQ1BK5o1RaTIGgFds0ila0uioDRv3xQTmRloQXMwXCz7N+SaFgOMrMRDt7x4
	 7h1dWj+Yk51Uwem4T+2HKHgqhKyaOoWGxuxSAzNdLzcsorxgZXzQZTM9EzqGoPwUGm
	 gS0sDDsKclbYjyp8Hwf9J6RkXBbJeezaRVtXFFdPDbj8GI5KI46/wXrVljvBIO/s90
	 H+x7aWyab8zog==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 13 May 2025 19:48:04 +0200
Subject: [PATCH v4 11/26] arm64/sysreg: Add ICC_IDR0_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-gicv5-host-v4-11-b36e9b15a6c3@kernel.org>
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
X-CRM114-CacheID: sfid-20250513_104918_514628_E16CA0C3 
X-CRM114-Status: UNSURE (   8.34  )
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

Add ICC_IDR0_EL1 register description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index b26e11b6e109850947be30dd2fb9c044d21c0aaa..d54c9783acb85f1049dbe51f9a37157d0fe03292 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2385,6 +2385,22 @@ Sysreg	ICC_PPI_HMR1_EL1	3	0	12	10	1
 Fields ICC_PPI_HMRx_EL1
 EndSysreg
 
+Sysreg	ICC_IDR0_EL1	3	0	12	10	2
+Res0	63:12
+UnsignedEnum	11:8	GCIE_LEGACY
+	0b0000	NI
+	0b0001	IMP
+EndEnum
+UnsignedEnum	7:4	PRI_BITS
+	0b0011	4BITS
+	0b0100	5BITS
+EndEnum
+UnsignedEnum	3:0	ID_BITS
+	0b0000	16BITS
+	0b0001	24BITS
+EndEnum
+EndSysreg
+
 Sysreg	ICC_ICSR_EL1	3	0	12	10	4
 Res0	63:48
 Field	47:32	IAFFID

-- 
2.48.0


