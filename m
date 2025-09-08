Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A68CAC589
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5WmHxV7Lreaj5eVFu8hF6qzhJomNY/sSV63hQxdrkJQ=; b=rEldBBi+2iGdvRC0yyi7hLXNjP
	/rT/2VupNHr46gmAzuFRYl3NNZ1BgDiUIMFJzviuVvhOiRvLjTxVdnSXadSkREb/CefikZKMRNTIl
	VBL0W38dWpHJpe+d6rzajWJapPsHPrDxUnXbETnow2s+M0sQYCUBPSVVa3xTDb5NwMWJXREvW6Z8k
	j2R4uYEwjRkPGS5E5cAmsOFbToGQJ/ZfIWbzb8tRoazqyA21VJH6UXA1uggpzjDdJWNbHC6vPSonV
	0lZxxESDn7gTzDZ7YXU4gwb7alApxFWiR3vBAiviOcAL6JiYbNmsULWStWFIbm68qeYiWNT1ZuZGG
	xeR6ZOjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsBX-00000004ogj-0aEF;
	Tue, 09 Sep 2025 06:50:35 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvhub-0000000210F-0JU5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 19:52:26 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-329ee88fb47so9074053a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 12:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757361144; x=1757965944; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5WmHxV7Lreaj5eVFu8hF6qzhJomNY/sSV63hQxdrkJQ=;
        b=tb8Wn5HgkFfHH3WXrLG9cCOe+xQXgNBa3UCVRQ54THCIn9xUCHrAnzyvRXHqK2vItu
         C2I36any4wDhoLCcorG7JRD4dgJq1ZFAk8skt4rTTdfYTXBTxZS9gcfZaoWlffMrCGSS
         BLPgKz0i+upWpkm8bXTs8N+a2Qk3WvRT4qW6D5FHRTcZcNgbje8zOzU7ZSwXbY/FLd/e
         Hck0T+Zh3cDn94vgfKmF9UH6dRIPXCAxExzKU6PmrV9cpn1bJoBhThOmuYPQqsmUQJs5
         cVQxOal+rmZCtdph8688NY5XSFjT2zI/r2h6a+bzifh+cbXAtWNikGDDNk1DGiE5ZpNt
         ppWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757361144; x=1757965944;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5WmHxV7Lreaj5eVFu8hF6qzhJomNY/sSV63hQxdrkJQ=;
        b=fcbbsE9hQs4Yfrey20zwk2W2aoE7xszAdEB+rnvw7NpQPmz/tU1XJ45K+zSfOSEy6t
         UBsHbcwCzYQ+fUcoSaIif84L2yHYfg48rZKemiuxkOksIZ9jqfK6ohcf/lrJbF8EFiGK
         0Q2DKcHmHZT5M96y70x+DHXUAWGisxX4OndHG9FhzZRrIXQ2ijeOlXFUHzkH+76ZmxWq
         FKdQj1hH+q0hXN/AQU3yIk1O8xORLs9xTHyRjQX2G0BbYqNk21SgcawvIh3CCWI5n9qY
         1rWEmO6TXvP+C4aV2eN6oyhcy5u2yJzHLI3ZHp9bdoPYJlCs8LPS6Ij0xdq/vJ+QAVsx
         C98g==
X-Gm-Message-State: AOJu0YwrSLT25vJ++h4a3doLZKoLjQxb6q1FrUXckZlbHSQL6XUN3dIm
	b+I1eRH11NSdpIyfD6pPtUI8jrEcmxmeEZhJM2WRxsIkBZoWBkPx9vrVahut6ilpBbHP7A/WxjX
	9V2Z4UQ==
X-Google-Smtp-Source: AGHT+IExCPRBqVtXN8qVa8YjvqbzwvBpn9IxtzEsHXQ/2kgRMpC8TgSSgM/sP14o8i1EVRy2DO9MXQPJ5wU=
X-Received: from pjbsj13.prod.google.com ([2002:a17:90b:2d8d:b0:328:116e:273])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5185:b0:32b:d851:be44
 with SMTP id 98e67ed59e1d1-32d43f0b8e9mr11203024a91.11.1757361144105; Mon, 08
 Sep 2025 12:52:24 -0700 (PDT)
Date: Mon, 8 Sep 2025 12:52:22 -0700
In-Reply-To: <20250819090853.3988626-1-keirf@google.com>
Mime-Version: 1.0
References: <20250819090853.3988626-1-keirf@google.com>
Message-ID: <aL8z9vZOAeQvTBKF@google.com>
Subject: Re: [PATCH v3 0/4] KVM: Speed up MMIO registrations
From: Sean Christopherson <seanjc@google.com>
To: Keir Fraser <keirf@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_125225_115149_DEC4F0F5 
X-CRM114-Status: GOOD (  15.98  )
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

On Tue, Aug 19, 2025, Keir Fraser wrote:
> This is version 3 of the patches I previously posted here:
> 
>  https://lore.kernel.org/all/20250716110737.2513665-1-keirf@google.com/
> 
> Changes since v2:
> 
>  * Rebased to v6.17-rc2

Note, looks like you missed a tested tag from Li on patch 4:

https://lkml.kernel.org/r/b778c98abb4b425186bfeb1f9bed0c7a%40baidu.com

Nits aside, this looks good to my eyes (though I haven't tested yet).

Marc/Oliver,

Can you weigh in on the vgic changes when you get a chance?  And a more expert
set of eyeballs on the memory ordering side of things would be nice to have, too :-)

As for landing this, I'd be happy to take this through a dedicated kvm-x86 topic
branch, or I can provide an ack on patches 3 and 4 (there's basically zero chance
of this causing a conflict in x86).

> Keir Fraser (4):
>   KVM: arm64: vgic-init: Remove vgic_ready() macro
>   KVM: arm64: vgic: Explicitly implement vgic_dist::ready ordering
>   KVM: Implement barriers before accessing kvm->buses[] on SRCU read
>     paths
>   KVM: Avoid synchronize_srcu() in kvm_io_bus_register_dev()
> 
>  arch/arm64/kvm/vgic/vgic-init.c | 14 +++--------
>  arch/x86/kvm/vmx/vmx.c          |  7 ++++++
>  include/kvm/arm_vgic.h          |  1 -
>  include/linux/kvm_host.h        | 11 ++++++---
>  virt/kvm/kvm_main.c             | 43 +++++++++++++++++++++++++++------
>  5 files changed, 53 insertions(+), 23 deletions(-)
> 
> -- 
> 2.51.0.rc1.193.gad69d77794-goog
> 

