Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A77C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 16:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=94tnGcJwmH4MZbZFppk2sT6Y/4bp/V5tPzvblzSu42s=; b=iJEonzbGQa4M1s
	jlxqIwW/VXtN79Nmxj6U1+pDSiW157ZoRXXebmKloinKSCCD2Djrs4ITL4NKbLbFOd3K/9dJIFHAh
	HQJoLssJ3iffvehA+Cy9s8yxOV0V9BQPpdkP4pAzUE8ySGu/xIRfS7lIK8yVU0G+dYazdmWXQCUE1
	aU0sBqUxbIsqRtfOnGzWG2vJWxuo4Ir3vwTIVbiiONFahsgDoRmvjynfj7yqWjSnQn/JdTczOoMU5
	Ml5rBOUWgUjDBngkw82iBwcLwFsOjjGXzB306cRtcZN+7qLZqTpsK+P2H3UeD+J9Zbt5MFb9KpbR5
	bhMSCdqsMPzG+XXRCYKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaeH-000000042S6-3acA;
	Tue, 29 Sep 2026 16:25:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaeG-000000042Rs-2qK7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 16:25:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ADF4641A8E;
	Tue, 29 Sep 2026 16:25:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F421F000FF;
	Tue, 29 Sep 2026 16:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790699142;
	bh=94tnGcJwmH4MZbZFppk2sT6Y/4bp/V5tPzvblzSu42s=;
	h=From:Subject:Date:To:Cc;
	b=NeG2jSVcZygpeAJogcWz+hOAJj7evjS3UGE0ZpFvO6C3Jlvt6iYgzAnol6wwxGR1V
	 +hji/MCgzvnhW+QT8eMLbJ6O69nsba+i2skkkQT+D2RhAVXA4mGghe+yxM7Cxd/LYz
	 HHvtGZwrx63R6/mApwouQLQB7xkvkByvJejksJVkro/odDXAAVZr0zvC5q3zggqYFx
	 l8kf4WfOJDIYUH50MoYxfRGv4q8LX+F44VVurETlpmBCy4HNPCJqidzSyDbHgR02Wd
	 ClIFIrKTcwbEhqk/y7CI3FTQ5Y1PSKOZwooy4dnF7YbiPt9PmCMYHQ9abaYCbPtQhl
	 ouygWaz31H/vw==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v8 0/3] KVM: selftests: arm64: Improve diagnostics from
 set_id_regs
Date: Tue, 29 Sep 2026 17:16:51 +0100
Message-Id: <20260929-kvm-arm64-set-id-regs-aarch64-v8-0-58aabe2c2fac@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHPku2oC/4XPTWrDMBAF4KsErasyM9aP1VXvUbqQ7JFj0thFC
 qYl+O6VQ4spXmj53sA3vLvInEbO4uV0F4mXMY/zVEL7dBLd2U8Dy7EvWRCQRqBWXpar9OlqlMx
 8K0eZeMjS+9SdS8chWOuMU4CdKMZn4jh+Pfy395LPY77N6fvxbsGt/ZUbqMgLSpDORIaeAtqWX
 y+cJv54ntMgNnqhnUNUNY4KZyxFQhUVhnjgmp0jdDWuKVyIXlnFXUPYHjj1xxlAMDVOFa6zHJX
 W6GNoDpzeuQZtjdOF8wYiBacNEx04s3O2PtYUzpKi1kYdEY5j7c45wBpnNy6A0QFC753/x63r+
 gN99eETpQIAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2562; i=broonie@kernel.org;
 h=from:subject:message-id; bh=lSn6ia+zIIb6OMIx/gFj66g4OtJcVBg3+nTVE2Or1Ug=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqu+Z+QA4U11WZIBBKHt/6O2AwmRYGJNMutKywf
 HUnn5aC0o6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarvmfgAKCRAk1otyXVSH
 0FaoB/4o8S5H8xwfd+ELAz8jSFY4d7IIu8JJKhD+OhRm7hF1/ATDvm72MIy5VnyimVmCu8mhQ4m
 sMekYWIFL5ebtPQgG0TOFFYeuqvwDlfy11IrsJ28WnrDyMSLD8DbVRrzKrvhQo9edPHqBh2ocRL
 IU+vrF3SDJD9jhp/Zt6FHIz5fmlS2DrVhq6hvPn+KBFGBfyiSpJiHnbDQfuF4aD3HRbrk+Kc8WJ
 z1MARXu2VWEbQBsTLa5W5kdVX17oGq3PG6X5GuX4Z/O7qttj9BTG4qBhFvGmTegWOPLyrs0Kdtn
 0ahzNbd8K9AD6PjcauznnBGgs3nzPDHse26+S9GPmKNkKjDd
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
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20251028-kvm-arm64-set-id-regs-aarch64-ebb77969401c

Best regards,
--  
Mark Brown <broonie@kernel.org>


