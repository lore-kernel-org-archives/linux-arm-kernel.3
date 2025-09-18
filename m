Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF42CCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 16:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJsGbwuj7HQx7Aat/S6Xa+ScPec652RrJskLbe4JG8E=; b=N2mxEqqeHSbZ/vT+c7bw+NQgQP
	BDWr/OEfmwYe2RP+vmmBDEZfLLHQSWEUs1nbdfs99tbbo110PTk2SwXQuw1zD4iWJnkPEMs7czrTU
	1RbG/yRNIMKYaScykuYYsYPBxEme4ua4XaU9/RUgA0rilpNeK8d1kc9OuRp5Uk+CzdOjKMJew7IKR
	ZiXZj1ddn32EWLVdaXRpiG8hmLji8WRy2qqy+IErCQgSUqe7EMzCS+RgZkfMBfbVt25IbVNuv6q4c
	7SMYNrZad55HsPOoU6y4rAKNPlyPa1JYvtlZiSed6Xa+lcPfX8/o5jYEIrE7drH/pElwpv1vBfm64
	pI5BMMaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHjY-00000000f9v-2C98;
	Thu, 18 Sep 2025 16:43:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHjK-00000000f0v-3OaL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 16:43:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AAA8260211;
	Thu, 18 Sep 2025 16:43:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D201AC4CEFA;
	Thu, 18 Sep 2025 16:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758213813;
	bh=lgTAwC7SD+XTZHXWyaraCwOTJrZ9IajXNT1Smh9SYCE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jKV6d/eBACcqz84SNmSBOByAIwvUGDKyeLwYqGHbdnIrfuSOKVTefQa7MendYNDzo
	 gD3pJdJy/Coannw2zGQIpFRhEb9YWOYRdqqn/kWiC6J0pSHanvhFcx5kIIfDr2NbYY
	 5oLiFm8ihkGzxPkCp3XvlYCRgRadyXja5XDBc6KtYQ1Gldr95Wcoi9tRKEMkaiSfo2
	 3iRKlYeJNgTcdw3mgw4mbMeLcthK7KCq/w70f5puTtMNMp2yCF48WmYd3XGiv8pOMk
	 ZTLOpUzNFNDhAM4/6ZBhKNp8MhH7XIPA0KlpEp31UkIrqRD11rw38FycVPQV2+S9uA
	 f0IjxDTlXZHwg==
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>,
	Leo Yan <leo.yan@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH 0/2] perf: Fix overflow in PERF_IDX2OFF() for Arm SPE and TRBE drivers
Date: Thu, 18 Sep 2025 17:43:09 +0100
Message-Id: <175820544017.3483828.18098921754214406254.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250917-fix_aux_trace_index-v1-0-e36a76ac6292@arm.com>
References: <20250917-fix_aux_trace_index-v1-0-e36a76ac6292@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 17 Sep 2025 18:41:37 +0100, Leo Yan wrote:
> If the AUX buffer size is specified as 2 GiB or larger, the expression
> "(buf)->nr_pages << PAGE_SHIFT" may exceed 0x8000_0000. Since
> (buf)->nr_pages is a signed integer, the shift can overflow and produce
> a negative value. As a result, PERF_IDX2OFF() fails to work correctly.
> 
> Fix this by casting (buf)->nr_pages to unsigned long before the shift,
> which allows PERF_IDX2OFF() to handle large buffers properly.
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/2] coresight: trbe: Prevent overflow in PERF_IDX2OFF()
      https://git.kernel.org/will/c/105f56877f2d
[2/2] perf: arm_spe: Prevent overflow in PERF_IDX2OFF()
      https://git.kernel.org/will/c/a29fea30dd93

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

