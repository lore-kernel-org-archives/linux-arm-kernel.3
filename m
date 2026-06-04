Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DF3CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 09:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vdFRtWsaNU+RuvyHL5t9MtizWr2iPINKgprB4xBh5SQ=; b=i9DEXZhClgeCviaRaL63Mf8HrU
	FzxkPjsyJjSj0yfDN38l8H651i1uIDAI5ZKxRw4IjJ5t0ypvq4UdeEuCGlNOrcOeEbsRCs72VKseS
	V0HVQgmVrGtY2Iv7wRMZ+IG7VEcbQTYLwT7FbMK7GgLEM6BTv11SzcZpsjW+zbXFElTIaeNvt6vZa
	B2zQpoMU5Yql6mKvM9F7Qt2Dfe3AE81R7wsOPJk1TPoVpXqe2b30UGjZwEigAsGBUbGY4wAcsyW1E
	bjtuz/OTFS29D8/rzZACiqQ6iUjlxruVc/jMM2Pp8N4ySq5JsiBr6UWTzMvyuAR/+ZqlHsnMgNDRK
	s46oLxcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV4BX-0000000GTch-2cd7;
	Thu, 04 Jun 2026 09:16:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV4BV-0000000GTbv-23B2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 09:16:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82C833297;
	Thu,  4 Jun 2026 02:16:09 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 611223F632;
	Thu,  4 Jun 2026 02:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780564574; bh=UbeNZZKEbzzG2XLW8mNJxTdKUKbKMzxs10KksnUNRiw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O6nAgWtETCjYKUzMZpKubmd9PTOnvbycuarRvsUBe3IaeNz9aX5EFVeOGYOiXLAeY
	 7zZ3tfffVI78TMFAJ45m+vixxUhAJyWTL4JOPlej/zxBr8pU6sGE3F12YYiHw1mOfJ
	 oo6T5yAtF68FbWTsRCqymXT86+QI3QrkaxVA1Lec=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Qi Liu <liuqi115@huawei.com>,
	Junhao He <hejunhao3@huawei.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Junrui Luo <moonafterrain@outlook.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuhao Jiang <danisjiang@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] coresight: ultrasoc-smb: Fix OOB write in smb_sync_perf_buffer()
Date: Thu,  4 Jun 2026 10:16:04 +0100
Message-ID: <178056454302.143850.17233470851882854989.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <SYBPR01MB788156B3380A36835DB22290AF102@SYBPR01MB7881.ausprd01.prod.outlook.com>
References: <SYBPR01MB788156B3380A36835DB22290AF102@SYBPR01MB7881.ausprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_021617_568600_9F0B4F9C 
X-CRM114-Status: UNSURE (   8.06  )
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


On Thu, 04 Jun 2026 15:34:25 +0800, Junrui Luo wrote:
> When the SMB sink is used as a perf AUX sink, smb_update_buffer() calls
> smb_sync_perf_buffer() to copy hardware trace data into the perf AUX ring
> buffer pages. It derives pg_idx = head >> PAGE_SHIFT from @head, which is
> handle->head, and indexes dst_pages[pg_idx]. The pg_idx %= nr_pages
> normalization is only applied after the first loop iteration.
> 
> This leaves the initial page index underived from the buffer size, which
> can result in an out-of-bounds write past dst_pages[] when head exceeds
> the AUX buffer size.
> 
> [...]

Applied, thanks!

[1/1] coresight: ultrasoc-smb: Fix OOB write in smb_sync_perf_buffer()
      https://git.kernel.org/coresight/c/98495b5a4d77

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

