Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AABC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 14:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TSUEMARjEssv0eA3Si6cabXSmTd2euFRyWUa/d4nP9o=; b=pheNQ8gBNxDeFCpzxbD0fiKpPN
	uUomkxo3wXxt5mcLL8qcshy4XYRsju/vzyF5gpDdJ32/juGDg9dYO6X9AbhAXK4lS6ojwDCY8Dy2+
	8VmDFZwqomMNYhYLlMbKKXnZfsuL81nfP6CH4OkSTIe/D8CXqXOY+2TwxjcCKB3orjwqm3FtH+fSJ
	nGcD3PNNXzcXKaSbsnAkJsfpF48RLoXFKufax1o/lQLC5bO+A3FyulRFUPz2LAjlM2RfYQEmSIL3B
	0kerjdndOtn2RKoxVCJzN2KovCrX3TPgBQ7Nw/Wh2XlL9Scni00oVeYaVzTWJ6D1ZkLfdqsQyQh8d
	CUHu5zAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzERs-00000002aKI-2ZmA;
	Wed, 26 Aug 2026 14:17:52 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzERp-00000002aIs-3UsT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 14:17:51 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2cede6375caso125375ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 07:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787753869; x=1788358669; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TSUEMARjEssv0eA3Si6cabXSmTd2euFRyWUa/d4nP9o=;
        b=Eq1eG7zEBlSMXAYASfocT+57IW+fXNOw3EyQz8s/VFHAosE+QrQat86Oju0OxgCdtK
         +ahUZ85HtenueZXYPtKxZBOJrTXL4xSkgpmVNlqkHPeQGcnQoY+pPfWnk/wLIppLHFsw
         cEDlSKDRSyL4ofeZby9E47rOB/1yt43rr5Jrt7KuoF2mEfHbYHfX6r33xKbsk8BJkCg2
         Mr/DrMyeOSRXUNM0Ook+B/bbqyWCKyC7I59bQS1gOZCCjHC0PuxkxB1E1aS1XYXIkvjg
         7Ag8QrcDnDxTOI8Z+1bNc8RXBrbPlWbT6UifK1w+Deewb+hRsfpZ35o91OcE5qu97Ikl
         5PZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787753869; x=1788358669;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TSUEMARjEssv0eA3Si6cabXSmTd2euFRyWUa/d4nP9o=;
        b=OcQPRIk6A86VN6G6rkB/g82y7rdHlkOA5SLlqRAEhx9AVKdqi+pzFnj1O3yiDtXSjM
         497BWOvi0HiBzeLz/kJj3Zb4G4NLfirj82bXiUdoQBmDptMg/KoJ6Cv4RMGI7mIbdAQH
         V3voDEE+sRASIBf9mP5ztAxaN0MJeFW6/CRGstjnBFuUa4iviKgl3QMrfEWTm9mxhuMz
         MYE1IvoEctpeUzjkh1mQ6TJGBCrN1+rqVhvXGqHqZELgHZ4Z+y1UjIdI9s/2oSV4tz2l
         jkEetYuhRi5HuMeoso7tBDT+sg+DFWCPpu/HEywqoDHzful+babwOU8op3huO0atn8uz
         FdUQ==
X-Forwarded-Encrypted: i=1; AHgh+RpYuze565tMZAboGfhSCYVLlK8xZU4ZA1/GRTloGM1NZD8x/7j1nC85kCBllBllIfidhUKE0+XNCGahLerKvBKH@lists.infradead.org
X-Gm-Message-State: AFuF++myLu7rPwTL6ID6+gl1wfSKizCVxYuS51MZg9NunzzUIQEz2bgt
	iYsJOZ0uiDUdbRliOUPCb2FAcNQY75fqpZGTB4TTXwliBpPtI3IRl68UKMRfxQ68Jg==
X-Gm-Gg: AR+sD13RNK5uk4+1FJoJBhLD/pbyNHknAAkJxF6P9u5HdQUOOzrJwtq3I1C3y/W/EuV
	NIGrjOdz1U/p8W8UDLp9mvjty2HkhgSijzTuS1EMs0moWXXQ7yDv/QAph2og8cqH3qM5tvgvE/M
	8NdZZmdjPt3lf1FeybdTjTnl8t2Jd5WaAwFUHvDxxCcZ56dRtTv+JNPfEnCS5zLZTPXX0K38e4k
	zIaycAyiiGvztEwtlFo9VqEb2TU3EJy64DN90hv9thz2jQnjW812Se8njpymp1OUedqHwla2gDO
	EpvnTxG/3c/2/uYeqa2tpAdyCSWbwAeZrUAxjYjUcFhbCV8mQSsAAaIpgEfEaczZqLKoNY9sKHs
	BsK/SPebGkHlKpnGoIlpq05N0anEQIZEvooBu8QUkCn8vYq6yIIk88kznebT7FLEa63EV3j5UIH
	/ccM1EYVUwn7NqMEU+eTHixSWfKYajQn2s8XuPpRmv7LaKYDHQuQtVy/IBQHoaLvJsZzz7sSPoN
	GNHXS77yq6szfkZ7Q3n9yZgxg==
X-Received: by 2002:a17:903:2301:b0:2d5:db3d:1a42 with SMTP id d9443c01a7336-2d710527a15mr4277565ad.15.1787753868133;
        Wed, 26 Aug 2026 07:17:48 -0700 (PDT)
Received: from google.com (164.210.142.34.bc.googleusercontent.com. [34.142.210.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d704ba9a82sm8335085ad.48.2026.08.26.07.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 07:17:47 -0700 (PDT)
Date: Wed, 26 Aug 2026 14:17:42 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Daniel Mentz <danielmentz@google.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 09/12] iommu/arm-smmu-v3: Implement pm_runtime &
 system sleep ops
Message-ID: <ao71hvT6ENJf6kSy@google.com>
References: <20260728210928.1050849-1-praan@google.com>
 <20260728210928.1050849-10-praan@google.com>
 <178767577113.3356902.28128835506777632.b4-review@b4>
 <ao3kxwbwB9GC3EOM@google.com>
 <20260825201701.GG3325090@nvidia.com>
 <ao7TU2QSprRbGfEC@google.com>
 <20260826134757.GK3325090@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826134757.GK3325090@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_071750_241664_67965053 
X-CRM114-Status: GOOD (  26.64  )
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

On Wed, Aug 26, 2026 at 10:47:57AM -0300, Jason Gunthorpe wrote:
> On Wed, Aug 26, 2026 at 11:51:47AM +0000, Pranjal Shrivastava wrote:
> > On Tue, Aug 25, 2026 at 05:17:01PM -0300, Jason Gunthorpe wrote:
> > > On Tue, Aug 25, 2026 at 06:53:59PM +0000, Pranjal Shrivastava wrote:
> > > 
> > > > > I agree.. I think there are only two options?
> > > > >  1) After GBPA=Abort ATS requests are blocked, so you could full
> > > > >     invalidate all the device ATC's and now it is safe to ignore
> > > > >     ATC_INV
> > > > >  2) Just don't perform suspend once ATS is activated
> > > > 
> > > > This is a little tricky, I'm leaning towards 1) since edge devices can
> > > > have ATS enabled
> > > 
> > > Oh really? Surprising..
> > > 
> > > > However, the EP might've entered it's low power state by the time we 
> > > > reach smmu's suspend. I'm not sure if we should be waking up the EP for
> > > > ATC INV All (or if it would even wake up in such a case?)
> > > 
> > > Is its power down explicit? Could the PM stuff trigger wiping the ATC
> > > and blocking DMA for a single device before allowing it to power down?
> > > 
> > 
> > The power down is explicit, due to devlinks, the PCIe driver's suspend
> > op (runtime / system) is called before the SMMU's suspend. I'm relying
> > on PCIe driver's op to clear ATC and everything else before powering down 
> 
> So maybe everything is OK and it just need some commenting to define
> this split up?
> 

Yes, we can add a comment and a small dev_warn when ATS is enabled with
rpm clearly mentioning the reason for any unwanted aliasing (if observed)

> IIRC there is a PCI spec thing that says the ATC is cleared on certain
> config cycles?
> 

Yes, IRC, D3Cold would clear everything anyway, and D3Hot -> D0 with
soft-reset also lands in uninitialized. I'd have to check for D3Hot ->
D0 without soft-reset. However, for this discussion I think we agree
hhat it's not the IOMMU's responsibility to handle the PCIe ATC state.

Thanks,
Praan

