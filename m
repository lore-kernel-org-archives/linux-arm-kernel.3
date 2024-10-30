Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07ACDD7494F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 00:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQlC6a/DLB3B5mGhxNgEj8cUMCm/SUrzGtm2ZRTh0EU=; b=WKHdAlxTEuTapxfGH9ilM4YL6/
	RJqcOKamgybOJHsXg2Hp5JcE9mSokb3ZGovNDbuYi4yEgTKzsE4uUquTpCT86PfjqvBXHvmOKWVvo
	npcDAcR0IxyLqB0vq3pgjNk9A08NvjkgAOBC1wHoAYFo7XK85pl88oAazJyc6LwS2A1jg3KH1kZ5f
	ripVcQ+5ZTcs18xmtYAkWNBLPQKdC2W1NlYzdwrKyZnS9KMbd2PVEW4qdan2SVJ1R8tzEZHuwb3FZ
	tmE2qrd98cV+uCzmqRxGoRoGzxM5lbFX9VQcyoMAdPuyctEdr0QEKBTKurkRti2bMSEbV8yQgA50G
	5tLDi/gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5wFB-0000000GISv-0hyk;
	Wed, 30 Oct 2024 00:07:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5wAH-0000000GI66-2iii
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 00:02:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 21522A43627;
	Wed, 30 Oct 2024 00:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40EF6C4CEE6;
	Wed, 30 Oct 2024 00:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730246540;
	bh=23oJHFxrvuSewIwap7rSA/8FNEEUIPofhXCAsl9/RTM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JTqSzKPPcQ3dsKDHLaUvm+5/qTGg82iIoB0/XMkkvTmif22ycFYV5U1D8zoNn+Cad
	 sVg++jviHkAluFHIPsCDrqOLFFKbQaG+TKYrLgJZvIqqxFOav3JQ7TIzG00wVSaMkH
	 HT71oYWQePg2sDU0ykkUxvapEdOmXzMn8LjZUKV+dSUyQY2e2MQJCXs9P5XDZorP/Y
	 Du9qVZ+C35k5AanWtgb8wekuIx5zvHBzuv04exYqxoL1x2dgJSK9APa7U8H+zGBNOr
	 lfImTpwHyvfFyf0UW0ByjhuKLcEVvdm+Upmkxc1O0rgtZlRGfzowDF/ZXhKlU5yODO
	 FMwpRNuD+yr9w==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 30 Oct 2024 00:02:03 +0000
Subject: [PATCH v2 2/2] kselftest/arm64: Poll less often while waiting for
 fp-stress children
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241030-arm64-fp-stress-interval-v2-2-bd3cef48c22c@kernel.org>
References: <20241030-arm64-fp-stress-interval-v2-0-bd3cef48c22c@kernel.org>
In-Reply-To: <20241030-arm64-fp-stress-interval-v2-0-bd3cef48c22c@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=1959; i=broonie@kernel.org;
 h=from:subject:message-id; bh=23oJHFxrvuSewIwap7rSA/8FNEEUIPofhXCAsl9/RTM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnIXeGVNSBOH+sGSKXore1Gd/kJ/0o+aCmx3u/FLAV
 9an02buJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZyF3hgAKCRAk1otyXVSH0BkzB/
 9WJ/5pJEB0/hdewFpULVhgdAGJs6V0VYgs2vsqJ4fF3/+9XVqhkfpBm838MjBME3clAqFmSW7NQPPu
 hd6MVVNpyxIkCKWQVztJxiGvYr2XmphdMmKiLDDbQx+l9Vgl1pbb2CVlPzbMkF/jv1quOdLjZr8kJc
 6LnFa4YJUxJqoFDrlvPVDQVBtTJZWGhs5d+roa+MbaUSHPGHpiTSSjpkv0N9skoYmPHYYrlu/6zHNk
 aqFZQgJr/XeOmx7Pc4ky8crARqIIZBndN6liHtNL0ftmUW/2+5sA0alwZNowavvNHJNF0ASmaMjMu1
 RS/Nf9gXpN+EDY5FncU40JVbGwKzPV
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_170221_850742_224E9E3A 
X-CRM114-Status: GOOD (  12.02  )
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

While fp-stress is waiting for children to start it doesn't send any
signals to them so there is no need for it to have as short an epoll()
timeout as it does when the children are all running. We do still want to
have some timeout so that we can log diagnostics about missing children but
this can be relatively large. On emulated platforms the overhead of running
the supervisor process is quite high, especially during the process of
execing the test binaries.

Implement a longer epoll() timeout during the setup phase, using a 5s
timeout while waiting for children and switching  to the signal raise
interval when all the children are started and we start sending signals.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/fp-stress.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/fp/fp-stress.c b/tools/testing/selftests/arm64/fp/fp-stress.c
index 71d02c701bf56be56b7ad00a5f6614e33dc8e01b..4f1ef260ce7a26d24092fe9337714f8c3922070a 100644
--- a/tools/testing/selftests/arm64/fp/fp-stress.c
+++ b/tools/testing/selftests/arm64/fp/fp-stress.c
@@ -453,6 +453,7 @@ int main(int argc, char **argv)
 {
 	int ret;
 	int timeout = 10 * (1000 / SIGNAL_INTERVAL_MS);
+	int poll_interval = 5000;
 	int cpus, i, j, c;
 	int sve_vl_count, sme_vl_count;
 	bool all_children_started = false;
@@ -588,7 +589,7 @@ int main(int argc, char **argv)
 		 * especially useful in emulation where we will both
 		 * be slow and likely to have a large set of VLs.
 		 */
-		ret = epoll_wait(epoll_fd, evs, tests, SIGNAL_INTERVAL_MS);
+		ret = epoll_wait(epoll_fd, evs, tests, poll_interval);
 		if (ret < 0) {
 			if (errno == EINTR)
 				continue;
@@ -626,6 +627,7 @@ int main(int argc, char **argv)
 			}
 
 			all_children_started = true;
+			poll_interval = SIGNAL_INTERVAL_MS;
 		}
 
 		if ((timeout % LOG_INTERVALS) == 0)

-- 
2.39.2


