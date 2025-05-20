Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102F4C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 16:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8+DLjrItuk1zRshcyb4tCPGWIcuyiHMAv5jYt2HhgJo=; b=bdhPTaNO8ZKLVnwRtrb4540s8b
	BxIF4x2QLjonXWfh1eg8I0fdLdwZf98ZtctgWEJtn0UAz5mBC+ag1YkkivL/EGY3cCGoUKRkIsiyq
	OVhGdzovYc0t6YJIZl0UEtOgVaMU+Z5ubU65u2goARfQNb9CQh5oHa0hpRA/vRyJB31mdKdg+URqG
	9uXkYFYNkLcaDXE91d6qlOaDErGAmW7CkqPm1PlxqjXU9CdPMXZCxLrU3r/VXQtSIXfsUTVygSKW9
	Zse69cBPmepbCxbpGanVFQk0fyIJE5NdCYSNmuHZGyvMf7xZadMiXm1tqwPIlxFYVga150/DG1S+F
	3b08tj/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHPtE-0000000DYBa-2Mj3;
	Tue, 20 May 2025 16:32:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHP6V-0000000DNxU-2yyQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 15:42:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 435B81516;
	Tue, 20 May 2025 08:41:53 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 88F8F3F6A8;
	Tue, 20 May 2025 08:42:05 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: mike.leach@linaro.org,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	leo.yan@arm.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/3] coresight: prevent deactivate active config while enabling the config
Date: Tue, 20 May 2025 16:41:56 +0100
Message-ID: <174775569626.300098.16572506497364238562.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514161951.3427590-1-yeoreum.yun@arm.com>
References: <20250514161951.3427590-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_084207_793246_D910A582 
X-CRM114-Status: UNSURE (   7.11  )
X-CRM114-Notice: Please train this message.
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


On Wed, 14 May 2025 17:19:48 +0100, Yeoreum Yun wrote:
> While enable active config via cscfg_csdev_enable_active_config(),
> active config could be deactivated via configfs' sysfs interface.
> This could make UAF issue in below scenario:
> 
> CPU0                                          CPU1
> (sysfs enable)                                load module
>                                               cscfg_load_config_sets()
>                                               activate config. // sysfs
>                                               (sys_active_cnt == 1)
> ...
> cscfg_csdev_enable_active_config()
> lock(csdev->cscfg_csdev_lock)
> // here load config activate by CPU1
> unlock(csdev->cscfg_csdev_lock)
> 
> [...]

Applied, thanks!

[1/3] coresight/etm4: fix missing disable active config
      https://git.kernel.org/coresight/c/895b12b7
[2/3] coresight: holding cscfg_csdev_lock while removing cscfg from csdev
      https://git.kernel.org/coresight/c/53b9e265
[3/3] coresight: prevent deactivate active config while enabling the config
      https://git.kernel.org/coresight/c/408c97c4

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

