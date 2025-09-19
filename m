Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7628ECAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 16:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wgeNbwKxSgzsKhrH6afbk3XNjZs0kydnjSCgMq2jyp8=; b=wDdKivXTVpr/CYdQo6Crbomg3/
	tZMJJRHEs7EN3P5Y6LERSs4jPjijivLyz2DZDfkzeJVgt+PESxPKJ7KgGOJpCXoXa1M8JNrlNZuO5
	jr0J8bZ0xGhrMAwPETGarZNNofgnq1btz1YYHrgbAo1ctnRyoIepDLU4+SOnoTS/WWSmvOMrhZUEi
	Xm97ZfJYFDBc0CMujixIE21ZKjl8M8uly1RdbQFhgu3g2zaDn8AIY3S/qgkFBSBjsPdmdzB99iG4n
	eDgO6Fx4PfRGbHyrCSM6cz7sMsf4oGSrNJgAJ1xrN/sqJPaOQenwmaydwmWF7wYxuyarEn2Q/Ixpf
	9l4oHnUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdiP-00000003Ubu-3jNv;
	Fri, 19 Sep 2025 16:12:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdiJ-00000003UYr-190s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 16:12:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81E661BA8;
	Fri, 19 Sep 2025 09:11:50 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D0F73F66E;
	Fri, 19 Sep 2025 09:11:52 -0700 (PDT)
Message-ID: <e403809c-195f-48ca-a8f1-9eb785f229e9@arm.com>
Date: Fri, 19 Sep 2025 17:11:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: Try reading again if MPAM instance returns not
 ready
To: Zeng Heng <zengheng4@huawei.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 fenghuay@nvidia.com, gregkh@linuxfoundation.org, guohanjun@huawei.com,
 jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
 lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com
References: <20250910204309.20751-7-james.morse@arm.com>
 <20250916131717.2980875-1-zengheng4@huawei.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250916131717.2980875-1-zengheng4@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_091159_470409_DAAC71F2 
X-CRM114-Status: GOOD (  15.72  )
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

Hi Zeng,

On 16/09/2025 14:17, Zeng Heng wrote:
> After updating the monitor configuration, the first read of the monitoring
> result requires waiting for the "not ready" duration before an effective
> value can be obtained.

May need to wait - some platforms need to do this, some don't.
Yours is the first I've heard of that does this!


> Because a component consists of multiple MPAM instances, after updating the
> configuration of each instance, should wait for the "not ready" period of
> per single instance before the valid monitoring value can be obtained, not
> just wait for once interval per component.

I'm really trying to avoid that ... if you have ~200 MSC pretending to be one thing, you'd
wait 200x the maximum period. On systems with CMN, the number of MSC scales with the
number of CPUs, so 200x isn't totally crazy.

I think the real problem here is the driver doesn't go on to reconfigure MSC-2 if MSC-1
returned not-ready, meaning the "I'll only wait once" logic kicks in and returns not-ready
to the user. (which is presumably what you're seeing?)

Does this solve your problem?:
-----------------%<-----------------
diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 404bd4c1fd5e..2f39d0339349 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1395,7 +1395,7 @@ static void __ris_msmon_read(void *arg)

 static int _msmon_read(struct mpam_component *comp, struct mon_read *arg)
 {
-       int err, idx;
+       int err, any_err = 0, idx;
        struct mpam_msc *msc;
        struct mpam_vmsc *vmsc;
        struct mpam_msc_ris *ris;
@@ -1412,15 +1412,19 @@ static int _msmon_read(struct mpam_component *comp, stru
ct mon_read *arg)
                                                    true);
                        if (!err && arg->err)
                                err = arg->err;
+
+                       /*
+                        * Save one error to be returned to the caller, but
+                        * keep reading counters so that the get reprogrammed.
+                        * On platforms with NRDY this lets us wait once.
+                        */
                        if (err)
-                               break;
+                               any_err = err;
                }
-               if (err)
-                       break;
        }
        srcu_read_unlock(&mpam_srcu, idx);

-       return err;
+       return any_err;
 }

 int mpam_msmon_read(struct mpam_component *comp, struct mon_cfg *ctx,
-----------------%<-----------------


Thanks,

James

