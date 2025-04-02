Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A90BC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 14:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fl/ACd6cxYZyAr0DzKQv91y2fVmp6yQ7qq/4gduFWGo=; b=k0z4z+wrOEuFCl6jfJypKGU8ii
	zC4Zb93vgowHWCv7pYTqbg0WD60xodMAsc4JqVQhDJhSKXanmyUD5FBkfpTbKZ7eZeyLW0Ow5g0Ug
	RCugqYZTxmJIRMhg1ayhTg+T6GHgn6t81W5loUNboVI+JOzY9TV1GNhDjzXg0D/9tF5zcgMMkmDo2
	L8qSLDqejD9f7ZVgoDpdElA1Bgd6Fggf8m+8XW1o39D8mw5c6z3Ny9TSNCRfnolIKMDDSBEqthZV0
	Ndux324VtpH9xuuViR+GZmdXQXJdwtZNhWnPS26T814QYgTF24POnJz7RKxLt9j7TBDlWe/iHeEop
	il2J+FdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzW2-00000006R0S-0QrY;
	Wed, 02 Apr 2025 14:56:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzUG-00000006Qqq-3zEr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 14:54:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB179106F;
	Wed,  2 Apr 2025 07:54:42 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 51AA73F694;
	Wed,  2 Apr 2025 07:54:39 -0700 (PDT)
Date: Wed, 2 Apr 2025 15:54:34 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	dan.carpenter@linaro.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: Break to error handler if connection can't be
 made
Message-ID: <20250402145434.GN115840@e132581.arm.com>
References: <20250402-james-cs-ret-break-fix-v1-1-83907d9f6b38@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402-james-cs-ret-break-fix-v1-1-83907d9f6b38@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_075441_028234_28180DBB 
X-CRM114-Status: UNSURE (   9.44  )
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

On Wed, Apr 02, 2025 at 02:07:59PM +0100, James Clark wrote:
> Change the return to a break so that the of_node_put()s in the error
> handler are hit on failure.
> 
> Fixes: 3d4ff657e454 ("coresight: Dynamically add connections")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/linux-arm-kernel/3b026b3f-2cb2-49ef-aa20-8b14220f5324@stanley.mountain/
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

