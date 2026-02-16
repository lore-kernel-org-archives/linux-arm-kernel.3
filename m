Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB2BE81A56
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 17:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yTB7vl34441QlSZfqWReG3VymfEGzuQl/q69TSMOGeA=; b=U4Z/AOcvbvg0rf4DQQxGTz6w0c
	xsWqOrswvLHPtWxi0oQBl+P21qbUK/GIXA1EHWiuwHJ43jJkBZ2QpU0SDNABXkp97k2l8siAQp9Je
	iOJ8prMvTVktqnwoHk7i4BaZaWPUW9Oh7Y5P3wv6bewnRgP1vmyb7GlQCr8bbk1NRDKEgaMzfq1b2
	11/XEIwmSvwYY908L0mNFv33spNyVFyiUc4u6UUUMaMzvveoCdgrxLNAs8r9sfLFYtWFU0MfidT5w
	r2JnVLfWMN+fFm3238QA9wAzIdOInwaUmLKANBuamvlo8rqCUuoewDeyybuu03LQvxfK+8gcKD/0r
	RL03eaQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs277-000000074e6-1POw;
	Mon, 16 Feb 2026 17:10:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs271-000000074dj-36vK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 17:10:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 551A843661;
	Mon, 16 Feb 2026 17:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 350ABC19424;
	Mon, 16 Feb 2026 17:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771261817;
	bh=MPgw0ZJGnZdRd0+uN9tm9xrc36h2WXvcvot70CXaz2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZxATw1ujX7s5XkBVGQDu6naptjeLtuISp7QsMMQdTwCSxe0n4LuMxX6kTykniM0NN
	 XPXu1Is3WK24bS6lJJ/HnnEVOtSgwk8YsfOyWApZEOGReXra2514Uoi4PQJ9VK3foe
	 PQegwoZfEueyX+LrS24cayflZEfBA+Gyyz35luPbnoilNY1weV2cGWsyxTBtH8XwN3
	 r1TnxXewX8akun81SMd3iCDleaipUptT+P09kmlGp30qNBo+u7kszrMc38CacISZNV
	 5UHC0kiSEJK1G7cXNXbaJEjzVVmKiXvK8DTul+eQ2lKpZlg8W4kJUu0MkDz2WZYPBs
	 YfpmbtGEptmZw==
Date: Mon, 16 Feb 2026 17:10:12 +0000
From: Will Deacon <will@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	Oliver Upton <oupton@kernel.org>,
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH] KVM: arm64: Disable TRBE Trace Buffer Unit when running
 in guest context
Message-ID: <aZNPdDAHiLpTvGnS@willie-the-truck>
References: <20260216130959.19317-1-will@kernel.org>
 <86a4x8bw38.wl-maz@kernel.org>
 <aZM9kv9X5KjeM94j@raptor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZM9kv9X5KjeM94j@raptor>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_091020_948252_450241A0 
X-CRM114-Status: GOOD (  18.95  )
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

On Mon, Feb 16, 2026 at 03:53:54PM +0000, Alexandru Elisei wrote:
> Hi,
> 
> On Mon, Feb 16, 2026 at 02:29:31PM +0000, Marc Zyngier wrote:
> > On Mon, 16 Feb 2026 13:09:59 +0000,
> > Will Deacon <will@kernel.org> wrote:
> > > 
> > > The nVHE world-switch code relies on zeroing TRFCR_EL1 to disable trace
> > > generation in guest context when self-hosted TRBE is in use by the host.
> > > 
> > > Per D3.2.1 ("Controls to prohibit trace at Exception levels"), clearing
> > > TRFCR_EL1 means that trace generation is prohibited at EL1 and EL0 but
> > > per R_YCHKJ the Trace Buffer Unit will still be enabled if
> > > TRBLIMITR_EL1.E is set. R_SJFRQ goes on to state that, when enabled, the
> > > Trace Buffer Unit can perform address translation for the "owning
> > > exception level" even when it is out of context.
> > 
> > Great. So TRBE violates all the principles that we hold true in the
> > architecture. Does SPE suffer from the same level of brokenness?
> 
> I think not currently - I_JZRDG from DDI0487M.a.a says that after a PSB + DSB
> 'no new memory accesses using the lower Exception level translation table
> entries occur'.
> 
> But looks like the behaviour will be changed so that it will be similar to TRBE,
> according to the Arm known issues document [1], added in D23136:
> 
> 'When the Proﬁling Buﬀer is enabled, proﬁling is not stopped, and Discard mode
> is not enabled, the Statistical Proﬁling Unit might cause speculative
> translations for the owning translation regime, including when the owning
> translation regime is out-of-context'.

I think SPE is ok, as __debug_save_spe() clears PMSCR_EL1 and (unlike
TRBE) PMSCR_EL1.ExSPE _are_ factored into whether or not profiling is
"enabled".

So there's a funny asymmetry between SPE and TRBE, which I assume is due
to the coresight much associated with the latter.

Will

