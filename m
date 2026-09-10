Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0336C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 11:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8QbTTWk563brFKzUulM5hzJdIlUHhbe3RJ1vb+Th/iE=; b=DHXIlEnF/7JYbqrvLGmvlwAd1z
	LYmJM7G9CfA70w/EuFXtO2cCB6dh139rY0vF7YunWuPpBWNyOS3w+DlpwcHjybY9J2kVvh+QO2WKw
	+hY2lk0lwoRSm3KagkbW/H0M462ULeYhWRR668jolU31UtWvveQWQqooq46/+YHoX3QVnFoiIaR0j
	vJjH+O700t6QyOcNHIyGPTBUbq+h99R8i/cXV29lr9rqo0dnQlQ3jsSGF/IAfrzxi4Kj9AROzieYO
	XvojBvSPuz4lidVtXOFgQM++9lzlXJQAdlIvs1UVtvJ0wtPFVIbyk/nua5jlIILfjIn1mbwR+usTN
	WySm1pXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cfA-0000000EAVN-0vN4;
	Thu, 10 Sep 2026 11:09:52 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cf7-0000000EAUM-1cWf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 11:09:51 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cea4bfd1so861804a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 04:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789038588; x=1789643388; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8QbTTWk563brFKzUulM5hzJdIlUHhbe3RJ1vb+Th/iE=;
        b=B9mcoRAQhWIwRX7RI9CgEp10CcFbvJDMX9yeGOC0wYT8WxLGuhuofJa8uxKwD14xuI
         ZL/M6QBpeqFuVrj/RFUngEz9sV2xP2vFoII7XMjfXS2pnr0I6+xXgQkKynXoJZBP6f2P
         n4V79XYAllh4LoPPOJxcKQA3Pbr4u3pe4zL+7ComYBlUbpn+9GrLfHxnh4AZkWqbZN1S
         O5FLfo1hJ3jUgK4BYpf6U0YtsN9Gt7aie8VgeWR4LDg/kUGdaA9TjhUpXIz4m4aZ53al
         Qa1lKWVIY9xRkHtVZCK1MlhuZOeXXiodvv9tEvCLQ3PZBSJMhi0GRqh6vAVU2W2oQWii
         d94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789038588; x=1789643388;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8QbTTWk563brFKzUulM5hzJdIlUHhbe3RJ1vb+Th/iE=;
        b=s2kLqYpAxLv31IG64y4vRyj9f12RqxG281EJL0Las4VPdpbvQq1dZvG4F4Ldf3/sQn
         958X1Xyk3u8vrxlGgEMzX0KPgch69mGYEg9U7BXzgrf1K+12bMkrWzPF8akSVaerQ09j
         QB4IcDJJ2SAjwW4VN9I3aVPKFVdi2f97rSQWMTcIZhyioUOYVBESPKdHHa2asFmecobt
         Eo+Oklc0/j6tA2GCXoHlSmW5ZFIM7cCmEOqmFVeEIisvHvfK7Tjwv0YAdaYWz3QBVe9E
         aXxFJ9NXu0iwbYukvnQq5CVfYioK3IePm5+H/kE8Fm/t9zMJ0JuQiyAyyaXsbTeu+st+
         JNLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAYj2Y7Kc3zHHSVXSaXcE4X0mueqx3o7ZIIwFfIG7kdtPHN1i8buTfH01tDMr0sZIMD+kKmNS9FJ2xF7UcUcc3@lists.infradead.org
X-Gm-Message-State: AFuF++nxXIfD6Wb5984cXgiTrGJo2BnuxnDFQ7kyWxEcd8VwYa1yaxqk
	Th6AVWAro5pXjdE89LTyYTcbkAFhIAb3n7/6O4NNRVoKlVj912beYNSq
X-Gm-Gg: AYBFou1KsIoZVzp/j1Kka6QrvMXpwOtJqDwPkJQlg0OOJHxtXY0w8ktpYdL0lrSU9yE
	+PVK115/qps5/41fQLCC+yVn1+MccnFBesuwTo1gNb9zr3HupjU138rExJ4nPopGVhMwwFYkMdz
	yk2022wpndfPWfPYb+etkLYSSWxwRIJ3jKWZHZtzIBssgA14jR3e+d8Tz2gxZAqwfLbUCF39iWH
	cy+vDG3US09pt5G5q9ekQJMfUWcY86rcsLO2NaPB0nfYiIZ0ZdmXv1A2x7rxSjAbJCOa7dugjKx
	7dUu4Gh+JzgDPW2GprBXFbwAYJblavI/WP0AkWopiK51kZmDzhN7GiTp3hLNVpwtk8S15gLxDcD
	kniGqdX+npEQrEC2jDQmL52DY7a/+q77yPN2fOJUUFsvzUZqQWhdbugV5A4wZ0rdP7TcG45NukJ
	vZu7fSvp/i7YnrHOdmW+b5IjiGgUNwf+xiztGXAlxh9ipT0j5Re7j7qjYl3gHwMwbiI+mGrPbWT
	pME+9aZf1a68edDeY4D+LRuBrJZAWAXfkmA2VEd7Ga0MWk/TbQdFts=
X-Received: by 2002:a17:90a:ec8b:b0:399:1b64:e0d7 with SMTP id 98e67ed59e1d1-39d70bb1bd0mr11082578a91.19.1789038588475;
        Thu, 10 Sep 2026 04:09:48 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432424d27asm68881202c88.2.2026.09.10.04.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:09:47 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 11/20] KVM: selftests: Initialize vm->memslots[] with invalid memslots during creation
In-Reply-To: <20260902164123.2546762-12-seanjc@google.com>
Date: Thu, 10 Sep 2026 16:39:02 +0530
Message-ID: <7bkt1hyp.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-12-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_040949_425631_F91ADA9C 
X-CRM114-Status: UNSURE (   6.70  )
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

Sean Christopherson <seanjc@google.com> writes:

> Initialize vm->memslots[] with an invalid memslots value during very
> initial VM creation so that failure to configure the core memory regions
> generates an immediate assert instead of potential weirdness, e.g. if slot0
> is coincidentally valid.  This will also allow hardening the region APIs to
> guard overriding a region's memslot multiple times.
>

Sure. Looks good overall. Please feel free to add:

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

