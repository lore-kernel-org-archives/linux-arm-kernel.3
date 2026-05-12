Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524C4CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 15:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AENqFhTMzGEG0tZvFQfc1G7qbyWmmCFMDTZhOUpQHRY=; b=vv/z2STTtMcYDGuyauE/fg/9QA
	D0y7JU/4bVKl8M1TYvMcE0Z0WbFusIJXVADP7potTWsR3lsPBc7scvgTJg1wzinPvWrTAFTjNSjJZ
	chH/4nEK/+EE+TNbvyMDAburA/u2SuUoCdtvPsblcU4GgO7KKXX485mouj4HyB2Uk4ZmuUYB4NG3h
	38vMDy5rRGyazOqiXHvYSH3s0PH0DnN1Cf5hXl0Tg9UQgeUixnIJlCRtrzmJhbiF5rbd+irmTCRh+
	a7nivXjyyo/YzdNp8onjQXh7guiY2ysKJmu8y50G7Fp9k/w/94JPGmoVGHZuofS+BVwC+9W8uEEL9
	KC9Qq0vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMoxu-0000000HChI-0Sd1;
	Tue, 12 May 2026 15:24:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMoxs-0000000HCgj-0bz3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 15:24:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7230F1691;
	Tue, 12 May 2026 08:23:59 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 516BA3F905;
	Tue, 12 May 2026 08:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778599444; bh=XPwUdxVOc0Tqd107WVgjRsQ2UAF234jshz+3ch/zx5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XXVtzqi8OLp1GOwHqyH658/tCsxQoR/N9z0Ii+Mu0dSY5kw+OcdUAMLVmibTZ6mHu
	 DWySnsUW63/uuDwJ/UTa38Tl2bjQTeyxeDiGnHFu5MyRhon70hkn7f5q8lGNmE3fzZ
	 dmU7lGdZiqOckaWU4Bb7/WPofxK4vzxqCwsGurTA=
Date: Tue, 12 May 2026 16:24:02 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Richard Cheng <icheng@nvidia.com>
Subject: Re: [PATCH v4] coresight: fix missing error code when trace ID is
 invalid
Message-ID: <20260512152402.GB34802@e132581.arm.com>
References: <20260512-fix-trace-id-error-v4-1-eb3de789767a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-fix-trace-id-error-v4-1-eb3de789767a@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_082408_227281_FA0AB1F6 
X-CRM114-Status: UNSURE (   9.15  )
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

On Tue, May 12, 2026 at 09:56:07AM +0800, Jie Gan wrote:
> When coresight_path_assign_trace_id() cannot assign a valid trace ID,
> coresight_enable_sysfs() takes the err_path goto with ret still 0,
> returning success to the caller despite no trace session being started.
> 
> Change coresight_path_assign_trace_id() to return int, moving the
> IS_VALID_CS_TRACE_ID() check inside it so it returns -EINVAL on failure
> and 0 on success. Update both callers to propagate this return value
> directly instead of inspecting path->trace_id after the call.
> 
> Fixes: d87d76d823d1 ("Coresight: Allocate trace ID after building the path")
> Reviewed-by: James Clark <james.clark@linaro.org>
> Reviewed-by: Richard Cheng <icheng@nvidia.com>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Reviewed-by: Leo Yan <leo.yan@arm.com>

