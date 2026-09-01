Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99BDC624D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+EdOCYHdoxuRmz6Krna/WF/yq1BxGZQXedylPxEwU/M=; b=IijZHNtnj53Lhn
	3CNmF3dM0vWS5XCBc2fuHKPRZCcNudVFLUlSpIdAUJJarrcYD7+OY1ICBOhIvaSbhDtKYzlT15wPt
	sjU/nnRMiydvLTAwFyVyKpFkDQNrBSLpncLebjk+5UBtlGDvrDxCD3ScZHzH3DdlJv0qRUEjYlLyD
	OLhGbD0bgfL65lQP6JOajkkrFBCXuOP9+d9jFcLlcS3mqZcQc7LNITOMWJ4jQsHpIkN3gxz5duJLp
	Ya6KNTkGTO18Qjm5+2veUb6mWZXHMCX/xUohHWBX9/HuJayJu43CULmHiXUbyKVmWvgilOmpZ9823
	2ysCuIaLa6JyZtCAHnOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TZ0-0000000D0Te-2JSp;
	Tue, 01 Sep 2026 18:50:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TYz-0000000D0TT-3q0V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 18:50:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 119D660207;
	Tue,  1 Sep 2026 18:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 697711F000E9;
	Tue,  1 Sep 2026 18:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788288628;
	bh=+EdOCYHdoxuRmz6Krna/WF/yq1BxGZQXedylPxEwU/M=;
	h=From:Subject:Date:To:Cc;
	b=MZx6z3KBd0SIH9k4Qs2ZSYsraNF6DTxsHzcDUZkyk1oiwDe9dx3P9ss0DN7CCeSTd
	 jwS/KxMPkdLYojMKGy9WjO0vECDYeOndYSGTulci4Ms4QJ04K3Y4Hrame6EjIXARRR
	 I92DzTshe/GDGqF6swsD7/9/FFiyPEn21zo8i8Sjd/eymQfxk3vyVk77ZPnMzBNnPN
	 NI2wWJ2B2LrA7AKE0SQg6tGVb51S/PI+zOAK4fZwiYvn2TyuOQH46rT1PkfOY4EO5n
	 nVSrhtLVjSRXJpMsjqufn7QSKkIoRiv9JAFnxGu2ndO3CKkQ8ZP4uDBVsFgZRNnVOk
	 aE1I4UxI5Vlfg==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v7 0/3] KVM: selftests: arm64: Improve diagnostics from
 set_id_regs
Date: Tue, 01 Sep 2026 19:50:00 +0100
Message-Id: <20260901-kvm-arm64-set-id-regs-aarch64-v7-0-7b065b0bda9a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFgel2oC/4XPTWrDMBAF4KsErauiGf3ZXfUepQvJmXFEGrtIw
 bQE371KaDHFCy3fG/iGdxOFcqIiXg43kWlJJc1TDf7pIIZTmEaS6VizQIUWFHbyvFxkyBdnZKF
 rPcpMY5Eh5OFUO4rR+971RsEgqvGZidPXw397r/mUynXO3493C9zbX1mrhryAVLJ3TOqIEXxHr
 2fKE308z3kUd3rBjQMwLQ4r5zwygmEDkXec3jiEvsXpykUOxhsaNEK348wf5xQo1+JM5QZPbKy
 FwFHvOLtxGnyLs5ULTjHG3jpC3HFu43x7rKucR4OdZ8ug/o9d1/UHB7ANllYCAAA=
X-Change-ID: 20251028-kvm-arm64-set-id-regs-aarch64-ebb77969401c
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Oliver Upton <oupton@kernel.org>
Cc: Ben Horgan <ben.horgan@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2411; i=broonie@kernel.org;
 h=from:subject:message-id; bh=4OkU9WgvaTBr4fJA+BqdrjhjALCzfWtqREvgXEsfess=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhqzpcrmHRNqMLwefaRC9ed7e1FZmbfI5y+i8fb2Vr/0nV
 D5fWL+wk9GYhYGRi0FWTJFl7bOMVenhElvnP5r/CmYQKxPIFAYuTgGYSP939j+cTl4dZ+ZKFOcl
 NX7RYY7tSXmfNuVYlJ/BOzNNMX7GpBspd4UXd+o3Xek4I6UWdCxuifXZCXaTdJjeLG8QVFtwdVO
 DssbrXQb3aw0VNy55klraM9ErYePcY+/e/NzGo3HWYMbxH68NkoI4+rxnPnacybjl20G2Ki7+BN
 +I47xVvKrZn7/Fl9drVHxz4JQIcO9fpnf6kJ75W8FKSX379LabmlVbTE6w1m4X26f3qfr51FsXg
 3hktr1KulYdfHyJthJ/4SLVMKb+UydPJjbXFb/f0BEacXFn8kG5gJ0rzycdOyJ3JPW/btNzPUF2
 LqWc5DO3G3c2+GWH3Il09Wnoq0g/XG1wxqr7+Dm/h1rlAA==
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
      KVM: selftests: arm64: Make set_id_regs bitfield validatity checks non-fatal

 tools/testing/selftests/kvm/arm64/set_id_regs.c | 121 ++++++++++++++++++------
 1 file changed, 91 insertions(+), 30 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20251028-kvm-arm64-set-id-regs-aarch64-ebb77969401c

Best regards,
--  
Mark Brown <broonie@kernel.org>


