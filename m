Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9857E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 08:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FVLlDvOc/WmPvf7983kR+UwF2h9MmqIpndaukwqMXSs=; b=Q+8XxdGTjuiOAPvl1bni3E7hx+
	yG9VokzpXbFnvvQpPAVrHNracU5iVRuOXt+PZMTy/5eVFMLSoh93pMbcDQGg6NOMeEKt3Fgkihv5V
	/eXs1E3CFFwyiu3WbHmiNKrRl0zexuAgtoIAd5OwqDxpw/CadN2vAISJs17yd0gLhLlNgg4DXOVEp
	9pFvtuXkAOYcAgx6rJXppi7W/KkYYMKlBzZMaEgBBiqaBEmlM3FWL/+GsLdHSO85TN+IBGCqouxty
	DKhjjZXPBEI3ItoUKWMYFsNVziJbFSsorBzeEU2F0mKl8OOzqlnrHEVXUoM0tBrUD6uzBqmCdBsGq
	jOx4RUtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV4pO-00000003uG9-2dSw;
	Tue, 07 Jan 2025 08:20:42 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV4mZ-00000003thm-3ncy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 08:17:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1736237865; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=FVLlDvOc/WmPvf7983kR+UwF2h9MmqIpndaukwqMXSs=;
	b=IiZx1FHc/q/3vaefmcQWehrdLFLVYduBonTfRP238obND9FJoxLvqB6L2SKT1w7ECF4JwVBVX4FtdgFRSzPwufO8YMrLTBo3TyhG+tTQTriIM+XMYPPNcdNszxYHrEw0FHFieTCuuHmDCItCCkgMO29n3HW0/OZONE5/8LDDTno=
Received: from localhost.localdomain(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WNA-B3T_1736237859 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 07 Jan 2025 16:17:41 +0800
From: Shuai Xue <xueshuai@linux.alibaba.com>
To: yazen.ghannam@amd.com,
	mark.rutland@arm.com,
	catalin.marinas@arm.com,
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
Cc: linux-acpi@vger.kernel.org,
	linux-mm@kvack.org,
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
Subject: [PATCH v18 1/3] ACPI: APEI: send SIGBUS to current task if synchronous memory error not recovered
Date: Tue,  7 Jan 2025 16:17:33 +0800
Message-ID: <20250107081735.16159-2-xueshuai@linux.alibaba.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250107081735.16159-1-xueshuai@linux.alibaba.com>
References: <20250107081735.16159-1-xueshuai@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_001748_086520_BF91B8C5 
X-CRM114-Status: GOOD (  11.80  )
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
---
 drivers/acpi/apei/ghes.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index 07789f0b59bc..0e643e26c8ad 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -801,6 +801,17 @@ static bool ghes_do_proc(struct ghes *ghes,
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


