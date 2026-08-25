Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CDAC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 18:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=re8o97vXXRWN9hwLj+SXRGcLra8gbzi+bvyeubfh7Lg=; b=nRLiwtdIuuyheC5016DRZli27i
	ARKADtuKCuZeU/npXrax+bMOC/mLdQlejNmrJ0gitrGoOEeIH8fpXGrNr2G74A8zWjhiXSyVk7/eQ
	mRm0waGg6KViwYy7IieuMtxSoVKErICbSxwC8izSSRVHL4pnAbgz7d5eCYVJaBjCoSCgzvWxymjHT
	EJByNcHlYCwJK8e4qkcgDEalpXo4eSvu0QL1lwlT2C3OBBEKBu94flfNOuKD6vNYHjDHyGvrv34X9
	5gx96Iw+pEatvIZjQaOJ5kXj/i9rTiKf46HbzJWthAnen2kH6IX9eeDxtnxjDjIYmxE475+cIU5Ax
	ALhNAUeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wywKu-00000001LYC-30BV;
	Tue, 25 Aug 2026 18:57:28 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wywKr-00000001LXp-2HCA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 18:57:26 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2d3b440b97aso22475ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 11:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787684245; x=1788289045; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=re8o97vXXRWN9hwLj+SXRGcLra8gbzi+bvyeubfh7Lg=;
        b=VE9UAnm6DnpIX+pzLrFf4XydNQZ/G+l4DBOM5gxAUw0yvV3+D0JMEWFu4Txd8FJG28
         HrNs4BoAr1cRD2Dw0k0zZdVfrO4K/xdSt32dQTZgapCGiEBpdRIqG4sBti+ocskKsWXE
         PUAin44pxqA/q79MbnC3K0jCKo52argJwm/x17IYNvqrWBUKjx3QDPiY0H87y8iPWEmz
         85NamcxnO604yTjKANZaDAjmBwKWG3g9V+4DRvTlGGHz+aXleBoP+eOSbjnZzzK12OMi
         S5zHGZKwuoeE+YUiXo6gr33ZyjF1kHKTMwMAsLE5S4NDQn3z0odsM+pOd6dcJSFR0c/J
         ZSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787684245; x=1788289045;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=re8o97vXXRWN9hwLj+SXRGcLra8gbzi+bvyeubfh7Lg=;
        b=RnWkkwVH30M3nwphk3HnPgw68D6t1CGaptrTPfXt1blPgRDxfcD4OldM/aCL9rbuS6
         SxrH8C+OjORpHZFc/52f2H5KJXJLo3+AxEMeZrij93vdVVS16Mv7k+d97O5jfMmBu2sQ
         fVUJP3ofLbBfsKY2/2BNwxvTwFnpJuWa55EbcMcvNarOaZA2t77tY8mU+BI9ae0fscgp
         oSO0p4VDeYfCNC4GkMqzynX9d2GvpFUcvUZTbraidepd3E/E1VAAg441Ct/5Kev7Ak/3
         7t88HXGIf8QJqdBJxx34xdDRD2Vw0w66ev/ZwjglKGBtY3ybi2pTWlCbkYC8lEM1wnXe
         LEFQ==
X-Forwarded-Encrypted: i=1; AHgh+RqjLU9BKPaQUyfJVlbC8V+FO5cLrfnF1EvwTMDv63NiSPa6sxPnOkbArI+o9y25kEsqbeBUwxqXKiDlrRkM9z6x@lists.infradead.org
X-Gm-Message-State: AFuF++nfdCbs06l137Le4gazH92wDkhLn74G6/7NYwnm6Zs47lYSHxDl
	dWQQkMwKhu/dQ465zcFwiDhbHkAFnocDoObGA44M0wibe1QKCFuZlngZuBI9Y7jyDA==
X-Gm-Gg: AR+sD12AdmbHLZPmz1nxvldW9o9uDx4hby/Foh64C4pmVdu/dVSo4CoJOMgOi3z9yIg
	Ny/7HkxG/yqqmwMPcQkf8ndf74ag1zn9cASK5szbwsGBLe1oD36MOQbTVTmAdzYYA7yp3Wf27CI
	euqv6Cg1OB2KssrED8/k4s484Mqf7UHQ5zrcvUGR/p18fREkT+FQMBtivp4cr8gilpWr8A7PDOF
	h8Ib3Vf9q2YUPaMU+IGNPALQaZOSvfmSd58z3KSBCFVI5xGcpPWiN0mTFODhEVGb5QSaM3dXK9J
	k8hcQ7uZtySeu7z/UIdcNo1omxWzQ/kKBfDU9zLbFriqyo9ZIuH9VXOnNhsoqEcxslH3XNb4VHK
	itmW0VIpELg7D2cKYa68nbuI6hKHqvm8Egx9wdsHPgwGP9lh3bzL7qnqk3dXfr62uHA0aKr7DlX
	QICcG5d+kU0AvIRGvQZKAKZTse7z7r8eMUtPbnmBYz776NdWwFNWVR+0Ms+0kPRxSABRqdsbG4E
	8SXNymkXkaIf8WwHv3owv5+Lw==
X-Received: by 2002:a17:903:174e:b0:2c7:9e6a:1a8d with SMTP id d9443c01a7336-2d6e0729be5mr10497505ad.12.1787684244127;
        Tue, 25 Aug 2026 11:57:24 -0700 (PDT)
Received: from google.com (164.210.142.34.bc.googleusercontent.com. [34.142.210.164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b3ab63sm4732888a91.7.2026.08.25.11.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 11:57:23 -0700 (PDT)
Date: Tue, 25 Aug 2026 18:57:18 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, iommu@lists.linux.dev,
	Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 02/12] iommu/arm-smmu-v3: Add a helper to drain cmd
 queues
Message-ID: <ao3ljjiXhnSJte5A@google.com>
References: <20260728210928.1050849-1-praan@google.com>
 <20260728210928.1050849-3-praan@google.com>
 <178767577112.3356902.15184998673790345568.b4-review@b4>
 <ao3S5ickm47p1QWa@google.com>
 <ao3dBm1CtH2V06r1@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ao3dBm1CtH2V06r1@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_115725_606880_2F72F431 
X-CRM114-Status: GOOD (  24.34  )
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

On Tue, Aug 25, 2026 at 11:20:54AM -0700, Nicolin Chen wrote:
> On Tue, Aug 25, 2026 at 05:37:42PM +0000, Pranjal Shrivastava wrote:
> > On Tue, Aug 25, 2026 at 01:36:11PM -0300, Jason Gunthorpe wrote:
> > > > [ ... 36 lines skipped ... ]
> > > > +		if (queue_empty(llq))
> > > 
> > >  [Severity: High]
> > >  Does polling for an empty CMDQ actually guarantee that commands have completed?
> > > 
> > >  queue_empty() relies on the SMMU consumer register equaling the producer
> > >  pointer. However, for CMD_SYNC, the SMMU advances the consumer register
> > >  immediately upon consumption, not upon completion. Suspending the SMMU while
> > >  commands like ATC_INV are still in-flight could abort them, leaving stale
> > >  translations in the device ATC and causing submitters to time out.
> > > 
> > > This seems broadly wrong, but it doesn't seem explained very well,
> > > maybe put a comment above the function something like
> > > 
> > >  The caller must have ensured that no concurrent command submission
> > >  can happen. Thus the entry at the PROD must be a CMD_SYNC due to how
> > >  all submitters generate commands. Waiting for PROD==CONS guarentees
> > >  completion of the sync and all prior work and thus idle HW.
> > > 
> > > I don't think the other substantive remarks are valid.
> > > 
> > > The Werror thing is right, every patch should compile alone without
> > > warnings. Sometimes people add __maybe_unused to accomplish this..
> > >
> > 
> > Ack. I plan to add __maybe_unused here.
> 
> Maybe it's time to use the shared helper in both of our series?
> 
> I plan to send PRI-v3 on rc1 (likely next week) with this:
> https://github.com/nicolinc/iommufd/commit/d10325ff40fd45c476bc98d484d8dd2cdc7fdf95
> 
> I think this series can take it (and its parent Q_POS as well),
> as we discussed in the other mail.
> 

Ack. I agree, I can pick up Q_POS & the common drain helper here.

> Nicolin

Thanks,
Praan

