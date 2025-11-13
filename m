Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD68CD8C9C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 16:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhVlSHlsI2eOpvXuT1PBGoELKwc9NP7eiaTgcRPmtK4=; b=h8TvZ9msHBhArAOsNNJ/bUBBtE
	PrwcQ4kA02+s+qJ6Lqu0mp7YAJUmHMBFyZpj04AGVem3OBdw6l9F/03Bh/KGz4ZUnqZw9OuAtwZu2
	Hc8OomH6e2W5rGy4BxRc3s1XzMlVikJDUeFxm7Wpi6YHSq36nkJ2aTRhZDqFTg7Y7qzFG8v2GKlUB
	fyEF8UvA2u30VjgutJLVcurvB7BS5SobGfXUk+zQeIz4IwH9RwDYYFVsk0fheoG+DuERG6wcoX1tW
	qZ3GKpgVqH1tLIESX+pwi/92DdohXoF7MKo0eEhuf9MUP+xCCCTcZ8/NVr7VQ+P4InHAZH6+tnrNL
	24W0O2Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJa2V-0000000Amof-1Z8V;
	Thu, 13 Nov 2025 16:19:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJa2U-0000000AmoB-0odF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 16:19:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3FD80600C3;
	Thu, 13 Nov 2025 16:19:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8E22C4CEF5;
	Thu, 13 Nov 2025 16:19:11 +0000 (UTC)
Date: Thu, 13 Nov 2025 16:19:09 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	ryan.roberts@arm.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: Add a fallback stub for pgd_page_paddr()
Message-ID: <aRYE_Z-x_RUKkqUS@arm.com>
References: <20251014110633.304961-1-anshuman.khandual@arm.com>
 <aQoORmgliayA0s_a@willie-the-truck>
 <e660e033-6300-4deb-b034-4d26746d8d01@arm.com>
 <aQuDdE_Tj3di7q3P@willie-the-truck>
 <044a6526-d6e8-4ae0-9279-8cc42bff5aa0@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <044a6526-d6e8-4ae0-9279-8cc42bff5aa0@arm.com>
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

On Thu, Nov 06, 2025 at 07:29:55AM +0530, Anshuman Khandual wrote:
> On 05/11/25 10:33 PM, Will Deacon wrote:
> > So my question is, would such a user compile today? If not, then your
> > patch is pointless.
> 
> The point is this macro is not visible outside #ifdef PGTBALE_LEVELS > 4
> where as similar ones such as p4d_page_paddr() and pud_page_paddr() are
> always visible via their respective fallback stubs, when PGTABLE_LEVELS
> are lower.

Yes but we needed the p4d/pud fallbacks to be able to use them in
functions like early_fixmap_init_pud() without #ifdefs. We don't have
such a case for pgd_page_paddr(), so I don't think this patch makes
sense on its own.

-- 
Catalin

