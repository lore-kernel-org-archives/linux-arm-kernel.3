Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B402C5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 01:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C6BQ0ZMvnsw3QL1OjhWjJTm/MB7zIkXtGvI4HdCGlDw=; b=17P1PUdV4MKHD3CuivlLqfJbnU
	neXf1Dow2mMxUuElZ2rkzVMXRkNditAIg5C/tx2hKuMJtbcdW7oXk3pnOuYefMpMa0SVY84OWpism
	VZd2gQ6kWA6cH2KHl0Mx35/ynqqnoP/gF9P5Cneky0PTmBeTMcGgmR2x1WcEJ+V9m/cUhkwH7hUqe
	+I4t9sbwvN17P9cLkvHsAHCqgP5tzp8erfcWl/Ag5DAIOCNfhmTon68o+3PSN5E20Mpui4/yT9oav
	TgyIQO8VDsRsnz31T4pqMhq2q3YNQJ7fmdqkam7KBbbBIgqp+/8TMV6VzdFiLmc7oxpA1XVsxOqO0
	yolSDgSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wygIw-000000001cG-0HU7;
	Tue, 25 Aug 2026 01:50:22 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wygIp-000000001bW-1S67
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 01:50:20 +0000
X-QQ-mid: zesmtpgz1t1787622551t6b620caf
X-QQ-Originating-IP: m3P3yEbrxEp99n5dkErUQBEK0Gi1iZIhP7jGXaOVI6s=
Received: from localhost.localdomain ( [175.0.204.93])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 25 Aug 2026 09:49:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14636716292373247677
EX-QQ-RecipientCnt: 12
From: yingchao <dengyingchao@kylinsec.com.cn>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Miaoqian Lin <linmq006@gmail.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	qinyungao@kylinsec.com.cn,
	Yingchao Deng <dengyingchao@kylinsec.com.cn>
Subject: [PATCH] coresight: syscfg: fix deadlock on device registration failure
Date: Tue, 25 Aug 2026 09:47:17 +0800
Message-ID: <604ED754D4669F40+20260825014717.2346-1-dengyingchao@kylinsec.com.cn>
X-Mailer: git-send-email 2.45.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: NwLsFfpprmB37ijiOn8qatb6czvonEqbwndVbbeYDDTA4ae92+wmIHSh
	J50WwdjHOPHyZIJzuB7q+ApFb2MZxpXEsSTI9r9QtjnvMzXu2NqLi2gitpu7zcyoVlPovUU
	/jpCXT1y/0pMpGRqSbgTYHREQ5Z2UOjI/gt8jUUXYyRVRwQfiqloef9zCV5jG8aGckRlz6A
	V5u2ZzRbEapGtc2TbMVGDAYjf92+MQx1NhAo75oQiegaO679xMClXmd0zvrNPf6cUrVaV7v
	cvfCndwDX98hdYaDbAnRpDLHM8txY03u7Wwf81GO4lp250/RByYz2cicK6YyqQC42MW/IUV
	EFW+0SU6UTCEQBBgSI/hPEJ4qJJlBKufg9j6EzZXNdVk01zn/m1R1iMKZZR0x0KZM1Tb4Gh
	nSo7ydeq74YHUCLErZ4HyttuWP8VCxooUQ8vvCjPYRbNvEuIqPAZqVa92gQOW8M8v449QhL
	CBQQv8stZyozjNeJN75l21yw6U+UreWCZ0ikIsgWLi3ylAYCFpw86CWcodlefxnhBF92Dt1
	qE2oSDOHFlnCfvfJ0F6wIW4soCekspKScTM4sk8hpDJM8YS5QGGEUFWTBrMEs0o9ASVCWzI
	f8WZ0JGa+k2A0E0fz0ml+V17EiciWY+7CNF5sLHCyFI7vhRd9UESL/foHeceQc90/dpsu6T
	F78lZDLDODiQ3/M1nLaikcOZ09unasU4dl5UvcIJq+ooKMKFPu7VNr0rY0vg1vNpCtPx10V
	xuEv9bBwipr0k1l5tq4K47b05dBmFcGguHAafRQqKB8g2sI2c4mSF6Kjl7LPK+dU5RgoQDH
	jkKfTVmV55YZ6Ntvk4l0d8WZlTfajVExU/MqXLCjCi53p4lnSntXUF46OXFhRaibXvkMmUA
	hjW6hkHtafMDwAlOAPcC2dmL+/EYoUXcNpg0FAI2pMIYNRvAzjoaz5S8pNuJnDKXOe3Rdzx
	ofhzLDr8rd2JNdO9ALWeSHzqbQVgpFi1Ip0uuG07wwasU0KVr9Qhuz/on/PAWxIq/SKUsgg
	FpDbZ9nyb82//hmLm22q9i0ABkQvWne21vmmszXipQYtOVwWyW+FBJRFEjiNCYTVowc6y6X
	8Zrrey4evbgImkijEUXqEX1hiip7Pz6EO8IEoNMYCg0oqO309vW+r73sJH+T7X485Kb3vuj
	NkI2BmA+YV+o23g=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_185015_984693_066858AC 
X-CRM114-Status: GOOD (  10.65  )
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

From: Yingchao Deng <dengyingchao@kylinsec.com.cn>

cscfg_create_device() calls put_device() while holding cscfg_mutex.  If
device_register() failed, put_device() drops the last reference and invokes
cscfg_dev_release(), which takes cscfg_mutex again, deadlocking.

Unlock cscfg_mutex before calling put_device().

Fixes: cfa5dbcdd7ae ("coresight: syscfg: Fix memleak on registration failure in cscfg_create_device")
Signed-off-by: Yingchao Deng <dengyingchao@kylinsec.com.cn>
---
 drivers/hwtracing/coresight/coresight-syscfg.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
index 2bfdd7b45e49..d0e7e4720e46 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -1210,8 +1210,14 @@ static int cscfg_create_device(void)
 	dev->init_name = "cs_system_cfg";
 
 	err = device_register(dev);
-	if (err)
+	if (err) {
+		/* put_device() triggers cscfg_dev_release() which takes
+		 * cscfg_mutex, so drop the lock first to avoid deadlocking.
+		 */
+		mutex_unlock(&cscfg_mutex);
 		put_device(dev);
+		return err;
+	}
 
 create_dev_exit_unlock:
 	mutex_unlock(&cscfg_mutex);
-- 
2.33.0


