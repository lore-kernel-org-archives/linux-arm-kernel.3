Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5635CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 20:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R8xCK89QfRMaVvrkpnB5YO+Fnx8pGynYV6YoyF7gSgA=; b=KTIb08LyyXdnoK14IhGTYGLFgo
	BmpkAP+sOVPiOcAChLoUF5iamXqg3Hi31BCnDCJINzQtmrfztsuwIgCisPKHVljvW2WiRHoCwGT0E
	GUMksYmAULx2/BjVjeSoog6cu4cBetW9L/XQklMGvST6RZmDFsezwMecxI8x53psbmC+RpPlmhFwD
	cXvOZLoIuEln+fhNRgjkY7insA6H/incywqf7TW+YyO1mg7P9ztKfe1V+snm3Rl++nJXlq3IChC5N
	bVmqob76o8aXAyrd0gw1kh1oFjjrtXutYfQgxjR8TkRcpcIuA1I3ga2HIgKJP27XQkL/iNeASkXwZ
	A7Zu14IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waJFW-00000001lno-0MVP;
	Thu, 18 Jun 2026 20:22:06 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waJFT-00000001lnQ-3F2m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 20:22:05 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-842307473b5so932737b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 13:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781814122; x=1782418922; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R8xCK89QfRMaVvrkpnB5YO+Fnx8pGynYV6YoyF7gSgA=;
        b=U/KHDdBgIcKnqgftfWqglBQXRDEt4lHcJu5rHv8k7I8GdsJrPNszeZdRAfEyY2KHtE
         TsrLS6ghraWd/hGWMe8wrvJ4Ep3EHeuhQWUOsuwvxiI/uZcbhXbEvyeXdEjPvF2zrxkW
         3YrEuXewbjW8XFtyxdeRyesSxM0wLsOHM1nP+IqYkhF6fYzTou+bd0RGDcSA2WvQDUb9
         hZ3hopayep3PGxi7gh/8YuHRCSn2mgHbJpf/zVOS5fBgyj+nw/HnSthOH1G4PZZuih+5
         BlNleasUPhmT2+wxRtHgBS3yIE4AIbVFLVLEdwjHklLTVFaj6BZoDWc9P3EqCC40oblt
         U0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781814122; x=1782418922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R8xCK89QfRMaVvrkpnB5YO+Fnx8pGynYV6YoyF7gSgA=;
        b=UIeHOLXG6uIbb7djh0/u6RrebPi3ZIxxqbmwXJT1L4hFXz9gwOznKgsMMRB11Wwi9v
         8quPvUXSzq7eR7J78yo54bfe6GZKP9zEcTiIa1kN1mmkwu/6r2KF6LgwhxKSjHRtrGf+
         Jxb6612NT0hAq3EA90wnsslrBLNNt6NqelLYqSLSKTPz9mq1EnKUOxzCP1/Z5hahxLNM
         LPUDe27WpOF2TuOMXQXAUyaRONXyHLy41E2G7vsyKAAeX7Fi30C8MqdgmxU5S0MAuj+C
         kT7zlLE20JFr0CIuCJqQdJmMC9J/0QG3VF41Zo+n5Yc9kiLIVv8xz+BABNWHGqOghq1/
         f7Mw==
X-Forwarded-Encrypted: i=1; AFNElJ+1UZ/h4nItUTFeII8x6jJ6Z6JO8tU+7GC43H/958Hugf5A/FMC2cXhsjPSFo6Wu4LhhBvTDPX2jhQCmGKZ8NPj@lists.infradead.org
X-Gm-Message-State: AOJu0YxeSxbdEuL6Z1bSlJaa8tMS381/50JHvTyQmVhow3Nts/xGJh4C
	m4cwQdv+pajCd28Qq1vAkBIvRSH1Zu8nrFmxHThPxVDs1XEuJV+tXfcMSeeJYHCvDA==
X-Gm-Gg: AfdE7cnedUSKkUO4VgYKY5i4ZmTJNZEpt2DnT5xvHm3jkn+8lVbMXS7a7oiEu6Uz7W5
	leCZEe1gWVVRYqDz1P7NEdW3O6pFQ81dmJQuzG1DFZR0O4BUPBKPHvmw0mX+BpF46Wq97ELHA5a
	5E1sfdj4Y37aTJedHxsiWQur9cnFRIl4Wdcnkgh9geWenaqwDqd+IPZf+TyFe84V1jlxXtCoMlb
	w8ZDAeC0qb8TpkLA5VaLfVPJhkCDdVt7+MlXLpNzSyAx0drJu/z8LES9K8tGgKIioRsllACzU3h
	mFH10MiwuqXDmUmSFsXIfsU3JLF8rSz/oRH4TJTaxntecIn2dLehTgjg1hXBRgNaw6GvMyipJdf
	nFaK1t8XCUPSBQiK4XC3+RQxQM9T1fhFpKYoBv8Ilh22ScUGD4Pw1xo6TkNKW2wAfrGF9XFp39/
	GE1sKKAaMrdGQU6n6OybnLQ45LI5aBopttCxtJw9NrXtbuyb21zEA=
X-Received: by 2002:a05:6a00:4fd1:b0:845:17a6:5741 with SMTP id d2e1a72fcca58-8455079c80amr485384b3a.1.1781814121017;
        Thu, 18 Jun 2026 13:22:01 -0700 (PDT)
Received: from google.com (56.149.168.34.bc.googleusercontent.com. [34.168.149.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8453a8c9770sm3735614b3a.40.2026.06.18.13.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 13:22:00 -0700 (PDT)
Date: Thu, 18 Jun 2026 20:21:56 +0000
From: David Matlack <dmatlack@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Josh Hilke <jrhilke@google.com>
Subject: Re: [PATCH v7 09/20] KVM: selftests: Add VFIO device support to
 eventfd IRQ test
Message-ID: <ajRTZNum3u7oVdRa@google.com>
References: <20260613002031.745413-1-seanjc@google.com>
 <20260613002031.745413-10-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260613002031.745413-10-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_132203_855319_2D3D0999 
X-CRM114-Status: GOOD (  19.02  )
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

On 2026-06-12 05:20 PM, Sean Christopherson wrote:
> From: David Matlack <dmatlack@google.com>
> 
> Extend the eventfd IRQ test with a '-d' argument that takes a BDF (in the
> format segment:bus:device.function) of an interrupt-capable PCI(e) device
> bound to VFIO, and use said device to trigger interrupts instead of always
> synthesizing interrupts via direct writes to the eventfd.
> 
> Using a VFIO device to trigger interrupts validates the end-to-end delivery
> of IRQs for "real" devices, and when supported by hardware (and KVM), also
> validates interrupt delivery via IRQ bypass, i.e. via device posted IRQs.
> 
> Now that IOMMUFD is a thing, auto-probe IOMMUFD vs. "legacy" VFIO by
> temporarily opening /dev/iommufd, and skip the test if neither IOMMUFD nor
> legacy VFIO is available.  Add a '-t' option to the user override the probe
> logic, e.g. in case IOMMUFD is available but the system is configured for
> legacy usage.
> 
> Note, the device must have a VFIO selftest driver in order to work with
> the test.  A helper script to list supported devices will hopefully be
> available in the near future at
> tools/testing/selftests/vfio/scripts/list_supported_devices.sh[1].

> +static int vfio_setup_msi(struct vfio_pci_device *device)
> +{
> +	const int flags = MAP_SHARED | MAP_ANONYMOUS;
> +	const int prot = PROT_READ | PROT_WRITE;
> +	struct dma_region *region;
> +
> +	/* A driver is required to generate an MSI. */
> +	TEST_REQUIRE(device->driver.ops);

This series is probably going to race with merging another VFIO
selftests patch to make send_msi() optional [1]. Can you add a check for
that here?

  TEST_REQUIRE(device->driver.ops);
  TEST_REQUIRE(device->driver.ops->send_msi);

[1] https://lore.kernel.org/kvm/20260609232855.3808971-4-rubind@nvidia.com/

