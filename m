Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39710C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 18:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:Date:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mIy9w1/7l+YPH2gFOr27PV6p4ska6UcSUlBoAUwTOLk=; b=4VEeJBGmn6aaEHBxtIpJQ/AKCP
	DTb++TGXbg9yqSTkepW+hCwsmJjj2Xqf9l4KD/WuHkb/ymT+wDVQ6yYr4S5KHqeqhH3tqHW8T4LfG
	UN+uQw1MTU4skrTPoFEkBGVBa++PztJTxfJpOkvF7BJAJpULrc9MRtMkQuWtl0QrM+8JF4mat5VOn
	/hik9sdIR6SzhQV+Xq2vfnvHY1otY54d/yHEhFCm5ZwNmgr38Jfe8FAIWn8lQx/TZC5T1GDnGcIUa
	0LjD/wNp1gcgJ3mYxxVGiwYHwslZzb3NHb4hZviV4lduoYJ7ay6Nav4zwFhD8Yb5AJtDhtrEBjbuo
	2+zjGitg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1pKu-0000000FXWK-37DQ;
	Wed, 02 Sep 2026 18:05:24 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1pKs-0000000FXV7-2QHQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 18:05:23 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3990fe066ebso1114493a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 11:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788372321; x=1788977121; darn=lists.infradead.org;
        h=content-type:mime-version:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mIy9w1/7l+YPH2gFOr27PV6p4ska6UcSUlBoAUwTOLk=;
        b=PuCaPRW/QVNgvt3V4HGNaA40SBkfx0hCDEI0+0BIbtZiGO74GfNMJyks9mLSHYMJD6
         u2LJJzGUT9Ia+t4HUUuNTyu/LOMHrdbarAcLqPmQ7CGLePigFbjywd+tHJ+HUP2sZDzM
         AoI/ZIy42MP/Z4UgOPre/XJvo/s3DSfSxJ13vbBliXDnudGUTf7xftVwZDNCGCfuOrQl
         MmpSMnF2bnTXw5bsL1Lf74naqrJVcwOiPYehbsCT56bvcxogZlyMyw/2/xO8SU/89nHv
         MO/I8R92XrVdSHh7lcHfemTfpzlJopDkWMVQ3lKt7FCZtX7h+eeWJumGWuqveqohMbyP
         tfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788372321; x=1788977121;
        h=content-type:mime-version:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mIy9w1/7l+YPH2gFOr27PV6p4ska6UcSUlBoAUwTOLk=;
        b=HyPSYbhFR0gd6LCYEAjSwvQ1fsqlvMHzrt3xtlep6fFJBmXD59zQGMLBx5kJkmMjh8
         XIV+bLzoeiQQftPNIxmMq6q+TzLAqFgsaDgVGJpmQ0uERW6vMBeeqLuRm1Q5yRl+PLc+
         3U+CxanwgBwZPGCT99atyW45mU+MEFGqU9r6yVc7KF9Cy4Xe2oh0t+AMFsbLgfOv0yv4
         g7Y0/cqMT7hhb5USJh+6h7oEpbsWgXjl7hlaOR4g5/4u2TVBFXBIQ6LeJfPYp7n6k2UV
         uI9pI0xLINq5HYVmzvhxzkMEMeTXpvudE7csvvN4RvxgER6gc6xHOQoEwmeEoAw7GUxF
         +nDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwETA0dR7ipXlXQU1OyKRTA/PT5fWPIy2fQKZ5W7BJg9i/gOErAmadkwyYlvH1QRv40GEHnp2kvcoY//RcNLaWy@lists.infradead.org
X-Gm-Message-State: AFuF++n6xK434BemjBrDgi9YYkKHZNSfcxn/zl4tdZBJVECONnWYqj2I
	46BANtxEEvonWOqtck7gxpbosXYigTszWrzmdmGY64OomWKfrzu/UvAT
X-Gm-Gg: AYBFou0OOUqw37Fk6mCMHBqZ4rjLYqALXOJfVbethgRqVhU02H87lCnKOex7jCyb6s+
	+SNv+zQqDib3tcsvOYO0rLMf0VTst3zQEJyJO99ebzlsZYYYlEQ1nDQO7K3VHp7egg4bZ46x9pp
	lBsShECNjBxDFdb5y5mZN9LyHA6dM1WJqIeNAx8mquVP2oQXu2Tb660KXbtYZuLLYr6GoAPDVhj
	k2iW820tU2/l0P5/d+hnNS4fuqjhPX+H/DJ+3rdniWb4HAZ+G4DeQaIwEZp85LY1Q+6znAC3uQy
	4zN5wznFut3R3uZG0GI9o/41Pxah+9NULVn+95KdyV9mGBie+fve4HakM50Epfxf2DK9CqShfep
	zuW8BE3uePCj943piF70amnYkfBZzU+x36Gy+YsKYG1ue5uWMzg/piQ6Vn651JtNLh+8Z5mxFcL
	R8ttuv/IlclmSFFHvkdp+w/j0BcbedJmoaEtHPDRr/IdWFAIETW+oAQjDbVq0CbQq/OC3F4aTp0
	wUG0WFibR9ZJueScBqeemzNAH6S8iI3aiqiaQkncCw9
X-Received: by 2002:a17:90b:4b89:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-39aee105a46mr9138561a91.18.1788372321290;
        Wed, 02 Sep 2026 11:05:21 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07b79cf9sm9808273eec.18.2026.09.02.11.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 11:05:20 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Gautam Menghani <gautam@linux.ibm.com>
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
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 00/20] KVM: selftests: PPC pre-enabling
In-Reply-To: <aphioo_KTboUCtZd@google.com>
Date: Wed, 02 Sep 2026 23:29:06 +0530
Message-ID: <h5k7ttzp.ritesh.list@gmail.com>
References: <20260826230511.972824-1-seanjc@google.com> <aphhKDm7Vx7G5ivr@Gautams-MacBook-Pro.local> <aphioo_KTboUCtZd@google.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_110522_622236_9189D596 
X-CRM114-Status: UNSURE (   8.77  )
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

> On Wed, Sep 02, 2026, Gautam Menghani wrote:
>> 
>> + linuxppc-dev
>
> Ah, shoot, I *just* posted v2.  I'll add linuxppc-dev to that cover letter.
>
> https://lore.kernel.org/all/20260902164123.2546762-1-seanjc@google.com

Thanks Sean for sharing these changes.

Thought of sharing an interim update:
I have rebased PPC KVM selftests support on top of this series and the
initial tests ran fine. I am currently looking info few findings though
- but will soon rebase those changes on top of your v2, review that &
update the results.


-ritesh


