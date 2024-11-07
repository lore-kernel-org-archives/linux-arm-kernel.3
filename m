Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBBFD29FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 01:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z5rQCSr4iULhFlqE3FOeqqs7z/QQ1MdiDAVtesoGsmU=; b=4yU/gUS2X+rw23Gx5gsUP8BeTh
	94BIc+4VNsmo0TYNCad60bB8IRzyy7bXJMlvpRuPzhf3mYnLoeCYlRG70XAmK2zRWMn9aOmDGPnLd
	kYneyJBs4VKImBQs/Sxhi9m08fFMiD33yOfEux0eI6gHkDBh+L2EcDPOnWOLXh20qczjAZEPhyeAe
	FRLt4rnYq4VdhfKehNlzuzAPZsLeH0mRwQvDeAMGpVxP1VZwL0P6PTr6CBsm8paZ3QFvllcdFyBli
	ZKD3NrdsJ/nVlzXQTQFBc0BizV4GMCCAoqJ9O0KzrRe3vJVCzwSnktMBim+qYIIyA1Yb1Tv2Ltu4m
	tyTZDIDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8rb8-00000005KrH-3s8V;
	Thu, 07 Nov 2024 01:46:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8rUG-00000005J9o-1TGx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 01:39:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 26C685C5461;
	Thu,  7 Nov 2024 01:38:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13874C4CEC6;
	Thu,  7 Nov 2024 01:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730943543;
	bh=KklDMIgTg/IOEK6oxdwvdnPBCakPUdGsPPh8gcrBzcE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UihTm/GHRtLziJ5MHQKpNiGQVbYwHV4s7wXIXepK/uTo3Hcu4gdAqhS6M/WfR/vM8
	 /z3TGvCgxn/ebUpIcQtmJ/jLqqgtdplkymYX6HA2fdZj3vyu5gK6kncipxyjJ90SmV
	 7kXRkjOLDYSazv0BRB8jEU4tsJ3FvM0uiHiYm8mvnrDLSgkKB35OtqbFe4Feq8a2RG
	 ZL6gYFybgHgvb/n9QoxiOvcvwyTMHBrIg5sbyT0wmN9or6yNnes0lSN+ng4XjlT15k
	 tJSVtN67TK21bf6pwh+MSVyUJHHDGoXSou7ND8daNQcobAKlM3oTERj7x/EAO1PJ54
	 5Nm4O81+qbbpg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 07 Nov 2024 01:38:06 +0000
Subject: [PATCH 3/4] kselftest/arm64: Expand the set of ZA writes fp-ptrace
 does
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241107-arm64-fp-ptrace-fpmr-v1-3-3e5e0b6e3be9@kernel.org>
References: <20241107-arm64-fp-ptrace-fpmr-v1-0-3e5e0b6e3be9@kernel.org>
In-Reply-To: <20241107-arm64-fp-ptrace-fpmr-v1-0-3e5e0b6e3be9@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=1674; i=broonie@kernel.org;
 h=from:subject:message-id; bh=KklDMIgTg/IOEK6oxdwvdnPBCakPUdGsPPh8gcrBzcE=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhnQdKb0Q/VNPg0Pm2klw5ssbN95+tDtay8dsohPz91d7387x
 +prTyWjMwsDIxSArpsiy9lnGqvRwia3zH81/BTOIlQlkCgMXpwBMpK+B/Z99llzGdrcXVg7+HX/mn6
 /e8K6TaUe/l2bCVFHD1bXaOS9tivgbuTfPf3ov66HptM6ohUuTeEPe39z51jfo02OWlUt3xGl4XT6n
 MEtVeqf5RqvUAA7eGVUFWgrN15gdWHW1bnoeytsckHpw2crysx5NnTdl9XYskGRdWFj4MOGzh/7Uaw
 wtp+2FP1hZ7I2Yl97s8iHQRFU5avHB4vAXTFlFsYXP5wg/F81fGGWuyZ7wPbxsZWphyJQLzKG6qu+O
 x0tecV7bvqItqmTR1oyct3tFmOb1Vn903cDufnlW/rsTFmEHl6+SCGSb++cIczRzn3/UVIFv0stS+z
 m7rRv4Wa+t2ySctObrvO2S8gK2AA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_173904_522818_CC42C265 
X-CRM114-Status: GOOD (  12.66  )
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

Currently our test for implementable ZA writes is written in a bit of a
convoluted fashion which excludes all changes where we clear SVCR.SM even
though we can actually support that since changing the vector length resets
SVCR. Make the logic more direct, enabling us to actually run these cases.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/fp-ptrace.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/fp-ptrace.c b/tools/testing/selftests/arm64/fp/fp-ptrace.c
index 22d52a75ac9687673c4354f66abcf7204ce17875..a35dc6d8f82af47bf6adedba7e69a6577ee9f7de 100644
--- a/tools/testing/selftests/arm64/fp/fp-ptrace.c
+++ b/tools/testing/selftests/arm64/fp/fp-ptrace.c
@@ -1080,21 +1080,19 @@ static void sve_write(pid_t child, struct test_config *config)
 
 static bool za_write_supported(struct test_config *config)
 {
-	if (config->svcr_expected & SVCR_SM) {
-		if (!(config->svcr_in & SVCR_SM))
+	if (config->sme_vl_in != config->sme_vl_expected) {
+		/* Changing the SME VL exits streaming mode. */
+		if (config->svcr_expected & SVCR_SM) {
 			return false;
-
-		/* Changing the SME VL exits streaming mode */
-		if (config->sme_vl_in != config->sme_vl_expected) {
+		}
+	} else {
+		/* Otherwise we can't change streaming mode */
+		if ((config->svcr_in & SVCR_SM) !=
+		    (config->svcr_expected & SVCR_SM)) {
 			return false;
 		}
 	}
 
-	/* Can't disable SM outside a VL change */
-	if ((config->svcr_in & SVCR_SM) &&
-	    !(config->svcr_expected & SVCR_SM))
-		return false;
-
 	return true;
 }
 

-- 
2.39.2


