Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94EFC83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 12:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2luooegfsb4DEO/3ZGmGN7M4nzL4+C4WyQqAoWEK7hY=; b=dATxVz+ATYhln6hpH7qwjK2pgw
	aA5cE0axaWIrtPwCF0reqxHy4yaMic4G9NSoSj6+QOnmGOu0SzYEm7Wq7jA/oK6j0VTK3NvVbcNZP
	mWlUHidX4Mov3+7xIs7ik9wyJqZFo258UdVsEb7dhxUtdzQojfLfKWPzcmiv5zCh5/nkNWxWw7zY6
	J4JItizDvv/gsG6bQgbH0w38GmObs0YPowwbrRSBDDCjSavWHu2fSX4X47mxhW+GKQwK09Ih4a/SN
	ydEy4U764yPZvpYIDYn7gAsLtBtfUssWU2HJ8MO4Hg4elk72GUEjWlloriA3x567U5qnK2hKfNF1j
	66/UTM+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZTqh-00000008cUP-2Wtm;
	Wed, 09 Jul 2025 12:24:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZS9V-00000008Jyq-0ksU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 10:35:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F4AA1007;
	Wed,  9 Jul 2025 03:35:37 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 94D273F694;
	Wed,  9 Jul 2025 03:35:47 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	kernel@oss.qualcomm.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: Only register perf symlink for sinks with alloc_buffer
Date: Wed,  9 Jul 2025 11:35:38 +0100
Message-ID: <175205730826.265536.15080802362273791797.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250630-etm_perf_sink-v1-1-e4a7211f9ad7@quicinc.com>
References: <20250630-etm_perf_sink-v1-1-e4a7211f9ad7@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_033549_258174_A39B01CC 
X-CRM114-Status: UNSURE (   8.14  )
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


On Mon, 30 Jun 2025 18:26:19 +0800, Yuanfang Zhang wrote:
> Ensure that etm_perf_add_symlink_sink() is only called for devices
> that implement the alloc_buffer operation. This prevents invalid
> symlink creation for dummy sinks that do not implement alloc_buffer.
> 
> Without this check, perf may attempt to use a dummy sink that lacks
> alloc_buffer operationsu to initialise perf's ring buffer, leading
> to runtime failures.
> 
> [...]

Applied, thanks!

[1/1] coresight: Only register perf symlink for sinks with alloc_buffer
      commit: 59b61f705b83d41a876144975a2332c7b8ea96b0

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

