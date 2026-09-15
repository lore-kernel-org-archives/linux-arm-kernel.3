Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A7EC982C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMazLjqrI0F9zk3gM1/UrFA5kf1v2PJtkgiawlJpMIs=; b=ibMI458/Uti8kpvTp8HEEHJFRD
	G4J894eq5THZ14b+KUjhP0dg3NLXPii5p4/nm10qEEkZw3hgQfuOlVkXcxjVNbStjPmZ5lcUsj3O9
	OpInrTy/VXmK/vMSrfzZ+VmclhCZ/p+zxthEfGOetajOAqAoqhX6pgZXvCGwhUAZQL9xd5/JraLeZ
	42E+Nj1fVORfTSlIaBbnO7gL0cpq9OOwL9rS/T+EGYvHwOtd2AxbqhZrpjXsvzqYeLqsXoQFNncuN
	sZWcFCpBuhF/ZSpqcy2CRJCkiiGXm20EhRezw2JUCXhbomvP2Ghx0SUDjN/yWI5JjZcsROZBewjvI
	QhEk1+qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6V56-000000079yZ-2FLN;
	Tue, 15 Sep 2026 15:28:24 +0000
Received: from out-200.mta0.migadu.com ([2001:41d0:1004:224b::c8] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6V53-000000079xR-0GD1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:28:22 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=seZKkNZqkA1n+JFBn6WE809ZUioCrb4l3ZQsXTwS4L0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789486098; v=1; x=1790090898;
 b=rEM74X4PKE3OdLQCyJR+oonORqufefgqTxQP2K/Hi0cyH0G5gKVyRXfCwgjgsve6TUh9bMih
 +6zxS/JDYiX9Ol9/E7O0Ioz7q6NLq3yt5qfn8kt9zyD+KjPWD0Zxljg2mxnmeYPoq73p9gdZIBk
 TDyaQQ2IIKLViOFYuASfBVVA=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a0990defea0979ea;
	Tue, 15 Sep 2026 15:28:08 +0000
X-Mizu-Trace-ID: a0990defea0979ea
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b4a0b384c4so1283e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 08:28:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBznlsZmKh1tP0oNf2UzEdIxVo4IZUMMPCgo1R/EeG9spYOs1gw3FW4LVU3cnFxRFpXSJXbu0whvsMgyiWyj2Qej@lists.infradead.org
X-Gm-Message-State: AFuF++m/YBGeFXovOv0BrsztWEouxqwmryyiNhMSEradA4H32TJZadYQ
	NTAhu2MKthLKj2w/NnmAp79bgBABvKgyRt5GcAlfPoAvcchqR+ORGsiuYUUMITBLU8YYU4ruMaT
	Iaq0fBxK4cOpH1tH2cmCXmC7zvRjL/vvgMQR31Diw
X-Received: by 2002:a05:6512:2341:b0:5b4:9dba:7403 with SMTP id
 2adb3069b0e04-5b8b3201e59mr131289e87.13.1789486087447; Tue, 15 Sep 2026
 08:28:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260807164322.2970811-2-sebastianene@google.com> <20260807164322.2970811-10-sebastianene@google.com>
In-Reply-To: <20260807164322.2970811-10-sebastianene@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 15 Sep 2026 16:27:31 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzeCib1J2fyKM42GW5rgKQEE9_Dox_tGA5YJux0YoY5rg@mail.gmail.com>
X-Gm-Features: AcwNN1WkkAN_-WeQ6aFBf7fnAFZAi-s925Hdj_6AYFNinV0IdRsiozOwPKsbvOA
Message-ID: <CA+EHjTzeCib1J2fyKM42GW5rgKQEE9_Dox_tGA5YJux0YoY5rg@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] KVM: arm64: Trap & emulate the ITS MAPD command
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
X-CRM114-CacheID: sfid-20260915_082821_251831_50F88AD6 
X-CRM114-Status: GOOD (  17.34  )
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

Hi Sebastian,

The MAPD emulation is the right idea, but there's a fair bit to fix.
The main ones:

On Fri, Aug 07, 2026 at 04:43:18PM +0000, Sebastian Ene wrote:

[...]

> +static int get_num_itt_pages(struct its_priv_state *its, u8 num_bits)
> +{
[...]
> +        return PAGE_ALIGN(sz) >> PAGE_SHIFT;
> +}

This needs the ITT's intra-page offset. itt_addr is only 256-byte
aligned (GENMASK(51, 8)), so PAGE_ALIGN(sz) undercounts by a page when
the ITT starts mid-page, and track_pfn() then leaves the tail page
unpinned for the host to repurpose before a MAPTI.
PAGE_ALIGN((itt_addr & ~PAGE_MASK) + sz) >> PAGE_SHIFT. (Sashiko)

> +        new_entry = snapshot_table[new_entry_index];
> +        prev_entry = original_table[new_entry_index];
> +        if (!((new_entry ^ prev_entry) & GITS_BASER_VALID))
> +                return 0;
> +
> +        if (rollback)
> +                new_entry = new_entry ^ GITS_BASER_VALID;
[...]
> +        original_table[new_entry_index] = new_entry;

The rollback here never runs. The forward pass ends with
original_table[idx] = new_entry, so on rollback the guard above sees
snapshot and original with the same valid bit and returns before the
flip. A failed MAPD then never gives the L2 back, and original stays
mapped. (Sashiko)

> +        if (new_entry & GITS_BASER_VALID)
> +                ret = __pkvm_host_donate_hyp(hyp_phys_to_pfn(new_entry & PHYS_MASK), table->psz >> PAGE_SHIFT);

Could the L2 address be checked psz-aligned first?
hyp_phys_to_pfn(new_entry & PHYS_MASK) rounds down to a page, but the
ITS uses the full address copied into original, so an unaligned entry
runs the ITS into the next, undonated page. (Sashiko)

> +                        } else {
> +                                return hyp_pin_shared_mem(virt, virt + PAGE_SIZE);
> +                        }

A duplicate MAPD for the same device and pfn pins again here, so the
refcount climbs with no new slot and track_pfn_remove()'s single unpin
can't free the page. (Sashiko)

> +                        if (ret == -EBUSY)
> +                                return 0;
[...]
> +        return -EINVAL;

Two things in track_pfn_remove(). The -EBUSY return skips the memset
that frees the dte_entry slot, so the slot leaks. And the trailing
-EINVAL, for a V=0 unmap of an ITT that isn't tracked, propagates up
and stalls the queue, where a legal unmap shouldn't. (Sashiko)

> +        ret = check_table_update(its, device_id, GITS_BASER_TYPE_DEVICE, rollback);
> +        if (ret)
> +                return ret;
> +
> +        return track_pfn(its, device_id, itt_pfn, num_pages, remove);

If track_pfn() fails after check_table_update() donated the L2,
nothing undoes the donation: process_cmd()'s forward-failure path in
cwriter_write() just returns, with no rollback. (Sashiko)

The snapshot-L1 TOCTOU during rollback (another host CPU can rewrite
it while this one holds its_lock in EL2) and the old-ITT leak on a
re-MAPD are real too. (Sashiko)

Cheers,
/fuad

