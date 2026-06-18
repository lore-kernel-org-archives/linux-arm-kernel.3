Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF85CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 21:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V8j94fpKwfXbxZh5xLHwe7ucGfUmxazlRZU8sB7HYkU=; b=KcrouwnXXydUgGRCdz/XDO7ICz
	5LdUuhuBL+pY41ElKKkkA2q861u6zMwVUUX0K7bG4evnaLlxparzVcviuaiYOntnmvp/mwApOvkc4
	QqEZU0eZy24onig7WbhKwNVphYw++5roW01Ix16VFy5H1OKoOdyHYEKy1UXmbNAMgadP93UtboiUk
	4u9LNOcXNwAhtd5m4wPKaZmLoUMa6emHnWPcGZB9pfrDVc+o2tV9uxZm8WbmceDjMy6Y7xijby4bO
	ntq9J8dniO6B7rJZ8mH7ue7BaB3xdTmKP1mDaSXZRq1ekMisNBlUfhayxJ8WDXL8/U4vxG64fO8ZZ
	8IXDgbiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waKVT-00000001oFc-3Ssf;
	Thu, 18 Jun 2026 21:42:39 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waKVR-00000001oFG-0br4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 21:42:38 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-84540c1fff4so1734098b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 14:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781818955; x=1782423755; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=V8j94fpKwfXbxZh5xLHwe7ucGfUmxazlRZU8sB7HYkU=;
        b=lJkeLEuX1njMgOVQWid1iPLoaGrLuk8oZ4yEKfdK1bZpjPV/VmHRR6/6IbDnpE2CaG
         2fOcWeCl6eFZYQcnO7qlh5wl/u/ieAc0TVoOXEFp8yyOoky91VlyDucLlZ5uDRLhF2Wt
         hUKvRJ/IPBrmC/BkmzjM9BIPTg2jitCNBlxe6f0ouqR49sNIID77UaSbF1hihSABhm6L
         MrQjzB8iHDUUFrHoU7gtzaNrB4pOcqWUMRWWSV4lNkf3taJYBOxGCXDGWDO2EKzJ5Mt2
         sndiH1TGFBWzgivEyAO4GyqbcapJvpjSG3ATUsVv0mpBebFlxxtiffUUKsHF7u86hhd+
         WJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781818955; x=1782423755;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V8j94fpKwfXbxZh5xLHwe7ucGfUmxazlRZU8sB7HYkU=;
        b=QvVoEstuhiCuc1fF/zi74Ek+N18E/opUl9sDkBOBkxlCYyn1dFskVoeJjMAF4My6Ob
         JP+AtUHv8cmofwgENlof56hpzJSNmU+rxop26MyJDUEPGvkPpDJXRDXShErtN8SWD74X
         aX66UcXbazZSk9amsiZUwGcuGFr8z/5XZT5c24H0/R0+qPUoWLC3Q7ioquioJwd/obQF
         9GU4tmtOCC96oFNUydhTsscFPmMhh+gjLhYdWc3PBB3X66PDgJsMFXeY6mnN77GllJAT
         7qYKDKcGYpOCyQMUG3//CM4ivc8k1eIFU3rJnXQxJ1jICnvDm0kZSqXAWsZa8SJ+/hQf
         k+Uw==
X-Forwarded-Encrypted: i=1; AFNElJ9iop5AEBrMdiOF7Dhl/P/oNlUEmj3HdZaBQzMobNI50gA+6t4rjeSdBDG2Z0IWEcdvdqZG3XPfEAifdtxxm5Ks@lists.infradead.org
X-Gm-Message-State: AOJu0YzUx9qGXPtKsxIlPMcrs7eXHTjXKscL5TKFaDdRIZjTBq0NNkM4
	ttTMYiSVM1w8XVGpcPouEsSqdb0bmpcj3K+5ZUG5n0mhXSBOQSbi/czJw+ydCrGn4G9OWc2OBxZ
	TA+eUdw==
X-Received: from pfbjc15.prod.google.com ([2002:a05:6a00:6c8f:b0:82f:20ed:8059])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:6c9c:b0:845:374f:4ee7
 with SMTP id d2e1a72fcca58-845507dabc4mr738565b3a.13.1781818954904; Thu, 18
 Jun 2026 14:42:34 -0700 (PDT)
Date: Thu, 18 Jun 2026 14:42:34 -0700
In-Reply-To: <ajRTZNum3u7oVdRa@google.com>
Mime-Version: 1.0
References: <20260613002031.745413-1-seanjc@google.com> <20260613002031.745413-10-seanjc@google.com>
 <ajRTZNum3u7oVdRa@google.com>
Message-ID: <ajRmStVr-2-QgqGB@google.com>
Subject: Re: [PATCH v7 09/20] KVM: selftests: Add VFIO device support to
 eventfd IRQ test
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Josh Hilke <jrhilke@google.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_144237_237948_60C62F97 
X-CRM114-Status: GOOD (  23.12  )
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

On Thu, Jun 18, 2026, David Matlack wrote:
> On 2026-06-12 05:20 PM, Sean Christopherson wrote:
> > From: David Matlack <dmatlack@google.com>
> > 
> > Extend the eventfd IRQ test with a '-d' argument that takes a BDF (in the
> > format segment:bus:device.function) of an interrupt-capable PCI(e) device
> > bound to VFIO, and use said device to trigger interrupts instead of always
> > synthesizing interrupts via direct writes to the eventfd.
> > 
> > Using a VFIO device to trigger interrupts validates the end-to-end delivery
> > of IRQs for "real" devices, and when supported by hardware (and KVM), also
> > validates interrupt delivery via IRQ bypass, i.e. via device posted IRQs.
> > 
> > Now that IOMMUFD is a thing, auto-probe IOMMUFD vs. "legacy" VFIO by
> > temporarily opening /dev/iommufd, and skip the test if neither IOMMUFD nor
> > legacy VFIO is available.  Add a '-t' option to the user override the probe
> > logic, e.g. in case IOMMUFD is available but the system is configured for
> > legacy usage.
> > 
> > Note, the device must have a VFIO selftest driver in order to work with
> > the test.  A helper script to list supported devices will hopefully be
> > available in the near future at
> > tools/testing/selftests/vfio/scripts/list_supported_devices.sh[1].
> 
> > +static int vfio_setup_msi(struct vfio_pci_device *device)
> > +{
> > +	const int flags = MAP_SHARED | MAP_ANONYMOUS;
> > +	const int prot = PROT_READ | PROT_WRITE;
> > +	struct dma_region *region;
> > +
> > +	/* A driver is required to generate an MSI. */
> > +	TEST_REQUIRE(device->driver.ops);
> 
> This series is probably going to race with merging another VFIO
> selftests patch to make send_msi() optional [1]. Can you add a check for
> that here?
> 
>   TEST_REQUIRE(device->driver.ops);
>   TEST_REQUIRE(device->driver.ops->send_msi);

Ya, will do.

