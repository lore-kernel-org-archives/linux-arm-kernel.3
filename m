Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69960CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 17:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:Date:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nxXbjl0HhdoITaZBDxLqmLJTjrhCiLD5WEPTG0leRLU=; b=132jwzpNpzv7O8AcoJ8X/Yn78R
	LMDAS66uerVn61nCtqjzp8/PwMKAOa5NA0OQpZzj/97NjqSN3d5a75q3z5isZibYS8cSRqqBY9SIB
	qLaji6aYquOCieA81MAm7OtWTyBiIoICXHsvphgz3NkzmWdhJ5Sl+G/KtcAUVoDVNC53UDgJBV235
	DsutMj74aY0k4aquDBjAAqLAkbyRrs2nQ4G3ohh9bZBC7/BZd9Ha/GgIT6gtKXOFHlsYo0Q5Lhb8W
	mWDBNo22sH1IbU0wcIZROttvoAK8vdm9u6OodAuHlOcz3t7gNXGuXiaO5RyXmvfwyFe+BhAjpgZBy
	d/yxbgDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3Tu-0000000FzV8-11Gc;
	Thu, 06 Nov 2025 17:09:06 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3Tr-0000000FzUV-39rC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 17:09:04 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-781ea2cee3fso1204436b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 09:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762448943; x=1763053743; darn=lists.infradead.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nxXbjl0HhdoITaZBDxLqmLJTjrhCiLD5WEPTG0leRLU=;
        b=PicgfLp0YtjjIbtZFaHjCvGIrwMKjR4qHeelBj4VH8LzPlzDmxp+E2cWasifUWTqrV
         O/SGjpUuQj1xclh389vYGqp2PRSVJHiAMSNV0MJe8LGvHKp92x0nD+MMG/nsuu0voYqc
         yxlM2ZBdNnGD0RrPYKUin655kqyn8o27bI8XDlHmn/nC2oY7XyUYTlihBEe4BRuum3pM
         uFDEJkOM3PUaiCK/pcnZwroEhJmcc5Qv0l83jN874iT1Ke7F0CuIUdeTD3uVW1ihvIxF
         Mim4px+56WoSBHz8UBRoIWVJH2JuE8deJc0RIzpWd9ZUjuv8PsNeNxNtMUWwL975ub6U
         fSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762448943; x=1763053743;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxXbjl0HhdoITaZBDxLqmLJTjrhCiLD5WEPTG0leRLU=;
        b=sM6+9pmH609qLluix2DjikcezwAK8t1f259RCdEW4ufDIVHifr4ZVeHpx1VpgDm9qd
         G+MuFlQWvdnKNxEghU4gdsPwEHq2IVsOyb3IeMDWrlt2sbGLcOOqmP+5Z9+TqelDrrbc
         GDhARnEr7NO5a8iDtch/dzcgbqD4In/7jEfw0bGRILasIYjW+fgZPMD/1aFnU5JwVcVb
         1yX3f7208GTCAjdyeh9usMFZvUBscrCQIqpjpdE3XASyRBcXO49qLRkaq5xb0LMv8bOm
         KNvJXoa8QaCsssWo2dtXPdhEDyyD/S2UncZsPR2A+vq5G2agHq3iW57bugoIBcumrXD7
         QhLw==
X-Forwarded-Encrypted: i=1; AJvYcCV2q7brNTy2C2DlJoo1lyM1aCy6qP/RY2zpf+qg91hmhwW3CnokpXR3OC5PhNwErd6QN6MXECylWcOSssq3Lm0T@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd+7IfXr7bWydVV8cpoBJN9/ow6qFU+CMmRYGnU+sfmtJoOhqu
	2dp7lY7ctooPI57hPHRxhnxdvQHknBbx57MvOfIWWNIxt4HB33acw+6u
X-Gm-Gg: ASbGncvCw4RYVCrasAlL14JcTxw9vthUMxfBlEgehWmDvR3bx0OKYbQCoAFKtrrcDwP
	kIdyB7xtCezf8QWN5lLxs4rIGuxpY+yec7nBRf4l3HYaumtwcwfA/ovvVjA+8ch2pSk7Su8LEbE
	zwmxPDE/h4Uc8gJ6HbHwlhESIID42kg8PuIeVuIchWObx/scXWx6F6CmMjoraYblpDIlGnoseiQ
	ouI0D1qNP57iJSyaxvEscFDkRcbOltG7G6p6oX9Cm4VYuzzpelbwV4vFem+YUwIPNmT7qVeXpg9
	evSn1DFN09EAe7+4YQoF83gkfHyDCA2Hrw2HQ9a+Wy97l8jXCF6V7TNGghwRZ5lC4pqeF/kzCgD
	8MXdUhiKM+IocXo8im5mP0xddTkKEMWCw/txWVZ/cRJtsrUqIqbZQDEVzX5Zwhb+qjnpaRw==
X-Google-Smtp-Source: AGHT+IGcGbtG/gxArci+CopvKuv0vsWkSHD0Cj0H8EsVfNgzuLLOXCCQpVWCS8AAZU2IHguSNAAo3Q==
X-Received: by 2002:aa7:88c2:0:b0:7a9:f465:f25 with SMTP id d2e1a72fcca58-7b0bdb856abmr331762b3a.27.1762448942695;
        Thu, 06 Nov 2025 09:09:02 -0800 (PST)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9c0874bsm68007b3a.16.2025.11.06.09.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 09:09:02 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andreas Larsson <andreas@gaisler.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov <bp@alien8.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, 
	Juergen Gross <jgross@suse.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, 
	xen-devel@lists.xenproject.org, x86@kernel.org
Subject: Re: [PATCH v4 07/12] mm: enable lazy_mmu sections to nest
In-Reply-To: <87ikfn3yvs.ritesh.list@gmail.com>
Date: Thu, 06 Nov 2025 22:31:27 +0530
Message-ID: <87h5v73xjs.ritesh.list@gmail.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com> <20251029100909.3381140-8-kevin.brodsky@arm.com> <87ms5050g0.ritesh.list@gmail.com> <50d1b63a-88d7-4484-82c0-3bde96e3207d-agordeev@linux.ibm.com> <87ikfn3yvs.ritesh.list@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_090903_798836_2D4F3D44 
X-CRM114-Status: UNSURE (   8.70  )
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

Ritesh Harjani (IBM) <ritesh.list@gmail.com> writes:

> For e.g... 
>   
>     arch_enter_lazy_mmu_mode()
>         hpte_need_flush()
>             get_cpu_var()   // this takes care of preempt_disable() 
>             adds vpns to per-cpu batch[i]
>             put_cpu_var()   // 
>     arch_leave_lazy_mmu_mode()
>

Sorry, here is the more accurate call sequence for previous email.

caller()... 
     arch_enter_lazy_mmu_mode()
     ptep_xxx_()
        pte_update()
             hpte_need_flush()
                get_cpu_var()   // this takes care of preempt_disable() 
                adds vpns to per-cpu batch[i]
                put_cpu_var()   // 
     arch_leave_lazy_mmu_mode()

-ritesh

