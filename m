Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A113C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 00:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VxNhNQGund/YZNpVTOrvdeVh/HxeApY5VkBlX3NJ2Bs=; b=CwOD8JI9BfXVVEjD15TCB+8Zdj
	YNpWdrkOvqIGYecf/rayV/2hunW1UeGh3z+oKkaR7iCbmGpy6N4mG28HY/pbpFhLOLnmC28QGlYIQ
	Lq3BYz/lO6MnkK594Pmz0wZPQMjOo9s+4PUmV8LQov6PtcTMrIHsp9TKLIfOn4J2NTHNoyERwGts4
	77aPmN5EBPPsPXb8JHDBlON6x5wTFaR2Ecy1lHKjw8KKi6Fbc0KCEdEFXoSOVmEGy2KXcIbAQ0zA3
	pLSJ9Irjk8zhjv0S267bBkT505heGppr5HJHl5WjursuDRmwKOR1JPyFHZ2cQVhf0ez/pf5olW1tB
	xfvLmbnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgu7b-0000000Dqz3-2AEe;
	Tue, 07 Jul 2026 00:57:11 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgu6g-0000000Dqwc-2uiG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 00:57:09 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2c9ed5caa3bso1844495ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 17:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783385773; x=1783990573; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VxNhNQGund/YZNpVTOrvdeVh/HxeApY5VkBlX3NJ2Bs=;
        b=PK5OqqlVMSGFEOgu0qTFAnQvAe8aukJrFuKTkj1Lu4TxxrJ/Bgpk+qMYvov/t2WTuy
         8ZzItS2DFyg7ZbwDpWKS2MFTcQJzsgXiN8yGzZXR0/Y3a2HpLnVWk37kNW+5lhjmoYRD
         naxrfD7JMpKRo/EZSa5uSxZSlBDlwt3F3SS6btlNn5uKvqpWEdgpYfcuObw3YnSTeD4m
         brwQeM87RwKDrFifMFNOpq0QpLshkDyj3M5UeV9h7zqaEjCrR8q/3meQ9Ag67xqA6Gpd
         QH9DCJFN/zHQeonmZEaDatPvib98YBMu3sDh2sVMk1uPf1X4tqCyvKkA8pxRG1PkMx9H
         S+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783385773; x=1783990573;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VxNhNQGund/YZNpVTOrvdeVh/HxeApY5VkBlX3NJ2Bs=;
        b=mcc0SXj1AEfrMCQcm5AfSVzCDUl/OkKso3uvAMvy2kWjhqsjWUk9g71UoF5774uVwg
         JBMoY/NkIhj6y508q+g93zqo/TQzkZHBr1iBJHByhUfPU6As+7w+FGcAsI4TST2FWIa3
         1x8unYe+Nv9lnyvXRMho95JNQSnF8dq1Wi8hBIwageKKfO+j64mrT9g0/04MZwY1sUqY
         mGj/GeTzj9GPdMrwXPs7GyHYKA1FB6+ht5KHkTrRpuQPWmTyoADaGsaY89ox4q2SkEt5
         vrTciDPXWVghg8+PryweaUZ73HOueGcLPPTNRaWcB9utAgGM7VqtdT5/GtCUir+RueBI
         G2EQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqp3QKzaj6xU4s8MKKk0u0fWO/zuQBZnmorg+4wUcf6HRdAqoKo+oC0o28dgTzijUo0O6ztLl8bGJIq9CIe0xWs@lists.infradead.org
X-Gm-Message-State: AOJu0YySDNtYVDWtw8b0sPQvnOm6iOd4oPQ5SS5bE1J3yvhMI+/zCVv+
	j2wvw8NT3f8SRhQQHtKVwAaNY1GI41TUOSm3qkKcAuobAQxgqXGgHA4V7Ba0YPkPl6j0ypNKeGu
	7syfNDw==
X-Received: from plwg16.prod.google.com ([2002:a17:902:f750:b0:2cc:7ef7:ea41])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e883:b0:2c9:fc0d:165b
 with SMTP id d9443c01a7336-2cccade45e7mr5481825ad.23.1783385773032; Mon, 06
 Jul 2026 17:56:13 -0700 (PDT)
Date: Mon, 6 Jul 2026 17:56:12 -0700
In-Reply-To: <20260702142912.6395-1-alexandru.elisei@arm.com>
Mime-Version: 1.0
References: <20260702142912.6395-1-alexandru.elisei@arm.com>
Message-ID: <akxOrMnlNga-vtQv@google.com>
Subject: Re: [RFC PATCH 0/3] KVM: Dirty page logging for guest_memfd-only memslots
From: Sean Christopherson <seanjc@google.com>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: pbonzini@redhat.com, kvm@vger.kernel.org, david.hildenbrand@arm.com, 
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	fuad.tabba@linux.dev, mark.rutland@arm.com
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_175614_785485_574F9B31 
X-CRM114-Status: UNSURE (   9.52  )
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

On Thu, Jul 02, 2026, Alexandru Elisei wrote:
> The memory represented by guest_memfd-only memslots
> (kvm_memslot_is_gmem_only() is true) is shared with userspace, which can
> freely mmap it and access it. The only thing that is preventing dirty page
> logging for such memslots is that KVM doesn't allow slots backed by
> guest_memfd to have their flags changed; they can only be created and
> deleted.

Please (publicly) document *why*  you want to add dirty-logging support.  It's
all but impossible to review new uAPI without knowing the use case.

