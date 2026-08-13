Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D174EC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 16:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CassZyB3CfPiImnR0NQX/XzYwGVV1P3P5xE3jYeq9oc=; b=jCb1I5Zn4+TuDsP4XOUiIKJYqE
	Qfz/vONYIz7+W2NamZlAhOkwtUg22vsJv6oX3L6cPVZmesL5cpyn9E00FznWEk1JYIBaetfzGjgD/
	pMkHS9OrFAgh7iyob57sc0Ua4ed7nLWbLeizt0zYpQJss0fUS+dWWGwKk1IkXlHqnGZf+6A3Ir1pq
	loVYUpYQ0IImpgt4xk1PL49AnT1a/q1U/+pxcF6OUFWs9xGtHAt1qglfkQNoCUabWu9NfWjhARHhv
	o/IeOvwMfGGbSXDWD4XZlfNlmxGzhL8IfsCqCZSnVkWEJBuyuYhPCiidJt++6kAZjmlFsRhlbqVsm
	ZU1Oey3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXvc-000000016e5-0gIS;
	Thu, 13 Aug 2026 16:05:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXvZ-000000016dH-1VdL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 16:05:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83FDB1576;
	Thu, 13 Aug 2026 09:05:03 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E3C33F66F;
	Thu, 13 Aug 2026 09:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786637107; bh=CassZyB3CfPiImnR0NQX/XzYwGVV1P3P5xE3jYeq9oc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TNOpS4YLTIhs6sVykm2n3NBT0qKRfMV0QbHUYZyj1BaeXI8ZwRwxiaVivxOfGF0Tj
	 p/rw4rgsNzWOoX1ifg+eKC7MNn7Xg/yNRscpdnf1LvqmIiHeYmONNSahN4m65+UAdN
	 Y9bJ3go5VikudayYlqIgMT86FbnueQURnaa8+kR8=
Date: Thu, 13 Aug 2026 17:05:04 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>, Suyash Mahar <smahar@meta.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Qi Liu <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v3 4/8] coresight: tmc-etr: Prevent per-thread events
 from sharing a sink
Message-ID: <20260813160504.GC8904@e132581.arm.com>
References: <20260728-james-cs-multiple-per-threads-v3-0-6aee7579f1dc@linaro.org>
 <20260728-james-cs-multiple-per-threads-v3-4-6aee7579f1dc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728-james-cs-multiple-per-threads-v3-4-6aee7579f1dc@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_090509_452599_9D70047D 
X-CRM114-Status: GOOD (  10.90  )
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

On Tue, Jul 28, 2026 at 04:00:16PM +0100, James Clark wrote:

[...]

> The identity and compatibility of a session are determined by the owning
> process, the target process, and the inheritance settings together.

Could you elaborate a bit on the session model you are trying to support
here?

My understanding of a legacy sink such as ETR/ETF is that it can be
owned by only one perf session at a time. Multiple events belonging to
that session may use the sink, but an attempt from another perf session
should be rejected with -EBUSY.

For per-thread mode, I wonder if we could support _only_ non-inherited
events. In that case, we would not need to determine compatibility based
on the target process and inheritance settings.

From the patch, it seems trying to support a more flexible model, where
an already active legacy sink can also be shared by another perf session
and also support inherit mode for child events?

Thanks,
Leo

