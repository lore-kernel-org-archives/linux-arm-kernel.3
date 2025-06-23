Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24326C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 19:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KdWZjBOZrnoU5S/xxe3p4LyXR96yMFXC81nKL3+yk3w=; b=qKmu0FninmofzFwBIL/VCJOXLH
	aiN/QKYfP17djAXy/Hr9KGnavCW4ysU7FCyM+5+tIN4u47xcocfD1Vi/PdXEKslIxKOCDKWAoPLR8
	A6/AzjQ6O8YVJSUnIvucMZvYh8Sd3Qu57noGvl84P0e6GTBVmkJ2B7gWdTCRY5m3Sh6GlzFlto2eE
	pU3CiGyT4wBiptfI0l+AnvFytYoXaZRtlt+UPouioIMvolKYXw82jg1VAJIl8jEp/YINAr1H3lSyw
	UFKB05qdU+6eaw57YL7ddYRgG1VXV55sft+9XYjCJut2C+So1M7XpWjv70vjXcMSQWXqKpmqYmsC6
	uNl3mk2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTn3F-00000003ox2-1rfd;
	Mon, 23 Jun 2025 19:41:57 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTj7Z-00000003Eyt-2lCu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 15:30:10 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-23507382e64so40139945ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 08:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750692608; x=1751297408; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KdWZjBOZrnoU5S/xxe3p4LyXR96yMFXC81nKL3+yk3w=;
        b=2NWNVADA6jUD+UWYi9PapaLqHkwCWmzSiG3MA0B6x0gFwwTFPtlG+60Vm8EZkuAnRx
         cf8gXuHgR9ni/hqtED8od+W4ZtC+adT9JcGSAeR+KNBXytgELk+cGR2fSZkfmUoeoSGq
         CZFVAS8CvVeROIE6ypacZy8pbLEe/9Rrcdk5g7TsWNYehu145iNhfQvvap4h3CRsP8eq
         SViuvEPKbMartxLT81mhKK4yzDiA77xz+ns+8aTiaJa0pS6AkFkXVX1wkE1ELBBq3mNy
         XibUFRVXkaqXta3ovBEFrrjXpZS603riIpWeXTlxwIV8VnqC5vZtLnB8mgfcrHIJMhBy
         Uk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750692608; x=1751297408;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KdWZjBOZrnoU5S/xxe3p4LyXR96yMFXC81nKL3+yk3w=;
        b=uD8ry2YrqsABd6o34HhKcXkdWL1hnbEKOoNrB3lkrI2nQlV7CcjWYaUd4wzIS9UE6p
         ck0SQPgu7jLlg7r/57O2GwA2HDUJC+pBxcC47KNpJUTNTZoQ2CmeWrWSTRm7nUpwmMHd
         NwhcS/qu+vKuuNotYV+uZzmuLhBHQOZIH7BPDiaUZcHmHdguh/q8zcwVDmqkAH0Mf6ks
         R5aeRrjHn7azZvJsUGZI9HxnpL3Mqtb5JMIPlOtzInB2d0Y8PFholAqlaGyXNT/B0ReB
         ST88TG6VSSsjPspfBmk1/oxksMyOkhJA7eq7clMIMVoC8GPEEpic7lfJrZsEmtakc7km
         hydw==
X-Forwarded-Encrypted: i=1; AJvYcCXU6zHl39WHCykn52yKn+s0DtZXJAe27tYUBysi0lleD1lecx3U8N7tGfk7uKieMEmcsnobgwBAsoS8aRs+zSV2@lists.infradead.org
X-Gm-Message-State: AOJu0YwnwYJbF2BwYEeeIYMdV07TJz1QbM/FSVCHXSbopPlY0AVuyg1D
	DcSiDOez/LhPIzFdTSaf0ZPT0xIIih7QoMTGaVatSlKPfw9QFOAYP7q7ZIg/n5CbY8w4SjA9rNe
	oFNVV5w==
X-Google-Smtp-Source: AGHT+IEMdoRNFqlp7zHt8uHjKfPleNVgWrvxFNisVXQLf3SXuV2EWfHq7AYIrMPraED+yf8roaT/XGVYptg=
X-Received: from plhw5.prod.google.com ([2002:a17:903:2f45:b0:234:a456:85ba])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:da8c:b0:236:6e4f:d439
 with SMTP id d9443c01a7336-237d9965716mr203757385ad.23.1750692608274; Mon, 23
 Jun 2025 08:30:08 -0700 (PDT)
Date: Mon, 23 Jun 2025 08:30:07 -0700
In-Reply-To: <jskiyda3defofthrtniugcdbcoftx4o5yvgt47koswq64qf7d7@2pzrr5v5yssy>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com> <20250611224604.313496-20-seanjc@google.com>
 <jskiyda3defofthrtniugcdbcoftx4o5yvgt47koswq64qf7d7@2pzrr5v5yssy>
Message-ID: <aFly_5c0aqTOGEem@google.com>
Subject: Re: [PATCH v3 18/62] KVM: SVM: Disable (x2)AVIC IPI virtualization if
 CPU has erratum #1235
From: Sean Christopherson <seanjc@google.com>
To: Naveen N Rao <naveen@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_083009_707966_59B7612E 
X-CRM114-Status: GOOD (  15.29  )
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

On Mon, Jun 23, 2025, Naveen N Rao wrote:
> On Wed, Jun 11, 2025 at 03:45:21PM -0700, Sean Christopherson wrote:
> > diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
> > index 48c737e1200a..bf8b59556373 100644
> > --- a/arch/x86/kvm/svm/avic.c
> > +++ b/arch/x86/kvm/svm/avic.c
> > @@ -1187,6 +1187,14 @@ bool avic_hardware_setup(void)
> >  	if (x2avic_enabled)
> >  		pr_info("x2AVIC enabled\n");
> >  
> > +	/*
> > +	 * Disable IPI virtualization for AMD Family 17h CPUs (Zen1 and Zen2)
> > +	 * due to erratum 1235, which results in missed GA log events and thus
> 							^^^^^^^^^^^^^
> Not sure I understand the reference to GA log events here -- those are 
> only for device interrupts and not IPIs.

Doh, you're absolutely right.  I'll fix to this when applying:

	/*
	 * Disable IPI virtualization for AMD Family 17h CPUs (Zen1 and Zen2)
	 * due to erratum 1235, which results in missed VM-Exits on the sender
	 * and thus missed wake events for blocking vCPUs due to the CPU
	 * failing to see a software update to clear IsRunning.
	 */

