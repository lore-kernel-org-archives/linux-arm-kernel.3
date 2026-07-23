Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A6EC531D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 15:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aFVBl33WZjlrrClLf2eJDasfH3PHHFJ/uyhHT7PEFdQ=; b=XXeKusp4c5W7vahf/F9KCNK5ln
	5qlk7rfSd8b2+RQd/Zb8Nne14wRLSPggzBBB3JXNlonVkHIOF6BxQw0bwcVLd3BHHvB0EB3lvsCA7
	KOnPfqRZbEt8AVRznlZymiRHqqF9pQ1bAyytyKzdaWVjQJdrsREmHpaTcvkFXgWBa4aTjUfe45y8Z
	06Zy5Gm/xeXdMVPUV02kyUCzUCm+m6TVX4ge9wSrJvoNXUN8nod6IiE1yG4SfysKC9jngeaGM/2zp
	XgmAeiQ9PmFsz4c3orsO3XnK+KoNiY6DOa+J6RO73h/2wY0IwTE6tIZdaTUAwldtd6jWCIpOwFllD
	ohsMbIbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmv2v-0000000EYzL-0ozD;
	Thu, 23 Jul 2026 15:09:13 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmv2s-0000000EYyv-3WEa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 15:09:12 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4954dff6536so6397485e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 08:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784819348; x=1785424148; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aFVBl33WZjlrrClLf2eJDasfH3PHHFJ/uyhHT7PEFdQ=;
        b=K3vbMgXd9SwBsBvbc+cpAz2PZF1imX2BHxedioTjLkdzi5wkGRpa6ZPg8f0rP52WKq
         lF2EowWb5ILhSX90UiWGATFJvNAW1gJsV7gxOqa1VgMhUa+HQijoCD9eyYCBDLBc4UoT
         3Jnzgr0SPbWQqElAZRyKeOEsxZZ+mNXLRBYioONF3lOs1JC7PMY7MmvjKIaNRP38WT09
         5MJS/krJnsPuirEjk4cdskaMx3XiLJ6NMeW8bCKzUFpOTGThdYqJt+KId2rEMZ/hg/d4
         RkmDnEiNZBxDBr+cr7WEgyerYm83ahLu5boFlDRY01elsDarouv8id9Pj1wj3tJmWqQM
         FzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784819348; x=1785424148;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aFVBl33WZjlrrClLf2eJDasfH3PHHFJ/uyhHT7PEFdQ=;
        b=K+jPAzbvd5YmAPEIHvs9Ekm0rkgqmjy2dp9MducI+1e816ygUuzNeoe9GJmd6R21L4
         7fDh/gL66Vxfd+NpnajOKvCURQr6jREXRUA2JkdfvM1rideTYziWF/Km+jVBJoeleln6
         0murSQ1iYdn1FKu6fWxfaas6F54HiGd1uAGIeHr/tFXAPqTmMB5KQwj3g2hmAckMdkmd
         mEFvD7m302DZrDsycJV+3I7MC2mxz0k5VtJ5c53HpAwrh38WdlNfQns3FV89Ph2jQRi1
         3ALgExlvmmX1Q/FNcXrGdGjXdFimBf78flWzX3+CGNblZVA42/ck1B3cAlcud1DAphBP
         vU4A==
X-Forwarded-Encrypted: i=1; AHgh+RoAackzysKaq9Vr+VXx2J2TbgG9HHn3M54vZ9w5czMHX0nayJBugiLKCRfP4V1zJCNHfSXjSZyXyM1xibkq8kTK@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6U0JCNWRrOK9v5mP3H99kfrk7gR7IdjEwYgOU61zXCpTqyObH
	ZraIbGjW1QDP312v8IzC0b1+6NRihJl0KxxvvogYcG8g/mvxXSY9Erfqsa/hDLs6Cg==
X-Gm-Gg: AR+sD130B/Ooyeiqx9/PU/CVH01N4iJpizvileuLucNzZOPa+JiDjNZ7Io+0WkD3bdt
	B5jzjg6izOzlK3doLAEF3VW2cA+1LbOnhlICl6oMOhKULrcHR7ZFnrxTPtsULaYIgGjFb1GRIsb
	vP8urCj7Q5BkdTpbQ22QhdUUI5Fr6eQjEDp0g4UJD50GI1rwIuc9x8HJzvFjNi9UpbkNVzPlg2E
	eHtpMblBjROwbO3ge1BtEk818x++6UjTBbMEbrZlQ1PwkZPMqQVCEe0w5YGB5ZQXrM2STKy1YO2
	dRKM1f1D2kdmbHUGNALpcWhh1gxZnwTEOenOY8Rf+yTNw3E2CZcvHVdxn8kEnX0ytujm0446Epq
	dL89BPZPu8+YAOH6B3s40e5DXCzErijau6CkgrjAGQnHRW/BN3hWN9Bpg391gTM3lXUSQGeW4hl
	7QnVd3nM/Xj1bT0nMgmJQjgMRQAJnNm2YdW+HYmVz+XENvLg==
X-Received: by 2002:a05:600c:35c4:b0:493:c337:db0e with SMTP id 5b1f17b1804b1-49573cffaf5mr42992395e9.18.1784819347016;
        Thu, 23 Jul 2026 08:09:07 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956b043727sm100788465e9.4.2026.07.23.08.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:09:04 -0700 (PDT)
Date: Thu, 23 Jul 2026 16:08:55 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	qperret@google.com
Subject: Re: [PATCH v3 13/17] KVM: arm64: Alloc pkvm_hyp_vm using pKVM heap
 allocator
Message-ID: <amIuh8OZk_xuk6_k@google.com>
References: <20260720171513.1415357-1-vdonnefort@google.com>
 <20260720171513.1415357-14-vdonnefort@google.com>
 <CA+EHjTw7t6KHuQwktNN5_dJgZCxeWejcoQMz3pe6wUuS=R+QtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTw7t6KHuQwktNN5_dJgZCxeWejcoQMz3pe6wUuS=R+QtQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_080910_925084_0E92630F 
X-CRM114-Status: GOOD (  17.09  )
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

On Thu, Jul 23, 2026 at 01:14:10PM +0100, Fuad Tabba wrote:
> Hi Vincent,
> 
> On Mon, 20 Jul 2026 at 18:15, Vincent Donnefort <vdonnefort@google.com> wrote:
> ...
> 
> > +static void errno_to_smccc(int ret, struct kvm_cpu_context *host_ctxt)
> > +{
> > +       struct pkvm_hyp_req req = { .type = PKVM_HYP_NO_REQ };
> > +
> > +       switch (ret) {
> > +       case -ENOMEM:
> > +               req.type = PKVM_HYP_REQ_HYP_ALLOC;
> > +               req.mem.nr_pages = hyp_alloc_topup_needed();
> > +               break;
> > +       }
> 
> Sashiko raised this in a different patch. This turns any -ENOMEM into
> a top-up request, but hyp_allocator_map() also returns -ENOMEM from
> the pkvm_map_private_va_range() failure path without setting
> topup_needed, so nr_pages can be 0. The host then handles a 0-page
> top-up and the while (!__ret) loop in pkvm_call_hyp_req() just
> re-issues the same failing hypercall.
> 
> This might not be reachable today, but could you make it so that
> errno_to_smccc() raises the request only when nr_pages is non-zero,
> and let -ENOMEM propagate otherwise?

I could also introduce a HYP_ALLOC specific ENOMEM? 

Otherwise, yes checking on hyp_alloc_topup_needed() sounds alright.

> 
> Cheers,
> /fuad

