Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0E0CAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 16:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FjDusFkV6Fedc73tWmi89ek/xXuCd4Aj23QQrO3mGxQ=; b=gzRRd0jKKjxRcoKOHPmVY3Clz5
	mIqEy2sC9Nt2UjdonfeiSlLSxvOK7qg3eNmR5vAy6flN4Uuf3HNBczJu6tU0ud9sD4COOfvf4fsnc
	HpJscypcBg/4+n0W0hieqvp5lPk6EjgmqY3p5I70UtbTfnUswu8MPHAkJ0ZLlRke4+AUs1W1pRc7B
	i3I+UBO8jh+p713L5VmfPAUDc3yqSUniS+9HBVKEB/25kYueVedVFtq5Y7OWaDOQlO6BsyCgLIqc6
	sN+Y7gSKlC43dFl9UuN6aVS+MC61xl9bQcbHtK6BCopkM86fNNxlu9RF1U7PkJBfV/wURFVUOBOhi
	m7NMhQZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1oSb-0000000Ax89-3WVi;
	Thu, 25 Sep 2025 16:04:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1oSZ-0000000Ax7a-2CTo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 16:04:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19AA31692;
	Thu, 25 Sep 2025 09:04:34 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C45EE3F694;
	Thu, 25 Sep 2025 09:04:41 -0700 (PDT)
Date: Thu, 25 Sep 2025 17:04:40 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Jie Gan <jie.gan@oss.qualcomm.com>,
	Carl Worth <carl@os.amperecomputing.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] coresight: tmc: add the handle of the event to
 the path
Message-ID: <20250925160440.GD7985@e132581.arm.com>
References: <20250922-fix_helper_data-v1-0-905e8115a24e@oss.qualcomm.com>
 <20250922-fix_helper_data-v1-1-905e8115a24e@oss.qualcomm.com>
 <874isuo0m2.fsf@rasp.cworth.amperemail.amperecomputing.com>
 <f7be3833-9b33-4935-b821-a2e0000a2557@oss.qualcomm.com>
 <CAJ9a7VjaUE+iy=FFwPhCdfXgoGR3rP9WSx-ZkKYeCHhqJ2yzMg@mail.gmail.com>
 <3b16607f-8995-46b1-aecf-c6aa79f66f9d@arm.com>
 <635ba698-d7a9-40d0-9285-4ec108d4a536@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <635ba698-d7a9-40d0-9285-4ec108d4a536@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_090443_603566_DBE7B3D3 
X-CRM114-Status: GOOD (  15.98  )
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

On Thu, Sep 25, 2025 at 11:10:51AM +0100, James Clark wrote:

> > > I would suggest in the csdev (coresight_device) structure itself. We
> > > already have some sink specific data in here e.g. perf_sink_id_map.

[...]

> > I think this data is specific to the session we are enabling the
> > device(s) in. e.g., we keep the trace-id in the path.
> > So, I don't mind having this in the path structure.
> > Instead of modifying csdev with additional locking from "etm-perf"
> > it is always cleaner to handle this in the path.
> 
> Yeah, and perf_sink_id_map only "needs" to be in the csdev because it
> controls sharing IDs between multiple paths which can't be accomplished by
> storing it in the path.

This is a bit off-topic: do we really need to maintain an id_map in
every sink device, or could we simply use a global id_map?

I might miss some info; anyway, consolidating trace IDs is a low
priority for me and not critical to this thread. But this might be
benefit for later refactoring.

Thanks,
Leo

