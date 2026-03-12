Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC60106ACF2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 23:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LjcR94bmvH2oOH8ZUWLFU9TNRvfPfrpZ+1MwNkcZH5I=; b=ciG4C6n6jPLrH9SKsL6ewgxz1q
	j1Na0t79s/Sd1u6DHxXSQUk7sxmWwrW+8cYvLZ3ntBI41gVVE13A+6Jn4ZDyRSIA7IG6UGhxP5BoH
	xGm/4gxuo/UiG8+0wlkJLEMSIaSxEQ0lQQBctdxjO5ygY2DtLm4PcSFQCo61E/51c590n4V6ZVyZk
	AbbVLDcKSS9t9mzWEIt5hUEvGaSekY0fDev+Lr6/SFUr/s7AgFSfZTpKyAwuksr6I5ylwmJdyhJqb
	D/ec2nkqPBaBy5TUiej3BdQL6ydIsyHzlqBfj7WrENv3n+pIafnkWHdByP9TjqODqwa9LozIDCdn1
	+JaqjqPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0pFf-0000000FkQS-0YuN;
	Thu, 12 Mar 2026 23:15:35 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0pFY-0000000FkNf-3iHP;
	Thu, 12 Mar 2026 23:15:28 +0000
Message-ID: <4fd15134-ae1e-4233-8d5a-9d1e0b9f94dc@infradead.org>
Date: Thu, 12 Mar 2026 16:15:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/15] mm: add mmap_action_map_kernel_pages[_full]()
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Clemens Ladisch <clemens@ladisch.de>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "K . Y . Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Bodo Stroesser <bostroesser@gmail.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 David Hildenbrand <david@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 Ryan Roberts <ryan.roberts@arm.com>
References: <cover.1773346620.git.ljs@kernel.org>
 <21d8899bb1f4db61203072fb3a56a6c98a61e23d.1773346620.git.ljs@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <21d8899bb1f4db61203072fb3a56a6c98a61e23d.1773346620.git.ljs@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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


On 3/12/26 1:27 PM, Lorenzo Stoakes (Oracle) wrote:

> Finally, we update the VMA tests accordingly to reflect the changes.

IMO we could omit the word "we" 5 times above.
(but no change is required)

> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 88f42faeb377..88ad5649c02d 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h

> +/**
> + * range_is_subset - Is the specified inner range a subset of the outer range?
> + * @outer_start: The start of the outer range.
> + * @outer_end: The exclusive end of the outer range.
> + * @inner_start: The start of the inner range.
> + * @inner_end: The exclusive end of the inner range.
> + *
> + * Returns %true if [inner_start, inner_end) is a subset of [outer_start,

    * Returns:
(for kernel-doc)

> + * outer_end), otherwise %false.
> + */
> +static inline bool range_is_subset(unsigned long outer_start,
> +				   unsigned long outer_end,
> +				   unsigned long inner_start,
> +				   unsigned long inner_end)
> +{
> +	return outer_start <= inner_start && inner_end <= outer_end;
> +}
> +
> +/**
> + * range_in_vma - is the specified [@start, @end) range a subset of the VMA?
> + * @vma: The VMA against which we want to check [@start, @end).
> + * @start: The start of the range we wish to check.
> + * @end: The exclusive end of the range we wish to check.
> + *
> + * Returns %true if [@start, @end) is a subset of [@vma->vm_start,

    * Returns:

> + * @vma->vm_end), %false otherwise.
> + */
>  static inline bool range_in_vma(const struct vm_area_struct *vma,
>  				unsigned long start, unsigned long end)
>  {
> -	return (vma && vma->vm_start <= start && end <= vma->vm_end);
> +	if (!vma)
> +		return false;
> +
> +	return range_is_subset(vma->vm_start, vma->vm_end, start, end);
> +}
> +
> +/**
> + * range_in_vma_desc - is the specified [@start, @end) range a subset of the VMA
> + * described by @desc, a VMA descriptor?
> + * @desc: The VMA descriptor against which we want to check [@start, @end).
> + * @start: The start of the range we wish to check.
> + * @end: The exclusive end of the range we wish to check.
> + *
> + * Returns %true if [@start, @end) is a subset of [@desc->start, @desc->end),

    * Returns:

> + * %false otherwise.
> + */
> +static inline bool range_in_vma_desc(const struct vm_area_desc *desc,
> +				     unsigned long start, unsigned long end)
> +{
> +	if (!desc)
> +		return false;
> +
> +	return range_is_subset(desc->start, desc->end, start, end);
>  }

-- 
~Randy


