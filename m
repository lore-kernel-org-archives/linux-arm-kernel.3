Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E813CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 17:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ZKiIqr2wNuyAPe6hCnVLHZyBqqQ8TWVMIEldJ82jWw=; b=ekmyPpiMXmI1A7e6x5m0pTkKw+
	zq49o543fXKgUNVfmRzhFlX5H3OVibJg3RSXsNuvhFZwB0itihrju0h82Z5mzg+05CONlH69LhULk
	UlIMhKqdyMB43/rv3nA9Pki9849nTGTT5+Ou0kfTQoaJ6C4iFKSknl8TU2G8WzEVAPBIEb8JKdBCs
	kp+sS4pwTcIUXy737j6mjmoQRXGXsBjH5D4n6aheaYtSR891ROdm9G6z+4eGCnKh5xesaQ2bU11hh
	Umm65WaR3RtXB2NpPfIaPMfm86KAb4DKOoeMEGLdUVuVcG5VfMKXAxavUbEsZtkSqUg8YHZfDcPUd
	rk7MVE9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI8X1-000000051qx-0pin;
	Sat, 17 Oct 2026 17:49:19 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI8Wx-000000051qH-2tF8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 17:49:16 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-93f2b8cf051so64730985a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 10:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792259354; x=1792864154; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6ZKiIqr2wNuyAPe6hCnVLHZyBqqQ8TWVMIEldJ82jWw=;
        b=oMHJRafJPKpXbm23RXeHtmkER65/gVHdu5nM91s/8zR/PE9gTZAK4gHnQICwjSlLRQ
         Sp1OGR7nAvqqjDwW8+iEoPAWrYIjLIib5gJ+tLcd+Xm+fJE5wKzcp2xiH1L8ezMeKl/N
         WzG3ghdMXOgR9Wtyzt/X70OLiSeYpeSHvftvKMG4dQ0/CuFtBn4JFD27nyUYwweNI2RH
         67r4zQoBaMIxwwBbMnZ1CIFyiJ8Dm82FE0xK2pEsT90/Xqx9yq7QatySvq95PNNQ64gq
         R5qlv/OdGdbhaJu66FH22lc67OkYRsl3KlzT+bLv08nNYqf7ZWy4VTjvVJPZdJgjT7yL
         ki5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792259354; x=1792864154;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ZKiIqr2wNuyAPe6hCnVLHZyBqqQ8TWVMIEldJ82jWw=;
        b=JS4MD887ndTINN8Ocg4QK7aS9mj1igQopsd/WgxM5OYaZewRy8Ch4XGoReyVAxBiwU
         wbEGLcgWZs7ToxYh6PtMVMneebDSSRYWtsMYX+MjqeMieyz9OeqJqC8GaH6yjIzJ+w5+
         qXyBzaqr66TGh1DzLNmH6a0OxdBIerqv1x3Zi8En3UZUGpemWXYzpPRbAK1H3i9+1s/b
         n2f2qhRUHB+yrb2wBKFx0qMso/kTmBAYBSfcw0lltOdjU4W/ZJi2fh37921pkS9CzKMO
         melC+2P2yZzpA/O399SEZFroVUhDVMYo3RXVV205/7LxPfuYsQq0bhgdc94MuO3OT73W
         tjUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwegJPV83BS+EL2eFCSMhkTnNbvmFChxSWVvUBHJPY2oKWr5wmqV3OKTu7b9yAwmvTjr/oEKf4onG2cD6Y8LE3H@lists.infradead.org
X-Gm-Message-State: AFq9FYL24q16ddiTLSGn0jFX3cfGUc12ojR7c58vW+LyNMm5qJaTCd9I
	PMSHqXW5q90WwIEOaqXU31DGVswf1hdeHVxv39v3UQroEcwp2ZvxQQpFckjpMVmaNDU=
X-Gm-Gg: AYBFou0fO7igKHW2jzAlOfVDsre/MWHFmsKT5u6tXsh+DxVVcxb16wVPytMWyiEOjoF
	ewTyMtoSROrEVQd2CnbEJjXijSIhaxEjTql6TMdy0cqi81sORGeyDWUqvFNhdScoB0LxYXcyYuA
	ROaVH2ZKxsCpySHjNwB85D61W0aeoEW5xD4muZ48YQxOFU3WZLbenIRCAwbbz9i8sCuIZt3FPZo
	p4LZ26toKLnaBQiOYk3oVVS72ZksyUBoWJOImGgx63+aAijQHaeE0qI5WXzLIEIkFip7x0ufMQS
	EZPRr6HSlrVw4NMlM2U6hjtaNCRmJ6s5p5wVxx8PtkD9vWKAOxPVNkxZ5zrN8sIbrGljgJvRlvQ
	nYav6VY+V3Why50QDwjxYTSxBM4EwJ9EdE17hlO+QhUNo7uqqHJZ0WQLscj+OIiZ30ZjqXAgalP
	Dhmnj7oAmszWRu6hfZZJ+9LpDrIifdMfFNzPei2oqpWm3StCQtInM5fFWJb3qlnBZrw1BA8Gi0t
	0P/H3c4Gu0IUtMSbhaWjLWiK21cHD8YEc4Yrgm7MPj4u4jt/93Es/04
X-Received: by 2002:a05:620a:45a2:b0:93e:c12c:9dcd with SMTP id af79cd13be357-93f29deb855mr546221985a.77.1792259353931;
        Sat, 17 Oct 2026 10:49:13 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f2f045ca4sm171937385a.29.2026.10.17.10.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 10:49:13 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xI8Wu-00000004sUa-33rg;
	Sat, 17 Oct 2026 14:49:12 -0300
Date: Sat, 17 Oct 2026 14:49:12 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Pranjal Shrivastava <praan@google.com>, iommu@lists.linux.dev,
	Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev
Subject: Re: [PATCH v11 11/16] iommu/arm-smmu-v3: Add CMDQ_PROD_STOP_FLAG to
 gate CMDQ submissions
Message-ID: <20261017174912.GK14213@ziepe.ca>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-12-praan@google.com>
 <ar1yNtr7Kp2OTcDd@nvidia.com>
 <ar3yWUmi8E0k37Ml@google.com>
 <ar6gY9grmdMZcN/M@nvidia.com>
 <20261002164748.GD3481470@ziepe.ca>
 <asAeCz_rmpe5hbsh@google.com>
 <asUvUf4PZJ7JCLXp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asUvUf4PZJ7JCLXp@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_104915_800317_5F903EDE 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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

On Tue, Oct 06, 2026 at 10:26:41AM -0700, Nicolin Chen wrote:
> > pci_dev_reset_iommu_prepare/done() pair (with slight refactoring) in EP's
> > suspend/resume?
> 
> That sounds right to me, though a different API for suspend/resume
> will be required. And call them in pci_pm_runtime_suspend/resume()
> maybe.
> 
> Jason, how do you think about this?

Maybe lets just start by refusing power management when ATS is on? For
PCIe devices too?

It isn't just ARM that has this issue, every iommu is busted if you
suspend the PCI device while an ATS domain is still active..

Jason

