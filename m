Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E99C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 19:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=StBs1yybCW0ddI0aiXdemem+T65OMsy4WM+BdrXHgOE=; b=hlJliJ3nCUsxNNRQAJwc9xjEbz
	+IlmpLa8QYmMG08RwL+CBsczYwP96xjvepVpSUZxEPGYpWfZh/k4J9x065kccBbDP+oHe7ic5Uzn9
	SQDkTn/sm/6W5UBqrCMq8G8tOlo6KgRSfqk95pwTm5nCcsKF2kKGaNfyeM2cHbUicdwZUlgUaUnKW
	7tPWsHrAjVPasQpOyEUd3KTvmM1kFmUiTEWE1b7sFZYKK89DpeXeP643F8Eil66EnmEce0WoUXVlG
	xD9j74elsGw4e8dBD0r8F2oSIFvzvkCKncy9c1FU3L8GFzL0XbQPIrFbdhJW5kMWwSIpSLXZm0L58
	DX0tD9Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tagEM-0000000B4IZ-1s9h;
	Wed, 22 Jan 2025 19:17:38 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tagD4-0000000B49E-30tO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 19:16:19 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7b6f53c12adso3894585a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 11:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1737573377; x=1738178177; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=StBs1yybCW0ddI0aiXdemem+T65OMsy4WM+BdrXHgOE=;
        b=gDiyqPA9B8Kq59qfN5+VZykQ5oapCPx6woz6Qk7mfkXdaOakISYRCIx9TpK8xDlAK/
         DSQuwCAZAWyxQBgy5ZY1f7D3Wnvr+2M2JX00tVjn8HV4Q5K8IiyknLUHJJY0znAvoA/J
         47m9/nk2u8TDnEpb8Bf3SDZ/XVq5JGHorC/Ju/4R+7J5yFdNsOZ5yt/M3BJPXnxhuMaR
         E7vJpFualsfO0VPOKe673LKmnCd8q8LsblBHVeicSod1/p/lUnntd2kM9d8LuhWDygx/
         NrvlzN8zw3GrqkYNauHVmWNbWgJC+oru12Hn317D+5/xq5DrIuSiY1DF+8FuZ8LmeFeI
         nf5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737573377; x=1738178177;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=StBs1yybCW0ddI0aiXdemem+T65OMsy4WM+BdrXHgOE=;
        b=xG57vP79KVXA+vKtOeJp94gyFHCt8S+xDRIX1qIyl2B2uWtcr6gMd6PR1Oy+nHHmsx
         Vn04W0J57h2gCPAorGtkupk7j7AVlgCj//eRoQdQl4uz+ogpTvh0zjeqV68vaIjJ+sdm
         FNNCyfY8v6kuHigXPEo31sL2ndiYT5co6dfTwyPeaSRbehTevA9mTYkzpCkrgqge8Tm9
         3Gw+LZr8nj/3XOeN0tHfKKsZ6M5+70ev6HmowjkjNIog27zIHohoHttaDEpJdU3HnmXU
         OlIpoLF2z8yGybVRQ9cCoYlZRgTUU/qwziwLUMNOaAFoSITTBSJvGYBtFnEslyrYMan/
         323Q==
X-Forwarded-Encrypted: i=1; AJvYcCXE2uXITCIcNNkyKKHd1g7/a6F5pj+IsH+3wnhcVfAIQCq7WP8bdX/hftOheqanFYdnwsGTzzudRaJzbwSCLS3y@lists.infradead.org
X-Gm-Message-State: AOJu0YyXtNBnFywB/vDPm1KHh7SNHKxSi0pYLVorAaBsEBeKQeLQjG+s
	S4GBQRSWpktOMFmfREYyDxUpHvxQ9cNbB2L/Vg1fuaXdmOMZxg594Ymi4u3Sg5s=
X-Gm-Gg: ASbGncsic2snPx8tJoUGqVbxfPW/3ymY5eJLuou0PwG1Q9UBiKSRn2Rs6PsfI5By6HU
	tMGubGW23ReO4GNuQu1Bi8rHJ0ijkU2I/GAmTxcaD4QytF3H/5lxSS/QAJZm4ETkWnl+2flfJyO
	rGc2YHKDqx2pceVOx98P37F4PnmNsSkZLVksWWpOJ1JUDLf1JMyEMdMgEC1ahuyFzyMcFrjvFqf
	7Owe+C3DZvMoppD3M3PMxT46UqyH9AT8BcaX+sujF6PgKBqYVbmZ9L43NO5xd1yc6YdICvHQODf
	K5dRobkBMo4foTdJ0VLDC++ceqGwClssSjx5cXNNy+U=
X-Google-Smtp-Source: AGHT+IFVrl9HtlsCxgPAX2pD8bZ64h5nRxXoX/dvVQ3V1TgnXiLnupfnJHpYt7QXTpYGl54zFfzQXg==
X-Received: by 2002:a05:620a:601a:b0:7b6:d632:37be with SMTP id af79cd13be357-7be6320bebcmr3861755385a.4.1737573377534;
        Wed, 22 Jan 2025 11:16:17 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be8b26abedsm123129785a.34.2025.01.22.11.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 11:16:16 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tagD2-000000042qJ-1azx;
	Wed, 22 Jan 2025 15:16:16 -0400
Date: Wed, 22 Jan 2025 15:16:16 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
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
Message-ID: <20250122191616.GW674319@ziepe.ca>
References: <20241212194119.GA4679@ziepe.ca>
 <Z1yNWI9lBNIZg6Le@google.com>
 <20250102201614.GA26854@ziepe.ca>
 <Z35rEeSVwfZVA9IF@google.com>
 <BN9PR11MB52767756EE35DA2359C351F08C1A2@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20250116191455.GC674319@ziepe.ca>
 <BN9PR11MB52766732572A17627D16CBAC8C1B2@BN9PR11MB5276.namprd11.prod.outlook.com>
 <Z5DQuNn3GoU1vYPV@google.com>
 <20250122162055.GV674319@ziepe.ca>
 <Z5EoPhhU9mm9zNWB@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5EoPhhU9mm9zNWB@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_111618_755333_56771B07 
X-CRM114-Status: GOOD (  21.15  )
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

On Wed, Jan 22, 2025 at 05:17:50PM +0000, Mostafa Saleh wrote:
> On Wed, Jan 22, 2025 at 12:20:55PM -0400, Jason Gunthorpe wrote:
> > On Wed, Jan 22, 2025 at 11:04:24AM +0000, Mostafa Saleh wrote:
> > > AFAIK, the most common use cases would be:
> > > - Devices using DMA API because it requires a lot of memory to be
> > >   contiguous in IOVA, which is hard to do with identity
> > 
> > This is not a feature of the DMA API any driver should rely on .. Are
> > you aware of one that does?
> > 
> 
> I’d guess one example is media drivers, they usually need large contiguous
> buffers, and would use for ex dma_alloc_coherent(), if the IOMMU is disabled or
> bypassed, that means that the kernel has to find such contiguous size in the
> physical address which can be impossible on devices with small memory as
> mobile devices. Similarly.

I see, that make sense

> It’s not just about completely external devices, it’s a defence in depth
> measure, where for example, network devices can be poked externally an
> there have cases in the past where exploits were found[1], so some vendors
> might have a policy to isolate such devices. Which I believe is a valid.

The performance cost of doing isolation like that with networking is
probably prohibitive with paravirt..

Jason

