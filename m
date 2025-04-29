Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D86C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 12:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wQwVdhGc8RVLmHm5c3vmlOp5OAvwkuVbhR+V+Jg2Z1U=; b=kBZYb2sB3GxtVXxcIgCbhRVnzV
	68IDP9ZeVpklVMY0t4qlsNLlNvY/Xfiq4e5oFKf5Apx26LijRI7wv13tFO1cUPaT2sLV9chU+3FBo
	BESmQLLOlhAIMh0wDsika+fyt6vFVXSxFCqUuTwBphP9VUTFgtLu9+sxyvdZSupxqbfQDG1SQfelw
	MFYPHQ8usKvomqTTvMa2XQFWo3zUWG54rb8D3Z9mb0RVAMHXEHRAruUiToY6NF1yQSZvk2nQbj0mq
	+PopW49lwZsyDS8g2yG9M4V4R252jjzAX/a/GNFvE65EU03xwOTEl0NWJOvV/T69jQZ+Zrf2jVQ65
	X+XLyIbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9k6j-00000009ebG-2dap;
	Tue, 29 Apr 2025 12:30:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9k4o-00000009eGs-01WV
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Apr 2025 12:28:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wQwVdhGc8RVLmHm5c3vmlOp5OAvwkuVbhR+V+Jg2Z1U=; b=A7q3bvBKIhjdC7/xX+4SRr0IfQ
	CCwbcXTdNKB71WSB7PBpNswgojPmuRRVwaRXdxqVkQNYArLqaWH8yZZPvSOOUlQ+r4UsW+2bSdJQe
	g4+whjUJQmT25ABXV+7/0i3vuxpiO2nNi4vLQGbYPHB+e2wYVHxslHN7oFva04Tht1MJTgtAV9MuX
	G1Sk4ACjLom7uCpk5PgZYZIpzVuDWnTXUnFSNwcI0DvQ5kEmARcrI8P7i4cif/MFh0Q6QCOyX+kPM
	OifgXWJ9vJhT5pRNY3b97xMbwn1YW5Loa1lKNOx1owO63hlCKIL+vowbms/zDVKcZyVPX3dzpOp4Q
	j9rK5zUg==;
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9k4k-0000000DKVW-36lq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 12:28:40 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7c5aecec8f3so1059392885a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 05:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1745929715; x=1746534515; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wQwVdhGc8RVLmHm5c3vmlOp5OAvwkuVbhR+V+Jg2Z1U=;
        b=HeB6KWOl40mfY3XcHp/IuyKpBzdt7a5GV1w6pdInxhCTT6Qfi5YxZKDwVvFI95W97T
         kmYBv5TWTcuoYGgY0d7EBwFVQQQjUnYUqvB9kIAySsczmhpq+uPiffV00bll0Uok5fLi
         r9O6tau1exOhuXJm7rwTs3Yej+iNF9LJoib883DYbitg1/nExUh87g6SeFFBdQIG+lB1
         uh5EjXkG5aikF9iW3tGDQj68A/X2IJUIrHJJMDlObGdhmG+PO5ABPuy5844bOmY+7faC
         Z7xWQADazUpUI53z1D3OUsRTnwqoAlMc6xshvZy2FFK5DZoQMu9KEkbZBcLua5yg3WSp
         eKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745929715; x=1746534515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQwVdhGc8RVLmHm5c3vmlOp5OAvwkuVbhR+V+Jg2Z1U=;
        b=j5SXMdIBnD0yWP6XIVGRToJkHJWQqF8BqgKvU6+PS/GB2PRIoG7WkuMnE9eUblKuLk
         RRyKYvfd4kNUyz25FR8xFS48DdTXSx+vWzZuYy2AQF/2tTpxVB7tyLJlzvup8t8p0jNu
         IDzlYTbOBKV65uZWC1czkHACOyPzGTKQaM1hXNiNTN8+Pjr4y8CLBYelxtju90SAGkq2
         OtcZzULhufqEzWu2GedveZgUebUtCp6C0b7A2WcC1ApR62n/j0afuPYmizJqJPcZDVHt
         jNBUxcRZ3HhNNOyNpZrHP9Rw0q6GwhtR0wxMsrf2ZjyB9H9nF0G+6HcpW33EJ8m/hZ4J
         9KFg==
X-Forwarded-Encrypted: i=1; AJvYcCXms7ZN5Be/xbu+iG1qbRK6gPowayVGdbTTdqcmmoTJthuhdaq5EYYHKV+EA1qwHR/y0A5tDyUZj1V4aZPDNhaY@lists.infradead.org
X-Gm-Message-State: AOJu0YxwpRz5dQAUOzj3s5bPIolMXjrO9/v61Ou1EhxOla9qLKwj3sG7
	3fYoVIA/7vld/B0okny4I0eBG3z17FGLIUUMiy+9OFxGvclGs/b448mEPQGtTxrRHE1dDizxZ2Y
	n
X-Gm-Gg: ASbGncsvzLp/fBva7yAEWW2mDnCXC729H2gvmGYbIdn/pt1BBQCdWWuc6W3QDnkc5MT
	b5YyEjDpS8SvfWckKip37/jBK0AHdhcVxffTyO1zAmONsyI8AJAYchMsY0DDjqoYKC/PZD/Ms5E
	lkbEtMwxOIGQY3TN648nKZQi6zHdNUUMyYQMxPYFaW4E0+Kmx6BKcEaQaVI/2+YobZErEvwefP2
	XRqoUawFJhUa4R7tQz7SW0csG+WcdAPvrqwmzNPO1bwpGOHac7yTWQSztn2aILtvtZn54GAIPWY
	GE1Dbvl9ORp4cSs9jFdX9WEO2TSuCnOfxjYNtU0vX9P+KnocG40pfNXkKMbAq0MnRqfas/9FHED
	94QGMCeSOic+o/Up1avc=
X-Google-Smtp-Source: AGHT+IFMhbf9NGzyK/N2zlhF/+Cuicwqh6Ml7VdJKCsWNEjD0dprXI5tx5siEqKxqV9DQ7d+ym50CQ==
X-Received: by 2002:a05:620a:1a12:b0:7c5:3e89:c6df with SMTP id af79cd13be357-7c9668496famr2024432685a.12.1745929715358;
        Tue, 29 Apr 2025 05:28:35 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958cbd048sm729195085a.43.2025.04.29.05.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 05:28:34 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u9k4g-0000000A4bg-179H;
	Tue, 29 Apr 2025 09:28:34 -0300
Date: Tue, 29 Apr 2025 09:28:34 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	"open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 03/33] iommu/io-pgtable-arm: Add quirk to quiet
 WARN_ON()
Message-ID: <20250429122834.GA2260621@ziepe.ca>
References: <20250428205619.227835-1-robdclark@gmail.com>
 <20250428205619.227835-4-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428205619.227835-4-robdclark@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_132839_145631_CC791D08 
X-CRM114-Status: GOOD (  14.17  )
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

On Mon, Apr 28, 2025 at 01:54:10PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> In situations where mapping/unmapping squence can be controlled by
> userspace, attempting to map over a region that has not yet been
> unmapped is an error.  But not something that should spam dmesg.

I think if you want to do something like that using the iommu API the
expectation is for the caller to do a iova_to_phys to check what is
mapped first? That seems kind of lame..

Maybe page table driver should not not be doing these WARNs at all. If
we want to check for that the core iommu code should have the WARN_ON?

eg iommufd already has a WARN_ON around iommu_unmap failures so having
one in the ARM page table is a double WARN.

Don't really like using a quirk to change the API contract.

Jason

