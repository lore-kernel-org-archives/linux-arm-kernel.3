Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B91D74970
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 09:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dOLJHNSe4cFy9wyzH3G6nsR1sZigHG55lB3h6vNQmbw=; b=wVDEGnpwtiblg9HduTRTfc+pvo
	q+9f1XLbhnPXGhIDgebk7wZQSNmHXAabmPnWHxHI0L9YxzRtAXDDP2o2Oq1bYMMRVeMXK4bv9yEGR
	bCZYi8rXYAN7dnR0iyFrEfplypOn4yeZbcgY1XXy3l/jLJky9fWr5hC8TJmz2CGXa0/B03PybDkj4
	dPTo0IzlkjQRdvnC0Fv4Yah1PBQwKMNG8bO7hqYnZIrz0Zqt5p5AW3n4mhge4Ota3or6i6C1Ko1xF
	z5gcXULlWw4NLlgm/pFUI4ww1S646IhR3vUIwG0rUMq1a3TY1SFabUagHrln4Hx7pPQQ/KmKS4efW
	pG55Gp0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWzb-00000009yW4-2Gbg;
	Fri, 19 Dec 2025 09:41:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWzZ-00000009yVe-2jL5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 09:41:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5E52FEC;
	Fri, 19 Dec 2025 01:41:36 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 90CBE3F73F;
	Fri, 19 Dec 2025 01:41:43 -0800 (PST)
Date: Fri, 19 Dec 2025 09:41:41 +0000
From: Leo Yan <leo.yan@arm.com>
To: Ma Ke <make24@iscas.ac.cn>
Cc: jie.gan@oss.qualcomm.com, james.clark@linaro.org,
	akpm@linux-foundation.org, alexander.shishkin@linux.intel.com,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, mathieu.poirier@linaro.org,
	mike.leach@linaro.org, stable@vger.kernel.org,
	suzuki.poulose@arm.com
Subject: Re: [PATCH v2 RESEND] coresight: etm-perf: Fix reference count leak
 in etm_setup_aux
Message-ID: <20251219094141.GA9788@e132581.arm.com>
References: <f85c7d37-4980-46f0-9136-353a35a8f0ed@oss.qualcomm.com>
 <20251219023949.12699-1-make24@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219023949.12699-1-make24@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_014145_751704_ADBC16EE 
X-CRM114-Status: GOOD (  16.55  )
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

Hi,

On Fri, Dec 19, 2025 at 10:39:49AM +0800, Ma Ke wrote:

[...]

> From the discussion, I note two possible fix directions:
> 
> 1. Release the initial reference in etm_setup_aux() (current v2 patch)
> 2. Modify the behavior of coresight_get_sink_by_id() itself so it 
> doesn't increase the reference count. 

The option 2 is the right way to go.

> To ensure the correctness of the v3 patch, I'd like to confirm which 
> patch is preferred. If option 2 is the consensus, I'm happy to modify 
> the implementation of coresight_get_sink_by_id() as suggested.

It is good to use a separate patch to fix
coresight_find_device_by_fwnode() mentioned by James:

diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 0db64c5f4995..2b34f818ba88 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -107,14 +107,16 @@ coresight_find_device_by_fwnode(struct fwnode_handle *fwnode)
 	 * platform bus.
 	 */
 	dev = bus_find_device_by_fwnode(&platform_bus_type, fwnode);
-	if (dev)
-		return dev;
 
 	/*
 	 * We have a configurable component - circle through the AMBA bus
 	 * looking for the device that matches the endpoint node.
 	 */
-	return bus_find_device_by_fwnode(&amba_bustype, fwnode);
+	if (!dev)
+		dev = bus_find_device_by_fwnode(&amba_bustype, fwnode);
+
+	put_device(dev);
+	return dev;
 }
 
 /*
@@ -274,7 +276,6 @@ static int of_coresight_parse_endpoint(struct device *dev,
 
 	of_node_put(rparent);
 	of_node_put(rep);
-	put_device(rdev);
 
 	return ret;
 }

Thanks for working on this.

