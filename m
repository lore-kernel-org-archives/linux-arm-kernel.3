Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D893C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 17:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6kehVAZEo+ZucQDHGHJvqtMR9sh8Lq9Ff6Bwcszm0N0=; b=KsvQEhqYnctMdXbvu0Pgnvs1YQ
	lq3QXxnnc+8OGB4wMQ7jnSoTpyv8pVpzRzF4bMnpjueKs4xW7Uu1tiyr4dsVy+JuNgP0e04PDCVf3
	jBm7RCylYFzNA0OMfdLufSxOj2AZ0petqPx3A0qHCad7P9LYxfsl6ZvJKMwQB2oqa6q13guJjNr1x
	fBMpqjog1q5hsOdurmW6nTvVNqqJhSoy3vJm3TGpVENhOrLd+392clyaqvcjCe8ElsqqyOoXfs/U2
	FQVv1AjIOhuQRoxWckqNmpSGJA21qXoCfHo2uJw3VxrtOExZB0FgFEi6OMYvFNZin00eI7v0RH9Ka
	jdljJ8VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyZN-00000000ZxK-0moA;
	Tue, 25 Feb 2025 17:18:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyGH-00000000UvE-3Idg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 16:58:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A21961BCB;
	Tue, 25 Feb 2025 08:58:41 -0800 (PST)
Received: from [10.1.27.154] (XHFQ2J9959.cambridge.arm.com [10.1.27.154])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 539A53F5A1;
	Tue, 25 Feb 2025 08:58:23 -0800 (PST)
Message-ID: <a734d321-c839-498b-ac5d-2e9ab5355cff@arm.com>
Date: Tue, 25 Feb 2025 16:58:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/14] mm/vmalloc: Batch arch_sync_kernel_mappings()
 more efficiently
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250217140809.1702789-1-ryan.roberts@arm.com>
 <20250217140809.1702789-12-ryan.roberts@arm.com> <Z73jrWlV5X9senZw@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <Z73jrWlV5X9senZw@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_085825_880989_EEC938FE 
X-CRM114-Status: UNSURE (   8.12  )
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

On 25/02/2025 15:37, Catalin Marinas wrote:
> On Mon, Feb 17, 2025 at 02:08:03PM +0000, Ryan Roberts wrote:
>> When page_shift is greater than PAGE_SIZE, __vmap_pages_range_noflush()
> 
> s/PAGE_SIZE/PAGE_SHIFT/
> 
> Otherwise it looks fine.
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks!

