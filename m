Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5EAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 15:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kxZmfQJftfP+UCrXFTFoSbg28UyLxRKi9gHDO1hsDbs=; b=MKSTr73xBweY2CqliTAuQ2IOiE
	qWsBqhINQjgUN6L270n0j9hqk+mPHDY9kLhmQAKKdY0iwUC4cMla6MIO15nWMbk/dhD2KaR3u++ex
	0OPYhFV9yAC5iXd6s9+p9p6W+uNwh3TpeeoVopUeOoNgVEIQa6oaCNcjyBVy2A6Yk2oIBZiJ4thEN
	yPFqBbKpuSVQ2TgTKA5d2GkVYNFtkyZu3PtqXhmi2mnnkXV3G2HaDVXPLDozAmsyz4ipiVj8c0Gsh
	hbfO6boZFtZBiu5uB+f7jex/D//PUJsgLLJ9iQLLEdqxBb6ycjw5DoOgjfVIkfIHYIpVBfeCxzC2k
	wdGnR8mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whqfB-00000002v8q-2pt2;
	Thu, 09 Jul 2026 15:27:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whqf8-00000002v8P-36SJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 15:27:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C4E43592;
	Thu,  9 Jul 2026 08:27:37 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 239FC3F85F;
	Thu,  9 Jul 2026 08:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783610861; bh=aHGiKyTkGfXMqI+ggjvpHqsgsFe9NTsDqcpMbpRnHIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EwepyIJjB5VDfxNop+DFMdXvkRX+HpBt8kj4wEYoMNbiXsQBYRWHO4QWZ1r/KFThS
	 UioKoaa+PCJmduo6H2zR0dtN4eGXWX28LckkcGOgLtfktYip29kM7NlxUjZSk9JlBm
	 YrBsrIYYuxMeNZRKOPimdozQxOyg/l76GYX+7vHs=
Date: Thu, 9 Jul 2026 16:27:39 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 2/2] coresight: tnoc: Fix clock refcount imbalance on
 platform remove
Message-ID: <20260709152739.GF1024232@e132581.arm.com>
References: <20260702-fix-clock-refcount-unbalance-v2-0-2383fbb9952e@oss.qualcomm.com>
 <20260702-fix-clock-refcount-unbalance-v2-2-2383fbb9952e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702-fix-clock-refcount-unbalance-v2-2-2383fbb9952e@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_082742_827508_F0C0C984 
X-CRM114-Status: UNSURE (   9.06  )
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

On Thu, Jul 02, 2026 at 04:54:20PM +0800, Jie Gan wrote:

[...]

> Resume the device with pm_runtime_get_sync() before tearing it down so
> the clock is enabled again and balances the devm-managed disable. Then
> pm_runtime_set_suspended() and pm_runtime_put_noidle() leave the device
> in a coherent runtime PM state (suspended, usage count balanced) once
> the devm action has disabled the clock.
> 
> Fixes: 1abc1b212eff ("coresight: Appropriately disable programming clocks")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Reviewed-by: Leo Yan <leo.yan@arm.com>

