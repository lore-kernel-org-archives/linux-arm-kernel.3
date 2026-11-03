Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33E1606D80D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 18:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wjybo46z;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H5g8y4HA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=FPwk+Obv3JX7khvwqPN/UuLuPSKvZ6g9lKWJcYLlWQk=; b=wjybo46zai9JMnZnVvg/tpm+Vy
	v9vKefElsfZAS8lfNPQvN5yhMQzaI9zDWSn6WqYJLazwR2xi7W1/CsIAUpPBU9IUSbGt+WMeT9nNp
	yweqo73GdF4TOXzZrql/7Mv0wYlcYSSCrwkau3khOnmBZYxiCdQa10pxQwyn9XV0eKOKVRM/II+xI
	n9Bukdb03baT3KPgmSFAJP9EOtpkFFtcP3OFUadu/PRUzTVlPPJCo8x/Kvp4CQntYelpSx2Ipa8qu
	hHPcWzySugYfjDPE+yjb1XGjQuYp3WYMULhwCNVj2x9+RcKZaGhJwDLMc0mYHwWbzNwedoneRFgCi
	CWIQvdVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJ7s-00000003PAw-3MN7;
	Tue, 03 Nov 2026 18:20:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJ7r-00000003PAW-2xuU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 18:20:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F030B6022B;
	Tue,  3 Nov 2026 18:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33EF71F000C1;
	Tue,  3 Nov 2026 18:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793730050;
	bh=FPwk+Obv3JX7khvwqPN/UuLuPSKvZ6g9lKWJcYLlWQk=;
	h=From:Subject:Date:To:Cc;
	b=H5g8y4HAdMcsyMgO7MOqQ7BuM7LXnzIK+xJ3SWXbf7IAmivibRHPYgmSiUZ243K3o
	 xuWunLgtOHqbrBnOvLZbfi128Hd2EqEGcsBWaZKMUaop6dKuKjVS2YZmtRELp7IXYl
	 h1DGNIlHCuXUtyihEW3rpzB7JWXvLE8xMbchZD2EiWSPEZZcceQ5rXTV/7IkNSvNmF
	 od7d8WVYID0QNkeqoC0ubXbh6Ide9beDyteguOycx9bUBjjIcANmN65D9INpW/sTft
	 eX9PPc26rBBh/MPvac7EftUKHdd/s6M7sPg5bQg6N7ikd14uDW+Ie3Yis9JU2NE26u
	 Eno1+FFFIK8kA==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v9 0/3] KVM: selftests: arm64: Improve diagnostics from
 set_id_regs
Date: Tue, 03 Nov 2026 18:19:20 +0000
Message-Id: <20261103-kvm-arm64-set-id-regs-aarch64-v9-0-ab32bc79fa9c@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKkl6moC/4XPz07DMAwG8FeZcibIdvN3J94DcUhSZ6vGOpROF
 Wjau5NOoIJ6yPH7LP1s38TEZeBJ7Hc3UXgepuEy1uCfdiIdw3hgOfQ1CwLSCOTkaT7LUM5GyYm
 vdSgLHyYZQknH2nGM1nrjFWAS1fgonIfPh//6VvNxmK6X8vVYN+PS/sgdNOQZJUhvMkNPEa3jl
 xOXkd+fL+UgFnqmlUNULY4qZyxlQpUVxrzhupUj9C2uq1zMQVnFqSN0G079cgYQTItTlUuWs9I
 aQ47dhtMr16FtcbpywUCm6LVhog1nVs62nzWVs6TI2awzwvZZu3IesMXZhYtgdITYBx82nPvDU
 fM6VzntQohMiXJI/7j7/f4Nq5c/dvQCAAA=
X-Change-ID: 20251028-kvm-arm64-set-id-regs-aarch64-ebb77969401c
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Oliver Upton <oupton@kernel.org>
Cc: Ben Horgan <ben.horgan@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2800; i=broonie@kernel.org;
 h=from:subject:message-id; bh=4ky2ZC0HdjDT4ejqM8lZ1oDOfp+5HqQ3XaDMShmtQSc=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeqf5b/ddyypdmNuNDU6bLP3ELdL7t9ux9kmWocKLp+
 r2sX3Yd6ShlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBEGB4x/M+65vjVp6jt04RJ
 c97bTN424Ye/xP+gp2nCaaq/NPWTfscw/E+s+lVn97I7KWzdNcdVxz/aaMp/fZ64xPZX/w6Hc93
 ijMwA
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

 tools/testing/selftests/kvm/arm64/set_id_regs.c | 130 ++++++++++++++++++------
 1 file changed, 98 insertions(+), 32 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
change-id: 20251028-kvm-arm64-set-id-regs-aarch64-ebb77969401c

Best regards,
--  
Mark Brown <broonie@kernel.org>


