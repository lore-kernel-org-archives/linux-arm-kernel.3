Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCA7C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 16:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tYojeL3mbQC0fNOnjLJmawG6l6y2Zkl6LRlnTb/8+oc=; b=Tbs7Vsx9Hc+KShuI8kiCh3x2rk
	wKjV0xl4HMAsfs8wM3U+XD4cyPNka0ZsqmF80nYpYhRDKvXWHDRfRS2Fx2nKYrtlkGroQzdS25fHd
	nPG6AyEtdgdV1CMYgq0alZKoU+uz+GgLB1Opda2+f3YIbH+IyAR5nRrNv10Q6u4E8lzh8ickWwMBU
	p+nt7PaNU3CM2M0AmUFHVl+zeqZfsAqPi9f8hwCVGu0SPICqonguDbuOLvQ6Gf1/FrfRWYV6cSaW1
	561WZ7Cm/z89u5cUHJRImHgTh5l+6nnyVSM8KzUPiWdHvjwPa0oyHv3mlSWl8liisCcprJzBBL8MX
	tTtofoMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYoKW-00000002xsB-1adj;
	Mon, 07 Jul 2025 16:04:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYoDs-00000002wao-0O7u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 15:57:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89912168F;
	Mon,  7 Jul 2025 08:57:26 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 915293F694;
	Mon,  7 Jul 2025 08:57:38 -0700 (PDT)
Date: Mon, 7 Jul 2025 16:57:36 +0100
From: Leo Yan <leo.yan@arm.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v3] perf: arm_spe: Relax period restriction
Message-ID: <20250707155736.GC2182465@e132581.arm.com>
References: <20250627163028.3503122-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627163028.3503122-1-leo.yan@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_085740_174397_BF3B1CA2 
X-CRM114-Status: GOOD (  10.28  )
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

On Fri, Jun 27, 2025 at 05:30:28PM +0100, Leo Yan wrote:
> The minimum interval specified the PMSIDR_EL1.Interval field is a
> hardware recommendation. However, this value is set by hardware designer
> before the production. It is not actual hardware limitation but tools
> currently have no way to test shorter periods.
> 
> This change relaxes the limitation by allowing any non-zero periods,
> with simplifying code with clamp_t().

Hi Will,

Would you mind checking if this small patch is okay to pick up?

Thanks,
Leo

