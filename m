Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9AAC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 01:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2QISmFyzBGtwdC4qBbw8EaH3ARP6S4Dx8iEEmYy6dPM=; b=IFg2Z4S9z0jy7887xga6ebA3b8
	gyTAl9FsgcZ7CwRZI0L5NurXLDJTtrXrCsqFijoD18f04ZApu5gKg57JWpDlJ/8RDMRMKmcAH3EV+
	QuOZ6+RrbvGrOEOE+YY9K5TsAl6IONmg6ssm9oKy3GdxppgBA1hOeSVBYfDshCWAktGpb06/K//ej
	kdSJNZZXaIsp+DtJ5T2w47hnz0hqMCv70dQsnwngqOC6eiB7Xts9O0TAmlYKVrbKZIAe7KSUU+dfZ
	HfNzr/pmXnrlyXswiRYVdqB5GF/4AS1ASxyA/p8e1+pCFPH24fpV67vJUCsnH6NMlsBYewo61Ri1G
	tj9ivW6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Dv4-0000000BPre-33hZ;
	Thu, 17 Apr 2025 01:19:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5D6J-0000000BHMs-2Lst
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 00:27:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 97378A4B0AA;
	Thu, 17 Apr 2025 00:22:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 605D2C4CEEA;
	Thu, 17 Apr 2025 00:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744849650;
	bh=8wKbF7ujl1hlDs76hV4PzHiP9Uo97M2NjFijaiGNkbY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=khJ9RHw5mLTikw30MT0YwWM39KMMLBLBT6Krpr0l3eyfDmvICrx4DZuKChTJkS0VC
	 lb/WPUBX1dt85xLJyLEZF5n5qNGHauyTaJhB0jdMvfpyATUeFDQJqj6vRTgoNGuFlr
	 hLSnA/3A39QZBkq7Mz1qQm/5h7gk6H8NmUxCRqyIrniKuQyc2hlkCsrEShLXSxyoj2
	 7Oq6LaZXVwWTC0tNGKjkbGhjlEr7ztDsTTZ4HjsGTnyOmMj/KEOUjSYSS5aaWlnYK0
	 OjrIZ39GMQaoDOVLZs44Pv2jJwjNonqxK9WSLxnYsX5zmpMylbJ7rsT1gIniSz+1HH
	 vqrh8W0LDWTiQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 17 Apr 2025 01:25:31 +0100
Subject: [PATCH v5 27/28] KVM: arm64: selftests: Add SME system registers
 to get-reg-list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-kvm-arm64-sme-v5-27-f469a2d5f574@kernel.org>
References: <20250417-kvm-arm64-sme-v5-0-f469a2d5f574@kernel.org>
In-Reply-To: <20250417-kvm-arm64-sme-v5-0-f469a2d5f574@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1636; i=broonie@kernel.org;
 h=from:subject:message-id; bh=8wKbF7ujl1hlDs76hV4PzHiP9Uo97M2NjFijaiGNkbY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoAEqEN0PBi+5sh+Ufd6YUKPCQBIGQCBFHgZHOLVxt
 MwC5Lq+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaABKhAAKCRAk1otyXVSH0IbxB/
 9kt29k0vrzqc7H+CKPAvHqHz2pM9oN8EKRlhOKwQxgaYKF86p42RWIW8AHBlgiRWuZBZP5CBQVs3av
 nd2ICQPqXMvFnHPCcfkAgtEVUJ+wMhvmX2+aAPYaCSc6L5WMZqTYZ9D6oy2mXOC2sqF6nCXTvICFM9
 T+QU8ahW5T1Exv31Drzd9sumQoIzb8KkWXGxRkay6FJsrgbbJjIw6plFpvlRsbiTYtkuP0+Zgmre2u
 Ne4dKicSIPFfHHvH4gz9SXuOvhAwmxLhSXVPodE/Lq/P0IW+FurG36AX2rbVIf06UvAWtzQL0BV9f6
 o2nzjXBnLBkjIPYFFikRXU14ERVMDC
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_172731_745440_229FE95F 
X-CRM114-Status: GOOD (  10.91  )
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

SME adds a number of new system registers, update get-reg-list to check for
them based on the visibility of SME.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/arm64/get-reg-list.c | 32 +++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/arm64/get-reg-list.c b/tools/testing/selftests/kvm/arm64/get-reg-list.c
index d01798b6b3b4..920784aa2838 100644
--- a/tools/testing/selftests/kvm/arm64/get-reg-list.c
+++ b/tools/testing/selftests/kvm/arm64/get-reg-list.c
@@ -23,6 +23,18 @@ struct feature_id_reg {
 };
 
 static struct feature_id_reg feat_id_regs[] = {
+	{
+		ARM64_SYS_REG(3, 0, 1, 2, 4),	/* SMPRI_EL1 */
+		ARM64_SYS_REG(3, 0, 0, 4, 1),	/* ID_AA64PFR1_EL1 */
+		24,
+		1
+	},
+	{
+		ARM64_SYS_REG(3, 0, 1, 2, 6),	/* SMCR_EL1 */
+		ARM64_SYS_REG(3, 0, 0, 4, 1),	/* ID_AA64PFR1_EL1 */
+		24,
+		1
+	},
 	{
 		ARM64_SYS_REG(3, 0, 2, 0, 3),	/* TCR2_EL1 */
 		ARM64_SYS_REG(3, 0, 0, 7, 3),	/* ID_AA64MMFR3_EL1 */
@@ -52,7 +64,25 @@ static struct feature_id_reg feat_id_regs[] = {
 		ARM64_SYS_REG(3, 0, 0, 7, 3),	/* ID_AA64MMFR3_EL1 */
 		16,
 		1
-	}
+	},
+	{
+		ARM64_SYS_REG(3, 1, 0, 0, 6),	/* SMIDR_EL1 */
+		ARM64_SYS_REG(3, 0, 0, 4, 1),	/* ID_AA64PFR1_EL1 */
+		24,
+		1
+	},
+	{
+		ARM64_SYS_REG(3, 3, 4, 2, 2),	/* SVCR */
+		ARM64_SYS_REG(3, 0, 0, 4, 1),	/* ID_AA64PFR1_EL1 */
+		24,
+		1
+	},
+	{
+		ARM64_SYS_REG(3, 3, 13, 0, 5),	/* TPIDR2_EL0 */
+		ARM64_SYS_REG(3, 0, 0, 4, 1),	/* ID_AA64PFR1_EL1 */
+		24,
+		1
+	},
 };
 
 bool filter_reg(__u64 reg)

-- 
2.39.5


