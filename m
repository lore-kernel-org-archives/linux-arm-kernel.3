Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FA8C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 09:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bVZcqPwrpAD4UqhpRlmPjuiduvAosmQiw6LzuYgy2CI=; b=QMi4i6UYiT7EsTN5TPeIUpX2qm
	/jGtyaYR1WEWUwVueDDaW/E4dTUw3lEqNQd5LA2jBLS2ORY1Efgp+c3JpVFQAt2AOGbISC4ycBPxp
	PfXG4X99JGYzWmACRs3eVr4m2RG2hCgrtB6ism9Lf0KXcvm0EdejITU1fY2/QDJJ0wIDYAOZZ2IbT
	f+y8NyQStzt+Ut6a0Stin/wiibIws89AXbEI+EtPFsObytcoJEMa1BRHbnxzA5HsFyulQSzrGCnDa
	ScYDvr326+zoNK/aDXFbIdYsqZWtkAxfNxwmHlkwfe1jE4TTrxhtFsL1RMSsY/cIu5kj+YeiwT2rR
	4WyF/tsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1he0-0000000EGjt-383Q;
	Wed, 02 Sep 2026 09:52:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1hdx-0000000EGjT-35xd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 09:52:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E73B165C;
	Wed,  2 Sep 2026 02:52:27 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C12B3F85F;
	Wed,  2 Sep 2026 02:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788342751; bh=vj1d2Hjcr0LTR9YKWkQUvHNJIp5hxBB7jPIEGGLJ+IE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AISmhtUOoPLVaPnw4xik8vp0nRlAZ6FnZ8yIu8D5dNxky4l3GNuToxt6+kyh451sp
	 B53F0ch3P9VhuqeQsXctnzEjN3PYED58wlaaBdbDRZYxm2PKtMk2pKz5qe9oeUldOL
	 J9BC71uzBuw53LkAszGnAB2DmtADvJLq8jVjALqI=
Date: Wed, 2 Sep 2026 10:52:28 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] coresight: tnoc: fix trace ID path assignment failure
 on non-AMBA tnoc
Message-ID: <20260902095228.GV8904@e132581.arm.com>
References: <20260902-fix-trace-id-error-in-tnoc-driver-v2-1-73669a947297@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902-fix-trace-id-error-in-tnoc-driver-v2-1-73669a947297@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_025233_823306_1EE587B0 
X-CRM114-Status: GOOD (  13.81  )
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

On Wed, Sep 02, 2026 at 05:41:43PM +0800, Jie Gan wrote:
> For a tnoc device not on the AMBA bus, atid was set to -EOPNOTSUPP.
> trace_noc_id() returns this value directly to
> coresight_path_assign_trace_id(), which only treats a literal 0
> return as "this device has no ID, keep searching the path" -
> any other value is checked against IS_VALID_CS_TRACE_ID() and
> rejected. A negative atid therefore made path assignment fail with
> -EINVAL instead of falling through to the next device in the path
> that could supply a valid trace ID.
> 
> Use 0, the same sentinel coresight_path_assign_trace_id() already
> recognizes as "not allocated", instead of -EOPNOTSUPP.
> 
> Fixes: 5799dee92dc2 ("coresight-tnoc: add platform driver to support Interconnect TNOC")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Reviewed-by: Leo Yan <leo.yan@arm.com>

