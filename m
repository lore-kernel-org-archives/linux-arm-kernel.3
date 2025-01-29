Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F2CC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 14:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mwnygbMsmdCq2LJyfsumivo8IAZG4XDnKYNgemYLbF4=; b=w5zoEPp2LmWRejaWlmYoVvDga7
	/fhbFpiwsiTjQryj2nx1/72qsfQjtFs/+9cRvkilK5A9tivLUNwy5Fd2RwXoB0UomVuRDoX4nY6P0
	ExxEflcDyzloVJl/HqY+KewAfD629qshRbxxEzaKP65HfnYmw6Z++qiQ3nK5rMVQARgbrGcOqH/KZ
	7jRt6eUqnlpU06XNEnQnYBRCCG2163eWOsWuh/nDVE1lkWPllIGtM4xDAyj5Zs4zghGsnGuUsDaZV
	K9wM2SEMmJGCXtCBFM/CH1f5x5hvo2qBQWwmmTGXY4KFJytZxAiylgikK4yAtPyIMbjhYIRkN0NxD
	YrOvC7aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td8m6-0000000759n-41TC;
	Wed, 29 Jan 2025 14:10:38 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td8kL-000000074ml-1mG3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 14:08:50 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4368a290e0dso114215e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 06:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738159728; x=1738764528; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mwnygbMsmdCq2LJyfsumivo8IAZG4XDnKYNgemYLbF4=;
        b=qFrLdOcuZhjzLdY5G7B8LeV0i9LKbxilSo0xKMIn2kn5FtdGB2xCJg6w6OvUPta2Ab
         H1fotVjEgF5JECeq90EQ0TqHozm0v4bh0fuITLM5SV/8ODtc1Pb41E7uDzJDpRByCDk/
         jv+7j5rPMlSWZfGu3bhcAA2T+Wf+znc2aDVACCwwScq3DWK6qXodwTiLHaDe/RcCN0Rg
         E8d+0xRG+S9lW8rpz/+o33DesDNlUtsrM6oRfmOjPvzpcZaWSIL1K5nQpinU0UUBqpEa
         YbGaG3gZv5KpDjmnYY/Nfikv3/XjZUtkPYQE46Qh4kh3Em8kvjRrDyp95lG2Gi+f4qKP
         imbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738159728; x=1738764528;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mwnygbMsmdCq2LJyfsumivo8IAZG4XDnKYNgemYLbF4=;
        b=A15qr7vIUgeaH5wGMapQXN5J9x7sCKPkGFLzLprA3W88WYef8OuNWeGnzLIk+j6gZu
         ecloQhLsvqukjCmERT8aB9rgf/CBczrUYRuF4VbkW7lA8+QVCO7G+yD2Wgz+EqC0bvHH
         Rs4vAfrnZalJdXYxEiuUJxY2huSQdy5305pLs3Z6d5wbzqg/LtYB/62OFd+MRcw80PTZ
         tpqp/9qQAXUYS6H4cpTfs1JEqe+TVMS4z6JPxHOytmX7iu1K6jWncX3lukIPQowCPhP/
         SbqWOPkFw8dgGZlhJUKTRf61w4IBdSNDp1NcYdlLkbjcM9iTDLwWrjLNtfgvmSJPrD5X
         ysdg==
X-Forwarded-Encrypted: i=1; AJvYcCXg2aD3Qm68cU+kANJ9R9KzMoBZPbTbQMbQRjuj+ppm0IEHDRKKxHv7QG89ux9Ux9tiVMg3D2hWFeZvBg6FDjfq@lists.infradead.org
X-Gm-Message-State: AOJu0YyLBX149RCag9qndrjqT13iehP90EHBkNh6/5bn/Sf+wYr0ktuG
	J9+U1lIqUqd1lMTZQ+yEBMa7heiwhrwD82LpuBItDU3saMPMrwh4cVRcRPDfRQ==
X-Gm-Gg: ASbGnctmFYfMU6BOkyeqzcmSO3p7zJblX3ImpLjB7FoRGDC9+xwaFT2CNpYFl2ZZ93X
	lr8nPuzssOE47hJWw41XMo/9H4KQQVORHggkBVeFPMcADp8BSd2M2eJcXvlbnq6qDujaUAc49pv
	hX7JOSjJ6UzRF8PSmrzeknjqzHE2up7KpnYKM09DsgS1gE4A7jpzArLXESwU8HcBlDk4WB8ZeAL
	6wnkUH6RRPp8mif1Gk60jH0OgWJZOJqaFRQ+FDr53agJsKm+2mJ0jsEKYaVWXXbd+9WBoBK+u4R
	tBNAhvpzZZl98D4CqEOj+kF7gI/JlWAYRUnhWMltAXzNO+ATyBk=
X-Google-Smtp-Source: AGHT+IEBmc8wE9vCyM9jLK6IJcRV2lIxnHwIYu6bH9hjFBBeHTH+WuqVZsZJrlcZA0Sb+Jn5z82GDQ==
X-Received: by 2002:a05:600c:3585:b0:434:9d0b:bd7c with SMTP id 5b1f17b1804b1-438dcbf4e2fmr913185e9.3.1738159727917;
        Wed, 29 Jan 2025 06:08:47 -0800 (PST)
Received: from google.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc6de2dsm24352725e9.26.2025.01.29.06.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 06:08:47 -0800 (PST)
Date: Wed, 29 Jan 2025 14:08:43 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>,
	"maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"joey.gouly@arm.com" <joey.gouly@arm.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"robdclark@gmail.com" <robdclark@gmail.com>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>,
	"vdonnefort@google.com" <vdonnefort@google.com>,
	"qperret@google.com" <qperret@google.com>,
	"tabba@google.com" <tabba@google.com>,
	"danielmentz@google.com" <danielmentz@google.com>,
	"tzukui@google.com" <tzukui@google.com>
Subject: Re: [RFC PATCH v2 00/58] KVM: Arm SMMUv3 driver for pKVM
Message-ID: <Z5o2a-RSiWqQOISc@google.com>
References: <20241212180423.1578358-1-smostafa@google.com>
 <20241212194119.GA4679@ziepe.ca>
 <Z1yNWI9lBNIZg6Le@google.com>
 <20250102201614.GA26854@ziepe.ca>
 <Z35rEeSVwfZVA9IF@google.com>
 <BN9PR11MB52760686ABB3145E44BAD95A8C1A2@BN9PR11MB5276.namprd11.prod.outlook.com>
 <Z5DWag7ZKCPl1Eje@google.com>
 <BN9PR11MB5276B783D518DB354BF58A3C8CE02@BN9PR11MB5276.namprd11.prod.outlook.com>
 <Z5odLXPZPAwu4oqe@google.com>
 <20250129135053.GB2120662@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250129135053.GB2120662@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_060849_459948_8F0EDE20 
X-CRM114-Status: GOOD (  16.10  )
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

On Wed, Jan 29, 2025 at 09:50:53AM -0400, Jason Gunthorpe wrote:
> On Wed, Jan 29, 2025 at 12:21:01PM +0000, Mostafa Saleh wrote:
> > levels) and can’t be separated from the kernel as that defeats the
> > point of KVM, that means that all hypercalls have to be stable ABI,
> > same for the shared data, shared structs, types...
> 
> Sorry, just trying to understand this sentance, today pkvm has no
> stable ABI right? That is the whole point of building it into the
> kernel?

Yes.

> 
> Things like the CC world are creating stable ABIs for their pkvm like
> environments because they are not built into the kernel? And thus they
> take the pain of that?

Yes, my point is, we can't just separate pKVM as Kevin was mentioning as
they has no ABI and it is tightly coupled with the kernel.


Thanks,
Mostafa

> 
> Jason

