Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55D9C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 19:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x3Z/BCAWfDXXRpooXj+PnUZCnjnIe39m8lpD8Kpu1SI=; b=Pq3K+SuhuhPLlk
	5cVsW9AqYy0N6EcRYIaf04aELGahwNLuZyPePaFNWDtt9wII6hS8L6hhb/NjCp7bx+IJ2IqnUcDQ4
	v1oIhjbmZOYdpwbLa88Bhenr4ET3wmPEjvYV/fCY5Gzrn6jmqwZ4PbO9B+7S46ivjNg39YDxdXXZ7
	7lkVn/gad3L01pSyQwxlxJDUWX4tzgkBnBieZNuX/8v3lOzDOKsIX8gMTntF3OMb+fktjFE4x8Ww5
	pbkhQ9Bnnfuky9WiVyEJIEuIJXfsY1VJ+RSWGPgmvAdzQ6wis2GJWHaojusjdbkTGsGuCwJeYdqqz
	KXjq2QrIMnlFyUSCPhyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlXAw-00000005Isk-1qyj;
	Sun, 19 Jul 2026 19:27:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlXAv-00000005Isb-0wkY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 19:27:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F0397408CD;
	Sun, 19 Jul 2026 19:27:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FCE01F000E9;
	Sun, 19 Jul 2026 19:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784489262;
	bh=x3Z/BCAWfDXXRpooXj+PnUZCnjnIe39m8lpD8Kpu1SI=;
	h=From:Subject:Date:To:Cc;
	b=CEGHCda8YSBOybWJeDHZhCahc3ZneW2555nYacPa9bj4BLYuFWxMrIK2VuXykgI2q
	 7WPQFWXG0qOxV9rHRG2hFsvnn6sQPZJ9833KP7J+crnv4UTCO0XonmJVUT5H9K269k
	 DziC+eDNw/FE9tyZWQ2dpjr/+s55clwRROvbwH/e4Hyud3nZjRddikOvrfB32ToGb8
	 uTldNYCEnqXDEa5fpnI03+9k/OxTxLdZFWzCRlT24Zgne0pxTJSCJYpfx7rBqi+dO/
	 ASK45l8NktTIMY8EdNOvfA2bWZwQapp56PQ9ElJm1+XJ/tW4v/1e4now7VO7QpUwke
	 PD8CPLVzDzsbQ==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v6 0/3] KVM: selftests: arm64: Improve diagnostics from
 set_id_regs
Date: Sun, 19 Jul 2026 20:24:39 +0100
Message-Id: <20260719-kvm-arm64-set-id-regs-aarch64-v6-0-724287f5f108@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHckXWoC/4XNTWrDMBCG4asErauiGf1ZXfUeJQvJGdkijV2kY
 FKC714ltJjihZbvN/DMnRXKiQp7O9xZpiWVNE81zMuB9aOfBuLpVJuhQA0CO35eLtzni1G80LU
 eeaahcO9zP9aNQrDWGacE9KwaX5liuj39j2PtMZXrnL+f7xZ4rL+yFA15AS64M5HECQPYjt7Pl
 Cf6fJ3zwB70ghsHoFocVs5YjAgqKghxx8mNQ3AtTlYuRK+sol4idDtO/XFGgDAtTlWutxSV1uB
 jkDtOb5wE2+J05bwREYPThhD/ceu6/gCZnbRUBwIAAA==
X-Change-ID: 20251028-kvm-arm64-set-id-regs-aarch64-ebb77969401c
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Oliver Upton <oupton@kernel.org>
Cc: Ben Horgan <ben.horgan@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2260; i=broonie@kernel.org;
 h=from:subject:message-id; bh=VxQtlVb6Tq4ygQJd99j9vq7cB5fe5K6fary/e2Ocz3g=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqXSUp3QR8U5oPJqHthXK2AJQyw4qD207VJphdi
 2y4lFZjbw6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCal0lKQAKCRAk1otyXVSH
 0JexCACCzxKRi/czCI3ufKz9ePmZcjzOaffJelu3Pl2IKACdmRPXtNsMz7R1IWz+XeevbZYsdLV
 bCHnH8HT61UZnuk4FZte7sJjLgSi88WTvbH3bBjsJ4niepHZYCUQe9VmAzWowEpvUe+XxEDpmEP
 Qw3xLxI0dq5aRN6aGKEeswn/dfMgsL0VPUIiYYVYa1+N6dqTM2pssTqhD5K/VbS+vQA79+WzmuQ
 5/AGq5kCEFTzROz/WTgzEgSxjoQNrYq0CrWitoQzEWqeZseNZvrDRk7qyNcIT6ebjaCZcFVDUoe
 yNdqxLK/pDiUlHxAP3t534Y4aVQOxHy/RmdWOkuRzdzC3Buq
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
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20251028-kvm-arm64-set-id-regs-aarch64-ebb77969401c

Best regards,
--  
Mark Brown <broonie@kernel.org>


