Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82834C982C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 16:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pcP+4eU1/beEFYbRmgIPFAGcmsIIEUp/fpCxORq8Ok0=; b=OjVpwRK2U7nltb0hmMig9NciJF
	5lyzrKDlbbx6xSvszXhl4LQ110EQ4dKDutqAm7PXXK4L0zvPrLByC6FjF0RP1puc+8d7ZXg4Y9qTS
	ewla/phQodHwpJ9QbU8PIf837wH6GRhqFeKCCQWCsGZrbp+l+KUgm5FcSGdWIveJtjiDo7Eqwwcop
	cfp4xn97JVrFYwj6QKpyU0xJb68DfoGq0ES1RjKcEMEiUxWSQXWJjEaqoAfaKiMHbe6uSN/wXM7F5
	h3P1xJDhtxY2di5JdrwCb0st7/faVXTgvrjdR7dL2RJgdUYx3o/3IvZjjAgdyFlL+zDf0/2k2xLdC
	iXGD+6Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6sDI-00000009hMB-1qRV;
	Wed, 16 Sep 2026 16:10:24 +0000
Received: from mail-qk2-x10.google.com ([2607:f8b0:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6sDG-00000009hLX-01WJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 16:10:23 +0000
Received: by mail-qk2-x10.google.com with SMTP id af79cd13be357-93910a0cb7aso97179985a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 09:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789575020; x=1790179820; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pcP+4eU1/beEFYbRmgIPFAGcmsIIEUp/fpCxORq8Ok0=;
        b=MZW9RY9psNea1fbkgJy/uJ3v7yi7mMzWDdHl9zIlo6LctsPvleN3del7JVk7c64EKO
         5CqG3LxpNuaqbEWA1s0qYXUTpVOXI5AQWwl8NM1U0lBpr7yW+xCf263TayA34dcMu69H
         l0kiF5mJX61LvqbpUAJh9xoEgaG7L4jWaXJHDrdueiN0Gi7NY6k0fdoN0KO3A0BoVgNQ
         YMmZdCNqQljDPjAlIQBm5/5Xb8Zxq2TGjH39bGcXHkwo/gsjZ58+p+6tq44VYTNnV61x
         RXlbgittWPjbK46d67X+XWNwLr0BHpAX92Mf/o48pxt8HkLG4Rxt/6bmQ8LeDRmAsA94
         rrXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789575020; x=1790179820;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pcP+4eU1/beEFYbRmgIPFAGcmsIIEUp/fpCxORq8Ok0=;
        b=PXbAaxMRndlE6FgDkQ+xZl09Miz55OznlqAI1aT5LY66TNt1s4ncWXn/asH+VC6I7c
         y/BwXTabpFC2xyuu6Hhm/U6IoGQVWoxSLvK18UnWWSmKk0lk24s3jmc6EzAAgeK1OVaB
         RBqH6NB3fPMhz1axvwNNWqxap15sfWlEh7t17AqrnAt9YnrFjnqh90ZFmYgJ/OMS5eh8
         xc377kWxaYKA4Rb8ySwGd5FsKzXhTWnUv9/8yba5+FJpp0AEVRx+eacpbVJZBXtagYiH
         Kaj08aa8EmHNN2Y/x2oir3O2WAY1qllJ+jJ2ZESyzc7pQBFfo9il0cLmbZryumzOcCHH
         S89g==
X-Forwarded-Encrypted: i=1; AKwUvBxWYQ8DcH2lmvyw7kFnOBltZmENb+mF+g0C7lWIJnCEbCMmPrdS9vQiIb0hxv/Bm/OohXDlrSlMups/sZQ9GcXA@lists.infradead.org
X-Gm-Message-State: AFuF++llGLfzo10OWGk9ZT+BXm5IgCC2EIE+VIaMvoX5sZEB1k6yWwlR
	I6ITISAtZPMSwGjSQkzGVqS6ha85laUUj8xfFTdtbYBVEmS++7cCEo2EVr7jPbnBUwI=
X-Gm-Gg: AYBFou1iia2/XhM1pM4L9z4N5/9YPpbnF47oesW4aEP8F/HiYghDNo1YP+wvwjD9Iev
	RUQxTBr5VrLzFcO+C0UO5dCeNPF1BjGti9Oy25oIngHpDIy8WRoDw7oJsScc+0SKMaCk9E5tcUl
	03hhkFmGmW9qFOpsJ6/DcLpcp3Qx/Oei4ZNPpxTQMDgE1pR8RJUCEUJGa+glVa1cE9W0KQTLiOn
	X9zFNntj5jXOIniPk1RB6IVtfPGjwjrztaVKRd2YOSwbjoPkPAYruPbY0yPkObeI0YjXJdTT10U
	dAmAJxpjPI3Ygxu274h6/FDrz+t1OeFGGmybfTsgC4tHzZlx5/zY8g7D1Y66FYelAAW0DFU81/A
	7xwZAUFLUo1p1LcI19/uGnm8gsvSN5+2f6EEjJwnpiCoyAUu05ehwqS3jcrr1br2kHa5WzMVSjS
	bEQGuuDmyLYhf878LDpRRssnC/66Kkbj4mP2JKGQVVT5vIsrkTbfqc73IDKWXDN1SRVlIfnWjRj
	db3sNpWOtEbfE4OLQiIkFbq+geXSxEt03dtfaRMcYZNwfu19Ewi+B/saA==
X-Received: by 2002:a05:620a:640b:b0:93a:344e:3d3d with SMTP id af79cd13be357-93bb7952c30mr495951685a.42.1789575019764;
        Wed, 16 Sep 2026 09:10:19 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b81d19df1sm251902985a.45.2026.09.16.09.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:10:19 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x6sDC-00000009bqL-1M2P;
	Wed, 16 Sep 2026 13:10:18 -0300
Date: Wed, 16 Sep 2026 13:10:18 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC 0/4] iommu/arm-smmu-v3: Support shared Stream IDs
Message-ID: <20260916161018.GE3196566@ziepe.ca>
References: <20260916-smmu-shared-sid-v1-0-517384504aee@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-smmu-shared-sid-v1-0-517384504aee@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_091022_047240_8D6EE2B1 
X-CRM114-Status: UNSURE (   9.84  )
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

On Wed, Sep 16, 2026 at 11:12:33PM +0800, Peng Fan (OSS) wrote:
> Some SoCs have a limited number of IOMMU Stream IDs (SIDs) and
> hardware that inherently shares them. For example, the NXP i.MX95
> eDMA controller has 64 channels where each TX/RX pair is assigned
> a single SID by the hardware - the two channel devices are distinct
> from Linux's perspective but present the same SID to the SMMU.

Is that a reflection of poor DT modelling though?

Why must a TX/RX *PAIR* have two platform_devices nodes?

Fix it there and you don't need any of this? Or is there more?

Jason

