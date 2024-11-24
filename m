Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CE4E668AB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 12:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=do6ZEZ1ZVjVIUeOmz7IRlLSKkAvZ8bDMezzm2euAbQk=; b=YqG4iyzTS/lLyPZOOjtuUmHdUA
	lhseyIU94u+0PK5Fzfsqc88WPN77c/G9VAErMRy1YcwaLo+j6nPqlqYwH16/6Z3B1Aj5JjE7iPze/
	+f9pw3kAXDxpR2MID21pJd5cbZZqcrGfPjSh0qQ+0YX3UGyE8suRBxCXKWu+N6UVB2CWokqVfOSke
	EkAQSqrP+zLgQPB5ml+nhAbE5orYGmDJyhDZKk4tuxNstwJZf3d8ejWRjHGkXbBs3dPqUOlByyXUr
	k3VQvGaxx95wYubrtkKK1ctjnrtEX8NiAZTXa8CCfvol3EcM8lNuySQW13JmguDQsEL4ESj61v4J+
	/mffEvyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFBxX-00000005kaB-1VbA;
	Sun, 24 Nov 2024 12:43:27 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFBuc-00000005jmM-3wPf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 12:40:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0BB1AA40A09;
	Sun, 24 Nov 2024 12:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8160FC4CED1;
	Sun, 24 Nov 2024 12:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732452025;
	bh=isrIzBVpqEHXAWK+7dtrVVpLZiim/bjAv0AHGXA4NBc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oNOVI10H3ZWEmHlLfULf5QlfRjVXAeZw4G+KII4eSiuReRFk/o68pEHTILeV+oPzO
	 dqntUldKXx+oIku5PQhAeV9mNKQioB0lYbRlwVYu2dkVkiqnFDSyvgB8SxzsiIKpRx
	 5liFwAky15EJfT/9ysBA9qE6I4KYnUST8U29QUomO1wsAeG5m7jsdrwJycOqvnvUTO
	 HjgHT1CCF1KiD2bKTsRelsBeawPwZUP7A7JD6HTiFylYYeQwXI2IuEjY3RWAAZweFc
	 pY7z2ZuwMmu883sikCpd/GpRFjsx0goSJW6sK9wKd348Q8+4geIwZ5zC4Qz0Ybd8La
	 /uZikzwHVLIzA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sasha Levin <sashal@kernel.org>,
	will@kernel.org,
	shuah@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH AUTOSEL 6.11 05/16] kselftest/arm64: Log fp-stress child startup errors to stdout
Date: Sun, 24 Nov 2024 07:39:42 -0500
Message-ID: <20241124124009.3336072-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124124009.3336072-1-sashal@kernel.org>
References: <20241124124009.3336072-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.10
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_044027_096958_A00E413F 
X-CRM114-Status: GOOD (  12.13  )
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

From: Mark Brown <broonie@kernel.org>

[ Upstream commit dca93d29845dfed60910ba13dbfb6ae6a0e19f6d ]

Currently if we encounter an error between fork() and exec() of a child
process we log the error to stderr. This means that the errors don't get
annotated with the child information which makes diagnostics harder and
means that if we miss the exit signal from the child we can deadlock
waiting for output from the child. Improve robustness and output quality
by logging to stdout instead.

Signed-off-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/r/20241023-arm64-fp-stress-exec-fail-v1-1-ee3c62932c15@kernel.org
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/arm64/fp/fp-stress.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/fp-stress.c b/tools/testing/selftests/arm64/fp/fp-stress.c
index faac24bdefeb9..80f22789504d6 100644
--- a/tools/testing/selftests/arm64/fp/fp-stress.c
+++ b/tools/testing/selftests/arm64/fp/fp-stress.c
@@ -79,7 +79,7 @@ static void child_start(struct child_data *child, const char *program)
 		 */
 		ret = dup2(pipefd[1], 1);
 		if (ret == -1) {
-			fprintf(stderr, "dup2() %d\n", errno);
+			printf("dup2() %d\n", errno);
 			exit(EXIT_FAILURE);
 		}
 
@@ -89,7 +89,7 @@ static void child_start(struct child_data *child, const char *program)
 		 */
 		ret = dup2(startup_pipe[0], 3);
 		if (ret == -1) {
-			fprintf(stderr, "dup2() %d\n", errno);
+			printf("dup2() %d\n", errno);
 			exit(EXIT_FAILURE);
 		}
 
@@ -107,16 +107,15 @@ static void child_start(struct child_data *child, const char *program)
 		 */
 		ret = read(3, &i, sizeof(i));
 		if (ret < 0)
-			fprintf(stderr, "read(startp pipe) failed: %s (%d)\n",
-				strerror(errno), errno);
+			printf("read(startp pipe) failed: %s (%d)\n",
+			       strerror(errno), errno);
 		if (ret > 0)
-			fprintf(stderr, "%d bytes of data on startup pipe\n",
-				ret);
+			printf("%d bytes of data on startup pipe\n", ret);
 		close(3);
 
 		ret = execl(program, program, NULL);
-		fprintf(stderr, "execl(%s) failed: %d (%s)\n",
-			program, errno, strerror(errno));
+		printf("execl(%s) failed: %d (%s)\n",
+		       program, errno, strerror(errno));
 
 		exit(EXIT_FAILURE);
 	} else {
-- 
2.43.0


