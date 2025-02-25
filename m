Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CFCC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 17:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lk6iw51fgW1qWU/03VHRsVVbj/sa5vR8EbwmDP3cjSY=; b=itjJr8sAtQbZmBgNZNGIUlVrTu
	FHaVEhcR3Xq6N/cLFWvjTtwv2mfNNGX8LyxmKiD7Ke7cPSG7L5JtMcvXjj3G1zgRqFbOfGh2WTZnC
	W0TSdLr4GsAPfujt7v9l/fDCI4SRCNdMXuyPX1V1gt7mLa3lKZg01Plr8g9fune9LTE+TQGU9KkTD
	Yp9duHrUEB74h06ASvPBDwDqYm2C7kE3yImD+oN+KIj30ttjyxBRRMa9RPTQ5YW7fCiFXyI89cwBP
	aLtkXPTYlGXVkCC73h3wNeL4lMDDuQIkuF5HT+h8rGwk/Ss3fqcZCgGW2s0eq6NHwdfdiGqR8+4bh
	4oYb7b8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyLH-00000000WOQ-2O1p;
	Tue, 25 Feb 2025 17:03:35 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy8y-00000000Sjb-0veY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 16:50:53 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-22117c396baso196005ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 08:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740502251; x=1741107051; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lk6iw51fgW1qWU/03VHRsVVbj/sa5vR8EbwmDP3cjSY=;
        b=Wg3m73XLpH8washX10RkFgpk2G2X8ESzmtce5YY7RXW/gPpTVykcsc+J3zcl1jVqNj
         8oeM4dOBNUGxaQgO0HPG9/JWITQvJ08oV6Jp+w14n0P8BjRCoi8EKvWjdAcGS2k59qtl
         017EXNwFBao3KxTnd0rH1Pk1xRjEq+WrQojg2shsaUQtQ01mwnfs7E62FFQ3Pj/JTjK4
         aRlt4zd8oZwvkkaaQHCB/QNluw7dOZTDWugxCyuYZ44PgOtJw/HelmB+nxviuqykh3S4
         egL+YAY6MHTR2wjua4lZI9BNdFiXFBhKg74sNz/Cn6du9Ndi1mxokrR7KFD5DU+wbxKc
         VU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740502251; x=1741107051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lk6iw51fgW1qWU/03VHRsVVbj/sa5vR8EbwmDP3cjSY=;
        b=ELEpTyv0sBQXkTPCnzyxNHiIwlxEKR8++rqFAvPzDBQSMoc20do5Db9PBaHhL72+xC
         f1fLhLNSQGMl4gGQE+BuVFzGhlFMmSD8HuRYP28yJjvp8somchueIN6+4vfVR0Zh/yjq
         YDP4zzlCELmTyf/Y5Ba0FIh2nEiai5ltRYBeHZMroZSvLoHlp40lSUUtsF2WrbWROvVC
         YFPKg0vf4f+A+Cw31aWpGyZXZh97X+n5T5jHkiBdz7o5doHkQUyhI7hd0abYyp4dJ880
         1DUd6fIEmML7VnPiZmQQWOVGPEYr0RYIh5j1Dy00cJb93thXG6L2PZptj53gbD+IV357
         IlZg==
X-Forwarded-Encrypted: i=1; AJvYcCVm1AeMTcuM/tr3dQf/7wbcB3W3BWiaHj+5jIXhrpXpOIGyU+s1h/um1d7sneqUsMz9FniLZ3LCcerVhCuDjpoV@lists.infradead.org
X-Gm-Message-State: AOJu0Yzbx/hYMoWcDos45UosTzvzxA3uJE0e+mCCL1thi2w1am8Ywqfr
	bZuU9VM27tHxzjAqRAnuPqxtXw+EuSbrZC1GB+Kf0GIeVPcf2i50oxnq5XZx5w==
X-Gm-Gg: ASbGncue365Up6ToDj5lZKnBcHFSkabsVELvpl5J86dmDckhyGk0QHMk3CdiZXBPlQi
	rP0AhJ2mhD/OAF8+xRX0R0hfJIcRp10zLe3rxJa9NsLuolK1QHsnnUxzS+BufkoR3DW7lnjQTgv
	vE5gLzNRjOGwCVdmh+WXonLIxKJkTYga8ml8QrdaGnuSTFwttUYRBdsIM/6DLrVhs1qLU7Ubd3a
	pZ2utqbdgBoQM2/9vrGL8OjYMZaJ+QvzSe+n08pTK5qR7FoyMcRLAP0VsI/sn4RJGrmBm7wRHE1
	oKm+PaawltPtWayGASoWn9YQ9ZWM8iSox8cP6xpoHNYnbuahwJ2lhx+8cQlXQ44=
X-Google-Smtp-Source: AGHT+IERMuVCVd7U6MTOmNpPqxv55xXM3OvnM1bfuQpjOxFQC3PAJTJoQU8Phr6vdg5p0sFS6cHxBQ==
X-Received: by 2002:a17:902:fc8f:b0:215:42a3:e844 with SMTP id d9443c01a7336-22307a60a10mr3635965ad.17.1740502251142;
        Tue, 25 Feb 2025 08:50:51 -0800 (PST)
Received: from google.com (169.224.198.35.bc.googleusercontent.com. [35.198.224.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81eb0dsm1772166b3a.141.2025.02.25.08.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 08:50:50 -0800 (PST)
Date: Tue, 25 Feb 2025 16:50:40 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, kevin.tian@intel.com,
	corbet@lwn.net, will@kernel.org, joro@8bytes.org,
	suravee.suthikulpanit@amd.com, robin.murphy@arm.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com, shuah@kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org,
	mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
	smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
	patches@lists.linux.dev
Subject: Re: [PATCH v7 13/14] iommu/arm-smmu-v3: Report events that belong to
 devices attached to vIOMMU
Message-ID: <Z7304KKv2c1pOhj2@google.com>
References: <cover.1740238876.git.nicolinc@nvidia.com>
 <b1930038cf828dc13c080e2b46b3003a8c98ef24.1740238876.git.nicolinc@nvidia.com>
 <Z7zmErar4YvQSSxw@google.com>
 <Z7zrHn3tPBD5chv1@Asurada-Nvidia>
 <20250224233505.GF520155@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224233505.GF520155@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_085052_254313_932C9F1A 
X-CRM114-Status: GOOD (  22.09  )
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

On Mon, Feb 24, 2025 at 07:35:05PM -0400, Jason Gunthorpe wrote:
> On Mon, Feb 24, 2025 at 01:56:46PM -0800, Nicolin Chen wrote:
> 
> > > Just thinking out loud here:
> > > I understand the goal here is to "emulate" an IOMMU. But I'm just
> > > wondering if we could report struct events instead of the raw event?
> > > 
> > > For example, can't we have something like arm_smmu_event here with the
> > > sid changed to vsid? 
> > > 
> > > Are we taking the raw event since we want to keep the `u64 event_data[]`
> > > field within `struct iommufd_vevent` generic to all architectures?
> > 
> > The ABIs for vSMMU are defined in the HW languange, e.g. cmd, ste.
> > Thus, here evt in raw too.
> 
> Right, the point is that it gives as a safe uABI that is effectively
> being managed by ARM.
> 
> If we make our own thing then we have to take the responsiblity to
> make it safe and extensible. I don't see a justification to do that..
> 
> It is the same discussion we had around the vSTE as input, the raw
> invalidation command and the IDRs. Since we've already done 'follow
> the SMMU spec' so many times already now we should keep doing it.

Ack. Undertsood. Thanks for the explanation :)

-Praan

