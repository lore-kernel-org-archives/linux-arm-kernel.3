Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE806CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 16:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XmFbq4MgFLvSavBU+dsE5BY6fpPsL4/gR9QPfUGTSHw=; b=zawjhHmIpp/Vv+bB0JJFNxGQUJ
	dREuW1tdkdedfk/pOUK5ZQaV3fsMNdfqBau+PBuHVIUeIAeidSVyxJskaKA15Q6WrIXS3UG7HulBF
	bv563OhIbR5VvBWVBZcY4eMAZLohKAC645Yr1gocbpzicTkNQFHDjbYuF0Y/0tup279Rqcjg2R8QJ
	NyEeB9+4UHsO1ZaZWX3awdp7qhJOXvf1hHuUtKVKyDKgm001fsmLXanOY0ApPusauXB7D2OQxuK89
	G0OsXrT3pcFQir4KTEepeIGI4fBRl+POHzj+40QVR6cs3fWImt6HggD7eQHA0te23hjXikBjUH5dl
	cXoeruZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKjZ-00000009zAI-2lUv;
	Fri, 24 Oct 2025 16:33:45 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKjW-00000009z7v-1cxV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 16:33:44 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b6d0014d416so1083810a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 09:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761323621; x=1761928421; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XmFbq4MgFLvSavBU+dsE5BY6fpPsL4/gR9QPfUGTSHw=;
        b=Sw7kVbF+AyTonYoOyN6CUt7Zub+uplwL6akryrlBxlkQejD3WF1vK8QxSI+Iubzdy2
         JP9A34w8keMStsLuRz6sA4SVXGHjAOZHYTY6IoRjjjbp6p6RXA3Xi4uBHgYGpF4yklRM
         c4IT/NJXVPmaHOXu0Mf0KQDQJ0k0MYYHBpktBVnHEdZEux6/iY3kes4pz2dh+Q/eNVWw
         /HWvISOTIyFkVUOkQs52iXKpt3hgUnlwKL2F91ZgXZfJ2dI4+6vBiZijw3FmHuj+hzNf
         kgfU7pdtpTS4Px7r7EaCsWsc6OJI60CAVrhL11tT8mPzG6peavzot0SjUqJZzOiYNals
         5PFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761323621; x=1761928421;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XmFbq4MgFLvSavBU+dsE5BY6fpPsL4/gR9QPfUGTSHw=;
        b=rXlaZNAICCbw7gVZu2BgTQcgJmQpnxOLCdTamFZjW7RYq0tPLyuD1Y6EC6ukI5dSC7
         w3tBtATYippEzlErcN5K338HVDFVpzBPAhFK5tUNosRRQzTXvAYNmwbdzky/PVhc+aCz
         egi+m4EzXfaCiQLSAPH6KUwgEH48eRWpKKeiUSZTcbyA6B1kHMAk6M5P/mlYHXaIMDEL
         7LosBVxAxkRriaKED5TCZLWsU8UcxNtw8m+YluxqbWN+11ad7RMi3DWA2M2GAtcOWYp0
         l0wu2WmeRm/Jon4rg2lh3XpEUQXIPoxvwEDELcObKiSL+ItUfYedXDjpg7SWHIHw0hJv
         YSbw==
X-Forwarded-Encrypted: i=1; AJvYcCXXvw3ExEA72cNVpM6VcACrlRSaX5ml2HaH7/OOajgLF96YpxTy7LVdGygUR7244QCxHHlvEBAnRwh21rA5uEKt@lists.infradead.org
X-Gm-Message-State: AOJu0YzCm3Py6xVuwVZoE2lXAZzjwt3EjF0s7xm34GB3jLMiD2TT3PU8
	xHNjWLWZgxuCVh2gXlm/JoWrET27vUWId/x2kLQcSxhM4w5hyemS4B9OhK9t3CbTkXzvcUORCDM
	X+X01GA==
X-Google-Smtp-Source: AGHT+IFeKRRbqSfdPI99mHeasG8LL+kiQGTQFDWiy/7cdPCFgXLMLE3NirNFzhTfpVhc/qoTuLXwCz2Ncvs=
X-Received: from pjot2.prod.google.com ([2002:a17:90a:9502:b0:32f:3fab:c9e7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:244b:b0:30f:7840:2c96
 with SMTP id adf61e73a8af0-334a8629ec6mr34771147637.47.1761323620638; Fri, 24
 Oct 2025 09:33:40 -0700 (PDT)
Date: Fri, 24 Oct 2025 09:33:39 -0700
In-Reply-To: <5dea4a3d-c7b7-48f0-b2d5-7597e0cd5f00@linux.intel.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-14-seanjc@google.com>
 <5dea4a3d-c7b7-48f0-b2d5-7597e0cd5f00@linux.intel.com>
Message-ID: <aPuqYz3ly5a3__mf@google.com>
Subject: Re: [PATCH v3 13/25] KVM: TDX: Fold tdx_mem_page_record_premap_cnt()
 into its sole caller
From: Sean Christopherson <seanjc@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
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
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_093342_425355_4FB302EC 
X-CRM114-Status: GOOD (  16.38  )
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

On Fri, Oct 24, 2025, Binbin Wu wrote:
>=20
>=20
> On 10/17/2025 8:32 AM, Sean Christopherson wrote:
> > Fold tdx_mem_page_record_premap_cnt() into tdx_sept_set_private_spte() =
as
> > providing a one-off helper for effectively three lines of code is at be=
st a
> > wash, and splitting the code makes the comment for smp_rmb()  _extremel=
y_
> > confusing as the comment talks about reading kvm->arch.pre_fault_allowe=
d
> > before kvm_tdx->state, but the immediately visible code does the exact
> > opposite.
> >=20
> > Opportunistically rewrite the comments to more explicitly explain who i=
s
> > checking what, as well as _why_ the ordering matters.
> >=20
> > No functional change intended.
> >=20
> > Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
>=20
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
>=20
> One nit below.
>=20
> [...]
> > +	/*
> > +	 * If the TD isn't finalized/runnable, then userspace is initializing
> > +	 * the VM image via KVM_TDX_INIT_MEM_REGION.  Increment the number of
> > +	 * pages that need to be mapped and initialized via TDH.MEM.PAGE.ADD.
> > +	 * KVM_TDX_FINALIZE_VM checks the counter to ensure all mapped pages
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0^
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 Nit: Is pre-mapped better?

Yeah, updated (and then it gets deleted a few commits later :-) ).

