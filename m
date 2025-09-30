Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13031CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 18:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LA1zHS4ppZRh5M6cwwSBzWIxCMB5psoEo4mhhfJ1HxM=; b=ybjMYAxxvIOeFtFEGgDUn4nzvz
	7vYmZnBpoiCvyLog5ikf59fqFroa5knbBkLgA0qcu5l+lk/X9+OmmWi2+1G1kww8hdGx1BeoWLTCg
	r9jv/KNgqAy5MQVTX9muV1utvCdpmwPmY7J9kfRFoZocBFmSealv/dx5e/Q+cCAFlaXknGBo9D6qJ
	Fd1VVpZqwinODlzmOto2+3Lphvv3JCvL06hzS7inVs5eb4XdGC5n2sxjMyrfk6xi4sjFnYnM0axzT
	ZPvumVYsKDTTTGLPwxIv53rt6N1UiZzDeQexkMg4bs3AQUg8wCPJVcF/YX5UYRJOSk6RnusW2lD+w
	53IoTnSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3fJk-00000005zay-3tKR;
	Tue, 30 Sep 2025 18:43:16 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3fJi-00000005zaA-2ORZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 18:43:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1759257792;
	bh=LA1zHS4ppZRh5M6cwwSBzWIxCMB5psoEo4mhhfJ1HxM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fXL9i6lG8VWMAVmrXoaaX5p50VgGLRcXQoH4aAYQfRNXTYY+nt2g0u3Ak4P0aqcBj
	 ob8dpqIxXUZk7H0BciB5FbB6J+cUcBagNxkztKMJOSh1y2P5Ye9yiQsPAQKTu17I8J
	 ls4aot+054QGye8fUmxcqCd7tiXRHgN9iUJu35Sw=
Received: by gentwo.org (Postfix, from userid 1003)
	id 6CCDD402AD; Tue, 30 Sep 2025 11:43:12 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 6AEE04028E;
	Tue, 30 Sep 2025 11:43:12 -0700 (PDT)
Date: Tue, 30 Sep 2025 11:43:12 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Yang Shi <yang@os.amperecomputing.com>
cc: Dev Jain <dev.jain@arm.com>, muchun.song@linux.dev, osalvador@suse.de, 
    david@redhat.com, akpm@linux-foundation.org, catalin.marinas@arm.com, 
    will@kernel.org, anshuman.khandual@arm.com, carl@os.amperecomputing.com, 
    linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [v2 PATCH] mm: hugetlb: avoid soft lockup when mprotect to large
 memory area
In-Reply-To: <6cde8290-3aa2-411c-bf29-eb91a99e33a5@os.amperecomputing.com>
Message-ID: <ef139940-5627-13a3-747a-b030b11e7544@gentwo.org>
References: <20250929202402.1663290-1-yang@os.amperecomputing.com> <cc40d827-3b98-4e15-ad45-5c2033e4ce20@arm.com> <6cde8290-3aa2-411c-bf29-eb91a99e33a5@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_114314_658660_04A9CE87 
X-CRM114-Status: GOOD (  14.41  )
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

On Tue, 30 Sep 2025, Yang Shi wrote:

> > Does it make sense to also do cond_resched() in the huge_pmd_unshare()
> > branch?
> > That also amounts to clearing a page. And I can see for example,
> > zap_huge_pmd()
> > and change_huge_pmd() consume a cond_resched().
>
> Thanks for raising this. I did think about it. But I didn't convince myself
> because shared pmd should be not that common IMHO (If I'm wrong, please feel
> free to correct me). At least PMD can't be shared if the memory is tagged
> IIRC. So I'd like to keep the patch minimal for now and defer adding
> cond_resched() until it is hit by some real life workload.

It would be good to send out a second path that covers the other cases
for discussion.


