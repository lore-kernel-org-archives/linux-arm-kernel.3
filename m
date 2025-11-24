Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3295CCFD34D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 18:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ej2ymKTMlpertXQOju4zxnmIWFSufQxb9i82J912MHg=; b=riXhx9kDpapvJMPQF5rWGHI8uH
	Fmo/jlM6pxYbRLZAJWxxJGnIo+A4yOl8d8MgJu9A/kHzT79S5HXkFC5bGGm9S3anIrtKQWHX8s7BA
	C20P+oEvLAUsas2Q6DhZS1jSOkiL4WvsSu4Nqw5cDcI0VQXQxOPueVepMpBikkDLm5DHQa0W4lBLp
	ExVLB7eR3t2L7xWY6qGt/knmMMdf51g8A2YPc99x+0HqIp+BySXQt1jdQThfgsqBxXosZOTbCxREO
	5FAH458Fz92QNGiUhNZkBuL23GYsjqDpEleG/PEI4wchjWySSlrZfXjlj5JMEzfOk/c46NtEgUbBL
	UYheQnHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNbhd-0000000CCee-3z3k;
	Mon, 24 Nov 2025 18:54:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNbha-0000000CCd4-02Ni
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 18:54:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C6801477;
	Mon, 24 Nov 2025 10:54:09 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2185B3F73B;
	Mon, 24 Nov 2025 10:54:16 -0800 (PST)
Date: Mon, 24 Nov 2025 18:54:14 +0000
From: Leo Yan <leo.yan@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	James Clark <james.clark@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] perf: arm_spe: Correct setting the
 PERF_HES_STOPPED flag
Message-ID: <20251124185414.GD724103@e132581.arm.com>
References: <20251110-arm_spe_fix_truncated_flag-v2-0-a629740985cc@arm.com>
 <20251110-arm_spe_fix_truncated_flag-v2-1-a629740985cc@arm.com>
 <aSSEXzMr1drvL2zz@willie-the-truck>
 <20251124184815.GC724103@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124184815.GC724103@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_105419_100390_1DD64356 
X-CRM114-Status: GOOD (  12.23  )
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

On Mon, Nov 24, 2025 at 06:48:15PM +0000, Leo Yan wrote:

[...]


> > If __arm_spe_pmu_next_off() fails, it will call perf_aux_output_end()
> > with the TRUNCATED flag set, which should then disable the event
> > via arm_spe_pmu_del() and update the state there.
> > 
> > Is that not happening?
> 
> Correct.  However, this patch is not for the flow you mentioned.

"Correct" might not be clear enough - I meant that the flow you
mentioned does happen.

