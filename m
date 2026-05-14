Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87339CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 14:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TKVmCu+Gb/QJi05GS/MUngbhCp2nJ8/F0kCLFA01DR8=; b=ulGsq0Ae5jd7m5dzA9rk9FlBOy
	vCYXNwojnUEwVROkgRx4ZOYtXwaRRJ6Lpk+G7NOvPwr9e5t6Ug/VGCQqKfYevHyTQVFNSWJb/6rce
	BQL9y9TnSqTATnkL/Ct98bsNtW1+icsCZxnbrWU8f60sGWFEYXAp+IXuA7l0WppSIp6rtl1Q7cURC
	CzmPIW9NnAUpGVRvh5a7aeAXXvkRVhLQw0XWTNOGK3NLA0u7NMeHiALq0ibu+KDX0ikMWr1riPbaA
	2S3nJ5GWWn8zqT3TLvWVMRi1kLZCcDpNq/4Av72hXEqjcClS5oKoXy5G3hccEkfE0VWptF7usyiOM
	CxIwO71w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXC2-00000005kyG-3tNv;
	Thu, 14 May 2026 14:37:42 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXBw-00000005kwD-0oF1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 14:37:38 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-8b6ea7716bfso88265666d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 07:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1778769455; x=1779374255; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TKVmCu+Gb/QJi05GS/MUngbhCp2nJ8/F0kCLFA01DR8=;
        b=UgJ2aoCOcr3+XdcrAUL8Y9h4si5nYyrofp1KqIR97TTcfcwX7n3gAvmVYO8Hv5hHI4
         MUsX5lBTalZVarttLFmP8Kw6YTyumNrR4dXjS9ioTkKu4o3tQADT+hHERY81MLcf6WGk
         5SJD3b5eAnbreYMLHuuqYflMVHkYn1B0hbKF2sUv3G7pVK0cGooo+73BM4qpm5YV77oZ
         y2tG5qE3LWanlfEYhVkI/YtLZmvS54iycBPjlW0o3cWArG0XKj2InWJVShn9SqkJNMis
         oMsmMVF5f7S1qcULNNhgT/WEBKF73aGBdKaWj9QawVyI9ZBjdIxnc+42iqQm0zzpfDpr
         oJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778769455; x=1779374255;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TKVmCu+Gb/QJi05GS/MUngbhCp2nJ8/F0kCLFA01DR8=;
        b=hkLctNMUgBdN8flcRFhPgkvDkLDtHJo5sDxBNwUS1aGBiptDElXhaWvaYd9ve+TCJJ
         tAjKPR0BBqGP1jU0t+/M9ChHIsLHzuVQYE0A7uBSt7czfGRZeI6qLxVJrBsZ2oMpjiEh
         I3NvalkBPEZENnis/fdqd7E28dAokiGyjY8itLbJj0w7yhFv9TXJxCY6zek/JhirGjKH
         t9y8VrQDSVmx+4mCXm2f+6sICufiEATn+2aI9VLxmhJC9wkt335KMe+8FJmM/i4nic7p
         3uGT8h+Hg7emN2Sv2aIVp7d+9XOGVuB5gtxo8hWtr+F+y6fWLcjk7IgkZGJkTLJH4qh+
         1n8Q==
X-Forwarded-Encrypted: i=1; AFNElJ8PqdbWnX3B0t+X07VYLiLRNq1QJrghflsoKChAns0PCcPuYFvASl7M0VnaSTMN3XW2dclfI5AWMFX4j/XdBPB5@lists.infradead.org
X-Gm-Message-State: AOJu0YyFt0Pvcb9UfF+89nkACBUQV0WecUSWoQiyiy0UWP00gmYobO+t
	neBay1onZXQsic5wYjIfRoI9EYsGrZ9cVlu/4eTzXZjKrSyBq/DzRUAoT9B7PRXvGxM=
X-Gm-Gg: Acq92OGkc8R+tnOeZnGZ4h0lL7Yj1zKVsTcyG7/eMuU59OzRwBwW+OF80dZZzYz05wH
	pMggMGCsRi9OC/F9kf35jZegoWU9umhz3n7PhnxYjzse//I0SOiybEKxd4VNyNkxwwnsaFCKf/V
	XZZ9Ld4mhKIXhvCJONv/JzXBiwL04q5ilAgjYn4mRxV5vHURPK+LLO+HbI8BT0j8IqW02tBMwFg
	sr0KLdlZ/gQzfm/BzyJic9boj/rTJd4f/aP1QyqH6UsbPIFD8uieANnRKGza9gJik2weUDIWguh
	E8y6hpGovthpfHToPDm0MxOXMZPWplEnZCE9aoHKZaXrsCXzG3Zvq22g8ke+lXIEAICsmkdFUha
	9xPB2tGHdOjhQSYvwz4AX8eSFhGbcm8jG8wbf/sjX8F7gE2MfYWjGJ+4ESGgT3MBjKR3RedoC/2
	hRUREpFQVAYqBJbSPNszu7FEtmaP6OLvvLUtRHVSJjUVmdrqjyoQuQ7sM/qIPVu+STATrAMHsCX
	qIMJQ==
X-Received: by 2002:a05:6214:55c6:b0:8ca:ee3:6e99 with SMTP id 6a1803df08f44-8ca0ee376b1mr2894306d6.44.1778769454659;
        Thu, 14 May 2026 07:37:34 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c908e11929sm25017416d6.14.2026.05.14.07.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:37:33 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wNXBt-00000005Lti-0CPB;
	Thu, 14 May 2026 11:37:33 -0300
Date: Thu, 14 May 2026 11:37:33 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Mostafa Saleh <smostafa@google.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v4 04/13] dma: swiotlb: track pool encryption state and
 honor DMA_ATTR_CC_SHARED
Message-ID: <20260514143733.GB7702@ziepe.ca>
References: <20260512090408.794195-1-aneesh.kumar@kernel.org>
 <20260512090408.794195-5-aneesh.kumar@kernel.org>
 <agSKQrSIhizCXKwx@google.com>
 <yq5ah5oaa63h.fsf@kernel.org>
 <agW5rhE9n2gDQ0w5@google.com>
 <yq5apl2y5f96.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5apl2y5f96.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_073736_909894_39C6815E 
X-CRM114-Status: GOOD (  11.99  )
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

On Thu, May 14, 2026 at 06:18:05PM +0530, Aneesh Kumar K.V wrote:
> > There is no problem with non-protected guests as they don't use memory
> > encryption, my initial thought was that th encrpyted/decrypted is
> > per-pool property which is decided by FW (device-tree).
> 
> What I meant was that we need a generic way to identify a pKVM guest, so
> that we can use it in the conditional above.

If I understood Mostafa's remarks I think different devices in the
guest need shared/decrypted and some don't? Ie a virtio hypervisor
device needs shared while a real PCI device doesn't? Is that right?

In CC terms that would be a mixture of T=0 and T=1 devices hardwired
and signaled by firwmare..

Ideally we'd have a flow where if the arch precreates a swiotlb pool
with special parameters this overrides all other decision making. Then
this series is about making CC NOT use that flow... ??

Jason

