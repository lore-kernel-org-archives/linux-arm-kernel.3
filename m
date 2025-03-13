Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A924C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 09:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A1vA9sHgurzlxpNTPQ3LIOp8IB6esizGYotCRKHRMvg=; b=eoZrDYfl2Pa/h66BWzdT5w9r6d
	Oxhe78NNKaNG87rwfhKXgIqVcCv/RF8XzjjCKdAvttjMF9cAK8iv6nurrC/Jsm5Azosjk76vke+tV
	MW3Iuy32hO4hkBrEBMwgQXqJ0bMPGw5DdCNQrjrMXJsOsutDeLgqR61zgCQg7SQ7rjRBq7ilm0Jtn
	3PbvvJQUKnAeCazJnLJo/pPRtAFEZ4IHSBLFNO/p+Ai6bnQIvcPbJdbD9r+UxaF3MO/YHH0qVS4iB
	nddQj7w/37xgVEIYbgkPrbdGf0mKkHOMre5nP6myv56rZcMnMiHfpiR7Lg4GGycSw3tLWBoe0xBre
	UJlKZ7MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsefB-0000000AhGH-0WQp;
	Thu, 13 Mar 2025 09:15:37 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsedV-0000000Agvh-089S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 09:13:54 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43d0a5cfd7dso4081895e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 02:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741857230; x=1742462030; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A1vA9sHgurzlxpNTPQ3LIOp8IB6esizGYotCRKHRMvg=;
        b=RF/+5xEy+OkalgXMToZvqactJP8BhxLVlA+SDIjzBuza2DLsn9f/yoQNgqqsr7eEmL
         EBeO1nL7b2SFhlXYB4Ctfef3yRK6QBSm7LIBsZ5WCVUhHEhXbBHaHWpDdC1xPPuO6nVf
         FWpY1ebt/pe2RydTHzYzYAoB6OR1jDBlAxjiWRWIBerXub8xjmmWcm/qiV4eerV3vfG5
         6tmJk2HFuvcfDyhC2XFZxSuw0vC/lWcYqZHPTjUdkBUOJHYwVsaPjG4Pvos/534Fl1Kv
         dlpGjyEI6dLz2ln4HTA6X4E1NLVit0mjDOizbl2WVRTkxOGj5AcbVexkVPqr05pEm4Ee
         sBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741857230; x=1742462030;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A1vA9sHgurzlxpNTPQ3LIOp8IB6esizGYotCRKHRMvg=;
        b=sVoZyJorgwyWWzEmbXjEXVv1EjV+hG5AvZADgkt/tp/E6uQ/BNG6AyDMlVYF6VV7la
         woycV78R4D07hiPS/biJQAELljJKaLEAV+3Uzi7ilIov1a1Zg56ZypWNmwnqsv6tWpju
         vanpblZMZ0nD4fcBepa6YdVTUDJIh4d0mDIYS7ivEhkxGHskAUl14wLCj2nzljHHqyX0
         PvkJUh2FYbdDIK848P+BHBpl149awD0XeuhOWmW8JIHiC492jV/qjI9E8B15JaQjvbjm
         e9eKu69J67BzizaD2C2LUhr28bpPlQdytlBG2lF1F77hT4JFxMEWCPUU1tBgGD11X2dW
         DViQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOCI0mHmED+x42vZ5D1ybewHV9HL6H6oyihlNtgoh4Tg4IWkn1smlZmz5Bd0GvMl26OX5Gnr7ECjJgcJCHB6Ae@lists.infradead.org
X-Gm-Message-State: AOJu0YxQJpztQs5Vcprp9F+JyZvn8DtnflGTT3IjzjzGsEvl0eZhdjih
	7A/zYIgn1mVVBUECmi3exRuWf/cYFS1wnXiyMjybF1PtlKkQxgTxcym/aAG/Wg==
X-Gm-Gg: ASbGnctoT/D8xl+H82RYQGl96Du/FQQa5DHH6CiMXRsaNp1tfzAeqg6kKghXOU0dJqy
	Hm9gfYzgNvob4U3zf8WmvoF6DOsYTANPeUOwMZO/OlOSyDV20h7viHaJASCaI3h1ZH4/AGUreRJ
	KIYbNJodkVOcg9uQoNU2e4U8z44SAlJkwJCP/o5o8NSZg9455wSo8srr3X3pJfvZqNXW+sSL3yy
	xkQBaxBG4Od/lk9my1PzjlRh25q50kc+tLcOuEnTiACRH5mEbgGqvDwpFyY70bTxeOyE0EQOBgN
	w9PRQ8RuGnzPjhK7/af1YX2qo4jUWj7pEuncvNPehJP2BUSR08buLMX9JsU24awzWSfo2vu1KVx
	mlAUJ2kkHr09f
X-Google-Smtp-Source: AGHT+IE8nhdSI8oCc7HhvHZ8FNICrr82pSWj5KiIjJGm0gYMIEOr9ifulYDK2iTUrARjY9lcII5V5Q==
X-Received: by 2002:a05:600c:3591:b0:43c:f16a:641e with SMTP id 5b1f17b1804b1-43cf16a6b0cmr139569915e9.6.1741857230356;
        Thu, 13 Mar 2025 02:13:50 -0700 (PDT)
Received: from google.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d188affdbsm13931305e9.7.2025.03.13.02.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 02:13:49 -0700 (PDT)
Date: Thu, 13 Mar 2025 09:13:45 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	qperret@google.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH v3 2/3] KVM: arm64: Distinct pKVM teardown memcache for
 stage-2
Message-ID: <Z9KhybW0J2WIX1eU@google.com>
References: <20250307113411.469018-1-vdonnefort@google.com>
 <20250307113411.469018-3-vdonnefort@google.com>
 <87plim7hgc.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87plim7hgc.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_021353_070208_FDA93685 
X-CRM114-Status: GOOD (  18.13  )
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

On Wed, Mar 12, 2025 at 08:59:15AM +0000, Marc Zyngier wrote:
> On Fri, 07 Mar 2025 11:34:10 +0000,
> Vincent Donnefort <vdonnefort@google.com> wrote:
> > 
> > In order to account for memory dedicated to the stage-2 page-tables, use
> > a separated memcache when tearing down the VM.
> > 
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > 
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > index 12691ae23d4c..ace3969e8106 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -246,6 +246,7 @@ typedef unsigned int pkvm_handle_t;
> >  struct kvm_protected_vm {
> >  	pkvm_handle_t handle;
> >  	struct kvm_hyp_memcache teardown_mc;
> > +	struct kvm_hyp_memcache stage2_teardown_mc;
> >  	bool enabled;
> >  };
> >  
> > diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > index 3927fe52a3dd..15f8d5315959 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > @@ -678,7 +678,7 @@ teardown_donated_memory(struct kvm_hyp_memcache *mc, void *addr, size_t size)
> >  
> >  int __pkvm_teardown_vm(pkvm_handle_t handle)
> >  {
> > -	struct kvm_hyp_memcache *mc;
> > +	struct kvm_hyp_memcache *mc, *stage2_mc;
> >  	struct pkvm_hyp_vm *hyp_vm;
> >  	struct kvm *host_kvm;
> >  	unsigned int idx;
> > @@ -706,7 +706,8 @@ int __pkvm_teardown_vm(pkvm_handle_t handle)
> >  
> >  	/* Reclaim guest pages (including page-table pages) */
> >  	mc = &host_kvm->arch.pkvm.teardown_mc;
> > -	reclaim_guest_pages(hyp_vm, mc);
> > +	stage2_mc = &host_kvm->arch.pkvm.stage2_teardown_mc;
> > +	reclaim_guest_pages(hyp_vm, stage2_mc);
> 
> This looks odd. What counts as stage-2 pages here? Or is it that
> reclaim_guest_pages() is very badly named?

Yes, this is a naming issue here. How about 

  reclaim_pgtable_pages(hyp_vm, stage2_mc);

Then I can probably drop that /* Push the metadata pages to the teardown
memcache */  comment as it is clear what is pgtable and what is meta-data?

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

