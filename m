Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F870D1D482
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 16:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=2Sw1/PmVVPaVe50wrriqAIz4tOLpeIzYU138I3ABQow=; b=milj4kaSX2UKGjdgnmv5iYuF+B
	79KhNMTf33DQPyr+G7RodzzHgo7x/IXaaXFni4FJVJ6U8LWNWYIng3BYiAcJhnaHGzC709UHLPbtT
	yegILogfqhqX8pVGgfAiWADzDcH8tnSKTWrcq4RZbPxNMdNURKSxqZTzCgGmPrgSkFCkuXaXqk+FH
	hyUsBgycOTXvXu5csJPhJlRh5jfqw2uLB7/G6eJ+jlf2KXuCtxKSBkx5738kT3Z1WSSJwzvJvAriY
	3s/Zch7+5cUBtWO+gdlUgUkAen5n3EPfueTH35J1jIyEoI5+yGm1YwSE00ypUbJseOhXw59N/NJXA
	7YMQxvXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsrl-000000008HO-2MQ5;
	Thu, 08 Jan 2026 16:28:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsri-000000008GQ-00I2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 16:28:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 52FC54439E;
	Thu,  8 Jan 2026 16:28:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7481C116C6;
	Thu,  8 Jan 2026 16:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767889681;
	bh=RbOBeQj7BEqUDo0zRZLSlTDxrmJD1FF/FOAMP1TeqWU=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=jfTUwbgBWAw1hZhfBZD68muwgme2H5cF0drNfBe52gxrnEB0esMgKHcdv0estm7Yl
	 5c6a7caNxUQSK04cwG8ptXOoYaznIKcIU0/SJ0wy9Z5xPo9iGHVJP4KNvEKMY4GFPc
	 q6Zx0Gv07NSncsQcII46Oxloj0ybLYYmXoHDuC2w=
Subject: Patch "cpufreq: scmi: Fix null-ptr-deref in scmi_cpufreq_get_rate()" has been added to the 5.10-stable tree
To: ajay.kaher@broadcom.com,alexey.makhalov@broadcom.com,bsdhenrymartin@gmail.com,cristian.marussi@arm.com,gregkh@linuxfoundation.org,linux-arm-kernel@lists.infradead.org,rafael@kernel.org,sashal@kernel.org,shivani.agarwal@broadcom.com,sudeep.holla@arm.com,tapas.kundu@broadcom.com,vamsi-krishna.brahmajosyula@broadcom.com,viresh.kumar@linaro.org,yin.ding@broadcom.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 08 Jan 2026 17:27:37 +0100
In-Reply-To: <20260105095701.659420-1-shivani.agarwal@broadcom.com>
Message-ID: <2026010837-cornea-pregnancy-a181@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_082802_085816_3CACB58B 
X-CRM114-Status: GOOD (  16.23  )
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


This is a note to let you know that I've just added the patch titled

    cpufreq: scmi: Fix null-ptr-deref in scmi_cpufreq_get_rate()

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     cpufreq-scmi-fix-null-ptr-deref-in-scmi_cpufreq_get_rate.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-204627-greg=kroah.com@vger.kernel.org Mon Jan  5 11:19:06 2026
From: Shivani Agarwal <shivani.agarwal@broadcom.com>
Date: Mon,  5 Jan 2026 01:57:01 -0800
Subject: cpufreq: scmi: Fix null-ptr-deref in scmi_cpufreq_get_rate()
To: stable@vger.kernel.org, gregkh@linuxfoundation.org
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, rafael@kernel.org, viresh.kumar@linaro.org, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, ajay.kaher@broadcom.com, alexey.makhalov@broadcom.com, vamsi-krishna.brahmajosyula@broadcom.com, yin.ding@broadcom.com, tapas.kundu@broadcom.com, Henry Martin <bsdhenrymartin@gmail.com>, Sasha Levin <sashal@kernel.org>, Shivani Agarwal <shivani.agarwal@broadcom.com>
Message-ID: <20260105095701.659420-1-shivani.agarwal@broadcom.com>

From: Henry Martin <bsdhenrymartin@gmail.com>

[ Upstream commit 484d3f15cc6cbaa52541d6259778e715b2c83c54 ]

cpufreq_cpu_get_raw() can return NULL when the target CPU is not present
in the policy->cpus mask. scmi_cpufreq_get_rate() does not check for
this case, which results in a NULL pointer dereference.

Add NULL check after cpufreq_cpu_get_raw() to prevent this issue.

Fixes: 99d6bdf33877 ("cpufreq: add support for CPU DVFS based on SCMI message protocol")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
Acked-by: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
[Shivani: Modified to apply on 5.10.y]
Signed-off-by: Shivani Agarwal <shivani.agarwal@broadcom.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/cpufreq/scmi-cpufreq.c |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -29,12 +29,18 @@ static const struct scmi_handle *handle;
 
 static unsigned int scmi_cpufreq_get_rate(unsigned int cpu)
 {
-	struct cpufreq_policy *policy = cpufreq_cpu_get_raw(cpu);
+	struct cpufreq_policy *policy;
+	struct scmi_data *priv;
 	const struct scmi_perf_ops *perf_ops = handle->perf_ops;
-	struct scmi_data *priv = policy->driver_data;
 	unsigned long rate;
 	int ret;
 
+	policy = cpufreq_cpu_get_raw(cpu);
+	if (unlikely(!policy))
+		return 0;
+
+	priv = policy->driver_data;
+
 	ret = perf_ops->freq_get(handle, priv->domain_id, &rate, false);
 	if (ret)
 		return 0;


Patches currently in stable-queue which might be from shivani.agarwal@broadcom.com are

queue-5.10/usb-xhci-move-link-chain-bit-quirk-checks-into-one-helper-function.patch
queue-5.10/crypto-af_alg-zero-initialize-memory-allocated-via-sock_kmalloc.patch
queue-5.10/rdma-core-fix-kasan-slab-use-after-free-read-in-ib_register_device-problem.patch
queue-5.10/ovl-use-buf-flexible-array-for-memcpy-destination.patch
queue-5.10/cpufreq-scmi-fix-null-ptr-deref-in-scmi_cpufreq_get_rate.patch
queue-5.10/drm-vmwgfx-fix-a-null-ptr-access-in-the-cursor-snooper.patch
queue-5.10/scsi-iscsi_tcp-fix-uaf-during-logout-when-accessing-the-shost-ipaddress.patch
queue-5.10/usb-xhci-apply-the-link-chain-quirk-on-nec-isoc-endpoints.patch
queue-5.10/scsi-iscsi-move-pool-freeing.patch

