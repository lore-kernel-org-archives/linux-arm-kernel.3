Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAAEE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 01:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ki8dLjMkjEMHoV+nUNlClvK3cClOLAf+gsN+h03OqZc=; b=DP8mDlkmVyQIV5IyAZlvbe8nWc
	AXgql+yGik9A1DoByK4lxO+HoXUpONIz7mOqw9cX3eg10As4gCPd036MBWfCsj6+FGPw3mNphNBpq
	O9DhFse9rOaQRAXowWEQI4eD1K/YmNWaHZD410+GUOVSKQdwwz43ToSwRJefdOZBst7rmySGnRg7V
	B2iWysdfQkOGpp9Y8D64TFzUr6/9bbudOFNSrPYYQitb35JF6xuIo408LIEem+mS1WGH0qTqyKA2n
	Q0VOlWNImrb5waK095OaXs0onwUd90S4YbXUCk2Z6jmpymsOGZeVG5jAiz6v0ckCJdjtZXFSVkGe0
	aaW7Idaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBBU-0000000DN37-2b2y;
	Wed, 11 Dec 2024 01:06:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLB9Q-0000000DMMv-3i3x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 01:04:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DE51F5C648F;
	Wed, 11 Dec 2024 01:03:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8481AC4CEE2;
	Wed, 11 Dec 2024 01:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733879068;
	bh=JZ5YG/ZPtu0+rE3J++aCFRB1wnbLT9/tbF2mceWYsQI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Wh3XVNlKH9j7aWMeMKMS2zglc1MDzb3cNC3P3ZVhKF1a/2Vw0HuF1nvrtu8PcbhdQ
	 vzxGzsKJL8j+3EVbYjpNZUvkbOUslBar8YVfHs61E0BGXh8PQ6EOsJBFy9CyC9kIUY
	 cwSEJ9Vt2TYNUnPYeGiZ5opuHm+Qg9eqiU1bCy+g4eWiEMpUKYNeY1yDwMg02s8GD5
	 khF0m9ou4Dt9I5W9iDzeBAopue0CfpNT1oSIb2tvVptRFg4RxY55Q2ruXTmCu1DLkG
	 LKB6oO44s3ICHPWJe3SKq8vd6bKtpclik3tEpp4MfgfLOg/4OZZcSPswlX3rcZ8m3L
	 uJG6mu8yV3e2Q==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 11 Dec 2024 01:02:46 +0000
Subject: [PATCH v4 1/9] arm64/sysreg: Update ID_AA64PFR2_EL1 to DDI0601
 2024-09
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-arm64-2024-dpisa-v4-1-0fd403876df2@kernel.org>
References: <20241211-arm64-2024-dpisa-v4-0-0fd403876df2@kernel.org>
In-Reply-To: <20241211-arm64-2024-dpisa-v4-0-0fd403876df2@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=771; i=broonie@kernel.org;
 h=from:subject:message-id; bh=JZ5YG/ZPtu0+rE3J++aCFRB1wnbLT9/tbF2mceWYsQI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnWOUPKGYKMBg6LVTy4ZKj00alAeR2T1/6KyqDXfuC
 v2nAsb2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ1jlDwAKCRAk1otyXVSH0GAcB/
 9A9ZssLa2ITwyImdrKFofGZHRFhONgiad1DSNOH8rRWAAp3W91RDBwqlRz57TxQsbHGRX38JV1qTiD
 n5KbKtyzjNrEPrz/apU6rQW5r/Jdk6xV53nqDZUmWEsxWdUvv7X8LkU9UK+sBqtMi+afHPXTFdjv/G
 QWccbqd+SHpQsA0gShWPpVdbeoBY44svHIkOaff5/pDoPn1geub7iah+SFjS0/U+6zSeuasxG224rC
 pVdfvxaJmLCHCxSEZ6MTEpVc4eG+Cfy782fLZGJH3mK8Pd21Li41PIpifmK76xQyLaeeUcv3hpwtUw
 7BtchhuJ3OkZoHPhYBKMYBaRKwVuS+
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_170428_973127_F71E79E3 
X-CRM114-Status: UNSURE (   8.49  )
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

DDI0601 2024-09 defines a new feature flags in ID_AA64PFR2_EL1
describing support for injecting UNDEF exceptions, update sysreg to
include this.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index b081b54d6d227ed8300a6f129896647316f0b673..911f16c82ebd3ee98ffed965b02a5c6b153bc50c 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1010,7 +1010,12 @@ UnsignedEnum	35:32	FPMR
 	0b0000	NI
 	0b0001	IMP
 EndEnum
-Res0	31:12
+Res0	31:20
+UnsignedEnum	19:16	UINJ
+	0b0000	NI
+	0b0001	IMP
+EndEnum
+Res0	15:12
 UnsignedEnum	11:8	MTEFAR
 	0b0000	NI
 	0b0001	IMP

-- 
2.39.5


