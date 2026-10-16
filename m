Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DB6CCF2C0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 18:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oCOssGC3fJ3o3ujxU/0UoaTklTa5OtsoPRrPROKWjDk=; b=b+Cjqywgv+xyslIDl0l8SagOct
	H5jIBRLwdA6kr/XmQEL5f/Bv9vt5UhfjuH9feYE+Xw4i8yLMxnz6kbj9KA1iXqQV6DSy0r0MuKKVI
	XCazB+OlDnwNBCwZfOz8GjNS+lPXGR5Y/1WJsOOq+TNEaSzH3hPHIo1K9IzJRsVADZHCbNKk7IqeK
	gE3TIfyWyZxjlxowVGkLiFBfh0sSxZSc4xkNVD4/Vt/rtCdiOOMbTqik6jTHG9zuQKmkvvXIErS2/
	R6IhX/WOIDW3LV2oLZVOV5Y/hESodjADeyalC1CnSSnucOwxKVIJZqIrxSLu2M80MsFhsUbCtht7K
	fw6eK+pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmGt-00000003cJj-1avL;
	Fri, 16 Oct 2026 18:03:11 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmGq-00000003cJ1-2ydD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 18:03:10 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-5363316fa0cso1724631cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 11:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792173787; x=1792778587; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oCOssGC3fJ3o3ujxU/0UoaTklTa5OtsoPRrPROKWjDk=;
        b=b9E+Ibvoiu4pD4Qz/CF8gDZYB5OiGEg7k0GGd6A8zs13twE4MdP8iuMuq2tGlaW82u
         dAp4qEALwh9scf7SmqP/dem8oT2s0qf0ItfF4NIXF2VqbJnXc/B7RCRmUbOZFjuXxk9L
         iD7eJ+it70d+1zjRtIFe31rfgWAXkgQpCye4FHG8MwacRUFh33zCLq1hG6zQG35cU0VG
         blNZk1Z/OqOFtWt5DLVPWLyLySwdGXB/RWe9o1ajr1spDpdrMOwxEtL/QMXNkYAfBw9Y
         mYxEI/0pOCJfv6F35nmH2JX7UDI+2qgWtEN6ijy+ZqaVROEh/VjfO53+nuHTvhzCey6r
         ix6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792173787; x=1792778587;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oCOssGC3fJ3o3ujxU/0UoaTklTa5OtsoPRrPROKWjDk=;
        b=qHyzx0g6CrjypH/zXEzpwQJf6RgKFPu1gzqFGc6ATKz00fwDN+r8X1bLkGkoS93nKI
         Iihb7mkquAYfGoXmCNMv7RCaBtae2cTCLzKaNHhZUz8GTg8FbsmrF5xirfA+jiNY5344
         OnZQGXEk6YcE//jQsMz/wkGDbcaUo0X0Wb3RwUEJ2GKPDgUIIzinsVwVKn0Qdr2dzxkw
         qDQbtgod7e+iFLxbiBraF3GNQp7R41hu87gjzIodqAmNg6VmHYRbzyWG0X/pX2acn+jA
         BSU9Wf4xaFRZYTqZSHhzguNkdWBhhKu/FyWsyxFqtLKh00IFlwkzc8rAvDoBo77ylpN2
         kkqw==
X-Forwarded-Encrypted: i=1; AKwUvBxB7vvsdwSaZFKG58Ltw15LBy4oeOV0xCvNLDhfS1CaNPD+cWl6J8gmQ7LLM/Va+xjadq26PwZPkY98F8M5otsk@lists.infradead.org
X-Gm-Message-State: AFq9FYKVpY74y0aQR31qna4zvjqJsPPn7DxZ8AqL1f2/cYrLssVsupwm
	OaLCi8XtPDJCt5AlHP6b/jiHsG+GjXS0nH53c9GHEnUOND6JUmO+pkN/X9FASMEYXIg=
X-Gm-Gg: AYBFou15w+VyymbxrVEgI8Gov3tPXPxrekonvyv7M6RRf6LeHPJpAaGRVSvnJjodzpb
	FaSbWnQ6BWIePDOXOw/SAlcKhTTCE0we0vUerTQZ13JLiJzEK76OoPBLmeJymyg+vfB02GEmA7q
	lz5f8tEZJa3GUp24ntZiRQxu5K7arxq/0VkMLOLzgZoHmRoqQqx9kCDavooteFiD+gZr8dheemh
	WuDJRwInuNeJKC49QCN5gMZwReV6EeJ7wrZqA/jqVIpTGVVKOho0GWpoRy5MdOHTVUMmNFdwJgE
	N1Wqg03GC9LiAAvQL6v6wxiHFlcDuJee8GaXrbOzonymh+tXHkVTFfa4ZVhZygOw30M3ippL/nZ
	o4KIF/yl2PXVfAYSbbpfcn3gscWzWiswCzVPEi6HXEQWDRaWiDJBCHsIwvPUm/g80FaYPykzo1r
	Ghg/7IYP/ZKTACx6+/7ra12YNNOKP7IosrznyhT0+Jny9eO1eFr1svd2Qza5HgZYYGumRHzUUft
	XlFCst72Z7IH2po0Nyhgd3AVjnp5Ao73XGVFcG/qRCNyMkS7T21xifC
X-Received: by 2002:a05:620a:1a1d:b0:93f:1cd7:7341 with SMTP id af79cd13be357-93f29d388f8mr119685685a.35.1792173787295;
        Fri, 16 Oct 2026 11:03:07 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a19ce5asm271055585a.32.2026.10.16.11.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 11:03:04 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xHmGk-00000002F39-2Fc1;
	Fri, 16 Oct 2026 15:03:02 -0300
Date: Fri, 16 Oct 2026 15:03:02 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Mentz <danielmentz@google.com>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
	will@kernel.org, joro@8bytes.org, nicolinc@nvidia.com,
	smostafa@google.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, dawei.li@linux.dev, praan@google.com
Subject: Re: [PATCH v2] iommu/arm-smmu-v3: Align memory attributes for
 SMMU-originated accesses
Message-ID: <20261016180302.GI14213@ziepe.ca>
References: <20261004195027.227748-1-danielmentz@google.com>
 <92758f79-d5b7-4c15-a55d-6bea5f84a028@arm.com>
 <CAE2F3rAJdC9pAqMKcXhxpw1keGzH_kQUNBoPHXjTP8+7TOhfwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAE2F3rAJdC9pAqMKcXhxpw1keGzH_kQUNBoPHXjTP8+7TOhfwQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_110308_763639_B001F1CB 
X-CRM114-Status: GOOD (  17.69  )
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

On Mon, Oct 05, 2026 at 02:26:08PM -0700, Daniel Mentz wrote:
> On Mon, Oct 5, 2026 at 9:42 AM Robin Murphy <robin.murphy@arm.com> wrote:
> > This still isn't answering the question of "why?" though. Yes the
> > architecture says some things, but if we were strict about avoiding
> > mismatched attributes then Linux couldn't ever support non-coherent DMA
> > at all! Similarly while the architecture does permit SMMU
> > implementations to be picky about their output attributes, does any such
> > implementation actually exist at all, let alone in a system capable of
> > running mainline Linux?
> 
> Fair point that existing implementations have been forgiving in
> practice. My thinking here is simply that a small, self-contained
> cleanup that brings the driver into line with the architecture spec is
> worthwhile on its own merits, even without a known implementation where
> this currently causes problems.

I think we should fix this. At least we have HW that respects these
attributes and they have a performance impact depending on how they
are set. Fortunately at least our HW does not have a functional
"mismatched attribute" issue.

If the FW has selected to run the SMMU in non-coherent mode then all
of the bits should be set to ask the SMMU to run non-coherent. Ditto
for coherent.

No sense in giving up performance due to mis set bits.

These IP integrations are complicated, the FW may be saying to use
non-coherent because some small slice of the system needs that. It
doesn't mean that every access on every bus the SMMU has is forced
non-coherent.

Jason

