Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4889ECAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 14:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zrVmh9WioYbmEoq4Y4G7QBMqeKPDVKPWX4R50WAG25o=; b=R1N9Cypf9wuP+oQdjlmx5llykC
	uP24wIl6gLSPwGwPdUWg8CLJ2SQbYIX2OmJtCYvxrKmU2clI4/nManBp0zi1P8wULgrixq5Wq+gSX
	winvf1ctGlmglhrKOfmFO1PZrPuU3JTKQhTQ4w9M8XCJJ6k2xjd3vJmKp1hpwZc+FHaztI+5Da+cY
	3oPM9B9M10b+nJqbjuC3XmoRA4kJUSTxV6G68YUaD8ASZ8O8qF9kINVmzOuepMxBOTVGokvdX84h/
	sutJZdv6Gm5wbKDTkcWNeBnFzHnMbVvElgya42eYxXTJ4AN/3TDYyPzLvY0CVEGRJ0mJ3kJzLguJ3
	oWSVRTpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFkk-00000000AaP-2tdL;
	Thu, 18 Sep 2025 14:36:54 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFki-00000000AZb-41By
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 14:36:54 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-80a6937c8c6so124363985a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 07:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1758206211; x=1758811011; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zrVmh9WioYbmEoq4Y4G7QBMqeKPDVKPWX4R50WAG25o=;
        b=kqATyUHiZoN1IGkjg6h/Pj9vnnMfW/qcCIs+ubv6PCMacd861642fm4L1UfvyNQth3
         xIBuPPoADFpYW8gS4+lBBrgG6nZvyYWV3JJJQRoW4P1hpyye+7znVoj6OVRzPCx7NOV4
         FAZSTHx646qOkT2gBvVM/klbTzY4xxJYWDDb+SLhXSBiCiyruExd1d1Xpuu50HevUd7l
         QKf1wJoswu7cdqnz/aeDO8DtRfE4E+5R5KjWT42K0HNBwwELEnaFunXZX1liiGcD31v3
         lmt1r4/ySQqRNDf7CfLT0nTwiCq5B1a9RGnCHxpMwXORHp8hTAWR6mC7bIWzlpKBYvaD
         iB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758206211; x=1758811011;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zrVmh9WioYbmEoq4Y4G7QBMqeKPDVKPWX4R50WAG25o=;
        b=lkgaM3nbX+Y1MzLddK5gspgJGmjOLbIlzRWAj2fNJhBTcpltSEm7TEJXxIFTZCzfhw
         gMjGWmO4TGkTA/DQ+jelrOrVRiFdxL/W7VK6vpui91zod8SK6+qHFRkEWtYN2/Kiu/fU
         RUnTHU48t6rFv6yiU7gsbwcZ3H+jEtmvIBjTVKxa8DjPhNNwC9MCoyLSmggPFhcXcvoj
         rYDlIX0QQYKjGsieU6rY0eGppxc2yNQgRf8GOGQ0G0quuWECnB8Bi5mjeqHwlQ42U5x4
         jVbGSjnPTEVJf5r1ETStuHqMkizo8vWzXf+UoBRrqr8Uq+1g2wDYyUgMuv0qs2/Xd5Kb
         QUsw==
X-Forwarded-Encrypted: i=1; AJvYcCUZotoEuCtQS+lM4H7l7dDZe96UI/LyAfVNFBnnoNDLD4gcALFhznKXUllultAojxEuwEjmb4BF3qdAyVrbh3K/@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5zch71iOWLaDswuEJp9ZlKiQzNUGvl+WRkr+AsQsphp9Gecem
	IWXtLsrlAJpi66MTqSilcSoQJVQWoT4PkNNBUJjCkPWKYkfnfw/Gxh94/iJeuRWCXOQ=
X-Gm-Gg: ASbGncssQnUqKg08EFLrJRMXdEq8zVtgpWNlrxHbWkwD8e+vm616YyEOfPc5tTPY5hb
	S/PDgx3IW2HXHIQletx4VJraQ7tnBoPBEYziBc51kZp0ZDDLreWTn4IiEnHfjkqiS8zuQBNSlUF
	ezXcel0keG8HdVaTrHuLWbv7j9z6sUwBqkA/MaOpTGMZUDteeGXT7AR7nvdyrViHtPIRe3IkWML
	1lVS/fgunh9vo4+dh+TuLTe3cQqvsTdmodrRw8883NmWCg5+i0tz+QoJrm/Ln/C3MFgxqwa5Hgv
	dOE44ZvA/5tv+N5c5crnXEsstJ8wrmla2anO+JQAvfPFO5gCZEn/091OzRZ2S6gY/7WSCHBYo2V
	bBWFijvWOodfZ5DtoCkK7k4svExSm6EyW1kYBSXDr1RftkfxaKVvTEEPGAUGE4sErM0T56pe4LZ
	IXuNEfsI2VGYE=
X-Google-Smtp-Source: AGHT+IE8/5Ud/i8k8I1bre3zwyW5lDIdJBqEnB52NPRTieNqwTGZ6V2Ab0vPLtj2VgmwLHtb5fpg9w==
X-Received: by 2002:a05:620a:4152:b0:806:a07:9fc5 with SMTP id af79cd13be357-831085ab77fmr631920785a.24.1758206211361;
        Thu, 18 Sep 2025 07:36:51 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-83633b04dadsm168450785a.64.2025.09.18.07.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 07:36:50 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uzFkg-00000008wHU-1PaB;
	Thu, 18 Sep 2025 11:36:50 -0300
Date: Thu, 18 Sep 2025 11:36:50 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Will Deacon <will@kernel.org>
Cc: Mostafa Saleh <smostafa@google.com>, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 22/28] iommu/arm-smmu-v3-kvm: Emulate CMDQ for host
Message-ID: <20250918143650.GQ1326709@ziepe.ca>
References: <20250819215156.2494305-23-smostafa@google.com>
 <aMQroI4NDu74PDGT@willie-the-truck>
 <20250915163858.GK882933@ziepe.ca>
 <aMl_5j8G3IGulAC6@google.com>
 <20250917123601.GA1326709@ziepe.ca>
 <aMrNTny9jgZJd_Ef@willie-the-truck>
 <20250917151612.GH1326709@ziepe.ca>
 <aMrS71vQ_MaVonzi@willie-the-truck>
 <20250917155931.GI1326709@ziepe.ca>
 <aMveas3QWXUk6xpm@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMveas3QWXUk6xpm@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_073653_003714_2E2CA093 
X-CRM114-Status: GOOD (  17.71  )
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

On Thu, Sep 18, 2025 at 11:26:50AM +0100, Will Deacon wrote:
> On Wed, Sep 17, 2025 at 12:59:31PM -0300, Jason Gunthorpe wrote:
> > On Wed, Sep 17, 2025 at 04:25:35PM +0100, Will Deacon wrote:
> > 
> > > Ah right, so the driver would unnecessarily issue CMOs for the structures
> > > that are just shared with the hypervisor. At least it's _functional_ that
> > > way, but I'm sure people will complain!
> > 
> > Yes, functional, why would anyone complain? STE and CD manipulation is
> > not fast path for anything?
> 
> Won't it also apply to cmdq insertion?

Oh, changing CMDQ wasn't on my mind..

Yeah, OK I don't know what the performance delta would be like there.

However, to get peak performance out of pkvm we really do want the
SMMU driver to write CMDQ as cachable, pkvm to read it as cachable and
then copy it to a non-cachable HW queue.

Otherwise pkvm will be issuing CMOs on fast paths :\

If we convert the slow speed stuff, STE, CD, Fault to do CMOs then we
could make a fairly small change for pkvm mode to force the guest CMDQ
to be cachable without CMO. Some special feature triggered by pkvm
detection during probe.

Jason

