Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79A2E7E369
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 10:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ht4PoRuzztoHBThREwFRcfEzzWK1xgQtoZW88yHpYP0=; b=m5HQmgVn7lB8g3JOBQxkGQ83w7
	tJak9YTxh8wwAkcjimCIt9FRpHa20x0MetgOp0Nk3jRJLZrw706Jty4+KiLL4gFZGZgRRwpEibFdI
	EybPIf7pX4jg37t36BofnKedNc7YIHdoUXhOUQ/askmrpsHAzyYBmNd5TJVCTC7XThPK33WVOeepe
	SMdFH15VXaa9ZSt+D0tUuNH9jOFyTjCeaNCmAtwkyylzKv6xPFqlbI/KTl46J8pr/W0WzQ1pnicAm
	Szgwm2Mw6U2Agg4UOYhw+cWiEwTNzd0s0ctzHdByJ8VJi4uWqdtc/9cgWZMSY1dRQeaHi6h8oy5zO
	K4OqUgMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8boF-00000001tHe-0SqV;
	Fri, 03 Apr 2026 10:31:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8boC-00000001tHE-0WEo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 10:31:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3083415A1;
	Fri,  3 Apr 2026 03:31:16 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 994913F915;
	Fri,  3 Apr 2026 03:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775212282; bh=RFoHuYAOuSg8suqDOc5oy+GI9ugNPsS9Z9CDnsI79wM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Em5QGKqFHxDxjoGmHrGqLTSRM5oX4iEti0dkapei8+pk30T6omUACran4A6p5K931
	 uSUuqjuxG+jgQW+FizNyMe6J0oQQ/G+AOb1auXzRffHdvaDS0WszgL20qQdjkuLV4N
	 TGM9wXEMan6QRSPvpjslWYECQLeAOak6XlEbIg4o=
Date: Fri, 3 Apr 2026 11:31:18 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Dev Jain <dev.jain@arm.com>, Yang Shi <yang@os.amperecomputing.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Jinjiang Tu <tujinjiang@huawei.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] arm64: mm: Fix rodata=full block mapping support
 for realm guests
Message-ID: <ac-W9oNM_O5RTtaf@arm.com>
References: <20260330161705.3349825-1-ryan.roberts@arm.com>
 <20260330161705.3349825-2-ryan.roberts@arm.com>
 <ac7VD4Z85nS30GCp@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac7VD4Z85nS30GCp@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_033124_281448_B66317EA 
X-CRM114-Status: GOOD (  10.69  )
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

On Thu, Apr 02, 2026 at 09:43:59PM +0100, Catalin Marinas wrote:
> Another thing I couldn't get my head around - IIUC is_realm_world()
> won't return true for map_mem() yet (if in a realm). Can we have realms
> on hardware that does not support BBML2_NOABORT? We may not have
> configuration with rodata_full set (it should be complementary to realm
> support).

With rodata_full==false, can_set_direct_map() returns false initially
but after arm64_rsi_init() it starts returning true if is_realm_world().
The side-effect is that map_mem() goes for block mappings and
linear_map_requires_bbml2 set to false. Later on,
linear_map_maybe_split_to_ptes() will skip the splitting.

Unless I'm missing something, is_realm_world() calls in
force_pte_mapping() and can_set_direct_map() are useless. I'd remove
them and either require BBML2_NOABORT with CCA or get the user to force
rodata_full when running in realms. Or move arm64_rsi_init() even
earlier?

-- 
Catalin

