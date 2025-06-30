Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16B1C8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 11:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=usIxoY+eKjTyTsGhK6YSE+DyYx4F9ZFB4YxEJuBttco=; b=RiMqfjXYUYvDgXMN8VFajOVvuN
	f5e7SzKBYJ6K1FN7UB0HSukaIkndRFVSl3skBdRA/KYeQ5vZcIG0xIpaDEqMIrW3aYE/zaKCosdJr
	2TMByRhbTXUV9eTRUXP8Fs98wZakLkkqPTY+9+jw4IJP/fiz3KlEx6DYZVg1QVVSyUO9QOc5BT/JJ
	z5BkqO6a5GUX4Fj0FE3rhv1GaptqVbmoM7eUwgSMQAi+pbnew/nfw53bdbxMAagp0DcJwbTBacK4a
	JmsqRzjGcsuTTEZMsIM7i2ssfBACFztsuSmE8uYFpfAHcF3X+poqUVpEmA5PiBbICefhcOL3puqO3
	yjDtUpVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWCke-000000022gt-3ad4;
	Mon, 30 Jun 2025 11:32:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWCNO-00000001yfT-1ILF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 11:08:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7C461FCD;
	Mon, 30 Jun 2025 04:08:23 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 25F263F6A8;
	Mon, 30 Jun 2025 04:08:39 -0700 (PDT)
Date: Mon, 30 Jun 2025 12:08:36 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: James Clark <james.clark@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>, kernel@oss.qualcomm.com,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Subject: Re: [PATCH] coresight-tmc: Add configurable timeout for flush and
 tmcready
Message-ID: <20250630110836.GT794930@e132581.arm.com>
References: <20250627-flush_timeout-v1-1-2f46a8e9f842@quicinc.com>
 <78f2179d-26c2-47f0-bc19-b72e5e51ad29@linaro.org>
 <20250627141745.GS794930@e132581.arm.com>
 <5f2527d2-be55-411b-a79b-f628e9fe7f06@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f2527d2-be55-411b-a79b-f628e9fe7f06@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_040842_384235_0F54B980 
X-CRM114-Status: GOOD (  13.62  )
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

On Mon, Jun 30, 2025 at 06:40:53PM +0800, Yuanfang Zhang wrote:

[...]

> >>> The current implementation uses a fixed timeout via
> >>> coresight_timeout(), which may be insufficient when multiple
> >>> sources are enabled or under heavy load, leading to TMC
> >>> readiness or flush completion timeout.
> >
> > I would suggest that we first make clear if this is a hardware quirk or
> > a common issue in Arm CoreSight.

> sure, now this issue has been found that not only CPU ETM, but also subsystem ETM.

As the commit log states, "sources are enabled or under heavy load,
leading to TMC readiness or flush completion timeout." I would like to
confirm how this situation can happen.

When disabling a CoreSight path, the driver follows a sequential
order: the source device is disabled first, followed by flushing and
disabling the TMC. We expect that there should be no contention
between source devices and the sink when disabling the path. For a
subsystem ETM, I expect we should also follow this sequence.

Leo

