Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A627C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 19:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uz/I9zjdLCZbUHGbjgtmB+dGGWHOROD3Eamf87Tym6M=; b=oZFQX61aA3daqmfBr0PiWiIidS
	1fzuv68TmM16QYUd8FIEsT6JgX4VC6YhX3fjuhiguHXNVbeOKynea+ZgZeDqNFMQS/wUagqefLxt0
	mNnG+iUCJhRvo+oMvLN2ozVhvKVOP3Xyp3mtyhbHPDRznlNLiTuQQVUCWO3C2btah+na0gVWmC74F
	5MtlTOQn0ZUteMZhJCdBhwgnJ/V4O4hSm7+OuaKX2/d4zQCeoU2ONygVFoJsL6ucOOqLtUipPfWCa
	ICYpVD7lPikLoui88dvgTH04TtsIRtlTzv3Wijncv1quhxB6TGZoM8VIwzmgpZlmKBOKowIpOwumR
	RKG1fZ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk5Se-0000000FoGX-2cww;
	Wed, 15 Jul 2026 19:40:04 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk5Sb-0000000FoFN-2uSx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 19:40:02 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-51c1d487f2cso27189791cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 12:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784144400; x=1784749200; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uz/I9zjdLCZbUHGbjgtmB+dGGWHOROD3Eamf87Tym6M=;
        b=Y4VRyKmyXnCPztXVAXnrNMrthz8eRLOB3iFHsZ6P4X3Ift7oNzTpPBNQi3fbMWi2LS
         DXryY1OJh8A3SKXkid3QmNXu3JPASI1gBCvTyHBd52zBujCn4TUHK6kSJ1ao33LJZY53
         XJDulTp18CuDxj0LGq1QVfB2MuU0u1xzo96wFn8VPJzWzLZHjmTq3NOB6W18AtuLP/8H
         Oxq2oH+tTZImzJkqNtXJYAPSIs8ct6iT/ukSpd8gp73fxZfCEtvQISJiUhORPCz2FKU6
         12LAskQGYRVFihC91kO3EjuZvqFRUhxHmh5ZumSy3WmD7mQbYBed7nOMeEvJXoGUrOp4
         WWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784144400; x=1784749200;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uz/I9zjdLCZbUHGbjgtmB+dGGWHOROD3Eamf87Tym6M=;
        b=iahp7VsY4JzvXIIKS6RnfuDI3YGH0PGH5pXCypmxL0Kcf47j8ZjEzJ6579hvlc8pZg
         gIKMrxZDTmIg8oCeTOi921cavzK7zXuRuYgCNsabw1LgyRiRYUcsEHM5TOszkmt0VF/M
         uTJZy11XNSUOW3oPYfQasbMVLVWIVtNx2JjvE0ODPFzvRDVbjYXp8R3RmOF7XxFv/L2j
         2ST46yMqRl6yD80tJPEeyu2s1ShGO/O7bfg3ZLAcWI31pp58JpjjF2TuJ+YXDQzROLG/
         0tCP2dq0CGtb6+DiDR79VkhFk2Vq7TCqf3zrw0878PrbjglJMjBP31R8vCVmzX0utUoL
         TF3Q==
X-Forwarded-Encrypted: i=1; AHgh+Romj3WU3c5lAsTU5MBxBGYpdVf3h9LodA4/HWDEyp7L56xXeGgGQAKNBeKaJhb03YhlFM0oZwAnG+4ThPhj1J7t@lists.infradead.org
X-Gm-Message-State: AOJu0YzACKgyAdNOdSaCm6403kumns2rtcZ/WjAP+8kGY/twVkhVZwbp
	kISkzSYDZxrobgMCS/pDobCa9zeJDTMzYX5FHGf+xtk0FPRoKSgcXs2lNeKupELnvi8=
X-Gm-Gg: AfdE7cn/5RLn8pgv+DcxyrMlQRAKy2rob+p+bMhkxkeneyCn9Jbaz4f5Zhtf5I44fzq
	OpMCld0zTFYKukTRXJx+Smec5NFiJFAAMq252gJB2ulHLZQzGulydKneYP9GmdiAjAs1VK1vCN4
	BrGpQ/SoRdmllXD3vWUkHy6mSGnyqsAPRDfkWz9PKM8XcNuxoR47YfP6/MmfXrJ49vrd6GgaJmi
	hJdfEbHL81N5rqWDGVTGL1JtSHeymR1BqMC7SJI/U8R2psCohejQv4Nc+HTq9WIVaMrUk57p7W2
	qOCG2vilK65oTz+v8NIv6XoCTkn7RiQdd3iyBX0ogV37V/uaOh3mRPZdIqoiwNllfWsSYYS8+uU
	TiO6WXmMC1FUDGb3ytj3l8fBDEF5++pQwhdq7s8chQPPnxeLpFe64PVbF9Ge3
X-Received: by 2002:ac8:5fc3:0:b0:51b:f40b:2fac with SMTP id d75a77b69052e-51cbf279099mr203782551cf.50.1784144400189;
        Wed, 15 Jul 2026 12:40:00 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caace31a4sm145676151cf.12.2026.07.15.12.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 12:39:59 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wk5SZ-00000000tyA-0hFm;
	Wed, 15 Jul 2026 16:39:59 -0300
Date: Wed, 15 Jul 2026 16:39:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: weimin xiong <xiongwm2026@163.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 2/4] iommu/arm-smmu-v3: Fix fwnode lookup lifetime
 handling
Message-ID: <20260715193959.GB210048@ziepe.ca>
References: <20260714060930.220277-1-xiongwm2026@163.com>
 <20260714060930.220277-3-xiongwm2026@163.com>
 <20260715193732.GA210048@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715193732.GA210048@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_124001_751202_89905EEF 
X-CRM114-Status: GOOD (  15.81  )
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

On Wed, Jul 15, 2026 at 04:37:32PM -0300, Jason Gunthorpe wrote:
> On Tue, Jul 14, 2026 at 02:09:28PM +0800, weimin xiong wrote:
> > bus_find_device_by_fwnode() returns a device with its reference count
> > incremented. arm_smmu_get_by_fwnode() drops that reference before
> > reading the driver data, which leaves the returned pointer derived from
> > a device after its reference has been released.
> > 
> > Read the driver data before put_device() and return NULL directly when
> > the lookup fails.
> > 
> > Signed-off-by: weimin xiong <xiongwm2026@163.com>
> > ---
> >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Actually I got confused what this was..

No, this is nonsense, if the devdata is racily being freed then so is
the smmu pointer.

The whole design does not support hot unplug of the iommu and the
purpose of the put_device is to pair with the
bus_find_device_by_fwnode() not to control any memory lifetime.

Same comment for other similar patches in this series

Jason

