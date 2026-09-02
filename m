Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A06C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 17:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SdKJUU1oimzE531v2SlLnET8xKOYeS+3soklD8mAhs4=; b=XDV1cVUHRfH4qFM4z7mAaQN7ik
	DJ5dWH0iAjN2tfO1pd/W0dPTjDFldnkPicAoAkvpLKYxvQpFDXXos2Adi9LEDPOhHyLIWrcNsHLhi
	Shf2i6WTNLeXegrRjAoVLcgfQGQiESVhHEVsF9RvasgfRQXXy5nxOVRB+RKYsoYJavHG5mge+trkU
	MbNVe3qWaRT1V3IEbt9FlcreeQo1kqeyLh1+IaTvaQptrWL/LFQ+hNTOoEMxj91EjuSBAUtjAvEw2
	vpXEoTn8U0BaXLn1mxfO7dn8L4yo5h1+RJ1gA/9BpcInKglfA337q8djJrT3D6VZRi5TmYsWuoNwj
	KtZRbJbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1p9a-0000000FV7F-2pYa;
	Wed, 02 Sep 2026 17:53:42 +0000
Received: from mail-pf1-x446.google.com ([2607:f8b0:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1p9Y-0000000FV4o-2q1s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 17:53:42 +0000
Received: by mail-pf1-x446.google.com with SMTP id d2e1a72fcca58-854f274dd69so1626381b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 10:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788371619; x=1788976419; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SdKJUU1oimzE531v2SlLnET8xKOYeS+3soklD8mAhs4=;
        b=blaHIsYa4LUu9+06G5DwbbvARTfgCgoQvlOJ7txCm1KuFO1w8z84fj4CPuxLH+AKyV
         GZf4ELoAoH0eUoBT/Sjyn6zDkyYo0jJdPyL4GmLAKo1vFBSF3wywaxPuK9Nf/juwBzru
         aQuuDKlGfo6XtQf0b9vzllvKDhzyx8n4z0KOZlF5WHKeNv1IcaMSDQ90eOLio0/n8XMa
         5YAwzc1WnRmu+dsV0h/y29JwFtIcvZPR+MHWs6fMvfd/Gkt8gzsFLySz4qFJp1pmcipe
         zln2FkPBZ77CXV+lG8wT3SBEpElA+bUBnII/r58kCJWMNXNnC+4gTfu4ywAnyNsBfh3i
         FiTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788371619; x=1788976419;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SdKJUU1oimzE531v2SlLnET8xKOYeS+3soklD8mAhs4=;
        b=VX7EW2H6cISHJQv56Q+GVVN33ej7Wtbdb4CJ8Qc5uBInE/w0sqPYbFaPOtSaSoEzqE
         I4Zz3gpuubsAoaCe01H3vzusYneXG7iZTEOxRk8JpuzkHLtyh14LU5c8kWeOr5E3OwmP
         W9RfsFV0/aWsYj8Vx6Y8CXkSjEU9GRxZpqx9TISJf8b6uPduB2KUPnXOcJTvD78Njd2i
         A/DIuF4KT/wf9Pej9kWb+H1j5FeeO6jbLfh0ohCYQiNpXpp3E3TfwTxD6G/9qf73loIM
         3bJ6j6R/y5t4E8jx/jX1PYifVnU6tYAQHychzkl9JT0u5jX5X8FRiEJrWkCVXEXgkHl6
         wKug==
X-Forwarded-Encrypted: i=1; AKwUvBxka4QUZQJiING4NS+c2yzYxEX8DzgmPXXmDCkdSihCcU0uHq8IrhybymiGWlcJfu0pro0XL7vFCzTidvicfjTS@lists.infradead.org
X-Gm-Message-State: AFuF++mEcHhLBBNqlhbNRMpTHtXTxkEGYG6aF4UZbuxNOeMOu7H/KsVR
	0kIOZiS0Kp0e20WJhAGSa/OoFuynLZ25TdRwsIWnAI+j70rkIeTkGZYrLWl1g9XZrKEX8Cc2YlC
	FTTRbHQ==
X-Received: from pfan9.prod.google.com ([2002:aa7:8a49:0:b0:842:83c0:8d73])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:440b:b0:847:9aa8:d3ce
 with SMTP id d2e1a72fcca58-85ed1b0e821mr10816352b3a.2.1788371618918; Wed, 02
 Sep 2026 10:53:38 -0700 (PDT)
Date: Wed, 2 Sep 2026 10:53:38 -0700
In-Reply-To: <aphhKDm7Vx7G5ivr@Gautams-MacBook-Pro.local>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com> <aphhKDm7Vx7G5ivr@Gautams-MacBook-Pro.local>
Message-ID: <aphioo_KTboUCtZd@google.com>
Subject: Re: [PATCH 00/20] KVM: selftests: PPC pre-enabling
From: Sean Christopherson <seanjc@google.com>
To: Gautam Menghani <gautam@linux.ibm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, 
	David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	Ritesh Harjani <ritesh.list@gmail.com>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_105340_709454_537D932D 
X-CRM114-Status: UNSURE (   7.64  )
X-CRM114-Notice: Please train this message.
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

On Wed, Sep 02, 2026, Gautam Menghani wrote:
> 
> + linuxppc-dev

Ah, shoot, I *just* posted v2.  I'll add linuxppc-dev to that cover letter.

https://lore.kernel.org/all/20260902164123.2546762-1-seanjc@google.com

