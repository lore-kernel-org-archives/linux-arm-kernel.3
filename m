Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14854D29FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 02:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LOdfE5x4EKrySyBVmxKS94qCwTLAMgW8NOpDH3vP8WU=; b=SCxfytWsBzg/DcHqegtZppGoBV
	tXumsAsYfjZuEqu0UgAjIoxJpW/2wWB15JkEbjuhzfXonm5HBdxJKmBiX5ChNkPG8aytGHPMwc8hD
	yAmUDx7Z5Lhy2sKlil53sjLeYlrH6wM2bWwZLB9DKMvID2sVNx1HHUHNN1eG/TQCYm5btGHY2sblL
	NWjVzqfGe7Bd4ZTPiaF+DqsqcrM4G4GY80Ohpc4x2U6UVmMNSEBvYrSVSFG4W6bz1TodYt7by4jRA
	qktjdx5Uof85HEqZnyq/N9txjm0qU94hnBP/oNqyg2RNlrCMgN8mHdFxBKTaYb7O5SFHbyLAtvDyk
	SMHO0x4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8rso-00000005OXs-0PK8;
	Thu, 07 Nov 2024 02:04:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8rZ2-00000005KGy-3wI6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 01:44:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B541A5C54C7;
	Thu,  7 Nov 2024 01:43:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2BB7C4CECC;
	Thu,  7 Nov 2024 01:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730943840;
	bh=leVU7E1xUyU67WCn5RdQJAXMEOCia4xbUFczyjMgbo0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jD80AIlzSqU2r/cv9e/ie7Owo+WfjDElCsL6B8UgadlAaRiP+5loHocFvNnVoXa3b
	 oG8RmynJUtK37v71OIhLcZ69krDJBhOFA0AeuVVW27cAGQZionXdR24/7k0cRDqCk7
	 iUgTosPk1f5VAvyd9OHB6ztAXzsPufCXXbu9EQKqM8rMrotlyka3xcBKE/zQe7Dm+9
	 Am0HwME3N8tHhzwS2JxuGME7wRWy4Bdv4SY/M689QhbIdy/rP0KVDWZHhYAwaUSc+O
	 qGu4/mSb5RC+oydJLjZTYmjZ4HhgbkKe72gq7teGXdHUNvHWNniMIDf6rr69kggRVh
	 nNhCsTdzDcVqg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 07 Nov 2024 01:39:24 +0000
Subject: [PATCH v2 5/6] kselftest/arm64: Provide a SIGUSR1 handler in the
 kernel mode FP stress test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241107-arm64-fp-stress-irritator-v2-5-c4b9622e36ee@kernel.org>
References: <20241107-arm64-fp-stress-irritator-v2-0-c4b9622e36ee@kernel.org>
In-Reply-To: <20241107-arm64-fp-stress-irritator-v2-0-c4b9622e36ee@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=1313; i=broonie@kernel.org;
 h=from:subject:message-id; bh=leVU7E1xUyU67WCn5RdQJAXMEOCia4xbUFczyjMgbo0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnLBtS2FRnGevJn8KdIwsF19SK/BkdiQ/yz1S77N3e
 u1IvERGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZywbUgAKCRAk1otyXVSH0DadB/
 41K/s/wFQumB72ze1INxlRbvEQrpNju8Mfu7P81epd5uw2x02Ey2Bg9GCyHSCnA6T+2mHk4N5NK+FS
 vPG6XeN9PkdLjANLz/0gx91TrUw/Sf4Cbun9GSYKk7tmLBqHMJrEEAWoeJtfWXVi0aj/UZ78bTikSw
 nA90uLjIeY8Gnr9Sdo0xss5XTV1RjfGNScF7EPgMreb6nGCHmhfq9i1rqauJwqT2oCTJUsGYMxcLi9
 XDVrtAY14aXzBud0yt2s442KvlKVj/EcHfZdnM5cR8ZtRmPbYH3Aj3qb6JQOiIrczBxYLAGuT2TRs/
 EPkj0uwDq0d7TChyA7GwaXUmott0Rf
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_174401_150731_D103F198 
X-CRM114-Status: UNSURE (   9.91  )
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

The other stress test programs provide a SIGUSR1 handler which modifies the
live register state in order to validate that signal context is being
restored during signal return. While we can't usefully do this when testing
kernel mode FP usage provide a handler for SIGUSR1 which just counts the
number of signals like we do for SIGUSR2, allowing fp-stress to treat all
the test programs uniformly.

Acked-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/kernel-test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/arm64/fp/kernel-test.c b/tools/testing/selftests/arm64/fp/kernel-test.c
index e8da3b4cbd23202c6504ffd8043f8ef351d739f6..859345379044fc287458644309d66cf5f3d8bdf5 100644
--- a/tools/testing/selftests/arm64/fp/kernel-test.c
+++ b/tools/testing/selftests/arm64/fp/kernel-test.c
@@ -267,6 +267,10 @@ int main(void)
 		       strerror(errno), errno);
 
 	sa.sa_sigaction = handle_kick_signal;
+	ret = sigaction(SIGUSR1, &sa, NULL);
+	if (ret < 0)
+		printf("Failed to install SIGUSR1 handler: %s (%d)\n",
+		       strerror(errno), errno);
 	ret = sigaction(SIGUSR2, &sa, NULL);
 	if (ret < 0)
 		printf("Failed to install SIGUSR2 handler: %s (%d)\n",

-- 
2.39.2


