Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DCFC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 11:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=drK3E+6nViXnjEUUavUIM/FpiX8fFxLO6Uta+R9hI+E=; b=xVJT4Q3atETRwQAB+0VQF71Lxo
	pNLrPF8q4LMqavW93pK55UbewH4Cfbv5baLZhGQm79CwMZH94pVkotx+OtIyrZQHYKIzvcRXpWTfl
	NptyxBUq05kXaHd5Tcd9UClmIUZogalqoGIlkRSJHXPzpG8RAA8WvvXwnXpQAChRoRPuQejHSkpjN
	vITDSaNDJZbmlDjsHp4coGghjwIzvm7a+0qvNswjW+UV5GPG9MKC2EnOx7mcwXyR8o21NVTekDAKV
	dW8xd85K+oyir6+XTWEPT5ei7HVrlr52hnP0loI89Up2xs2oDOnh6sSIw1HJYHiF2MgizAlnWTEnw
	Npu+w4Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAdA-0000000779F-0MAl;
	Wed, 12 Feb 2025 11:10:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAZ4-000000076Vw-2Z5Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 11:05:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66BFD106F;
	Wed, 12 Feb 2025 03:06:19 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98D223F6A8;
	Wed, 12 Feb 2025 03:05:57 -0800 (PST)
Date: Wed, 12 Feb 2025 11:05:54 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v2 18/18] firmware: arm_ffa: Allow multiple UUIDs per
 partition to register SRI callback
Message-ID: <Z6yAkmNZFnQW5TBZ@bogus>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
 <20250131-ffa_updates-v2-18-544ba4e35387@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131-ffa_updates-v2-18-544ba4e35387@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_030558_700472_68381121 
X-CRM114-Status: GOOD (  19.72  )
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

On Fri, Jan 31, 2025 at 11:24:18AM +0000, Sudeep Holla wrote:
> A partition can implement multiple UUIDs and currently we successfully
> register each UUID service as a FF-A device. However when adding the
> same partition info to the XArray which tracks the SRI callbacks more
> than once, it fails.
> 
> In order to allow multiple UUIDs per partition to register SRI callbacks
> the partition information stored in the XArray needs to be extended to
> a listed list.
> 
> A function to remove the list of partition information in the XArray
> is not added as there are no users at the time. All the partitions are
> added at probe/initialisation and removed at cleanup stage.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/firmware/arm_ffa/driver.c | 157 ++++++++++++++++++++++++++++----------
>  1 file changed, 116 insertions(+), 41 deletions(-)
> 

[...]

>  static void ffa_partitions_cleanup(void)
>  {
> -	struct ffa_dev_part_info *info;
> +	struct ffa_dev_part_info *info, *tmp;
>  	unsigned long idx;
>  
>  	/* Clean up/free all registered devices */
>  	ffa_devices_unregister();
>  
>  	xa_for_each(&drv_info->partition_info, idx, info) {
> +		struct list_head *phead = (struct list_head *)idx;
> +
>  		xa_erase(&drv_info->partition_info, idx);
> -		kfree(info);
> +		list_for_each_entry_safe(info, tmp, phead, node) {
> +			list_del(&info->node);
> +			kfree(info);
> +		}
> +		kfree(phead);

Issue was discovered when testing it as module(that's when cleanup
gets executed). It is now fixed here[1] with the below patch.

Regards,
Sudeep

[1] https://git.kernel.org/sudeep.holla/l/ffa_updates

-->8

diff --git c/drivers/firmware/arm_ffa/driver.c w/drivers/firmware/arm_ffa/driver.c
index 3c49ab3fe118..c184a220147f 100644
--- c/drivers/firmware/arm_ffa/driver.c
+++ w/drivers/firmware/arm_ffa/driver.c
@@ -1644,14 +1644,14 @@ static int ffa_setup_host_partition(int vm_id)
 
 static void ffa_partitions_cleanup(void)
 {
-       struct ffa_dev_part_info *info, *tmp;
+       struct list_head *phead;
        unsigned long idx;
 
        /* Clean up/free all registered devices */
        ffa_devices_unregister();
 
-       xa_for_each(&drv_info->partition_info, idx, info) {
-               struct list_head *phead = (struct list_head *)idx;
+       xa_for_each(&drv_info->partition_info, idx, phead) {
+               struct ffa_dev_part_info *info, *tmp;
 
                xa_erase(&drv_info->partition_info, idx);
                list_for_each_entry_safe(info, tmp, phead, node) {


