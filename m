Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4C8C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 16:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vVCncQiFroIxYBskOfYoTQ0oTclWTNPxKFNAE95aCHc=; b=Nd+vNINnjq8hrDNRkpxujxsupd
	dbLAtJvS3qAGChgDuKo9mTNEm4v91G+00zYEABR1UvZHRRNgslkBvee6N8T8qNGMYr5p9JIk814Xs
	Bcp4OQhd9WIPgBzopN1kuSNqEtH+2wJ8OEcC2HTbe0biScnKhwl4hLFKAVvwQKO96pVDmQnQkCimm
	petuUNjz1tcf3rOCGUJlT/HUSWzQKGvtjyfP9zopIbOMKNih7fpUzDtjtnNj2d4bvDodxAMW4WFfP
	uY2Eoxe6dFQ7lwpNu9s+Bn1+KswtNvIsS1Ncl6r5jcpg8bUxglLNIPLBnwJdm3MB0zf89zdS1JD71
	M+KTvkXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp93s-00000001dHD-0Tao;
	Mon, 03 Mar 2025 16:54:36 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp92I-00000001cr6-03GB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 16:52:59 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7c3b533a683so157175985a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 08:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1741020776; x=1741625576; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vVCncQiFroIxYBskOfYoTQ0oTclWTNPxKFNAE95aCHc=;
        b=pNWTWlVGiQ5f8G0nBChsG7J5HDZuMwdO4/dBS/ZpEOda5fWPaLWKTiBr/q5XYOzi3m
         lsnWwaQEbQ7TKYwuu1WYItv5gltD0LOJeu6JQAIqMEPGFVJ0aamVQ5XGgkBuAeZ7Iht+
         8p9PZE7SFL1vLOBd+jm2WqKOJTWaHMO0phPC7iEbidPUSCZ5nAiruZ7Bpyrvpdw2tbJU
         5o64deedwJPkIr6axvN38eI36a5EJGYc+wNQWwBMlgJcZhiZsSxM8tFiGMQ2KNZprtIv
         JmJzf6aPespi1nGI1UDEc7R3gx81gHVnqhp4FMITpaKc32mINPo9gTYdHmO6Wf0wZC5L
         A99A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741020776; x=1741625576;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vVCncQiFroIxYBskOfYoTQ0oTclWTNPxKFNAE95aCHc=;
        b=Kri15kL585GqjRcbPMzvO22Fcb7xyvffjFVt7EbrxsFCMRVpWSnvy33afRpVh70pag
         KJwWy7IR80dWx1GervAHB6FLMTi6VSfc4jKjCHRuyCon7CGunEtce8AOtQlI/xWOUNji
         rxNyxooKiwT/+GZeAe6HUxiXW8Vf8SG42+T03o3XODtIqBwFCKtKulcwXetTkZuV7ZsX
         kl2fMKgEQiXXNs5PfDpu4LQwGDCnDd07ZiEIdP64bi4d2w0hFX7gLu08pqoaTtd89P+r
         /CmSIqYYmoLVJJbP8dRJLOYRhLn1BENaAOjIYgjMqIFKageSylh/wriHfq78iLLRzVG0
         j72Q==
X-Forwarded-Encrypted: i=1; AJvYcCXSOpE9NmGnCzxazzYSGA+by2DfQ3WBZXaBZFcvi0LvjAEWQFVjV1/PeKH/TRjOCU5QbztP34qZhdbqz9yZlUqq@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/Ka65B+sdh2dokkXsFnPCM7QTzfdmIdnWfVItYO/ZZXHrh9MC
	lT9OPXNwuLxjql2TMHyvv80uSTW3Ndh6E14Lar7JDn6Hty6BMkdAy5r49R9bYsw=
X-Gm-Gg: ASbGnctbzgbJFmnD6Y4RTOsWx3/T8wR6Tn2u8srKA8xuuUSr3n8Q4BRxK5VO+HUABNe
	nTshY17G3EdIIwkuMeNPZYaS+2T4CpQj32sLfxbwvTSEXKgPYNrGypcDQiZ8A8wEUb5ZyeuSjzf
	1QBK9cNXBKtMmHc/FgPF92JaeLQlC+oc2DVZtfdGw3h0H2rx1lpk1eWyjkvELFNkyrLN5mpMhfx
	n8Px8CMdQRRU49uBGZBwKfMkcZVGF+CrTjRQboKL9LLBgdcxSJp2MH4PpsX+AcIYQxRgLp8AfrN
	+9rVIVOaWvcAVsOKvkwqDz77dZ9NLJFFcSBYUBrRvLY9ZZ1cBpzcwXBuGkYftY1Fe99tgGeasGF
	ZYWVHV1crAeEdA2rFwg==
X-Google-Smtp-Source: AGHT+IFIf6jYsBfdvTc0EikS5Xpb0DbNcOeZPaKcF5x+vop09uaQoyucRacuzLKsWcUPdgqNiYKzIQ==
X-Received: by 2002:a05:620a:190f:b0:7c0:b690:8468 with SMTP id af79cd13be357-7c39c4ca479mr1861404285a.33.1741020776537;
        Mon, 03 Mar 2025 08:52:56 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c3b8cd9d36sm165720585a.104.2025.03.03.08.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 08:52:55 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tp92F-00000000ok6-047X;
	Mon, 03 Mar 2025 12:52:55 -0400
Date: Mon, 3 Mar 2025 12:52:55 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
Cc: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"yang@os.amperecomputing.com" <yang@os.amperecomputing.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"joey.gouly@arm.com" <joey.gouly@arm.com>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"maz@kernel.org" <maz@kernel.org>,
	"david@redhat.com" <david@redhat.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>,
	"mshavit@google.com" <mshavit@google.com>,
	"jsnitsel@redhat.com" <jsnitsel@redhat.com>,
	"smostafa@google.com" <smostafa@google.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>
Subject: Re: [PATCH v2 4/4] iommu/arm: Add BBM Level 2 smmu feature
Message-ID: <20250303165255.GS5011@ziepe.ca>
References: <20250228182403.6269-2-miko.lenczewski@arm.com>
 <20250228182403.6269-6-miko.lenczewski@arm.com>
 <20250228193221.GM5011@ziepe.ca>
 <b23aa37f8e864dea82a6143bece912d6@huawei.com>
 <20250303103102.GC13345@e133081.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250303103102.GC13345@e133081.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_085258_139596_3347F17A 
X-CRM114-Status: GOOD (  20.78  )
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

On Mon, Mar 03, 2025 at 10:31:02AM +0000, Mikołaj Lenczewski wrote:

> > > On such a system it seems like your series would break previously
> > > working SVA support because this patch will end up disabling it?
> 
> Perhaps my understanding is flawed here, but I was under the impression
> that with SVA both the core and smmu MUST support BBML2 to use it safely
> for core translations? 

Yes

But today's kernel does not use BBML2 in the CPU or the SMMU so it is
compatible with everything.

So it is an upgrade issue, going from today's kernel without any BBML2
support to tomorrow's kernel that does then you loose SVA on
previously working HW.

> Hopefully, as you say, the MIDR list restricts the breakage to a limited
> (ideally, zero-size) set of implementations which advertise BBML2
> without conflict aborts, but which do not support BBML2 on the smmu.
> 
> However, if my understanding of the BBML2 feature and how it interacts
> with SVA is flawed, this will obviously be something for me to fix.

Lets hope, I was not able to discover any NVIDIA platforms that have
an issue with this series as is.

But every addition to the MIDR list will require some consideration :\

> On independently enabling BBML2 on the smmu but not the CPU, this should
> be possible.

What about the reverse? Could we disable BBML2 on the CPU side on a
per-mm basis? Ie when an old SMMU attaches with disable the
incompatible feature? Not something for this series, but if we get
into trouble down the road

Jason

