Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65A4C282D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 17:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+QyCC8CcTX+xQp+BLqbobfaOcWMa+Lol1b2+RKYTYvw=; b=TKUdx9JWe5+xXnt08Kzwa3VuIb
	L6YRWOPpan50wzVTRUCoPrWEcDtac+s4iYlbg9vusBGh1KUd3w7d5Qk8Y5R52njUgOMgJKr885hhX
	wKXYX+PhQd9GdFkvcY0yseaMECjyuXPl25GRCHMkihkg23P3KdJVCl53VWw/SyE/q82L8gq+2Pfwo
	v6p70O7yiPPUSDEzCXRlGXI0Qeo9GMasyCeJpm2/E1oTOKKC+Do204gZ2+fw1XMglWXdlg0rjJXyA
	L1fr+Nx+cMfU9uysoVPGHTW5b4Yq68uDOzbs6ax+SvvMsJyNCSTpinnMbi0gxj1OLb3LBKxhFjasQ
	GCF7vEDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWSO-00000005ihj-1Xct;
	Tue, 04 Mar 2025 17:53:28 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUzi-00000005Oqf-0z6k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 16:19:47 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-471f4909650so51984741cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 08:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1741105185; x=1741709985; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+QyCC8CcTX+xQp+BLqbobfaOcWMa+Lol1b2+RKYTYvw=;
        b=Ub9n6PvKwDpXfhpkhuhOWOWR9nP5RYGCLIr/WuL2o90klIsaj0i/3BHESxixVaGX3g
         q13VMTj5c3VzwwbuKoxFXEOBnprEF6K6XcUcT/gmtSH5HHuXT2FOqhX87W3gGlo1RF0G
         nUvwR64JZ7tjr9PvvEG8wwTo2Dmfl82i6woHtEJySCQjIgaPMWcJnqDN1f9y5hd634E3
         m0odS0Jwv7Brg+e3fvFFA+Ru5OpQOmCIOXzIgC8+C2u+gZ44b9DBilTEcVCs54xJ2JZK
         CDOzzsOQCRGFKhT1Q3iOg6nZrMpOuOrSKqhRWwl2dgjiOHhOt/TDkuxeb5+D0PNySoET
         H8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741105185; x=1741709985;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+QyCC8CcTX+xQp+BLqbobfaOcWMa+Lol1b2+RKYTYvw=;
        b=W5FU1qTG8jiW4+6gwqhiv546mI5j6p3VEbajj71GFGoXBN0pyIbikLB7WUUCbI8P+Y
         Z2iso5wi4c1/KV9jUnogm8fNiV+qfb+aq8Dootyd20L50yiiO2WXE8cI8qqw2juyqDE1
         tTy13sU2djZL6uhQBPHxhoKZlZLYLKcqKZZF4FmQLQOn68H1G9n6erVPwFtGOp/oRtKE
         LwEjWmZh3KrU+2PEv0XmbXRvybCWd2bSQjX7Uoa2rLujNyU6Na6DdKRwDQno4uhsSWSE
         QlSMy01KqNmUM8++VnIdYEKD9mHD+5ME1LUutcYjXFZDP1HcqG2v8fJw20/j6RZl/a8k
         jXRA==
X-Forwarded-Encrypted: i=1; AJvYcCV+hPnSii2d25Rk4dfW/VBhOaRfctADBB5Y/avMXLqc/danU7MoJGjX/TasM+/nkOWbUL6xzScWpnmqQaNvhAxN@lists.infradead.org
X-Gm-Message-State: AOJu0YyABikX0lSuy72dnQ1sd2roa6NM46A9J39G/uxMP06jXZDkyYwK
	6FewOy+wHiln0bLI9t5aPI2stuhMizwpNGT2brZfS6hGkySgdXyD1U9DCHSIAaI=
X-Gm-Gg: ASbGncsZXQ+y2j3m6dvaz3QF+i8vPH/NXn/EGX5EcwCdtUh/EBdzKFUXyJCuwgYFuSB
	aBHuyULMpPrh8RQt3tiJL89Y8Px1la4FWKJiCTuLl1OFT28IN48coABYTsnbu6A4RCkgb67Q2vy
	dPPnXAocgXWwV5D5Rx34MMKnTOoih/ZK/8GtUpccvQrZMDzZAkhTH5IEtkTn/7S3u7ZpdEimZRX
	Cj2JFDv8tWTExokhUMYsAWBiodJCUBm9QrrMnOEmccua0FBRKrVgHn2gj2Td1DoCDPFA0D4f3lj
	GykMNwmqz4N48YfgDWT7/Jhh0pzcRJtbwTM7gd9458BsL4QeLP1sgVS7AbgCuv/LBleVtkdWwcR
	MvMeK7oAcjkVeixk3NQ==
X-Google-Smtp-Source: AGHT+IEh35K+Rji/J97KgXv7b0qtNlNusVFI1SmT/EdTjyyFjXOLkEHdIcDO3dFOzig1wg6gty4MyA==
X-Received: by 2002:ac8:5dd1:0:b0:472:15a8:4021 with SMTP id d75a77b69052e-474bc100267mr252633741cf.37.1741105184975;
        Tue, 04 Mar 2025 08:19:44 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-474f9a4f6a2sm17784561cf.1.2025.03.04.08.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 08:19:44 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tpUzf-00000001Go8-445C;
	Tue, 04 Mar 2025 12:19:43 -0400
Date: Tue, 4 Mar 2025 12:19:43 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
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
Message-ID: <20250304161943.GD5011@ziepe.ca>
References: <20250228182403.6269-2-miko.lenczewski@arm.com>
 <20250228182403.6269-6-miko.lenczewski@arm.com>
 <20250228193221.GM5011@ziepe.ca>
 <b23aa37f8e864dea82a6143bece912d6@huawei.com>
 <20250303103102.GC13345@e133081.arm.com>
 <20250303165255.GS5011@ziepe.ca>
 <20250303190330.GA426248@e133081.arm.com>
 <20250304142634.GC5011@ziepe.ca>
 <67fbe3f4-4fb6-4753-b34c-320b7897fd16@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67fbe3f4-4fb6-4753-b34c-320b7897fd16@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_081946_271363_12D1B1D2 
X-CRM114-Status: GOOD (  19.63  )
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

On Tue, Mar 04, 2025 at 04:02:20PM +0000, Ryan Roberts wrote:
> On 04/03/2025 14:26, Jason Gunthorpe wrote:
> > On Mon, Mar 03, 2025 at 07:03:42PM +0000, Mikołaj Lenczewski wrote:
> > 
> >> For example, if we use BBML2 for kernel mappings, does that require us
> >> to repaint all kernel mappings when disabling BBML2 on smmu attach? I
> >> am not sure, but definitely something to be worked out.
> > 
> > No, it would be a per-mm_struct basis only if we did something like
> > that
> > 
> > When the SMMU driver puts a SVA on top of the mm_struct it would
> > disable BBML2 usage only for that mm_struct and it's contained VMAs.
> 
> I guess we would need to figure out some synchonization mechanism if disabling
> BBML2 dynaically per-mm. If there was already a BBML2 operation in flight would
> want to wait for it to end. But that's a problem to solve if/when it's shown to
> be needed, I think.

I have a feeling we can piggyback on the mmu notifiers to achieve this
as all the changes to the PTEs should be bracketed by notifier
callbacks..

Let's hope it isn't needed.

Jasob

