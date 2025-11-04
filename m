Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF02CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 17:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kxFvD6gKxB44i1bxk1sbjy38espILrC0yFM/UcBrpew=; b=KRQL14yNYLOM44YsS3eGQRNog4
	9Fvb1urd5Ah1Sck6r9xg7xHdTEz182wDoTkPtq5huEyO+cur8cqCfRd65rq4X9T32NnWm8IqbBXTC
	+3hWlvv8wQLUyoRl/TV8YQuxVGbdWqOdK11r1B+faJzYY/rOJcy6LuFILYKSNthforaD7TSMdwKGK
	s0uwVdoLcv/4pqEvOlxs8ptyiUglQN2IY2g5IK/lfUG23hTzwVTgf7Rc+HVw0xxGkw4Z9kvBGgQY5
	IYOiOOJYjq8+w3F4X4R0o2r6pLBIBACYYG0c8XSB5kCxECi2GwImDNOLJ1txe8j10EyRenXfIiMbq
	aFn5XVVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLHf-0000000CJP4-13UI;
	Tue, 04 Nov 2025 17:57:31 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLHd-0000000CJNe-0r1d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 17:57:30 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b9d73d57328so2152896a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 09:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762279048; x=1762883848; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kxFvD6gKxB44i1bxk1sbjy38espILrC0yFM/UcBrpew=;
        b=M0T+8fGM5CgHtrWiI3+H8J3eVL7xXBJxkkekNd0VOa0y1zOii1FMgEIdN5x+Cc/f7E
         18ZRi1lWfNr+BA3UFnSw1TxhPBL7W+T3dOfmYl+ulzejqc6zJsO41HrsA+X9pWayYnBr
         7fMcjLyU+uAFKSi+o8Bx7sDMjjbs3eGbP8QgqAg0zwx204gT00Oc5fuoqnbv/N8VRSHW
         QV/oK87kgQQoouwbswd+anxs29GzEoFwf59nmmprNsbO9k/47OJby6YBJb6PnmuUOt/V
         3h45t4jzuzn0WdVtCuT+KXlCueosSeuMc0Nrkx6Qz2ubY3LzqyKSG3GFf81JfoAzfR2+
         fmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279048; x=1762883848;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kxFvD6gKxB44i1bxk1sbjy38espILrC0yFM/UcBrpew=;
        b=rUa1CUip/gYJdbs7fXDPAF7jplSD6BKda5ejQrHHNAePduDpfjili1pCylQ2YxLD9p
         P+kzupRcJaaUyIzhIvrMHy3oD+PKQmpoooTRdPOEeltApyEF9/Yzzrp9+LaEyEDKVNr/
         +fEhrJjXwqht4tPxebvV+V65EyqMIptML/68F0AjtuIqWxJ4gJKnv45GPSkYGrrfntSH
         ea0fdUE34hVQh6+vyLpoiX1fnPOnzjoJwSNbF8bl1TKDEmSO4LlmJbmOiCgKkK1vAyQG
         yPK2w36IX22l6krAJgUJAT6EjSgRdJgifzV9lMmth9fAeWTtA7z3AbqlfhnrHn/+kUO3
         +DzA==
X-Forwarded-Encrypted: i=1; AJvYcCUgTK2MRT2EPMzMXqIlyXQ1COsjFAtIuO7cwXQ2yiYVh/A5Hsd3ITRoIDBf6ory5o1jHk2r8xmzXIKlOdC3hw3g@lists.infradead.org
X-Gm-Message-State: AOJu0YyUp2V64VdMExcXn+BhajOvKLqIM4GYxLUJ0AnD6TSG/ferqqF/
	E6P1VSty6fSFYmc5FnoHC48wlyqH+EG+sUIs9TQuGFjD0plVvIWkvVve06Oz0FBqLHc7RzznWOP
	bCusEbA==
X-Google-Smtp-Source: AGHT+IFJG/V0EfaymcoM6cPfayQ+DGikxVc9kN5RoO6CmqYed2gXkivkS54tuPy9BQi+XScmFB78yDVh2jQ=
X-Received: from plblv11.prod.google.com ([2002:a17:903:2a8b:b0:290:28e2:ce5d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ffcf:b0:295:2c8e:8e56
 with SMTP id d9443c01a7336-2962ae715edmr5562415ad.44.1762279047867; Tue, 04
 Nov 2025 09:57:27 -0800 (PST)
Date: Tue, 4 Nov 2025 09:57:26 -0800
In-Reply-To: <aQMi/n9DVyeaWsVH@yzhao56-desk.sh.intel.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-5-seanjc@google.com>
 <aPhjYcOFjL1Z8m2s@yzhao56-desk.sh.intel.com> <aQMi/n9DVyeaWsVH@yzhao56-desk.sh.intel.com>
Message-ID: <aQo-hus99rE7WBgb@google.com>
Subject: Re: [PATCH v3 04/25] KVM: x86/mmu: Add dedicated API to map
 guest_memfd pfn into TDP MMU
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
	Michael Roth <michael.roth@amd.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_095729_243148_CFBA05AD 
X-CRM114-Status: GOOD (  11.66  )
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

On Thu, Oct 30, 2025, Yan Zhao wrote:
> On Wed, Oct 22, 2025 at 12:53:53PM +0800, Yan Zhao wrote:
> > On Thu, Oct 16, 2025 at 05:32:22PM -0700, Sean Christopherson wrote:
> > > Link: https://lore.kernel.org/all/20250709232103.zwmufocd3l7sqk7y@amd.com
> > 
> > Hi Sean,                                                                         
> > 
> > Will you post [1] to fix the AB-BA deadlock issue for huge page in-place
> > conversion as well?

If you (or anyone) has the bandwidth, please pick it up.  I won't have cycles to
look at that for many weeks (potentially not even this calendar year).

