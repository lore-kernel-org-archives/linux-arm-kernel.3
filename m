Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0965AC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 14:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZZ7KMHGJDKL1wdw85tJIpxyh4i61E6zj6IeC9gOCMHg=; b=nsuS0Sk4M3ipPgFLSVblDa/FF7
	NJXJMHWqSPbfyNq5hfmn+BpnhyLOiNzd+ff1qF6ESE7XGldL9q7qjOWje2lHwes8L+aQD4EYZk0jZ
	UzVN8dortisKQy+BqAVcZWcVPsLxNkVKbUsIQHKLu+gNjiq2SLd9HkQYM8jp/JirMYypvYZyQIiWo
	XtYk7voZqbynbLzmZIt6tGoxZaE1E4u9utbH2XuyosGq4s9DByR2OowPKJVpio3ocIqYVRfGXLsQ/
	j7MYlD5wkRC/DIFrLQB7/J3CHFsGUlAWwlvp8fZzffok6GiXDSe+FOhmANa5xFcXvCbvXi8ac6bUc
	A9MzxhdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTGG-00000004zUk-0cXA;
	Tue, 04 Mar 2025 14:28:44 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTED-00000004z0q-1J9n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 14:26:38 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-474f8d2f21aso12541131cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 06:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1741098396; x=1741703196; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZZ7KMHGJDKL1wdw85tJIpxyh4i61E6zj6IeC9gOCMHg=;
        b=oF9Dx/28HLYaCihgYNzK6M6gUrITOLPddZCwzfLnpRVky6ftW/CmLF2SdFU7ttZd9E
         Lha/FOUWgmZued3cQ2DRPCABnOOiJToCK075jntC5D3mGk1ZKa4Gs7mQdWGv6BAymUjw
         8NwLAIGVQjEwL3KNLDUJecJ8fOZPsO3tWkqANEAYxNR4Sgts/2w7Fhdzcf2dcBQoISdy
         9XCwAyXb9U8p1j8NreGbOKazELIA+NmPloeGuBhzzJmIVZpKcmiZVSM6rxzoYDPFaZmD
         ye61IkMeWRkZ/St+h0RK+RQMxh22zGAYdU+lwbpxS/73HQs+DoHoMWFlnAZK2jprGoY4
         ZYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741098396; x=1741703196;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZ7KMHGJDKL1wdw85tJIpxyh4i61E6zj6IeC9gOCMHg=;
        b=BW4qIo2j2rBnJn5QimA3io0ATjL8aceJo8GlMT2ZtcwoF3gYY/4pQ73OSQCFJvLwst
         SWwJLJpKozslWSDMUE3sPfclJ5JT6RWu4JPdFHdjyKvXXXzoDyEP+4VhFG8e3OJFC0Jq
         Qp4XezlMqQq8SqfBG6bVcGrdR4Y15d8F2kEXyB1kJlEipOSGMcnBsRq1TJk+VyHIykLT
         W7IcGc/+zOPHFToSxDPX1uDQhCWhc8leUnBqsSq2QOg4f2RQ5TMt+2AtcRWGJomjQDDB
         kC7/VxE1FC5LbdcjtJOS4xeJZTUwV29sT/MbX/1esgSbiJvTUixxa+hiJIIrCJqkFyl7
         dh5g==
X-Forwarded-Encrypted: i=1; AJvYcCWMoCzaIqx5l5Ltd/N1eUQhk525tJ5c9cKxXlt3Z3GKIlgXWDni5jqTGZLFASgkkM4+9OKYxJKsdNKNv3YDkq+O@lists.infradead.org
X-Gm-Message-State: AOJu0YzzT9ttxKDFNaXOZbPPBZfD7jlhDhvMQcG5s+zFfXgkaQ9oAVjC
	wy4OvV1Old0LybdpJ1MPFtQQAuvQoW2ZfKlG0/g0b+Wg1OFp9feKTHaFKrtfLjU=
X-Gm-Gg: ASbGncthnUz/FgZdoqE4RgZgzfYg6bSyQVgLkMmNC8pVIuBTQBkv41SXrGD9Bl1EY5w
	kMZ94JBdU6kzVPNCjIvbAIANYZj0OtGwbMDrDttr5nGOWyCfT17Q4aQ/QB/uK1+xkhnXChPrus1
	QEmvJfiI2AoGYD4bzIeQLE9zbQRK8a2ZR1flX/T4CdnsaFIWpxXX60iZszMfwHFUpJ9Lf8vg3Xp
	FYX/y1kY2vSZGRmKki8aai/OSFpZmDrzGuD8TtI95VuqQEfh4TITasbb4Wo4wHlKX2I/XP54iCu
	4nU/wOCSy4Zkc7Df9udCURRSMIYBE7FwCBxARD95ftOe2eVrXD+IEFFeOo0VXXoK2PuckkK2YWQ
	RIn1cwQfd/YzICaXQ6g==
X-Google-Smtp-Source: AGHT+IGpGwzh4Elz0HvbqFWhkWlBebcf1jH6YCXchA+m15FaB7zfVQNpWK5QB2cePx+kDOFF5fxCRg==
X-Received: by 2002:ac8:57c2:0:b0:471:f482:bba7 with SMTP id d75a77b69052e-474fbd559afmr45366221cf.22.1741098395939;
        Tue, 04 Mar 2025 06:26:35 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-474f2875726sm21811991cf.8.2025.03.04.06.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 06:26:35 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tpTEA-0000000179G-3zqe;
	Tue, 04 Mar 2025 10:26:34 -0400
Date: Tue, 4 Mar 2025 10:26:34 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
Cc: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"yang@os.amperecomputing.com" <yang@os.amperecomputing.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"joey.gouly@arm.com" <joey.gouly@arm.com>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"maz@kernel.org" <maz@kernel.org>,
	"david@redhat.com" <david@redhat.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>,
	"mshavit@google.com" <mshavit@google.com>,
	"jsnitsel@redhat.com" <jsnitsel@redhat.com>,
	"smostafa@google.com" <smostafa@google.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>
Subject: Re: [PATCH v2 4/4] iommu/arm: Add BBM Level 2 smmu feature
Message-ID: <20250304142634.GC5011@ziepe.ca>
References: <20250228182403.6269-2-miko.lenczewski@arm.com>
 <20250228182403.6269-6-miko.lenczewski@arm.com>
 <20250228193221.GM5011@ziepe.ca>
 <b23aa37f8e864dea82a6143bece912d6@huawei.com>
 <20250303103102.GC13345@e133081.arm.com>
 <20250303165255.GS5011@ziepe.ca>
 <20250303190330.GA426248@e133081.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250303190330.GA426248@e133081.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_062637_349379_AFC67EBE 
X-CRM114-Status: GOOD (  10.75  )
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

On Mon, Mar 03, 2025 at 07:03:42PM +0000, Mikołaj Lenczewski wrote:

> For example, if we use BBML2 for kernel mappings, does that require us
> to repaint all kernel mappings when disabling BBML2 on smmu attach? I
> am not sure, but definitely something to be worked out.

No, it would be a per-mm_struct basis only if we did something like
that

When the SMMU driver puts a SVA on top of the mm_struct it would
disable BBML2 usage only for that mm_struct and it's contained VMAs.

Kernel mappings are never made into a SVA so are not effected.
Userspace only.

Jason

