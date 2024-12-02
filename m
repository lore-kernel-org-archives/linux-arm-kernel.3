Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499AEE69E81
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 18:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u34wPynLWdSa99IQ6xhu/7M3+TIv2HNu87ct2rQpiWw=; b=p/YD2OUoPggZGE/l7+Nwgw3God
	sdmHTgafLNgoqeGtdD0B2HMBJ+KbBDSvAPWrjUaIDGs6SBzBoqCu3tKr2/jkihkUe9PgzW90drTg7
	ANoNBGt/jJ9NIrWVKiLmRdzXGW84ApifCkIyzlnZVAmMHzbqe3Am/8i+CTc7U2AI4ePS8pPuELG5f
	iRRJroQ1+trQ9ZqcsAHbWvC0vGaw+lstXmC80cn1I++pUuaX9hmojRsUMbjRaUrEeQ1ew2XS6Yfxq
	uHfR8fje04+JXY40dwIfIlej9IhptaK3HN8iG4lYCkpS/1Mw2KGj7mHl3RzVLtXsYRGGEg51cQAno
	6DcbkGQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIBTY-00000007Coh-156S;
	Mon, 02 Dec 2024 18:48:52 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIBSZ-00000007ChK-0cI3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 18:47:52 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ee8ced572eso2298991a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 10:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733165270; x=1733770070; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=u34wPynLWdSa99IQ6xhu/7M3+TIv2HNu87ct2rQpiWw=;
        b=z+6ZrqKIqPro7sV/r8qyR7SRW0+tskLxmehHjH4MFr/SzBHsnrF7zA/xgiPWvSWaTg
         wbviHahjH6JQoRgeIIdNUjkp0E9Aeguoeb6nScsYUlTIgR9XI+g0gNe8C9FA1Uw9NogO
         LQVP5jdTIjk1P2wnBz1nZ1mn/Foqh5i0awBpSJ4aqXBa43D4JZT8tGIrYTB8+7bMbjnH
         HLwCh8PhfOro1l7fKo/+HraVGdy9ma+jE2IXMwxjBphbUncgjNZRv5KptmMFXm3126rp
         JCaKhGJO1QKBP2e4pgnJUcr4c2/Y0Qz8KvvWa2f5FD9XPGZ9Yu8TGVmt0XugGzzF+jdn
         oOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733165270; x=1733770070;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u34wPynLWdSa99IQ6xhu/7M3+TIv2HNu87ct2rQpiWw=;
        b=hyHD/HVzZYtyipWB91F7BUQh6RW1QPWxxyV3GgWL8wVjIF3hAr7WkmduI4RFBMwy6u
         k+CS91J+TV9CVwu7G9VOOG0lhghiHm1f7vDQ7ilNxFdE8grR2SRGcXEV58udv536+Ma5
         ahxXyC/ce9El5yg8j54twJpIPiMeubQXmzcjTvrLEi+xky/RM36mdA+V+STGb9uaXwdy
         FsinDCK6Ovasxx/XY/iNOCpq/JRZzgftC7zaFPJ6k7McZkeU5/BlubzqoV0SeaDzRimc
         Xe5dL9g2+yvs7unGWriLuyau/CR5ZgUU4gbxrxH/ddtf4Uq9XXruJZkUCCfhvAXsi4iP
         d+Tg==
X-Forwarded-Encrypted: i=1; AJvYcCWdHHU9GaFgkxh3DZqsHxuNe/iESaB841Jd3bWw6rlHXbkI0awe/wBRoa+XMPeyzajmk2luG006Esr+/nYHCtjb@lists.infradead.org
X-Gm-Message-State: AOJu0YzBTQ032ikWIUMe7kk1EET1ge/u6vSheRpfoADo5Zt1uSuuzeiX
	DNeE1tp/Aado/h4RzUiWXH8/7dH00QrQdZ4SMqSffrSZ3GmaHHpU85rVJUL0HEN5WhNY0K0a7N1
	WqA==
X-Google-Smtp-Source: AGHT+IH1lOkxtOKe5VZ1YQsUZ2R4iUJCkzIbDFJGQzaxTbOPx9DRSSWOWSynHC4tj/4TdwIvmt3yGcRJFdA=
X-Received: from pjbsv8.prod.google.com ([2002:a17:90b:5388:b0:2ea:6aa8:c4ad])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1dd2:b0:2ee:c5ea:bd91
 with SMTP id 98e67ed59e1d1-2eec5eabed1mr7923335a91.29.1733165269950; Mon, 02
 Dec 2024 10:47:49 -0800 (PST)
Date: Mon, 2 Dec 2024 10:47:48 -0800
In-Reply-To: <20241128092546.7a5b3f30@p-imbrenda>
Mime-Version: 1.0
References: <20241128005547.4077116-1-seanjc@google.com> <20241128005547.4077116-16-seanjc@google.com>
 <20241128092546.7a5b3f30@p-imbrenda>
Message-ID: <Z04A1Oh0LCKtCN4p@google.com>
Subject: Re: [PATCH v4 15/16] KVM: selftests: Use canonical $(ARCH) paths for
 KVM selftests directories
From: Sean Christopherson <seanjc@google.com>
To: Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>, James Houghton <jthoughton@google.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_104751_175026_FF0152B0 
X-CRM114-Status: GOOD (  15.58  )
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

On Thu, Nov 28, 2024, Claudio Imbrenda wrote:
> On Wed, 27 Nov 2024 16:55:46 -0800
> > diff --git a/tools/testing/selftests/kvm/include/x86_64/svm_util.h b/tools/testing/selftests/kvm/include/x86/svm_util.h
> > similarity index 94%
> > rename from tools/testing/selftests/kvm/include/x86_64/svm_util.h
> > rename to tools/testing/selftests/kvm/include/x86/svm_util.h
> > index 044f0f872ba9..b74c6dcddcbd 100644
> > --- a/tools/testing/selftests/kvm/include/x86_64/svm_util.h
> > +++ b/tools/testing/selftests/kvm/include/x86/svm_util.h
> > @@ -1,8 +1,5 @@
> >  /* SPDX-License-Identifier: GPL-2.0-only */
> >  /*
> > - * tools/testing/selftests/kvm/include/x86_64/svm_utils.h
> 
> this line clearly has to go ^
> 
> > - * Header for nested SVM testing
> 
> but I think this one can stay? ^

It should go too, the header contains declarations for helpers that having nothing
to do with nested SVM.

On a somewhat related topic, the file should probably be "svm.h", but that's a
future cleanup.

