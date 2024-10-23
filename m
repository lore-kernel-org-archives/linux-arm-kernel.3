Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D3F9CFA46A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 20:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NEYRctt2z4pdzaHTQmxg1OAUgFRxSQKW/aWh0IXJXEo=; b=0hzu6rBdq+DHyHITZ8rn2G31DB
	R09aWR6tihJbV5xgrLfKBQzzEH2csp60GHMq01NRjAU/kl1rVfp2H+TxqN9R3SPrDTkxE8vrBXtEN
	u46np9j/wnFIqQHVRfWf+hck5F96j5HxWBgQDbD67fG7t0mDqPvZBebtGj5td9tO8VvNvd8M5Oolr
	h458d9PN/MmXOIV+oNAW/F8TORcuzyVoktw7krJ+PFpdu1cHROPrlBApvUlbN4OqeMtAxU3cO51fm
	7aiHov4afl2b10CNQEwOVgJNKmhQQYb8o6DnL0HEeXQVSdVbLFzOnMHV3Lprr5+zhUmDZY4Lp2V74
	WfUrXQ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3iF3-0000000FssL-0gB0;
	Wed, 23 Oct 2024 20:46:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3i8y-0000000FrWl-047Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 20:39:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ACAE55C5EA5;
	Wed, 23 Oct 2024 20:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C8EAC4CEE5;
	Wed, 23 Oct 2024 20:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729715987;
	bh=FhWCGlX4GqW3drCLhOz7oP3Ieg9TfDbYSvqYk0V+nyI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cG2jZxEYaHm79SoQxc8GhTLIsCsTiHQHhRBHsxmhAZolW8/XUSWmqgZsX/inQT+Jt
	 cZ6Y85/epCbKDJXhUad5vZOsCkCSEh4bmOOcaDBwiSv0cEmXxOReInTXyNhB/Kqf+/
	 hmXCJjMqzKRREXXR9o7WUfErMqtj00v047ATZ378/zdQegMcSMpays2WcTa/2EAHAS
	 l4ALs86z5InFdcs2ZmX/V/NYBXJOAtxivOzrlS7xi4yYAvSkQVbaUD89wTpZJQATcz
	 BX75Sy1ZtkR8+L5Yj7rZdNPEixSkpt/NiWkdUmbbiKsBpn+Hy+0VYhS0ZtN84rTFLK
	 PjbX9vj7TTskg==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 23 Oct 2024 21:38:31 +0100
Subject: [PATCH 3/6] kselftest/arm64: Corrupt P15 in the irritator when
 testing SSVE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-arm64-fp-stress-irritator-v1-3-a51af298d449@kernel.org>
References: <20241023-arm64-fp-stress-irritator-v1-0-a51af298d449@kernel.org>
In-Reply-To: <20241023-arm64-fp-stress-irritator-v1-0-a51af298d449@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=893; i=broonie@kernel.org;
 h=from:subject:message-id; bh=FhWCGlX4GqW3drCLhOz7oP3Ieg9TfDbYSvqYk0V+nyI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnGV8HAtprWkaDeom0J0zZOIBZaJtVL+0CTV3rfZXo
 5d9PGCOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZxlfBwAKCRAk1otyXVSH0IToB/
 9RCm0u32j8dB88IyUiR+Jhgoe6iur7nWhVM9wLnewqQD7jW/StOFMDou1lhDiduv8Rf/njUEjfqfSP
 NFkQaaRcQYqdDB9xJ88pl6oLiq3PEPbN09UaUp5iaDhUGMxGAhMDHKJfYIL9QGx7cMWSXGZkPVkB/d
 CbP5m2e4LFcmJysjRmhCJHJnRCoQDGx79bn1nWsOqYd1AHeouicl+OyjKhQW+c0KlOyG4BMCjm1y3e
 Bboe9erv4FX/4cTxqHbvc5Fx9UDu4D5MOIjYvS7jw8GPAw2M1SXzjUkx8RWUJNzPlhmOql5MZVlvn0
 eU6Z/sCDxCJ5Cf+O4vLuIjNGnLSmE+
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_133948_137338_1D5231EE 
X-CRM114-Status: GOOD (  10.40  )
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

When building for streaming SVE the irritator for SVE skips updates of both
P15 and FFR. While FFR is skipped since it might not be present there is no
reason to skip corrupting P15 so move the ifdef appropriately.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/sve-test.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/fp/sve-test.S b/tools/testing/selftests/arm64/fp/sve-test.S
index f1fb9745c681786f686f1fafcb7e1154f3c8e1a3..3c88dfe9c8cad29f44217314aeaffa984bac05e5 100644
--- a/tools/testing/selftests/arm64/fp/sve-test.S
+++ b/tools/testing/selftests/arm64/fp/sve-test.S
@@ -302,9 +302,9 @@ function irritator_handler
 	movi	v0.8b, #1
 	movi	v9.16b, #2
 	movi	v31.8b, #3
-#ifndef SSVE
 	// And P0
 	rdffr	p0.b
+#ifndef SSVE
 	// And FFR
 	wrffr	p15.b
 #endif

-- 
2.39.2


