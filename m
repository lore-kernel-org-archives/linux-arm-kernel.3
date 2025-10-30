Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AA1CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 14:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8zVA+M1sfKufpTeMBphjot9y9XSTtsAPxfNjirFlyLw=; b=LYjjml5KDWZY03ca8DyUo0qfFH
	6Co+msY5w9yLZDH01aTXHfhtjPEh1v6j9Ia5KnaIAC0zUkC0vZ1bvPStk/0b5cpj1nU2QwmtNn3lV
	Wi7TE4LAjm3UM9DLv6YPPdpiz19lnAUitWKkHZkkt4vM2hI6SH7nHTH3EOFLLZvCS6r8UAKo09NKD
	rK9vgCeeZ01DQdCqAFVOad3N2HnB7qJqq6pPNsG4bWNa0gsMdUmLw3FcP9Ygan6FBc1VDtq+my9LK
	TaJLnBvS/gOCTHceTL/K9zfgR/KLW3D4LAwTeDaeMRKbcQwItFUzniY01NVj4ORzvtpQZZqphyc9p
	dckhbh3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vETWs-00000004IOX-3Tyy;
	Thu, 30 Oct 2025 14:21:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vETWp-00000004INo-2Wmb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 14:21:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DC3E6455CD;
	Thu, 30 Oct 2025 14:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54ECCC4CEF1;
	Thu, 30 Oct 2025 14:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761834086;
	bh=G4M6X4ukwDdtK0M3gElM3SpfrsZYB877fp7JPIwFac0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EncVGbEkQp4nEz26sLKz19YEkza5kL/+obnQL00M6bZAmLviFtplJihyHuPaWc7/1
	 xbHh9bYuj2ycGagq353dm2l2u9sifvEr88rRUykBDEBky9JHgvptwXXB3xLWkXps1I
	 mRU8/XHNiUKJIKcD1x4MIcKktwk2AKX7Dmbi15OCJFDq3D8KN7VprnmCRAgUSq2Fio
	 1pCjz5FaT/uXRVj6kpS0ilZlffdjgAArGcB3/aflFa16MC4yXlWmgLGiRVbv0h6o4S
	 nXVynQ/Z/QaDiOdoVaNMasxUdIazgT20cL5p9ZnPa3/ya3xd0t38WgfHY9fL/RTJl0
	 ZOhsue35I2A+g==
Date: Thu, 30 Oct 2025 14:21:21 +0000
From: Will Deacon <will@kernel.org>
To: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Cc: catalin.marinas@arm.com, guohanjun@huawei.com, chenl311@chinatelecom.cn,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: acpi: Fix incorrect check for default console
 message
Message-ID: <aQN0YWUYaPYWpgJM@willie-the-truck>
References: <20251027141941.3089914-1-punit.agrawal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027141941.3089914-1-punit.agrawal@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_072128_634428_1F9F9171 
X-CRM114-Status: GOOD (  15.51  )
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

On Mon, Oct 27, 2025 at 02:19:41PM +0000, Punit Agrawal wrote:
> bad3fa2fb920 ("ACPI: Suppress misleading SPCR console message when
> SPCR table is absent") mistakenly assumes acpi_parse_spcr() returning
> 0 to indicate a failure to parse SPCR and prints a message to the
> kernel logs accordingly. In reality acpi_parse_spcr() returns 0 on
> success and -ERRNO on failure.
> 
> Fix the faulty check to output the correct logging message.
> 
> Fixes: bad3fa2fb920 ("ACPI: Suppress misleading SPCR console message when SPCR table is absent")
> Signed-off-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
> ---
> Hi,
> 
> After sending a patch to fix incorrect parsing of SPCR[0], I was still
> seeing inconsistent logging on arm64. The result is this nugget.
> 
> Considering the pointless churn - I wondered if it isn't better to
> drop the message? If others agree, I can send a patch (and revert
> bad3fa2fb920 while at it).

I'd be happy dropping the message as it looks pretty useless to me,
especially given that the current logic is broken.

Will

