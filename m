Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F61DCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 11:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HF0gJsXf4ZRvJK6q3TUKZ70SjvpLfDlE5OPGUg+NXCw=; b=n8HPnSKq1fBwtJc/WWeZxkojuQ
	9PhDR3P2aBIohyOykLGT2AfAGmvCOOwnLK7iOp5UNh3Cl+CnYu7cK0jwS3ttCTfL+npSM8OLT/fkS
	Ngr602xb6uvF5DQ5wr8k66to3Sxas4xEC3Nx9Hn3J3Yud563NCHgnFoO/U5nbh44N4x/dNUmCuQ6d
	rpMvLPQ0zkORtX/EJ5V0pcoLRuVqzsP/HeLdUVLwGiPqS/kuMP8vsyhnMINYSLBpKFt6kFPmVv0qu
	DqhLYnI+RV1mo3LZixOQHm/6UnD/weObm2Qd2v2X2CaFLMiOtuh5lB08VMur/ZRcttd5TbWCqF6oC
	+zcxzp5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMrv-0000000Cqhi-1lsh;
	Tue, 02 Jun 2026 11:01:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMrt-0000000Cqh2-2SJQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 11:01:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3AAB241AFD;
	Tue,  2 Jun 2026 11:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 813CC1F0089A;
	Tue,  2 Jun 2026 11:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780398069;
	bh=HF0gJsXf4ZRvJK6q3TUKZ70SjvpLfDlE5OPGUg+NXCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CY1ggTCWVpa6Zin+p+oIadJ1UBlPgT9j4WFmd9F+IuKVnl1NjTceWNeSbN0kd5wcX
	 UM+P+HuvUsjMtWgNi3EC9NyoPWOqjJS8T8u4JPJeoT9YW67fJF4p3tm9MkRo8gGPW+
	 7i/26zH5RfFJO/bZb+fjxHvGfnPxFsLaw+3DbY0EJcEUCZxwASC5EWvKSTtPL+rIec
	 1AibHH56/Cfn5FVG2xB+2ezw7ZlxR5qsu68uY1Bta0OPkkCvs3fyQx8M27PUwzgFpH
	 YAofl47SlWySX71huCaRhV05pSSL6Be323cUokNcffXsgUSEDhj7xQhMOz8mWBvPYe
	 7XW3rx8ihFi2w==
Date: Tue, 2 Jun 2026 12:01:04 +0100
From: Will Deacon <will@kernel.org>
To: Kohei Enju <enju.kohei@fujitsu.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>, Gavin Shan <gshan@redhat.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] virt: arm-cca-guest: use raw variant of
 smp_processor_id() in arm_cca_report_new()
Message-ID: <ah638FZAyCSqtzMi@willie-the-truck>
References: <20260519101217.155740-1-enju.kohei@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519101217.155740-1-enju.kohei@fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_040109_649674_79A0CF9C 
X-CRM114-Status: GOOD (  16.48  )
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

On Tue, May 19, 2026 at 07:12:08PM +0900, Kohei Enju wrote:
> With CONFIG_DEBUG_PREEMPT=y, smp_processor_id() becomes an alias of
> debug_smp_processor_id(). This debug function complains when certain
> conditions that ensure CPU ID stability are not met, specifically when
> it's called from a preemptible context.
> 
> In arm_cca_report_new(), which runs in a preemptible context,
> smp_processor_id() triggers a splat [0] due to this.
> 
> However, the CPU ID obtained here is used as the target CPU for
> smp_call_function_single() to designate a specific CPU for subsequent
> operations, not to assert that the current thread will continue to
> execute on the same CPU. Therefore, snapshotting the CPU ID itself is
> correct, and thus there's no actual harm except for the splat.
> 
> Use raw_smp_processor_id() instead, to directly retrieve the current CPU
> ID without the debug checks, avoiding the unnecessary warning message
> while preserving the correct functional behavior.

That's pretty disgusting imo so I'd like to see some more justification
for this approach.

> Note that while migrate_disable() would pin the task to the current CPU,
> this path should not block CPU hotplug events. Therefore, we snapshot
> the current CPU ID and accept that smp_call_function_single() may fail
> if the CPU goes offline.

Why shouldn't it block CPU hotplug events? What happens if the CPU goes
offline and comes back online again during the loop of continue calls?

Will

