Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FECC982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 09:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UxBSgv2Zak5VMQD4b180vo8UnD1ECyVDt1KdwAJyxFE=; b=DxMU6SDHf1tVl6+FNKiaB9udaN
	5v0xcPKmZQ7orTcUcLjOL8P6QWqBAO7jsZkw2f7RUv/ZBmdFt897DSSSdAu1Xirl+Jt3khzIR6glY
	ZXTFSk1xtgfpl6pWoKeoJ5y4UaD2U+rq3DGuKLEmLyufNT1beDw5ViXlDDoeEc6JhUGE/UjhDyld4
	rm9P8qGILp0McCVyH5Iu3lHQKgDwI5iqSgKwLu3arT9huVZm+UqB496d7xDn5YhdT5ALMJlA3hUOo
	GPHa4U+KUcE1rc+185ePjlaoj2LszdBmO1ohXtIBvtcDJCgFqmpOuKHKg5Yuu7loFB2a7r73rEJoC
	/lFVoXQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9JeI-00000007oSE-1bMp;
	Wed, 23 Sep 2026 09:52:22 +0000
Received: from out-62.mta0.migadu.com ([2001:41d0:1004:224b::3e] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9JeE-00000007oPi-1H1f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 09:52:21 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=y0Zfn+vuryRfSe4jRJZRjxTw9KOrecVJz7A4RSM8JcE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790157136; v=1; x=1790761936;
 b=ELEPVMCoKHw2ekfzGBhyqswdsjHBtZDkb40gEerwGbC1KB52eQ1bjrR7ktbuxXgJc9Zmq/mu
 buPQsU6U8qXuPPM0C5lYRXQ3/r4AFyDr8ieF4DLfdpqwwuGRPWODJTC1qGfpInhEfhxznK6s/Mu
 hBX0Y4F46e468xU0KqAklFnM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id ff7a0d3c7850c673;
	Wed, 23 Sep 2026 09:52:15 +0000
X-Mizu-Trace-ID: ff7a0d3c7850c673
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b83c1421ecso4079e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 02:52:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxfyivMAo/vyEzFrVGWHZ1WznxmC01MNTPeEPDdGB2xMADVqebiVVV9ydo3ohAg2s4FYu0qij97Xcm2SyqHjVvR@lists.infradead.org
X-Gm-Message-State: AFuF++n+jaelPHnf/tBYYyW95YBBz1dJfYWvzXgskwSJnuTw2BlyBJhW
	WdCgRf6UnghoLLVIJ01sa3XppSe7Kx8qy2RrZWY3bXPnqJ1+Wu8lI5jqLdmG00qpYNCrcG1vH+2
	TbUtVDIrnb7KzdiHaxl2SgFXpLv0trJUn5vOMfEAb
X-Received: by 2002:a05:6512:648a:b0:5b6:4ad:d6ba with SMTP id
 2adb3069b0e04-5b8d91673a2mr92022e87.15.1790157131043; Wed, 23 Sep 2026
 02:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260914113338.159227-1-fuad.tabba@linux.dev> <20260914113338.159227-11-fuad.tabba@linux.dev>
 <arK1tHUEJsCQEKzn@google.com>
In-Reply-To: <arK1tHUEJsCQEKzn@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 23 Sep 2026 10:51:34 +0100
X-Gmail-Original-Message-ID: <CA+EHjTx+foVF4CRU5D8bQv8bAqDphMN12UrV+_doUryn2ow6bg@mail.gmail.com>
X-Gm-Features: AclHuK-NnDCO6wvOJ2rcUaq9EYT0pUNanoAkAkxTjQCgkBqgiKvCWE_D10-iu1k
Message-ID: <CA+EHjTx+foVF4CRU5D8bQv8bAqDphMN12UrV+_doUryn2ow6bg@mail.gmail.com>
Subject: Re: [PATCH v3 10/18] KVM: arm64: Handle PSCI calls for protected VMs
 at EL2
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, steven.price@arm.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_025218_550491_EB133D14 
X-CRM114-Status: GOOD (  13.79  )
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

Hi Vincent,

> > +/*
> > + * Returns true when handled at EL2, false when the host must stop scheduling
> > + * the vCPU.
> > + */
> > +static bool pvm_psci_vcpu_off(struct pkvm_hyp_vcpu *hyp_vcpu)
> > +{
> > +        /* No other writer runs while this vCPU is ON and executing. */
> > +        WARN_ON(READ_ONCE(hyp_vcpu->power_state) != PSCI_0_2_AFFINITY_LEVEL_ON);
> > +
> > +        /*
> > +         * Orders pkvm_reset_vcpu()'s clear of reset_state.reset before OFF, so
> > +         * a CPU_ON that wins on OFF republishes after it. Pairs with the
> > +         * cmpxchg in pvm_psci_vcpu_on().
> > +         */
> > +        smp_store_release(&hyp_vcpu->power_state, PSCI_0_2_AFFINITY_LEVEL_OFF);
>
> Is there an issue either with the comment or with pvm_psci_vcpu_on()? the
> cmpxchg is relaxed. I would have expected cmpxchg_acquire().

It's the comment. The ordering it describes holds with the relaxed
cmpxchg. The release of OFF orders the clear before OFF. The winner's
smp_store_release(&reset_state->reset, true) orders its cmpxchg before
that store. So the clear can't land after the republish. The comment
should name that store-release as the pair, not the cmpxchg.

You're right about the acquire though, for the plain stores to
reset_state.{pc, r0, be} after the cmpxchg. I'll make it
cmpxchg_acquire() in v4 and reword both comments.

Cheers,
/fuad

