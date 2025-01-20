Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5E0C02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 14:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nJYVtS2wyp4YmPXThKgYxTKEqaWqBzZ28kCjv5DfTK0=; b=X7vb09fbrBQHRk7ruDVwACYFWO
	8qZ8PQHOGd6Gzl3s5qR5OuACN5+vcJ9J6v9ahWbIjmeFGl5wPk+Vg55KI/ckiLi/xKqTgjm1DkEDb
	lpFDhrsi28GYhU8PrEDv68Ltl28b/ulSqX0JQTDrlz3lmabZpsL/tXZxJexS9mdc8GmVTu5kl2lLx
	YD2gtL/XOgRZuQqVPV0n6eqLv5ZarU+r5g0/Lpa0tOGMrr1jDf90eXWlsUOYnFEF0Jatmn8rDvnpw
	mjtpQKIc1xBFbhM0p6SNvz+Bu6qBrLQieBja3dxdkMLr4u0JkR0k+VfBv6pUIKHGv2bwJSBOnMHd1
	ZtzVGIPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZseY-00000005mIC-2Uw1;
	Mon, 20 Jan 2025 14:21:22 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZsdH-00000005m2F-2pYf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 14:20:04 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7be3d681e74so411503685a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jan 2025 06:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1737382802; x=1737987602; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nJYVtS2wyp4YmPXThKgYxTKEqaWqBzZ28kCjv5DfTK0=;
        b=KG0ZYYYPTQ1cJwIzycNzdQ1S5c7Vyk84a5f86qp5LIVHxznbf8tA4Et2g393dbDnv0
         znNiVfUPVmcpXIKV5LS2dxqvyBMi3Mw5XloEGK+WAAgtGFxqlTwLsoWs9rYdEmw60V9e
         Z2FwbTa23v/n3SHvtIoN5sRWHnxThLf09VydIEwavdYRvbx2VNX9L9w4502Pcb4j6OKU
         3LPL+GJBnnSGZI8FU3ecmMhlRRGRf6LzBfcixWYaDztCpIbYv3Y3fap28tKfQayxymSN
         FegZgQnFqWRAiCDpJaXt4ZFZ6DGB3V1GgKR1USiNunJut0cNc29suijQvjzm4Z8HuCF+
         FOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737382802; x=1737987602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJYVtS2wyp4YmPXThKgYxTKEqaWqBzZ28kCjv5DfTK0=;
        b=tO46G/1tXmFAAS7Eur1XmIFYGbOghJCgAA0ptQsBH2d38cPnGsPoRqrqAQj9lxkrRN
         Pq3m87CBWpK59K7KuJ7W9sjO0TEl54Rr7W/YLphKbuTkzqZez46tjCxQgq5LdVdosCT+
         2n3869oQ8TIFXs/dpiOMbsegvLzBCV3XRBj3+LZuzvgFI+H6SRSG0BIWjbKVXlPSpSAZ
         soC5BQDLZgTANbZk6T8Wp2WAExfAG/9HBcMF4/CwL9qgCU8cxD+QZ7rYPWFXENHm8Xm2
         hkri2nrOwWw/pVXTVIKS96ktzgTKzQhQxrozKsUWgBMtmXezkCuL5CEtSz4tcrr9CFlA
         8QlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp2iVHHFfyN+hT4gMfE8RPWhaURNUqINLSottNK6E9WK97APlScLcLLvI91Jn5olzMmcYqoCp/r3S7VmWRI+OD@lists.infradead.org
X-Gm-Message-State: AOJu0YykhDwczBkg1fNfPBqxO5EtgSs5TOpgjdKJ6+bexIpICO/LZVx8
	wBAZE7tDisjolgID2KD62gJ35NSpF7mEPUD1uhat2j633/Jqs3YAhse1yLKr/o8=
X-Gm-Gg: ASbGncvuBQLvk3OlSNSB8zBZTPgfl/jQphIVgtDIs4mjVn+0omTrxBldbJO4aGdl6sh
	KvysDhlXVw69GPcKBgB5yKxrlnV4iAT/Xb3lIi+7yoiu+0tLbbhEAqI7QK5zTevt4snRxHq2+id
	XM5E74yHRWNtimujk/+XqnxHyljkJ+vPxXxWdWd92djutt98/WlvKLikHyKR6KyktaaJr97dMhR
	eK9G5e1t/82M2X3WzXDkf+FOrIvrPefKDoHHG6tKbISJhwAMLcCEPa/GJXlOMaCJkq8B07lWXQa
	H2y+x2nup8Jg9fAeIPkXTnwGE3q6Ps7oKIjLFFPctIs=
X-Google-Smtp-Source: AGHT+IEQfbHlAGgpHPfeCc+lyD5fWS//N7IJUpSAPNWDgqwoZI0jSTzrUMiH8syVCBErRhB4O4Vhqg==
X-Received: by 2002:a05:620a:43a4:b0:7bc:ded5:888d with SMTP id af79cd13be357-7be63210578mr2197984585a.1.1737382802189;
        Mon, 20 Jan 2025 06:20:02 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be614758b6sm447691685a.13.2025.01.20.06.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 06:20:01 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tZsdF-00000003Pge-0aIb;
	Mon, 20 Jan 2025 10:20:01 -0400
Date: Mon, 20 Jan 2025 10:20:01 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Yi Liu <yi.l.liu@intel.com>, will@kernel.org, robin.murphy@arm.com,
	kevin.tian@intel.com, tglx@linutronix.de, maz@kernel.org,
	alex.williamson@redhat.com, joro@8bytes.org, shuah@kernel.org,
	reinette.chatre@intel.com, eric.auger@redhat.com,
	yebin10@huawei.com, apatel@ventanamicro.com,
	shivamurthy.shastri@linutronix.de, bhelgaas@google.com,
	anna-maria@linutronix.de, yury.norov@gmail.com, nipun.gupta@amd.com,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	jean-philippe@linaro.org, mdf@kernel.org, mshavit@google.com,
	shameerali.kolothum.thodi@huawei.com, smostafa@google.com,
	ddutile@redhat.com
Subject: Re: [PATCH RFCv2 06/13] iommufd: Make attach_handle generic
Message-ID: <20250120142001.GL674319@ziepe.ca>
References: <cover.1736550979.git.nicolinc@nvidia.com>
 <c708aedc678c63e2466b43ab9d4f8ac876e49aa1.1736550979.git.nicolinc@nvidia.com>
 <62ccc75d-3f30-4167-b9e1-21dd95a6631d@intel.com>
 <Z4wP8ad/4Q5wMryd@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4wP8ad/4Q5wMryd@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_062003_714702_B932849C 
X-CRM114-Status: GOOD (  17.08  )
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

On Sat, Jan 18, 2025 at 12:32:49PM -0800, Nicolin Chen wrote:
> On Sat, Jan 18, 2025 at 04:23:22PM +0800, Yi Liu wrote:
> > On 2025/1/11 11:32, Nicolin Chen wrote:
> > > "attach_handle" was added exclusively for the iommufd_fault_iopf_handler()
> > > used by IOPF/PRI use cases, along with the "fault_data". Now, the iommufd
> > > version of sw_msi function will resue the attach_handle and fault_data for
> > > a non-fault case.
> > > 
> > > Move the attach_handle part out of the fault.c file to make it generic for
> > > all cases. Simplify the remaining fault specific routine to attach/detach.
> > 
> > I guess you can send it separately since both of our series need it. :)
> 
> Jason, would you like to take this patch separately? I can send
> it prior to two big series for a quick review after rc1. It'll
> likely impact the vEVENTQ series too.

If it helps you can put it in its own series and I will take it with
pasid or vevent, which ever goes first

Jason

