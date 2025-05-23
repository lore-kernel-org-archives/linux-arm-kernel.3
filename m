Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52211C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 15:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FMpN/cFOtKJh4JsxPXyOLQMZZS6jPZIeWp0nlBWa/iU=; b=c2Lnqb0QXb1Q6Q0wZJ4xKNv3eD
	4fjCZR/HKO0DB6xtD57QVvUKUBbrv4MupaUTty9q/8M++N5ULeeItMjyrBqXKwXF8jAB25P+2YgcE
	ZPzeERw7X7oDFZzQcbmkz3vgSTwJvP4JZJWjMRrFFUybAmO5UL7HZI96UhysmR3k3y53wyWknGKwq
	G76MC3mRkAabkDdWw5YbLEGITQVhEJB0uCR9eMvo/UNwUYl9upQCWAdUz7KS/kZ8beI7FjHaV7P4O
	e5ZP0u/f6fukSWq2gQ/yCYu5Ycjkrnv/lr82pNzONj6Z3F9j4gTQCGgaROd/fvcNkbCCiIumTSu0g
	5SmE0THw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIUby-00000004IFz-06St;
	Fri, 23 May 2025 15:47:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIUJi-00000004FW9-2ntv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 15:28:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 362CF4410A;
	Fri, 23 May 2025 15:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F091C4CEED;
	Fri, 23 May 2025 15:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748014094;
	bh=gfmQZEjvd5HDHLmuHnVwJuVoa1j8dMgiHvo8VziUUs8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pf/wEcGacg2Vgw6XMePyL405X3aefzruhm4/UySrnPZbDlXZqybrLYOFIRU47imdi
	 vjD4UwT1IPRuzjiAUpzgImy6oXIgQwfpSZsaYkw0HL92ijaNvheknGdOyDIICxbsjI
	 SRV3klq+L1lef3hdoOFW2raDwIdVuoIx33HOro3sz4rex4JFEsrJbyJ+VyyH8roIy5
	 rSxK9N6GeIQMgDwiKnJhwYqYEGv93yRV12F32Ttwy4cF8/7Wn2JfAONzWBMlmv4f4a
	 zNKoIZvHnkpk2gY6dplt/NlENresmWStvI+QlwfnODXAiO57je7/lEq5019CQCxF+4
	 J3KSzJ2Wp/jpw==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 23 May 2025 16:27:13 +0100
Subject: [PATCH 2/3] kselftest/arm64: Fix test for streaming FPSIMD write
 in sve-ptrace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-kselftest-arm64-ssve-fixups-v1-2-65069a263b21@kernel.org>
References: <20250523-kselftest-arm64-ssve-fixups-v1-0-65069a263b21@kernel.org>
In-Reply-To: <20250523-kselftest-arm64-ssve-fixups-v1-0-65069a263b21@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1223; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gfmQZEjvd5HDHLmuHnVwJuVoa1j8dMgiHvo8VziUUs8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoMJQFKaEAwlOR1pLqNxibuEg3VMGRQcEX4bDOI
 WshDoApkV6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaDCUBQAKCRAk1otyXVSH
 0MuzB/0Z1E+Hyy1unXqqQ8fqpfMYEtTcmEmi/TRWvmVFbMWb8AryOXP3nKbmK0NuWBQDrNZehEz
 Woy/IzjB/XJB4mTdolQGZnkIyp7dUEp9zOcIZRHC/cljhN0L7O3iVy8nym894A4SOqPnBAXQuGI
 vbtRt+wESIXvqublxp1pvF4hXI5nFiXZ1a/bVh3BFDkOVEMdyrQwzw+6PBFqLMqbtjPQVkKO674
 /c/7HGV895d4rbxsH2b0LfhRENXPCd4GGLMhrCE15H1gV7sgUcs22/3MGHyvEU6OwtKSu6A9usF
 j/ldCL5FOIrz5mnZCmck+O//MaIAydBf92S436aad6tlnZ6n
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_082814_730764_4116607E 
X-CRM114-Status: GOOD (  12.37  )
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

Since f916dd32a943 ("arm64/fpsimd: ptrace: Mandate SVE payload for
streaming-mode state") we do not support writing FPSIMD payload data when
writing NT_ARM_SSVE but the sve-ptrace test has an explicit test for
this being supported which was not updated to reflect the new behaviour.
Fix the test to expect a failure when writing FPSIMD data to the
streaming mode register set.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/sve-ptrace.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/fp/sve-ptrace.c b/tools/testing/selftests/arm64/fp/sve-ptrace.c
index c499d5789dd5..7e259907805b 100644
--- a/tools/testing/selftests/arm64/fp/sve-ptrace.c
+++ b/tools/testing/selftests/arm64/fp/sve-ptrace.c
@@ -301,8 +301,10 @@ static void ptrace_sve_fpsimd(pid_t child, const struct vec_type *type)
 			p[j] = j;
 	}
 
+	/* This should only succeed for SVE */
 	ret = set_sve(child, type, sve);
-	ksft_test_result(ret == 0, "%s FPSIMD set via SVE: %d\n",
+	ksft_test_result((type->regset == NT_ARM_SVE) == (ret == 0),
+			 "%s FPSIMD set via SVE: %d\n",
 			 type->name, ret);
 	if (ret)
 		goto out;

-- 
2.39.5


