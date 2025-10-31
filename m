Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CB1CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 09:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y5oqO91F+X+WX7+C5vKkOfA3RMlNxfHv2fFSqkI6O+c=; b=vNWNJdKbVnwy7Z1ztzkF2NxQkd
	T4U5qcTKXBqCPacFIJxsxsrNdUR1cXbLJSbbbA37NEs7KXap0ROBmAPJD03NYWh5TFN++HGBBEEfh
	mFtyyrgIGM37ss6o0wvcDpYuH/NFoxbKUthuddgM8OelFnlSPj95cfBWqrBSuuLnME2Dh9GSqJJDe
	JANtLVNtIhFmc3siPleuECaMucBi7SAirG4YptDkv9xSpPX3mgYgTUGIKL6n1IstY7LR4pj/sNoZr
	gkzP4yTCA+W7IfkmNh69akNvoliRowgfHAgnDQAG+WqYIAwuQfw5eYZA8Qxm5LXhKTL87HlbYsQGv
	jcp1T37g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEl7b-00000005l65-1jPD;
	Fri, 31 Oct 2025 09:08:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEl7Y-00000005l4K-1Fvg;
	Fri, 31 Oct 2025 09:08:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=y5oqO91F+X+WX7+C5vKkOfA3RMlNxfHv2fFSqkI6O+c=; b=SyG78lWKrKRjTeCNiguA7R+OLO
	22W+XYSVlm5gqFHUD2qUS+/4yJ8YPVv6A7bfEhwVKLtGE0+l2PjXlIllOAZZojGHBrN/EOgSXZHGD
	QVSEvoqZI5WuK2jrVWxOLWLFAkYCveSO8ulH2gAG5wBC4xYkvYTKuFwwmSqafYoRYJmop+SaRCw6V
	fb9aVCfCXf0yCsUDxvR7rSZkVRUCmsFAZEAv54CwHxwtUl61sFctO8uY0Y488+HCMW/78AU01DeZC
	fqXcWbsDMP2ZOZyxApEVVxwB06Dyss8i70+FmNF6NUvfKaDeGE7FvlwudgDrGO3qwGqYRDQy59GOh
	4b3Pc57A==;
Received: from mgamail.intel.com ([198.175.65.16])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkFk-0000000ArOO-3pms;
	Fri, 31 Oct 2025 08:12:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761901708; x=1793437708;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8N9WDGemUWQsRelXH+GyTq3qC+LNB5rRhJXjTRawBT4=;
  b=c4g2TVMoYnK7jMudCt8kKptm7l5+VkIk57nd6/9SDbJzs7Fmka7HRvWt
   lSPNkiNm68TMc7R85kUwPh1x5CFV92Zb8jR0/x4x6tJpjt9tIHW879uu3
   rp0dTUGWIudDMo12ccMDp2z1ShX9DqEJh6kDyJZtLh1ZfBXlfzfW4PVRH
   Bg6/Nskej5TPC6bcBTGbO3bnMOnN28aMvS2I80frY1XKeH/z5L7A6CsRe
   jqkq4sEjOKrvbjAXKh9nh5hh+w60N73tR0jODDihOWFjX+mRmSArGHMex
   x+o5s5GGwaoxFF4zbkl0U4cFTddxIcfNJ5xU86shOvbANhTxKTXM0AV9P
   w==;
X-CSE-ConnectionGUID: s5UEaWwkQO+YxGL7n3ZW0Q==
X-CSE-MsgGUID: FvQSb+jXRQuq/HC71gdBvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64208921"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="64208921"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 02:08:24 -0700
X-CSE-ConnectionGUID: GjHDbGLnSWakhDM9/CBrlg==
X-CSE-MsgGUID: Gbbob1bvT8C2WhgnaRVktg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="186123013"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.124.240.28]) ([10.124.240.28])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 02:08:16 -0700
Message-ID: <a4dac87e-ff40-4ce1-a969-c8f535b66d74@linux.intel.com>
Date: Fri, 31 Oct 2025 17:08:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 21/28] KVM: TDX: Add macro to retry SEAMCALLs when
 forcing vCPUs out of guest
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Ackerley Tng <ackerleytng@google.com>
References: <20251030200951.3402865-1-seanjc@google.com>
 <20251030200951.3402865-22-seanjc@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251030200951.3402865-22-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_081257_960223_78985A42 
X-CRM114-Status: UNSURE (   7.34  )
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



On 10/31/2025 4:09 AM, Sean Christopherson wrote:
> Add a macro to handle kicking vCPUs out of the guest and retrying
> SEAMCALLs on -EBUSY instead of providing small helpers to be used by each
> SEAMCALL.  Wrapping the SEAMCALLs in a macro makes it a little harder to
> tease out which SEAMCALL is being made, but significantly reduces the
> amount of copy+paste code and makes it all but impossible to leave an
> elevated wait_for_sept_zap.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>



