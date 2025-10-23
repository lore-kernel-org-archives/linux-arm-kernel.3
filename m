Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C393CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 15:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DsY3zzD8XUrRiTLyLBawfwaQI9/sErmot+/rfYHcY0U=; b=F8SAnhajrJl1EEqmo7O72kGJWt
	z0rpPxXc/li9xJxZJi/sUbZyxV0HoP1XuvMtmt7iBwWSnwFH+Mu/3YcCMBIMy/d129GEfP1XrhGse
	M/2r2NKinCDRJxyFB1j4SCHgLZZiEk3tWqK7tbmp9YeUtE1ZSs9FANvMn9BRwvR8KgnuSJV/lnZPW
	q4natmAsCUHfZsLPrWbhYOnoR+zidCmsYYd5xbeKZeqsKUK1HcVLX69RytmtGhWWFXrXk/ymteDRX
	nA6y4yeiTwxb8Ki8TYEW8ERbC8tYdvJq5MeIlmaoZxH4wd+WGdgt+EjgtHG01VT6jS3pvs0pPLWNR
	1bqlA8zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwnN-00000006fwK-3IGg;
	Thu, 23 Oct 2025 15:00:06 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwnJ-00000006fre-0E9Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 15:00:02 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-32edda89a37so764667a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 08:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761231600; x=1761836400; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DsY3zzD8XUrRiTLyLBawfwaQI9/sErmot+/rfYHcY0U=;
        b=pUu7C0wm8usAkABHUsEGECuCRq2+KlQkIzDXul1G9xEE83cE9f8Gm3pvHjxL4dDTzu
         jPNA7VzZvkDX/LtNDA/fupJGU08+2RRSolNnTuKwjuW1D7dLltNo2HGAyUam3U7Fa9/L
         DjyY6GoqDnyF1b8GzJ83aLOetFQSfmC/qjjT1pSWE7l1cpFyYM9Q3no6BVCD5EmWa2lI
         2hW+5tFi/ZBHY0yr1vhYPTr7J3yS1e47Mkg0X1iMFL5DlzDCq/eohNoDNqseFKgZ+Fa1
         dd84uuRNX2DRI7QbnyyhZkH/Lyi3/D4NFay2NNOcOuyPlRxobkbOAYQjMboxM0lMzxFj
         ZJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761231600; x=1761836400;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DsY3zzD8XUrRiTLyLBawfwaQI9/sErmot+/rfYHcY0U=;
        b=fxY2NFCaNbHtdmoITbF8/0Lu1L2/VLgNX55hLnltD/plSkdMJMgb+5X+u/QXS1Lfaw
         qdAAnK+oVO7hnsiyA4uq0Utdp5hZs83knVwn3+FarAPGojX2rU+LrDyLFcRSg0lse+sE
         IsmDa76LbuZjPPLPZydYUvLkH0D1Fc+VlguysK+jFbDc5g63D5qbxxjgMbqwA/st7ccW
         5m556ln72MqyC9nKMsyyHfNYdkcxs8u/hZb7rePLMizK3tNdNeXbOklDHBLXoYQ9sVOH
         9FXCf8uwhfu0cZCWVi3CL4MhBPYdTNipPAstv1aaYbJBab/SVxgc2GabxBWeVtxrzgRw
         0YuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYK5p7ejmoXFKz5P2G7UFNvhPcfKSAI1tPSIAXPl66f9W/XO333qGkEnPkKzt60ziJLYjeMpuUmRV3ZL2SgINl@lists.infradead.org
X-Gm-Message-State: AOJu0YzWdwjAMyNn8FNxxxe2tJbLlUEG20FvcEtkYTY61+ffN8huRAbt
	1eIVb2l1p2LN8BlG5DHoddBhTgcUROeq84kQbLzZ+pkCxTGmco/ZggO7QFRs2biG80MC1MIrz5F
	YaKjxiA==
X-Google-Smtp-Source: AGHT+IGIKST/5gTXkhLeNb6+zo5OEJ6E7Tz0ILKzp1TDg+5uVro2JJ+z5T3UkH4GmCDPjUQAuY2o81CumRA=
X-Received: from pjbsp15.prod.google.com ([2002:a17:90b:52cf:b0:330:a006:a384])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5291:b0:32e:859:c79
 with SMTP id 98e67ed59e1d1-33bcec1ab25mr31136898a91.0.1761231599767; Thu, 23
 Oct 2025 07:59:59 -0700 (PDT)
Date: Thu, 23 Oct 2025 07:59:58 -0700
In-Reply-To: <28136b62074550826efa3f57b1f7be07f571abdc.camel@intel.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-10-seanjc@google.com>
 <28136b62074550826efa3f57b1f7be07f571abdc.camel@intel.com>
Message-ID: <aPpC7mt3CwWuhv1p@google.com>
Subject: Re: [PATCH v3 09/25] KVM: TDX: Fold tdx_sept_drop_private_spte() into tdx_sept_remove_private_spte()
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>, 
	"maz@kernel.org" <maz@kernel.org>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, 
	"pjw@kernel.org" <pjw@kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"kas@kernel.org" <kas@kernel.org>, "maobibo@loongson.cn" <maobibo@loongson.cn>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, 
	"zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>, "anup@brainfault.org" <anup@brainfault.org>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	"michael.roth@amd.com" <michael.roth@amd.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, Vishal Annapurve <vannapurve@google.com>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_080001_099086_8F01609A 
X-CRM114-Status: GOOD (  11.33  )
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

On Thu, Oct 23, 2025, Kai Huang wrote:
> On Thu, 2025-10-16 at 17:32 -0700, Sean Christopherson wrote:
> > Fold tdx_sept_drop_private_spte() into tdx_sept_remove_private_spte() to
> > avoid having to differnatiate between "zap", "drop", and "remove", and to
> 		  ^
> 		  differentiate
> 
> Nit: it's a wee bit confusing that you mentioned "zap", because after this
> patch tdx_sept_zap_private_spte() is still there.  But it may be only me
> feeling that way.

Hmm, yeah, I agree that's a confusing/misleading.  How about this?

  KVM: TDX: Fold tdx_sept_drop_private_spte() into tdx_sept_remove_private_spte()
  
  Fold tdx_sept_drop_private_spte() into tdx_sept_remove_private_spte() as a
  step towards having "remove" be the only and only function that deals with
  removing/zapping/dropping a SPTE, e.g. to avoid having to differentiate
  between "zap", "drop", and "remove".  Eliminating the "drop" helper also
  gets rid of what is effectively dead code due to redundant checks, e.g. on
  an HKID being assigned.
  
  No functional change intended.

