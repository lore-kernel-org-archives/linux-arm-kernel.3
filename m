Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CBEC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 12:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rW9m/wv+0eQQy0ushRxXElsEu9MUvK3JxCnvtFqpyMQ=; b=O5u0Z6BJZJNQVthjLsuq/xI1An
	W21rKWjfsY6Ut9qOdArG5DsljQYNBtJNipCCtqus3RUl8aC2bAbhcRwKdBUVVU9u/C8SukF6nDfkN
	aKx3SkU0A5tiGqXzREnCxnG3YCQ1JgOHtjMI1weJU5MnrfeCUZ/t7eGKTymIZdGIJNzRjo8uF5MiS
	3EYhp51jXjfX/eFoRc8j7yqt7j8aSPIWlFCdBkykBbI0lKQ8hxa+6j6Z8LHRJ4tVG98m3VZFvqetE
	KxLkBeZUVzNn3liqaiV8WiZgUwiAg5G3mT4Z7jRSh7bAz26LQOH7aOUKXhcbDazKUMV0VVlxPQ1Jg
	dwTrkm+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8ejt-000000020M5-39QY;
	Sat, 26 Apr 2025 12:34:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8eeK-00000001yyr-3Jty
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 12:28:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5924468448;
	Sat, 26 Apr 2025 12:28:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F09E6C4CEE2;
	Sat, 26 Apr 2025 12:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745670532;
	bh=8A74ZozC9sTAb9FFk+IBeU6GZPUV1uY2uFxjvew56hk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aWE/bzN/N0ZmsgFxg7ba7AYijHbVrWhlZX3XFtDiZQz09jz3gglKTH9KXoud8aHe0
	 aM3K4JSMY3cyCnN7MdRYWh8ErZ7IzoJY49Gw8oliVLrtzfATTjh797o2+6smm0CfuL
	 g4wBK+2G9PgIwbnVb71f/RcmG+qXHDnKElPW8RU7pU7i5Ok2bwR6YVMBD4LiXsoTzr
	 3nFHYqiO8zRan2moHAjYEPV2NHHQDnacvm8WgihP45k/UK/2fMhIeX3b4wTq525OTu
	 G/+X1r4L+SlAOu06VmHP3zmXlSMzZpxGsAY6KQxUfIiVHNIU0Gr4rv7QIG+CqqavQe
	 c3ZHoo1omkKyA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u8eeI-0092VH-2z;
	Sat, 26 Apr 2025 13:28:50 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v3 07/42] arm64: sysreg: Update TRBIDR_EL1 description
Date: Sat, 26 Apr 2025 13:28:01 +0100
Message-Id: <20250426122836.3341523-8-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250426122836.3341523-1-maz@kernel.org>
References: <20250426122836.3341523-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Add the missing MPAM field.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 668a6f397362c..6433a3ebcef49 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3688,7 +3688,12 @@ Field	31:0	TRG
 EndSysreg
 
 Sysreg	TRBIDR_EL1	3	0	9	11	7
-Res0	63:12
+Res0	63:16
+UnsignedEnum	15:12	MPAM
+	0b0000	NI
+	0b0001	DEFAULT
+	0b0010	IMP
+EndEnum
 Enum	11:8	EA
 	0b0000	NON_DESC
 	0b0001	IGNORE
-- 
2.39.2


