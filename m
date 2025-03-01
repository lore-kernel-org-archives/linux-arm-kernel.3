Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41FFC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 04:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nRJXVNbZUpNIBtt8TFs13UDH3fN+Tw1tbm1ZW4YHs/4=; b=XdcJZnn+pzXf+pmNmekPopKpNU
	cloNUyqiZaSxpdB+nRr8WMWmEau9EjTe9rnjOHodN75UCOwszh2vKw51JKXEQ6yPLu9V5tCRD7hco
	EXgvoMIYd0/j7ee2fRUO8f6fQxuwSf3EVLhhysZ4d0BsFUrSUXDI1dXJwGfFPI3rtmatx390BVonp
	doSOmNW3sDZhjF6KqMG8lUdDCctIjPlTC9d3cCTifWofodKJmdhhWmywibGv+k91tF5Bz4ERK4m3r
	K6yIou0DonGXFOJ8M7nhFYAsJK0m3gVXz//8LQ5mhavi+ibNwomm3UzL7/Si77alBewofrEN5t/BI
	uNxjCCfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toEIR-0000000DNIL-0CYu;
	Sat, 01 Mar 2025 04:17:51 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toEGs-0000000DNBj-1EL8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 04:16:15 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-54838cd334cso3150501e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 20:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740802572; x=1741407372; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nRJXVNbZUpNIBtt8TFs13UDH3fN+Tw1tbm1ZW4YHs/4=;
        b=bGdsJQjVG6ArS3oB5Zp2/70lc6wDStxy2GFW4C7SogLV696hd9UwcV+k2nucrEAbe/
         qcX68XbyXoabtWp7mKDefJSuJhMVx+rJGLunuo1zDDFNRo03x3lpr72TD4LPeADHqNnN
         HA14B7QBZ04t4BBxJiXD9CtikvbgiqmqKh2Z0HSdCXLDhBVMY3fphnKIdgshAcWnVcB1
         pObMe4ybSTaiKGr0Qjd98z6KyFKzpNbm3S85l0zAh2TUemlIw6mYevT1jy0mHDP18vfB
         W/rH+56COSKwFh+uYxPOybE3SoSvd5TrBw5f/nkoli5fOmCNMePi2vS0LXirUgTWvEYD
         uP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740802572; x=1741407372;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nRJXVNbZUpNIBtt8TFs13UDH3fN+Tw1tbm1ZW4YHs/4=;
        b=vICAgkaDpbsjLd5jKGLZRY3svgFDNpxGWjGXvpiOipZhkCURg8NVgn2UOfYGb/1NXg
         BFYkQzaAwfwm+7DtA1sBPCZuRXHXfwVCRBDnLBsVX93Qvx4IQqJHxmQG4/BJB6QFMTA4
         kGVszHnPg6tPtqzSd6ydK/faxZPf7X8ARpnibehXSkA5sskujptXbBWtnsIwPQKbeq0J
         Qc0Mv2l9767Nb3LheLEsfh1/wEufx5If4wNqax4k01L/aLHQ9QRRqFYGSULTGyCddFe4
         nyFg72e5lyoaZs+By9izfVEmT7+/5+DpYqhTvFXROzDvqSnmUP5mKpiRiB5eGz9vUshu
         CWww==
X-Forwarded-Encrypted: i=1; AJvYcCW6TKYkTG02sg0KK0FhuMLjZeaVypUA7Mmc0s5VEvyQ8uwTJjIPc4Yt4baRXAO3bmOFEm38ft6hR541jYJ2NFFv@lists.infradead.org
X-Gm-Message-State: AOJu0YzHd4iKzgTkU4mYX6BCGuOhBbopuqf0k8AgB4aFZvpNTLJ/Z3gg
	b3VyxdRqeuFi8KgnyZozwI6Zs3izuASEbxGp8ebUJAe4pPGWxUh+aD3+i6m/zg4Phsbex3+MKQT
	isyClnsOvYXkiJkR33bxtG5PDnu0PcdeULm2vxQ==
X-Gm-Gg: ASbGncvy4+e54q/L0QIvhJ1J4ERXtD9Mh3nEBlXzfZ0LXVtvYiWJfqOdUa1e/x7Vciy
	oFzcxOz9wTfP0m5K2ULAUzCb6TGmdrJrXFwsO3mLV1hN6ZfcibTiVcf0UTGlb6WAkPcpK0MKk/H
	ddTTJaiy0eSU1DpozzNsO3a5ViMI21OfE=
X-Google-Smtp-Source: AGHT+IFP5aCHULz6zpIiPlJszPYhhIKQa4bjgAfv6H6nwuK5koq1iQ2nHbNDaxSV+n8l900FUXdJNFmIzAGeKlhCAx4=
X-Received: by 2002:a05:6512:693:b0:545:b28:2fa9 with SMTP id
 2adb3069b0e04-5494c122af7mr2774025e87.16.1740802571668; Fri, 28 Feb 2025
 20:16:11 -0800 (PST)
MIME-Version: 1.0
References: <cover.1740504232.git.nicolinc@nvidia.com>
In-Reply-To: <cover.1740504232.git.nicolinc@nvidia.com>
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Date: Sat, 1 Mar 2025 12:16:00 +0800
X-Gm-Features: AQ5f1Jq1aPPNEUtuYw2bvAu1XDeZv-PKWUyrHeAmpxtPMb0nHo1DtYawDISk28E
Message-ID: <CABQgh9FYqzoUxjR246QBPGW9jqngK1JpgfACvBTLTHq-mBBCJg@mail.gmail.com>
Subject: Re: [PATCH v8 00/14] iommufd: Add vIOMMU infrastructure (Part-3: vEVENTQ)
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org, 
	joro@8bytes.org, suravee.suthikulpanit@amd.com, robin.murphy@arm.com, 
	dwmw2@infradead.org, baolu.lu@linux.intel.com, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org, 
	mshavit@google.com, shameerali.kolothum.thodi@huawei.com, smostafa@google.com, 
	ddutile@redhat.com, yi.l.liu@intel.com, praan@google.com, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_201614_353374_067C0524 
X-CRM114-Status: GOOD (  17.07  )
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

On Wed, 26 Feb 2025 at 01:33, Nicolin Chen <nicolinc@nvidia.com> wrote:
>
> As the vIOMMU infrastructure series part-3, this introduces a new vEVENTQ
> object. The existing FAULT object provides a nice notification pathway to
> the user space with a queue already, so let vEVENTQ reuse that.
>
> Mimicing the HWPT structure, add a common EVENTQ structure to support its
> derivatives: IOMMUFD_OBJ_FAULT (existing) and IOMMUFD_OBJ_VEVENTQ (new).
>
> An IOMMUFD_CMD_VEVENTQ_ALLOC is introduced to allocate vEVENTQ object for
> vIOMMUs. One vIOMMU can have multiple vEVENTQs in different types but can
> not support multiple vEVENTQs in the same type.
>
> The forwarding part is fairly simple but might need to replace a physical
> device ID with a virtual device ID in a driver-level event data structure.
> So, this also adds some helpers for drivers to use.
>
> As usual, this series comes with the selftest coverage for this new ioctl
> and with a real world use case in the ARM SMMUv3 driver.
>
> This is on Github:
> https://github.com/nicolinc/iommufd/commits/iommufd_veventq-v8
> Paring QEMU branch for testing:
> https://github.com/nicolinc/qemu/commits/wip/for_iommufd_veventq-v8

Thanks Nico

Tested-by: Zhangfei Gao <zhangfei.gao@linaro.org>

After rebase on your branch
https://github.com/Linaro/linux-kernel-warpdrive/tree/iommufd_veventq-v8
https://github.com/Linaro/qemu/tree/for_iommufd_veventq-v8

Tested with multi-device in guests, with io page faults happen.

Thanks

