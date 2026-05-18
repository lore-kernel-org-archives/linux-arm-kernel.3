Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67470CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 17:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tTAesT9aCvHqy1aw1UCt0dGkyXqlxaqbXlnX4/OKvGA=; b=UNzweugS9lPx2bvGMjjbtUyhaR
	MvXpZYnG5Tvs1fRyB+78kiL0giPi4L4QHoqToq2X0ko3ujHnLVGVVITIo8N7lcUe7LJ4ayn1nnhKO
	0B9O8kYswoZ1qKgnLTYWxEa2hUXut6od+WgT+dN7L/okcL+TBTa0XXQL0hxoaH5INcYhL3dNa2EQi
	8iZMHNfad53JuXvbHsfT+XZE9UEop5lvtU+DmjuF5bcsKo57HqaDy5+CJee4RN2G5/krKr9LsuQmm
	Yo38zfb3z6//GSqK/LjdROTVXgQ/RxEboo6x+8hg9XsnRyKoQlNrpS1vBDQuaQxlcjivpp6Pco6UN
	C2aoHkzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2Ar-0000000GRlL-25aI;
	Mon, 18 May 2026 17:54:41 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2Ao-0000000GRkk-3xDg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 17:54:40 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-8acb09ddbf6so52800286d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 10:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1779126878; x=1779731678; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tTAesT9aCvHqy1aw1UCt0dGkyXqlxaqbXlnX4/OKvGA=;
        b=FmVqU8qTwxxTLXLCztrLR2Fengzu4io1l7edkeisf2CpkfLfPvlMcoYBurhohLRKFE
         hDR3zVu45vItYDvFtIvhFsg5kUw2KukuzEQVHsmP8ivkmRNjzPlmNCA4KSuWS3XjEyKU
         b84EB0LZU0JwSRYcOv502qeSBMGGoa8tV46CycMHr6cv+EeX61+yjgh9EvZhend3IyOz
         KWDdgVAftGHttviPB4hV6M+O/h8BWLtmkfuQZyOMa2/nokNUzf1oWTId7VKET+u4P19L
         3TOC0rt+HUYgI7nb1GftX9r9ryZLaBf5v+heyFcBR5Q5+gkpq/yXNOieluaP5j3yAG1N
         wKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779126878; x=1779731678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tTAesT9aCvHqy1aw1UCt0dGkyXqlxaqbXlnX4/OKvGA=;
        b=cqj9lyxUyBdetphq9VfQBt1RPGP2c9rGz2YT+tPiADCXniTg8OtBkn3YQB4iA29mgH
         71ftDT6M2L3n6oPHGXGcg12/4dqTqOwJnpKXPruJshko3mb+fGgEiAPUYEO6qgDmfNF0
         oMw0fi2XWsRoVCYQzwMvPLJNtV+/azOLB4gGvYGrJwTPbNFYjMBrwvHUnZwnlLHPHMS3
         XZdpz79ir3pZ7OXV/2VVO/XnIRd+/hRoTNqnZb9Idd35id9K7tS3KZwbC2oTI/6tuTQr
         paaOGhIZK4B4IyQD3bTrdVrpkijOVMsCyaqWu8ZIN4WTHKPI8qKB6zQZFZijEpkqDKOu
         f9Gw==
X-Forwarded-Encrypted: i=1; AFNElJ8tZPpYZkmpLF8mUEv7TjyMt6OnHfnSe9aqcesKQe+EXSocstglEi2Ik7oBEJzCs8ONcsH9fsKMXFeS7LXLKRKg@lists.infradead.org
X-Gm-Message-State: AOJu0YwHy7d6p2Sq/G+ZVgP/PvaWNUAEK+ZPgH6/5DwsTPqoAXX9zIF9
	VwXmPJSBqwW/oKS1tS4Hl8e0B6nYF/h0zMuPP1NE6gHykEYqQs5AdJMCscixnBtxAf8=
X-Gm-Gg: Acq92OFwAU/f73IlqlFzUEfxOMvVQdyOxa8IGltvZQm2y7L8Rqay9gwQUJ96ItKdsM+
	BKGQeaOg6od43r0/h2egl7cClAeGUu3WcRJigyXskc6X8YPBQ/MkpSx+CdhckOS6rTrQBdcG3pn
	Hh7pYwXEoUMY28ExTxtSr9v2av0pDMgNoK3mZmfxRCE1nRc3nKThsfwfPJsDPPBu2wZoF6dcJ0W
	nLyULwlmXdMUQRqoqDcsqmXG6wcxmun51nU1SeSAh95SxH6wizvyCE74EMk/gxqJnW/Bmtp/+Nj
	96GmOfql2SiUPDU8kAWa+nTX2zpsO3Nq6FnB74QERDQXtzaYd2AmL0aN7Qbz8Ae9Fn3Zgnm47Cr
	LJyCPEeRa4DAfU1CRrxEycOhyKksWXwwGi/YOAOumBKQvIAhvt5yIjAMDy+oyZt/uuIAyIueBUp
	CeVfFti0sAdxJgd2/ARe9LRd1e+2HYUos3dvVKslz/SPU596HGOPbYM3StWv+VrNOdNkRQFGUHK
	MCGbGZUvLHKnrjq
X-Received: by 2002:a05:6214:2684:b0:8ca:1cee:7c58 with SMTP id 6a1803df08f44-8ca1cee93a8mr226863386d6.19.1779126877680;
        Mon, 18 May 2026 10:54:37 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ca361aabe0sm63112726d6.44.2026.05.18.10.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 10:54:36 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wP2Am-0000000DUxu-0CPW;
	Mon, 18 May 2026 14:54:36 -0300
Date: Mon, 18 May 2026 14:54:36 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: "Oguz, Yigit" <yigitogu@amazon.de>, "joro@8bytes.org" <joro@8bytes.org>,
	"will@kernel.org" <will@kernel.org>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] iommu: Add PCI vendor:device ID to IOMMU fault logs
Message-ID: <20260518175436.GT7702@ziepe.ca>
References: <C1C278E8-E5F6-4701-9127-DCDBC64636E1@amazon.de>
 <4cbd2bd2-9acc-4c72-a4f5-6c6cf31f71e1@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cbd2bd2-9acc-4c72-a4f5-6c6cf31f71e1@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_105438_986340_58A15E21 
X-CRM114-Status: GOOD (  11.30  )
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

On Mon, May 18, 2026 at 04:52:57PM +0100, Robin Murphy wrote:

> TBH I think the more appropriate solution would be to have vfio-pci register
> its own fault handler, wherein it can properly deal with rate-limiting
> and/or entirely suppressing fault reports from misbehaving userspace, and if
> and when it does want to log something it is then free to do that in
> whatever format it wants, independent of the underlying IOMMU driver.

+1

Jason

