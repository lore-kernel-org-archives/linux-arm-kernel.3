Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079DEC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 11:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UTrCbBRL6HXb+RuUnBCTW1yY8odSkn59u8nz48f6xs8=; b=fxv0BPG6Ho/FK5n9Q+XpFbBrq6
	4vEp5gZf/5iKa00z/xhog5mVWcLKGX4Z0DcXgK+1fAumTm6jfPcol5qMbWtqji29RWiv2keuM+iCP
	s/SRSNcHbUij2RhKu5/4bp4D38e8/4GPKofHKmxD5MDMHFQyL0gkbON8TETXfxMa1Xt90G8ITZ4o6
	LdaCLAMvreUCA5lJqWtLzmtWYpRpJNT5HxCk3sHBa8KHUUtzGmoi2Io2WrtPrL7l0hSOpc0RxddKl
	jajcrmUYOQUesI1CBt1Vhdka/a7z9Ih2MoASy+MG4NApybNn0VA5Y+Ox4OuMSe6oqirMvPRjm0xNK
	smGImF/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzCAg-00000002NK6-1aZC;
	Wed, 26 Aug 2026 11:51:58 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzCAd-00000002NIr-24z8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 11:51:56 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ccdf36f63dso105755ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 04:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787745114; x=1788349914; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UTrCbBRL6HXb+RuUnBCTW1yY8odSkn59u8nz48f6xs8=;
        b=suWKZMncnQbeBo0dOvgarCppla1uQohadRRHneikfvn5l8M9kRMcyO67PR1oD508UW
         icty5pIueuSc/caYzB89cTGsxSDSeqIBCa1CtpdNO34wFYWJDwRSUEfIAeuhdVwYtG9a
         /HAQxDYNPeE5D4ICxFMr8dL74pFLTtIAdLy76ADqbrPRS3qDZUIJKZmJYJlfmC/JFF41
         /Eg+hXfEZK4C1a6l0EaNST7N2e6xS4OGgbdIP834AzW2v6jwQw1e3khfQ/E3SlVKmB3i
         kYdH58ozcGD8lkcIBou4pgy1z4Nq9CFELEM8MLo10kMPo5RQeUrkdbXMPU3zdxmuYec3
         pPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787745114; x=1788349914;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UTrCbBRL6HXb+RuUnBCTW1yY8odSkn59u8nz48f6xs8=;
        b=NsQ7EQ9mZQEG2LxnN1TlTYaMGRJTv+AKzPUJKJAZkkkh9rnouCAp9TvOn3wUKFdYhV
         qTbMVN6eMEO4FsUc8GhwFe6yqa2u7rekwyJXIl1+mm7LCmWBwnnG2QdNtKmDgKDNll/J
         6bmXvD4sOGg2aNPI7M/cc9zQ3SEtZnFBfFVKAKKn+cFNicmKgYpFwxUQFMt5g9L9t8DT
         jrq2hfcjdz90e9H228ixGyeml7l63AfOAqUfqSeLKgS5Fu/4k5//6xBjaLH5brneGeir
         lQqXORgi23e2WF+3mnNxHca+bJ8pvc1wc8SXS1POWen+G75HbeAeebGldtN0NbRaFWFx
         8NGg==
X-Forwarded-Encrypted: i=1; AHgh+RoAZ1/TcXbMegbgtBiAKmz2kKvSK3bymzcrzSU7SVLSL/ct/+y8P3AG8hu7/alTa9ZFWiz+sFc9S1arYQ1QKvFC@lists.infradead.org
X-Gm-Message-State: AFuF++nkIbAie+CvE5JtpoYoc7y/l0suebNI4662zkcok3dG+MTLFMTQ
	NwHDQfxpn4B1s8F/dtJshLWK8+v9hhm2rDVBPUuPx/czh8yJK/OMSOJ7LHESB4ydqA==
X-Gm-Gg: AR+sD122D2EQu1YFi6wwPe8rYEXxs3MKvpy2ze2zgEIHto1SVL5/rbNMvx3fvOcdh3n
	WgUhIb2JSoV2h91KrXbTLUCvIhCFE5gcKx2wwTMtsfQjmiP5sAag4ntyG1OvlChan/nX90IsUKC
	8tlxY7FFDviW94AQu4FBoHgwr+CMC2KNEpRzSDDI7injQKJLi/hVZ4Zfw1tbwNMWOJ4lTNS5rBq
	Ozw9l1hf48TnVX0EEDfH5v0+NT294oCtJ2D71ziyGNjkj0oREEShDvu7GGXkKLW1J1KTMZqXNn4
	gBTV+T4VDARRTWxvNxvpaK/zt372YnaG7G8x/BesX6JGsgfg6Dt0ZQq6UaNjz37b1olH9G0NMYJ
	xVueSWYyi5Sk+YW9BiZoLtwmcUzv+4Ty2NCWG1zfYvOJfJZmMytGiLUU/4w/eNUpOPtmoKsZsTd
	HUn1JW6lkhNDw2oRurhOvEA1gzaT/pOZRkVmLMQij8Dgh5GKDKGXFZ423+3dAIfZ+t+IJYjL8U+
	VRrk1iGZDV/0jVGo49P+YkSwg==
X-Received: by 2002:a17:903:1106:b0:2d1:1d3d:97c3 with SMTP id d9443c01a7336-2d71052c89dmr3015365ad.13.1787745113926;
        Wed, 26 Aug 2026 04:51:53 -0700 (PDT)
Received: from google.com (164.210.142.34.bc.googleusercontent.com. [34.142.210.164])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8535cd86fe3sm790578b3a.39.2026.08.26.04.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:51:53 -0700 (PDT)
Date: Wed, 26 Aug 2026 11:51:47 +0000
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
Message-ID: <ao7TU2QSprRbGfEC@google.com>
References: <20260728210928.1050849-1-praan@google.com>
 <20260728210928.1050849-10-praan@google.com>
 <178767577113.3356902.28128835506777632.b4-review@b4>
 <ao3kxwbwB9GC3EOM@google.com>
 <20260825201701.GG3325090@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825201701.GG3325090@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_045155_925563_419025D4 
X-CRM114-Status: GOOD (  23.75  )
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

On Tue, Aug 25, 2026 at 05:17:01PM -0300, Jason Gunthorpe wrote:
> On Tue, Aug 25, 2026 at 06:53:59PM +0000, Pranjal Shrivastava wrote:
> 
> > > I agree.. I think there are only two options?
> > >  1) After GBPA=Abort ATS requests are blocked, so you could full
> > >     invalidate all the device ATC's and now it is safe to ignore
> > >     ATC_INV
> > >  2) Just don't perform suspend once ATS is activated
> > 
> > This is a little tricky, I'm leaning towards 1) since edge devices can
> > have ATS enabled
> 
> Oh really? Surprising..
> 
> > However, the EP might've entered it's low power state by the time we 
> > reach smmu's suspend. I'm not sure if we should be waking up the EP for
> > ATC INV All (or if it would even wake up in such a case?)
> 
> Is its power down explicit? Could the PM stuff trigger wiping the ATC
> and blocking DMA for a single device before allowing it to power down?
> 

The power down is explicit, due to devlinks, the PCIe driver's suspend
op (runtime / system) is called before the SMMU's suspend. I'm relying
on PCIe driver's op to clear ATC and everything else before powering down 

Basically, what I mean is it should be the PCIe device's responsibility
to clear ATC in this case because by the time we come to IOMMU's
suspend, the PCIe device would be powered down anyway and I'm not sure
if issuing an ATS INV request TLP would wake up the endpoint.

IIUC, if the link is in L1 / L2 then TLP tranmission is disabled, and to
bring it back to L0 we might have to call into the PCIe subsystem
*somehow*.

One thing we can do is shout in the dmesg with a dev_warn if rpm & ATS
both are enabled saying the PCIe driver is responsible for clearing out
it's ATC during suspend since SMMU's suspend runs after the dev is down.

Thanks,
Praan

