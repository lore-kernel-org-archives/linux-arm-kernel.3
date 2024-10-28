Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB521D5B154
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 21:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZ12oL1TMxUtX0/WV/egYiMw4/82g7s1FqB3IDjGGWc=; b=SmTL+2oYkdVe7MVd45iarVdb8d
	8H0y6L1gV7+H29hqnmJV4V0Ur8C/9GEn7tPFB6y3NJKymJzS+wBfA046TLvWUxn/fYKR6dHb4Lc8u
	N5izbJG8yA6lZ5kSSNZl/8nN60Vg3XXozd4UZjHxNmhsf1BI+/tzoz3JhG1FvzRd4t+qKhKUiVKOs
	9uhZxXW3m1eSJgbQJYOgtltbpQAYFGvK/hTY/vgvAuteZaiubHiC5GBOx1p3aTPGDNjQnsC9QS4NI
	ClrY7a8dmxV9InuHBTxQqumfIXafV5C5B5DaW1ecStcbdzyMytv7oHOAzlOzcKQEDI+ztgHf5MVg3
	AAa5XfzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5WrI-0000000CHKJ-0g32;
	Mon, 28 Oct 2024 21:01:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5WJu-0000000C9XK-0nsx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 20:26:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7FFD3A42757;
	Mon, 28 Oct 2024 20:24:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94765C4CEC3;
	Mon, 28 Oct 2024 20:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730147193;
	bh=txJPBAKW/px8wqxUeO43xJFh9Jn0eyt07T5bMMNoQs0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ztrykpt+4b7wD4gyj6F+Wr6ZINzimVJUWczh+xmbnDbb55sTX5kn9+tc4qgX/jIhW
	 klLnlzPu/Yo2GHMWMXbhh8Pp1bGKYOgl6pV8vRwHOQMeZBggY01628hCMd/i1V/GYl
	 GVbnEdvSLoOB2zSzsimquyN4sg/WZWKMIAWFOUy70BSkKGBq2zzK5nwsRf/lm3klA1
	 PiJRjsOFWyeL7bqxIQXMJkrkPfrU42RdAKBlQ7L5760CuSmVViFeSPTQeYYXkocTlp
	 lBKMYK1mq5HMq6Ev1/BRMCSXPAUq+QcVXycTCxLvWjI8su+GlR6obHnIaOStDhL9ky
	 b2hzEssrxzG7g==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 28 Oct 2024 20:24:12 +0000
Subject: [PATCH 3/9] arm64/sysreg: Update ID_AA64FPFR0_EL1 to DDI0601
 2024-09
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-arm64-2024-dpisa-v1-3-a38d08b008a8@kernel.org>
References: <20241028-arm64-2024-dpisa-v1-0-a38d08b008a8@kernel.org>
In-Reply-To: <20241028-arm64-2024-dpisa-v1-0-a38d08b008a8@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=766; i=broonie@kernel.org;
 h=from:subject:message-id; bh=txJPBAKW/px8wqxUeO43xJFh9Jn0eyt07T5bMMNoQs0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnH/NnuV9phKJk9PYMPihoIk1sMnV7v0rwyQvWGFwr
 BqIRvviJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZx/zZwAKCRAk1otyXVSH0IxZB/
 9V3mOfS/3YcuhQpBI0oXyJHV9MoTvOq6YGCtMPwQs2imeiPfLoooRLEAVju+MCRFb7WxFaV6Uevp0K
 qu4i03F+KDohg7V5MgE2ODAMS+r9xn4fpLVXWBiIfJ1xCdDvsOd6dpmKLqAYGqODvCvk4sF/W6+S6j
 q7y2KTfR76DWdMXdBod6WAG/SL45Ck72Pzm9BBBggGrxw/3XSwzy5KqjqrFtqDiEAczxjU1bpZsJya
 z3I8KrQR6yRmJqZR7ZxJKTgmThmyaPZVXbb1HF9DVPVJYZ+JuPZrr/VZOyhNlW4ho9Ah2N+tAhogx3
 Kh25R8TO5Infk8/21yO4RIoDjzP9dZ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_132634_329396_62876665 
X-CRM114-Status: UNSURE (   8.63  )
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

DDI0601 2024-09 defines two new feature flags in ID_AA64FPFR0_EL1
describing new FP8 operations, describe them in sysreg.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index c77343ff0901bbaee98eb76615dc7b81a563c4b0..26f1350c9d2e3baf39ac3bdcc96fc1e6deb5a5c6 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1180,7 +1180,15 @@ UnsignedEnum	28	F8DP2
 	0b0	NI
 	0b1	IMP
 EndEnum
-Res0	27:2
+UnsignedEnum	27	F8MM8
+	0b0	NI
+	0b1	IMP
+EndEnum
+UnsignedEnum	26	F8MM4
+	0b0	NI
+	0b1	IMP
+EndEnum
+Res0	25:2
 UnsignedEnum	1	F8E4M3
 	0b0	NI
 	0b1	IMP

-- 
2.39.2


