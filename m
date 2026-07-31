Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BDCC54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 12:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kyh12vLSEfb1JF7lQC/qy5BquW9r8pj96hLZDvx4BW8=; b=08dLXkPDh1aPwZHeWuDQUHe7u4
	bwDZu2WNb9K33NXD+Q5LsYdNWNnaYyiH3pF1NPcFHVKt2DDEMEQStl1y/I9/CzrzbyOXijfCVqW4i
	5LewifXW7aArTR9vdb85WAL5YtwjCNPFTWZoA/q/GCtAPkUs+nJXvJfbHEucHvXm52xOab/KHXjSp
	LP6ld3rm8BmTbVfw8yL8R6KaqgbmQpBCK5Y4511808eOs6QN9cLi0o27B4Nz/ItZ2peo4ZhKacr1c
	4el/0G0YVZsbZYzpvnYq6z7vRFycLtQPv0SK410skxSivxQMMHrwVZOBPY5qAkFXf8Q6PsGsnOQHW
	B2Z1Qbgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpmVN-0000000CUyW-3GhS;
	Fri, 31 Jul 2026 12:38:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpmV4-0000000CUmx-14HY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 12:38:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0BCCB43FB5;
	Fri, 31 Jul 2026 12:38:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 369C51F000E9;
	Fri, 31 Jul 2026 12:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785501485;
	bh=kyh12vLSEfb1JF7lQC/qy5BquW9r8pj96hLZDvx4BW8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=K6nhiTlfe2pggWvdYfVE9QTkyv2W93p7wmB3kTEVVGHdiDFYvtYe2GACw8qlSKlWy
	 ltt2U+Y4pWm9g9SZ5icyQQn+frnAFm7h1wDUGUqSIDUDCxt9bADLpyksF+Nl4HcEjt
	 lo2YaBHhFnZnkF8ZDQjK5ays6/w23Rgpgum3fJ4BCrsKiGYuwhD/HpQ16GKI6vnc/i
	 537LxE6DvCKJ1/Wg7YQ6D+6dvHkTQMIk7hyQofMRZUyQZJp2aPFQgYTftX1h6sppDU
	 LiAcq6Fwb/yCZ6uwNGXuomomMAu48264oojTjkvg5K9tXnR/TxBygET/kHP5AqkotD
	 6Us/REO0F5HlQ==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 31 Jul 2026 13:25:49 +0100
Subject: [PATCH v17 11/14] KVM: selftests: arm64: Add GCS to set_id_regs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-arm64-gcs-v17-11-5e39ca01b14e@kernel.org>
References: <20260731-arm64-gcs-v17-0-5e39ca01b14e@kernel.org>
In-Reply-To: <20260731-arm64-gcs-v17-0-5e39ca01b14e@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Fuad Tabba <tabba@google.com>, 
 Oliver Upton <oupton@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=987; i=broonie@kernel.org;
 h=from:subject:message-id; bh=d3SxEv6RjSY+xiyxMK7Zi+tIruIS+RbgPdYjX8k0TSU=;
 b=kA0DAAoBJNaLcl1Uh9AByyZiAGpslwShol9Alyz+eL9zGAe/UqkufFXtpqYi3w7AZOQDU/HJV
 okBMwQAAQoAHRYhBK3maKpnVxi1n+Kf6iTWi3JdVIfQBQJqbJcEAAoJECTWi3JdVIfQJaYH/1P0
 kjeX3MFHwqfLkA3wow9svYoPSxOKHSnkfby/7eIOgH8PjnaiSbBp+DF7o3p8uUEg/rQiEZuETrW
 yslx6/E57OQ+qR71eTMQZn/SG+Gdec097Jhnlp5jeIQf0B6NxwpB7/3yTtexU7lw6MemXQpPxwS
 OZK2NFFBhpI/PNLtgkb7Q3cv/2zaK/Owy6JX0iqB+ofF15dBQ/hVEH9K6BnCUylhOq5CXBqc05U
 jW9ypAihGqKIgtcSnTtAy7G7OEIZVA9kjfItgG4KnRrroHrcGfy70CUSRu/m8H8IjFkBXFAqG69
 cxSrPj3blqyb6NU85H3ehw8giUrDAy1oP7WDT/4=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

Now that GCS is configurable via the ID registers update set_id_regs to
cover ID_AA64PFR1_EL1.GCS.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index 7429a1055df5..34e59fbbbe89 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -154,6 +154,7 @@ static const struct reg_ftr_bits ftr_id_aa64pfr0_el1[] = {
 
 static const struct reg_ftr_bits ftr_id_aa64pfr1_el1[] = {
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR1_EL1, DF2, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR1_EL1, GCS, 0),
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR1_EL1, CSV2_frac, 0),
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR1_EL1, SSBS, ID_AA64PFR1_EL1_SSBS_NI),
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR1_EL1, BT, 0),

-- 
2.47.3


