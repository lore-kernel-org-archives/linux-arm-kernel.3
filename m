Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A766C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 16:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bj2+qSgqLFFvpfA0nqOpB7PXbG4+0iMgROZjvUDW7Po=; b=NiPZgnhV4XHKIm88XsZv1pEBTe
	A8mOyR9b+WRp6s7KXptiCJe+hcjqFRomYXecRoIutH6keTDX45XwbtTRhXDA5iLFi0h8AnoYMhswU
	RAnD9QBIq2mStS0FVDaVSbLlISBY3p99Q0uFJ6gQXVespO5nuEV+1pyRKbOhZWwYGAtgvk0svpHJi
	Cdy3cptvHc/Qwt8+dWhzDWPR2GqVI1KFcQJXOobJdPSL6GlefTA+AJys5asQftfEWVzPjxJoKWW64
	LAA2fSyz9hv8M3eXPxNDvhys7XZfyoT1jG0L2Z86ZK/c2owfFcDJOXfNlu12k8e/bCQGqRhtHYZnJ
	TYbJfAGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mF2-0000000Baiz-0aD1;
	Thu, 24 Sep 2026 16:24:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mEx-0000000BaiO-3dqg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 16:24:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A827152B;
	Thu, 24 Sep 2026 09:24:03 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 52F123F86C;
	Thu, 24 Sep 2026 09:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790267046; bh=nYWPMepafEr1szvqd75pqzJehqgl5uIJn0bLATvvyi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MGnDWvmsse7Nfi8NDxS5JR16IrOZXu8WDUyKnyIAqx6L3CmRlXs5W5MmZFu76yY6z
	 xYR/DpErVu/QRHrUWKH+fBPvVR9MCmvadRojn/hyvPl+WD0TJh4eE4IP2EYEzLlVU7
	 FN8dPHXd1ekC9DrpKWjF6XvlxzfEWz1KVM4gid7c=
Date: Thu, 24 Sep 2026 17:24:04 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yingchao Deng <dengyingchao@kylinsec.com.cn>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	qinyungao@kylinsec.com.cn
Subject: Re: [PATCH v2 1/1] coresight: syscfg: fix deadlock on device
 registration failure
Message-ID: <20260924162404.GN200420@e132581.arm.com>
References: <B16F90D29FAA2B3E+20260914074524.1694-1-dengyingchao@kylinsec.com.cn>
 <6CC680FFAC60931F+20260914074900.1711-1-dengyingchao@kylinsec.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6CC680FFAC60931F+20260914074900.1711-1-dengyingchao@kylinsec.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_092408_017551_CEF4F39A 
X-CRM114-Status: GOOD (  14.00  )
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

On Mon, Sep 14, 2026 at 03:49:00PM +0800, Yingchao Deng wrote:
> cscfg_create_device() calls put_device() on the error path while holding
> cscfg_mutex.  If device_register() fails, put_device() drops the last
> reference and invokes cscfg_dev_release(), which takes cscfg_mutex again,
> deadlocking.
> 
> Module init and exit are serialized by the kernel, so cscfg_mutex is not
> needed to protect the allocation and freeing of cscfg_mgr.  Remove the
> mutex from cscfg_dev_release() and take it only while cscfg_mgr fields
> are being accessed.
> 
> Fixes: 199380decc5f ("coresight: configfs: Fix unload of configurations on module exit")
> Suggested-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: Yingchao Deng <dengyingchao@kylinsec.com.cn>

For this patch:

Reviewed-by: Leo Yan <leo.yan@arm.com>

Sashiko reported an issue for null pointer dereference if configfs
init fails fails [1]. It is good to fix it using a separate patch:

@@ -1299,8 +1299,10 @@ int __init cscfg_init(void)

        /* initialise configfs subsystem */
        err = cscfg_configfs_init(cscfg_mgr);
-       if (err)
-               goto exit_err;
+       if (err) {
+               device_unregister(cscfg_device());
+               return err;
+       }

        /* preload built-in configurations */
        err = cscfg_preload(THIS_MODULE);

@Yingchao, do you mind to work out a formal patch for this?

Thanks,
Leo

[1] https://sashiko.dev/#/patchset/6CC680FFAC60931F%2B20260914074900.1711-1-dengyingchao%40kylinsec.com.cn

