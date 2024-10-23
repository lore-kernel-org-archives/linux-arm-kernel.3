Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9268FCFA472
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 20:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x81WPgjq5SOtyxbakC7ihgczw+G9LIIBElwuB8ruK4c=; b=vIOlxT1re9jmjb9SOojpgw2LKd
	eRsSZ4DvjJmewvyIpvUDBbiqX6LOAAEJLcBlQKhwbbZgWT9EIyPpyKJ9kmg6xHfohkBonEy83yoIq
	9y+43XX7J4ct69ikQoKgW0U/97E89Y8UsVmx1WLhz2yX/AkRz1tyIvCvgHvCcjn6GIGBJDaz4HvIb
	4KEFzBnbsAoCg4+VmGjqd05eFPXTNHu2cnuAtPXE8mjTSdo1Eh9NZklIE//AfUl1USPBCO8rXwdEN
	2nKr8dRrh+UnCWhS5701CQewTSgn7b7hFHmDrr4PS26nTJ0eA9vq4zFb68JQfZ6Bb/dug2PggbqlA
	Mx5iRuTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3iI2-0000000FtCr-41tG;
	Wed, 23 Oct 2024 20:49:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3i93-0000000FrY2-05nK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 20:39:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 592ECA41665;
	Wed, 23 Oct 2024 20:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76CF0C4CEE5;
	Wed, 23 Oct 2024 20:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729715991;
	bh=2eYH4MlA2swbnr7Adf9Eu7+rMkjhAxSKCoo92NFhmpw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HHtL0+aZd7/UFWdJoQ1PUrq2RV2TSukC8tOFWZ8I3o8vQY4dHdkOzmBCQTEyb7ZbT
	 SWbG/D5ipAZWBUWmZjAx5BV1wK9e5KWqWRKargoNf+IfxvN/QS49LScmAQDbWp7/Cq
	 JKupvjpZWV+jqn+tIXeDNRoTTc7NR060b06Gj5cBV26xRlTQiIjNUpUGlvdzabtVzY
	 NzE8PG85FZMx6Cs4N4TNBpafoRwq0dfgWBajllRdkkx+fDUOBLLrPGgvwin/aHCnmJ
	 J2UdHBhfNoBmOB+hFbiyeLd31w14RSqmPogQ8wUUgATZh50KxUFRXJhAq60cNgIesO
	 wpCwCESrNztFQ==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 23 Oct 2024 21:38:33 +0100
Subject: [PATCH 5/6] kselftest/arm64: Provide a SIGUSR1 handler in the
 kernel mode FP stress test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-arm64-fp-stress-irritator-v1-5-a51af298d449@kernel.org>
References: <20241023-arm64-fp-stress-irritator-v1-0-a51af298d449@kernel.org>
In-Reply-To: <20241023-arm64-fp-stress-irritator-v1-0-a51af298d449@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=1266; i=broonie@kernel.org;
 h=from:subject:message-id; bh=2eYH4MlA2swbnr7Adf9Eu7+rMkjhAxSKCoo92NFhmpw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnGV8JzNZQSvHQxUSc42pdgj2HsNPx/BcpVh07gynO
 a+c6ELeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZxlfCQAKCRAk1otyXVSH0A/XB/
 wKth7XVx9oz7qbfbhUEMkGwkOSykh7+5RLlvAUOJIoBYlh1ieDD1L9OWcTkbAa2RD+uhlnQrQc2eUm
 eUG/QBJVTQryVUwdV0wPEbOt9JARw63DmunugDrJ5ZzsHKJjNSeVswGtEU+C12ZSO3DmjSt+YQgKiy
 CML0owjEHha21n4gBuapaeBgeWUlGPAOEcWWFxQDPf/bCigtcl61nptjMwpkHisLNDg34Xw3MoVVbv
 rJHizDjXjmogDrvp/XAwGY2MZEFOeNcat73ig+/AOhdYuYg54HSQGvrCeRk9tYBZe5iWnjofKP4rdd
 5JLYCyp/lk5qIIURn4WaTlXEglTh7G
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_133953_160892_556088DF 
X-CRM114-Status: GOOD (  10.05  )
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


