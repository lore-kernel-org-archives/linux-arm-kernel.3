Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D19A2CF58C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 18:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TPA2p8LBIvI0WkSWp2K806V4AIWkw5EVBGhtjxzAj7I=; b=k5mn3iM5o4ZKHGj2nnIICYacUq
	jKoz0TeGCeIQzAplgffEwav2Wry840MubsgCzy2+dj/s1lua2W1JgGxhTITlhoNHe311mVXTQ0tcT
	/PpkL1LQvrQz8tB7B1iA5fgkuAByik2JDjYJi3ihBSVIbumsXwm19vy8iV2AF713mtzMRVvK11EWY
	OV28TO5l5cpJ17OEDH5LJ0WVirygn4opKdFjV2SCSyhPLcbBp2w/hfkdkqztMqQv9p1d01V4W5cVP
	Vdt+inV+U9HYRUkHda6PLPPg5FlKYxfdhVaV0JFRm4H0BonrP1Ps4NjkcRIL7jWl02KCqgWTtxulm
	CPFVduaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmY2-00000004Ouf-3yss;
	Wed, 19 Nov 2025 18:04:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmY1-00000004Ote-07fN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 18:04:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BECDBFEC;
	Wed, 19 Nov 2025 10:04:42 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CBD283F740;
	Wed, 19 Nov 2025 10:04:49 -0800 (PST)
Date: Wed, 19 Nov 2025 18:04:47 +0000
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Junhao He <hejunhao3@h-partners.com>, james.clark@linaro.org,
	anshuman.khandual@arm.com, yeoreum.yun@arm.com,
	mike.leach@linaro.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxarm@huawei.com, jonathan.cameron@huawei.com
Subject: Re: [PATCH v4 2/3] coresight: tmc: refactor the tmc-etr mode setting
 to avoid race conditions
Message-ID: <20251119180447.GG8204@e132581.arm.com>
References: <20251111122149.1981162-1-hejunhao3@h-partners.com>
 <20251111122149.1981162-3-hejunhao3@h-partners.com>
 <15868ecb-c1e7-4273-a2e2-5c10f2701c0b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15868ecb-c1e7-4273-a2e2-5c10f2701c0b@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_100453_103417_FD38083C 
X-CRM114-Status: GOOD (  11.52  )
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

On Thu, Nov 13, 2025 at 03:02:45PM +0000, Suzuki Kuruppassery Poulose wrote:
> Hi Junhao,
> 
> While your patch fixes the problem it introduces imbalance in the
> way perf vs sysfs modes are handled.

Previously, I suggested setting the mode in a unified way in
tmc_enable_etr_sink() [1]. After looking into the code again, it seems
that both my suggestion and this patch set the perf mode is too late.

Maybe we need to set the sink's device mode once a session starts to use
it.  So we should set the perf mode when allocating sink's buffer
(tmc_alloc_etr_buffer()), as this is the first callback invoked for a
perf session.

As a result, we can keep to set the sysfs mode in
tmc_enable_etr_sink_sysfs().

A side topic is we need to refactor the tmc_etr_get_sysfs_buffer()
function, ideally this function is purely for allocating buffer without
any locking. We can defer to assign "drvdata->sysfs_buf" until
acquired spin lock in tmc_enable_etr_sink_sysfs().  Essetionally, we
can enable sink in one go rather than acquire-release lock for several
times.

Thanks,
Leo

[1] https://lore.kernel.org/linux-arm-kernel/20251020143718.GH281971@e132581.arm.com/

