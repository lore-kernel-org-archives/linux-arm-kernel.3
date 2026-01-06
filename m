Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8131DCE9D7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 16:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZNRrdAtkmNH4Qm3H+c7jVuIem4jopccfu67/WzeqgKY=; b=bgE6PrW90dXU7H
	bG8LC3ErTcIXgTfJzJTIL8h7qokDtNaMMlLU/mFPWNFZMDELy4ndhhKxeOiZSa3+9cKUrtd/cw9zy
	S6rQk2L7WZwlyQzDDkdHxAeXw2HCMnSlW3N0nhhS4HL86tIpopxU9J2pQjOwcTbKyox7rvAcGoCFV
	aRmXKdMGdkYNlQM3H4ugpoZLMYLceuwU9e6MbwjTxOIiHYgBdLVu8EvF+WCTGEisBBbpjoidoge8i
	mlvmIfso7N64h5CXYtNlRPJCxeScjMV7XFgFUc4yNt1zdA7aLjnH30iZqLYuWJoR5fqjHcUERxt04
	PImuuZPkq4zlr9A7GSCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdA7J-0000000DVMQ-0ebs;
	Tue, 06 Jan 2026 16:41:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdA7G-0000000DVLo-12So
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 16:41:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C05CD4378D;
	Tue,  6 Jan 2026 16:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 459EBC16AAE;
	Tue,  6 Jan 2026 16:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767717664;
	bh=iYEeHk+9DnSGURMUeHt4qgmcIQTVl4/JW3coGdB0WE4=;
	h=From:Subject:Date:To:Cc:From;
	b=kgh5MwyVHs4IkOtgvFOEPcihx+pynI1zJ20VujdRC50HFKB3rxahAAmuOMeD8Tnyr
	 XBJIavPRit/wbyRPqgk4Qn525S1HcdnVkMXfoQfuqlkd2glyRHRmB94bhy0F2EAhCv
	 wV55ipYKDcTLwFhthFcanqMtRj200e/n4Bqzq5ORJmlaq8TAVvFMNwdb+ej9sj+rbZ
	 Ex1X3OPfBRjt/DWZPEDnZLjaKRhzIYOQXnhgP2/CfALKD+rxxW9NCBkuS8FnHi/U1a
	 94CTWIoOt1a22jVClX46ikvIYle21evOulXcA8x5XnsIKYHPW27mLfvQaWsN4qhQ3+
	 OPluFY5HTO3yw==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 0/5] KVM: selftests: arm64: Improve diagnostics from
 set_id_regs
Date: Tue, 06 Jan 2026 16:35:40 +0000
Message-Id: <20260106-kvm-arm64-set-id-regs-aarch64-v4-0-c7ef4551afb3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANw5XWkC/4XNQQrCMBCF4atI1kYy09i0rryHuEjqpA1qKxMJi
 vTupkUQcdHl/wa+eYlIHCiK3eolmFKIYehz6PVKNJ3tW5LhlFugwi0orOQ5XaXla6llpHs+SqY
 2Smu56fJGzhlTl7VW0Ihs3Jh8eMz+4Zi7C/E+8HN+l2BaP3KhFuQEUsm69KRO6MBUtD8T93TZD
 NyKiU745QD0EoeZKw16BO01OP/HFV8OoV7iisw5b7XR1BQI1Q83juMbbqCidWkBAAA=
X-Change-ID: 20251028-kvm-arm64-set-id-regs-aarch64-ebb77969401c
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Oliver Upton <oupton@kernel.org>
Cc: Ben Horgan <ben.horgan@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1991; i=broonie@kernel.org;
 h=from:subject:message-id; bh=iYEeHk+9DnSGURMUeHt4qgmcIQTVl4/JW3coGdB0WE4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpXTsZJaHZBU6eSm/oS3vIxB086dFSrrNy9mg8y
 YYRR/3jr9CJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaV07GQAKCRAk1otyXVSH
 0KZdB/wMSYXCt+ixrXxV5dAlXxTU/oY9SrbGIghLJnY440lUJGfPhSa2/3nQJYZtxDv1/thanJk
 i4VKeEYt1iwOj58R4Al6zporgAN/Bytdfk4WAflO+bqxMe9n9v9/Z/czfDZl9Zv3p44PloVypUy
 5DPDAP1bVm6vLldJrL21ljZL47TQLye7L3rlvUh5Dl6SwAGQbu3NZwak5MjCJZVeqig6fSP3zfe
 uQ+iUKaQReg5k0FXGHWXhhdswuen8OAuUajCek2mygWYpht4WWPWXrAHkwNfnp+lxBtlxQEj/lZ
 Yb+qcPYCri+r0mJKwnqCcW4eZZwZzjSxUR9qqrh3L+xdjtSm
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_084106_354564_9E790F60 
X-CRM114-Status: UNSURE (   9.09  )
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

While debugging issues related to aarch64 only systems I ran into
speedbumps due to the lack of detail in the results reported when the
guest register read and reset value preservation tests were run, they
generated an immediately fatal assert without indicating which register
was being tested. Update these tests to report a result per register,
making it much easier to see what the problem being reported is.

A similar, though less severe, issue exists with the validation of the
individual bitfields in registers due to the use of immediately fatal
asserts. Update those asserts to be standard kselftest reports.

Finally we have a fix for spurious errors on some NV systems.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
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
Mark Brown (5):
      KVM: selftests: arm64: Report set_id_reg reads of test registers as tests
      KVM: selftests: arm64: Report register reset tests individually
      KVM: selftests: arm64: Make set_id_regs bitfield validatity checks non-fatal
      KVM: selftests: arm64: Skip all 32 bit IDs when set_id_regs is aarch64 only
      KVM: selftests: arm64: Use is_aarch32_id_reg() in test_vm_ftr_id_regs()

 tools/testing/selftests/kvm/arm64/set_id_regs.c | 159 ++++++++++++++++++------
 1 file changed, 119 insertions(+), 40 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251028-kvm-arm64-set-id-regs-aarch64-ebb77969401c

Best regards,
--  
Mark Brown <broonie@kernel.org>


