Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27EDCCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 17:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HjXjY8ls4xQvqV6pquPYuHe7QqNVj5FW0YEflavTuCM=; b=qetLQhJ4Ha4I4OjVclUPIdVPTG
	0ctxY9fob2TryIvabWMTZ1ICNlwGBGK0sAzxZXNtd3e/k6EUNmcEC+iBexfzf2AwdLRxwn6xpEgPB
	GwlXGr2O6uVNF80ywnruv7b68Q2uFoP2efN2Wfs2f6euZE2g3v5tOBWg4mjLI5Pu5ll5nXu6mCu30
	RsW8zv6UA+ckU5+OOd2UQPNLpmpiEv9IkWkMMMJuIhJpa69ck/uauO0+dmEu3nUZbM5VHFqO1dCk2
	Ku/9AXQqbiYhnFISrUAEEtIa/ePOe1vB4EIPXvzn2cz+hy1+FuD+cBSee395eh63PXnMp8MTBO2BT
	v8XW2aeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsfX-00000006SUa-08TB;
	Fri, 31 Oct 2025 17:12:07 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsfU-00000006STZ-2gfG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 17:12:05 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3405c46a22eso2291175a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 10:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761930723; x=1762535523; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HjXjY8ls4xQvqV6pquPYuHe7QqNVj5FW0YEflavTuCM=;
        b=f33iJ30tw9i429heEXeUYWjeMVjvkDhbsZDqXBKVROSLy9K97S/tx1X1HXbJzGM+iJ
         Bb+TbtVjT5mfSuvrZdRV0l13v3CB8s5CXHud9+N7bYxfxr5IBjE8KHF+3//z1ym5kaM8
         vhyaZu+eFiHwrUTcr+d1CSZGsA8OyvuAy/BAaGDq5KfSiWpXrsqGKRuunMG5+qpUYmmd
         3nTbiOgIuRE4vJ+T2D9CaIq4VledvPzLbWdABuGLJeloK/s3jsGRRaSOqmoU7irHcrPA
         mNfx2a8/RLgvmqHHMrj5GjvblxFUUzIvjLcogWeIob7ejaj5pnrWbDgLmps9nIk9Dpu6
         BD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761930723; x=1762535523;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HjXjY8ls4xQvqV6pquPYuHe7QqNVj5FW0YEflavTuCM=;
        b=wiVr3K6s1YvalkLuhBTOhJc5KvHdmpEGUpXID8RRfKRJp4ZKcReSeYE/+7af1Xwo8j
         UpEHpFcjAXWEPKPFlBRKI+uqJ0PJj6mHhKwkuhB1YGTWoZO+xjSqxSWnAjRqbNjM5SBe
         iIqqqTR4mcDpLbGvnaGTMZYIuXKq4ZINvzdcPbkMwRoihmpeEELnOBgLCfavGOh9y8Os
         MUcgXDd+MUYoBpudIJJNPbENOUgGVG3dZ4oB4QqWI3ewNfEXY1mfkQJNwAJ+lEi4uib+
         pBy54Km4hx6xtBpFKmYPLL9c44V9QsbFRrMRiXqSXHIIkhSl18MYaPLMwsQSuFw4POb8
         ZRYw==
X-Forwarded-Encrypted: i=1; AJvYcCVSx99W+HK6sTz1Pkbdc2Scy+OVkqg+1CnXlcKz2XW5gaSfO5Z7605glbQhLIJ8pSoMnDhVP4yrjvnTx95kTSzw@lists.infradead.org
X-Gm-Message-State: AOJu0Yz44lSCS2kNg7u3iskZdFonuv49BLD23AqqplchF04LKx4rwzIL
	TXnBoCWaXVSUyOSbYCvqkgwmcn2pM+hesbtY9PE14fDhdmBMmTfvehvI49FPapRevI3jY2ad9YX
	CAH/xvw==
X-Google-Smtp-Source: AGHT+IGfSgMUQo+5u2P6PetuRGaKK3ywl60OSkXvDDKeMxjcSsBTGVvS+p3TiopL8XWw5d9McqxPGzj/wX4=
X-Received: from pjbsr13.prod.google.com ([2002:a17:90b:4e8d:b0:340:b55d:7a07])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:388d:b0:32e:d599:1f66
 with SMTP id 98e67ed59e1d1-34083089300mr5226937a91.30.1761930723259; Fri, 31
 Oct 2025 10:12:03 -0700 (PDT)
Date: Fri, 31 Oct 2025 10:12:01 -0700
In-Reply-To: <aQRzWb3Fu6ywdE9t@yzhao56-desk.sh.intel.com>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com> <20251030200951.3402865-9-seanjc@google.com>
 <aQRzWb3Fu6ywdE9t@yzhao56-desk.sh.intel.com>
Message-ID: <aQTt4R4CflSuVnCX@google.com>
Subject: Re: [PATCH v4 08/28] KVM: TDX: Drop superfluous page pinning in S-EPT management
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Michael Roth <michael.roth@amd.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_101204_719095_BA604139 
X-CRM114-Status: UNSURE (   9.41  )
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

On Fri, Oct 31, 2025, Yan Zhao wrote:
> >   - Increasing the folio reference count only upon S-EPT zapping failure[5].
> Nit: There's a warning:
> 
> WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)

Checkpatch is a (very helpful) tool, but it is not authoritative in any way.
Similar to the how "wrap at 80 chars" is a soft rule that can and should be
broken depending on context, checkpatch should also be ignored for things like
this.  If someone says that the period making the line "too long" actually makes
this unreadable for them, then they're just trolling at that point :-)

