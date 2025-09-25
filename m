Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DBDCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 16:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=87aBpUEgm404Go/kBJrSIdHeNkS6qMc+mGeGMb5P4iQ=; b=iULlf2sQZKy0/WFVYEfeO5XDHa
	FhtF9geULQW95EG86MNykI9KusHWg8lcezXDbrAehcwJjR1iz3fHCc7HDadh3E1vXc9KZnWJBUaFy
	YRBHpqqySORkjHLAzgnxiV5WY8+zbqWMyRn/h+6RhcTjUWG48pcr9JKzrleCILxlOr0cq7VNZ2hQT
	F6fEB4fGS41K4TtiivI3zrvwcbocSemwLxTLKLLMwFZ28oXpzjvquq9nfCP1NNK5xAqxh+ryrVq2g
	5wiwsT8VZilUZB7gHdPXu82v9PYqmiGvZ5i/sW/qQB7SHyd7202cbyMl2XK4iJooHt3098rFFo9ny
	Gu5dMjxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1okH-0000000B4Kw-1MDd;
	Thu, 25 Sep 2025 16:23:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1okF-0000000B4JP-1FLc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 16:23:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4E2F1692;
	Thu, 25 Sep 2025 09:22:46 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C2F43F694;
	Thu, 25 Sep 2025 09:22:54 -0700 (PDT)
Date: Thu, 25 Sep 2025 17:22:52 +0100
From: Leo Yan <leo.yan@arm.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Linu Cherian <lcherian@marvell.com>,
	Mike Leach <mike.leach@linaro.org>, linux-kernel@vger.kernel.org,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	James Clark <james.clark@linaro.org>
Subject: Re: [PATCH v5 3/3] coresight: Fix possible deadlock in
 coresight_panic_cb
Message-ID: <20250925162252.GE7985@e132581.arm.com>
References: <20250925150342.1845615-1-sean.anderson@linux.dev>
 <20250925150342.1845615-4-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925150342.1845615-4-sean.anderson@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_092259_382382_6F323503 
X-CRM114-Status: GOOD (  11.64  )
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

On Thu, Sep 25, 2025 at 11:03:42AM -0400, Sean Anderson wrote:
> Panics can occur at any time, so taking locks may cause a deadlock (such
> as if the panicking CPU held the lock).  coresight_panic_cb uses
> bus_for_each_dev, but that calls bus_to_subsys which takes
> bus_kset->list_lock.
> 
> Instead of registering a single panic notifier and iterating over
> coresight devices, register a panic notifier for each coresight device
> that requires it (letting the atomic notifier list handle iteration).
> atomic_notifier_chain_unregister will just return -ENOENT if a notifier
> block isn't on the list, so it's safe to call when we haven't registered
> a notifier.
> 
> Fixes: 46006ceb5d02 ("coresight: core: Add provision for panic callbacks")
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>

Reviewed-by: Leo Yan <leo.yan@arm.com>

