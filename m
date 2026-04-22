Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C8DF9EDD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 13:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxHtXNRYtwufGHW1ufeXFPBW1zoNUni80T80czPie2g=; b=j6u1zh40pZBM25Nl7MFFdh1rVd
	ruP1gxkJMgDvCbngqb00S03ThFK+4/9T2Nxma6KcGM5FnbusWQxmf9w4Lvq2BDryPB3wPhx3VUNwP
	RDMSEFLkn07ZF5HDXbB3lG/9QSaC3pMXpUCbNx9sn9xaQZPCzw53LyHXbMyGUdPzKa6iWyCrmF27K
	QJoygcPdcOV/rd9lXQsBqIMI5ZSfgVrDyf9VGZ50dwDnniSRDiSKHr+5snozqJfutGs6J1AN7FcUE
	iCQROEcT/VcwZg1oUi0P+PFprBt+7oOh36NxUHy9V8sP+vilXvfkm7ta5XVwZX3sM6nm9QukD1H8d
	ThBgw7Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFXkL-0000000AJhT-3HSZ;
	Wed, 22 Apr 2026 13:36:05 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFXkI-0000000AJgv-45fs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 13:36:04 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-671f1a0d0c5so42786a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 06:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776864960; x=1777469760; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KxHtXNRYtwufGHW1ufeXFPBW1zoNUni80T80czPie2g=;
        b=ZbMZ6QnD0+4KRcJFNb6BvMjwoHcWzIb2mh7E4AlSwbl0nwbJ2dwo6zbvHW4LZL4015
         MKCj1GbYe3UGSALOzPjkfMb5gH9KtAs4deNu1VftEjJWtegOsiyDHGKO52I5h6DNhD3u
         T+91QRKDomqCO3FyT6pcK0L5I6LWjNzVcnPbthnfQWvk6NLyhcs715xxTayZ8HMymp4Q
         wR1zSOh/6CMnej2ao8G5/+g1O5CDHIU0etdnn1wP+Us2hbPASG9sIh2K4BA5IsAYJTEE
         Nb9w7eEaZqAaUNhaZcFH9MUvhYYqGgawu0TiZd2g5Jm25fBCFEbOxNiKgbTv+3zBvtj3
         IRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776864960; x=1777469760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KxHtXNRYtwufGHW1ufeXFPBW1zoNUni80T80czPie2g=;
        b=eiFuBg73iEC/t4AFC4rOiePguBDpfuCkCqQPh1xvxnBophF/nFlz1jEsmc9XMV4t6Y
         jWJadnZyfr9iNRrZ0zJabKXlWYEp5Gi7dy93BaGqYvh/hiWSOsIe8GTjn8rfqq2OTCjk
         s9Bzht3ZifCtFZxEGWJ2M/xiKZRSj0am7i5lJbQ5gqCT/qR66b0dSmHDZ9El/1kptAuS
         kJ2761YfuXGBn+ZlYaJuZsFg3DAtadNzZCtxFTB9V4hKEDSMq5LwAQPOl/QRNHL92Mhd
         5th14zJ+dXnMTAy5z7EXVwrbIdeb92jx1pRb0wobo8rZz3LfsRiwhcNshEj48+P8ATx+
         VipQ==
X-Forwarded-Encrypted: i=1; AFNElJ9L6Es9eSIeUh5U/ytL1MzYGuYEbz5AaOmFJuc6tVyfTjeJyqbTIvLKDxQHC0/Y0ObGEUVQMg09Ibvq8nAjocD2@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm2I4KZ7KrrNZbZCd5tlbm2zobYnJas0lHYo/VXCcsKcv4mNx6
	WeHQPiLdGXGFGkTplqMiz+yAAgN2OG9vMeTwyoysOzCibx6+sHGHNMKKkuNySodGcg==
X-Gm-Gg: AeBDievfjZJzf4/dBnvwlItOQZ+//ki+KyE9RNKMLDqCfRWl+uOAlnjfYK2UsmA73eE
	dvi1lPoKo2y1XxfdRRaZU5r8M3C1iNIPQ5/BhSrW6sv0KtXcVHPjvffBCmtBlJt/Ce/2YYTwrG5
	rba6V2vyexETPcQKZXgMiR7dL2NIHQeZkrWiSprznaTXeAXxoP9/nSZP/M7olPXZ2rsbJYanOpK
	EmcDjPcq2UwU5GRpHSUagYO1VtYIRoMPAEAJTqkG9cCe3KBQ1EaJA8hJ4IloQm45Wzj+/YRT4ZX
	bGM4WYEf/BEKXsq2f/SSYHQKotGHd95GSoHOFYvfChv6/9jX03mxHPZ0tDeeSCtW5M9/5qluRnL
	3KtfaUgC5ByUXBDOz7RlM7qbEFrBtI0TFay/8oBlmGPpoKBs555Fkqr4NkEkL5Zb86uKxP0KhHz
	WmcJAbiHzZtXuKmqESfsXSw6cFtL+i1osUVtxomZaWSrS2KQGps5nOd87xsEME2a5Vp8bgcfBxL
	Sd5HaJSeywKZRuK9Ww=
X-Received: by 2002:a05:6402:3489:b0:66f:d653:92c0 with SMTP id 4fb4d7f45d1cf-6744d7128e9mr261268a12.1.1776864959480;
        Wed, 22 Apr 2026 06:35:59 -0700 (PDT)
Received: from google.com (117.15.199.104.bc.googleusercontent.com. [104.199.15.117])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451210e3dsm550252066b.2.2026.04.22.06.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 06:35:58 -0700 (PDT)
Date: Wed, 22 Apr 2026 13:35:55 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oupton@kernel.org, will@kernel.org, ayrton@google.com,
	catalin.marinas@arm.com, joey.gouly@arm.com, korneld@google.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	mrigendra.chaubey@gmail.com, perlarsen@google.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Validate the FF-A memory access descriptor
 placement
Message-ID: <aejOu98q1lEZoFfW@google.com>
References: <20260422102540.1433704-1-sebastianene@google.com>
 <86bjfb18v1.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86bjfb18v1.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_063603_034166_DDDD8033 
X-CRM114-Status: GOOD (  25.73  )
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

On Wed, Apr 22, 2026 at 01:24:02PM +0100, Marc Zyngier wrote:
> On Wed, 22 Apr 2026 11:25:40 +0100,
> Sebastian Ene <sebastianene@google.com> wrote:
> > 
> > Prevent the pKVM hypervisor from making assumptions that the
> > endpoint memory access descriptor (EMAD) comes right after the
> > FF-A memory region header and enforce a strict placement for it
> > when validating an FF-A memory lend/share transaction.

Hello Marc,

> 
> As I read this, you want to remove a bad assumption...
> 
> > 
> > Prior to FF-A version 1.1 the header of the memory region
> > didn't contain an offset to the endpoint memory access descriptor.
> > The layout of a memory transaction looks like this:
> > 
> >   Field name				| Offset
> > 					 -- 0
> > [ Header (ffa_mem_region)               |__ ep_mem_offset
> >   EMAD 1 (ffa_mem_region_attributes)	|
> > ]
> > 
> > Reject the host from specifying a memory access descriptor offset
> > that is different than the size of the memory region header.
> 
> And yet you decide that you want to enforce this assumption. I don't
> understand how you arrive to this conclusion.
> 
> Looking at the spec, it appears that the offset is *designed* to allow
> a gap between the header and the EMAD. Refusing to handle a it seems to be a
> violation of the spec.
> 
> What am I missing?

While the spec allows the gap to be variable (since version 1.1), the
arm ff-a driver places it at a fixed position in:
ffa_mem_region_additional_setup() 
https://elixir.bootlin.com/linux/v7.0/source/drivers/firmware/arm_ffa/driver.c#L671

and makes use of the same assumption in: ffa_mem_desc_offset().
https://elixir.bootlin.com/linux/v7.0/source/include/linux/arm_ffa.h#L448
The later one seems wrong IMO. because we should compute the offset
based on the value stored in ep_mem_offset and not adding it up with
sizeof(struct ffa_mem_region).

Maybe this should be the fix instead and not the one in pKVM ? What do
you think ?

The current implementation in pKVM makes use of the
ffa_mem_desc_offset() to validate the first EMAD. If a compromised host
places an EMAD at a different offset than sizeof(struct ffa_mem_region),
then pKVM will not validate that EMAD.

> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

Thanks,
Sebastian

