Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C813C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 19:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NglHKItE2MnRf7kVBkJpZrmGam+ZtM8lvAR6jGRQjyo=; b=IGmKDTr4CAqEkJowjvKz2t942/
	8LktZDkGzqnwokGR8m8MLYNPP2WF3rxUYa26d1SEIi++V+tv+62oi0n66htROuRcubCluqaXu+oXk
	eD2BoNiB5o+ISe04mawmMuy17Dk4jhWVG6b+pD9dHZUSChoXOdVN6eBqdcngWkZeAEi7HJn2uM7Yk
	8QoE2FP1k82OqXVk2ZSVftAS3X1C//ZkFzHsClbSxZXLT0+M2GN3Cyra0h89D3DhvXLdi7GrchGOP
	uhUnMApY8fzmIprW9/+3JQO3tmHMLBqYBDpGA0fobyJPtTLKyTA2Bp0+lBuxTIcTOIaHQT9z9ditW
	UcfNRmow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUVkK-00000009k3c-04tZ;
	Wed, 25 Jun 2025 19:25:24 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQJm-00000008phZ-1EmH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 13:37:39 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-6f8a87f0c0fso16701106d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 06:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750858656; x=1751463456; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NglHKItE2MnRf7kVBkJpZrmGam+ZtM8lvAR6jGRQjyo=;
        b=M8twuuM1EOJvaOIvWPu7swuuinW0E1rpr1WzOzC+JBdIwc56ta3lhRGUaJWVfJyhkJ
         +CczyhkQUaMQmOkMldmLYrFzy8RSybj4MOwMtADmp4ULoUB4tl94OJX/pt9CEEicPl/y
         TuOCFntD+y9YglDKkadcJRa7k++4lpLCNPsRAUv6VCPNcft7vpLPDk6loDmobCmtXvJ0
         UBCIL6uwe4Kht8WFClgM2zPcdjDgasnW9PGL+CvlvqU7oloMvCzKxBrAPuWhsechKmNN
         4srLmuJ3L7HzeAbNtb5ITcbjB6CEGWmfH98F6uE3QBB5fb7FHycr9YSMTdAGUJ2ogcaY
         cx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750858656; x=1751463456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NglHKItE2MnRf7kVBkJpZrmGam+ZtM8lvAR6jGRQjyo=;
        b=luU8P4qkxw741zPyoOzT4DwHPl/uZX7+0QBsqH8WBfmWuwcheGkqeXUS0w6F7Z/fNM
         fD0PxiUaQZ4gh6G7I/ZIoYVMkLbx688l40y/jHt0BCA5c24sTxiUFfZV9dWQfdSJeBlm
         2Fr4VlAYcdYXrTpzr2UX6CjU4qzxychN9vNevXVLlPDbt4GfhLEFnv7ymLLnXTW9c2bM
         GLzfjR9M8wkrGxligWf5p8rDJoclUH5D9BXv6LnPSMazoGgr/ci58IrhjRkMpYcd3H8u
         KrY9NAtrq+QIa9fSjiX+B0XmhuBLBEM32zgYS2xV8kuSUG5rtUQZb+sXvEz681YT1Xir
         cxeg==
X-Forwarded-Encrypted: i=1; AJvYcCUhyIwXt5fN7omIfjLSYFTiJHZ4xjqwx+h56WV0eBQYWbCp5BAKOccdWT3YN3KzpX9AluN+CiQf4r49GMskKavn@lists.infradead.org
X-Gm-Message-State: AOJu0YzfEsQsAcb5femWCwGIvtoCeimbqyfDwprUwENZfAXSITmCyp7L
	WQGRn8SykeIvBa6D3EEh6sH4vDAUIqFJ2K8ResuGEZlOWxoS2UpsY8jM5o83mWbbCtg=
X-Gm-Gg: ASbGncukrx5czmQg0wQppdUqaICcW1Cc48Jyb7oBDkcAp/OLa+olx7UJhZ3un5wlxVI
	cp+tNXWJ/xK4eyZj9zw32bt4htJ3XPXRUowZxeO69nwfR477IchBHHyReY3lS2pSYzUDdcj4Q8O
	qNXokliZw/ELe1CEc7BKk7OtN18zWZTzn0DNoSx/naTOOAwMO0OhxttWJNbcS7qLKB0B6YJHGvO
	Svk2qQrjkO232uKa1J0iuMR+0LanXDme3cFqRIyOEFWC+lhtm5yMKNSZbe1cdQwlraRfVEHZb9+
	QPiw9sQaQBZGnky4xurS6It1/FZIy9TT+U5IrffA4oBug7TzA6OAZS5yaYmFVGfYxifO8uatnJn
	IYzpHDfgVqO9EES7tNUTkClW2RWlWgEiyBqN8bg==
X-Google-Smtp-Source: AGHT+IHNWTn84Obl4sCOYge34wUPUvuPQlJlnAKQv8tTsnsg8qT0v7mGMowd+Em7yTBlsKIc3f9P2A==
X-Received: by 2002:a05:6214:cc1:b0:6fa:b9e9:e799 with SMTP id 6a1803df08f44-6fd5ef802afmr35290316d6.24.1750858656416;
        Wed, 25 Jun 2025 06:37:36 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd093e167esm68119946d6.18.2025.06.25.06.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 06:37:35 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uUQJj-000000014g9-0Uom;
	Wed, 25 Jun 2025 10:37:35 -0300
Date: Wed, 25 Jun 2025 10:37:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	=?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>,
	yang@os.amperecomputing.com, will@kernel.org,
	jean-philippe@linaro.org, robin.murphy@arm.com, joro@8bytes.org,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	james.morse@arm.com, broonie@kernel.org, ardb@kernel.org,
	baohua@kernel.org, suzuki.poulose@arm.com, david@redhat.com,
	nicolinc@nvidia.com, jsnitsel@redhat.com, mshavit@google.com,
	kevin.tian@intel.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH v7 4/4] arm64/mm: Elide tlbi in contpte_convert() under
 BBML2
Message-ID: <20250625133735.GB213144@ziepe.ca>
References: <20250617095104.6772-1-miko.lenczewski@arm.com>
 <20250617095104.6772-5-miko.lenczewski@arm.com>
 <aFRlDSZ2PPnHixjc@arm.com>
 <7105112f-b0bb-4191-b3c9-93522162319c@arm.com>
 <636c8901-6e05-479f-ae06-ee391d4d36e8@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <636c8901-6e05-479f-ae06-ee391d4d36e8@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_063738_396036_478604D8 
X-CRM114-Status: GOOD (  25.22  )
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

On Wed, Jun 25, 2025 at 02:07:23PM +0100, Ryan Roberts wrote:
> I think what you are saying is that despite going via invalid, the HW may see
> this direct transition:
> 
> +----+----+----+----+
> |RO,n|RO,n|RO,n|RW,n|
> +----+----+----+----+
> to:
> +----+----+----+----+
> |RO,c|RO,c|RO,c|RO,c|
> +----+----+----+----+
> 
> There are 2 logical operations here. The first is changing the permissions of
> the last entry. The second is changing the size of the entry.
> 
> As I understand it, it's permissible in the architecture to update the
> permissions of the a PTE without break-before-make and without issuing a tlbi
> afterwards; in that case the HW may apply either the old permissions or the new
> permissions up until a future tlbi (after which the new permissions are
> guarranteed). That's the first logical operation.
> 
> The second logical operation is permitted by FEAT_BBM level 2.
> 
> So both logical operations are permitted and the Arm ARM doesn't mention any
> requirement to "separate" these operations with a tlbi or anything else, as far
> as I can see.
> 
> So I would interpret that combining these 2 in the way we have should be safe.
> RNGLXZ and RJQQTC give further insight into the spirit of the spec. But I agree
> this isn't spelled out super clearly.
> 
> Perhaps we can move forwards based on this understanding, and I will seek some
> clarifying words to be added to the Arm ARM?

FWIW this matches my understanding as well.

AFAIK the actual physical issue for BBM < 2 is the TLB lookup HW
cannot tolerate having two entries that overlap in address because of
different sizes. Every lookup must return exactly one result. If more
results are returned the HW fails in some way.

For BBM 2 if the HW lookup gets more than one result the HW selects
one unpredictably and uses that.

Permissions shouldn't have any impact because they do not effect how
the lookup is performed, they are the result of the lookup.

I've been looking at implementing BBM 2 support on the iommu side and
I didn't see anything that said we cannot do arbitary transformations
under BBM 2? For instance when degrading from a contiguous range of
block descriptors down to single page descriptors I'm expecting to go
like:
    16x2M -> 2M -> 4k -> FLUSH

Jason

