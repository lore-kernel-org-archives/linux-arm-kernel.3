Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93221C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 16:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0rVolS2+3L2hAqMseZp/VoTrmlofytZ2uSH68XDHaA8=; b=3whmt/Po1z7XE8
	SODXL4HnTuesxyE3+ur7Bixwq5ZIiYBWUmEj8FqGnklVbixbNuVAuQalGAI3e+t3wN3A98TGroqZj
	sEIYdz+zq50kXa9s+93M+N36GCAOoQTP+XZ0F4MjaSvPHswOBWbko4nQ+yDs1m2WT+PwgQzyhxcBc
	2ce1vlmubKaMNRZBsD1ha/oC2PxWnBvsefvHNhAudD6YQLbXa/9LtMgC378K1utvFoe7rfoH/QpFI
	FT7FY00fTLq6TdyW0l9RDpYg7L4psOh9wK5iGfyRN+HAdUWyDPeyJWxYtxVcDnOxrIZMwM2xdmv9M
	ZBYPU6q936k7iFg/gHPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOezE-00000004bob-0Z24;
	Mon, 09 Jun 2025 16:04:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOeNf-00000004WCP-23VW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 15:25:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9D804A505F1;
	Mon,  9 Jun 2025 15:25:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E3CCC4CEEB;
	Mon,  9 Jun 2025 15:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749482746;
	bh=xz9CPiZmvA8I8vw1xhCyJX7ftts3Lo/ky6cOBWw1JG8=;
	h=From:Subject:Date:To:Cc:From;
	b=K5FjUSfb1thiOodOF9NycyduKWR47tjHemh3DAw9CskE769QGS/Or9pzcS6x4v7IA
	 xUG73ZP4CzgHAGjNceibEDgw2c8QKfj1cEmP1Pdd7mKsy3X80VCPNB4oBKjLtyCw9g
	 zA1Ru7jotPIi6pV/k31uRMkrM8Muq+AvoHPq3mAk8io7PpLR+juSbAUhB9F/M4Tlp9
	 MTXpkCNups0HN6nZJ9Wvxk/csQ7CSrKQSL6y2NkLnXl98baFG93QqWy6yoiagwZe46
	 z/groHOotpgHqDtS9/IFv1ihqu8FtIi8mr69/kML7DIvEtJhfNQg31j5Uae1sQeQK3
	 t5Zdy5167fNHQ==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/3] kselftest/arm64: Update sve-ptrace for ABI changes
Date: Mon, 09 Jun 2025 16:25:30 +0100
Message-Id: <20250609-kselftest-arm64-ssve-fixups-v2-0-998fcfa6f240@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOr8RmgC/42NQQ6CMBBFr0Jm7Zi2SKOuvIdh0eIADQhkBhsN6
 d2tnMDlez95fwMhDiRwLTZgikHCPGUwhwKa3k0dYXhkBqNMpSpT4iA0tivJio6f9oQikbAN79c
 i6O3ZkdWNJt9CLixMednr9zpzH2Sd+bOfRf2z/3WjRoW2UvbijC290beBeKLxOHMHdUrpC14Bj
 NLHAAAA
X-Change-ID: 20250523-kselftest-arm64-ssve-fixups-b68ae61c1ebf
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 Dev Jain <dev.jain@arm.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xz9CPiZmvA8I8vw1xhCyJX7ftts3Lo/ky6cOBWw1JG8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoRvz1PNjLG9/4JVU/f4+EONfW3WtjK/XEE/YmQxXp
 VfdK3xiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaEb89QAKCRAk1otyXVSH0BqBB/
 9y3CtGDVizHftAeftbEKjeJcVJZ4SSroJ159RfgjeiDtUIRyWMe3dqj/7QACsQp4lfp9YxzALOkNGC
 cwQ9GDpxsp3gLTQPChH2joHaCMjo6OCQz09hppb7zsLRncsSLgS8tsCp3Xj1qOOJ24vOJsR8FnkpOA
 i2sMsNZFpv5RahaV9iUMov5lx51IDr5Bwn2aZ+ZaxJGcX2ENwaPzAgQjI2ep5EgYfGlfCcFh0OEqgf
 SCIXSTzq5Hg8hja5wd/T27XUtDoXjF3XR+sJD7QyYl9FLkF07zwjwD1KwJJMoj4m/svlQoIpy8m60Q
 rgCS0OzdTMLSptOnBY//sRYpzwlsIM
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_082547_605580_220DB4B4 
X-CRM114-Status: UNSURE (   9.31  )
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

Mark Rutland's recent SME fixes updated the SME ABI to reject any
attempt to write FPSIMD register data via the streaming mode SVE
register set but did not update the sve-ptrace test to take account of
this, resulting in spurious failures.  Update the test for this, and
also fix another preexisting issue I noticed while looking at this.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Changes in v2:
- Rebase onto v6.16-rc1.
- Update fixes tag for patch 1.
- Link to v1: https://lore.kernel.org/r/20250523-kselftest-arm64-ssve-fixups-v1-0-65069a263b21@kernel.org

---
Mark Brown (3):
      kselftest/arm64: Fix check for setting new VLs in sve-ptrace
      kselftest/arm64: Fix test for streaming FPSIMD write in sve-ptrace
      kselftest/arm64: Specify SVE data when testing VL set in sve-ptrace

 tools/testing/selftests/arm64/fp/sve-ptrace.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250523-kselftest-arm64-ssve-fixups-b68ae61c1ebf

Best regards,
-- 
Mark Brown <broonie@kernel.org>


