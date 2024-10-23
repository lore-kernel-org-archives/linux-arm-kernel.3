Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5B4CFA474
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 20:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=llYcD+Is513zLIjCAA/mbI8o8ziXEE1hVw9PNEMHQRc=; b=dAto6cCyx8Fnuh3EY4UIwfPGO3
	TjFQqsR7Glle/fyHMUqouTtWYelZLYO6zGc8XZs8FUOiyj7NUdM87Y0PFS7RYPgxGviBgtsWmop3B
	HRRL72HddHD762FChWUS9aYx+MmtloxZ8xziSSAZlY5OWfc7nGecpozIoFtD3nTMJHUtgzVqFChtS
	l7oZrfCXJJAOODZ9Aakcm037hQICNAC2l+pkg/4Go0awxt6u+Zq2VCADpmPSHO3PFdbxhcts4tnwQ
	VbDIlUU95Hl63sv05bq6BjBarQR8RszWV35ZnBzH+k2QjUiWw+/Y7aj0zdHfZBo0rL8JWfRXz3hRB
	j8gKemCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3iJY-0000000FtS1-12J0;
	Wed, 23 Oct 2024 20:50:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3i94-0000000FrYu-0oIN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 20:39:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 38AEFA414B4;
	Wed, 23 Oct 2024 20:39:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 839AAC4CECD;
	Wed, 23 Oct 2024 20:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729715993;
	bh=fVAM10zHyP6GG1K9/Odp1Yp4otIM0+Fw+7dp79I2hf8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kxNgiSR+Wp1mt3SId9CP2ql3ho0BI8q99db+wRWSjZ3R/LkgGZpJe81d40QYGrvvd
	 FzRFy9z0nlSJhtigrWi5JJNCGYwhCv/pNJu0RRMwfgJbs3rvjUKbeBmeAcZGeKDd44
	 SLpL0jyCRhQCHGXJA6bSChvSp7A/C7ACk+VfwQUfP6IhA4QiuSqBYHKkHHgcokqmLn
	 WV4M9CVU1D0qBo7LrIq8ebO5cfa0zzRTIckZgiv1KkfW6f3fw2a8qU6VyAnjYqGXzT
	 7nV4EC+vphQGdjcgIdgEN3Gg2mRDWS8xfoSBiP6WrbhJGYmdMW900OU5ygoLXJLmhZ
	 0FohyD/Ua+NdA==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 23 Oct 2024 21:38:34 +0100
Subject: [PATCH 6/6] kselftest/arm64: Test signal handler state
 modification in fp-stress
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-arm64-fp-stress-irritator-v1-6-a51af298d449@kernel.org>
References: <20241023-arm64-fp-stress-irritator-v1-0-a51af298d449@kernel.org>
In-Reply-To: <20241023-arm64-fp-stress-irritator-v1-0-a51af298d449@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=1298; i=broonie@kernel.org;
 h=from:subject:message-id; bh=fVAM10zHyP6GG1K9/Odp1Yp4otIM0+Fw+7dp79I2hf8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnGV8Kfm83OfpsWup68vNgZGsjfwOxMdRatu9MK/EX
 EdADtWGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZxlfCgAKCRAk1otyXVSH0NdBB/
 4ovaIlGKNe94pSK3mKdh49lKzuMNLJ2f8VGtLwmXBVXGhnglT2HKySG/zPktYrphwp93qyS5YYsieP
 myhszUgkF3kQX80vnQRsEzta0e6Ycs/Q3GhttYo2upy2rIKC8ZV6jCDaLY9XFrJIRk4/B1BtRvlJe3
 dOQGO9MEcDOZ/l59v0sholBFfq+j8jcfk3OUPXQnyNXpKFJymV5+3YZcy53rSRRVCQ22KShEx+P7ju
 Y9bP9QzD6cszgI5i6WM+Ibl7hzFdvjuo/wTlkGBd1Iy+h3h3/W7RnpRt6CHtbpuNIXZBrlnMRj0+cx
 lU2usTwPpNX6XrRhSkWlnQgrE4rBCa
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_133954_356535_47CFB4F7 
X-CRM114-Status: GOOD (  11.05  )
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

Currently in fp-stress we test signal delivery to the test threads by
sending SIGUSR2 which simply counts how many signals are delivered. The
test programs now also all have a SIGUSR1 handler which for the threads
doing userspace testing additionally modifies the floating point register
state in the signal handler, verifying that when we return the saved
register state is restored from the signal context as expected. Switch over
to triggering that to validate that we are restoring as expected.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/fp-stress.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/fp/fp-stress.c b/tools/testing/selftests/arm64/fp/fp-stress.c
index faac24bdefeb9436e2daf20b7250d0ae25ca23a7..3d477249dee0632b662b48582433d39323d18e18 100644
--- a/tools/testing/selftests/arm64/fp/fp-stress.c
+++ b/tools/testing/selftests/arm64/fp/fp-stress.c
@@ -221,7 +221,7 @@ static void child_output(struct child_data *child, uint32_t events,
 static void child_tickle(struct child_data *child)
 {
 	if (child->output_seen && !child->exited)
-		kill(child->pid, SIGUSR2);
+		kill(child->pid, SIGUSR1);
 }
 
 static void child_stop(struct child_data *child)

-- 
2.39.2


