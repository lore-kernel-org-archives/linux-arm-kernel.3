Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0EBC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 15:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g/CUJYwbGk35LKf5XGGnDQcaJ0dD0748GDas986VV1o=; b=dQnFjJwEAXKAe1
	U2z8vPYm4k7d50u3E/z0Hbiq4bFnVX92ro5Jw5gs1cWIdiODabSC1F+Js1wiHtta9fv0uObgYh0c8
	R0phcLzsmnDSHqLnXxayhP2L6YDi2Gn8Kf7qWLhiKIdn0dIYVF+0wQWYNSKzqNeH+LbSdBvCzTB+x
	EThUOIVaSbP8nyy+XGDsdm/NEzA8w1Xi/RldMMiOrQZnqeewDghgAnYU6Vv84wJuhxsmF41M5c4rl
	FSESDRh1VzTgIG2tOTSxmS355ZzkFTqi5ngdoCXENKZkwFLD0VWCWxK6yTEhgBjbupJlARrjZ96nk
	sdmFY/Qxx6vK7JgkZ3Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIUXq-00000004HMn-284e;
	Fri, 23 May 2025 15:42:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIUJd-00000004FUg-482y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 15:28:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5BE1E5C6634;
	Fri, 23 May 2025 15:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23D27C4CEED;
	Fri, 23 May 2025 15:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748014089;
	bh=CZB04wmED1JGXTOX7r3pF+DNYjq86hwdBgfs+9h9GIk=;
	h=From:Subject:Date:To:Cc:From;
	b=gVduL2VuCeuf4pQxFJx0fwLrhbZUblHaB1wr5H5RoC7vPcuXx1EzDJ8TT6SnqyJKH
	 x2KDobQoJSnlbnVLcxkQCYiiMxa1NAHKRLpWk4Q5p/PAdLUYk37EEB/+KUWaTuIRvX
	 UaFSfvsU680FSqAptdMwPgVjqTjyKhRa7k/MkB5/MOqlpVyabPGpEbM+HkuOrIDk2H
	 iCw1JMREjuwBI6oPKEM0uhHpCdKsqVZm4xLQ7IPVilr/v7g/pJ641eKZzkkpU/GM7H
	 3R9MzQWylu0Js2/AwBz1BWUNWs6em9iruA8Qn6FwuLwPh6knSwq583J+24zvEm2WUK
	 /GglluzfLRVIg==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/3] kselftest/arm64: Update sve-ptrace for ABI changes
Date: Fri, 23 May 2025 16:27:11 +0100
Message-Id: <20250523-kselftest-arm64-ssve-fixups-v1-0-65069a263b21@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM+TMGgC/x3MWwqDMBBG4a3IPHfApBqKW5E+RP2jg/VCxoog7
 t3g48eBc5IiCpSq7KSIXVSWOcG8MmoHP/dg6ZLJ5rbMS/vmUfELG3RjHydXsOoODnL8V+XGfTy
 caQ2aQOmwRqTy3Ovvdd32wsvmbQAAAA==
X-Change-ID: 20250523-kselftest-arm64-ssve-fixups-b68ae61c1ebf
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=924; i=broonie@kernel.org;
 h=from:subject:message-id; bh=CZB04wmED1JGXTOX7r3pF+DNYjq86hwdBgfs+9h9GIk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoMJQDvgIanx1caBCCr87FUvZ8dKH1eaZQMuQne
 1kZk1zR6MGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaDCUAwAKCRAk1otyXVSH
 0EibB/sEq4AqGXPx+vRbuDmgWUbOvJP+ZmmajU04uYmsaIWeVuBVVfiGUKA9Ea+S3pMTtLtC3pE
 5bTB5B85GhVFLkWQvC8rH6AySwwtp+E939MDZiSosNI2ZW+NlmHfDWdaimlUXi9t8Kr9t0dn8Re
 U7ptTiLahvAE20OIYtOVADcjoXbfuuJRZ1KGUrSTzCHB2nBXlqZAjUsV9mY3uQS4ApVKxp+Zu+I
 DDtlR8FztVlXmGnjUTYbdkDY9lhmsUq/hvH/f2nxaax6hWQA3AS6VoEo/Sm14obk4kQcrrJ5dbO
 p7llEXafVoq6n2IjamPhg6vp861w2hPfqN2BGC+vm8xvsGtS
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_082810_072597_D8DA1F56 
X-CRM114-Status: UNSURE (   8.57  )
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
Mark Brown (3):
      kselftest/arm64: Fix check for setting new VLs in sve-ptrace
      kselftest/arm64: Fix test for streaming FPSIMD write in sve-ptrace
      kselftest/arm64: Specify SVE data when testing VL set in sve-ptrace

 tools/testing/selftests/arm64/fp/sve-ptrace.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
---
base-commit: 1c1abfd151c824698830ee900cc8d9f62e9a5fbb
change-id: 20250523-kselftest-arm64-ssve-fixups-b68ae61c1ebf

Best regards,
-- 
Mark Brown <broonie@kernel.org>


