Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810BF10ED65C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vceS2iOZHL3/p0dpEmbF6CqrlJRMsjc/KYiXVZj9w4A=; b=MKnTuj6H6XOOJMyAnlinakTcoo
	19TkXZrMBGxf7CqGLdx4g5+hVkMgHB0aJQ0zNkzvpGp4Dg3NxIf7y9EvUNtN/yVkIK9YOwK/alpHl
	USbdizekWLKY7nxrAZWRC4d9shQTByJqMXxTpTxmAck1+9KQjYr7AbO3VwAcZdsNFbwHuDdXtosOa
	Riw4Ul/2Rd91svutHtOjKZoiu8Woi80WsKyQntljwLxyXTEljBjMb6dRbz+nRjCWa9/Y9CspDITxF
	J5OaarrDDaHqgVse2hdSfD8dzCVEw5ZEI5R0dqrCenIhTW2uAATSI9YYY/Ij7B6o/4d2bhaBTlb7K
	DFEsMPpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65Qh-00000007Ekl-0G97;
	Fri, 27 Mar 2026 11:32:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65Qe-00000007Ejk-0e43
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:32:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A5F42BC0;
	Fri, 27 Mar 2026 04:32:31 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9EE593F915;
	Fri, 27 Mar 2026 04:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774611157; bh=2TfhQfZJo3cGcDNk8bYEhTbtUAaVrh9CYnKjbehQAME=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iNQlvruLtnUBscCggWNfvxet3OPq4Umy0yRwDbmkQKQ8VENMAWZiS/lLFavDzGGV9
	 RPTfBnlessgHRC689GEppIs9NyRirM8ePXWyLxj+qoyIbrT8Fo4g/jgUt436taqmlt
	 4L9/BhiWNCjofSCIKTTtbgLFpi23kcNx03W7jGnM=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: cti: fix the check condition in inout_sel_store
Date: Fri, 27 Mar 2026 11:32:22 +0000
Message-ID: <177461110496.3180945.15389390981384675496.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327-fix-cti-issue-v1-1-2c8921e21fc8@oss.qualcomm.com>
References: <20260327-fix-cti-issue-v1-1-2c8921e21fc8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_043240_234763_2E87758E 
X-CRM114-Status: UNSURE (   6.24  )
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


On Fri, 27 Mar 2026 14:24:14 +0800, Jie Gan wrote:
> Correct the upper bound from CTIINOUTEN_MAX to config->nr_trig_max,
> since nr_trig_max varies across CTI devices. An out-of-bounds issue
> occurs when a value greater than config->nr_trig_max is provided,
> leading to unexpected errors.
> 
> 

Applied, thanks!

[1/1] coresight: cti: fix the check condition in inout_sel_store
      https://git.kernel.org/coresight/c/08643a8760e8

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

