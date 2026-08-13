Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0796CC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 09:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z1T9p/RqBdDP4jZPBGduw91pZoDf4Kuye3RchwPKmOQ=; b=0lijhg3d1g64AIUiVTverTSwvU
	1GE/n6meFxzYABNB896oI4bc8t6VyM7ODfNTb9mXMFbgTcP9s6NwUNEJsBSMa/OEqPBr0jtAzqx33
	ebmrvYuT22+13gDdnZhpXA5SetMp+TrzOFk64a5/TgyeHmcmvpKy71dICT45bmxvAgHRpX4eIP7C9
	tiHwnhnmU8vJGJet6SN+B4ZpNJYCDtD1GVjmyDmQDjHRQczdaD9TugmQ8AThUaCCqOnRsoq4+at07
	2exSe25WsFE8oLCc0L6Y3F4uLyIQql1LbSNBf0rYMlz3rCMUIjnWuOKlU9amxuEprJjLjX/4ThVmm
	R3qVKLsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRRK-00000000FfU-3pWQ;
	Thu, 13 Aug 2026 09:09:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRRI-00000000Fes-2wfc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 09:09:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A689153B;
	Thu, 13 Aug 2026 02:09:23 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06E563F673;
	Thu, 13 Aug 2026 02:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786612167; bh=ua1G1nNjY9yykDJ4/9Vo4C02CNYaRzfGUD5Azmq86sI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WkCWz62ExNR1e12y1hlkqkIISMBo3mBFUvSX3nAKSZfyC6OAHELvWSYkslN77vpQg
	 ICsJgM9GZa/o4hCZ4bzwjovCdZV1K42RWCa517lYsiugDQ+44Fsk0fmFSTM2/Wcv60
	 Sh+jGmjzozMjcvFu7+iFK4jZ+//KE7hfHq4H97VE=
Date: Thu, 13 Aug 2026 10:09:24 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>, Suyash Mahar <smahar@meta.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Qi Liu <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
	sashiko-bot <sashiko-bot@kernel.org>
Subject: Re: [PATCH v3 2/8] coresight: configfs: Don't assume active until
 cscfg_mgr is set
Message-ID: <20260813090924.GA8904@e132581.arm.com>
References: <20260728-james-cs-multiple-per-threads-v3-0-6aee7579f1dc@linaro.org>
 <20260728-james-cs-multiple-per-threads-v3-2-6aee7579f1dc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728-james-cs-multiple-per-threads-v3-2-6aee7579f1dc@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_020928_787399_84B993D0 
X-CRM114-Status: GOOD (  20.32  )
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

On Tue, Jul 28, 2026 at 04:00:14PM +0100, James Clark wrote:
> Perf's etm_setup_aux() calls cscfg_activate_config() and dereferences
> cscfg_mgr, which can be done after coresight_init() has initialized the
> Perf PMU but before cscfg_init() has finished while the driver is still
> loading.

For this patch, if Perf PMU is dependent on cscfg, why we cannot
adjust the init sequence that first call cscfg_init(), then register
cs_etm PMU event?

In _cscfg_activate_config(), I can see it dereferences cscfg_mgr:

  if (cscfg_mgr->load_state == CSCFG_UNLOAD)

This patch does not check if cscfg_mgr is set. If we try to check
cscfg_mgr every time before dereferences it, this approach is quite
fragile.


> Fix it by only assuming cscfg is initialized if cscfg_mgr is set.
> 
> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> Fixes: a0114b4740dd ("coresight: etm-perf: Update to activate selected configuration")
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-syscfg.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
> index 2bfdd7b45e49..475e8fefa100 100644
> --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> @@ -581,7 +581,7 @@ int cscfg_load_config_sets(struct cscfg_config_desc **config_descs,
>  	int err = 0;
>  
>  	mutex_lock(&cscfg_mutex);
> -	if (cscfg_mgr->load_state != CSCFG_NONE) {
> +	if (!cscfg_mgr || cscfg_mgr->load_state != CSCFG_NONE) {
>  		mutex_unlock(&cscfg_mutex);
>  		return -EBUSY;

If cscfg_mgr is NULL, would directly bail out? This can avoid adding
check for every dereference.

Thanks,
Leo

P.S. For me, this kind of rare race condition reported by Sashiko can
sometimes distract from the main issue. Trying to address it in the
same series may mix different issues together. I miss the simpler
approach where issues could be resolved with clear boundary.

