Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C33D5B149
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 20:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vj3hnUzSseCfumZsB9qaoFxNvWeMhZZfCQgHGwR66tY=; b=TIj4RlsDiyOi2o/KzP9ek+0jHv
	3zEG3vAsD956aQ9mxcaw1faPu8HC67hU4wt7HLOEI99iZZw3dyv7+c8TCgrS5iJ0W/9baKoDsdRnq
	LjsSC50Ylyv4+kupakdpMmfD484fBO3CktWOpgpNHnfz/LqGlLRy32iUFJHFa5kZZZ55qlqNTGaYb
	UqPytFNnoRrlHcLlrDRBx3AVeMaQQEb5R4rQ3HTIJrNW75Slo+G8pLGTHfp5hHYBlfVApAslizi/c
	83VV22ZU581eIumZT+WcO1f+VZRskCpRwVhYnEujKsHasyxGEuIxfWnXLfO6fcLUG4eYp6Rr6gTx2
	JE24nvxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5WJb-0000000C9RH-10i5;
	Mon, 28 Oct 2024 20:26:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5WGT-0000000C8jY-43Vc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 20:23:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 389DE5C55D8;
	Mon, 28 Oct 2024 20:22:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D119C4CEE3;
	Mon, 28 Oct 2024 20:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730146981;
	bh=h/uAJKk9yowgbk3OaT+oWdhXXiH9RK517VPzloLbJs0=;
	h=From:Date:Subject:To:Cc:From;
	b=FsBl3R+v8FbAqGjbUZCHo8pAb2LgdeS4sXhlPLjXPciJeru18Ltq//tbfvW/XOOzc
	 dPxkCiQ/HD+RHGdnBPuH9wvg5mz22RK3kURBX93PH8MREV3mQRf41VFjqQARfdXg7v
	 acyj7d6WD98UTV2B9t0GBMW+SXUhHDLNU+3JL/GCNjwnSoIV4jbaHqOLZJ8Ezcyidw
	 IZQeKl1pt7/TbfjEsOUEHd18hFahFOe2GeN8SZqWdZI3tXtnPmF57RK/+pq5h0az+0
	 2QF4YEYmFAJ/k3tyaWQZvkK5bTFVgkXYTJ40x0n5XPKR1QKbQPRmFbEXlE+GquZp6b
	 PVG8YSBpBgsHw==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 28 Oct 2024 20:22:31 +0000
Subject: [PATCH] kselftest/arm64: Fix encoding for SVE B16B16 test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-arm64-b16b16-test-v1-1-59a4a7449bdf@kernel.org>
X-B4-Tracking: v=1; b=H4sIAIbyH2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDINZNLMo1M9FNMjQDIt2S1OIS3UTDZPOkxBQjE3OLVCWgvoKi1LTMCrC
 Z0bG1tQCGNGQSYwAAAA==
X-Change-ID: 20241024-arm64-b16b16-test-a1c7bad2478e
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=1107; i=broonie@kernel.org;
 h=from:subject:message-id; bh=h/uAJKk9yowgbk3OaT+oWdhXXiH9RK517VPzloLbJs0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnH/KiTZI1KXJe0z4HBNsQhRwJZzpV12/qfQwGfWxj
 /JMMjJKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZx/yogAKCRAk1otyXVSH0A2MB/
 0fPO4SRok6s/UUvAbL/isVyPqmA/03nUE6QHn9VxY3eP2r45ADD+X0zKSrpebv4SE8+CULRMla79ma
 yvaQCQ9g+Wd8tibBFEDjn2/n7bybwjl6y+TacYNsspr3wtsRhT7sjheQyW63xSV+WP65GXX/E4Za7r
 O+maPIYtPwwq7DAEOBy8GanTuYI5J1ySnFoUT1KM4OUKhJrgDp/ezC77JvHZORDSRARLYD8S6+VuT2
 hvwUG7zcwa69ykMN23ejQfGa4rWx/beIQtOij9q42uN1xH57cJdrqTQZb0Ha9nzKPCIBC10zp6wtCq
 OWMnQJxx/GhRaqr5iMyIv0zW4p03+Q
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_132302_082538_D5DB8945 
X-CRM114-Status: GOOD (  10.05  )
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

The test for SVE_B16B16 had a cut'n'paste of a SME instruction, fix it with
a relevant SVE instruction.

Fixes: 44d10c27bd75 ("kselftest/arm64: Add 2023 DPISA hwcap test coverage")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/abi/hwcap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
index f2d6007a2b983eba77a880ec7e614396a6cb1377..1e4ed89802f76c2bcbe4bfd1a9a987970db8b97d 100644
--- a/tools/testing/selftests/arm64/abi/hwcap.c
+++ b/tools/testing/selftests/arm64/abi/hwcap.c
@@ -361,8 +361,8 @@ static void sveaes_sigill(void)
 
 static void sveb16b16_sigill(void)
 {
-	/* BFADD ZA.H[W0, 0], {Z0.H-Z1.H} */
-	asm volatile(".inst 0xC1E41C00" : : : );
+	/* BFADD Z0.H, Z0.H, Z0.H */
+	asm volatile(".inst 0x65000000" : : : );
 }
 
 static void svepmull_sigill(void)

---
base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
change-id: 20241024-arm64-b16b16-test-a1c7bad2478e

Best regards,
-- 
Mark Brown <broonie@kernel.org>


