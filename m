Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4255DC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 11:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4oV1R7Sem2YZktphiH9OH9k3wSSCyVuVuzldh1QWGuY=; b=Cm+QOyWwftvqGuHds+F9Hh5sfJ
	5ix6biuqjrC8fpmsvl5EIUExhBtG8dqSqRljqSSIvkIrJiUeZvLw3t7F0FEPYnYjpC9+Afv/h0Y54
	Ss05cnYOVxdQ65aari1YAvyXXtpCHvvTiNPd6nL3uTyRMyypGz6twDCvzuyWhu/zYKv1Yc3oZtRre
	Sy7HYqtEg9KjTmfntWY4LQ0oqMLK7hAp0cxwUOdkXE94zTXzacXtXflE6b5nx1ND+BrEmbnQSUq9p
	KKEuCLLvCdpdaVhEwW6REX3RvQ29rzbUQJ7pQQQyPSoLnK+oIbGy7KCxishO0Oz2GT+ebdNNEgqD2
	yOht/5sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dEd-0000000EFuq-1Jpp;
	Thu, 10 Sep 2026 11:46:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dEc-0000000EFuA-1mR5
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 11:46:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Message-ID:Date:In-Reply-To
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4oV1R7Sem2YZktphiH9OH9k3wSSCyVuVuzldh1QWGuY=; b=aM5AvDbTWowjKFPpE8RnTVqVL1
	jcrI3kSChSiK+PTbKfkXhHGfjDw+oCb5FtBKLwOjlqNjP2dM4V7NW1bOfPOKP9ZettxhhNkjrZMt+
	1I0E5N5He6ieohBjDe9WQYgHuJkXvCDbCtPjdwNYfM8hLYOkW1ub2EnEllQeACwogft5Uw58DF5bd
	pugDrhSqXynVIkAM36HmRqiNckuBltqHqFP84DfIf+uVbTxMjzzPC9xdQjzdQJViC2TbTZFIRQRIR
	VZJR+q+69YXfHt1hoC8RJThOh56cc4KDeY0q3TrynKwrHHvjLrv4DCrQvyt84ro+JIO3wIwBpigj/
	GoLQXHLw==;
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4dEZ-00000002QDx-23zt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 11:46:29 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-6aa9606ddadso4843248eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 04:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789040785; x=1789645585; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4oV1R7Sem2YZktphiH9OH9k3wSSCyVuVuzldh1QWGuY=;
        b=VZ53K6v9vY5ZHQp15jqRz4bSYPziex4fES5/64jiABnKFPRuPnXYILefpI1hx9lhmk
         MQZJG0q1oJsoHXWEKsVjctnhjRB5hCOjXcNcSXDZaICzYU3bB0o489ZdMKz1fSwXhRNo
         gwHZ0RnOgFer4NQ4VeeUt0IgZy+kY2ngVeXJiSWYERf1u71Y0I/EluduYWNvBys8vO5t
         hGpR8rnRQh3QeAB6aMBla+8+USk9NYO1/lUIImk/bBnGrzXBZKq1I/I3IdBncxAu4JzR
         TrA9YWq12O/9pZrWksgk969D654bsYYdZZVqAxdh9+LXCX5Q0XvQLWKpKSPK/tKynhPa
         laKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789040785; x=1789645585;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4oV1R7Sem2YZktphiH9OH9k3wSSCyVuVuzldh1QWGuY=;
        b=gWotv4V35GHf8v9bRDGeyhhMoDMi6p5kN3UL2iMYT2YH7KdF+OfHmjiOG5vObZ19up
         azBiyiU9brIkWGlyv5l9Vz0yiYOroprExvkO2ypb7/mY0INi68sqY1L2lomIbtNbCXM7
         HNwd+2daUHi/NKlUdFKswd5p5JQsy7NCluF46Sw0ZJ/eIksZvOGa9CmcpnTAggZq5Ahy
         yvSEnTMLWimRQz6rkSGeX3MArc26YVZW+EKPqtPKZz7Kv8rg3th+N3HlCQp+LpDqB8a6
         AfE9vCvM/Is3xSyW6glQDDcG3lIrCDZ20eJMW/UZi7DOFHVvKO+Jn1+Wc3ya706rSHwO
         bJGg==
X-Forwarded-Encrypted: i=1; AKwUvBxgm4SSi2NMPPHOkiAF1ykOqHIqh/+ODFz8Rrx8WqsYZMLc2LwfJNf9kb1UJkrI4IuIwmxVldbDD+8w6uktpqhn@lists.infradead.org
X-Gm-Message-State: AFuF++mi+mYIOo/+6a9hH4CEvgItDDlMRBr7DBGd5GDGRKup3XNybc5a
	SDFw4sqIqxua8w1AUcxGyIieM/xUS5ejxwPMtWhzMvUeozYLSQAYLRjV
X-Gm-Gg: AYBFou1lFFpIRmYQV73o/yqJYurHjhndXzJwSaKl0Lp9k1AbrPfw2i+T5q/eQV2E9pT
	cEQjUgbz9PEhsSrbtMlJg5Y16rITy5a/JSmVCPWTjYdoQn5lBVtGKc+8IpCg7F+7XRvT4OFChXC
	t73BjU4NxhYcBsCJKGcS34QtdusnXwK5UWyyV5UlnFlBWZBi0T89XvAyJSvc4q4uOh20AEtrJNg
	ccB38MoiIotvR8iYG3GlxsmCcqF0J/XssR5HmB+JUTeD39colldjcDv59C5NF/8dnPOLYS8uMb/
	3bsJmFR+Sch+nTCcs+g8imwgw3E05R3VD+ofkf0DhcWpwh2FeoKQmYVD4CHk3jVmnHntIdqPhw9
	2YTn9wQvwmwbO1wW2dqEHnPNonTeqZPA/A19VWgslokWc6wV7QOTcnu8FI80yfHCTBNdWQ7Cijt
	DV6sazQwgYFmSh4/QIxV82E/1E168XAUuMoS5J3iVIp1tWFbstJXmHA9ilTjhLIkFPjcGvkS+h8
	4J/bucDck9GD4N9WnYVa7TuwMD6xoZLISCWqs64a/qhgD8fEoqD0mg=
X-Received: by 2002:a05:6820:180d:b0:6b7:8415:d78f with SMTP id 006d021491bc7-6b78415d8bbmr19129181eaf.58.1789040785360;
        Thu, 10 Sep 2026 04:46:25 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143240d86c3sm46857652c88.0.2026.09.10.04.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:46:24 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 17/20] KVM: selftests: Take the memory region type, not memslot, in page allocators
In-Reply-To: <20260902164123.2546762-18-seanjc@google.com>
Date: Thu, 10 Sep 2026 17:10:56 +0530
Message-ID: <33vh1ghj.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-18-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_124627_682201_3AA92C09 
X-CRM114-Status: UNSURE (   9.86  )
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

> Take the memory region type instead of the memslot in all page allocator
> APIs, except for the innermost quad-underscores function.  This will allow
> automatically selecting the minimum GPA based on the allocation type, which
> can't be done using the memslot due to all regions sharing a single memslot
> by default.  PowerPC support will also leverage the type to ensure that
> page table allocations are naturally aligned.
>

yup, PowerPC can leverage this.

> No functional change intended.
>

Sure, even though the callers are changed to pass type instead of slot,
the inner page allocator is moved to pass vm->memslots[type] to
____vm_phy_pages_alloc(). So no functional change.

LGTM.
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>


