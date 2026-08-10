Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE86EC5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 11:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P0u6lGUiQZ9xDiMEWf+IKqlqkyWhF01/3VtVUUrckZ8=; b=Sbd45oEBEegH0hgqdBEPWAgfa3
	JT1r4nkcs7JyxOMEkqFtf6MSrCmRIipGtk0slMAkW6cosVikfU7NR1kJcb8frumMUEMHXKDF3ZUsT
	ktFbzS5zMCD2XDhEhxe+UzVPRF5b8LRgHt9Y5nkABzKheTx9AYeUAbGDuBNuhzT9pXABapXIRGzvs
	6vC5c6QtHRKaGuCK9gPPdkCOpdO7K85xF2zWDFqNEMDj9Nj6MZA50fRFSZbOx8lL1foobbFNm5tD4
	E7WrhWdtvo67GpUbECYaXjWsYBHc0wCZigr0l0kBtJ/G2DcRByfNM3hh01uhREq7kyrv6fN5R9Zza
	jGQF3i7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOLe-0000000Be5N-32RD;
	Mon, 10 Aug 2026 11:39:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOLd-0000000Be56-0ewV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 11:39:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B3BB94143B;
	Mon, 10 Aug 2026 11:39:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 397A11F000E9;
	Mon, 10 Aug 2026 11:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786361956;
	bh=P0u6lGUiQZ9xDiMEWf+IKqlqkyWhF01/3VtVUUrckZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=0n5GSYMjKpmNPLb015C0thOzWGSPPkoWGGuoIt2+ELcLaSMQGIaMyoOZDKUw+hkvU
	 M+zxwrMLMEusBAVJds31c3BcDFwQ8BC80O+P0nZ62caf6QGVSTDf51Qj8Ak37y0tt0
	 SUElGnBIwcGv63s6L7SLa3uxesIEVZGFEngp5IuY=
Date: Mon, 10 Aug 2026 13:37:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: seanwang1 <seanwang1@lenovo.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Lifeng Zheng <zhenglifeng1@huawei.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Xuewen Yan <xuewen.yan@unisoc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sumit Gupta <sumitg@nvidia.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH v2] arm64: topology: add source check in
 arch_cpu_idle_enter()
Message-ID: <2026081025-rummage-rifling-982e@gregkh>
References: <20260810102006.9986-1-seanwang1@lenovo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810102006.9986-1-seanwang1@lenovo.com>
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

On Mon, Aug 10, 2026 at 06:20:06PM +0800, seanwang1 wrote:
> arch_cpu_idle_enter() directly calls amu_scale_freq_tick() to update
> arch_freq_scale when a CPU enters idle. This bypasses the sft_data
> pointer check that topology_clear_scale_freq_source() relies on.
> 
> As a result, even after calling topology_clear_scale_freq_source()
> with SCALE_FREQ_SOURCE_ARCH to disable AMU-based frequency scaling,
> the arch_freq_scale value can still be modified by AMU counters when
> the CPU goes idle through the arch_cpu_idle_enter() path.
> 
> Add topology_scale_freq_source() helper to check whether a specific
> frequency scaling source is currently registered for a CPU. Use it
> in arch_cpu_idle_enter() to verify that AMU is the active source
> before calling amu_scale_freq_tick().
> 
> This ensures that topology_clear_scale_freq_source() properly
> disables AMU updates in both the tick path (already handled by
> topology_scale_freq_tick()) and the idle path.
> 
> Co-developed-by: Xuewen Yan <xuewen.yan@unisoc.com>
> Signed-off-by: Sean Wang <seanwang1@lenovo.com>
> Signed-off-by: Xuewen Yan <xuewen.yan@unisoc.com>
> ---

The From: line does not match your signed-off-by name :(


