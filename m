Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC66C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 11:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+76yUy7TzXhpXgqUwvq+FQ+43/zxDFHrfDPZv8tHy0=; b=ijyEO5d0WTqoQGHNbRABs7vOIO
	zZ3AzhehUOW9Z6rlhs15NZm1w2iHkgJpByZNkRfHXG3uMOB/ylEYQosg6r6XyndoocatsuUPK1H88
	nFWNLYzTVLsusBo6UwIuVfECklIIQN5V9G+cLrW19L/npP00oU558AhQFOCoqjGgrhL8vIgcTTbyH
	Y2UW2MkjPwrpEQs4eYszNll5Hae/gUlACn+qSLCGehZGcBlU+ov+mXHBhjdXOTvhtDtrkcQ9XhVcZ
	QzCXriNqPf/K+GPWAL7H5zmHZE14vKQhcsEHrK4SvjOA5DWExoT9ZBmJGDefrwzHKcvVnWbUwY1Vg
	LZdh84/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubHeu-000000023vs-2tl6;
	Mon, 14 Jul 2025 11:47:48 +0000
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubHZt-0000000233x-0rG4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 11:42:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1752493352; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=h+76yUy7TzXhpXgqUwvq+FQ+43/zxDFHrfDPZv8tHy0=;
	b=CgrvruRm+luH0QmOBW/SutkHArm5+HoUpsnolCTEghlrZk+ov/zDtCPwgupjDa7hOLWuPfwQfg6v/7i8zRHrBa1ewG7sNIHbaaLEkO+xJtxEoz/+RAlnQMhTvdfwl67I8351oRnbYEaFOskrNcGuHh9m2eUixJeF/EWnEsVDv5o=
Received: from localhost.localdomain(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WiufzwS_1752493348 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 14 Jul 2025 19:42:29 +0800
From: Shuai Xue <xueshuai@linux.alibaba.com>
To: catalin.marinas@arm.com,
	sudeep.holla@arm.com,
	guohanjun@huawei.com,
	lpieralisi@kernel.org,
	linux-acpi@vger.kernel.org,
	yazen.ghannam@amd.com,
	mark.rutland@arm.com,
	mingo@redhat.com,
	robin.murphy@arm.com,
	Jonathan.Cameron@Huawei.com,
	bp@alien8.de,
	rafael@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	wangkefeng.wang@huawei.com,
	tanxiaofei@huawei.com,
	mawupeng1@huawei.com,
	tony.luck@intel.com,
	linmiaohe@huawei.com,
	naoya.horiguchi@nec.com,
	james.morse@arm.com,
	tongtiangen@huawei.com,
	gregkh@linuxfoundation.org,
	will@kernel.org,
	jarkko@kernel.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	linux-edac@vger.kernel.org,
	x86@kernel.org,
	xueshuai@linux.alibaba.com,
	justin.he@arm.com,
	ardb@kernel.org,
	ying.huang@linux.alibaba.com,
	ashish.kalra@amd.com,
	baolin.wang@linux.alibaba.com,
	tglx@linutronix.de,
	dave.hansen@linux.intel.com,
	lenb@kernel.org,
	hpa@zytor.com,
	robert.moore@intel.com,
	lvying6@huawei.com,
	xiexiuqi@huawei.com,
	zhuo.song@linux.alibaba.com
Subject: [PATCH v19 1/2] ACPI: APEI: send SIGBUS to current task if synchronous memory error not recovered
Date: Mon, 14 Jul 2025 19:42:11 +0800
Message-Id: <20250714114212.31660-2-xueshuai@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250714114212.31660-1-xueshuai@linux.alibaba.com>
References: <20250714114212.31660-1-xueshuai@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_044237_397061_73C0D546 
X-CRM114-Status: GOOD (  11.29  )
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

Synchronous error was detected as a result of user-space process accessing
a 2-bit uncorrected error. The CPU will take a synchronous error exception
such as Synchronous External Abort (SEA) on Arm64. The kernel will queue a
memory_failure() work which poisons the related page, unmaps the page, and
then sends a SIGBUS to the process, so that a system wide panic can be
avoided.

However, no memory_failure() work will be queued when abnormal synchronous
errors occur. These errors can include situations such as invalid PA,
unexpected severity, no memory failure config support, invalid GUID
section, etc. In such case, the user-space process will trigger SEA again.
This loop can potentially exceed the platform firmware threshold or even
trigger a kernel hard lockup, leading to a system reboot.

Fix it by performing a force kill if no memory_failure() work is queued
for synchronous errors.

Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
Reviewed-by: Jane Chu <jane.chu@oracle.com>
Reviewed-by: Hanjun Guo <guohanjun@huawei.com>
---
 drivers/acpi/apei/ghes.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index f0584ccad451..281a0a2f6730 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -902,6 +902,17 @@ static bool ghes_do_proc(struct ghes *ghes,
 		}
 	}
 
+	/*
+	 * If no memory failure work is queued for abnormal synchronous
+	 * errors, do a force kill.
+	 */
+	if (sync && !queued) {
+		dev_err(ghes->dev,
+			HW_ERR GHES_PFX "%s:%d: synchronous unrecoverable error (SIGBUS)\n",
+			current->comm, task_pid_nr(current));
+		force_sig(SIGBUS);
+	}
+
 	return queued;
 }
 
-- 
2.39.3


