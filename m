Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28D6C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 15:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8mGifk9h8LIddg9L9JpNR126tGysvi+0g41edfZ4g+M=; b=TII7qBGx1ztAOqDLFgzVyfXUB5
	gYL+JJg3REGtVAJWYEQgKJiL43FMQM9fQ03Ba8rjSZHhgmBBY7DopW+qnn0YKAoawzfBbt7RCQHkg
	uyBQVM5ZYpogLxR1QCDjEMMbhIrYDPDhiU55OSFHwuGc55PQeQN6R/nGzYcGIcLXuQmNDIgMD5Lke
	ED0acwCKrRVIkMWtgb/Iw8FuXq92UKB0edBWbCTw/9pXkl4/+VilgOaAOy5zArkRm3mA9j4mSD/yX
	sJBu8fOx4j4q3i/s061gtAZL8tMZJ5FSqVt4cgfv3ODYFQElhbodgwbn65TK+8sO35Qezl+lDfSu/
	SjGkf/mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29lw-000000003pj-460C;
	Thu, 03 Sep 2026 15:54:40 +0000
Received: from mail-pl1-x646.google.com ([2607:f8b0:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29lv-000000003pG-1rgD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 15:54:40 +0000
Received: by mail-pl1-x646.google.com with SMTP id d9443c01a7336-2d9057fab9eso39482655ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 08:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788450878; x=1789055678; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8mGifk9h8LIddg9L9JpNR126tGysvi+0g41edfZ4g+M=;
        b=sXYLrDjwPgOVx8Qmci5P6sGYfouXpHUECao2HfcY6uot5uHXTNjpX6vJrEMT3J/r2o
         H+SD5Q1jaM+6Bc3oHWIhLDO8pA3iHb711ZjrEDH+it0g2EelZTF9lSY8/QC9mdsSl4Em
         X8TYxEXaWzf3Qe837xVqP9CWJw+NhEywP9UeYm3FePbnUp4Q8TjWKYeqGiz7gQ8DWNqh
         zXKTc3FAziBxBu1IfcxwoZ8c26soP7uerr5GESkBN5aLJ15Zw9HexzVyX3xKkQRKAGx8
         GmMqROE4BHxc53MJ8VIkYllBFyxNvDy/de7EejtwqL6UWqZsUI+BEswnCMsMDp5Ak/Du
         KcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788450878; x=1789055678;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8mGifk9h8LIddg9L9JpNR126tGysvi+0g41edfZ4g+M=;
        b=NvQHH+pdEdc01ORfmLa620/DJWghzl2AeRnYahLvKGpQdFSQy4u5biJtB1WwO7pf/0
         0sC2ujXF4jPH3GEBWGKSR9hhrrffH9eSCursOPoV2S1faVI9JWC/kw/0e8vdnuQneHjl
         bZaIzGil766chgvrkdk7L0Xb8cjafvL32Q3YKEPbyWPRWoVzqL/zeTI+9nDBndWUHPzt
         DX9yUwRGQa55e95woWHdr4s/mIlqeJsm8OyKQcIWP1glbHWzfzTvQnplXhe2+RGxlpub
         lh+wtTTayfiQN/vxE1mHviaMrH902sCiRMa0JCjNxnqs1u0rjq4fJITDxrklM1k0LTbQ
         nLdw==
X-Forwarded-Encrypted: i=1; AKwUvBzHRTHmeNkDvoiPoDhTq6WxEmG9tFBc3tjGY9vTcNqZYHfMuylb0w7DxgSC+UfL+iJ6yJ2oMkzGJjibcuitu7I4@lists.infradead.org
X-Gm-Message-State: AFuF++k9KildNssHXOKu4pYa5Dcr6Bp3W9fSFdcixqbMwZqOqhsRLRIw
	iMwfZ2mMnYmKdW6R04Qf6NQyObrSd6qHVFbcagPC287b0hmI0jUUoEk21Y2CmXeSJwze7PZR2H/
	ZkwPXGQ==
X-Received: from pgp23-n2.prod.google.com ([2002:a05:6a02:62d7:20b0:cb2:563f:d136])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:7d02:b0:3d3:ae50:97cb
 with SMTP id adf61e73a8af0-3da35f9b1e3mr1317921637.24.1788450877399; Thu, 03
 Sep 2026 08:54:37 -0700 (PDT)
Date: Thu, 3 Sep 2026 08:54:36 -0700
In-Reply-To: <19d4feb1-d703-4c62-8622-a6d5e9d6394c@redhat.com>
Mime-Version: 1.0
References: <20260831144802.834315-1-seiden@linux.ibm.com> <20260831144802.834315-3-seiden@linux.ibm.com>
 <apdweRfqt4dTxcU9@google.com> <20260902075028.231001-D-seiden@linux.ibm.com>
 <aphLXQL1H2zYZgTi@google.com> <20260903114241.33034-C-seiden@linux.ibm.com>
 <apmEi1NmOUvmUBFP@google.com> <apmFClPZ2WcDINmT@google.com>
 <apmIGgMEN8w-kQAm@google.com> <19d4feb1-d703-4c62-8622-a6d5e9d6394c@redhat.com>
Message-ID: <apmYPMMPCNzK9ZEA@google.com>
Subject: Re: [PATCH v7 02/23] KVM: Make device name configurable
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Steffen Eiden <seiden@linux.ibm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@kernel.org>, 
	Friedrich Welter <fritz@linux.ibm.com>, Fuad Tabba <tabba@google.com>, 
	Gautam Gala <ggala@linux.ibm.com>, Hariharan Mari <hari55@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Hendrik Brueckner <brueckner@linux.ibm.com>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>, 
	Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>, Oliver Upton <oupton@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Ulrich Weigand <Ulrich.Weigand@de.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_085439_484158_13C8A6E7 
X-CRM114-Status: GOOD (  15.03  )
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

On Thu, Sep 03, 2026, Paolo Bonzini wrote:
> On 9/3/26 16:45, Sean Christopherson wrote:
> > > > Actually, thinking about this more, what I've proposed here, plus the pattern of
> > > > #define-ing macros in arch-specific kvm_host.h files, should suffice.  For things
> > > > like __KVM_HAVE_ARCH_VM_FREE, it absolutely makes sense to #define the macro in
> > > > kvm_host.h since it's very directly tied to an arch callback.  Whereas with KVM_MIO
> > > > and KVM_ASYNC_PF, because they enable compilation of C files, it makes sense to
> > > > define them in Makefiles.
> Ugh, defining CONFIG symbols in Makefiles sucks.

Sure, but IMO wrapping entire files in an #ifdef that comes from an arch header
sucks more.  And technically, these aren't CONFIG symbols.

> I don't want KVM to be the. one that does things differently *once more*.

Too late :-D

arch/arm64/kvm/hyp/nvhe/Makefile:ccflags-y := -D__KVM_NVHE_HYPERVISOR__ -D__DISABLE_EXPORTS -D__DISABLE_TRACE_MMIO__
arch/arm64/kvm/hyp/vhe/Makefile:ccflags-y := -D__KVM_VHE_HYPERVISOR__

And I think there's value in deliberately being different, because CONFIGs are
kernel-wide things, whereas the thingies in question are KVM-local macros.  I.e.
IMO, having the behavior stand out is a good thing.

> I'd prefer to stub out the contents of the .c files instead.

