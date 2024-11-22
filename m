Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9933E6ADCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 22:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bfY0Pf/J5wwf39xKb8ImS4WjQmELRZS9FkgRQ+eWYnk=; b=pmI3CjFppXEBkW9rTKNXrIi2eS
	xtvYa7lDbR6Mo5iTGbVCRP8Lir97fH/EgWJq5aUSjjyxeW8QNCXB0c+xODxgJB298RNeZL3fJzEDF
	kCOOFg2iIYAAe3uZGxwHZ7ZGzNfCrQVEmBJN8YPop0ZkZb2MqRtaxK6DKcdXp3YRtox6/mUryRIXA
	VzTaGDJ0iH5JjA0/lynyeCOuWjWAddjtw/RryyT32Va13l6Za/okPhDRtPYOQXVScMs6KfDSoMIW5
	84sOhamRhFCWBvTuHdWl5ac2PX6EbBxKhIcbj89Wr9JUNiBRhRMi8mdqlKZydWD3xCjj/mnNN0qQ9
	hyQnIDAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEbp2-00000003Ndu-2Yeu;
	Fri, 22 Nov 2024 22:08:16 +0000
Received: from out-185.mta0.migadu.com ([2001:41d0:1004:224b::b9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEbo4-00000003NWD-3biW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 22:07:18 +0000
Date: Fri, 22 Nov 2024 14:07:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1732313230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bfY0Pf/J5wwf39xKb8ImS4WjQmELRZS9FkgRQ+eWYnk=;
	b=XsRd9CxvGwRA/R7tFTAPja+AHc49dwSaSCQfS4/qfNLc0xp0zLqF29aVLuwnLBhtmMOc8A
	KEBEL1VXtEbRCnu9YEjzzkD2M22Xyypcc/DNWZOyO04ATG0OUhzecpwEVQ5Zou1seFbLfk
	zVwvSjtSC9/2YOZ/N0rfUAq3aSsXqXk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: James Clark <james.clark@linaro.org>
Cc: will@kernel.org, maz@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>,
	James Morse <james.morse@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>, linux-kernel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] arm64: Fix usage of new shifted MDCR_EL2 values
Message-ID: <Z0EAhCbhM1B_4vW9@linux.dev>
References: <20241122164636.2944180-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122164636.2944180-1-james.clark@linaro.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_140717_039960_C5748E67 
X-CRM114-Status: GOOD (  10.16  )
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

+cc Paolo

Ugh, sorry for the mess + thanks for the fix James.

Paolo -- would you be able to apply this patch directly to your tree?
This really should go in ASAP.

Otherwise, I'll grab it + send another pull.

On Fri, Nov 22, 2024 at 04:46:35PM +0000, James Clark wrote:
> Since the linked fixes commit, these masks are already shifted so remove
> the shifts. One issue that this fixes is SPE and TRBE not being
> available anymore:
> 
>  arm_spe_pmu arm,spe-v1: profiling buffer owned by higher exception level
> 
> Fixes: 641630313e9c ("arm64: sysreg: Migrate MDCR_EL2 definition to table")
> Signed-off-by: James Clark <james.clark@linaro.org>

Acked-by: Oliver Upton <oliver.upton@linux.dev>

-- 
Thanks,
Oliver

