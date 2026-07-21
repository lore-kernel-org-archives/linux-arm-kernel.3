Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9868C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 08:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OshMXjh7Cgoor6MMiGrVEQRdUgGOjdKbShq5C0Pf5vg=; b=qKvkZK1jg/95kJNzBxQtK2cpwk
	Qtjz2gCa+JPni5ZsOgfOTMIYZ8hw93W4+UPcJiGswaCD2j40kRvfE1Xz8oTPztCkUcJIi3LKJHJ5Z
	PN/RF9aXiOjEMtmJwKLRasJYEyBjHM6Dj2hET9JJnXmIzejKz2o4WmntfgEVXlHJEQd4tXI34QWz4
	kORRhzTDDu2UY0Rw/1y5YZ43ZDqOIuNcjmEZDInODgkia6A/aYeQ1jrpqHb1sy6crQRcv70nGapJ5
	ryXzK5oJenN9aDTGN3x86Ukgk6A/Zs3oq7bzuoHCIWaF9cZpsK5IXhF+rj0gg2LSV64CH9+zz4Hlj
	SG7N51sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm63x-00000008rYk-1g84;
	Tue, 21 Jul 2026 08:42:53 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm63v-00000008rYG-1zsU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 08:42:52 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-698b78c05b0so45219a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 01:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784623369; x=1785228169; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OshMXjh7Cgoor6MMiGrVEQRdUgGOjdKbShq5C0Pf5vg=;
        b=cNRVxIxnxkYsWBOMHzgB8vXWx3SBcrspPeSSWLNeG1z4Pec7an4ETazTbavLNUEOqB
         v2narwfCHwyS/K4cjhFslsUghr8gZw+mOoNL7YCmtisElRy7rb127GcPVO8suY3ikMuf
         feFUBUrJ7xbI/wwX0T3IBVPbjN/oz8+mqNDcLvv03VBwhNyY2H+pbf5yBcaV58LHAS7Y
         qrpmtE6SK4Qaqu+xgSLCAQbwIB0+g/xW/ri8+9aYUvUIr8yx8rQsGEMwm3TEQFUStyAh
         K1XF06o6/SHk7EKShN9rkHTRCyJMzenAgsMG5+f8YXvmDHB5gpCYfC4+9zbXiQ5Ct1rc
         JLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784623369; x=1785228169;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OshMXjh7Cgoor6MMiGrVEQRdUgGOjdKbShq5C0Pf5vg=;
        b=YMU0ZjilRTYa4LC8s0n1gpzGew0yQGdGWioO0IWDf+lWXPooVyRW8mpjDwZFDBfYUm
         uaVuHnBJ+SYSztMCLGo4DYKa3TACPvor53dap+d7Lr0cu6+g3PRUf5EsLDZpFi5zzVce
         nL4NCdYvh8f+USsXsmIiI9DArlDTSCA134lDWTMTS0aZf8MR7UWo3p0tUshVyx1/MGZg
         kZLY9m2pOPvDHTFBXl5FcInCr1A5/muOQFyPgIqnSYIAJYKpm0lZ3GGz3D4dJ3dxP6Oz
         7dgoMMe/brlFku9i3yXNsOiVprf27S+Lq+rDg8S7A0oe1mL5k2bJLinUUTN7qy18mGVS
         5b8A==
X-Forwarded-Encrypted: i=1; AHgh+RqCYeNIsL+tLgWRfcHk5pxKLzTnvjZ44yK8J1r+6WDyErzgjskFXJoV53uPXE99f8+3dk+9HthnhkwzgpUsJ2vo@lists.infradead.org
X-Gm-Message-State: AOJu0YxV0+3yHu1BbSLRvwOpRIGienpheQx913U7v+grOP17Xk+p4O95
	5ON8s5WQ/YddKcVqBRxhaZVvKSrQdG/UaX4mG8ILM4lS0GVBjgvaTc1riYPlft3rtw==
X-Gm-Gg: AR+sD127R7lZZDJ+dhIAg0oz1RfeTuqs894Uj4oaRkyHxOhAtaBKCTYLJDfUz5opoQD
	wEyV0YAG5cuKaEaDDXg72c0CcMo8tDS6aI4BfSnW7TNgwxmjPhvbf/HVWbqwZvfZsW2OU29rhop
	KN8n6QwB8xzulBjVI82B5JlR31hATkJzhgagYOb0zwx+4cr3tLq0+7vtE4E8Zui4NID+8tHU8Ra
	lTy2lM9CejkG8ZRc7L40lTiiJUM6GvzWzlugbyJlQQRddzA6yiTtGq9d8RnunK0z3m9I3EoRNYE
	x54aRveaKAdw87iE3RmvAcriofluEkeBfJZCNznSQ83s9HAgHsfAxz3ULXuWyYxb3CexCQxHpCI
	RlJyJqtAs5v+44PvynfTgmt9g0YfQ7pYW8veH9rpPqugdmqF5o+kbDuRtHsrwhzMapxlBWeOlKT
	aEF5H/ImM682hdWNwkilAmFQ34uIJrB6/2UuyRiC3NXav4nfPT
X-Received: by 2002:aa7:dd03:0:b0:69e:98c8:e958 with SMTP id 4fb4d7f45d1cf-69ef509967emr74880a12.7.1784623369037;
        Tue, 21 Jul 2026 01:42:49 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705a0a4c2sm566318166b.16.2026.07.21.01.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 01:42:45 -0700 (PDT)
Date: Tue, 21 Jul 2026 08:42:39 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	oupton@kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, vdonnefort@google.com,
	sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH] KVM: arm64: Optimize protected mode and FWB
Message-ID: <al8w_5ogFQgt7ZFe@google.com>
References: <20260720203529.1276355-1-smostafa@google.com>
 <CA+EHjTw+BypEvWRccxqsSGR+btEX58nCUC2ypuSjw04Qo3nN=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTw+BypEvWRccxqsSGR+btEX58nCUC2ypuSjw04Qo3nN=A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_014251_533761_A6271E59 
X-CRM114-Status: GOOD (  30.01  )
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

On Tue, Jul 21, 2026 at 08:49:26AM +0100, Fuad Tabba wrote:
> On Mon, 20 Jul 2026 at 21:35, Mostafa Saleh <smostafa@google.com> wrote:
> >
> > KVM opportunistically enables FWB if supported by the system for guest
> > VMs, which allows it to elude cache maintenance for data as they are
> > forced to be cacheable from stage-2.
> > In that case, __clean_dcache_guest_page() will immediately return.
> > However in protected mode, before calling __clean_dcache_guest_page()
> > it loops over the range and fix_map/unmap it, issuing TLB
> > invalidations, dsb() and isb() unnecessarily.
> >
> > This can be optimized by returning early if FWB is supported,
> > kvm_pgtable_stage2_map() already issues dsb() and tlb invalidation
> > functions issue dsb() for the unmap path.
> >
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/mem_protect.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > index 4e329e39a695..6e9229106a25 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > @@ -261,6 +261,10 @@ static void __apply_guest_page(void *va, size_t size,
> >
> >  static void clean_dcache_guest_page(void *va, size_t size)
> >  {
> > +       /* See __clean_dcache_guest_page() */
> 
> This looks good to me. One comment: this file also has
> hyp_poison_page(), which deliberately avoids
> __clean_dcache_guest_page() because the FWB elision would be wrong
> there (it even notes "Prefer kvm_flush_dcache_to_poc() over
> __clean_dcache_guest_page()"). Given the two opposite treatments in
> the same file, could this comment say why eliding is safe here, e.g.
> that the consumer is the guest via the FWB-forced stage-2? It would
> save the next reader (if they're anything like me) from reconciling
> the two.

__clean_dcache_guest_page() already have this comment.
	/*
	 * With FWB, we ensure that the guest always accesses memory using
	 * cacheable attributes, and we don't have to clean to PoC when
	 * faulting in pages. Furthermore, FWB implies IDC, so cleaning to
	 * PoU is not required either in this case.
	 */

I will add comment to clarify guest vs host:
	/*
	 * Guest stage-2 uses FWB if it exists, in that case it is
	 * safe to elide CMOs.
	 * Unlike the host stage-2 which never have FWB enabled.
	 */

Thanks,
Mostafa

> 
> That fuller comment could also replace "See
> __clean_dcache_guest_page()", which mostly just points back at the
> function passed in the __apply_guest_page() call below.
> 
> With that fixed:
> 
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> 
> Cheers,
> /fuad
> 
> > +       if (cpus_have_final_cap(ARM64_HAS_STAGE2_FWB))
> > +               return;
> > +
> >         __apply_guest_page(va, size, __clean_dcache_guest_page);
> >  }
> >
> > --
> > 2.55.0.229.g6434b31f56-goog
> >

