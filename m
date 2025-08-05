Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16F9C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 15:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BS1Nv3IYXc7ptZpLu1XliiOyDJC9I4rHv8nqrIr3qLU=; b=WmgdjWa/8EiJre5CSj4o7jzToe
	wE8QB+SWyYkwPHGkqjDuCiK7lXEqMVTTkZu86m7n8hEnSAPB+2i0GP5mPq/O3NPsxLIzzhdoEzt4I
	DtfAJgtm1qrXPILnXjFJ+4v9LvT6xq29N/egYUEhjlyCybxuA/ErmXNnaCPoc+KK5qOjKt27lFXlC
	Xy+hxpm1aSIqbxn539XV+T9yXE0luaXcDnus97ieSNRJANxuXXFlcJGCAo6/dJ4YQJSRv8PtDMbw+
	gpU8a61spOUPAVH1As9USkQj1OXqcdddbbez5pziCvAbL7tzHjjwKvxGO1zzgQPBL7z+jy63o9TDU
	dzPlivLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJxc-0000000DCgu-40Zn;
	Tue, 05 Aug 2025 15:52:20 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujIpM-0000000D2im-3E8U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 14:39:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1B0E9A5654C;
	Tue,  5 Aug 2025 14:39:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4453BC4CEF0;
	Tue,  5 Aug 2025 14:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754404783;
	bh=zDU15c/0SyS63Ve+P/xgIY3O2R3OtWuKg0khyFNpS0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QiA8RnhbuUV+U394qNTDHAlY1LIU8/+1wR6oCHm2LO+o9jq2kFxVXE+1SpLfudqQF
	 BUHK6SHRnPACdpYoWgQqiOWEd74Uisk5TvAoHkbO4T+xS0A4kYKX5TryyUtcFnJZPx
	 h7XE0tcRxpVCBHz6OpClkpA8pScSfM6k4y1egE1N0KC8FiayWiojJ5XgkXa13JfuUZ
	 J69buYgraPGMEgnscbaCLiXHgwFbQoJ1itVl7JmgJEsC8EdhQgPw/1b9vysbGGH3VO
	 yDQoC5kxZUfVbGPTrAVYPmoVDkKD08aUV6OQumx7lPfqB3Q2bn9jhR8wU5u033ihmc
	 rGIoXGR8DNcAw==
Date: Tue, 5 Aug 2025 15:39:38 +0100
From: Will Deacon <will@kernel.org>
To: Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, vdonnefort@google.com, qperret@google.com,
	sebastianene@google.com, keirf@google.com, smostafa@google.com
Subject: Re: [PATCH v1 0/4] KVM: arm64: Fixes to handling of restricted
 registers for protected VMs
Message-ID: <aJIXqmv1_0djt82y@willie-the-truck>
References: <20250805135617.831971-1-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805135617.831971-1-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_073944_874791_FD625167 
X-CRM114-Status: GOOD (  13.17  )
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

Hi Fuad,

On Tue, Aug 05, 2025 at 02:56:13PM +0100, Fuad Tabba wrote:
> This patch series is mainly about fixing issues we've encountered in
> pKVM (in downstream Android code), related to the handling of protected
> VM access to restricted registers and injecting undefined exceptions
> into a protected guest.
> 
> The last patch isn't pKVM specific, but a fix to the vgic-v2 code
> encountered while fixing the issues in this series. The issue it fixes
> was indirectly introduced into the code with hVHE.
> 
> Based on Linux 6.16.

Thanks for putting this together so quickly.

I left some small comments on patches 2 and 3 but, for the sake of
transparency (I already mentioned the GIC thing to Marc), please can
you add:

Reported-by: Will Deacon <will@kernel.org>

on patches 1 and 4?

Cheers,

Will

