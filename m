Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A44EDEC08
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 04:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jfNz3GxGoDicW62LZuiyKNWvvB4I0Mdzip6nEjCed84=; b=d0LBg7oB5tBig4iaZntNzqjN8J
	vVzsvFERL1/unIXSWnd6zr2SKfJTcDAGs3vv+kIvxg4F1sXGZnGcAYQt50DiPFzhSavcOQfwjZz8f
	9rrCY6wgEWurIfxKAY8kGfcaAt58F4L7injdcLzlKYq9bOxKr/Jc1ir6dMcyRfjozmAI5hrx1b9xf
	peG3BGyzRw25IcL8ZKOpUpf8xbguGGYSVdzMmJfASl6SN04TV7PlV9mmczm2PU3nNO6xolSxmBx2T
	VQoU0evyfrNfN0mJDI/N6lSAM01ytk1BeMSfvwiGC0IQjBkCEXsCVi8SY2ffK2DrGJ9eEqOPV9scg
	y7QTS60w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxdSf-0000000GPH9-2KyH;
	Wed, 04 Mar 2026 04:03:49 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxdSc-0000000GPET-0ojP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 04:03:48 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=jfNz3GxGoDicW62LZuiyKNWvvB4I0Mdzip6nEjCed84=;
	b=uG6ROz7cG1SynSOcfxqOG9HUk2PTlsNNoxEW7RwuCF0Rk3Ry0gZI7HyadMMq6O35RceCou0V0
	GftDMr0ZwkWuOJW7isoWqHn0/I1I2Qoc1Gtu0+6OpQsKT2oxtGYbBBMA9lGROXuPs+/DmjVCKV5
	L7N/1ujn1Zue5106n5FY5yY=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4fQf6Y3NDhz1cyPw;
	Wed,  4 Mar 2026 11:58:45 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 3380D40562;
	Wed,  4 Mar 2026 12:03:36 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 4 Mar
 2026 12:03:35 +0800
From: Yifan Wu <wuyifan50@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <shuah@kernel.org>,
	<tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>, <ben.horgan@arm.com>,
	<jonathan.cameron@huawei.com>, <wuyifan50@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
Subject: [RFC patch 1/9] selftests/resctrl: Move CPU affinity and resctrl FS setup to child process
Date: Wed, 4 Mar 2026 12:03:26 +0800
Message-ID: <20260304040334.765860-2-wuyifan50@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260304040334.765860-1-wuyifan50@huawei.com>
References: <20260304040334.765860-1-wuyifan50@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_200346_893146_DE4973C3 
X-CRM114-Status: GOOD (  21.13  )
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

Currently, the resctrl_val() function sets CPU affinity and writes
the parent process's PID into the control and monitoring groups in the
resctrl file system before forking the benchmark child process. This
causes several issues:

1. Writing the parent process's PID into the resctrl control group
unnecessarily affects the behavior of the parent process, while the
control group should only apply to the benchmark child process.

2. Writing the parent process's PID into the resctrl monitoring group
introduces the parent process's activity into the bandwidth measurement,
affecting the accuracy of the monitoring, which should only monitor the
benchmark child process.

3. Since only the child process is monitored, the CPU affinity should
also be set only on the child process to ensure that the PMU (Performance
Monitoring Unit) can count memory bandwidth from the benchmark process.

4. When the parent and child processes are scheduled on the same CPU,
the parent process's activity may interfere with the monitoring of
the child process. This is particularly problematic in some ARM MPAM
implementations, where memory bandwidth monitoring real-time values. When
the child process is preempted off the CPU, this results in inaccurate
monitoring.

This commit moves the CPU affinity and resctrl FS setup to the child
process after fork(), ensuring these settings only affect the benchmark
process, thereby maintaining measurement accuracy and making the
implementation more portable across platforms.

Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 tools/testing/selftests/resctrl/resctrl_val.c | 68 +++++++++++--------
 1 file changed, 39 insertions(+), 29 deletions(-)

diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index 7c08e936572d..85ac96c7cb8f 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -545,7 +545,6 @@ int resctrl_val(const struct resctrl_test *test,
 	cpu_set_t old_affinity;
 	int domain_id;
 	int ret = 0;
-	pid_t ppid;
 
 	if (strcmp(param->filename, "") == 0)
 		sprintf(param->filename, "stdio");
@@ -556,22 +555,10 @@ int resctrl_val(const struct resctrl_test *test,
 		return ret;
 	}
 
-	ppid = getpid();
-
-	/* Taskset test to specified CPU. */
-	ret = taskset_benchmark(ppid, uparams->cpu, &old_affinity);
-	if (ret)
-		return ret;
-
-	/* Write test to specified control & monitoring group in resctrl FS. */
-	ret = write_bm_pid_to_resctrl(ppid, param->ctrlgrp, param->mongrp);
-	if (ret)
-		goto reset_affinity;
-
 	if (param->init) {
 		ret = param->init(param, domain_id);
 		if (ret)
-			goto reset_affinity;
+			return ret;
 	}
 
 	/*
@@ -586,10 +573,8 @@ int resctrl_val(const struct resctrl_test *test,
 	if (param->fill_buf) {
 		buf = alloc_buffer(param->fill_buf->buf_size,
 				   param->fill_buf->memflush);
-		if (!buf) {
-			ret = -ENOMEM;
-			goto reset_affinity;
-		}
+		if (!buf)
+			return -ENOMEM;
 	}
 
 	fflush(stdout);
@@ -605,11 +590,26 @@ int resctrl_val(const struct resctrl_test *test,
 	 * terminated.
 	 */
 	if (bm_pid == 0) {
+		bm_pid = getpid();
+
+		/* Taskset test to specified CPU. */
+		ret = taskset_benchmark(bm_pid, uparams->cpu, &old_affinity);
+		if (ret)
+			exit(ret);
+
+		/* Write test to specified control & monitoring group in resctrl FS. */
+		ret = write_bm_pid_to_resctrl(bm_pid, param->ctrlgrp, param->mongrp);
+		if (ret)
+			goto reset_affinity;
+
 		if (param->fill_buf)
 			fill_cache_read(buf, param->fill_buf->buf_size, false);
 		else if (uparams->benchmark_cmd[0])
 			execvp(uparams->benchmark_cmd[0], (char **)uparams->benchmark_cmd);
-		exit(EXIT_SUCCESS);
+
+reset_affinity:
+		taskset_restore(bm_pid, &old_affinity);
+		exit(ret);
 	}
 
 	ksft_print_msg("Benchmark PID: %d\n", (int)bm_pid);
@@ -619,23 +619,33 @@ int resctrl_val(const struct resctrl_test *test,
 
 	/* Test runs until the callback setup() tells the test to stop. */
 	while (1) {
-		ret = param->setup(test, uparams, param);
-		if (ret == END_OF_TESTS) {
-			ret = 0;
+		pid_t wpid = waitpid(bm_pid, &ret, WNOHANG);
+
+		if (wpid == -1) {
+			ret = -errno;
+			ksft_perror("Unable to waitpid");
 			break;
 		}
-		if (ret < 0)
-			break;
 
-		ret = param->measure(uparams, param, bm_pid);
-		if (ret)
-			break;
+		if (wpid == 0) {
+			ret = param->setup(test, uparams, param);
+			if (ret == END_OF_TESTS) {
+				ret = 0;
+				break;
+			}
+			if (ret < 0)
+				break;
+
+			ret = param->measure(uparams, param, bm_pid);
+			if (ret)
+				break;
+		} else {
+			goto free_buf;
+		}
 	}
 
 	kill(bm_pid, SIGKILL);
 free_buf:
 	free(buf);
-reset_affinity:
-	taskset_restore(ppid, &old_affinity);
 	return ret;
 }
-- 
2.33.0


