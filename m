Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF587606D821
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1y5InwUT;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WJSt6zZL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=U7Elc9Ca9CCw10cEZQAP3d/XvP5VfP/2arZ71z5tLOA=; b=1y5InwUTxexqVxmSuoHKY5jfsx
	jVe9eozZ1IiPCfA0sbdFaSOrnAESswFT2YWDcRm9pIlfVch6LHa/VeNllKiAzOOQ9q8w8bX3Ogz3v
	xwwuL+9dhOq31x9nFGMJiqQM6djnhhBWfNpIVgjAZ5c4wsR//F/F+pk6tczadPa452NrpJ68qckXA
	z6Md9dj54BOaIutFah2g1CkC62GsBXmWRUEttj0zvPncImhM+9bpPCuQhYWWQYn/TXNWTL0Ttd6OY
	ROAaNnwaz145S4mG1wbv7I9g3XAJCKzMEt2CdzJCnAnKpT4X9SbqPRuAxcIv2w1jt0IuTT2oO4WlX
	0lNhaU8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyEC-00000009E7x-2lyc;
	Thu, 05 Nov 2026 14:14:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyEA-00000009E74-2e7J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 14:14:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9FC33609F8;
	Thu,  5 Nov 2026 14:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3931E1F00A1B;
	Thu,  5 Nov 2026 14:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793888045;
	bh=U7Elc9Ca9CCw10cEZQAP3d/XvP5VfP/2arZ71z5tLOA=;
	h=From:Subject:Date:To:Cc;
	b=WJSt6zZL/OAzzw/dcVXPixMrqtdaynBtkwFcqnO2e1KdBnJbfDOipFhTfftwfOa/4
	 X8ryjUyKy/+IL6TnoDsZhnBjx4/grGrbQezmmujrXjMBQzkYCcOnhcLthp+Sjw0Zm0
	 CsUCHIsyq0u8JM6nDlkUwwLeJHblMvkxa9cDIwv7+d50rN04T6TMgkyA95Tnc5ER1G
	 sGl8hI++IbQVzEH6l1Hn42pyRIfgkBrBZKTLOjErxmf5IrFx6DsbM3uGmzmvr4ywkS
	 5JRa/VbRaueKx1SqfHBJ31y12ii/6dgpu+Wk1ZaTqqnoksjeTkoH8nV4Gac9qbjz2Y
	 4XQjD7Hhv8LaQ==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 00/11] kselftest/arm64: Add coverage of interactions
 with KVM to fp-stress
Date: Thu, 05 Nov 2026 14:01:13 +0000
Message-Id: <20261105-arm64-fp-stress-kvm-v2-0-81a5172468f0@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACuM7GoC/3WNQQqDMBBFryKz7pQkRiVd9R7FRdRRg9XIREKLe
 PdG912+B//9HQKxowCPbAem6ILzSwJ1y6Ad7TIQui4xKKEKoYVEy3OpsV8xbEwh4BRn1JUSrc1
 F1VkNabky9e5zVV914tGFzfP3OonytGevFOZPL0oUmMumJWOKRpvmOREv9L57HqA+juMHtmBcY
 7cAAAA=
X-Change-ID: 20250401-arm64-fp-stress-kvm-4720ca307da4
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Stoakes <ljs@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4234; i=broonie@kernel.org;
 h=from:subject:message-id; bh=4uN4Ugc+doQyPxPQqbqNc6UtdGHQIH0dj2aTXPLzWDk=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLe9GuIRvFuEU7zPX9RaduxV5ccdzMu/CZ+0H/LxL8Ln
 B15M5XPdZSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAivncY/mncZ/gyzT6VQ5pV
 hK80812sfP6jZ1yVn1Y1O15ZcMrjXzUjQ+cbpo9hJXVHLWLvWh39ECa9XUnA+/SNp2ZTj4nuDKj
 +zAMA
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

Presently we don't have any automatic stress testing for the handling of
floating point save and restore with KVM, nor it's interaction with the
host's management of the floating point registers.  The majority of the
focused stress testing has been done by running the existing fp-stress
selftest on the host, starting a guest and then running fp-stress in
there too but this has been a manual process rather than something done
as a matter of routine by CI.

Plug this gap by reworking the test loads so that they can be run as KVM
guests, using a simple VMM that provides the interface that fp-stress
expects from it's test loads.  We run the FPSIMD and SVE tests in KVM
guests for half the CPUs, if EL2 is available then half the KVM tests
will use it.  The tests run in a minimal environment with the VMM and
test binaries tightly coupled to each other.

There's more coverage could be added, but this is an improvement over
the current situation and can be built on in future.  Off the top of my
head:

 - We only test nested guests running at EL2 with E2H set.
 - We only run the guests at the highest VL they support.
 - Enabling the MMU would avoid surprises due to the performance
   differences.
 - We do not run any protected guests (this currently taints the kernel
   so should wait until the pKVM support is less experimental).
 - It might be useful to have the VMM signal handler save and restore
   the guest register state to exercise that path.
 - Possibly it would be useful to disable irrelevant features so less
   time is spent context switching non-FP state?

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Changes in v2:
- Rebase onto v7.4-rc1.
- Use PHDRS in the linker script rather than suppressing RWX warnings.
- Use SMC to invoke PSCI at EL2.
- Commit mesage clarifications.
- Rename ASM_UTILS to ASM_UTILS_LINUX in the first patch to reduce
  churn.
- Remove more commented out dead code.
- Fix cross build of the guest code with LLVM, use llvm-objcopy.
- Drop protected guest support, we were only working due to missing
  permission checks.
- Link to v1: https://patch.msgid.link/20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org

---
Mark Brown (11):
      kselftest/arm64: Factor Linux syscalls out of asm-utils.S
      kselftest/arm64: Factor shared signal handlers out of fp-stress loads
      kselftest/arm64: Move exit calls out of fp-stress loads
      kselftest/arm64: Use exit_error() rather than SIGABRT in fp-stress
      kselftest/arm64: Exit with an error code on data mismatches in fp-stress
      kselftest/arm64: Factor startup code out of fp-stress load programs
      kselftest/arm64: Remove the sched_yield()s from the fp-stress loads
      kselftest/arm64: Add a very simple VMM for use in fp-stress
      kselftest/arm64: Build KVM guest versions of the fp-stress loads
      kselftest/arm64: Use execv() to start fp-stress test loads
      kselftest/arm64: Run KVM guests from fp-stress

 tools/testing/selftests/arm64/fp/.gitignore        |   4 +
 tools/testing/selftests/arm64/fp/Makefile          |  66 ++-
 tools/testing/selftests/arm64/fp/asm-utils-kvm.S   |  93 ++++
 tools/testing/selftests/arm64/fp/asm-utils-linux.S | 181 +++++++
 tools/testing/selftests/arm64/fp/asm-utils.S       |  36 --
 tools/testing/selftests/arm64/fp/fp-pidbench.S     |   6 +-
 .../testing/selftests/arm64/fp/fp-stress-kvm.lds.S |  65 +++
 tools/testing/selftests/arm64/fp/fp-stress-vmm.c   | 586 +++++++++++++++++++++
 tools/testing/selftests/arm64/fp/fp-stress-vmm.h   |  17 +
 tools/testing/selftests/arm64/fp/fp-stress.c       | 230 +++++++-
 tools/testing/selftests/arm64/fp/fpsimd-test.S     | 121 +----
 tools/testing/selftests/arm64/fp/sve-test.S        | 144 +----
 tools/testing/selftests/arm64/fp/za-test.S         | 144 +----
 tools/testing/selftests/arm64/fp/zt-test.S         | 137 +----
 14 files changed, 1250 insertions(+), 580 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm master
change-id: 20250401-arm64-fp-stress-kvm-4720ca307da4

Best regards,
--  
Mark Brown <broonie@kernel.org>


