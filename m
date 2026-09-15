Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CBCC88E7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 18:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XEGeVv3tUEHUejyqkf/f/oUW1Ji4pD1iQt2Pm5xFiOI=; b=btWkvcfk5W2MweMDSf2eSQTejF
	bzHTxZwpNw+WbuhhqqcgZAgtW3WYsf95PptsQpA971uaXr/9Q7tpMqVVyQ5CvM4wENi/8Igg2r7JR
	0dQmIANyBvheTO/L/PQ8wXDAhKEov1Oe+5zf8FV8fHC7z6yujYN4WDjB6TpHcNMWFbxUVoqCvele7
	ZNj25lpX7qtKiP4xSjQSAURbsQy+HgBex1wzt4fHhQ9D3/3l3BjxJw9ZalTKDGSY14N0XhVkypeLn
	rbyauoqciSZDVfeKxHJ1AkebDoWi4ohwfS95V9514hOoUlhboh2IweM7Ks+IkeVPWDq1ufkN/hcNl
	SA8uX/gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6XWg-00000007h63-3Tfx;
	Tue, 15 Sep 2026 18:05:02 +0000
Received: from out-27.mta0.migadu.com ([2001:41d0:1004:224b::1b] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6XWa-00000007h4T-3ifW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 18:04:59 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=9DAZE6K15U/g45s8JliXutNziNld3UlxJr1abslGfTA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789495494; v=1; x=1790100294;
 b=sUKLe+QH7SP/Ho0J8y9ZpNkGk2KSLsyAanbWVvl4Fvy9oCflXJtXZ8BmQdwVqFJvKNxCp51/
 gARcmgOMmxaBbQyWDLCosuDeCCQGK3+UhTiGWmQjhQW1uuixdqYWh+dhBtu6u009qd8DdG3qf+2
 hZNLhBqClF1xV0f3OvcdXbs4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 1821ac38eade5abe;
	Tue, 15 Sep 2026 18:04:54 +0000
X-Mizu-Trace-ID: 1821ac38eade5abe
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b4a0b384b7so999e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 11:04:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByozXCVBlZe2kiNgCzU4yzHJizdQmWFMsMYM+uMBdzXaki5YiUv+kxjU2b3YsvRd7l+5RJEP1E7ySAfQDdorLdD@lists.infradead.org
X-Gm-Message-State: AFuF++nrUmLf2M/p1SVAtd8nGZ1NQy8hywZ4oabjGuTRKAgxeD11oAJx
	kRqIc/h/Mvb+tO9GNxUhhaQpzYl/ojWZLrMCqJ+PqIAaXqSaM/KNsuO+osVCGMSGekgi2CJNdPT
	/5nNkBtnQ0JWX6+Flc66ABK2htoaAqwtV5A99BeHM
X-Received: by 2002:a05:6512:620a:b0:5b4:9dba:7403 with SMTP id
 2adb3069b0e04-5b8b5cd8e93mr4722e87.13.1789495493112; Tue, 15 Sep 2026
 11:04:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260807164322.2970811-2-sebastianene@google.com> <20260807164322.2970811-15-sebastianene@google.com>
In-Reply-To: <20260807164322.2970811-15-sebastianene@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 15 Sep 2026 19:04:16 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw=GvKLgYt3bgcGMB_sn=0E1mN3YAiEwiWKsOcNVysjHg@mail.gmail.com>
X-Gm-Features: AcwNN1VyJWDmZjD0VcMqv8P4IMQ242-aiCsST2pako59aYERzk6NxGlaeT182mY
Message-ID: <CA+EHjTw=GvKLgYt3bgcGMB_sn=0E1mN3YAiEwiWKsOcNVysjHg@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] KVM: arm64: Implement HVC interface for ITS
 emulation setup
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, mark.rutland@arm.com, 
	maz@kernel.org, oupton@kernel.org, rananta@google.com, 
	Sascha.Bischoff@arm.com, suzuki.poulose@arm.com, will@kernel.org, 
	kvmarm@lists.linux.dev, android-kvm@google.com, bgrzesik@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nathan@kernel.org, perlarsen@google.com, seiden@linux.ibm.com, 
	smostafa@google.com, tglx@kernel.org, vdonnefort@google.com, 
	vladimir.murzin@arm.com, yuzenghui@huawei.com, zenghui.yu@linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_110457_329852_39EC8003 
X-CRM114-Status: GOOD (  10.03  )
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

Hi Seb,

A couple of things on the wiring:

On Fri, Aug 07, 2026 at 04:43:23PM +0000, Sebastian Ene wrote:

[...]

> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
[...]
> +#define ITS_PAGES        (2UL)
> +
> +static int pkvm_init_its_emulation(phys_addr_t dev_addr, struct its_host_state *host)
> +{
> +        size_t priv_state_sz = ITS_PAGES << PAGE_SHIFT;
[...]
> +        priv_state = alloc_pages_exact(priv_state_sz, GFP_ATOMIC);

its_emulate_release_locks() runs this callback with its_lock and
its->lock held and IRQs off, so alloc_pages_exact() is under a raw
spinlock. On PREEMPT_RT the page allocator takes sleeping locks even
for GFP_ATOMIC, so this can't allocate under the raw spinlock. Could
priv_state be allocated before the locks are taken and passed in?
(Sashiko)

> +        ret = kvm_call_hyp_nvhe(__pkvm_its_emulate_setup, dev_addr, host, priv_state, ITS_PAGES);

ITS_PAGES is a fixed 2, and num_tracked_entries in
pkvm_its_emulate_setup derives from it, so the emulation can track
about 500 ITT pages total (dte_entry is 16 bytes). Each MAPD pins its
ITT pages into that table, so a system with enough MSI devices runs
track_pfn_add out of slots, gets -ENOSPC, and the queue stalls. Could
the private-state size scale with the ITS's table sizes rather than a
fixed 2 pages?

Cheers,
/fuad

