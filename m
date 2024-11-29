Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC87FD6EC07
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 13:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hm3r4VcFovoN7vV/Z/7/O6DCsQhUW6XXm/ZhBzyEdx0=; b=EBheWhjYzHoeeNWwGbE+bCMaSI
	UM95TUM/OSu/IgnilB0TJVi4C4eDVMInZ4B02Mt6gpeP7sCzS5fLDSBKuduv4MokegovaeYxXgwCu
	hO4boQBaQvEL7dpRKEMMm6TVZzYnHW74MY4YEtFBUUh9J4bsIoGS9g2S5j0rXhEYBOvvQN6ragv6M
	eC0QADhTjcXdGGhIvybMxiVRD8h69zH+TpmR/Xy7XUOPuxo/7VqgFU8AzJreE9zjDftpwZU4Mh1NE
	TmWoGtSEiqOV+Z/az09JmqrGpCLkPELv0NN55z0KXv/9ZMR2O/lNx3IeBw40EXw3ecAXefffmHmo9
	OyC97KSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tH0mm-000000009wc-3822;
	Fri, 29 Nov 2024 13:11:52 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tH0lo-000000009oq-18ua
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 13:10:53 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-aa535eed875so265709166b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Nov 2024 05:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732885847; x=1733490647; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hm3r4VcFovoN7vV/Z/7/O6DCsQhUW6XXm/ZhBzyEdx0=;
        b=iI+RcXVx/wfzdb/T7FRHtT2tp4sfzHLTlaRT5j7GKaKznOlkiXIVUFv2RH8oFV0hZW
         JeRnsoWOtUPhsJGyLEbPcg/cx7jcv2i5+Gp/BFvww+dBqfKwbi731yRkAWBi9dTzrDKw
         /QteVNqQ+fMcuJTVBgKGmfV+ODiMQDtmnx8YMUxJwSjwM2ec+/Qtt7m6I4EriAEfM7r9
         L0N2t1zS4hT2rBGWnwZhvNzc56li72tF2BnWPTfVurFVmCxy6nG0VexCUPAeXVvdFVIb
         o4kYawaOizP4OF22BJLLsQ0IwyoOUPoTZ/qZ1US2oLFqIqmf4MBSNonh1OT+eOsXqTKl
         ebTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732885847; x=1733490647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hm3r4VcFovoN7vV/Z/7/O6DCsQhUW6XXm/ZhBzyEdx0=;
        b=iW3qxqqVtKdooFrGF2SmnpwuHFxZQ7P9OOiR6SaBkP0YKLctxEReo7t93NR+l/V99T
         ouJEeOF8MMBjWrlauHxEnje43UIEFe/3uf1uOX7P8rsMvvo/n0zDyIlfZHs02A/RYD9H
         hrWYtuCWZI09fu7x6CbXlwIrrN4P68IOssQRAYD8p6zOUEJY8eQwDcUEwmEcvo6DBUDZ
         Ryf22ak5DpWaxhkwsB/dZ8TZB7UbP1QywauMQDBZeXVwi/nGe4d20BBC6wtCFk3AyPTp
         NyumUitj50f7pvqB5KrQmQ1na6J7ILJzgTZw+0qZHSrExWhiFcnnvIMuc78tMqOgMUCg
         xSQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDKsVCyYb5/VzEIfJ+k4Ys3DetN38p9tI4mY4OSnmEG6VvE/Uh0VUD8fXld7gIHv8NDCEUywDxUiDvnOKsEC02@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0tM3TnetxBSCNsrNTHtfAhMlgzPdpGTkVKSNJ4KsX8dB+3BQH
	yUHnHxHWRfmwZ7TXkgfldi2M+ch0RY+j1gqLWJcN/dB8WmU28QyW8B6C9A0AVQ==
X-Gm-Gg: ASbGncv8VLIXsYF+tit9eH1QhISzD03JMku1ocr2voiZAW5hNwv4n8yyH859c4Y+BaU
	g5Z/IwEN+K/p6xTwU9FStOZoVycuV0A9R2zcfy/B6KCWV0/Dh9Lnm/b63mast7IKSY9Nr/IJKO6
	eHNcVmUAQEY5rtmToCLQHViko0SsNbQ96INqQ/NCssZrLdMGWK64rbaB4xBWbkxoO9jIMDQQqsX
	oPOtIUZuqc+m+EGCUv7FWY3bcJMEc5aqMTTbJD9nKGg+PdUbbrR/5EBOkCHmimWS2kFOTX05kuc
	WtYG7ki+
X-Google-Smtp-Source: AGHT+IEWryAv62jI6ZAYM2AouC0F8zHOcrJl/X+93V7MahOSmgmNr39a624Qy4c77JELRVfcnOj3xA==
X-Received: by 2002:a17:907:7852:b0:aa5:1d0c:3671 with SMTP id a640c23a62f3a-aa580f2c498mr828473066b.23.1732885845504;
        Fri, 29 Nov 2024 05:10:45 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5997d55eesm172306766b.80.2024.11.29.05.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 05:10:45 -0800 (PST)
Date: Fri, 29 Nov 2024 13:10:41 +0000
From: Quentin Perret <qperret@google.com>
To: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Always check the state from hyp_ack_unshare()
Message-ID: <Z0m9UXJYcjzf-pgX@google.com>
References: <20241128154406.602875-1-qperret@google.com>
 <20241129095812.GA4298@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241129095812.GA4298@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_051052_311384_8015A085 
X-CRM114-Status: GOOD (  32.43  )
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

On Friday 29 Nov 2024 at 09:58:13 (+0000), Will Deacon wrote:
> On Thu, Nov 28, 2024 at 03:44:06PM +0000, Quentin Perret wrote:
> > There are multiple pKVM memory transitions where the state of a page is
> > not cross-checked from the completer's PoV for performance reasons.
> > For example, if a page is PKVM_PAGE_OWNED from the initiator's PoV,
> > we should be guaranteed by construction that it is PKVM_NOPAGE for
> > everybody else, hence allowing us to save a page-table lookup.
> > 
> > When it was introduced, hyp_ack_unshare() followed that logic and bailed
> > out without checking the PKVM_PAGE_SHARED_BORROWED state in the
> > hypervisor's stage-1. This was correct as we could safely assume that
> > all host-initiated shares were directed at the hypervisor at the time.
> > But with the introduction of other types of shares (e.g. for FF-A or
> > non-protected guests), it is now very much required to cross check this
> > state to prevent the host from running __pkvm_host_unshare_hyp() on a
> > page shared with TZ or a non-protected guest.
> > 
> > Thankfully, if an attacker were to try this, the hyp_unmap() call from
> > hyp_complete_unshare() would fail, hence causing to WARN() from
> > __do_unshare() with the host lock held, which is fatal. But this is
> > fragile at best, and can hardly be considered a security measure.
> > 
> > Let's just do the right thing and always check the state from
> > hyp_ack_unshare().
> > 
> > Signed-off-by: Quentin Perret <qperret@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/mem_protect.c | 3 ---
> >  1 file changed, 3 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > index caba3e4bd09e..e75374d682f4 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > @@ -783,9 +783,6 @@ static int hyp_ack_unshare(u64 addr, const struct pkvm_mem_transition *tx)
> >  	if (tx->initiator.id == PKVM_ID_HOST && hyp_page_count((void *)addr))
> >  		return -EBUSY;
> >  
> > -	if (__hyp_ack_skip_pgtable_check(tx))
> > -		return 0;
> > -
> 
> Acked-by: Will Deacon <will@kernel.org>

Cheers.

> I suppose __hyp_ack_skip_pgtable_check() is now quite poorly named,
> since we only want to use it in cases where the page is PKVM_PAGE_OWNED
> by the initiator.

I don't mind the name personally, but happy to respin if someone can
come up with a better one :-).

> Hopefully nobody smart tries to add it back here!

Right, so here's a patch adding a selftest for this stuff:

  https://lore.kernel.org/kvmarm/20241129125800.992468-1-qperret@google.com/

That should help catch future regressions in that area.

FTR, I've started hating on the skip_pgtable_check() logic altogether as
enabling CONFIG_EL2_NVHE_DEBUG happens to 'solve' the problem -- it's not
exactly intuitive that enabling debug options improves security. The
np-guest series moves the host state to the hyp vmemmap, so we can
probably nuke __host_ack_skip_pgtable_check() with that as the check
becomes really cheap. And we could surely do the same thing for the hyp
state, and just always do the cross-check. I'll give it a spin.

Thanks,
Quentin

