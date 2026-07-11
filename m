Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6094C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 14:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SbIZZcqbuDpJs1dbeAIlFgxWcMpMo2AYAWkhSGr2bz8=; b=BQajWrV+ZsrJPcm+19iPD3Ub3r
	Wa8aM9+ANKZ70oZ1FPQXzdC23duLilfWTMNwFdVIZGKK59W5QrHZ9n4dFOvyAcOP1/+2b0Kd+7n9w
	4nUvYbkNrkKg7GxJkt4lliWvv95Dc3RM8QQH9TDGtji9gc7KRV+mriHNIrIz9J/yIlqVGo+f5ze8M
	lZP0iCceR7AvnlpD0wLD8HHEpJMl1948Zzb5YsLo9KMQhtB0jjIjy2gVYwr76u4FETGLBizEs2eQD
	uj3wfNQtem+Bs4X3SJj3bDPIpVMu/1fWNKsaVXFmNPNlKXGDeJIGpClL/+Lzircmn2KDZg7k+vUOR
	wAjepPvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiY8e-00000006aa3-0pov;
	Sat, 11 Jul 2026 13:53:04 +0000
Received: from out-189.mta0.migadu.com ([2001:41d0:1004:224b::bd])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiY8b-00000006aZP-2MF4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 13:53:02 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783777964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SbIZZcqbuDpJs1dbeAIlFgxWcMpMo2AYAWkhSGr2bz8=;
	b=SPTFrVriF/OPBE0imuaYJvj/PL3GQ9MgWMPfdGv1sVZJCHRFoxt9LJHkKQ5lqSxwYNeyL8
	K3XNukdpMQzqsxooyDvDI3OS6xI6ZokQPDkA3eVn2ra89/sU37Rm075NFOX1aY7u6799k0
	mUcmNJUi5hzBGIFTjLsSNZjktBnhJLE=
From: Zenghui Yu <zenghui.yu@linux.dev>
To: linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Cc: tglx@kernel.org,
	peterz@infradead.org,
	suzuki.poulose@arm.com,
	mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	Zenghui Yu <zenghui.yu@linux.dev>
Subject: [PATCH] cpu/hotplug: Remove CPUHP_AP_ARM_CORESIGHT_CTI_STARTING
Date: Sat, 11 Jul 2026 21:51:54 +0800
Message-ID: <20260711135154.94276-1-zenghui.yu@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_065301_747192_2B85F7F2 
X-CRM114-Status: UNSURE (   5.73  )
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

The cpuhp_state CPUHP_AP_ARM_CORESIGHT_CTI_STARTING has become unused since
commit 59213b4be5c1 ("coresight: cti: Remove CPU power management code").

Remove it.

Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
---
 include/linux/cpuhotplug.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index 0fb3a2a62eb0..feb32949aeea 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -180,7 +180,6 @@ enum cpuhp_state {
 	CPUHP_AP_DUMMY_TIMER_STARTING,
 	CPUHP_AP_ARM_XEN_STARTING,
 	CPUHP_AP_ARM_XEN_RUNSTATE_STARTING,
-	CPUHP_AP_ARM_CORESIGHT_CTI_STARTING,
 	CPUHP_AP_ARM64_ISNDEP_STARTING,
 	CPUHP_AP_SMPCFD_DYING,
 	CPUHP_AP_HRTIMERS_DYING,
-- 
2.53.0


