Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFC01090240
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 15:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CAHdFeNRl4yy2sR/1LOHb2d72hyJTySGsjAok8mzB+g=; b=XdBWm6h+HsDHP/oOFtHPwhPK2z
	eFSF/JNtPGmBla19TJ/ahRK4sU0G6F2ojZiAfLLQHPkmYTin+GPaqIrIodNfhm/HzzdZlUeUGJ1pO
	QaBCrTNNXgfMvNYeOvxnm/XaCjQM9WEl/VA1bLT9eYawIXXhlx6ns2NBQ2OL+D5klOtWeybSCH3Nw
	bZTXWNWoa4nQyKiGyaQBE3fspB/DKaoWNu5JST+G9mOWVgXvkFJNk/QmWvXFwJCzF/DrximCHMafF
	208fIT4zPxs6HaYm0WYam/L05+4j5bEcav4u5jA/Orh/2No5Bx+M5PL4X3JKeoxLO50uW6Ts1av3c
	m4QBkajA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3FEh-0000000AuQW-0DJo;
	Thu, 19 Mar 2026 15:24:35 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3FEe-0000000AuPl-2ULP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 15:24:33 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-899ed41208fso17356066d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 08:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1773933871; x=1774538671; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CAHdFeNRl4yy2sR/1LOHb2d72hyJTySGsjAok8mzB+g=;
        b=fE9/lPwutGfat2UvN5ldmuBlJUEC0vb+d6YlEDp+KY/MMNYoOWt6j+fyLX08NrSNQ7
         42kMC9cHasZu214J/gJfYK8RNx6k7Fi5WSLvH5y17gdZxZOKsg7b10A30QFzIn5WSz0p
         CHcNcYsqrYDPyOnRyui0SLy9f8hLyD1e/zh8o9KiveU1aBsn6aUUSfSIv6EZ9F9cv+KC
         w/07i1pO8L3sPrXAT8JuuKb5JO0xaMUMKs2jDfewJ8MeAdA/9udsWvoabmunbfaw008I
         GQ7H9cWitbqZjHLXASIcXvJ+LwTOoZhRW3dXLwOxIBq/PM3iogmLrsI6+4CYdE2sMTfS
         IOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773933871; x=1774538671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CAHdFeNRl4yy2sR/1LOHb2d72hyJTySGsjAok8mzB+g=;
        b=qQpwNiwNZKlxhOUHiB2aKzxXA+yA/3hTqi02cT8ilRviR+PCFm7T1R7k18LPaUi/HS
         OLUTa+7FFRQyk+a3eNtr+2BtVR3ufm2zpJRPNi0aw/Jl0Z5BSaXfvhl4+SEJ2EIeGKlN
         kOxegOOsAy7el9VHx0TX8F4ObS+eZt+PQ/oE1dcVy9ETNAmCW0+dPQ+waOamYK76JEWL
         /640ZFm3vrZGMwNS4dcnd5XTOqbjec8GIE0rgT4Ms5eLyjctlXoBkE6lwjY08wltYJX7
         r5C/YtNsP4Gv3k44hfx5wW28GFSu/gxLyLzFrCTAxfGlcxyGiRp89ncbws8e8bmgpHPF
         TP7g==
X-Forwarded-Encrypted: i=1; AJvYcCWlaTjw7OqDvt1eV9eH1PUhq3mrcQUFpHbRzynicyv2aCtIrRlVQGtl/DtNDDQIgK7i0AjmE+XFL5QxF73FI4Y3@lists.infradead.org
X-Gm-Message-State: AOJu0YxXi/lkx4/sclaGK7GPOlvdlJO1Am+Mo/AO0ej19z/j3JdF0uDA
	qqDXxUOUO7gowb13AOeKpviCAjCfe9UZ8a3Dv6S8okQkruREymj5kedmdsG5ovtdvP8=
X-Gm-Gg: ATEYQzwpsgYEsmiEOj9Odlz6dfIrnolskq/UT3AORZUU2wkPYPnQQQJu3fZGfJWlR+E
	IfGz4VB4Jl/20fweiNhfkWL1atAfng5bHAGcHKSxg9vVhRLfWwZZJT+PtgNTXkzAXfOO2qbYSTt
	wEWNhgr3h9oBTr8t8oStSO/G7ztu2YYCNYHbQNi5P6nl7pH/DyQSCDUDOG3qeOCVJ6wQ93GSs0G
	QXQ8GRSETDjIXwCGDOWvGTvL+fs/EmNN6cRMPehNS61LHNos9IJdfytropiGwJ5NVBd0lZeahbe
	sSeHkKSuB6c86tlBVlL2KIGt7YmW9/nVA8OvNMpYp0h2HWCEyoZVmhxJsf+1vVTnHWJ/yEMkY/q
	w5pHlwW8XAnh/Ld2LkwRsqEq2oAkj0rjlrZrUVOHznOTZzr+lyAKxFiuA8F4qxlwSJKryDBdFn1
	P7yxtlYXH0igaJS2Lb0ni4BDjnFK4HONIx4XzZ8NYZolxC2MNsScxVN6Jw+G/xFxIzb06YSj0s4
	+Pra1zTGw==
X-Received: by 2002:a05:6214:3314:b0:899:e702:b852 with SMTP id 6a1803df08f44-89c6b5fbac4mr107205736d6.57.1773933870639;
        Thu, 19 Mar 2026 08:24:30 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c6b8dfdf6sm49250646d6.5.2026.03.19.08.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 08:24:30 -0700 (PDT)
Date: Thu, 19 Mar 2026 11:24:27 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-mm@kvack.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH 1/2] mm: remove CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE
Message-ID: <abwVK8nLpSLVcT5G@gourry-fedora-PF4VCD3F>
References: <20260319-config_migration-v1-0-42270124966f@kernel.org>
 <20260319-config_migration-v1-1-42270124966f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319-config_migration-v1-1-42270124966f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_082432_628052_09DE8152 
X-CRM114-Status: GOOD (  12.14  )
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

On Thu, Mar 19, 2026 at 09:19:40AM +0100, David Hildenbrand (Arm) wrote:
> All architectures that select CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE also
> select CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG. So we can just remove
> CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE.
> 
> For CONFIG_MIGRATION, make it depend on CONFIG_MEMORY_HOTREMOVE instead,
> and make CONFIG_MEMORY_HOTREMOVE select CONFIG_MIGRATION (just like
> CONFIG_CMA and CONFIG_COMPACTION already do).
> 
> We'll clean up CONFIG_MIGRATION next.
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

HOTREMOVE has long been a thorn in my side, I appreciate you cleaning
this up.

Reviewed-by: Gregory Price <gourry@gourry.net>

~Gregory

