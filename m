Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA976CA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 20:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gV7fs5Nei/k8o70WCYEk0VoBwcvkJqHkvDHNbl1vC2Y=; b=3bDjfRUopWxxhqEnaDH2lpNiFH
	6cm6TXRIsrlRUefo9K3oLfEA4PegS++hCWwJg9vwv9o5EYCDo9/z1MUyAEmX4KDrPXinY2JVwBd+6
	3/g1NUYF9CKHO2qGMnhoJGGCl1Rzmvl39+7HVf4JH/RrAgSN+lvDkS0XEgJTmGWe9T/buEYEukYA6
	ScJiOWRrigCowQHy/I/umFifMHymdQP0Lu064p6VN238VAyXwC91E3E5wBcHnM9KnyZVWhwCVipDu
	Y00WwKN0d+iqnCaBIrwpg5wVNyyI+gmuKO50FP7XmdTH811EvdTIr6FH3ruv77oyFg6id+jaLlmAu
	TTg3u4wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC0Wb-000000078TG-23xM;
	Wed, 30 Sep 2026 20:03:33 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC0WY-000000078So-3RV1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 20:03:32 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2e2e4ef20beso18445ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 13:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790798610; x=1791403410; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gV7fs5Nei/k8o70WCYEk0VoBwcvkJqHkvDHNbl1vC2Y=;
        b=P+lFRJpT7vkT+eoXNgT6988lhRQtNpeafA8jd2S3iNDeK2Q0yP7xd8X4+wQWU766Pa
         cvyWHzT+Rx5kyxILM/WeiuzrqrQICw5m6teX6XFjS225y59Dswf8aKiWk+OI4Phv26bl
         n+Hi6GqtQ++2s2byiR3EdUmvOhQh1qN9ZMccg0TEDhidEJ9IygdJyun3usPva+FZEZfo
         y+ime8aiZVaelB10Wuhtq7dEnknOl9TxN2G++vSBb9fdU40fGWDcyv2Qy75TxkTX+QsT
         8lAmDy+7SJHoRPtUMI4sQBfkFo2PkOgIuF4TnxvxdQDc90XkPhmvIXSAGiFnhIo/cpHc
         iyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790798610; x=1791403410;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gV7fs5Nei/k8o70WCYEk0VoBwcvkJqHkvDHNbl1vC2Y=;
        b=A02o17gmeF6goY5t09cyaF5vsHRfgeZ04+wVBBe7pJ0mv0ChUPq4Uo8EyVEKD0xuD1
         tfT5Jiy5JjIsQNkYGQK24GTkT2oK20bLqaTSjz/ktv1Xjp6Tzxv/8+5bqzeZCym11msK
         gZmrEBvqi+2V77jWK6LQBz6ZSuu1+JihKO6UV3Wjng5o4uXTsHU3tJTC38tLc0i+RKwu
         9GdUdUgmW1E2d7TjLABp4+qRXci9PnJz2P9mipTQEoBNNugATnWHE86ILxwhfQLdJ3vy
         JTA5gNdbBVkwNTcGpXCZYXS3E469KbPWIJYMo7T24MqOBuyuX51iY72cfxn+LSO/+TZ0
         SImg==
X-Forwarded-Encrypted: i=1; AKwUvBznhLKOiP2yuK7rKzn35rJLMaRBpD5n/OaaeyRNcfhm6PN3w8+x4TmKG8cfZGFqq1bKULmFnc1qZU4FwV4BYMoU@lists.infradead.org
X-Gm-Message-State: AFq9FYIafX0WuhieK68PwoRmz62NiEYCfMNHj/ZQXtAC1hMdaBigTf6P
	XR2hlyLpIN1eiJzSylu78FEXgmAj+QJJDRt37m5B3lQUZbTS1vgD0Z6QiO3STt07MQ==
X-Gm-Gg: AYBFou3dihQRRVEAdTMn2ujFcoXDI++IVpOQXPywMi4sEP7TWwujuyYanRLAgOm/Yv+
	JNXpQDa6YjB71QOAOKCRT8L/OwzwLuK/q0k4jYWGhHMMq6fFos/rlxb/3ReNDxZC2vWu9geMSzx
	lbm51a9dd+ecoXc0K0fjzTG0PN/Prw4NkkC5Ds+W1e9O5TsDvX7ab6JooI5tSmp7WislAN5vVgq
	Cpw6LjbCY7HyPvv8USN9mIXl3mSvGtKYYMGq84QYwUPrFgaqsNiL06J+PHdGxEm+16YYYGQebMt
	Q2NfEmW6gsz2dyR9WHJkvKHSC9G2mxo9w9n/QMtQBIgw+HH/7eKXAs3pNL6zSLNTM3Hxw/lGZ2u
	bfnAphKn3WVE5y+Bm3d6D+CmSwdzoO86DmY+yJS31X/ujFGu8S+bz32OCVXG2QVfeI/Sok2QI1Q
	cZdEDIGE4JF964v8yNptBT1EX2ar8zHhxibiBltoVoBYOXbI2q24pPULqIHw4c+wSa5flM3y1ul
	MxyAs7HXzaKCfVdSRBbwibJqeWW2w6G4XT/
X-Received: by 2002:a17:903:32d0:b0:2c7:9e6a:1a8d with SMTP id d9443c01a7336-2e305407c5fmr334005ad.12.1790798609384;
        Wed, 30 Sep 2026 13:03:29 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e300a90dc9sm1914285ad.18.2026.09.30.13.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 13:03:28 -0700 (PDT)
Date: Wed, 30 Sep 2026 20:03:21 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v11 10/16] iommu/arm-smmu-v3: Factor out
 arm_smmu_handle_gerror()
Message-ID: <ar1rCWg2mJ3aiZS2@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-11-praan@google.com>
 <ar1WQCud+B3nAWX6@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar1WQCud+B3nAWX6@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_130331_257240_69FDDC2B 
X-CRM114-Status: GOOD (  18.15  )
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

On Wed, Sep 30, 2026 at 11:34:40AM -0700, Nicolin Chen wrote:
> On Tue, Sep 29, 2026 at 03:45:04AM +0000, Pranjal Shrivastava wrote:
> > The GERROR register's state might be lost when the SMMU is powered down
> > during runtime suspend, requiring the suspend sequence to handle any
> > pending errors before the hardware state is lost.
> > 
> > Refactor the gerror handling logic into a helper function. Subsequent
> > patches will invoke it from the runtime suspend callback after disabling
> > the SMMU, ensuring that any late-breaking gerrors are logged and ack'ed
> > before the hardware state is lost.
> 
> CMDQV has a separate IRQ, so I think it likely needs a counterpart.
> 
> I have a similar patch in one of my series:
> https://lore.kernel.org/linux-iommu/16ae24cc2a002802b990afa1a69fe4ceab1e0da2.1790188510.git.nicolinc@nvidia.com/
> 

On a different note, I should look at that series, I think there were
multiple things that were fixed/addreseds in that series. I'll try to
take a look soon.

Thanks,
Praan

