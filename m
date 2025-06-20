Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DFDC7115D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 17:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uJYXWxLY4HLgWwCr48sF3PGs/sRochGTLyGIU3biNNU=; b=tKcxDlu1SeTOYJln/2/F7Zh7+r
	kPOt2eLWC4d62KVDXJvysSeP7aWFvJO/fRvNAON6TH5en4yxHqg3z303vfkp1fROFach18k0nKMHG
	RjpeXX1hU8Ye5xYMdFyjgUaPtH6qTy3qfZxAYbJJclfF1xi1PlcPMV2inTL60L9npwTMVys+DhHVI
	5sm1qaLJUEntatruIfkAf+nPQpOUoLf0N7CWdM+KyRwzc2WClw3Jhqg2OCeDRywInpez7tJDGx6EG
	rbWnul1+VQlilsSc0WA8oJRssPgz2FQUsUVhpMi4q5YhwoC9sjO3mTJclylLg7p57J2DniXjrRQIL
	o8Uo0olA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSfFW-0000000GCfO-0UPO;
	Fri, 20 Jun 2025 17:09:58 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSeiv-0000000G9GT-1NsD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 16:36:19 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6fd0a7d3949so17075146d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 09:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750437376; x=1751042176; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uJYXWxLY4HLgWwCr48sF3PGs/sRochGTLyGIU3biNNU=;
        b=E4CG5GxiVLgNKnwD2b5kKyw5K2jaoHQRztfBhMQ3zmZN4vaibk+iQk1QQVZOqyvO0W
         NZRX3PilzQu6adcBKp9H2jMbGNDB97YdD9nUM30J88E0jtEF8kapTNjzWVE7oxJDIWde
         ppcgotxgEzimhR2EdbMrl3DLtYM6DDsUoORdci1mAMKY64lxY714o1ApfBJBnS+WHwyC
         SOgKIwIl5JIWHxJVPRM7eIUOznaDaQVDUIu73mZMxPlD5+gCnkbEBaRgqU/06/k1kNOz
         eRZWtV5xjvM09pWMuORmmldAOgncL2RlWGavc1vI9nZePMS+QY2hmPxk3OjgWN/rerq0
         ZQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750437376; x=1751042176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJYXWxLY4HLgWwCr48sF3PGs/sRochGTLyGIU3biNNU=;
        b=kIRo1WqtPBfjiLEREzLNNAoKngOQYVDZmgSq1wP2e3+kwMT3ckYD/IZtphcFMbSUxz
         x8PNx/XP5AybfHyyszlKR0tnlArAmyGO1rMAY/d7ZWJn4M8NG2aBfBPWlPYWu/OPSyo3
         yAVzILLcNoI7fY6j896kkrFMtRZl8R5NIMuM5YwDhyNWjV1YXpCkQdE7qEpuZ8q/e1x7
         IdADNgkZ6hXhuAxi7rp9iARA+x1fwzYK0sOA+FsAM4Zw5RgPW54ZFTBFgbALfZMF5CYZ
         KWG2gBYDLS/hwJlRZ/QsUVDGijne19kV+ywrdV2lYmtS/UB5UGryDtFYq2NepBuDwsoa
         aYIg==
X-Forwarded-Encrypted: i=1; AJvYcCXtFpBNxHIHu56f8MZY/8qcQuligNnSTobWzVjleBcBzsX5vp8vP89R3qwaNn9zRZyhfYjYQKJ/RWw/zxYrClqC@lists.infradead.org
X-Gm-Message-State: AOJu0YyWa66a4EqB1ydK8Wb8c9JA1o6aex7E8NJRSkhldEREl3SElaDy
	eGB7jU3Fhn9FwzN7PQod3EG+0t0E497JKzygkzo/G5MNHcyD3+KKU5L2AYWILQuVmYaLZcaNM2y
	HIZYW
X-Gm-Gg: ASbGncsOOf5Vq0YXWBHKL7BCXT+w70+CyoVCFkXnefFFyi/KhObZviTiCcEliLz3C2d
	X11DRUk7lnQ79IW4sJeDWW9qZPAEvmj8pYTPCVKg5a80PXi9EL3hK2+HkxBpdOJqmdSqeeaSC0S
	aE9gT84wBRbZXzE25w44I7LuKxWMcAoLUB5sIrlbK/vKmPouQedg3TJkbWSpLfNQFZdgN1wvCfg
	YlRZKiLMoXbYCxMlVCbnFfUxkQNf44Tjmawoks8uJ3KgGOtWTl2HCjKn3cXzs0fKUcemN2UG0Lw
	FWuDohdsdNDOjwLXMWYN5h6kf8PhprTEiMeHQ7xSZrpjNjsxBy7vesiAvyriZHX7dkV4bN73Ftl
	VUe6/YQx+2QMB+XhaSpRovBOjvAAqq0mPD6vbfQ==
X-Google-Smtp-Source: AGHT+IHyontIEkY5vAgGgYhS+U+r5SqIyyHQ9UkviOZGeU6jrV3bzO+5OOnHkugt3y3GJ2IEIkVU5A==
X-Received: by 2002:ad4:5de4:0:b0:6fa:ccb6:602a with SMTP id 6a1803df08f44-6fd0a51b3d7mr63974736d6.20.1750437376130;
        Fri, 20 Jun 2025 09:36:16 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd09596e6bsm13876946d6.100.2025.06.20.09.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 09:36:15 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uSeit-00000000EsP-10Pb;
	Fri, 20 Jun 2025 13:36:15 -0300
Date: Fri, 20 Jun 2025 13:36:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v3 3/5] iommu: Add verisilicon IOMMU driver
Message-ID: <20250620163615.GC39770@ziepe.ca>
References: <20250619131232.69208-1-benjamin.gaignard@collabora.com>
 <20250619131232.69208-4-benjamin.gaignard@collabora.com>
 <20250619134752.GB1643390@ziepe.ca>
 <073ffe14-d631-4a4f-8668-ddeb7d611448@collabora.com>
 <20250619165928.GA10257@ziepe.ca>
 <e034a111-93eb-42e8-a533-46553b4f5588@collabora.com>
 <20250620120509.GA39770@ziepe.ca>
 <d9a1b9ab-b6ab-4364-a1b7-df4debc21bc1@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9a1b9ab-b6ab-4364-a1b7-df4debc21bc1@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_093617_366759_64959D6C 
X-CRM114-Status: GOOD (  12.64  )
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

On Fri, Jun 20, 2025 at 03:52:46PM +0200, Benjamin Gaignard wrote:
> > > vsi_iommu_suspend() and vsi_iommu_resume() will also have to take the lock
> > > before calling vsi_iommu_disable() and vsi_iommu_enable().
> > Yes, if they use iommu->domain that seems good
> > 
> > If the above locking is a problem then I'd use the group mutex instead
> > during resume/suspend. The attach functions are already called with
> > the group mutex held.
> 
> Does group mutex is also called when using vsi_iommu_map or vsi_iommu_unmap ?

No

Jason

