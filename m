Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A7AC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 16:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Frmlp72955YtazXAE0mB3Aosy8VTdsKnGoTC2uA9ug8=; b=zdmi/hAObTBimcNb3KRQKOcAxj
	K8MgxnX35MrC0LiE2vhg5dT7LZnl/HIuiE3pu/EtFpwCt0rdwyZffIrS0MsaQUB7j4pSDteOiHGRU
	QPfbil6X638Cc8S1pyTSu4lhs1M1VmUwnSlF7ct5WArJesKKOLYJhYnqO1u09bhwBJx/U1xm/S75x
	l0iou523MXqy7v5uxTA8ScZKapo8NaWv7v63YBH2bodWPkgqvJH7Q26k95jR/b73RzJ1f55jEEulL
	xcEFvJiI1Oo9bLXqc5mxZccVkrXKNcOsjqQ0XW6t9vj6J/XkHp9Vs2YoRPvLe+v9UG5pn8QCMqGai
	RLPwf5GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yUh-00000009c4t-0VHl;
	Tue, 08 Sep 2026 16:16:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yUe-00000009c3v-0mT9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 16:16:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 355081476;
	Tue,  8 Sep 2026 09:16:13 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 76E233F7B4;
	Tue,  8 Sep 2026 09:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788884176; bh=W86j1xmuLlz2bk41yXWceX/GDhYI2NYm1k/krLylX4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qh8sgSR2twbUctxTPL7/+iYnMnoN4URVKwArsPBGM/VyK9vQf92Fce8nkCqEgTUB/
	 G9DhPh4RC259GqtINnAUa3906GZ7KK1Y2aAXUMv6Cxzua6FF23/iK06U2Rkz8n560k
	 B/CHzhK2DuOl73avp3FjFYsFMewTAP/L28DTPpJo=
Date: Tue, 8 Sep 2026 17:16:14 +0100
From: Leo Yan <leo.yan@arm.com>
To: yingchao <dengyingchao@kylinsec.com.cn>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Miaoqian Lin <linmq006@gmail.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	qinyungao@kylinsec.com.cn
Subject: Re: [PATCH] coresight: syscfg: fix deadlock on device registration
 failure
Message-ID: <20260908161614.GA200420@e132581.arm.com>
References: <604ED754D4669F40+20260825014717.2346-1-dengyingchao@kylinsec.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <604ED754D4669F40+20260825014717.2346-1-dengyingchao@kylinsec.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_091620_619115_2E1CB154 
X-CRM114-Status: GOOD (  20.71  )
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

On Tue, Aug 25, 2026 at 09:47:17AM +0800, yingchao wrote:

> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
> index 2bfdd7b45e49..d0e7e4720e46 100644
> --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> @@ -1210,8 +1210,14 @@ static int cscfg_create_device(void)
>  	dev->init_name = "cs_system_cfg";
>  
>  	err = device_register(dev);
> -	if (err)
> +	if (err) {
> +		/* put_device() triggers cscfg_dev_release() which takes
> +		 * cscfg_mutex, so drop the lock first to avoid deadlocking.
> +		 */
> +		mutex_unlock(&cscfg_mutex);
>  		put_device(dev);
> +		return err;
> +	}

As module init and exit are serialized by the kernel, I don't think we
need the mutex to protect the allocation and freeing of cscfg_mgr.

The mutex should only be used for exclusively access cscfg_mgr.
So how about the change below?

---8<---

diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
index 2bfdd7b45e49..2dd0b29f44e4 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -1173,27 +1173,21 @@ struct device *cscfg_device(void)
 /* Must have a release function or the kernel will complain on module unload */
 static void cscfg_dev_release(struct device *dev)
 {
-	mutex_lock(&cscfg_mutex);
 	kfree(cscfg_mgr);
 	cscfg_mgr = NULL;
-	mutex_unlock(&cscfg_mutex);
 }
 
 /* a device is needed to "own" some kernel elements such as sysfs entries.  */
 static int cscfg_create_device(void)
 {
 	struct device *dev;
-	int err = -ENOMEM;
-
-	mutex_lock(&cscfg_mutex);
-	if (cscfg_mgr) {
-		err = -EINVAL;
-		goto create_dev_exit_unlock;
-	}
+	int err;
 
 	cscfg_mgr = kzalloc_obj(struct cscfg_manager);
 	if (!cscfg_mgr)
-		goto create_dev_exit_unlock;
+		return -ENOMEM;
+
+	mutex_lock(&cscfg_mutex);
 
 	/* initialise the cscfg_mgr structure */
 	INIT_LIST_HEAD(&cscfg_mgr->csdev_desc_list);
@@ -1204,6 +1198,8 @@ static int cscfg_create_device(void)
 	cscfg_mgr->load_state = CSCFG_NONE;
 	raw_spin_lock_init(&cscfg_mgr->sysfs_store_lock);
 
+	mutex_unlock(&cscfg_mutex);
+
 	/* setup the device */
 	dev = cscfg_device();
 	dev->release = cscfg_dev_release;
@@ -1213,8 +1209,6 @@ static int cscfg_create_device(void)
 	if (err)
 		put_device(dev);
 
-create_dev_exit_unlock:
-	mutex_unlock(&cscfg_mutex);
 	return err;
 }

