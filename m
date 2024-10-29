Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C94D5B845
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 00:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PV9mhO8SVC/V0xy2iqF2k/+I4nwn9UDtUtyUvU9iSCo=; b=LJE/S5+P5UzF/G7OwfXNdKDELi
	l+9jqTUQqtdgao0dFH/Uvfir5ZdMEFJVNxmiZfMGhGYUor8IGVFiGUdSiWOhQLcB0qscvISA/uLbt
	aL1j//YiE5jrRl1rT/84nEBfUQRIHZwk5O8cGwqR8HshgyHQ6tgGnGyy9XBUx65mEkU7VbNqHjyq8
	uRrJDsFwtonnyAdvnZcp44AZJtuGN9ZImeLvQi+x5cBn9eWv7Tim0WN4KVEFXenBSwB142fbtOH/L
	rxkz2f/4OkUAU13t64iEmk02iR3x2Xdo08pM7mypRjalv6eBt/znwhk4EWfAT1bh9F5K5/RWfsu83
	fI0fZyVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Ztj-0000000Ciyw-3JmQ;
	Tue, 29 Oct 2024 00:15:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Zp1-0000000CiKo-0l00
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 00:10:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6404B5C5947;
	Tue, 29 Oct 2024 00:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 967B5C4CEE4;
	Tue, 29 Oct 2024 00:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730160654;
	bh=ekBfPnwrdm7KummwdeqiAHhMWmmbyTg1NV1XACHkR0Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NNa9JZJ0/NkjQTSMfUdbvmoKVqnMhyf17P8SlyuH/JddEH6fifz8ab+/bCqFF6SJg
	 7o6r0lgiEa1lghlFPI0lqzB1/EZDLEANhaql43YsGT5Mye2i7MMZNKYH0/UGSXTgZw
	 oTwi67cRPyomFbqJkSMnMp7W/JbgfKWoJiUGi5m8zl3E8nsqN/74J5SUsw65QhGXJd
	 9tkQPCQFj4RshIGm8M/ETM24z4ORfHsRI7G3pUF0mcDFPFjX/JxkTpnp5UVf3ja06a
	 MsRlXegkTWiHd6De9toOxr6bw9k18y0y3qKpgpQmHIQIdc4TX69sfSDSX+VR2NB96M
	 nZi3D8GU6uc5w==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 29 Oct 2024 00:10:40 +0000
Subject: [PATCH 2/2] kselftest/arm64: Lower poll interval while waiting for
 fp-stress children
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-arm64-fp-stress-interval-v1-2-db540abf6dd5@kernel.org>
References: <20241029-arm64-fp-stress-interval-v1-0-db540abf6dd5@kernel.org>
In-Reply-To: <20241029-arm64-fp-stress-interval-v1-0-db540abf6dd5@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=1959; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ekBfPnwrdm7KummwdeqiAHhMWmmbyTg1NV1XACHkR0Y=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnICgHeifBMnCWZ2kSXNB3NMTg0fAwNZRYyu5mcRdL
 hclJyvCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZyAoBwAKCRAk1otyXVSH0Iv5B/
 wNabZkh1SOPf/oceJvwEmyr/ynlL8MBnpgH8D74hiwWGMZW2822ciE6V4OFPOV7x41bRR2x0/pZ7Hj
 bWQQTw8qmO2ENaJCt9zsk3NnynS1vO+2xlOCaOIT5bqEk+q6UfvfFvs3QGq+HwY/XRAUFwNhgwI2Km
 oOhTQ2XxUU7UXJaQVerllbxk3RTZuaUqE8IiXi1vuaZTGnvutlasOgZZ2LyJO+mihb+F/W/d2rEad0
 ew2lbo4i9KjaU1T5PVup4NYmVnbeQgGe57bU3BSewpIufI6x4llZT7LccpsdgWsAh5BexwOKdwaQzJ
 MVPqYlljy03PF2SIqScNn2Ou+DayOx
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_171055_340939_58E8D3EA 
X-CRM114-Status: GOOD (  11.76  )
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
index c986c68fbcacdd295f4db57277075209193cb943..963e2d891ced72fb8d6eff4fdb5c7df0724b14f1 100644
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


