Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D12E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 01:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+9dQ17vVZjLbgcNuS39gmJ4NrWKG4/nyx6Wv/oiG1uY=; b=SCXl7/pvS2u+l548CdGXZW1w/n
	fMzcHi05Twy+X71cBEzGJqXWzv99xFSx2jFXfSjQfpYFUz3pYlSUfO1Pp6yvHoGMqV19M7zTtMjBT
	uhgjmtIaTA3VNKD0Wu7TR7kgHTcNW8JaAHAqhfXWj/G84QLCo8IkHnZSnnDe2TuYd7mHN7yldeZmg
	ifRsTfswkR415Qnday59hIZJMevW0KlCUBZnBfJJW6uAEZbF4LcTI4ZGtmYpL3NdlZaJBze859PW9
	ZuK2OiSx0xZay6WUXjCfD/gpvhMWOK8GjGn3kwyIYsRRSQookTJYGpzcAXVARJMttGUkhd0os7v/n
	fIbNCEpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBDX-0000000DNP8-45a6;
	Wed, 11 Dec 2024 01:08:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLB9W-0000000DMPV-319W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 01:04:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AFCFE5C6494;
	Wed, 11 Dec 2024 01:03:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76626C4CEE0;
	Wed, 11 Dec 2024 01:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733879074;
	bh=tQADLfY41IKkZA7AF+bwW0vqWMNKD/LB1TwUvRuOyFw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ekEfOa+D7gTQPfXr5Lye5GpRK+oVf9lwGrZT14PftSwovtc8ztssd4YCoIvMd13oA
	 26PUmg+8tFb/n6rbePs78HsPAY7101P65l8CWESgaz9uIABnIe/hHNaFkPbMr62aUq
	 1X2F5RimLEHgXwo7mhNhgNLZvo6ltr3zpyJ0YPaADIsrMKRp0OzeezzaRcg7Z7g6sY
	 eV3qxSf18W4MK6+zMBVQVK9gHt3E8pyz4fdSjBJC+JaC7E+9flV9OXz4k8xb5QivCP
	 btNQsv6xBcdbx+odrTszf3xwUfv0TG4W8WSChv5VYmjIpsnxUmuTBgql5JLEa/l0J/
	 xWyb0JFbhECmg==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 11 Dec 2024 01:02:48 +0000
Subject: [PATCH v4 3/9] arm64/sysreg: Update ID_AA64FPFR0_EL1 to DDI0601
 2024-09
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-arm64-2024-dpisa-v4-3-0fd403876df2@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=766; i=broonie@kernel.org;
 h=from:subject:message-id; bh=tQADLfY41IKkZA7AF+bwW0vqWMNKD/LB1TwUvRuOyFw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnWOUQ9vSB2ZButDKT3O5CIq700NkB8Wdk1iHpnq9v
 +9T4qgeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ1jlEAAKCRAk1otyXVSH0JlHB/
 4pmcGhkRMFoqxjd8JK/sPpRwDExvNZGBH1O8DfXZMGJxyelW4V0/BcJHCVWTzHwe5XvPatleecP2rt
 p/mThbtjJKP+gWZBSzqo4smYVgADT5nLO55IYsEsOf2tOaLy4lUrnLsiSm2DMejN089x9gjChr/Ylo
 5x7C/yukXmmGyuPP7eGmb20amBiJ2a5+om/3isx6F0r0+6YXyiW0MAV5EDNZHjqNoJX1Hr9kpagq3t
 4k/zHG3ZMAxcD5+mi4/6XtcvViQGsTAz1Y4BHstmmc1wZIS4XPCpYC18cyT79OEfQoXBR8oQ8fc9lt
 xIt/gPh6BQY/NCDv5soD3WUOOSZY+t
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_170434_802786_03E0ABE8 
X-CRM114-Status: UNSURE (   8.57  )
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
index 6273068fd4fdef145cb7dd49e2d9bee4db467975..14284a120a5796bb510a0382984236eba9bf73ab 100644
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
2.39.5


