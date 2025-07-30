Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A6AC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 16:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QFuG/A3j2Vv1mbEqh/G2TAhE+lxRzm1/wn84++4OCP8=; b=o2SjgUNnsuyK2F4P+P/EokhTeK
	GEMjE9GENqbK8m6wmWWLsTjgBPURNDgGmC7Sn0HVAxjEUaSzZvJ9PHKQPtqvBZ6fjlVBGgBZz5DGG
	gU+PprARZBNYq/jbR4+0SMguJ37Fx5OUUCjSaAtooG0QTyVN5rpnySGQhfgE73LITvnzGYlBxrPl/
	EOn4BvDqKCIUY3UioLlUzsGtJvtzrBJ4p7rTBV97oq/uC/IfffukmjcUmGs67J2w73uymVwPeq4Bp
	02rgNOenCUZKz/p6s4F21OrnxSYXdpIYEtzAZl4KCBZhsbXpWVJpdjmNufM8ntbVtyScrWgDfaaZT
	832bJr6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhA0b-000000022Pb-05CE;
	Wed, 30 Jul 2025 16:50:29 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh9y7-0000000227h-0nUU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 16:47:56 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-707389a2fe3so37533116d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 09:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1753894074; x=1754498874; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QFuG/A3j2Vv1mbEqh/G2TAhE+lxRzm1/wn84++4OCP8=;
        b=DjXccWSuK/CCkY/pwIWoPXaFkX1wpqq+aYRFLlGXc78fxQ4VkJ7G3wcCPWuxevSvqz
         rLUgZRhpa73bNbPmZXZ42I9Rfe5K5v9OhqSyTlzyshrRfMcVLVjkedC7iOPNz3xOcUG1
         NPJlHZodY+xLFq93w0rI2giOrlb+PHDYXkyA7Uf11BxrU42mGbpjpmfl5MxwNgE+NDBo
         5+z5fKv9sqWQdKCRWNvQrR2kz2kKpUjMRgxxTMAPGUrD0y0G4rllQH+5GNqAJbG2Gumz
         pYapPjYbyNjUBjw1mkFD0q3QosW/qhaItXqC8FbBplCZMm5ElNJYueQoMSwQ1o1o3con
         xNrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753894074; x=1754498874;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QFuG/A3j2Vv1mbEqh/G2TAhE+lxRzm1/wn84++4OCP8=;
        b=KEKPUMJvDCb2Ypu0w7nTdMhM5eRExiS36YT6mc0zPM7xtPqS3zPkomJbtK3JqULYvU
         1CWEj/aDsCuidqSiFIy3DMcq4t14+hwYYlO9Bs4I8plY/bdG2QJqhBtlu7REho3WGsFt
         XY9J7mSSmLfKp4qE051gpYA1dASKae+dwPU1nRdN/Tv6UKhaiAH2mNU/kk9IDPXGl65j
         xioAleviMzXolpI2vk6yvCfOIpDe7p7cxZLIj21pjE8iOCON4uG+vEoGw5a+wAuWEwht
         I5H+FCtOu4PzJjvIEhP40NTFvXH0AZSLNzlt0u1iYBCB8MlW7QAFmhqiQVi03wf0xzfY
         0C9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVSa2fqU94oqhoN+JrwP3temNA0nLQhNZ/ubtbPIXStCxLSNsZwFlJrMQ+CtWXUTaHmeFaPNc5tBlLf3Rf5bZNY@lists.infradead.org
X-Gm-Message-State: AOJu0YxH5l41OIAmoOU9rN1+98YV2okHUCqGY3uFsbe1yH2K2WuJa4UC
	fR77o14QY2Yan1EobYz/G/lK8hxsnyFICunZHgZKyASPzZniqqknmsnwHP0JTmW/9Yc=
X-Gm-Gg: ASbGncsmuPBBRmmbP3AzLH4+v+9jzGS5TgSUqFgY+9ockkmi36r8FzZuZv3vSBdM7AN
	PjBdZCSRFmFrMdteNPHU7lUCu+r7ryt/uUIO0sDRViPN0Wj4tk79IQJAvT6ZFu4SOEB507wC+4f
	Gla32RcLKEPZDQdMFOAt44fts+Fpcj3j8CbqKbkv5MLKa3zWye29qBERBG0IEtsuuP1KzUnJbyQ
	RQ5EkiWuUcB6Knd7yS0PEZDeTYOYjkEcrIGvAsD6aCbjcmts3/tvJjZF55ZStWxsQwk1HBYFSlT
	9UpgTtM9uv45xdB2FzUjdALVwE2ukYrhIy2M7rbN2kXzw4/qGMtcdhoD0A5ck9DHW+C+Lzh7+N4
	+BlnPVSceY6g4gmOjHPsVvNVkOUqby5e2xVIt33OJtXg+nBUe5UvhJzs3iYkGG/4GL9qQIv5JCt
	/88aE=
X-Google-Smtp-Source: AGHT+IEYjgoPB2+hXPaGV5LTcJrEx5auyd7kyK9NRID9fF4xcgzzjcLh06XEPwQDU8NDYLbYj9Li/A==
X-Received: by 2002:a05:6214:624:b0:707:3829:d491 with SMTP id 6a1803df08f44-707669437aamr60902136d6.0.1753894073853;
        Wed, 30 Jul 2025 09:47:53 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70729c15a84sm61759986d6.48.2025.07.30.09.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 09:47:53 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uh9y4-00000000SQn-3S3W;
	Wed, 30 Jul 2025 13:47:52 -0300
Date: Wed, 30 Jul 2025 13:47:52 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v3 29/29] iommu/arm-smmu-v3-kvm: Add IOMMU ops
Message-ID: <20250730164752.GO26511@ziepe.ca>
References: <20250728175316.3706196-1-smostafa@google.com>
 <20250728175316.3706196-30-smostafa@google.com>
 <20250730144253.GM26511@ziepe.ca>
 <aIo1ImP7R7VhRpVE@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aIo1ImP7R7VhRpVE@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_094755_229936_5B4C33A1 
X-CRM114-Status: GOOD (  35.98  )
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

On Wed, Jul 30, 2025 at 03:07:14PM +0000, Mostafa Saleh wrote:
> On Wed, Jul 30, 2025 at 11:42:53AM -0300, Jason Gunthorpe wrote:
> > On Mon, Jul 28, 2025 at 05:53:16PM +0000, Mostafa Saleh wrote:
> > > Register the SMMUv3 through IOMMU ops, that only support identity
> > > domains. This allows the driver to know which device are currently used
> > > to properly enable/disable then.
> > > 
> > > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > > ---
> > >  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   | 92 ++++++++++++++++++-
> > >  1 file changed, 91 insertions(+), 1 deletion(-)
> > 
> > Can you split the new iommu subysstem driver out please? I think I
> > asked this before.
> 
> Sorry, maybe I misunderstood, do you mean split this patch into multiple
> patches or split all KVM SMMUv3 driver out of this series?

Yes the latter, the iommu driver introduction is best as its own
series

> >  - Domain attachment looks questionable. Please do not have
> >    attach/detach language at all in the hypervisor facing API.
> 
> I am not sure I understand this one, the hypervisor API has no
> attach/detach APIs?
> We only notify the hypervisor via “enable/disable” hypercalls when
> devices are attached or released (as only IDENTITY DOMAIN is supported)
> so it can enable or disable translation.

Same difference, different words.. We've had trouble with this kind of
ambiguous language.

attach identity
attach blocking

Keep it clean and simple

> >  - Get the ordering and APIs right so replace works. You need this to support RMRs
> 
> I see, we can’t support bypass for security reasons, but we can enable
> the identity map for such devices.

You will have a small issue if the bootup has the pkvm side put the
device into a blocking translation then later switches to an
"identity".

As far as I understand it display scan out buffers have to be
continuously hitlessly mapped. So you want all the transitions from
bootup bypass, pkvm isolation, "identity", etc to continuously
hitlessly map the RMRs containing the buffers.

I think :)

> >  - Use a blocking domain not some unclear detatch idea
> 
> There is not a single detach in this driver, we only support attach and release
> operation, which just goes to the hypervisor as enable/disable
> identity.

'disable' then.

> >  - Use a blocking domain for release
> 
> I see, I can add “blocked_domain” similar to “arm_smmu_blocked_domain”
> which just disables the device translation, I will look into, I am just
> concerned it's more code as this driver only supports a single domain
> type.

Yes, this is the right thing. There should not be operations in the
driver that change the underyling translation that are anything other
than attaching domains. It becomes too hard to maintain.

 
> >  - Use the smmu-v3 approach for the fwspec, don't store things in the drvdata.
> 
> This is using “dev_iommu_fwspec_get” similar to the SMMUv3 driver,
> am I missing something?

Oh I got it confused, you are just calling 

+       .device_group           = arm_smmu_device_group,
+       .of_xlate               = arm_smmu_of_xlate,
+       .get_resv_regions       = arm_smmu_get_resv_regions,

Which is also weird, why does an entirely new driver call 4 random functions
in arm smmu?

Maybe don't, they are all trivial functions, or you don't need
them. For example you don't need MSI_IOVA_BASE if the driver doesn't
support paging.

Jason

