Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9997AC88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 13:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+G1OKXoNBIKzsbl+jc8rigOgfUUb72KCyBt1gFKV3Cw=; b=k7WOKpoSyH87gy2EBAKH/Cm3jU
	gtyaEnOEyJUnUuiRdP+fuF3yz2OL3wJSfNxg2oLTCbA6o0kFTS+XBujalgf+QxSInefNlZ1l8+GPC
	BHNTSPcsjwdUp5W+e+pbJlTy5ZtyQpUL5oby6EfvsUeKWQA5j1qqP7bXeR4df6ilXdL7c4UFWAvHS
	CCDr79PtvIIbv6sbNr1RBd+h90VHjgBSahjvlJQFxRVf9C0qotkXv8i4KrmsLfUI8LfaucQgTxpyY
	qXtn/Zm2c0cRhTvNeeTpjAqIqYkPwwVwob6sf0ON14ZrMU3yBjMs0LjzyQLgAitEx3vwDrbUyNs4I
	nU1VKQyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50te-0000000Ghn6-2Tg5;
	Fri, 11 Sep 2026 13:02:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50tc-0000000Ghmx-2wyO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 13:02:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 73CEE41A80;
	Fri, 11 Sep 2026 13:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9CF81F000FF;
	Fri, 11 Sep 2026 13:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789131744;
	bh=+G1OKXoNBIKzsbl+jc8rigOgfUUb72KCyBt1gFKV3Cw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ocr7i/XKsT0RN6w6ujzcRthZNm2ket/5ZIMILTxA1DtiBBAgEN7aDLFJfOxJOdCR0
	 yTOHSaBzobg8rtZzQhaEJ96Aikqkhg0mW8VaSZkVI9NLXHSLYihIZgyCjiI3Uuk383
	 tVG+BGjmZXW7lREFwrLg/tC2dHg+bLkMwjvCOtLIgbYUd54MCgEkwqq7+quMERF1th
	 wf+VpD+mq5ZnF+GB9UglKAcgLAZ8XsuRF85QJatVv2jJd8bg4tkAU3/iJ7RSsE0vLi
	 nTTcwL3tjYM7Q56E3amwa8g1/xV5z7ZvAOJ1vZAemQGPWGETPI+B5piU/PrH+giWyu
	 bFrV8bAeTrZZg==
Date: Fri, 11 Sep 2026 14:02:18 +0100
From: Will Deacon <will@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org, maz@kernel.org,
	pavan.kondeti@oss.qualcomm.com, tabba@google.com,
	aneesh.kumar@kernel.org, mark.rutland@arm.com,
	sdonthineni@nvidia.com, steven.price@arm.com, gshan@redhat.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev
Subject: Re: [PATCH v17 0/1] arm64: mm: Handle Granule Protection Faults
 (GPFs)
Message-ID: <aqP72gst-Y0KtxA5@willie-the-truck>
References: <20260907162204.1479401-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907162204.1479401-1-suzuki.poulose@arm.com>
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

On Mon, Sep 07, 2026 at 05:22:03PM +0100, Suzuki K Poulose wrote:
> This single patch teaches the arm64 fault handling code about Granule
> Protection Faults, introduced by FEAT_RME. This was posted with KVM CCA
> support series, but split from that, to allow for other users of GPF.
> 
> The immediate user is KVM CCA, where the host may fault if it accesses
> granules that have been delegated for use by a Realm. However, the fault
> handling itself is architectural and not KVM-specific. It should also be useful
> for other FEAT_RME users where an access to secure memory or root memory can
> result in a GPF.
> 
> GPFs during a page table walk are treated as kernel bugs, while non-page-walk
> faults can be reported to userspace with SIGBUS. The patch also allows existing
> exception-table fixups to handle known in-kernel accesses such as
> load_unaligned_zeropad() while private memory remains mapped in the linear map.

I assume you can't handle GUP for realm memory, so you must be using
guest_memfd to avoid userspace mappings of realm memory. In that case,
why don't you unmap it from the linear map entirely? There's ongoing work
to do that afaik, it can be done largely outside of arch code and it
seems like people want it to defend against side channels anyway.

Will

