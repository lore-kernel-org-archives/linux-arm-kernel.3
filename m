Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8180CCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 19:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B6uFCTQ3oaW30KgEERcz6P3v9NHZ2fvnh4lJdi0Rwug=; b=iduMk/o/Rsssid
	tLiWSjbfQVDqa2u9u5tXE4KHo8ntS5HilexvP289mszwOmo1ujjMm2IqAku/xk9afdHVTCOYtMuby
	ekUKKw19YeH8O/MMtgsOC9IyDm2N5u1gXLlpfmsWEvrHgr3oGQdbdVESaFWl5qYxcOLchQbJL1KAs
	mg63U7TA1zapCU4+xk7pGQWJlfQL/ogzbfQAvh0UzhL/sohHrQzaj0whtpgEfnoY8h3OsBRNOETV/
	BR2zjQ6TTC6JhMs8KJZmKJgsp+NkSBSRpwez+0+Th3J7e9uJx9Znrs+BnXxghuPB0WhofSwbMyIFt
	+HL02EVwRJhcY9+SLR8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v03j0-00000005qRS-06IF;
	Sat, 20 Sep 2025 19:58:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v03ix-00000005qPw-1rf5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 19:58:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 310E644C12;
	Sat, 20 Sep 2025 19:58:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E32CFC4CEEB;
	Sat, 20 Sep 2025 19:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758398302;
	bh=N/5+0U8xq7Zk0a8gL9aaRKTgfFfm/74fnNbziAndS6o=;
	h=From:Subject:Date:To:Cc:From;
	b=LHp1VIKfKI+eepDbB7yikTc5ETwfy6Nq9fSlWZIeztY9wsL6No7L1c05IgVWoEXGi
	 MRzD8R3+CfV7g7sSgQo6po6X9KrmPmsiUYrEHSTHZ93Ffp1iMs5WgbFhF1FE450Nlz
	 n+xy7lEx8CQ4Kny5VjJA09R8etiD7AI5O6Iea9YaD792eTrtaf1H4cIVM3xJXI35ov
	 1mf1I1h42JVEDlE56sgWsGYe51yROme8x55JrBiM4bsT2eIPRp0100MK2kB+1lSzUQ
	 YdGXT1lusTN4Z+7RD2XS8IsQ771gLjmb38lJUNyS7MOzYhw0rw2aqScBLfk/lH9yPM
	 8kU5mKEmsWXZQ==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] KVM: arm64: selftests: Cover ID_AA64ISAR3_EL1 in
 set_id_regs
Date: Sat, 20 Sep 2025 20:51:58 +0100
Message-Id: <20250920-kvm-arm64-id-aa64isar3-el1-v1-0-1764c1c1c96d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN4Fz2gC/x3MTQqEMAxA4atI1gZa6xT1KuIinUYN/pKCCOLdp
 8zy48F7ILEKJ+iKB5QvSXLsGbYs4DvTPjFKzIbKVB/T2haXa0PSzdc5IJGvJZE65NXiaEJsKLj
 ofIA8OJVHuf/zfnjfHyhGpbVsAAAA
X-Change-ID: 20250919-kvm-arm64-id-aa64isar3-el1-f0bd8ab3d36b
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-56183
X-Developer-Signature: v=1; a=openpgp-sha256; l=900; i=broonie@kernel.org;
 h=from:subject:message-id; bh=N/5+0U8xq7Zk0a8gL9aaRKTgfFfm/74fnNbziAndS6o=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBozwdZ263G51AbBxPCoC9tq9dlYHu5oWbxX0dPZ
 TjHX2QkL3aJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaM8HWQAKCRAk1otyXVSH
 0HveB/98b1Ix+bm1YAuE6OCxpqygoEcAVSg/qamEdFKMVwqnqIS0gcuTq0pefZ1J148lRUIAYTY
 fMMIRqjcCUmxqFE9JZ9bFX2LFL3tkueH92DSQTP4RrN+BQQ2nUwvJYNKAXVn8dvxPwYbKoCxZs/
 +yYpfR8JYP914CavjErEowg3ozNptxtr24JASzk4KcTgXy8Vpr8U8eUrMhazn+A4umkBOASVRhd
 xLTGQ8s7PzIlHvv7Pm5w05R57lCkqGZIKkoaU2Vg6HM2kQcv2QanNWBEdBHlLFAcpVmmuAU4diP
 VN6pe4IrGLjYojk7DaI8GuVGJkC82LXZ7mUpviGpBwKxmB4P
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_125823_507941_DB636080 
X-CRM114-Status: UNSURE (   5.61  )
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

The set_id_regs selftest lacks coverag for ID_AA64ISR3_EL1 which has
several features exposed to KVM guests in it.  Add coverage, and while
we're here adjust the test to improve maintainability a bit.  

The test will fail without the recently applied change adding FEAT_LSFE:

   https://lore.kernel.org/r/175829303126.1764550.939188785634158487.b4-ty@kernel.org

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (2):
      KVM: arm64: selftests: Remove a duplicate register listing in set_id_regs
      KVM: arm64: selftests: Cover ID_AA64ISAR3_EL1 in set_id_regs

 tools/testing/selftests/kvm/arm64/set_id_regs.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)
---
base-commit: 5db15c998c390efbe5c82f6cda77cb896a3a6a3e
change-id: 20250919-kvm-arm64-id-aa64isar3-el1-f0bd8ab3d36b

Best regards,
--  
Mark Brown <broonie@kernel.org>


