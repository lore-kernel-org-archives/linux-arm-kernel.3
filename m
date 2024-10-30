Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD41D2AB15
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 15:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3i8ZVoRAFRIcG39qTK0KnwlYJJ890TIXmlFUPFB081E=; b=jlR93XurgvFtSyUqLTL/bddtX9
	CHN0TsAn4IapFrv0CDiNYU57q0VtmSAt4uE4ZYHOhrcmkXuQY2ttiTMeK4yj2Ab24cyn3h2XM/Ebz
	ZydtTKnEaoRuE/EfZdvZrexUWzpn1zUou3aeOI+pH2ZOel8XDMv3ycLTvktL8lkOZvDMYNzMYm3TN
	k0rBdqWPbWtRnga/U7/87Dqgn3wZLNDp8rHbnrpbtX0P0BvSnwIe1C3ALTroDNsYjn+jTTkjfnqQ9
	5OW3brtpw8DNmc1TcAbiXUrERjRkFYuXHn+a26wfPu3toBf6cDHzoTUo5x90WC46WdUK241Xm9wdN
	8p0wFPlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6At4-00000000vao-3BX0;
	Wed, 30 Oct 2024 15:45:34 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6AoF-00000000uPm-2uj3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 15:40:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3A728A41896;
	Wed, 30 Oct 2024 15:38:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19226C4CECE;
	Wed, 30 Oct 2024 15:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730302834;
	bh=zpkfrQGx3HEw4mQkvZcocv9aZkCal4I29KIfJ/D2G4s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eCA0U0dl+z+VY4f3uqsvPVruJ5VnElkVGAOb4qDC/ye4ApaNBf3QM2Tp1Zw3mhIcp
	 W2ZiA2IjtQ9gqWNAknMzTkBqBKMVDWvS28cpGGoH8v7quxfar+NHLJRUU4HStHE24t
	 d7HfnqW0aBjmj3E8yEklVChwNj9zYRmuxhk4aSxlrHNgnjTaEpJTr72QqS+FVF+Wzr
	 IvCRxOmqXA2adzAd21FlVsVCeIB41QoIy3CxtoTjJD+VAVuPjijvZDSy1rsQeTdVR2
	 HOQPoyXELEvZU/1yc67jGQADI2AKVIkl3tSih5hT4E3k/gwysMt8HNz4CdwW+Cg4hD
	 y0KZKBxxEKLXQ==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 30 Oct 2024 15:34:47 +0000
Subject: [PATCH v2 2/9] arm64/sysreg: Update ID_AA64ISAR3_EL1 to DDI0601
 2024-09
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241030-arm64-2024-dpisa-v2-2-b6601a15d2a5@kernel.org>
References: <20241030-arm64-2024-dpisa-v2-0-b6601a15d2a5@kernel.org>
In-Reply-To: <20241030-arm64-2024-dpisa-v2-0-b6601a15d2a5@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=944; i=broonie@kernel.org;
 h=from:subject:message-id; bh=zpkfrQGx3HEw4mQkvZcocv9aZkCal4I29KIfJ/D2G4s=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnIlNjyuuW10mWnMe12YpYtpBbILw/oa1vcfWlAIgo
 dNMLcxiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZyJTYwAKCRAk1otyXVSH0IFuB/
 9CwnqlHJzdVflgz0pHLn9L0kQFT2xOe1Gt312uazTWgyewYu7iK3X9PFcJQmMHnN6O3pjqxt9wEPlh
 LF6c9OabYyqx7POjS2VCXvctjF2uW7wTVG+cakl/pgOQPapDK227bFrTH2TKPCHPSa371QaZmJmka7
 DRRKmaN0iMrjSLcJ7tHuArMIQBsiplDn1zGjPnpHgbHq8gQyutvsMQrct1Dzt/OjD1uC3kU0LymlZr
 P5dE7IaMV0yED6omn7LrMOea1CfZM702AkSbbKnfCu4EzC6/oV5IrTHzuht0DrGtd/VKcCtmkUZ7Fa
 Q70ICvdhsRLN1MahlaDSaRrpqeG8it
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_084035_864515_C854183C 
X-CRM114-Status: UNSURE (   8.96  )
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

DDI0601 2024-09 defines several new feature flags in ID_AA64ISAR3_EL1,
update our description in sysreg to reflect these.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 72d6ff1a9c7588dc4894ec6d673791fde108a857..c77343ff0901bbaee98eb76615dc7b81a563c4b0 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1531,7 +1531,23 @@ EndEnum
 EndSysreg
 
 Sysreg	ID_AA64ISAR3_EL1	3	0	0	6	3
-Res0	63:16
+Res0	63:32
+UnsignedEnum	31:28	FPRCVT
+	0b0000	NI
+	0b0010	IMP
+EndEnum
+UnsignedEnum	27:24	LSUI
+	0b0000	NI
+	0b0010	IMP
+EndEnum
+UnsignedEnum	23:20	OCCMO
+	0b0000	NI
+	0b0010	IMP
+EndEnum
+UnsignedEnum	19:16	LSFE
+	0b0000	NI
+	0b0010	IMP
+EndEnum
 UnsignedEnum	15:12	PACM
 	0b0000	NI
 	0b0001	TRIVIAL_IMP

-- 
2.39.2


