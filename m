Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BFAC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 00:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HAdIv23vtdyhU1Wievr5YncZEjjI/nIoxYj3wcoEoAc=; b=kegYy00vqRiK4ibzKTyC1b7YtM
	hZ2Ap8klZ7oeLDYJ7gRqG95Q53k2FhimjJ5dDRK9gLYwBOm/bI0z8GF4dwbL94eznHFJYVUVPEIan
	P4hB0Aa3QbumxNj8+lGRk7qUgwy1IRyftnNDjFK39mzPlojI/89tBtaZsmax/rcGzJ7fAoYi17dLf
	jHifAJrM2zeMkM3xAtcmqmA79PYiQItNKtyfj4vCs2UUN2QcjVql45Pg+neY9TjRAlmSJUYqBxYVD
	kGzbiKY6pKnwKdEYP2L2x3WIMdSg8gEzpCo+iJK+bhNb3pKd9D7v70joENErVCTYPTjkr0nRcoqkX
	7jqXRbnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn5JB-00000001sMm-3zOH;
	Wed, 26 Feb 2025 00:29:54 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn5Gw-00000001s6j-2Dl9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 00:27:35 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2fc2b258e82so13296464a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 16:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740529653; x=1741134453; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HAdIv23vtdyhU1Wievr5YncZEjjI/nIoxYj3wcoEoAc=;
        b=3LCxbC10dJsNohIs3LlPVFrPr2jfywPlyutOOka1T05aUuN8ZYf8u+I0lDx2qW316T
         ONtKtcE2PQ/kfHglRJDKBsLD35SgHsLX1Hdgw08xoQLmXKddxfIcwHafwDGUCSQrhiAb
         ptq2BNcsdSeufldokbS0I2siNqb/3iQeDPsifkAM+JSh+sBLaNgjVBD2FMNJo/QLRZxY
         DFgdipMsX4H3SUyjvK72Z+kd+81jq2WPqaSsL1F2wj0gbbNMMk+h0cIhTz3O6ekMBEpI
         PnI5EBlhErfC13TLKBQB/Ugj31pbnKCtNhGv3v14LqLWCkSYHK9RbFtVWYhrvIZcxQJ1
         9dFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740529653; x=1741134453;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HAdIv23vtdyhU1Wievr5YncZEjjI/nIoxYj3wcoEoAc=;
        b=sRK0ZwhBoxmlShLzBcxQ3Qt6mMs9H0lrmnk7T9hhYQjm5bxvKQwqL2Ha7VNmIkLGLi
         Giwj8q2ZaS6Hfwjvs9xxUl5rpUQz25iyIUcnipUmK6jPSnNbkb0/7TB6oCzfssbEyLM3
         2/RGZ/WYsSR5A0Om8kZ262YnU7p3+PMY1Gy/RveFkpUz74HnwgU7coZ2okGdJ+X/uueI
         6CTspmtErtC0NwlqcJohBryCaZWKGRUCfmbg6HlN8P5BPLfWBvriz9DyfDAlvAcOjAPP
         GG9UJcyC7/b4cojoA2oX/N4JLBnZGcjYcJER3apLLcsGjU7BqXZl9rvNAHv1V6QE/omL
         gpwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCAN+NVmYnOwPPqsfezb+DODt8dn/bE+E3lAQ93q50ZviPazABM/plwragAq/iZLs10HpL/sC00u3dyzaOTQoe@lists.infradead.org
X-Gm-Message-State: AOJu0YzomTY+xiOsZV+1gjQsp5UxcwDpZ7u1HljDhIs3owuY1ubKMIjZ
	k9I4jKODyy9f2+rUFySWyiGZSQUbk1aUn6OerEg9VYjpOpKKZInQLUI0LebYlkOGh2S4kTqBH5n
	SLQ==
X-Google-Smtp-Source: AGHT+IHOUZMQJO44VDHKi6ofhJ07QZ2dZ6izn0Wyr9X1ZaSMCJ5d0/qSAVcldTsRp+dWt1bBYLTGrWWvHEg=
X-Received: from pjbsb8.prod.google.com ([2002:a17:90b:50c8:b0:2d8:8340:8e46])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5483:b0:2ee:f076:20f1
 with SMTP id 98e67ed59e1d1-2fe7e218ab9mr2765842a91.0.1740529653271; Tue, 25
 Feb 2025 16:27:33 -0800 (PST)
Date: Tue, 25 Feb 2025 16:27:32 -0800
In-Reply-To: <6475f9c7-304a-4e0b-8000-3dc5c8e718e9@redhat.com>
Mime-Version: 1.0
References: <20250224235542.2562848-1-seanjc@google.com> <20250224235542.2562848-2-seanjc@google.com>
 <6475f9c7-304a-4e0b-8000-3dc5c8e718e9@redhat.com>
Message-ID: <Z75f9GuA9NfKo37c@google.com>
Subject: Re: [PATCH 1/7] KVM: x86: Free vCPUs before freeing VM state
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Aaron Lewis <aaronlewis@google.com>, 
	Jim Mattson <jmattson@google.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_162734_588522_09847413 
X-CRM114-Status: GOOD (  13.50  )
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

On Wed, Feb 26, 2025, Paolo Bonzini wrote:
> On 2/25/25 00:55, Sean Christopherson wrote:
> > Free vCPUs before freeing any VM state, as both SVM and VMX may access
> > VM state when "freeing" a vCPU that is currently "in" L2, i.e. that needs
> > to be kicked out of nested guest mode.
> > 
> > Commit 6fcee03df6a1 ("KVM: x86: avoid loading a vCPU after .vm_destroy was
> > called") partially fixed the issue, but for unknown reasons only moved the
> > MMU unloading before VM destruction.  Complete the change, and free all
> > vCPU state prior to destroying VM state, as nVMX accesses even more state
> > than nSVM.
> 
> I applied this to kvm-coco-queue, I will place it in kvm/master too unless
> you shout.

Depends on what "this" is :-)

My plan/hope is to land patches 1 and 2 in 6.14, i.e. in kvm/master, but the
rest are firmly 6.15 IMO.  And based on Yan's feedback, I'm planning on adding a
few more cleanups (though I think they're fully additive, i.e. can go on top).

