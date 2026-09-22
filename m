Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91147C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 15:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nEUSfYy3fMUXK5aMDHvOLpQjElNKnWNceOG4CaIeRdw=; b=xWxfduupd+WONhXwBhUzidygzX
	66Ih/DlbeBMXNAl+9QOKlSborngolRvMT0FdWGfSLTIW/fQpye65LGGcGI+QvTPUyeAz+wDHYk+D/
	2d+3DdeP7TcKyIPJCtZA49tyZMPfUy7jdszLDwY1IqFykALIEzsLg5zHFGCNMQuH6nDakKt4tXBFn
	sYV8rpcW1iSTKXzjeHzOx84zrduBRWVUI7rLHA8dwHxf/4PdgcQRsMutgA0Bl0+8NfNfVDsEqKo+L
	9heYX3Xmv9u1QQa8HjhKFQSU8A7amjkjEJOiQDHjLrvfvPNKDIIrfBZ3EaYewrphxT+eQztmykzN8
	m9/2+vjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x928K-00000005nES-45Ys;
	Tue, 22 Sep 2026 15:10:12 +0000
Received: from mail-pj2-x24.google.com ([2607:f8b0:4864:39::24])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x928I-00000005nD8-2ba7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 15:10:12 +0000
Received: by mail-pj2-x24.google.com with SMTP id d9443c01a7336-2d747f05ffdso30817635ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 08:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790089809; x=1790694609; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nEUSfYy3fMUXK5aMDHvOLpQjElNKnWNceOG4CaIeRdw=;
        b=jC6zMSNpxpumPVT+5UCTDT6lPxagCfzO5VOP0kr6GmgBQoA16YXR8J5JtfYeb3L5JR
         gWKFcrPPwuNbiVsIDK0+uhP0F3+TQ9Z9usJuE7uhaL2hdqER1AU+H/FyK5d2hQV6QXBF
         mnrBrdyUxSlMR0TK6yg6VKvuah+fPZeatWvJt/X4TnVXzTlgCiKXr0XuAjNqlvrBAX0p
         TsDHxK2Od+LDxjvUilDEf2PGghNm1HLi/BjmInRHxlu6ddOuwzGWjbgGxkzmHgfH1nlY
         ZsJ23IS3GFDPROx7M5BxU3eLDeDiX6xn0mZuFIFB0gnHmaG9/YzdwGspf9fu9iQG/QC3
         xRxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790089809; x=1790694609;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nEUSfYy3fMUXK5aMDHvOLpQjElNKnWNceOG4CaIeRdw=;
        b=KvKMv0TV+402Q/XRm4kwBC3XR0LtpSPO1m88LrUf5NcwoMaC3bJP3EVKxWdyLLEiW8
         os5FE/iei7RMH8ZIOWcp11uPZDzl6zGf84WSSRI2RhFJ23/QimYeW20ZvCHz2b4tfheo
         L5nYeYwHWnj/v/Byi+JlSrsx/YDZD/UwbxiaLFpX5UaKu50wX2c2bcYU3wI5+QgFGOap
         CW2Alcj8z0gjlIEu/9g1Wu0D1AMy/6hSqTQqtfR8Zvr5ZupA0IkRYlCyFMjhbsPhJgC0
         FMQbnMbcXJF67wGuxx/8+NhikxRs3GKV1ylKKyAk9pJY3UqmKONGZx8cIU8ffZEH3nPU
         d2yw==
X-Forwarded-Encrypted: i=1; AKwUvBzSXEqMRQKJ3qeusO/6mI83SuF93/SaPrtzvCOSMo71Bn9MNKBw4207i96ivczfUKteFpvlj01+Z1zQRYhQlN6G@lists.infradead.org
X-Gm-Message-State: AFuF++ksTBNy0ua2z2P0kePMIMgr5TmG9orYm34ybqXaY6GnrGRb5scd
	Vs1/dNq7ktuSuLgOFuaPXJtnCCdivLlgK3TdvlP+vqj5xz+jzOyT6KpzPlT6X9EYZpY=
X-Gm-Gg: AYBFou1ROANtnzbAlYWVe2F6Pn1lIuWHWcYLzHskxDOzr90Y9CK1cZc90/nqQcL3a8u
	lXwJJIBOBM3PypRYMpcnXtDRaaR8IJMmlX4enGGimLg7kCm/DkgXoPm9Sx1dfyHaWvPm1b4Cukx
	ElWwQSjlmLi/OSMXt5+nxoMEeqK5SKMA77pZVfpNYoAuYfuheBgpUJVsSy2g0yoBRUQBsZQ6eLr
	IxA97PI9hnprm4+tc5qX/8XAGtsABLrYAOArKuM5vlbEMBNvIwIL2JaVXmLVnIQElCEFLw/ILzZ
	T7VeJQ7W2snTYyeC+9d5OrQ4OA6KuhGuHbWtceUG4VAvtsL3aRsjMgil//wPE5DIZL+zoo8c/k+
	V9T4K2YUE8g3L7a8mYRFYhqCtqUJqbaQKLe7vVlyS3wC2mAuWI3YeYFMaSOQwIEF5vZUqE8zCT1
	u2qcTdHS5LxOXOSxCuZMx9ollFnVh0OxYaIJpgvqwTRH+bRS//w2oTD5+agQMld7TAatxfdt/Z
X-Received: by 2002:a17:902:db0f:b0:2dd:76b1:3509 with SMTP id d9443c01a7336-2df609d1b62mr16580265ad.14.1790089809191;
        Tue, 22 Sep 2026 08:10:09 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:1046:ab8:737c:d2e2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d0563eesm11964455ad.69.2026.09.22.08.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:10:08 -0700 (PDT)
Date: Tue, 22 Sep 2026 09:10:05 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, virtualization@lists.linux.dev,
	imx@lists.linux.dev, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 05/12] remoteproc: always report VIRTIO_F_VERSION_1
 feature
Message-ID: <arKaTaFuNW936nwg@p14s>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-5-dac8c5eb4aa9@valla.it>
 <arFRqopkkJf7Nlq4@p14s>
 <arIgI4E5rGXq9H0P@bywater>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arIgI4E5rGXq9H0P@bywater>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_081010_671563_F62E2D6E 
X-CRM114-Status: GOOD (  33.49  )
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

On Tue, Sep 22, 2026 at 08:32:15AM +0200, Francesco Valla wrote:
> On Mon, Sep 21, 2026 at 09:47:54AM -0600, Mathieu Poirier wrote:
> > On Wed, Sep 16, 2026 at 11:10:50PM +0200, Francesco Valla wrote:
> > > There is currently no way to report the VIRTIO_F_VERSION_1 using the
> > > resource table alone, as the per-vdev feature array is limited to 32
> > > bits.
> > > 
> > > Considering that the VirtIO 1.0 specification is now ~10 years old,
> > > always report the VIRTIO_F_VERSION_1 feature, as some drivers depend on
> > > it.
> > > 
> > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > ---
> > >  drivers/remoteproc/remoteproc_virtio.c | 10 ++++++----
> > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> > > index 74e0da970f1d..cfd66d9d1c9e 100644
> > > --- a/drivers/remoteproc/remoteproc_virtio.c
> > > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > > @@ -249,7 +249,7 @@ static u64 rproc_virtio_get_features(struct virtio_device *vdev)
> > >  
> > >  	rsc = (void *)rvdev->rproc->table_ptr + rvdev->rsc_offset;
> > >  
> > > -	return rsc->dfeatures;
> > > +	return rsc->dfeatures | (1ULL << VIRTIO_F_VERSION_1);
> > 
> > I understand this.
> > 
> > >  }
> > >  
> > >  static void rproc_transport_features(struct virtio_device *vdev)
> > > @@ -275,14 +275,16 @@ static int rproc_virtio_finalize_features(struct virtio_device *vdev)
> > >  	/* Give virtio_rproc a chance to accept features. */
> > >  	rproc_transport_features(vdev);
> > >  
> > > -	/* Make sure we don't have any features > 32 bits! */
> > > -	BUG_ON((u32)vdev->features != vdev->features);
> > > +	/* Make sure we don't have any features > 32 bits except VIRTIO_F_VERSION_1 */
> > > +	if (WARN_ON_ONCE((u32)vdev->features !=
> > > +			 (vdev->features & ~(1ULL << VIRTIO_F_VERSION_1))))
> > > +		return -1;
> > 
> > And this.
> > 
> > >  
> > >  	/*
> > >  	 * Remember the finalized features of our vdev, and provide it
> > >  	 * to the remote processor once it is powered on.
> > >  	 */
> > > -	rsc->gfeatures = vdev->features;
> > > +	rsc->gfeatures = vdev->features & ~(1ULL << VIRTIO_F_VERSION_1);
> > >  
> > 
> > But I'm having trouble with this one.  
> > 
> > First bit 32 of vdev->features gets cleared and then bit 0 to 31 are assigned to
> > rsc->gfeatures.  Why bother with clearing bit 32?
> >
> 
> Bits > 31 gets silently dropped because rsc->gfeatures is a u32; this
> was inserted to explicitly drop the flag that has been inserted before
> and avoid the "silently". It has no real funtional impact and can be
> safely dropped.
>

We have come to the same conclusion.
 
> > >  	return 0;
> > >  }
> > > 
> > > -- 
> > > 2.55.0
> > > 

