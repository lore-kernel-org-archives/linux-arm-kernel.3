Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DFFC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 23:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/TaCDQD9gujPzgIz+tQm/iK3rlI3gN/6gBVv4SmlB8g=; b=T+X+C/HiglfoTztFRe9VwruJcO
	kxb+LjVKztIMU5vI/LGq16K6ollu53KQJPkpsyUFYhmq4ciYdTTNSedBDN3N/I/oVDIbGeGBhiwo8
	MmXZ9nV490KHiXz9xsSZVumZ7YVX63aTEGZfs/i19XJPD8AA+gUSv+hNFPzkwUKib/uyuK8KRa7ie
	gCLEmlI0z5HiYZdR8OxNVxvgoOqZmXc8PhvgbHQlPyMAWIbj+KIXGYx69Kmg8mop5BbY136rCejL6
	+HUPGpRFgIvfdaEqjQESO5p2utV6+c7aktdulWzKT9BmLUalDlju1nrYRAMvyPEwPcTzoSfF7JUxW
	GUKyFTgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u31gh-0000000C5av-0zm0;
	Thu, 10 Apr 2025 23:52:03 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u31et-0000000C5Rn-0Zxo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 23:50:12 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7c0e135e953so155624885a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 16:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1744329010; x=1744933810; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/TaCDQD9gujPzgIz+tQm/iK3rlI3gN/6gBVv4SmlB8g=;
        b=h91xJ8yGc5sbgo4TKBeG47lZ204dMIu556t4KTLJPT1Q82FWFtZz3oFpHOWTHl8CJw
         /3siwC8wj5bwf8luZh3aXTse+R3UBwnFy2cbKfYEq1CJj6oHKAToH8XkgRY19tqFgWEu
         uTJZGPgnl/Wnm9Kf/QxIeih1Yrq03okntSt7j5wseYivgX2CU4EgApLudXw02HzeXncB
         hrRKzGuBWgj1I5VbQS0AL7Z3Yd6rAks7T/aK03eldgTBYQoARuvHoD3LcrnLDqo3j0ph
         26yE4Tao5DJD//MCSlVd5cDZUjRlNq54x8F6pzr5q4joOHZLoPec1hxN3MxF2e2ri9mJ
         DXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744329010; x=1744933810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/TaCDQD9gujPzgIz+tQm/iK3rlI3gN/6gBVv4SmlB8g=;
        b=BMAiqkCV+9HH5YY3HajKHkH+iVVW+eMgpKTtlC/JocYYE0rIAltbfKwPL7rlPjB9rj
         OUpbPY8qA6REGdK6gubgR0IHdi0SyHqZT+INw3nT2CEirMOpNOJk/gFyaraVv2624q3g
         wXqIVBX33IdVDgJuXhajbtFxBfTUt2Av7HNwO+SHjsSbLwVl4n2nCwKUmBZZXkWfyVb+
         KUftmTOvEVGQgWCtVu0l+vUqRovglz4rt6Am1EfrmubcPl4Ksu4T42b+gNGhOdKntBOx
         jtSVkYWfHwS108og9X6pT+jOE6gJxIXdB3Edprb3OLOo1thEn0Lh0zGD1JInd57YKISO
         ZsOg==
X-Forwarded-Encrypted: i=1; AJvYcCW7tIJmD0C9Kj7EknqQZCJyfcMJVcolhc09I41yTTRQ4IIG1+21T8mnlURqaCWr2G2bi9i31vvl8kjgQokfzAMp@lists.infradead.org
X-Gm-Message-State: AOJu0YxLZ5rTSKTiPYJHdETT2PLkZoWKcYPCxQKnA8NOrxyFQl0c0XpD
	54KFALIk4Md9ckkdYR9Fnua/9gWfuKeQgbcqlSL8tKVyuX6P1wsskrefXnH6EfA=
X-Gm-Gg: ASbGncuHpZm78j+5osYxJgM9daB9EZNbVYbKlIMVdAj62HAYZddhli0gY9xGSe1P37I
	BQpJoFX8NRvy4Di1Ix4I6/WK2yjOrHLlhvkoQHBQ4pbQ6sMpdoNjb78jYCImRzxT0ud5XEA7eze
	HbBWRMduK95BbGrcU3PCDNaaifMNj89/f+CsVYulijoCI4owS52+1eny6SRQz3Bh+3ttbBxcTaV
	6/Axz4YRNnnRnuNDAM3iLSOg5AVI+EBysSJXxlUPlmYnZbzb7rsv4yUsaq4CTdJQsR05EwIhFek
	lE+ychrp6CDjgsOilMAOFGttGVkjQklgdvFsuG2Wi8U5qBLN6eFo1IeittWyAdV/3uELbNpv2Hk
	iHIpCHp/l0OFpkI8eC4A=
X-Google-Smtp-Source: AGHT+IGBLI6Qr1HBGp7OT4pcrwS60eByYVaVonZGYRx+m25dpRuIj9JKldOpH5t3hWR9bGfwXIeN2g==
X-Received: by 2002:a05:620a:c4a:b0:7c5:18bb:f8b8 with SMTP id af79cd13be357-7c7af0bd257mr150080685a.1.1744329009833;
        Thu, 10 Apr 2025 16:50:09 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a89f9639sm169568385a.78.2025.04.10.16.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 16:50:09 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u31eq-00000000N6G-3QH5;
	Thu, 10 Apr 2025 20:50:08 -0300
Date: Thu, 10 Apr 2025 20:50:08 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Roman Kisel <romank@linux.microsoft.com>,
	Robin Murphy <robin.murphy@arm.com>, aleksander.lobakin@intel.com,
	andriy.shevchenko@linux.intel.com, arnd@arndb.de, bp@alien8.de,
	catalin.marinas@arm.com, corbet@lwn.net, dakr@kernel.org,
	dave.hansen@linux.intel.com, decui@microsoft.com,
	gregkh@linuxfoundation.org, haiyangz@microsoft.com, hch@lst.de,
	hpa@zytor.com, James.Bottomley@hansenpartnership.com,
	Jonathan.Cameron@huawei.com, kys@microsoft.com, leon@kernel.org,
	lukas@wunner.de, luto@kernel.org, m.szyprowski@samsung.com,
	martin.petersen@oracle.com, mingo@redhat.com, peterz@infradead.org,
	quic_zijuhu@quicinc.com, tglx@linutronix.de, wei.liu@kernel.org,
	will@kernel.org, iommu@lists.linux.dev, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org, x86@kernel.org, apais@microsoft.com,
	benhill@microsoft.com, bperkins@microsoft.com,
	sunilmut@microsoft.com, Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH hyperv-next 5/6] arch, drivers: Add device struct
 bitfield to not bounce-buffer
Message-ID: <20250410235008.GC63245@ziepe.ca>
References: <20250409000835.285105-1-romank@linux.microsoft.com>
 <20250409000835.285105-6-romank@linux.microsoft.com>
 <0eb87302-fae8-4708-aaf8-d16e836e727f@arm.com>
 <0ab2849a-5c03-4a8c-891e-3cb89b20b0e4@linux.microsoft.com>
 <67f703099f124_71fe2949e@dwillia2-xfh.jf.intel.com.notmuch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67f703099f124_71fe2949e@dwillia2-xfh.jf.intel.com.notmuch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_165011_178793_5B24F3DE 
X-CRM114-Status: GOOD (  13.40  )
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

On Wed, Apr 09, 2025 at 04:30:17PM -0700, Dan Williams wrote:

> Like Christoph said, a driver really has no business opting itself into
> different DMA addressing domains. For TDISP we are also being careful to
> make sure that flipping a device from shared to private is a suitably
> violent event. This is because the Linux DMA layer does not have a
> concept of allowing a device to have mappings from two different
> addressing domains simultaneously.

And this is a very important point, several of the architectures have
two completely independent iommu tables, and maybe even completely
different IOMMU instances for trusted and non-trusted DMA traffic.

I expect configurations where trusted traffic is translated through
the vIOMMU while non-trusted traffic is locked to an identity
translation.

There are more issue here than just swiotlb :\

> A "private_capable" flag might also make sense, but that is really a
> property of a bus that need not be carried necessarily in 'struct
> device'.

However it works, it should be done before the driver is probed and
remain stable for the duration of the driver attachment. From the
iommu side the correct iommu domain, on the correct IOMMU instance to
handle the expected traffic should be setup as the DMA API's iommu
domain.

Jason

