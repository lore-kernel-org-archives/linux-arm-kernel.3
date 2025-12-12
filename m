Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF45D43363
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 06:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tFYcbK7L/fuI/GrrBDZKfrYBdADfjZp9qLIva811S+E=; b=EEZjGkZrUhhoEZPdBKyGt7Xp66
	q1sVK/Z3PdKnd4WmL/U61Vgn7jhTtaILq7pJt9tYSkDkKMRenEcf3nqrB1l0v1Dk0QJ+EjGbNMA4U
	kqktbTFBAJW1QnINPy2edzdv6s+r1pAMMqRYvMbYb99hWyy+wRimZyie3rk2IkJNzJ6X7D3VR3ir/
	PqGI4wNrb04tlCs+PojZY33aGotW4yhbD/IcOjLJQamFUACcU3O8/68m2YuQyGGgXX+oEwcQktT1o
	509pHtbb9scr7UTjoc2sUFzbOfTbBtHqS5DKFIYWsd9oMGINpkviSzsBHFhqItaqfSRqh3MVS/GNL
	AWR2WVeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTwp2-00000000AW9-25yh;
	Fri, 12 Dec 2025 06:40:12 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTwp0-00000000AVj-1Y08
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 06:40:11 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-29d7b019e0eso11873455ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 22:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1765521609; x=1766126409; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tFYcbK7L/fuI/GrrBDZKfrYBdADfjZp9qLIva811S+E=;
        b=aMu+x9+LSBWhnOirrDCqk7/v37pTEsg/wGwFJPIgJwHUB9pNK7z3ajVl9y+FAJeoD5
         YpRpoqsNGoQOHBGB5QVKjvCUYmjZw61+/pOnitU3boiE5uE/HQOMVnGVhQSQ8qOFwoWt
         7xO5TeewSdmkp1d5Q+P6wTmmkkYcCCH/OF1wNBtdumAt4Xh8QHffy4+UZra7tHknBwSI
         dNLvuWs6rZl+zBNWXlC1e17fz9eozwULo8ICo2GbFMq+vRQiyuLr6YeG4v2juFPLQ/G8
         508mSO8iEz6fXxOOxwV8X25k4VfhAWE6/CMEkcQ4XFqCayhrtoWXvhOODlaprnAfDV2j
         PKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765521609; x=1766126409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tFYcbK7L/fuI/GrrBDZKfrYBdADfjZp9qLIva811S+E=;
        b=GxmHgli2AQsHeV5K9WU8ICX4xQ2fNqFTKJgmJ2Lw4ExL+cV410sjn06bZ1NDOhfnYy
         uYwfTY98MTfiRlXCUsB+t5u1lrV1EGhY7JXS3ADahZ/rK05uH/hcFP/NvglOtJmJtYGL
         B/e6QSjfAVlCgpk3286RtIynlrimQha7SgR5CHAWBgoVR92N+23YwLU32OPEjfE4v3as
         R8ltCGmrZ8Vo8xLXK/mqQWHjc4qAtraT++s37eOt/47PptfVGWfsGbvWqUoP0sJy0Y6Q
         GR8y9LxqAW9t/bG3dPWyKcCWNE+8eBwlR5N4K3Kg7cKgw/zu+Ul09jPBJqmiRqLtkZCx
         n08Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3m/KakSPrB8X/eywgfBwRctQw+xXHtyecSsf4+xOhQyg8yIEH8teNcHAwMe/I237DtIibxh28xXgSZkYG1nez@lists.infradead.org
X-Gm-Message-State: AOJu0YzrPOzzaLPxPogC7hkpeqfG/3xhEO1YOpGVMbeCux1/xZe9qQH4
	QEy1zJXoudK5Pl00EDwbliV+QPjPJKSUrRedGwxy+iegAUBLmvpcv2gEl1wlPPndQjk=
X-Gm-Gg: AY/fxX5PQK/9t//d1zRSvI5g5WlIPXQEMm5sAFTSHS/8d7iU/p7vzsaPfdHNAAVDSUF
	7aUzN0bt+xKn+u8qVJWNw6iluNsiIgJhRPbZyuZLKsX/Hi0oIIY2Gk9rrBttqm6UsmUnh21pVX2
	AvEXm+bgp+lxP+D+HCSDVz8n5HhArTpIkLwPw0/eK0vWrirC677EOhVGB7HSa1UYPS5vqgBuKrz
	thzmOvwqgrKdZQ7VYVhx+5DRm4hrQJDkoX5HZbdvO9xJtnvIL4LF7VL6pu+dy5GPSoSScqH2aMk
	Qzaf3lybkR54jdG3q0iXdsOHqkluKmTPa0bUs9xe8kg8Q2v02ltIcnxxbY01MuJMIc46r+WMJ5q
	n9ETN228r+veZI45KjdXwhU2KdWrXD8RtWXjrkV12A6z7k/XsdRMJaR57nB2aHJI4IsKgjiLSf9
	TB8MqZPRUg
X-Google-Smtp-Source: AGHT+IEPSya2f7Y38TleFBqEbmC5+occ+9/MQpEFnHQbgbfijsnQIDud3+WhbafaLoWO/lNjTfvRdg==
X-Received: by 2002:a17:902:d508:b0:295:4d62:61a9 with SMTP id d9443c01a7336-29f23c677d7mr12001705ad.38.1765521609158;
        Thu, 11 Dec 2025 22:40:09 -0800 (PST)
Received: from ziepe.ca (p99249-ipoefx.ipoe.ocn.ne.jp. [153.246.134.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9d38adcsm43786595ad.30.2025.12.11.22.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 22:40:08 -0800 (PST)
Received: from jgg by jggl with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1vTwow-0001v7-37;
	Fri, 12 Dec 2025 02:40:06 -0400
Date: Fri, 12 Dec 2025 02:40:06 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nirmoy Das <nirmoyd@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	nicolinc@nvidia.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] iommu/arm-smmu-v3: Allow stream ID sharing for
 devices behind PCIe-to-PCI bridges
Message-ID: <aTu4xsAApNupRGYC@ziepe.ca>
References: <20251211133933.4128100-1-nirmoyd@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211133933.4128100-1-nirmoyd@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_224010_410523_F8A7A75F 
X-CRM114-Status: GOOD (  11.28  )
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

On Thu, Dec 11, 2025 at 05:39:33AM -0800, Nirmoy Das wrote:
> ASPEED BMC controllers have VGA and USB functions behind a PCIe-to-PCI
> bridge that causes them to share the same stream ID:
> 
>   \-[0005:e0]---00.0-[e1-e2]----00.0-[e2]--+-00.0  ASPEED Graphics Family
>                                            \-02.0  ASPEED USB Controller
> 
> Both devices get stream ID(0x5e200) due to bridge aliasing. Currently this
> USB controller gets rejected with "Aliasing StreamID unsupported", causing
> USB timeout errors. Allow stream ID sharing when both devices are on
> the same bus behind a PCIe-to-PCI bridge to fix this issue.

I don't think this is right, if you actually need stream ID sharing
then I seem to recall the driver needs more changes. We don't want
this in general.

IMHO ASPEED has wrong PCI config space and there isn't any actual PCI
bus here that would force RID aliasing to worry about. I suggest going
to ASPEED to find out and confirm that they don't actually share the
RIDs and then let's quirk the PCI devices to disable alias generation
in the first place.

Also, complain to them to fix their config space to report a PCIe bridge
type in future devices. :)

Jason

