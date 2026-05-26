Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DE5CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 10:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tLvcVcVxJiONQZDgxDbkVAM4VnMTie9/jbe9M/yDzTM=; b=NfdBO7pvXPBlcYw1Y+2JsSDdCW
	zLlmqRVn2B207owXL7shC9wGYJ+b/my0IiL1OiWlPT0T/y1qP6IQxqnULBbdF2TQvE3O5tQsjnDjw
	n2vFDvbCAlDqcEhXNn4PFuRMkDFK2Bw8ZyjIJ2yHzj7U/JmjAyyQGngtxZnIVZxcg7b+IgLO7Jszg
	uEPBuOb7XT70wg0pUn6iXwfIEcf8uIAZzF/dXR4qkajE3EKPAd3IvuyX/Fi6M1AAHWfySM8xLLgVl
	rjT/HgUkLzOkP8CLWAV6ZmeIXO7z/FRU1VToHFibXyuxSJqmo2MtkMTZqjYaVAiQQDj2wrbmQlIVn
	X5soVeWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRp9e-00000001fNw-1jND;
	Tue, 26 May 2026 10:36:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRp9d-00000001fNm-3Hva
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 10:36:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 268186008A;
	Tue, 26 May 2026 10:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B3ED1F000E9;
	Tue, 26 May 2026 10:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779791816;
	bh=tLvcVcVxJiONQZDgxDbkVAM4VnMTie9/jbe9M/yDzTM=;
	h=From:To:Cc:Subject:Date;
	b=MUBjDPw5TOxBUqpUnCixRmAF1U/HFE4mTEUZc9PGnYUG4t4cv+f4kBO4mo37Zuz5b
	 GlboD6KeBhq7WhpyvyT+lVZL13TO+SW1bCkbAB/uzs9GabJIL02LjZ+xac6+JEiKyZ
	 RVnMdNO+EXzWoq/xV2AgRL4exG933i5JmdN0Fg6XPFkIJX2eVDDbDWFpaAsR1UqstY
	 egoFTqjqX9DDT3UtoF5R0OkoDDVDPfyhqUNjyIC+GYqxFBkVlI4gfz5gj0WtI0fa3a
	 N891nq38gcl7N6odS/4DLUx3Y1+kqHNIpDxBbpMBjYpWKhS5YJRsnK8cc6I/W6cMuE
	 F/njRe1QBV1cA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] firmware: arm_ffa: Treat missing FF-A feature on a platform as a probe miss
Date: Tue, 26 May 2026 11:36:49 +0100
Message-ID: <20260526103649.5684-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

When FF-A initialisation is driven from a platform device probe, systems
that do not implement FF-A can return -EOPNOTSUPP from the early transport
or version discovery paths. Driver core treats that as a matched probe
failure and prints:

  |  arm-ffa arm-ffa: probe with driver arm-ffa failed with error -95

That is noisy for a firmware interface that can be absent on otherwise
valid systems. Driver core already treats -ENODEV and -ENXIO as quiet
rejected matches, so translate only the early unsupported discovery cases
to -ENODEV. Keep later setup failures unchanged so real FF-A
initialisation problems are still reported as probe failures.

Reported-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://lore.kernel.org/all/20260523001148.GA1319283@ax162
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_ffa/driver.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 54984e1b9741..0f468362c288 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -2109,7 +2109,7 @@ static int ffa_probe(struct platform_device *pdev)
 
 	ret = ffa_transport_init(&invoke_ffa_fn);
 	if (ret)
-		return ret;
+		return ret == -EOPNOTSUPP ? -ENODEV : ret;
 
 	drv_info = kzalloc_obj(*drv_info);
 	if (!drv_info)
@@ -2117,8 +2117,11 @@ static int ffa_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, drv_info);
 
 	ret = ffa_version_check(&drv_info->version);
-	if (ret)
+	if (ret) {
+		if (ret == -EOPNOTSUPP)
+			ret = -ENODEV;
 		goto free_drv_info;
+	}
 
 	if (ffa_id_get(&drv_info->vm_id)) {
 		pr_err("failed to obtain VM id for self\n");
-- 
2.43.0


