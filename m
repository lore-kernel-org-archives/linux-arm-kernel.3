Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848A5CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 16:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQPKUXhmti6atme4IK/JBqY0adO7qnSvih5EdwBuHGM=; b=S+UrY3HjjSDqSOMHICzwBcBQ4x
	ECs8nFX4ZS6bn8svouBZHbXOVMC1byyxGKL+FXA2yU2zURNmwVJAeKzpyK0L9QUfXGQjhoHog+yIQ
	zdvFohXKb0h4w9AeW47qlOdqOcwEURLEYr4RwIdaditvtlv5zMgv2ExIAf3QXS5TfslSOwPmheOzT
	LnrZ2UJIxes6S6Y5ggCUq69yvjnzqoS5wwnfG/g8n/KpXkfVk+qKGw1kufg2PL2OkVSfhH5XPk479
	7WdVBihf+2s2+hUq8KgefrAD7ODRTIXQW0tPwl3dmdn95aKCF21kTMqOjJTaX0F0c2S5/VgoanY94
	DqEVKWHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCm4-0000000Crux-17xj;
	Thu, 04 Sep 2025 16:25:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu9c3-0000000BkeC-3K7E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 13:02:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6F602F2E;
	Thu,  4 Sep 2025 06:02:42 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9954A3F6A8;
	Thu,  4 Sep 2025 06:02:50 -0700 (PDT)
Date: Thu, 4 Sep 2025 14:02:48 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Tamas Zsoldos <tamas.zsoldos@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH] coresight: perf: Fix pointer check with IS_ERR_OR_NULL()
Message-ID: <20250904130248.GO745921@e132581.arm.com>
References: <20250904-cs_etm_auxsetup_fix_error_handling-v1-1-ecc5edf282a5@arm.com>
 <5f24d286-629c-404f-8e0f-aa01e27bcb80@linaro.org>
 <20cec516-1589-4fc5-ac07-06029f2dc143@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20cec516-1589-4fc5-ac07-06029f2dc143@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_060251_864829_39DC2618 
X-CRM114-Status: GOOD (  10.63  )
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

On Thu, Sep 04, 2025 at 01:11:37PM +0100, James Clark wrote:

[...]

> > I think the bug is in TRBE. It's the only one that returns an error
> > pointer, but only for -ENOMEM which would normally be NULL for alloc
> > type functions anyway.

Thought again, you are right — it is better to fix this in TRBE, since
we don't really get any benefit from an artificial "-ENOMEM".

Will respin a new one.

Thanks,
Leo

