Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129F0C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 14:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wjUMRlc+Y1doDFq1aZ6ziincgKcIfc8ASE042zFyLrk=; b=AdEj+jQOrrvwioZuhzWu7Mjj57
	3TuHOpPYXiCSUq8C2Oti6Y8ms5nOtgiKkaIiIoeNu13VIgd+iuebCx6BVggF1AKP3DGxSw6593wVT
	PXPSw09YJxwkJGoU5EjHQNIGkHohCzfawsWvSlT37YcM1Bq+mRpylSYbVGyXwsAO0xQVi0DxKELMG
	0OFFIwLAFs70wyAS46LHcw/n2Kylv7d4HSTQjQsgRU/l9KecoD96A7wM1p4yQQUgraLe2ZkAYo1s7
	fMII95OAMr1Mr31Occ8OIsvofIQcTpwMLRSDPB+E1zadlaFG5xRwwr+FcopzF/qWijoO+QqfQzqqu
	aF4lj21Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuWHs-00000000pgq-2fXU;
	Thu, 13 Aug 2026 14:20:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuWHp-00000000pgG-0wVH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 14:20:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22E5F1596;
	Thu, 13 Aug 2026 07:19:56 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B07E53F632;
	Thu, 13 Aug 2026 07:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786630800; bh=wjUMRlc+Y1doDFq1aZ6ziincgKcIfc8ASE042zFyLrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nupE95MJPy4vZp6MAdt3R4myZZ0F2Uw3J9oXPYgRFhrkoc6/fUI6EHhltRSADx7CV
	 KyIzZ2Ldzq8uhv+2AX730uoUJJT/F4sPTAopdcujeAytQtYEyTUQ2P/FfpeB150TcI
	 SRpxnC3W2feH+lpz8Llo7608WHiaEplNYi7ee6pE=
Date: Thu, 13 Aug 2026 15:19:57 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>, Suyash Mahar <smahar@meta.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Qi Liu <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
	sashiko-bot <sashiko-bot@kernel.org>
Subject: Re: [PATCH v3 3/8] coresight: etm-perf: Flush workqueue before
 unloading module
Message-ID: <20260813141957.GB8904@e132581.arm.com>
References: <20260728-james-cs-multiple-per-threads-v3-0-6aee7579f1dc@linaro.org>
 <20260728-james-cs-multiple-per-threads-v3-3-6aee7579f1dc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728-james-cs-multiple-per-threads-v3-3-6aee7579f1dc@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_072001_974590_61E7890F 
X-CRM114-Status: UNSURE (   9.79  )
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

On Tue, Jul 28, 2026 at 04:00:15PM +0100, James Clark wrote:
> The work queue is never flushed on module unload, so pending work items
> can run after coresight-config is cleaned up or the .text section is
> unloaded. The global workqueue also can't be flushed manually, so change
> it to a local workqueue and flush it on exit.

Why can't we drop the workqueue if it introduces race conditions and
complexity? In particular, I don't see much benefit from deferring
the resource release.

According to the comment in __rb_free_aux(), the free_aux() callback
should never be called from atomic context. It should be safe to release
the resources directly from the free_aux() callback, without going
through a workqueue.

Thanks,
Leo

