Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DC0E98FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 09:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QhV34Pc+pkOLI+WwjcRnm/3IpWJhftPzSFRTNKk0g4Y=; b=et+6UTH1DuL2h6fyQw5yUajEo/
	wYgQ7GsedVvJIUtoZBMPkBs1aNRQ6+Ef/DPLLxextkrjjNKShwf81oCz9oOZNuO6y1K43rse+QZ34
	ujf1Gud3dGK216a8k8Y8wOFLJMF+C0jn3uniKlSoBDdhMZLX7o9fog2qJhnD5gzfwy9zb8dBniPYG
	FhLqt30ZEP/lJz+jrXI1MnUAcGp0ui/nR9mFLmJksjhNt1PnHF31ouJaR5H7a58QL+7iI04oizAG0
	cOyxe4ti0FaLNVkd+3vkN/5qYb9D3Vqld6JVCOiwBQHGOU/ywpeJNJn75WMMkiUcSXfb+Fq3xqKzI
	DAJMN+jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAm5A-0000000A5tu-2GFD;
	Thu, 09 Apr 2026 09:53:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAm58-0000000A5tB-3K2Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 09:53:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 001883297;
	Thu,  9 Apr 2026 02:53:42 -0700 (PDT)
Received: from [10.43.18.23] (e126510-lin.lund.arm.com [10.43.18.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD0913F641;
	Thu,  9 Apr 2026 02:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775728427; bh=QhV34Pc+pkOLI+WwjcRnm/3IpWJhftPzSFRTNKk0g4Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ppy4nXOSL+Svl8Wj1/y+NNtzd/8t4TDG3CiO9YiESM4YRZoLvAgT0Z/WX4+mMvgbY
	 YUrbFqOsE4ObqBqYgXid652Muy2bAbRU7OPwUPhpXk9JEHYayM63jMVRp1ALbhe4lW
	 DZXIJcvLOX/9RibKmZN/7akNpnkNknwodP2aPbCU=
Message-ID: <567dff89-9f0f-40a0-ab10-22e061b4faaf@arm.com>
Date: Thu, 9 Apr 2026 11:53:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: mm: Fix rodata=full block mapping support
 for realm guests
To: Catalin Marinas <catalin.marinas@arm.com>,
 Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, "David Hildenbrand (Arm)"
 <david@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Yang Shi <yang@os.amperecomputing.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Jinjiang Tu <tujinjiang@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260330161705.3349825-1-ryan.roberts@arm.com>
 <20260330161705.3349825-2-ryan.roberts@arm.com> <ac7VD4Z85nS30GCp@arm.com>
 <ac-W9oNM_O5RTtaf@arm.com> <beacee23-c177-47a1-b8b5-743844b617a8@arm.com>
 <adTPFrlVCEt-hioX@arm.com> <bc4a0246-33bb-443e-a885-a31b24d4a022@arm.com>
 <adTh8d9k3y5ybemL@arm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <adTh8d9k3y5ybemL@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_025350_872347_11F20116 
X-CRM114-Status: GOOD (  12.70  )
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

On 07/04/2026 12:52, Catalin Marinas wrote:
>> if we have forced pte mapping then the value of
>> can_set_direct_map() is irrelevant - we will never need to split because we are
>> already pte-mapped.
> can_set_direct_map() is used in other places, so its value is
> relevant, e.g. sys_memfd_secret() is rejected if this function returns
> false.

Indeed, I have noticed this before: currently set_direct_map_*_noflush()
and other functions will either fail or do nothing if none of the
features (rodata=full, etc.) is enabled, even if we would be able to
split the linear map using BBML2-noabort.

What would make more sense to me is to enable the use of BBML2-noabort
unconditionally if !force_pte_mapping(). We can then have
can_set_direct_map() return true if we have BBML2-noabort, and we no
longer need to check it in map_mem().

This is a functional change that doesn't have anything to do with realms
so it should probably be a separate series - happy to take care of it
once the dust settles on the realm handling.

- Kevin

