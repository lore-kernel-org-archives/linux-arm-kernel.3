Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2DECA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 16:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=276Kl9tbUNLgoQ5ImmUZ2vKMQrjfHRBMdNHI4IWTyZ8=; b=lEJ2yeW7qWM0nhpHJ8aBIfOevs
	h7onu2CEU5WnQtb/RavGWBgXgNbM9wok9plnG3lkt3Mi4vXXajv99gUkUg7UEVSI6+2npYcgFW0+l
	uLKgh1a02LdVZgQVpYKqozZpciR6R736jntZoK29/Nz7lU0X4/d1/ny0BAtIk0uoxNq2Cz3K59DDJ
	wfMMNI+1wHdfVNqoGMaypv2MIO6gmRtGbIZXFQH3vVm/ieVNkJ5g7AxxBtY2PQt+GIo7Wnd+3GWC1
	j8dWirUZbeW2rCMtC4hSbJu30oKnVQl741yhrT3B6qAG5c3eFCQNtX8L0nmsfBw98Ufce6Q/ra1iL
	2DXayjwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umwyz-00000002w0G-1txP;
	Fri, 15 Aug 2025 16:08:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umv6t-00000002g4d-279j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 14:08:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 90A2E45A3E;
	Fri, 15 Aug 2025 14:08:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDEB6C4CEEB;
	Fri, 15 Aug 2025 14:08:42 +0000 (UTC)
Date: Fri, 15 Aug 2025 15:08:40 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	mhiramat@kernel.org, oleg@redhat.com, peterz@infradead.org,
	mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, thiago.bauermann@linaro.org,
	broonie@kernel.org, yury.khrustalev@arm.com,
	kristina.martsenko@arm.com, liaochang1@huawei.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/7] arm64: probes: Add GCS support to bl/blr/ret
Message-ID: <aJ8_aH7ncFfznl8S@arm.com>
References: <20250811141010.741989-1-jeremy.linton@arm.com>
 <20250811141010.741989-5-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811141010.741989-5-jeremy.linton@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_070847_561508_D53A7480 
X-CRM114-Status: GOOD (  12.38  )
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

On Mon, Aug 11, 2025 at 09:10:07AM -0500, Jeremy Linton wrote:
> The arm64 probe simulation doesn't currently have logic in place
> to deal with GCS and this results in core dumps if probes are inserted
> at control flow locations. Fix-up bl, blr and ret to manipulate the
> shadow stack as needed.
> 
> While we manipulate and validate the shadow stack correctly, the
> hardware provides additional security by only allowing GCS operations
> against pages which are marked to support GCS. For writing there is
> gcssttr() which enforces this, but there isn't an equivalent for
> reading. This means that uprobe users should be aware that probing on
> control flow instructions which require reading the shadow stack (ex:
> ret) offers lower security guarantees than what is achieved without
> the uprobe active.
> 
> Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

