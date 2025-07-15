Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA292C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 15:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=An8FlwzirITNbBr0qyU5frw+U6I6QNI3+OjkL8lhnTw=; b=drQSJmMSBywgH+YWl+FUC2og1a
	qPfzcuiocZsRaOv4UoyxPeTIoSm5iCfFGM7D8KlRT7ZjXsMDCTeSJyA8mIoJrchOLgvAb3S/FjxEH
	qoyoOJWGGLgKrZKXAxjRW62nmm9uouilUX8EE+vsLJoSGVR6nO0eZZUNzSB4WIxbuz1zcRRM+/frG
	qsSsPci+ZmZIrQXM7hAxgWPjLstybJrdJAXW5JKKWCOKwvcQgAuRLHtBP05b1DkljgOv7F1kj9UBQ
	5bsVEUPXCyOPL8NAFFPyqPOjc9CyQrgiVOYDgGigV+TFQP0wv2yutZzcAHWzshORjl4jqy8niIZOY
	sZtvXpRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubhbj-00000005bDx-0Pr3;
	Tue, 15 Jul 2025 15:30:15 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubgDS-00000005IcM-0nx8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 14:01:07 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-313fb0ec33bso5305830a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 07:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752588063; x=1753192863; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=An8FlwzirITNbBr0qyU5frw+U6I6QNI3+OjkL8lhnTw=;
        b=XvSKAJfhMD7qwplJ0m+UBj5ARooYW6YUjm/DPPznbHNNOfXXaP7FE1N2epEw79Q40w
         fKml3BwLP04zQeb+uJt7X5iqHzkU39e7fhe3cjxZ5T2mOSWyAeedyqKOPYYmqQ6wmcNW
         ec6lV4mz8i5J6TBOhM+A4/rf37fDLxK+170CSdCh8lMBrst3MvEpREy72CS8SSUnZ1Q0
         xB1S1f0RGec4FcX6JPTTMbWAYzfDLfwuiiXAWruvTsO/wm4KUavHftDdyi9goGYEFAgo
         RNKsaQb79JmlUZn9cqqMRNYZG8Hi/V2LqqBAYgueOQoF65d0ld13+EzC78jDNDeD9MLb
         QdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752588063; x=1753192863;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=An8FlwzirITNbBr0qyU5frw+U6I6QNI3+OjkL8lhnTw=;
        b=HDbvaPfUiZml/XsTz6sYLyq+ZjboQhU9ieZ1rUtBbu4tuqAyrFokeSckEAkFzgFY8B
         m9hVjD8J2tpPxvDUjfYft1fMlN4hHpOreuqZq+KiiSQGNrgV6v5OqzWQYuUaG45zzzLi
         QRDf91uDtGKYfLVNixP/Ksb2fx/B1jmpA8UcknjEQEkJ0UMpoA0tYlJjzWZMx7JTz7BT
         fuFWzYI+nybb60di4IBL+/yiWitvOgnZv3D+cHzd8ap5HCmMBrs+FM3I0BHTXtQLhmT0
         GEgGDVImUZZRIu4jd/GyaF0sYAM9bD0R9FuVjtEtmuvcRTYIzDltMFxCUc2wVdUKibt6
         Kcig==
X-Gm-Message-State: AOJu0YwlO3q6/y2GeGdx5TGIlB3cp8nfciggXe6yX5H3EffiMX7aM17f
	Pfp0il9deRyY+hu44G33Vm67m9LUjYgCDOrio0UWgkAaETv4PEWpWIyQPS3tpm4zT5HH+eiajD8
	EuItUGg==
X-Google-Smtp-Source: AGHT+IGw0SjVGVK2JASNvhRI2hQZzMIFRjE0AK9+sp6bRe6KtNKNJpueU9J9XmAZCXadJk7v7N9P2NDvbf4=
X-Received: from pjbtc11.prod.google.com ([2002:a17:90b:540b:b0:312:15b:e5d1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:524c:b0:315:6f2b:ce53
 with SMTP id 98e67ed59e1d1-31c4cd8b6b4mr24938091a91.25.1752588063607; Tue, 15
 Jul 2025 07:01:03 -0700 (PDT)
Date: Tue, 15 Jul 2025 07:01:01 -0700
In-Reply-To: <aHZM1ZhTsET5AE91@google.com>
Mime-Version: 1.0
References: <20250624092256.1105524-1-keirf@google.com> <20250624092256.1105524-4-keirf@google.com>
 <aFrANSe6fJOfMpOC@google.com> <aGJf7v9EQoEZiQUk@google.com>
 <aGwWvp_JeWe9tIJx@google.com> <aHZM1ZhTsET5AE91@google.com>
Message-ID: <aHZbyAIoyJZ7c__9@google.com>
Subject: Re: [PATCH 3/3] KVM: Avoid synchronize_srcu() in kvm_io_bus_register_dev()
From: Sean Christopherson <seanjc@google.com>
To: Keir Fraser <keirf@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Li RongQing <lirongqing@baidu.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_070106_230955_C20834F2 
X-CRM114-Status: GOOD (  17.39  )
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

On Tue, Jul 15, 2025, Keir Fraser wrote:
> On Mon, Jul 07, 2025 at 11:49:34AM -0700, Sean Christopherson wrote:
> > For all intents and purposes, holding kvm->srcu across VM-Enter/VM-Exit is
> > disallowed (though I don't think this is formally documented), i.e. every
> > architecture is guaranteed to do srcu_read_lock() after a VM-Exit, prior to
> > reading kvm->buses.  And srcu_read_lock() contains a full smp_mb(), which ensures
> > KVM will get a fresh kvm->buses relative to the instruction that triggered the
> > exit.
> 
> I've got a new patch series ready to go, but thinking more about the
> one-off accesses after a VM-Exit: I think VM-Exit is a barrier on all
> architectures? That would mean the changes to include
> smp_mb__after_srcu_read_lock() are unnecessary and confusing. Maybe I
> can drop those hunks. What do you think?

It's not.

commit 65a4de0ffd975af7e2ffc9acb875b6a8ae7ee1aa
Author:     Yan Zhao <yan.y.zhao@intel.com>
AuthorDate: Fri Mar 8 17:09:28 2024 -0800
Commit:     Sean Christopherson <seanjc@google.com>
CommitDate: Fri Jun 7 07:18:02 2024 -0700

    KVM: x86: Ensure a full memory barrier is emitted in the VM-Exit path
    
    Ensure a full memory barrier is emitted in the VM-Exit path, as a full
    barrier is required on Intel CPUs to evict WC buffers.  This will allow
    unconditionally honoring guest PAT on Intel CPUs that support self-snoop.

