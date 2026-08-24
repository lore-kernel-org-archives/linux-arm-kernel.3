Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5C4C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 18:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pfj+197L8iiCOOZQVfEeEcR08/T9xhEkWlXqqc1DeWg=; b=nFqOJYDZYzgjP/HZi566M/ltxQ
	hgd7V4u7qYCUr0hRifqCko+cckBmGeQgrAlLVioloeSdVJn6/aGOqcmLjxSBbZeOK3IPU4AHdo71M
	4DzurpJCoQfTpOOv8YcO6BCxsEZdXzPygjF3FFHvx4aLo4kgjqInWDTFokPvavcCbkHgSsW45XLjd
	CFYyj9enL7bLPFYkGWeB2MtYQTs19gwjtUlmdKlgU2qa+IWUaZz8tyo7MLtMWg8G3DOUX0+QlFqNC
	zskLhj/XA7NvoGys0bRykQC0UGM3Jp2pfgw9BR04vKyrOSA/5hH2FdwY9E8ulz1XT+FtmHXtewfaY
	RQEHNq9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyZD8-0000000HExq-11D0;
	Mon, 24 Aug 2026 18:15:54 +0000
Received: from out-65.mta0.migadu.com ([2001:41d0:1004:224b::41] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyZD2-0000000HEwg-3G1e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 18:15:51 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=YbEiycZ2zmkIOvgdOThYOxacEg5IxP+K32goDMpZn64=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787595346; v=1; x=1788200146;
 b=Lxa+wetlYCbvWFfD+R2koCpzpdgQ4SP+P7KzyKH57aItlCbHBoLYdazmKpMN0T6qMql9Aeuk
 weA8clDFjipHZfUP2JHyVVKKA8AB+CAeBV5C5fL4vgjMOivZWoSaiqyl5EWiIN0yCH3CCY2YRLE
 gA0z66szoEMeVG4CBcXK+KoE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from mail-lf1-f49.google.com (209.85.167.49)
	by smtp.migadu.com with ESMTPS id f274a750d5591fa0;
	Mon, 24 Aug 2026 18:15:46 +0000
X-Mizu-Trace-ID: f274a750d5591fa0
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b2a73da7e1so1130e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 11:15:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrDH96BmVuYLj0EUjVTDPBT7Bqi3nnsn7u6Utlm1+wjFkMm7R2FPObZZAH7Tcqc4XDNWofxLQo9SbEF6V08izlC@lists.infradead.org
X-Gm-Message-State: AFuF++n5dtE4u2pqA4PMvxomcGKg2i+eKhBAFMt68S/0wgppKPcOspog
	zKFPGyXI9A0v+8ayi2T34WGsVXa6Gxou7nQbxcWEtdKOi09NaRg69AOROyZUCaRnI0XnP068VlD
	+v8By7gCEgNByI86qN+1khhNR0j5eVpyQkL+p75dy
X-Received: by 2002:a05:6512:68c:b0:5b2:a5e9:3aba with SMTP id
 2adb3069b0e04-5b49cf97240mr2500e87.6.1787595341656; Mon, 24 Aug 2026 11:15:41
 -0700 (PDT)
MIME-Version: 1.0
References: <20260731143541.956291-1-vdonnefort@google.com>
 <20260731143541.956291-10-vdonnefort@google.com> <CA+EHjTy7SUFsE3N5ERV_FQw-3GyEo17mqe2=RbV1wz8bVT+JXw@mail.gmail.com>
 <aoxwAukYucNw1T2p@google.com>
In-Reply-To: <aoxwAukYucNw1T2p@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 24 Aug 2026 19:15:05 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwp=80sZar7XXd1ojZKpTooDeCK-td8q2L7qgVzayFjmw@mail.gmail.com>
X-Gm-Features: AcwNN1VVUW-WOS6MtAzeV_MzbZbW3Qcn1JrVjDOrdzhSnT5drlzH82qf83dJDv4
Message-ID: <CA+EHjTwp=80sZar7XXd1ojZKpTooDeCK-td8q2L7qgVzayFjmw@mail.gmail.com>
Subject: Re: [PATCH v4 09/17] KVM: arm64: Add selftests for the pKVM heap allocator
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_111550_237503_778D2012 
X-CRM114-Status: GOOD (  14.77  )
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

On Mon, 24 Aug 2026 at 17:23, Vincent Donnefort <vdonnefort@google.com> wrote:
...
> Clearly not something that would happen but I can put the #ifdef inside
> handle___pkvm_hyp_alloc_selftest() so it looks cleaner:
>
>   static void handle___pkvm_hyp_alloc_selftest(struct kvm_cpu_context *host_ctxt)
>   {
>           struct pkvm_hyp_req req = { .type = PKVM_HYP_NO_REQ };
>           int ret = -EPERM;
>
>   #ifdef CONFIG_NVHE_EL2_DEBUG
>           ret = hyp_allocator_selftest();
>           if (ret == -ENOMEM) {
>                   req.type = PKVM_HYP_REQ_HYP_ALLOC_SELFTEST;
>                   req.mem.nr_pages = hyp_alloc_selftest_topup_needed();
>           }
>   #endif
>           cpu_reg(host_ctxt, 1) = ret;
>           pkvm_hyp_req_to_smccc(host_ctxt, &req);
>   }
>
> Regarding pkvm_call_hyp_req(), how about a proper kerneldoc?
>
>  /**
>   * pkvm_call_hyp_req() - Issue an HVC that can return hypervisor requests
>   * @f: Hypervisor function symbol to call.
>   * @...: Arguments to pass to the hypercall.
>   *
>   * Re-issue an HVC and process any pending hypervisor request until completion
>   * or error.
>   *
>   * Only use this helper for HVCs whose hypervisor handlers format their return
>   * registers with pkvm_hyp_req_to_smccc().
>   *
>   * Return: Result of the hypercall or a negative error if the hyp request
>   * handling failed.
>   */

Both look good. The merged handler writes x2 through the no-req path,
which is what I was after, and the kerneldoc states the rule.

Thanks,
/fuad

>
> --
> Vincent
>

