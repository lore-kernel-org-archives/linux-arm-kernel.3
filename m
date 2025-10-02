Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91C1CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 11:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Km/dUXS3Bo8kb/Q+OJyzQ5joN1wN3Rn4kdEqhUzEcY=; b=1QNBRGpjo+0WUU3JSmzcBuk/j8
	9+YH5VluCbthA90b6nUSwUuRl1ci3myuvucR0rSUuhYWTgFZIz4Qvog4Vi/c1BIX4MYuCt+BnyDGZ
	Ks+zbgFUkgTRb/807KAFHNPI5DpxetosY4Q4YoyNLRKQOpnYPD0Ov6Z5xqRDbdTSPZjAWoFHcQ8vX
	hZ0tXcKbOq9RekHjclgxPNJsqAB4vUicjjh+E3HZ9rRmkwfapXABZKWEeMRH8qDU8EWkIyfFokGBb
	mC/lWVZSn2DqmOBzM2LYfOPzCQtISHqT1KBDUrIQBYqRg03umS6DgNesYjB9aX04dKB0lO05aSb7r
	9S30dtXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Hkm-0000000AONX-14KH;
	Thu, 02 Oct 2025 11:45:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Hkj-0000000AONC-16vS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 11:45:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E64E91595;
	Thu,  2 Oct 2025 04:45:31 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 864F43F59E;
	Thu,  2 Oct 2025 04:45:39 -0700 (PDT)
Date: Thu, 2 Oct 2025 12:45:37 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 0/5] coresight: Add format attribute for setting the
 timestamp interval
Message-ID: <20251002114537.GU7985@e132581.arm.com>
References: <20251002-james-cs-syncfreq-v3-0-fe5df2bf91d1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002-james-cs-syncfreq-v3-0-fe5df2bf91d1@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_044541_351205_B7808010 
X-CRM114-Status: UNSURE (   9.54  )
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

On Thu, Oct 02, 2025 at 11:09:28AM +0100, James Clark wrote:
> Do some cleanups then add a new format attribute to set the timestamp
> interval for ETMv4 in Perf mode. The current interval is too high for
> most use cases, and particularly on the FVP the number of timestamps
> generated is excessive.

For the series:

Reviewed-by: Leo Yan <leo.yan@arm.com>

