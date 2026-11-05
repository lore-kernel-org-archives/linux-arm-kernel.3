Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AED6606D807
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TAA5zpO7;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iSvqxE5I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=nzMu0LvOVRk4gYucc352LR/eb8z9dwYmb9Fy/SL8Y2Y=; b=TAA5zpO7ppMref9u70g1DmY9Xu
	Nz6SS52/I3E+u+WfJjHO1Zswl8AxRPHJs37WoLHxp8CHfbt4t2yMVgUFAPXqA/oTr3NB7cRDUvb7q
	PWvKFiEY0oIu7lJuTeC3H6rdtjA95K2e/mKlXihFKnInqWoN2+xClad+hoT8ycuiiANvp5rPfl9Eo
	yLHO9pHn2y53mgrj2/ou1v8C8slz4g2gCWKmBjUaoHivUXCgdWT+9OhIWnyANbMzTZhR4Cq47bykq
	UjOEQr60HfWjAAun+lGtEcgwJydbpfHsEBwRfbmoQEImMiHJG4BpiGsf9sJ6BaGOEHoHFbeRpZw2P
	+Os6CE1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwMv-00000008sEi-061G;
	Thu, 05 Nov 2026 12:15:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwMu-00000008sDw-1353
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:15:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 004A740D5A;
	Thu,  5 Nov 2026 12:15:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D2261F000C1;
	Thu,  5 Nov 2026 12:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793880899;
	bh=nzMu0LvOVRk4gYucc352LR/eb8z9dwYmb9Fy/SL8Y2Y=;
	h=From:Subject:Date:To:Cc;
	b=iSvqxE5IYBIU+Y5GCKJKuOH3flf9F9UfGQLljxlsMA8++OkLyi3S/Ogy4ufmmnV/6
	 yMWwJ2BahIMvDBL3aUnVGSvkKZ6kh5mO9cmgITUP6HESkzceUHAU6dOHiQqIf7BSaP
	 MO/2gtDLNoBa4WO51NS8IJN9rbblu59vjlGDRlAYfvA+H6OaVG37jndQPsyBAuQW5o
	 6kyMPS+vUUlSLoi3lfrvUyPZ6trmts5vQfe6mqWRqe4tI8q1+0fRwG6AS2WWPn5NUX
	 XkKBYZVOHHrBFFmWZVVOtO7EWZlelUoGhVQKlRURuvcCCrY4cU5RSZu/rRVuD++nQJ
	 xPMhv+qfaBf0w==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v10 0/3] KVM: selftests: arm64: Improve diagnostics from
 set_id_regs
Date: Thu, 05 Nov 2026 11:47:18 +0000
Message-Id: <20261105-kvm-arm64-set-id-regs-aarch64-v10-0-d5a6aba69d19@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMhs7GoC/4XSS04DMQwG4KtUWRNke/JkxT0QiyR12lFpizLVC
 FT17mQqYEBZZOnf0mc7ylVMXEaexNPmKgrP4zSeT7VAeNiItA+nHctxWwNBQBqBnDzMRxnK0Sg
 58aU2ZeHdJEMoaV8zjtFab7wCTKIa74Xz+HEf8PJa6/04Xc7l8z5vxiX9lgfoyDNKkN5khi1Ft
 I6fD1xO/PZ4Ljux0DOtHKLqcVQ5YykTqqww5oYbVo7Q97ihcjEHZRWngdA1nPrhDCCYHqcqlyx
 npTWGHIeG0ys3oO1xunLBQKbotWGihjMrZ/vHmspZUuRs1hmhPdaunAfscXbhIhgdIW6DDw3n/
 nDU3c5VTrsQIlOiHFLD+V8O68frcX55uzhQTNbn4P9zt9vtC1JoiTNEAwAA
X-Change-ID: 20251028-kvm-arm64-set-id-regs-aarch64-ebb77969401c
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Oliver Upton <oupton@kernel.org>
Cc: Ben Horgan <ben.horgan@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
 Sebastian Ott <sebott@redhat.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3029; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7s/Hv3YNIBJTtux/ZgPX0J101dWs/N9Z8C+esxNBSM0=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLeFNtPmJ2W+sjbcufOu6F6kQ1vF1h89O3X7deL6dHYl
 n6hPmhyRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACbyzpaRYenmyd7rz0zNuDfr
 oOX96Hv71mvwFETs599TumX5CzddxyUM/4smiXkbP7x36k9TZ7CInoS3dzNPj59zY3r45oDGx8J
 pHAA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

While debugging issues related to aarch64 only systems I ran into
speedbumps due to the lack of detail in the results reported when the
guest register read and reset value preservation tests were run, they
generated an immediately fatal assert without indicating which register
was being tested. Update these tests to non-fatally report a standard
kselftest result per register, making it much easier to see what the
problem being reported is.

A similar issue exists with the validation of the individual bitfields
in registers due to the use of immediately fatal asserts. Update those
asserts to be standard kselftest reports.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Changes in v10:
- Use __vcpu_set_reg() when testing valid writes to avoid asserts.
- Use local variable for reg_id more.
- Link to v9: https://patch.msgid.link/20261103-kvm-arm64-set-id-regs-aarch64-v9-0-ab32bc79fa9c@kernel.org

Changes in v9:
- Rebase onto v7.4-rc1.
- Link to v8: https://patch.msgid.link/20260929-kvm-arm64-set-id-regs-aarch64-v8-0-58aabe2c2fac@kernel.org

Changes in v8:
- Convert another assert.
- Link to v7: https://patch.msgid.link/20260901-kvm-arm64-set-id-regs-aarch64-v7-0-7b065b0bda9a@kernel.org

Changes in v7:
- Rebase onto v7.3-rc1.
- Link to v6: https://patch.msgid.link/20260719-kvm-arm64-set-id-regs-aarch64-v6-0-724287f5f108@kernel.org

Changes in v6:
- Rebase onto v7.2-rc3.
- Drop changes to handling of aarch32 related registers on 64 bit only
  systems, an in kernel solution is preferred for those.
- Use a define to count the non-test_regs registers.
- Link to v5: https://patch.msgid.link/20260317-kvm-arm64-set-id-regs-aarch64-v5-0-a60f2b956e22@kernel.org

Changes in v5:
- Rebase onto v7.0-rc1.
- Link to v4: https://patch.msgid.link/20260106-kvm-arm64-set-id-regs-aarch64-v4-0-c7ef4551afb3@kernel.org

Changes in v4:
- Correct check for 32 bit ID registers.
- Link to v3: https://patch.msgid.link/20251219-kvm-arm64-set-id-regs-aarch64-v3-0-bfa474ec3218@kernel.org

Changes in v3:
- Rebase onto v6.19-rc1.
- Link to v2: https://patch.msgid.link/20251114-kvm-arm64-set-id-regs-aarch64-v2-0-672f214f41bf@kernel.org

Changes in v2:
- Add a fix for spurious failures with 64 bit only guests.
- Link to v1: https://patch.msgid.link/20251030-kvm-arm64-set-id-regs-aarch64-v1-0-96fe0d2b178e@kernel.org

---
Mark Brown (3):
      KVM: selftests: arm64: Report set_id_reg reads of test registers as tests
      KVM: selftests: arm64: Report register reset tests individually
      KVM: selftests: arm64: Make set_id_regs bitfield validity checks non-fatal

 tools/testing/selftests/kvm/arm64/set_id_regs.c | 152 +++++++++++++++++-------
 1 file changed, 111 insertions(+), 41 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm master
change-id: 20251028-kvm-arm64-set-id-regs-aarch64-ebb77969401c

Best regards,
--  
Mark Brown <broonie@kernel.org>


