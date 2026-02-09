Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43818E81BDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 15:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+fkPJnR7ejN9zpEP6kqoZSjGLxWQQh7bs9acqyRp1E8=; b=QV1e6zFFZV3psG4vO3BLzdNmKS
	o7LXTqveGgzv8xjsfcSVwwHX6ywfgUMYi2agTnwmRo1x+egD0uEBi7OKaTrgxXTf/SdoMUxBWX7pF
	yEujUOTi/1gS35jrDbtF83JDa21/IyUQo996MGdhWfTiUXqTvxR6RS8P+spGumVj0qAJDfpvSGWgx
	GYssbiz6MMFOgFcDPxCu8kY2/8woscqGDzeoNSYENWo7LYZSx8dozkzatB2KVzB79hMTxdJ9XFFkO
	2VCn9kG9XTOhjVpufBOSZ6qyD3yhUPH5P5b9CzLRxgN6BH6kVOsf2LOuwSZPdou/Z9i5sHoFzwc4r
	MfpHowEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpTIf-0000000FcNN-0Rwa;
	Mon, 09 Feb 2026 15:35:45 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpTIc-0000000FcLu-2WWr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 15:35:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770651340;
	bh=U15/F91JTKEekYShyiR6dUHXzcOCFPKVIlg/bRPTaAI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BZAfX8oeM74obJfB9jbkW5ibDvMSdYszm/4kicoQIfE7r7NQx378ig4ngcSNN7OQF
	 NJaoHq6H56xEzf0KJYHWe8CzU2T7owLlCNGO2zINtknrR81jP7rW2gw8sX9WzqpECc
	 u+gz4Cxq6w38fmMg3/gzFnYCHEeaSgHlWiBedFn0jtw8O5LC2d4LWXOaDskn5VUZ5f
	 ojRlSJL2jT95WK4kG4Ipg3n3eGwBlHX8XRpweiulTl1BLWNA+SYZWMAt1q6sP5oCQx
	 xjdUNiThoYONG4rCZO6J29fEqsqYyprXGK+IJvzvlOTwBcXq9aGAGxsNpMZvc+U0X9
	 82mMJKT+6bLVg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A441117E0699;
	Mon,  9 Feb 2026 16:35:39 +0100 (CET)
Date: Mon, 9 Feb 2026 16:35:34 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Steven Price <steven.price@arm.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Rob
 Clark <robin.clark@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Karunika Choo <karunika.choo@arm.com>, Liviu
 Dudau <liviu@dudau.co.uk>
Subject: Re: [RFC PATCH] iommu/io-pgtable: Add support for Arm Mali v10+
 GPUs page table format
Message-ID: <20260209163534.45b0ec7a@fedora>
In-Reply-To: <aYn7obNImaI72MhK@e142607>
References: <20260209112542.194140-1-liviu.dudau@arm.com>
	<0af5b5f3-912a-4f16-a68b-032617576537@arm.com>
	<aYngwtq_GtBYGjOC@e142607>
	<ac5c3df0-1d94-4a1c-9eec-a359096cfce5@arm.com>
	<aYn7obNImaI72MhK@e142607>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_073542_819184_6E7533A7 
X-CRM114-Status: GOOD (  25.39  )
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

On Mon, 9 Feb 2026 15:22:09 +0000
Liviu Dudau <liviu.dudau@arm.com> wrote:

> > > Ultimately the role of this RFC is to start a discussion and to figure out a path
> > > forward for CSF GPUs where we want now to tighen a bit the formats we support and
> > > add PBHA and in the future we want to add support for v15+ page formats.  
> > 
> > PBHA is definitely an area for discussion. AIUI there are out-of-tree
> > patches floating about for CPU support, but it hasn't been upstreamed. I
> > don't know if any serious attempt has been made to push it upstream, but
> > it's tricky because the architecture basically just says "IMPLEMENTATION
> > DEFINED" which means you are no longer coding to the architecture but a
> > specific implementation - and there's remarkably little documentation
> > about what PBHA is used for in practice.
> > 
> > I haven't looked into the GPU situation with PBHA - again it would be
> > good to have more details on how the bits would be set.  
> 
> I have a patch series that adds support in Panthor to apply some PBHA bits defined
> in the DT based on an ID also defined in the DT and passed along as a VM_BIND parameter
> if you want to play with it. However I have no direct knowledge on which PBHA values
> would make a difference on the supported platforms (RK3xxx for example).

I don't know if that's what it's going be used for, but one very
specific use case I'd like to see this PBHA extension backed by is
"read-zero/write-discard" behavior that's needed for sparse bindings.
Unfortunately, I've not heard on any HW-support for that in older
gens...

