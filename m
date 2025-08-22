Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F128CCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 07:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYwcfR40TeWsfT3bxGe5ccvVRM+x9ilYYyOeQE763K8=; b=NH9x/O/vya9pKSRCx5lTdhNvlC
	oeFZktbeeT0zHacCtnO+sEbGuHbTqH+alHoJaVpPQMcbKClyIZ7TsB06bV/ju4/3n9BETjdZgjMcR
	1QVDPKNkoH1IpPZluXnpIahfkVTwbd3a/cDM3LnzLerfFQW8eYi5k10SwbKxV3v3MCVHKBWpp8e8u
	sJQNPDYUSnp9eZ8G8zJrbc45h1MN30j7J3g9XwmCG/rJDuAbWMnAMg9kAoJbDde1Aa2igs1w2ldYO
	JrNJDsuaX5bcSBAgkVQGupBnvkNldDzDo9tdo+h+ZX9eSyZGWWVvEQA+5AUM9Ox4DI+epvS6Q2TSE
	YWwVJLyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upMS4-00000001qYv-2D2C;
	Fri, 22 Aug 2025 07:44:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upH4D-00000001CQZ-0D7u;
	Fri, 22 Aug 2025 01:59:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TYwcfR40TeWsfT3bxGe5ccvVRM+x9ilYYyOeQE763K8=; b=jQMvrrk8oa/S9bIuu/2SwkZ2J+
	iZM44VpAwl+e05hZoJK0EL5RP9FSeKyevfp+tfOZ1CzIxUDqo20uJ79KBvLyqpkAXpNgxqzw5At6h
	m4Ip/9LhuY4vWd5HRYztCfz/UicQXVHmjxovc1Ffvit9zxJTBF/qSYhLPAfscTwAQi6jm3kX3wRAx
	0JgbiWUSiWVbJEZqY95MSUFwIOTGqYtGNxf/OcA+a3RxUr67Jc/TaFlHBZsURXV7OjfNXDUL8wKFy
	y/+fS1B6WwIkEYWbXiVQpbrhIT3L/cPfU0NnW2taQu2eyygq2jmuJi2NSy/npx3/RKAak7jEetruh
	fuGDYNdw==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upH44-00000000k6w-1dPq;
	Fri, 22 Aug 2025 01:59:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BB83A5C6103;
	Fri, 22 Aug 2025 01:59:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0940C4CEEB;
	Fri, 22 Aug 2025 01:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755827964;
	bh=hEGBgFk9rer7lwQXMpzjj4FPsIa17LEhE/UyLSIHv80=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fwCb0/jzIQkNPwEVBU6dtHyOVey66bf/HcR/iNP6aS0AhxrgrvMe34HD6vjnkGUZf
	 z1O8tLkMNZpr+UzcBZV9dLBbBCwOaf+NQwl5ntySvGabL1KCpUaRFv+wfDydW+poVi
	 X5XvF2zmqSX16ZKS+hqRP+DFJCxEdKcM7wYo6L7tOqHJI3XrYsnweALvOp8+KSqJnD
	 2bWhxr7953gGHvjXyBJUoUfk/Lgb2omKSw1C8cEO/Qv3yAqSEKl2XaKQVhYluUWO/h
	 UsLkNxPauxpS9RjmwleNolFzOVx4bdRBpqA+ZD7ACyej3l0Oe7T142W2dhwsBnQaC9
	 DSd2Q1+ARL+Zw==
Message-ID: <3812ed9e-2a47-4c1c-bd69-f37768e62ad3@kernel.org>
Date: Fri, 22 Aug 2025 10:59:15 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 24/35] ata: libata-eh: drop nth_page() usage within SG
 entry
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: Niklas Cassel <cassel@kernel.org>, Alexander Potapenko
 <glider@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Tejun Heo <tj@kernel.org>, virtualization@lists.linux.dev,
 Vlastimil Babka <vbabka@suse.cz>, wireguard@lists.zx2c4.com, x86@kernel.org,
 Zi Yan <ziy@nvidia.com>
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-25-david@redhat.com>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20250821200701.1329277-25-david@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_025939_214223_B5082CB5 
X-CRM114-Status: GOOD (  15.94  )
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

On 8/22/25 05:06, David Hildenbrand wrote:
> It's no longer required to use nth_page() when iterating pages within a
> single SG entry, so let's drop the nth_page() usage.
> 
> Cc: Damien Le Moal <dlemoal@kernel.org>
> Cc: Niklas Cassel <cassel@kernel.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/ata/libata-sff.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/ata/libata-sff.c b/drivers/ata/libata-sff.c
> index 7fc407255eb46..9f5d0f9f6d686 100644
> --- a/drivers/ata/libata-sff.c
> +++ b/drivers/ata/libata-sff.c
> @@ -614,7 +614,7 @@ static void ata_pio_sector(struct ata_queued_cmd *qc)
>  	offset = qc->cursg->offset + qc->cursg_ofs;
>  
>  	/* get the current page and offset */
> -	page = nth_page(page, (offset >> PAGE_SHIFT));
> +	page += offset / PAGE_SHIFT;

Shouldn't this be "offset >> PAGE_SHIFT" ?

>  	offset %= PAGE_SIZE;
>  
>  	/* don't overrun current sg */
> @@ -631,7 +631,7 @@ static void ata_pio_sector(struct ata_queued_cmd *qc)
>  		unsigned int split_len = PAGE_SIZE - offset;
>  
>  		ata_pio_xfer(qc, page, offset, split_len);
> -		ata_pio_xfer(qc, nth_page(page, 1), 0, count - split_len);
> +		ata_pio_xfer(qc, page + 1, 0, count - split_len);
>  	} else {
>  		ata_pio_xfer(qc, page, offset, count);
>  	}
> @@ -751,7 +751,7 @@ static int __atapi_pio_bytes(struct ata_queued_cmd *qc, unsigned int bytes)
>  	offset = sg->offset + qc->cursg_ofs;
>  
>  	/* get the current page and offset */
> -	page = nth_page(page, (offset >> PAGE_SHIFT));
> +	page += offset / PAGE_SIZE;

Same here, though this seems correct too.

>  	offset %= PAGE_SIZE;
>  
>  	/* don't overrun current sg */


-- 
Damien Le Moal
Western Digital Research

